Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 337553ED5C7;
	Sun, 20 Sep 2026 09:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789896047; cv=none; b=JYXfCBHb32h1XXnY+VeCTZGntD5twmsABWH9THwm4sYLcNgtpYkjxkefzyro1VKUj5CddmpGZmNAmzAOIFJ2YRyCz6shuItGSKlee6tECbKTRDR/1eRWV88og5I6F8tP1WI2sOdA9WpuYpfu0TEbMLY7lidtppjTvK62pHYdJHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789896047; c=relaxed/simple;
	bh=8sJ0aasFFtzfzQEvhMHO5G4SphRq0PAvm6rvO5lTJqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nL7ugeCw3fGFvhhNEp47qT7IeWE8bilsGkEb1nFD/WxMfiDMjfc/72cLG+lka4ZTtSHtn811H84CO72E7lqVkxgZRkIMcBgicoaoI3NBEEYlCLv6VZs3dvhkZYNuI1i7igvP9oOBP6moJSSB3/0jas9i0lGdaTXAWBzuVNdCPH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=VZlvkKLW; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VZlvkKLW"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CAAC1CE0;
	Sun, 20 Sep 2026 02:20:36 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6778E3F59E;
	Sun, 20 Sep 2026 02:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789896040; bh=8sJ0aasFFtzfzQEvhMHO5G4SphRq0PAvm6rvO5lTJqg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VZlvkKLW0XBjspMJfHEeilmuUtoef7/P0gOrsDMm2b+NKX7Q+WCczJXehUSi5m6/D
	 dlw6w6W5f5R4/lx9XFaQX3JKChviablgorCJirasWMrgEkIVMVLHJyK46C8LKkQ6Us
	 Od60ZOHhU6v6fpj/qa+8dNv22U/sIg+MOnnO91/E=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	d-gole@ti.com,
	jic23@kernel.org,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	david@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v12 07/25] firmware: arm_scmi: Add support to parse SHMTIs areas
Date: Sun, 20 Sep 2026 10:19:10 +0100
Message-ID: <20260920091928.2014972-8-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260920091928.2014972-1-cristian.marussi@arm.com>
References: <20260920091928.2014972-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add logic to scan the SHMTI areas, parsing the TDCF descriptors while
collecting DataEvent, BlockTimestamp and UUID lines.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v11 --> v12
 - reject zero as MATCHSEQ
 - reworked locking around line_get/put
 - reworked locking around blkts_read
 - a few comments on locking acquisition order
 - cleanup active line refs even when bailing out of a scan in error
 - added hashed locks for fine grain locking around blkts/uuid line creation
 - added RCU protection on UUIDs access
v10 --> v11
 - relocated some line handlers from another patch
 - reworked TDE and lines locking logic
 - fix UUID/BLKTS line refcounting to properly drop unused lines
 - add a mutex to protect des cache accesses
v7 --> v9
 - avoid referencing a NULL in trace_scmi_tlm_access O_o
 - refactor scmi_telemetry_line_put to free its container on release
 - convert SHMTI_OVERFLOW macro to an inline function
v7 --> v8
 - Fixes for some Sashiko issues on v7
  - reword a few dev_errs
  - removed a few unused function (moved to next patch)
  - add more safeguards and checks to SHMTI_OVERFLOWS
  - fix UUIDs copy and allocation
  - fix UUID reference store and cleanup
  - cleanup all UNBOUND lines and their containers in resources_free
  - remove mutex on primary init
v6 --> v7
 - add _RAW helpers to manage non MMIO accesses
 - sparse fixes
 - use uuid_t for UUID lines
 - fix proper UUID line parsing and binding
 - adding a few traces for TDCF line handling
 - add new dynamically sized UUID DB to ease discovered UUIDs lookup
 - fix endianity handling in UUID TDCF lines
 - handle Primary UUID lines with regular uuid_line
v5 --> v6
 - consider UUID line in TDCF as BE when scanning
 - use const booleans in scmi_telemetry_de_state_update()
 - fix Sashiko review https://sashiko.dev/#/patchset/20260703123601.381275-1-cristian.marussi%40arm.com?part=8
  - check SHMTI overflow while parsing
  - use proper bytes increment while parsing line_by_type
  - use mutex guard when link BLK_TS lines
v4 --> v5
 - converted TDE_HAS_TSTAMP to inline scmi_tde_has_tstamp
 - fixes sparse warnings
v3 --> v4
 - use kzalloc_obj
 - track SHMTI-discovered Telemetry DE states
 - refactor TDE cache with dedicated helpers
 - force tstamp to zero when timestamp is NOT supported or disabled
v2 --> v3
 - split from monolithic Telemetry patch
 - avoid devres allocation for resources that are added to the xa_lines XArray
 - simplify prototype of line parsing helpers to drop unneeded dev
 - flip tstmap logic in scmi_telemetry_line_data_parse() to properly emit
   a TLM ftrace event
 - use ternary ops to simplify quite a few expressions
---
 drivers/firmware/arm_scmi/telemetry.c | 934 +++++++++++++++++++++++++-
 include/linux/scmi_protocol.h         |   2 +-
 2 files changed, 932 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index d8176a7d78b8..c5d17a4d9bb3 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -12,10 +12,13 @@
 #include <linux/completion.h>
 #include <linux/err.h>
 #include <linux/delay.h>
+#include <linux/hash.h>
 #include <linux/io.h>
 #include <linux/limits.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/rcupdate.h>
 #include <linux/refcount.h>
 #include <linux/slab.h>
 #include <linux/sprintf.h>
@@ -257,6 +260,41 @@ struct uuid_line {
 	__be32 dwords[SCMI_TLM_DE_IMPL_NUM_DWORDS];
 };
 
+#define LINE_DATA_GET_RAW(f)				\
+({							\
+	typeof(f) _f = (f);				\
+	u32 _high = le32_to_cpu(_f->data_high);		\
+	u32 _low = le32_to_cpu(_f->data_low);		\
+							\
+	(TO_CPU_64(_high, _low));			\
+})
+
+#define LINE_DATA_GET(f)					\
+({								\
+	typeof(f) _f = (f);					\
+								\
+	(TO_CPU_64(_I(&_f->data_high), _I(&_f->data_low)));	\
+})
+
+#define LINE_TSTAMP_GET_RAW(f)				\
+({							\
+	typeof(f) _f = (f);				\
+	u32 _high = le32_to_cpu(_f->ts_high);		\
+	u32 _low = le32_to_cpu(_f->ts_low);		\
+							\
+	(TO_CPU_64(_high, _low));			\
+})
+
+#define LINE_TSTAMP_GET(f)					\
+({								\
+	typeof(f) _f = (f);					\
+								\
+	(TO_CPU_64(_I(&_f->ts_high), _I(&_f->ts_low)));		\
+})
+
+#define BLK_TS_STAMP(f)		LINE_TSTAMP_GET(f)
+#define BLK_TS_RATE(p)		PAYLD_ID(p)
+
 enum tdcf_line_types {
 	TDCF_DATA_LINE = 0,
 	TDCF_BLK_TS_LINE = 1,
@@ -320,6 +358,7 @@ struct payload {
 #define LINE_LENGTH_WORDS(x)		LINE_LENGTH_WORDS_RAW(PAYLD_META(x))
 
 #define LINE_LENGTH_QWORDS(x)		((LINE_LENGTH_WORDS(x)) / 2)
+#define LINE_LENGTH_BYTES(x)		((LINE_LENGTH_WORDS(x)) * sizeof(u32))
 
 struct prlg {
 	u32 sign_start;
@@ -349,7 +388,9 @@ struct tdcf {
 
 #define TDCF_START_SIGNATURE(x)	(_I(&((x)->prlg.sign_start)))
 #define TDCF_START_SEQ_GET(x)	(_I(&((x)->prlg.match_start)))
-#define IS_BAD_START_SEQ(s)	((s) & 0x1)
+/* TDCF MatchSequence cannot be zero by the SCMI v4.0 Specification */
+#define TDCF_INVALID_MATCH_SEQ	0
+#define IS_BAD_START_SEQ(s)	((s) & 0x1 || (s) == TDCF_INVALID_MATCH_SEQ)
 
 #define TDCF_END_SEQ_GET(e)	(_I(&((e)->match_end)))
 #define TDCF_END_SIGNATURE(e)	(_I(&((e)->sign_end)))
@@ -396,7 +437,8 @@ struct telemetry_uuid {
 	struct telemetry_line line;
 };
 
-#define to_uuid(l)	container_of(l, struct telemetry_uuid, line)
+#define to_uuid_from_line(l)	container_of(l, struct telemetry_uuid, line)
+#define to_uuid_from_uuid_t(u)	container_of(u, struct telemetry_uuid, uuid)
 
 enum timestamps {
 	TSTAMP_NONE = 0,
@@ -428,18 +470,40 @@ struct telemetry_de {
 
 #define to_tde(d)	container_of(d, struct telemetry_de, de)
 
+static inline bool scmi_tde_has_tstamp(struct telemetry_de *t)
+{
+	return t->de.tstamp_support && t->de.tstamp_enabled;
+}
+
 #define DE_ENABLED_WITH_TSTAMP	2
 
+enum de_state {
+	ENA_STATE,
+	ENA_TSTAMP,
+	ENA_MAX
+};
+
 struct telemetry_info {
 	bool streaming_mode;
 	unsigned int num_shmti;
 	unsigned int num_des_tstamp;
+#define SCMI_UUID_DB_THRESH	3
+	/* Protect uuids_len */
+	struct mutex uuids_mtx;
+	unsigned int uuids_len;
+	/* Mutex to protect des_enabled_mtx */
+	struct mutex des_enabled_mtx;
+	atomic_t des_enabled[ENA_MAX];
 	unsigned int default_blk_ts_rate;
 	const struct scmi_protocol_handle *ph;
 	struct telemetry_shmti *shmti;
 	struct telemetry_de *tdes;
 	struct scmi_telemetry_group *grps;
 	struct xarray xa_des;
+	/* Mutex to protect @xa_lines */
+	struct mutex lines_mtx;
+	struct xarray xa_lines;
+	struct telemetry_uuid *primary_uuid;
 	/* Mutex to protect access to @free_des */
 	struct mutex free_mtx;
 	struct list_head free_des;
@@ -447,6 +511,8 @@ struct telemetry_info {
 	struct scmi_telemetry_info info;
 	atomic_t rinfo_initializing;
 	struct completion rinfo_initdone;
+	#define PAYLD_HASH_BITS  4
+	struct mutex payld_locks[1 << PAYLD_HASH_BITS];
 	struct scmi_telemetry_res_info *rinfo;
 	struct scmi_telemetry_res_info *(*res_get)(struct telemetry_info *ti);
 };
@@ -454,6 +520,34 @@ struct telemetry_info {
 static struct scmi_telemetry_res_info *
 __scmi_telemetry_resources_get(struct telemetry_info *ti);
 
+static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
+				     unsigned int shmti_id, enum scan_mode mode);
+
+static inline void scmi_telemetry_uuid_link(struct telemetry_de *tde,
+					    struct telemetry_uuid *uuid);
+
+static inline
+struct mutex *lock_for_payld(struct mutex *locks, struct payload __iomem *payld)
+{
+	return &locks[hash_long((__force unsigned long)payld, PAYLD_HASH_BITS)];
+}
+
+static inline void
+scmi_telemetry_de_state_update(struct telemetry_info *ti, enum de_state state,
+			       bool *current_state, const bool next_state)
+{
+	guard(mutex)(&ti->des_enabled_mtx);
+	if (!current_state || *current_state != next_state)
+		atomic_add(next_state ? 1 : -1, &ti->des_enabled[state]);
+
+	if (current_state)
+		*current_state = next_state;
+
+	dev_dbg(ti->ph->dev, "Telemetry des_enabled[%s]:%u\n",
+		state == ENA_STATE ? "STATE" : "TSTAMP",
+		atomic_read(&ti->des_enabled[state]));
+}
+
 static struct telemetry_de *
 scmi_telemetry_free_tde_get(struct telemetry_info *ti)
 {
@@ -546,6 +640,27 @@ static int scmi_telemetry_tde_register(struct telemetry_info *ti,
 	return ret;
 }
 
+static bool
+scmi_telemetry_tde_cache_unchanged(struct telemetry_de *tde, u32 magic)
+{
+	guard(mutex)(&tde->mtx);
+
+	return tde->last_magic == magic;
+}
+
+static void
+scmi_telemetry_tde_cache_update(struct telemetry_de *tde, u64 val,
+				u64 *tstamp, u32 *magic)
+{
+	guard(mutex)(&tde->mtx);
+
+	tde->last_magic = magic ? *magic : TDCF_BAD_END_SEQ;
+	tde->last_val = val;
+	tde->last_ts = tstamp && scmi_tde_has_tstamp(tde) ? *tstamp : 0;
+	if (tstamp)
+		*tstamp = tde->last_ts;
+}
+
 struct scmi_tlm_de_priv {
 	struct telemetry_info *ti;
 	void *next;
@@ -773,8 +888,10 @@ static int iter_de_descr_process_response(const struct scmi_protocol_handle *ph,
 	}
 
 	/* Add to FastChannels list */
-	if (tde->de.fc_support)
+	if (tde->de.fc_support) {
+		scmi_telemetry_uuid_link(tde, ti->primary_uuid);
 		list_add(&tde->item, &ti->fcs_des);
+	}
 
 	/* Account for this DE in group num_de counter */
 	if (tde->de.grp)
@@ -1250,6 +1367,734 @@ scmi_telemetry_resources_get(const struct scmi_protocol_handle *ph)
 	return res_get(ti);
 }
 
+static u64
+scmi_telemetry_blkts_read(u32 magic, struct telemetry_de *tde)
+{
+	struct telemetry_block_ts *bts;
+
+	/* Acquiring order is: tde -> line */
+	guard(mutex)(&tde->mtx);
+	if (WARN_ON(!tde->bts))
+		return 0;
+
+	bts = tde->bts;
+	guard(mutex)(&bts->line.mtx);
+
+	if (bts->line.last_magic == magic)
+		return bts->last_ts;
+
+	/* Note that the bts->last_rate can change ONLY on creation */
+	bts->last_ts = BLK_TS_STAMP(&bts->line.payld->blk_tsl);
+	bts->line.last_magic = magic;
+
+	return bts->last_ts;
+}
+
+static void scmi_telemetry_blkts_update(struct telemetry_info *ti, u32 magic,
+					struct telemetry_block_ts *bts)
+{
+	guard(mutex)(&bts->line.mtx);
+
+	if (bts->line.last_magic != magic) {
+		bts->last_ts = BLK_TS_STAMP(&bts->line.payld->blk_tsl);
+		bts->last_rate = BLK_TS_RATE(bts->line.payld);
+		/* BLK_TS clock rate value can change ONLY here on creation */
+		if (!bts->last_rate)
+			bts->last_rate = ti->default_blk_ts_rate;
+		bts->line.last_magic = magic;
+	}
+}
+
+static inline void *scmi_telemetry_line_blob_get(struct telemetry_line *line)
+{
+	void *blob;
+
+	switch (line->type) {
+	case TDCF_BLK_TS_LINE:
+		blob = to_blkts(line);
+		break;
+	case TDCF_UUID_LINE:
+		blob = to_uuid_from_line(line);
+		break;
+	default:
+		blob = NULL;
+		break;
+	}
+
+	return blob;
+}
+
+static void scmi_telemetry_line_put(struct telemetry_line *line)
+{
+	/* Acquiring coarse grain first ... */
+	mutex_lock(&line->ti->lines_mtx);
+	mutex_lock(&line->mtx);
+	if (refcount_dec_and_test(&line->users)) {
+		xa_erase(&line->ti->xa_lines, (unsigned long)line->payld);
+
+		/* Unlock and free the containing structure: blkts or uuid */
+		mutex_unlock(&line->mtx);
+		mutex_unlock(&line->ti->lines_mtx);
+
+		trace_scmi_tlm_access(0, "DROP_LINE", line->type, line->last_magic);
+		kfree(scmi_telemetry_line_blob_get(line));
+
+		return;
+	}
+	mutex_unlock(&line->mtx);
+	mutex_unlock(&line->ti->lines_mtx);
+}
+
+static void scmi_telemetry_blkts_unlink(struct telemetry_de *tde)
+{
+	/* Acquiring order is: tde -> line */
+	guard(mutex)(&tde->mtx);
+	if (!tde->bts)
+		return;
+
+	scmi_telemetry_line_put(&tde->bts->line);
+	tde->bts = NULL;
+
+	trace_scmi_tlm_access(tde->de.info->id, "BLKTS_UNLINK", 0, 0);
+}
+
+static void scmi_telemetry_uuid_unlink(struct telemetry_de *tde)
+{
+	/* Acquiring order is: tde -> line */
+	guard(mutex)(&tde->mtx);
+	if (!tde->uuid)
+		return;
+
+	scmi_telemetry_line_put(&tde->uuid->line);
+	tde->uuid = NULL;
+
+	trace_scmi_tlm_access(tde->de.info->id, "UUID_UNLINK", 0, 0);
+}
+
+static void scmi_telemetry_de_unlink(struct scmi_telemetry_de *de)
+{
+	struct telemetry_de *tde = to_tde(de);
+
+	/* Unlink all related lines triggering their deallocation */
+	scmi_telemetry_blkts_unlink(tde);
+	scmi_telemetry_uuid_unlink(tde);
+}
+
+static struct telemetry_line *
+scmi_telemetry_line_get(struct telemetry_info *ti, struct payload __iomem *payld)
+{
+	struct telemetry_line *line;
+
+	/* Acquiring coarse grain first ... */
+	guard(mutex)(&ti->lines_mtx);
+	line = xa_load(&ti->xa_lines, (unsigned long)payld);
+	if (!line)
+		return NULL;
+
+	guard(mutex)(&line->mtx);
+	refcount_inc(&line->users);
+
+	return line;
+}
+
+static int
+scmi_telemetry_line_init(struct telemetry_info *ti, struct telemetry_line *line,
+			 struct payload __iomem *payld, enum tdcf_line_types type)
+{
+	line->type = type;
+	refcount_set(&line->users, 1);
+	line->payld = payld;
+	line->ti = ti;
+	mutex_init(&line->mtx);
+
+	guard(mutex)(&ti->lines_mtx);
+	return xa_insert(&ti->xa_lines, (unsigned long)payld, line, GFP_KERNEL);
+}
+
+static struct telemetry_block_ts *
+scmi_telemetry_blkts_create(struct telemetry_info *ti,
+			    struct payload __iomem *payld)
+{
+	struct telemetry_block_ts *bts;
+	int ret;
+
+	bts = kzalloc_obj(*bts);
+	if (!bts)
+		return NULL;
+
+	ret = scmi_telemetry_line_init(ti, &bts->line, payld, TDCF_BLK_TS_LINE);
+	if (ret) {
+		kfree(bts);
+		return NULL;
+	}
+
+	trace_scmi_tlm_collect(0, (__force u64)payld, 0, "SHMTI_NEW_BLKTS");
+
+	return bts;
+}
+
+static struct telemetry_block_ts *
+scmi_telemetry_blkts_get_or_create(struct telemetry_info *ti,
+				   struct payload __iomem *payld)
+{
+	struct telemetry_line *line;
+
+	/* Avoid races on line creation for this payld */
+	guard(mutex)(lock_for_payld(ti->payld_locks, payld));
+	line = scmi_telemetry_line_get(ti, payld);
+	if (line)
+		return to_blkts(line);
+
+	return scmi_telemetry_blkts_create(ti, payld);
+}
+
+static int scmi_telemetry_uuids_update(struct telemetry_info *ti,
+				       struct telemetry_uuid *uuid)
+{
+	uuid_t **cur_uuids;
+
+	guard(mutex)(&ti->uuids_mtx);
+
+	/* Resize array if needed ... */
+	if (ti->info.num_uuids + SCMI_UUID_DB_THRESH >= ti->uuids_len) {
+		uuid_t **new_uuids, **old_uuids;
+		unsigned int new_len = ti->uuids_len * 2;
+
+		new_uuids = kcalloc(new_len, sizeof(*new_uuids), GFP_KERNEL);
+		if (!new_uuids)
+			return -ENOMEM;
+
+		old_uuids = rcu_dereference_protected(ti->info.uuids,
+				lockdep_is_held(&ti->uuids_mtx));
+		/* Copy/move old allocated UUIDs */
+		for (int i = 0; i < ti->info.num_uuids; i++)
+			new_uuids[i] = old_uuids[i];
+
+		/* Expose new UUID pointer */
+		rcu_assign_pointer(ti->info.uuids, new_uuids);
+		ti->uuids_len = new_len;
+
+		kfree_rcu_mightsleep(old_uuids);
+	}
+
+	/* Bump refcount on this line ... cannot fail by construction */
+	scmi_telemetry_line_get(ti, uuid->line.payld);
+	/* Store new UUID reference into the globally accessible UUIDS */
+	cur_uuids = rcu_dereference_protected(ti->info.uuids,
+			lockdep_is_held(&ti->uuids_mtx));
+	cur_uuids[ti->info.num_uuids] = &uuid->uuid;
+	rcu_assign_pointer(ti->info.uuids, cur_uuids);
+	/* Update UUIDs count */
+	smp_store_release(&ti->info.num_uuids, ti->info.num_uuids + 1);
+
+	return 0;
+}
+
+static struct telemetry_uuid *
+scmi_telemetry_uuid_create(struct telemetry_info *ti,
+			   struct payload __iomem *payld)
+{
+	__be32 dwords[SCMI_TLM_DE_IMPL_NUM_DWORDS];
+	struct uuid_line __iomem *uuid_l;
+	struct telemetry_uuid *uuid;
+
+	uuid = kzalloc_obj(*uuid);
+	if (!uuid)
+		return NULL;
+
+	/* A NULL payload is used for the unique primary UUID */
+	if (!payld)
+		return uuid;
+
+	uuid_l = &payld->uuid_l;
+	/*
+	 * Use proper mem accessors BUT no swapping, maintain UUID
+	 * in memory BE layout.
+	 */
+	for (int i = 0; i < SCMI_TLM_DE_IMPL_NUM_DWORDS; i++)
+		dwords[i] = (__force __be32)__raw_readl(&uuid_l->dwords[i]);
+
+	/*
+	 * Fetch BigEndian in-memory UUID fields as per SCMIv4.0
+	 * specification 3.12.2.2
+	 */
+	import_uuid(&uuid->uuid, (__force const __u8 *)&dwords[0]);
+
+	return uuid;
+}
+
+static struct telemetry_uuid *
+scmi_telemetry_uuid_register(struct telemetry_info *ti,
+			     struct payload __iomem *payld,
+			     struct telemetry_uuid *uuid)
+{
+	if (scmi_telemetry_line_init(ti, &uuid->line, payld, TDCF_UUID_LINE)) {
+		kfree(uuid);
+		return NULL;
+	}
+
+	if (scmi_telemetry_uuids_update(ti, uuid)) {
+		scmi_telemetry_line_put(&uuid->line);
+		return NULL;
+	}
+
+	trace_scmi_tlm_collect(0, (__force u64)payld, 0, "SHMTI_NEW_UUID");
+
+	return uuid;
+}
+
+static struct telemetry_uuid *
+scmi_telemetry_uuid_get_or_create(struct telemetry_info *ti,
+				  struct payload __iomem *payld)
+{
+	struct telemetry_line *line;
+	struct telemetry_uuid *uuid;
+
+	guard(mutex)(lock_for_payld(ti->payld_locks, payld));
+	line = scmi_telemetry_line_get(ti, payld);
+	if (line)
+		return to_uuid_from_line(line);
+
+	uuid = scmi_telemetry_uuid_create(ti, payld);
+	if (!uuid)
+		return uuid;
+
+	return scmi_telemetry_uuid_register(ti, payld, uuid);
+}
+
+static void scmi_telemetry_tdcf_uuid_parse(struct telemetry_info *ti,
+					   struct payload __iomem *payld,
+					   struct telemetry_shmti *shmti,
+					   struct telemetry_uuid **active_uuid)
+{
+	struct telemetry_uuid *uuid, *last = *active_uuid;
+
+	if (UUID_INVALID(payld)) {
+		trace_scmi_tlm_access(0, "UUID_INVALID", 0, 0);
+		return;
+	}
+
+	/* A UUID descriptor MUST be returned: it is found or it is created */
+	uuid = scmi_telemetry_uuid_get_or_create(ti, payld);
+	if (WARN_ON(!uuid))
+		return;
+
+	if (last)
+		scmi_telemetry_line_put(&last->line);
+
+	*active_uuid = uuid;
+}
+
+/**
+ * scmi_telemetry_tdcf_blkts_parse  - A BLK_TS line parser
+ *
+ * @ti: A reference to the telemetry_info descriptor
+ * @payld: TDCF payld line to process
+ * @shmti: SHMTI descriptor inside which the scan is happening
+ * @active_bts: Input/output reference to keep track of the last blk_ts found
+ *
+ * Process a valid TDCF BLK_TS line and, after having looked up or created a
+ * blk_ts descriptor, update the related data and return it as the currently
+ * active blk_ts, given that it is effectively the last found during this
+ * scan.
+ */
+static void scmi_telemetry_tdcf_blkts_parse(struct telemetry_info *ti,
+					    struct payload __iomem *payld,
+					    struct telemetry_shmti *shmti,
+					    struct telemetry_block_ts **active_bts)
+{
+	struct telemetry_block_ts *bts, *last = *active_bts;
+
+	/* Check for spec compliance */
+	if (BLK_TS_INVALID(payld)) {
+		trace_scmi_tlm_access(0, "BLK_TS_INVALID", 0, 0);
+		return;
+	}
+
+	/* A BLK_TS descriptor MUST be returned: it is found or it is created */
+	bts = scmi_telemetry_blkts_get_or_create(ti, payld);
+	if (WARN_ON(!bts))
+		return;
+
+	/* Update the descriptor with the lastest TS */
+	scmi_telemetry_blkts_update(ti, shmti->last_magic, bts);
+
+	if (last)
+		scmi_telemetry_line_put(&last->line);
+
+	*active_bts = bts;
+}
+
+static inline struct telemetry_de *
+scmi_telemetry_tde_allocate(struct telemetry_info *ti, u32 de_id,
+			    struct payload __iomem *payld)
+{
+	struct telemetry_de *tde;
+
+	tde = scmi_telemetry_tde_get(ti, de_id);
+	if (IS_ERR(tde))
+		return NULL;
+
+	tde->de.info->id = de_id;
+	tde->de.enabled = true;
+	tde->de.tstamp_enabled = LINE_TS_VALID(payld) || USE_BLK_TS(payld);
+
+	if (scmi_telemetry_tde_register(ti, tde)) {
+		scmi_telemetry_free_tde_put(ti, tde);
+		return NULL;
+	}
+
+	scmi_telemetry_de_state_update(ti, ENA_STATE, NULL, true);
+	if (tde->de.tstamp_enabled)
+		scmi_telemetry_de_state_update(ti, ENA_TSTAMP, NULL, true);
+
+	return tde;
+}
+
+static inline void
+scmi_telemetry_line_data_parse(struct telemetry_de *tde, u64 *val, u64 *tstamp,
+			       struct payload __iomem *payld, u32 magic)
+{
+	/* Data is always valid since we are NOT handling BLK TS lines here */
+	*val = LINE_DATA_GET(&payld->l);
+	if (tstamp) {
+		if (USE_BLK_TS(payld)) {
+			/* Read out the actual BLK_TS */
+			*tstamp = scmi_telemetry_blkts_read(magic, tde);
+		} else if (LINE_TS_VALID(payld)) {
+			/*
+			 * Note that LINE_TS_VALID implies HAS_LINE_EXT and that
+			 * the per DE line_ts_rate is advertised in the DE
+			 * descriptor.
+			 */
+			*tstamp = LINE_TSTAMP_GET(&payld->tsl);
+		} else {
+			*tstamp = 0;
+		}
+	}
+
+	trace_scmi_tlm_collect(tstamp ? *tstamp : 0, tde->de.info->id,
+			       *val, "SHMTI_DE_READ");
+
+	scmi_telemetry_tde_cache_update(tde, *val, tstamp, &magic);
+}
+
+static inline void scmi_telemetry_blkts_link(struct telemetry_de *tde,
+					     struct telemetry_block_ts *bts)
+{
+	/* Acquiring order is: tde -> line */
+	guard(mutex)(&tde->mtx);
+	if (tde->bts)
+		return;
+
+	guard(mutex)(&bts->line.mtx);
+	refcount_inc(&bts->line.users);
+
+	/* Update TS clock rate if provided by the BLK_TS */
+	if (bts->last_rate)
+		tde->de.info->ts_rate = bts->last_rate;
+
+	tde->bts = bts;
+	trace_scmi_tlm_access(tde->de.info->id, "BLKTS_LINK", 0, 0);
+}
+
+static inline void scmi_telemetry_uuid_link(struct telemetry_de *tde,
+					    struct telemetry_uuid *uuid)
+{
+	/* Acquiring order is: tde -> line */
+	guard(mutex)(&tde->mtx);
+	if (tde->uuid)
+		return;
+
+	guard(mutex)(&uuid->line.mtx);
+	refcount_inc(&uuid->line.users);
+
+	/* Update UUID association */
+	tde->uuid = uuid;
+	trace_scmi_tlm_access(tde->de.info->id, "UUID_LINK", 0, 0);
+}
+
+/**
+ * scmi_telemetry_tdcf_data_parse  - TDCF DataLine parsing
+ * @ti: A reference to the telemetry info descriptor
+ * @payld: Line payload to parse
+ * @shmti: A reference to the containing SHMTI area
+ * @mode: A flag to determine the behaviour of the scan
+ * @active_bts: A pointer to keep track and report any found BLK timestamp line
+ * @active_uuid: A pointer to keep track and report any found UUID line
+ *
+ * This routine takes care to:
+ *  - verify line consistency in relation to the used flags and the current
+ *    context: e.g. is there an active preceding BLK_TS line if the DataLine
+ *    sports a USE_BLKTS flag ?
+ *  - verify the related Data Event ID exists OR create a brand new DE
+ *    (depending on the @mode of operation)
+ *  - links any active BLK_TS or UUID line to the current DE
+ *  - read and save value/tstamp for the DE ONLY if anything has changed (by
+ *    tracking the last TDCF magic) and update related magic: this allows to
+ *    minimize future needs of single-DE reads
+ *
+ *    Modes of operation.
+ *
+ *    The scan behaviour depends on the chosen @mode:
+ *    - SCAN_LOOKUP: the basic scan which aims to update value associated to
+ *		     existing DEs. Any discovered DataLine that could NOT be
+ *		     matched to an existing, previously discovered, DE is
+ *		     discarded. This is the normal scan behaviour.
+ *    - SCAN_UPDATE: a more advanced scan which provides all the SCAN_LOOKUP
+ *		     features plus takes care to update the DEs location
+ *		     coordinates inside the SHMTI: note that the related DEs are
+ *		     still supposed to have been previously discovered when
+ *		     this scan runs. This is used to update location
+ *		     coordinates for DEs contained in a Group when such group
+ *		     is enabled.
+ *    - SCAN_DISCOVERY: the most advanced scan available which provides all
+ *			the SCAN_LOOKUP features plus discovery capabilities:
+ *			any DataLine referring to a previously unknown DE leads
+ *			to the allocation of a new DE descriptor.
+ *			This mode is used on the first scan at init time, ONLY
+ *			if Telemetry was found to be already enabled at boot on
+ *			the platform side: this helps to maximize gathered
+ *			information when dealing with out of spec firmwares.
+ *			Any usage of this discovery mode other than in a boot-on
+ *			enabled scenario is discouraged since it can easily
+ *			lead to spurious DE discoveries.
+ */
+static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
+					   struct payload __iomem *payld,
+					   struct telemetry_shmti *shmti,
+					   enum scan_mode mode,
+					   struct telemetry_block_ts *active_bts,
+					   struct telemetry_uuid *active_uuid)
+{
+	bool use_blk_ts = USE_BLK_TS(payld);
+	struct telemetry_de *tde;
+	u64 val, tstamp = 0;
+	u32 de_id;
+
+	de_id = PAYLD_ID(payld);
+	/* Discard malformed lines...a preceding BLK_TS must exist */
+	if (use_blk_ts && !active_bts) {
+		trace_scmi_tlm_access(de_id, "BAD_USE_BLK_TS", 0, 0);
+		return;
+	}
+
+	/* Is this DE ID known ? */
+	tde = scmi_telemetry_tde_lookup(ti, de_id);
+	if (!tde) {
+		if (mode != SCAN_DISCOVERY) {
+			trace_scmi_tlm_access(de_id, "DE_INVALID", 0, 0);
+			return;
+		}
+
+		/* In SCAN_DISCOVERY mode we allocate new DEs for unknown IDs */
+		tde = scmi_telemetry_tde_allocate(ti, de_id, payld);
+		if (!tde) {
+			dev_err(ti->ph->dev,
+				"Cannot allocate TDE for ID:0x%08X\n", de_id);
+			return;
+		}
+	}
+
+	/* Update DE location refs if requested: normally done only on enable */
+	if (mode >= SCAN_UPDATE) {
+		guard(mutex)(&tde->mtx);
+
+		tde->sid = shmti->info.sid;
+		tde->base = shmti->base;
+		tde->eplg = SHMTI_EPLG(shmti);
+		tde->offset = (void __iomem *)payld - (void __iomem *)shmti->base;
+
+		dev_dbg(ti->ph->dev,
+			"TDCF-updated DE_ID:0x%08X - shmti:%pK  offset:%u\n",
+			tde->de.info->id, tde->base, tde->offset);
+	}
+
+	/* Has any value/tstamp really changed ?*/
+	if (scmi_telemetry_tde_cache_unchanged(tde, shmti->last_magic))
+		return;
+
+	/* Link the related BTS when needed, it's unlinked on disable */
+	if (use_blk_ts)
+		scmi_telemetry_blkts_link(tde, active_bts);
+
+	/* Link the active UUID or the primary, it's unlinked on disable */
+	scmi_telemetry_uuid_link(tde, active_uuid ?: ti->primary_uuid);
+
+	/* Parse data words */
+	scmi_telemetry_line_data_parse(tde, &val, &tstamp, payld,
+				       shmti->last_magic);
+}
+
+/**
+ * scmi_telemetry_tdcf_line_parse  - Line parser
+ * @ti: A reference to the Telemetry instance
+ * @payld: A reference to the payload representing the line to parse
+ * @shmti: A reference to the descriptor of the enclosing SHMTI area
+ * @mode: Specification of the scanning mode
+ * @active_bts: A reference used to track the last BLK_TS line found
+ * @active_uuid: A reference used to track the last UUID line found
+ *
+ * Note that @active_bts and @active_uuid references are propagated back and
+ * forth from the line parsers to keep track of the nearest active BLK_TS or
+ * UUID line found in the SHMTI areas and, while doing that, such descriptors
+ * are refcounted and tracked in the xa_lines XArray indexed by @payld.
+ * BLK_TS and UUID descriptors are dropped when no more linked to any DATA line,
+ * during the normal system operation OR later on when the protocol is
+ * de-initialized following a driver removal.
+ *
+ * Return: Number of QWORDS consumed from @payld by this line parsing; note
+ *	   that buggy firmware could return bad, out of range values, so this
+ *	   value MUST be carefully checked for SHMTI boundary overflows by the
+ *	   caller.
+ */
+static int scmi_telemetry_tdcf_line_parse(struct telemetry_info *ti,
+					  struct payload __iomem *payld,
+					  struct telemetry_shmti *shmti,
+					  enum scan_mode mode,
+					  struct telemetry_block_ts **active_bts,
+					  struct telemetry_uuid **active_uuid)
+{
+	int used_qwords;
+
+	used_qwords = LINE_LENGTH_QWORDS(payld);
+	/* Invalid lines are not an error, could simply be disabled DEs */
+	if (DATA_INVALID(payld)) {
+		trace_scmi_tlm_access(PAYLD_ID(payld), "TDCF_INVALID", 0, 0);
+		return used_qwords;
+	}
+
+	switch (LINE_TYPE(payld)) {
+	case TDCF_DATA_LINE:
+		scmi_telemetry_tdcf_data_parse(ti, payld, shmti, mode,
+					       *active_bts, *active_uuid);
+		break;
+	case TDCF_BLK_TS_LINE:
+		scmi_telemetry_tdcf_blkts_parse(ti, payld, shmti, active_bts);
+		break;
+	case TDCF_UUID_LINE:
+		scmi_telemetry_tdcf_uuid_parse(ti, payld, shmti, active_uuid);
+		break;
+	default:
+		trace_scmi_tlm_access(PAYLD_ID(payld), "TDCF_LINE_UNKNOWN", 0, 0);
+		break;
+	}
+
+	return used_qwords;
+}
+
+static inline bool
+scmi_telemetry_shmti_overflow(struct telemetry_shmti *shmti, void __iomem *next)
+{
+	void __iomem *limit = shmti->base + shmti->info.len;
+
+	/* Is payld->meta accessible ? */
+	if (next >= limit - sizeof(u32))
+		return true;
+
+	next += LINE_LENGTH_BYTES((struct payload __iomem *)next);
+
+	return next >= limit;
+}
+
+/**
+ * scmi_telemetry_shmti_scan  - Full SHMTI scan
+ * @ti: A reference to the telemetry info descriptor
+ * @shmti_id: ID of the SHMTI area that has to be scanned
+ * @mode: A flag to determine the behaviour of the scan
+ *
+ * Return: 0 on Success
+ */
+static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
+				     unsigned int shmti_id, enum scan_mode mode)
+{
+	struct telemetry_shmti *shmti = &ti->shmti[shmti_id];
+	struct telemetry_uuid *active_uuid = NULL;
+	struct telemetry_block_ts *active_bts = NULL;
+	struct tdcf __iomem *tdcf = shmti->base;
+	int retries = SCMI_TLM_TDCF_MAX_RETRIES;
+	u32 startm = TDCF_INVALID_MATCH_SEQ, endm = TDCF_BAD_END_SEQ;
+
+	if (!tdcf)
+		return -ENODEV;
+
+	do {
+		unsigned int qwords;
+		void __iomem *next;
+
+		/* A bit of exponential backoff between retries */
+		fsleep((SCMI_TLM_TDCF_MAX_RETRIES - retries) * 1000);
+
+		/*
+		 * Note that during a full SHMTI scan the magic seq numbers are
+		 * checked only at the start and at the end of the scan, NOT
+		 * between each parsed line and this has these consequences:
+		 *  - TDCF magic numbers accesses are reduced to 2 reads
+		 *  - the set of values obtained from a full scan belong all
+		 *    to the same platform update (same magic number)
+		 *  - a SHMTI full scan is an all or nothing operation: when
+		 *    a potentially corrupted read is detected along the way
+		 *    (MSEQ_MISMATCH) another full scan is triggered.
+		 */
+		startm = TDCF_START_SEQ_GET(tdcf);
+		if (IS_BAD_START_SEQ(startm)) {
+			trace_scmi_tlm_access(0, "MSEQ_BADSTART", startm, 0);
+			continue;
+		}
+
+		/* On a BAD_SEQ this will be updated on the next attempt */
+		shmti->last_magic = startm;
+
+		qwords = QWORDS(tdcf);
+		next = tdcf->payld;
+		while (qwords) {
+			int used_qwords;
+
+			if (scmi_telemetry_shmti_overflow(shmti, next)) {
+				trace_scmi_tlm_access(0, "SHMTI_OVERFLOW", startm, 0);
+				endm = TDCF_INVALID_MATCH_SEQ;
+				goto clean;
+			}
+
+			used_qwords = scmi_telemetry_tdcf_line_parse(ti, next,
+								     shmti, mode,
+								     &active_bts,
+								     &active_uuid);
+			if (qwords < used_qwords) {
+				trace_scmi_tlm_access(PAYLD_ID(next),
+						      "BAD_QWORDS", startm, 0);
+				endm = TDCF_INVALID_MATCH_SEQ;
+				goto clean;
+			}
+
+			next += used_qwords * 8;
+			qwords -= used_qwords;
+		}
+
+		endm = TDCF_END_SEQ_GET(SHMTI_EPLG(shmti));
+		if (startm != endm)
+			trace_scmi_tlm_access(0, "MSEQ_MISMATCH", startm, endm);
+	} while (startm != endm && --retries);
+
+	/*
+	 * Put the initial creation reference so that lines will be
+	 * effectively dropped when there are no more data lines referencing
+	 * them.
+	 */
+clean:
+	if (active_bts)
+		scmi_telemetry_line_put(&active_bts->line);
+	if (active_uuid)
+		scmi_telemetry_line_put(&active_uuid->line);
+
+	if (startm != endm) {
+		trace_scmi_tlm_access(0, "TDCF_SCAN_FAIL", startm, endm);
+		return -EPROTO;
+	}
+
+	return 0;
+}
+
 static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
 	.info_get = scmi_telemetry_info_get,
 	.de_lookup = scmi_telemetry_de_lookup,
@@ -1358,6 +2203,8 @@ static void scmi_telemetry_resources_free(void *arg)
 	struct scmi_telemetry_res_info *rinfo;
 	struct telemetry_info *ti = arg;
 	struct scmi_telemetry_de *de;
+	struct telemetry_line *line;
+	uuid_t **cur_uuids;
 	unsigned long idx;
 
 	/* Get rinfo without triggering a recursive enumeration */
@@ -1366,13 +2213,37 @@ static void scmi_telemetry_resources_free(void *arg)
 	/* Ensure rinfo is no more accessible upfront */
 	smp_store_release(&ti->rinfo, NULL);
 
+	/*
+	 * Unlinking all the BLK_TS/UUID lines related to a DE triggers also
+	 * the deallocation of such lines when the embedded refcount hits zero.
+	 */
 	xa_for_each(&ti->xa_des, idx, de) {
 		struct telemetry_de *tde = to_tde(de);
 
+		scmi_telemetry_de_unlink(&tde->de);
 		scmi_telemetry_free_tde_put(ti, tde);
 	}
 
 	xa_destroy(&ti->xa_des);
+
+	/* Drop reference to UUID lines kept in the growable array */
+	scoped_guard(mutex, &ti->uuids_mtx) {
+		cur_uuids = rcu_dereference_protected(ti->info.uuids,
+						      lockdep_is_held(&ti->uuids_mtx));
+		for (int i = 0; i < ti->info.num_uuids; i++) {
+			struct telemetry_uuid *uuid = to_uuid_from_uuid_t(cur_uuids[i]);
+
+			scmi_telemetry_line_put(&uuid->line);
+		}
+	}
+
+	kfree_rcu_mightsleep(cur_uuids);
+
+	/* Drop all remaining currently unbound lines and their containers */
+	xa_for_each(&ti->xa_lines, idx, line)
+		scmi_telemetry_line_put(line);
+	xa_destroy(&ti->xa_lines);
+
 	kfree(ti->tdes);
 	kfree(rinfo->des);
 	kfree(rinfo->dei_store);
@@ -1455,6 +2326,28 @@ scmi_telemetry_resources_enumerate(struct telemetry_info *ti)
 	return READ_ONCE(ti->rinfo);
 }
 
+static int scmi_telemetry_primary_uuid_init(struct telemetry_info *ti)
+{
+	struct telemetry_uuid *uuid;
+
+	/* Primary UUID is stored on key 0 (NULL) */
+	uuid = scmi_telemetry_uuid_create(ti, NULL);
+	if (!uuid)
+		return -ENOMEM;
+
+	uuid_copy(&uuid->uuid, &ti->info.base.primary_revision);
+	/* Make it available in the uuid list once initialized */
+	if (!scmi_telemetry_uuid_register(ti, NULL, uuid)) {
+		dev_err(ti->ph->dev, "Failed to register Primary UUID\n");
+		return -ENOMEM;
+	}
+
+	/* Ensure Primary UUID association is visible */
+	smp_store_release(&ti->primary_uuid, uuid);
+
+	return 0;
+}
+
 /**
  * scmi_telemetry_instance_init  - Instance initializer
  * @ti: A reference to the telemetry info descriptor for this instance
@@ -1470,6 +2363,8 @@ scmi_telemetry_resources_enumerate(struct telemetry_info *ti)
  */
 static int scmi_telemetry_instance_init(struct telemetry_info *ti)
 {
+	unsigned int uuids_len;
+	uuid_t **cur_uuids;
 	int ret;
 
 	/* Allocate and Initialize on first call... */
@@ -1478,11 +2373,44 @@ static int scmi_telemetry_instance_init(struct telemetry_info *ti)
 		return ret;
 
 	xa_init(&ti->xa_des);
+	xa_init(&ti->xa_lines);
+	mutex_init(&ti->lines_mtx);
+	for (int i = 0; i < 1 << PAYLD_HASH_BITS; i++)
+		mutex_init(&ti->payld_locks[i]);
+
+	/*
+	 * Always allocate at least one slot for the primary and anyway at
+	 * least enough to avoid immediate resizing, assuring uuids_len
+	 * always greater or equal to one.
+	 */
+	uuids_len = max(ti->num_shmti * 2, SCMI_UUID_DB_THRESH + 1);
+	cur_uuids = kcalloc(uuids_len, sizeof(*cur_uuids), GFP_KERNEL);
+	if (!cur_uuids) {
+		scmi_telemetry_resources_free(ti);
+		return -ENOMEM;
+	}
+
+	mutex_init(&ti->uuids_mtx);
+	/* Expose new UUID pointer */
+	scoped_guard(mutex, &ti->uuids_mtx) {
+		rcu_assign_pointer(ti->info.uuids, cur_uuids);
+		ti->uuids_len = uuids_len;
+	}
+
+	ret = scmi_telemetry_primary_uuid_init(ti);
+	if (ret) {
+		scmi_telemetry_resources_free(ti);
+		return ret;
+	}
+
 	ret = devm_add_action_or_reset(ti->ph->dev,
 				       scmi_telemetry_resources_free, ti);
 	if (ret)
 		return ret;
 
+	atomic_set(&ti->des_enabled[ENA_STATE], 0);
+	atomic_set(&ti->des_enabled[ENA_TSTAMP], 0);
+	mutex_init(&ti->des_enabled_mtx);
 	/* Setup resources lazy initialization */
 	atomic_set(&ti->rinfo_initializing, 0);
 	init_completion(&ti->rinfo_initdone);
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 2850b018da0d..a6bdec1ce331 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -981,7 +981,7 @@ struct scmi_telemetry_info {
 	struct scmi_telemetry_intervals *intervals;
 	struct scmi_telemetry_shmti_info **shmtis;
 	unsigned int num_uuids;
-	uuid_t **uuids;
+	uuid_t * __rcu *uuids;
 	bool enabled;
 	bool notif_enabled;
 	enum scmi_telemetry_collection current_mode;
-- 
2.54.0

