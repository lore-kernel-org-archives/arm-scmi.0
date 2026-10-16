Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFEE94D9552;
	Fri, 16 Oct 2026 18:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792177044; cv=none; b=fPIdj7S8oo2NVJGg3GWOikp9loiP8fvSIlJYK6pBKM3hogdsxOtjhTLtd5+5fOyuDWLKBj1NkwJrJ+B5JDc/iudZxSil4g5MOMmMsuyHwGKM6Hl20+4gJSsgOdeAaI/6WlnqAm9fgDTceCgTJmY9/hRymghIH29BKb+PM4kuKIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792177044; c=relaxed/simple;
	bh=U1VzmmLlOoiS1h70IbeKlE34tyTkwrxPAQ+5LIRxtcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lt410+daua0RMFQbK19hcUlD14YEPo/Lw+TjS5y6LXQjtGSUYqAm6lGcM0MDAC4Xi2yGzX5utBXupbZ/ViF9H/IiSNyaYkgjRTOwK3yahgppPJSEpBjc2ZvlV1n/maalYarJ6p/JxjwDSOmHOkMrOpYJobL/ImYtH5tqvfdhXM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Xryy4Mfs; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Xryy4Mfs"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1093A14BF;
	Fri, 16 Oct 2026 11:57:18 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BBD1A3F7B4;
	Fri, 16 Oct 2026 11:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792177041; bh=U1VzmmLlOoiS1h70IbeKlE34tyTkwrxPAQ+5LIRxtcY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xryy4Mfs/O4NkrDSVAQSLqkHoJiWHG0RN69vd//Wmb15/vZh/r1OfrnDl3MeHwanW
	 AF8tVJoiPqYWhHiOXTFRqIGgIT2SO8yqwGPDfzT9c7IwheaNDItrSRwK1OB7vzRKqe
	 wxd5uLRqLdCLwBgduGpMMNqZROhJL/MhVD0OxGAw=
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
	jonathan.cameron@oss.qualcomm.com,
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
Subject: [PATCH v14 12/32] firmware: arm_scmi: Add Telemetry TDCF areas parsing support
Date: Fri, 16 Oct 2026 19:55:33 +0100
Message-ID: <20261016185553.2794459-13-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261016185553.2794459-1-cristian.marussi@arm.com>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add logic to scan the SHMTI areas, parsing the TDCF descriptors and collect
DataEvent contained in TDCF DATA lines. Ignore TDCF BLK_TS and UUID lines.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v13 --> v14
 - fixed AB-BA dealock on blkts_link
 - relocate xa_destroy for xa_lines after uuids cleanup
 - report errors on scmi_telemetry_line_data_parse()
 - moved some common protocol definitions here from previous
   patches
 - split out of this patch all of the BLK_TS and UUID lines
   management, keeping only DATA line processing and delegating
   the other line types to following smaller patches
 - using a less regular time interval for TDCF scan retries
v12 --> v13
 - refactored cleanup resources
 - relocate tde->mtx guards higher up and add lockdep assertions
 - drop refcount on previous active lines when scanning
 - harden freeing path of UUIDs RCU items
 - better DATA LINE size-validation while parsing
 - reset active lines trackers on scan retries
 - validate used_qwords
 - redefine startm/endm bad sentinels and error path
 - add more BLKTS_INVALID checks on parsing
 - unlink stale BTS line when finding a new actibe for the TDE
 - retry scans on TDCF sanity failures..could be a torn read
 - use *alloc_objs
 - remove TO_CPU64
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
 drivers/firmware/arm_scmi/telemetry.c | 570 ++++++++++++++++++++++++++
 1 file changed, 570 insertions(+)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index f587cd21849c..04481a3df587 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -14,8 +14,10 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/limits.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/refcount.h>
 #include <linux/slab.h>
 #include <linux/sprintf.h>
 #include <linux/string.h>
@@ -25,9 +27,14 @@
 #include "protocols.h"
 #include "notify.h"
 
+#include <trace/events/scmi.h>
+
 /* Updated only after ALL the mandatory features for that version are merged */
 #define SCMI_PROTOCOL_SUPPORTED_VERSION		0x10000
 
+#define SCMI_TLM_TDCF_MAX_RETRIES	5
+#define SCMI_TLM_TDCF_RETRY_GAP		1234
+
 #define SCMI_TLM_DE_IMPL_NUM_DWORDS	4
 
 enum scmi_telemetry_protocol_cmd {
@@ -123,6 +130,129 @@ struct scmi_msg_resp_telemetry_update_intervals {
 
 #define _I(__a)		(ioread32((void __iomem *)(__a)))
 
+/*
+ * Define the behaviour of a SHMTI scan defining what information will
+ * be gathered and which Telemetry items can be updated.
+ */
+enum scan_mode {
+	SCAN_LOOKUP,	/* Update only value/tstamp */
+	SCAN_UPDATE,	/* Update also location offset */
+	SCAN_DISCOVERY  /* Update xa_des: allows for new DEs to be discovered */
+};
+
+struct fc_line {
+	__le32 data_low;
+	__le32 data_high;
+};
+
+struct fc_tsline {
+	__le32 data_low;
+	__le32 data_high;
+	__le32 ts_low;
+	__le32 ts_high;
+};
+
+struct line {
+	__le32 data_low;
+	__le32 data_high;
+};
+
+struct tsline {
+	__le32 data_low;
+	__le32 data_high;
+	__le32 ts_low;
+	__le32 ts_high;
+};
+
+#define LINE_DATA_GET(f)				\
+({							\
+	typeof(f) _f = (f);				\
+	u32 _high = _I(&_f->data_high);			\
+	u32 _low = _I(&_f->data_low);			\
+	u64 _res;					\
+							\
+	_res = (((u64)(_high)) << 32) | (_low);		\
+	_res;						\
+})
+
+#define LINE_TSTAMP_GET(f)				\
+({							\
+	typeof(f) _f = (f);				\
+	u32 _high = _I(&_f->ts_high);			\
+	u32 _low = _I(&_f->ts_low);			\
+	u64 _res;					\
+							\
+	_res = (((u64)(_high)) << 32) | (_low);		\
+	_res;						\
+})
+
+#define BLK_TS_STAMP(f)		LINE_TSTAMP_GET(f)
+#define BLK_TS_RATE(p)		PAYLD_ID(p)
+
+enum tdcf_line_types {
+	TDCF_DATA_LINE = 0,
+	TDCF_BLK_TS_LINE = 1,
+	TDCF_UUID_LINE = 2,
+};
+
+struct payload {
+	__le32 meta;
+#define PAYLD_META(x)		(_I(&((x)->meta)))
+#define LINE_TYPE_RAW(m)	(FIELD_GET(GENMASK(7, 4), (m)))
+#define LINE_TYPE(x)		(LINE_TYPE_RAW(PAYLD_META(x)))
+#define IS_DATA_LINE(x)		(LINE_TYPE(x) == TDCF_DATA_LINE)
+#define IS_BLK_TS_LINE(x)	(LINE_TYPE(x) == TDCF_BLK_TS_LINE)
+#define IS_UUID_LINE(x)		(LINE_TYPE(x) == TDCF_UUID_LINE)
+#define USE_BLK_TS_RAW(m)	((m) & BIT(3))
+#define USE_BLK_TS(x)		(USE_BLK_TS_RAW(PAYLD_META(x)))
+#define HAS_LINE_EXT_RAW(m)	((m) & BIT(2))
+#define HAS_LINE_EXT(x)		(HAS_LINE_EXT_RAW(PAYLD_META(x)))
+#define LINE_TS_VALID_RAW(m)	((m) & BIT(1))
+#define LINE_TS_VALID(x)	(LINE_TS_VALID_RAW(PAYLD_META(x)))
+#define	DATA_INVALID_RAW(m)	((m) & BIT(0))
+#define	DATA_INVALID(x)		(DATA_INVALID_RAW(PAYLD_META(x)))
+#define	BLK_TS_INVALID_RAW(m)						\
+({									\
+	bool invalid;							\
+									\
+	invalid  = LINE_TS_VALID_RAW(m) || HAS_LINE_EXT_RAW(m) ||	\
+			USE_BLK_TS_RAW(m) || DATA_INVALID_RAW(m);	\
+	invalid;							\
+})
+#define	BLK_TS_INVALID(p)	BLK_TS_INVALID_RAW(PAYLD_META(p))
+
+#define	UUID_INVALID_RAW(m)						\
+({									\
+	bool invalid;							\
+									\
+	invalid = LINE_TS_VALID_RAW(m) || USE_BLK_TS_RAW(m) ||	\
+			DATA_INVALID_RAW(m) || !HAS_LINE_EXT_RAW(m);	\
+	invalid;							\
+})
+#define	UUID_INVALID(p)		UUID_INVALID_RAW(PAYLD_META(p))
+	__le32 id;
+	union {
+		struct line l;
+		struct tsline tsl;
+	};
+};
+
+#define PAYLD_ID(x)	(_I(&(((struct payload __iomem *)(x))->id)))
+
+#define LINE_DATA_PAYLD_WORDS						       \
+	((sizeof(u32) + sizeof(u32) + sizeof(struct line)) / sizeof(u32))
+#define EXT_LINE_DATA_PAYLD_WORDS					       \
+	((sizeof(u32) + sizeof(u32) + sizeof(struct tsline)) / sizeof(u32))
+
+#define LINE_LENGTH_WORDS_RAW(m)		\
+	(HAS_LINE_EXT_RAW((m)) ? EXT_LINE_DATA_PAYLD_WORDS : LINE_DATA_PAYLD_WORDS)
+
+#define LINE_LENGTH_WORDS(x)		LINE_LENGTH_WORDS_RAW(PAYLD_META(x))
+#define LINE_LENGTH_QWORDS(x)		((LINE_LENGTH_WORDS(x)) / 2)
+
+#define LINE_LENGTH_BYTES_RAW(m)	((LINE_LENGTH_WORDS_RAW(m)) * sizeof(u32))
+#define LINE_LENGTH_BYTES(x)		(LINE_LENGTH_BYTES_RAW(PAYLD_META(x)))
+
 struct prlg {
 	u32 sign_start;
 #define SIGNATURE_START	0x5442474E	/* TBGN */
@@ -145,10 +275,19 @@ struct tdcf {
 	unsigned char payld[];
 };
 
+#define QWORDS(_t)	(_I(&(_t)->prlg.num_qwords))
+
 #define SHMTI_MIN_SIZE	(sizeof(struct tdcf) + TDCF_EPLG_SZ)
 
 #define TDCF_START_SIGNATURE(x)	(_I(&((x)->prlg.sign_start)))
+#define TDCF_START_SEQ_GET(x)	(_I(&((x)->prlg.match_start)))
+/* TDCF MatchSequence cannot be zero by the SCMI v4.0 Specification */
+#define TDCF_INVALID_MATCH_SEQ	0
+#define IS_BAD_START_SEQ(s)	((s) & 0x1 || (s) == TDCF_INVALID_MATCH_SEQ)
+
+#define TDCF_END_SEQ_GET(e)	(_I(&((e)->match_end)))
 #define TDCF_END_SIGNATURE(e)	(_I(&((e)->sign_end)))
+#define	TDCF_BAD_END_SEQ	GENMASK(31, 0)
 
 struct telemetry_shmti {
 	u32 flags;
@@ -166,6 +305,35 @@ struct telemetry_shmti {
 		(_eplg);					\
 	})
 
+struct telemetry_info;
+
+struct telemetry_line {
+	enum tdcf_line_types type;
+	u32 last_magic;
+	struct payload __iomem *payld;
+	refcount_t users;
+	struct telemetry_info *ti;
+	/* Protect line accesses  */
+	struct mutex mtx;
+};
+
+struct telemetry_block_ts {
+	u64 last_ts;
+	u32 last_rate;
+	struct telemetry_line line;
+};
+
+#define to_blkts(l)	container_of(l, struct telemetry_block_ts, line)
+
+struct telemetry_uuid {
+	uuid_t uuid;
+	bool published;
+	struct telemetry_line line;
+};
+
+#define to_uuid_from_line(l)	container_of(l, struct telemetry_uuid, line)
+#define to_uuid_from_uuid_t(u)	container_of(u, struct telemetry_uuid, uuid)
+
 enum timestamps {
 	TSTAMP_NONE = 0,
 	TSTAMP_LINE = 1,
@@ -184,7 +352,13 @@ struct telemetry_de {
 	u32 offset;
 	/* NOTE THAT DE data_sz is registered in scmi_telemetry_de */
 	u32 fc_size;
+	u64 last_val;
+	u64 last_ts;
+	u32 last_magic;
 	struct list_head item;
+	struct telemetry_block_ts *bts;
+#define BLK_TS_CHANGED(t, p)	(!((t)->bts) || (t)->bts->line.payld != (p))
+	struct telemetry_uuid *uuid;
 	struct scmi_telemetry_de de;
 	/* Protect last_val/ts/magic accesses - MUST BE KEPT LAST */
 	struct mutex mtx;
@@ -192,10 +366,24 @@ struct telemetry_de {
 
 #define to_tde(d)	container_of(d, struct telemetry_de, de)
 
+static inline bool scmi_tde_has_tstamp(struct telemetry_de *t)
+{
+	return t->de.tstamp_support && t->de.tstamp_enabled;
+}
+
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
+	/* Mutex to protect des_enabled_mtx */
+	struct mutex des_enabled_mtx;
+	atomic_t des_enabled[ENA_MAX];
 	unsigned int default_blk_ts_rate;
 	const struct scmi_protocol_handle *ph;
 	struct telemetry_shmti *shmti;
@@ -209,6 +397,7 @@ struct telemetry_info {
 	struct scmi_telemetry_info info;
 	atomic_t rinfo_initializing;
 	struct completion rinfo_initdone;
+	#define PAYLD_HASH_BITS  4
 	struct scmi_telemetry_res_info *rinfo;
 	struct scmi_telemetry_res_info *(*res_get)(struct telemetry_info *ti);
 };
@@ -216,6 +405,25 @@ struct telemetry_info {
 static struct scmi_telemetry_res_info *
 __scmi_telemetry_resources_get(struct telemetry_info *ti);
 
+static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
+				     unsigned int shmti_id, enum scan_mode mode);
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
@@ -312,6 +520,27 @@ static int scmi_telemetry_tde_register(struct telemetry_info *ti,
 	return ret;
 }
 
+static bool
+scmi_telemetry_tde_cache_unchanged(struct telemetry_de *tde, u32 magic)
+{
+	lockdep_assert_held(&tde->mtx);
+
+	return tde->last_magic == magic;
+}
+
+static void
+scmi_telemetry_tde_cache_update(struct telemetry_de *tde, u64 val,
+				u64 *tstamp, u32 *magic)
+{
+	lockdep_assert_held(&tde->mtx);
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
@@ -1018,6 +1247,338 @@ scmi_telemetry_resources_get(const struct scmi_protocol_handle *ph)
 	return res_get(ti);
 }
 
+static u64
+scmi_telemetry_blkts_read(u32 magic, struct telemetry_de *tde)
+{
+	lockdep_assert_held(&tde->mtx);
+
+	return 0;
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
+	guard(mutex)(&tde->mtx);
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
+static inline int
+scmi_telemetry_line_data_parse(struct telemetry_de *tde, u64 *val, u64 *tstamp,
+			       struct payload __iomem *payld, u32 magic)
+{
+	u32 meta = PAYLD_META(payld);
+
+	lockdep_assert_held(&tde->mtx);
+
+	/* Clear returned values in case of errors */
+	*val = 0;
+
+	if (tstamp) {
+		*tstamp = 0;
+		if (USE_BLK_TS_RAW(meta)) {
+			/* Read out the actual BLK_TS */
+			*tstamp = scmi_telemetry_blkts_read(magic, tde);
+		} else if (LINE_TS_VALID_RAW(meta)) {
+			/*
+			 * Note that LINE_TS_VALID implies HAS_LINE_EXT and that
+			 * the per DE line_ts_rate is advertised in the DE
+			 * descriptor, BUT we check anyway against buggy FW.
+			 */
+			if (!HAS_LINE_EXT_RAW(meta)) {
+				trace_scmi_tlm_access(tde->de.info->id,
+						      "SHMTI_BAD_TS_LINE", 0, 0);
+				return -EPROTO;
+			}
+
+			*tstamp = LINE_TSTAMP_GET(&payld->tsl);
+		}
+	}
+
+	/* Data is always valid since we are NOT handling BLK TS lines here */
+	*val = LINE_DATA_GET(&payld->l);
+
+	trace_scmi_tlm_collect(tstamp ? *tstamp : 0, tde->de.info->id,
+			       *val, "SHMTI_DE_READ");
+
+	scmi_telemetry_tde_cache_update(tde, *val, tstamp, &magic);
+
+	return 0;
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
+	struct telemetry_de *tde;
+	u64 val, tstamp = 0;
+	u32 de_id;
+
+	de_id = PAYLD_ID(payld);
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
+	guard(mutex)(&tde->mtx);
+	/* Update DE location refs if requested: normally done only on enable */
+	if (mode >= SCAN_UPDATE) {
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
+	/*
+	 * Parse data words ... only for the sake of updating TDE cache,
+	 * any error is logged by ignored.
+	 */
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
+	struct tdcf __iomem *tdcf = shmti->base;
+	int retries = SCMI_TLM_TDCF_MAX_RETRIES;
+	struct telemetry_block_ts *active_bts = NULL;
+	struct telemetry_uuid *active_uuid = NULL;
+	u32 startm, endm;
+
+	if (!tdcf)
+		return -ENODEV;
+
+	do {
+		unsigned int qwords;
+		void __iomem *next;
+
+		/* A bit of exponential backoff between retries */
+		fsleep((SCMI_TLM_TDCF_MAX_RETRIES - retries) * SCMI_TLM_TDCF_RETRY_GAP);
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
+		/* Build a default endm certainly different from startm */
+		endm = startm + 1;
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
+				/* Retry, it could due to a concurrent update */
+				break;
+			}
+
+			used_qwords = scmi_telemetry_tdcf_line_parse(ti, next,
+								     shmti, mode,
+								     &active_bts,
+								     &active_uuid);
+			if (!used_qwords || qwords < used_qwords) {
+				trace_scmi_tlm_access(PAYLD_ID(next),
+						      "BAD_QWORDS", startm, 0);
+				/* Retry, it could due to a concurrent update */
+				break;
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
@@ -1139,6 +1700,12 @@ static void scmi_telemetry_tdes_cleanup(struct telemetry_info *ti)
 	struct scmi_telemetry_de *de;
 	unsigned long idx;
 
+	/*
+	 * Unlinking all the BLK_TS/UUID lines related to a DE triggers also
+	 * the deallocation of such lines when the embedded refcount hits zero.
+	 * Note that the UUID lines are also referenced and refcounted by the
+	 * global UUID RCU array, so they won't be deallocated here.
+	 */
 	xa_for_each(&ti->xa_des, idx, de) {
 		struct telemetry_de *tde = to_tde(de);
 
@@ -1268,6 +1835,9 @@ static int scmi_telemetry_instance_init(struct telemetry_info *ti)
 
 	xa_init(&ti->xa_des);
 
+	atomic_set(&ti->des_enabled[ENA_STATE], 0);
+	atomic_set(&ti->des_enabled[ENA_TSTAMP], 0);
+	mutex_init(&ti->des_enabled_mtx);
 	/* Setup resources lazy initialization */
 	atomic_set(&ti->rinfo_initializing, 0);
 	init_completion(&ti->rinfo_initdone);
-- 
2.54.0

