Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1FBC39DBD3;
	Sat, 15 Aug 2026 23:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786836434; cv=none; b=snkzD04OMqhQud4FqVmFRnBMCL52XvBeeht2cqft5pXdN99/CtnmXrERoHcaVplhwqSLg4+qkNmDTd3sqmCdVXoLfc6ZuiZNc5uYnfwqJiYgIsAm5cV5xc3mNuemtzPnoTissLO2zNZXlYk8aYSDdUR5Ov2b5WVBiPHnZ4+KM7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786836434; c=relaxed/simple;
	bh=sRNqv2DfQSJM3Vm0A9nfSaTXB2LmCi7CYRGnY5zV3PQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FN/5VutzjMCfeAZFKJb2qfDhEaCU7As7jUw0IYP2JaYoYmjJcEprNUg++wbUtWFR0adjspfUHzTD1BX0+aywilcSbE3teBTyNhpmdojVgWtX5nFAIogVIY+DKnMO++nrBzJ033nGkDrSRAsb1aUl6HnI8/DQpM1f1j6bi2cjwfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nKRsm+Jm; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nKRsm+Jm"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D2161D15;
	Sat, 15 Aug 2026 16:27:06 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 568B73F673;
	Sat, 15 Aug 2026 16:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786836430; bh=sRNqv2DfQSJM3Vm0A9nfSaTXB2LmCi7CYRGnY5zV3PQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nKRsm+JmDYX9HkMXRkVCn7/i7w+JyjFQrbXNfQmOQCOjS2tRy0YNES6o/K04PBNnZ
	 jys/oZtuEoWN6UXww80t78xqMeEB3T/j4hQJS64dRRqKooZmXHUtcgbmYXDmA83zem
	 TplFBhYrqKvEWr7GdToT49XNTJY4eG1Ywl7ikLqM=
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
Subject: [PATCH v10 09/24] firmware: arm_scmi: Add Telemetry DataEvent read capabilities
Date: Sun, 16 Aug 2026 00:25:49 +0100
Message-ID: <20260815232604.3730754-10-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260815232604.3730754-1-cristian.marussi@arm.com>
References: <20260815232604.3730754-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for Telemetry operations needed to read DataEvent values and
timestamps as single entities or all together in a single bulk buffer.
The returned values are effectiely retrieved from the platform only
when strictly needed, i.e. when no fresh recent cached value was already
available.
The DataEvent values are fetched transparently from the platform origins
using the proper synchronization and consistency primitives, directly from
the SHMTIs areas or the FastChannels memory depending on the configuration.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v8 -->v9
 - Fix Sashiko reports for v8
   - check if TS supported on FC line before using it
   - check for unexpected shorter reply on sample_get
   - use non-LE accessors in msg_payld where appropriate
v7 --> v8
 - Fixes for some Sashiko issues on v7
  - added CACHED_DE_READ trace
  - reworked locking around line handling: blkts/uuid
v6 -->v7
 - usse proper le32 accesors, fix sparse warns
v5 --> v6
 - fixed some Sashiko review
 - add new macros parse TDCF-like content on regular ram (non IO)
 https://sashiko.dev/#/patchset/20260703123601.381275-1-cristian.marussi%40arm.com?part=10
   - fix retry loop in DE parse to avoid exiting on transient errors
   - use proper non-IO accessors for msg payld parsing
   - add msg payld boundary check
v4 --> v5
 - removed UAPI structures dependency
 - cleaned up sample_get logic around groups
 - fixes sparse warnings
v3 --> v4
 - fix typos in comments
 - extend TDE cache helpers with cache lookup routine and use cumulative
   scmi_telemetry_de_sample param
v2 --> v3
 - split from monolithic Telemetry patch
 - simplity using a few assignement using ternary ops
 - remove useless ts param from scanning function
 - use a compound literal to simplify samples init
 - add a missing __must_check on telemetry_ops
 - changed errno on DE read troubles:
   - ENODEV/ENOENT: DE is UNKNOWN
   - EINVAL: DE is marked as DATA_INVALID
   - ENODATA: TLM susbsystem or the specific DE is OFF
---
 drivers/firmware/arm_scmi/telemetry.c | 597 ++++++++++++++++++++++----
 include/linux/scmi_protocol.h         |  24 ++
 2 files changed, 546 insertions(+), 75 deletions(-)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 7d2d01912fa6..62bc8150c6eb 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -287,7 +287,7 @@ struct uuid_line {
 ({								\
 	typeof(f) _f = (f);					\
 								\
-	(TO_CPU_64(_I(&_f->ts_high), _I(&_f->ts_low)));	\
+	(TO_CPU_64(_I(&_f->ts_high), _I(&_f->ts_low)));		\
 })
 
 #define BLK_TS_STAMP(f)		LINE_TSTAMP_GET(f)
@@ -301,32 +301,38 @@ enum tdcf_line_types {
 
 struct payload {
 	__le32 meta;
-#define LINE_TYPE(x)		(FIELD_GET(GENMASK(7, 4), _I(&((x)->meta))))
+#define PAYLD_META(x)		(_I(&((x)->meta)))
+#define LINE_TYPE_RAW(m)	(FIELD_GET(GENMASK(7, 4), (m)))
+#define LINE_TYPE(x)		(LINE_TYPE_RAW(PAYLD_META(x)))
 #define IS_DATA_LINE(x)		(LINE_TYPE(x) == TDCF_DATA_LINE)
 #define IS_BLK_TS_LINE(x)	(LINE_TYPE(x) == TDCF_BLK_TS_LINE)
 #define IS_UUID_LINE(x)		(LINE_TYPE(x) == TDCF_UUID_LINE)
-#define USE_BLK_TS(x)		(_I(&((x)->meta)) & BIT(3))
-#define HAS_LINE_EXT(x)		(_I(&((x)->meta)) & BIT(2))
-#define LINE_TS_VALID(x)	(_I(&((x)->meta)) & BIT(1))
-#define	DATA_INVALID(x)		(_I(&((x)->meta)) & BIT(0))
-#define	BLK_TS_INVALID(p)					\
-({								\
-	typeof(p) _p = (p);					\
-	bool invalid;						\
-								\
-	invalid  = LINE_TS_VALID(_p) || HAS_LINE_EXT(_p) ||	\
-			USE_BLK_TS(_p) || DATA_INVALID(_p);	\
-	invalid;						\
+#define USE_BLK_TS_RAW(m)	((m) & BIT(3))
+#define USE_BLK_TS(x)		(USE_BLK_TS_RAW(PAYLD_META(x)))
+#define HAS_LINE_EXT_RAW(m)	((m) & BIT(2))
+#define HAS_LINE_EXT(x)		(HAS_LINE_EXT_RAW(PAYLD_META(x)))
+#define LINE_TS_VALID_RAW(m)	((m) & BIT(1))
+#define LINE_TS_VALID(x)	(LINE_TS_VALID_RAW(PAYLD_META(x)))
+#define	DATA_INVALID_RAW(m)	((m) & BIT(0))
+#define	DATA_INVALID(x)		(DATA_INVALID_RAW(PAYLD_META(x)))
+#define	BLK_TS_INVALID(p)						\
+({									\
+	u32 _m = PAYLD_META(p);						\
+	bool invalid;							\
+									\
+	invalid  = LINE_TS_VALID_RAW(_m) || HAS_LINE_EXT_RAW(_m) ||	\
+			USE_BLK_TS_RAW(_m) || DATA_INVALID_RAW(_m);	\
+	invalid;							\
 })
 
-#define	UUID_INVALID(p)						\
-({								\
-	typeof(p) _p = (p);					\
-	bool invalid;						\
-								\
-	invalid = LINE_TS_VALID(_p) || USE_BLK_TS(_p) ||	\
-			DATA_INVALID(_p) || !HAS_LINE_EXT(_p);	\
-	invalid;						\
+#define	UUID_INVALID(p)							\
+({									\
+	u32 _m = PAYLD_META(p);						\
+	bool invalid;							\
+									\
+	invalid = LINE_TS_VALID_RAW(_m) || USE_BLK_TS_RAW(_m) ||	\
+			DATA_INVALID_RAW(_m) || !HAS_LINE_EXT_RAW(_m);	\
+	invalid;							\
 })
 	__le32 id;
 	union {
@@ -344,8 +350,10 @@ struct payload {
 #define EXT_LINE_DATA_PAYLD_WORDS					       \
 	((sizeof(u32) + sizeof(u32) + sizeof(struct tsline)) / sizeof(u32))
 
-#define LINE_LENGTH_WORDS(x)				\
-	(HAS_LINE_EXT((x)) ? EXT_LINE_DATA_PAYLD_WORDS : LINE_DATA_PAYLD_WORDS)
+#define LINE_LENGTH_WORDS_RAW(m)				\
+	(HAS_LINE_EXT_RAW((m)) ? EXT_LINE_DATA_PAYLD_WORDS : LINE_DATA_PAYLD_WORDS)
+
+#define LINE_LENGTH_WORDS(x)		LINE_LENGTH_WORDS_RAW(PAYLD_META(x))
 
 #define LINE_LENGTH_QWORDS(x)		((LINE_LENGTH_WORDS(x)) / 2)
 #define LINE_LENGTH_BYTES(x)		((LINE_LENGTH_WORDS(x)) * sizeof(u32))
@@ -400,12 +408,14 @@ struct telemetry_shmti {
 		(_eplg);					\
 	})
 
+struct telemetry_info;
+
 struct telemetry_line {
 	enum tdcf_line_types type;
 	u32 last_magic;
 	struct payload __iomem *payld;
 	refcount_t users;
-	struct xarray *xa_lines;
+	struct telemetry_info *ti;
 	/* Protect line accesses  */
 	struct mutex mtx;
 };
@@ -619,16 +629,37 @@ scmi_telemetry_tde_cache_unchanged(struct telemetry_de *tde, u32 magic)
 }
 
 static void
-scmi_telemetry_tde_cache_update(struct telemetry_de *tde, u64 val,
-				u64 *tstamp, u32 *magic)
+scmi_telemetry_tde_cache_update(struct telemetry_de *tde,
+				struct scmi_telemetry_de_sample *sample,
+				u32 *magic)
 {
 	guard(mutex)(&tde->mtx);
 
 	tde->last_magic = magic ? *magic : TDCF_BAD_END_SEQ;
-	tde->last_val = val;
-	tde->last_ts = tstamp && scmi_tde_has_tstamp(tde) ? *tstamp : 0;
-	if (tstamp)
-		*tstamp = tde->last_ts;
+	tde->last_val = sample->val;
+	tde->last_ts = scmi_tde_has_tstamp(tde) ? sample->tstamp : 0;
+	/* Update returned value too */
+	sample->tstamp = tde->last_ts;
+}
+
+static int
+scmi_telemetry_tde_cache_lookup(struct telemetry_de *tde,
+				struct scmi_telemetry_de_sample *sample,
+				u32 *magic)
+{
+	guard(mutex)(&tde->mtx);
+
+	if (magic && tde->last_magic != *magic)
+		return -EAGAIN;
+
+	sample->id = tde->de.info->id;
+	sample->val = tde->last_val;
+	sample->tstamp = tde->last_ts;
+
+	trace_scmi_tlm_collect(sample->tstamp, sample->id,
+			       sample->val, "CACHED_DE_READ");
+
+	return 0;
 }
 
 struct scmi_tlm_de_priv {
@@ -1326,11 +1357,11 @@ scmi_telemetry_resources_get(const struct scmi_protocol_handle *ph)
 static u64
 scmi_telemetry_blkts_read(u32 magic, struct telemetry_block_ts *bts)
 {
+	guard(mutex)(&bts->line.mtx);
+
 	if (WARN_ON(!bts || !refcount_read(&bts->line.users)))
 		return 0;
 
-	guard(mutex)(&bts->line.mtx);
-
 	if (bts->line.last_magic == magic)
 		return bts->last_ts;
 
@@ -1378,7 +1409,8 @@ static inline void *scmi_telemetry_line_blob_get(struct telemetry_line *line)
 static void scmi_telemetry_line_put(struct telemetry_line *line)
 {
 	if (refcount_dec_and_test(&line->users)) {
-		xa_erase(line->xa_lines, (unsigned long)line->payld);
+		guard(mutex)(&line->ti->lines_mtx);
+		xa_erase(&line->ti->xa_lines, (unsigned long)line->payld);
 		kfree(scmi_telemetry_line_blob_get(line));
 	}
 }
@@ -1388,6 +1420,7 @@ static void scmi_telemetry_blkts_unlink(struct telemetry_de *tde)
 	if (!tde->bts)
 		return;
 
+	guard(mutex)(&tde->bts->line.mtx);
 	scmi_telemetry_line_put(&tde->bts->line);
 	tde->bts = NULL;
 	trace_scmi_tlm_access(tde->de.info->id, "BLKTS_UNLINK", 0, 0);
@@ -1398,6 +1431,7 @@ static void scmi_telemetry_uuid_unlink(struct telemetry_de *tde)
 	if (!tde->uuid)
 		return;
 
+	guard(mutex)(&tde->uuid->line.mtx);
 	scmi_telemetry_line_put(&tde->uuid->line);
 	/* Ensure UUID is visible once nullified */
 	smp_store_release(&tde->uuid, NULL);
@@ -1414,13 +1448,15 @@ static void scmi_telemetry_de_unlink(struct scmi_telemetry_de *de)
 }
 
 static struct telemetry_line *
-scmi_telemetry_line_get(struct xarray *xa_lines, struct payload __iomem *payld)
+scmi_telemetry_line_get(struct telemetry_info *ti, struct payload __iomem *payld)
 {
 	struct telemetry_line *line;
 
-	line = xa_load(xa_lines, (unsigned long)payld);
-	if (!line)
-		return NULL;
+	scoped_guard(mutex, &ti->lines_mtx) {
+		line = xa_load(&ti->xa_lines, (unsigned long)payld);
+		if (!line)
+			return NULL;
+	}
 
 	refcount_inc(&line->users);
 
@@ -1428,17 +1464,17 @@ scmi_telemetry_line_get(struct xarray *xa_lines, struct payload __iomem *payld)
 }
 
 static int
-scmi_telemetry_line_init(struct telemetry_line *line, struct xarray *xa_lines,
-			 struct payload __iomem *payld,
-			 enum tdcf_line_types type)
+scmi_telemetry_line_init(struct telemetry_info *ti, struct telemetry_line *line,
+			 struct payload __iomem *payld, enum tdcf_line_types type)
 {
 	line->type = type;
 	refcount_set(&line->users, 1);
 	line->payld = payld;
-	line->xa_lines = xa_lines;
+	line->ti = ti;
 	mutex_init(&line->mtx);
 
-	return xa_insert(xa_lines, (unsigned long)payld, line, GFP_KERNEL);
+	guard(mutex)(&ti->lines_mtx);
+	return xa_insert(&ti->xa_lines, (unsigned long)payld, line, GFP_KERNEL);
 }
 
 static struct telemetry_block_ts *
@@ -1452,8 +1488,7 @@ scmi_telemetry_blkts_create(struct telemetry_info *ti,
 	if (!bts)
 		return NULL;
 
-	ret = scmi_telemetry_line_init(&bts->line, &ti->xa_lines, payld,
-				       TDCF_BLK_TS_LINE);
+	ret = scmi_telemetry_line_init(ti, &bts->line, payld, TDCF_BLK_TS_LINE);
 	if (ret) {
 		kfree(bts);
 		return NULL;
@@ -1470,8 +1505,7 @@ scmi_telemetry_blkts_get_or_create(struct telemetry_info *ti,
 {
 	struct telemetry_line *line;
 
-	guard(mutex)(&ti->lines_mtx);
-	line = scmi_telemetry_line_get(&ti->xa_lines, payld);
+	line = scmi_telemetry_line_get(ti, payld);
 	if (line)
 		return to_blkts(line);
 
@@ -1501,7 +1535,7 @@ static int scmi_telemetry_uuids_update(struct telemetry_info *ti,
 	}
 
 	/* Bump refcount on this line ... cannot fail by construction */
-	scmi_telemetry_line_get(&ti->xa_lines, uuid->line.payld);
+	scmi_telemetry_line_get(ti, uuid->line.payld);
 
 	ti->info.uuids[ti->info.num_uuids] = &uuid->uuid;
 	ti->info.num_uuids++;
@@ -1538,8 +1572,7 @@ scmi_telemetry_uuid_create(struct telemetry_info *ti,
 		import_uuid(&uuid->uuid, (__force const __u8 *)&dwords[0]);
 	}
 
-	ret = scmi_telemetry_line_init(&uuid->line, &ti->xa_lines, payld,
-				       TDCF_UUID_LINE);
+	ret = scmi_telemetry_line_init(ti, &uuid->line, payld, TDCF_UUID_LINE);
 	if (ret) {
 		kfree(uuid);
 		return NULL;
@@ -1562,8 +1595,7 @@ scmi_telemetry_uuid_get_or_create(struct telemetry_info *ti,
 {
 	struct telemetry_line *line;
 
-	guard(mutex)(&ti->lines_mtx);
-	line = scmi_telemetry_line_get(&ti->xa_lines, payld);
+	line = scmi_telemetry_line_get(ti, payld);
 	if (line)
 		return to_uuid_from_line(line);
 
@@ -1689,31 +1721,31 @@ scmi_telemetry_tde_allocate(struct telemetry_info *ti, u32 de_id,
 }
 
 static inline void
-scmi_telemetry_line_data_parse(struct telemetry_de *tde, u64 *val, u64 *tstamp,
+scmi_telemetry_line_data_parse(struct telemetry_de *tde,
+			       struct scmi_telemetry_de_sample *sample,
 			       struct payload __iomem *payld, u32 magic)
 {
 	/* Data is always valid since we are NOT handling BLK TS lines here */
-	*val = LINE_DATA_GET(&payld->l);
-	if (tstamp) {
-		if (USE_BLK_TS(payld)) {
-			/* Read out the actual BLK_TS */
-			*tstamp = scmi_telemetry_blkts_read(magic, tde->bts);
-		} else if (LINE_TS_VALID(payld)) {
-			/*
-			 * Note that LINE_TS_VALID implies HAS_LINE_EXT and that
-			 * the per DE line_ts_rate is advertised in the DE
-			 * descriptor.
-			 */
-			*tstamp = LINE_TSTAMP_GET(&payld->tsl);
-		} else {
-			*tstamp = 0;
-		}
+	sample->val = LINE_DATA_GET(&payld->l);
+	if (USE_BLK_TS(payld)) {
+		/* Read out the actual BLK_TS */
+		sample->tstamp = scmi_telemetry_blkts_read(magic, tde->bts);
+	} else if (LINE_TS_VALID(payld)) {
+		/*
+		 * Note that LINE_TS_VALID implies HAS_LINE_EXT and that
+		 * the per DE line_ts_rate is advertised in the DE
+		 * descriptor.
+		 */
+		sample->tstamp = LINE_TSTAMP_GET(&payld->tsl);
+	} else {
+		sample->tstamp = 0;
 	}
 
-	trace_scmi_tlm_collect(tstamp ? *tstamp : 0, tde->de.info->id,
-			       *val, "SHMTI_DE_READ");
+	/* Trace originally read tstamp */
+	trace_scmi_tlm_collect(sample->tstamp, tde->de.info->id,
+			       sample->val, "SHMTI_DE_READ");
 
-	scmi_telemetry_tde_cache_update(tde, *val, tstamp, &magic);
+	scmi_telemetry_tde_cache_update(tde, sample, &magic);
 }
 
 static inline void scmi_telemetry_bts_link(struct telemetry_de *tde,
@@ -1807,9 +1839,9 @@ static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
 					   enum scan_mode mode,
 					   void *active_bts, void *active_uuid)
 {
+	struct scmi_telemetry_de_sample sample = {};
 	bool use_blk_ts = USE_BLK_TS(payld);
 	struct telemetry_de *tde;
-	u64 val, tstamp = 0;
 	u32 de_id;
 
 	de_id = PAYLD_ID(payld);
@@ -1862,9 +1894,8 @@ static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
 	else
 		scmi_telemetry_uuid_link(tde, ti->primary_uuid);
 
-	/* Parse data words */
-	scmi_telemetry_line_data_parse(tde, &val, &tstamp, payld,
-				       shmti->last_magic);
+	/* Parse data words ... only for the sake of updating TDE cache */
+	scmi_telemetry_line_data_parse(tde, &sample, payld, shmti->last_magic);
 }
 
 static int scmi_telemetry_tdcf_line_parse(struct telemetry_info *ti,
@@ -2448,6 +2479,419 @@ scmi_telemetry_collection_configure(const struct scmi_protocol_handle *ph,
 	return ret;
 }
 
+static inline void
+scmi_telemetry_de_data_fc_read(struct telemetry_de *tde,
+			       struct scmi_telemetry_de_sample *sample)
+{
+	struct fc_tsline __iomem *fc = tde->base + tde->offset;
+
+	sample->val = LINE_DATA_GET(fc);
+	sample->tstamp = tde->ts_type == TSTAMP_LINE ? LINE_TSTAMP_GET(fc) : 0;
+
+	/* Trace originally read tstamp */
+	trace_scmi_tlm_collect(sample->tstamp, tde->de.info->id, sample->val,
+			       "FC_READ");
+
+	scmi_telemetry_tde_cache_update(tde, sample, NULL);
+}
+
+static void scmi_telemetry_scan_update(struct telemetry_info *ti)
+{
+	struct telemetry_de *tde;
+
+	/* Scan all SHMTIs ... */
+	for (int id = 0; id < ti->num_shmti; id++) {
+		int ret;
+
+		ret = scmi_telemetry_shmti_scan(ti, id, SCAN_LOOKUP);
+		if (ret)
+			dev_warn(ti->ph->dev,
+				 "Failed update-scan of SHMTI ID:%d - ret:%d\n",
+				 id, ret);
+	}
+
+	if (!ti->info.fc_support)
+		return;
+
+	/* Need to enumerate resources to access fastchannels */
+	ti->res_get(ti);
+	list_for_each_entry(tde, &ti->fcs_des, item) {
+		struct scmi_telemetry_de_sample sample = {};
+
+		if (!tde->de.enabled)
+			continue;
+
+		/* Only for the sake of updating TDE cache */
+		scmi_telemetry_de_data_fc_read(tde, &sample);
+	}
+}
+
+/*
+ * TDCF and TS Line Management Notes
+ * ---------------------------------
+ *
+ * TDCF Payload Metadata notable bits:
+ *  - Bit[3]: USE BLK Tstamp
+ *  - Bit[2]: Line-Extension Field present (LineTstamp)
+ *  - Bit[1]: Tstamp VALID
+ *  - Bit[0]: Data INVALID
+ *
+ * CASE_1:
+ * -------
+ *	+ A DE is enabled with timestamp disabled, so the TS fields are
+ *	  NOT present
+ *	  -> BIT[3:0] = 0000b
+ *
+ *	  - 1/A LINE_TSTAMP
+ *	  ------------------
+ *	     + that DE is then 're-enabled' with TS: so it was ON, it remains
+ *	       ON but using DE_CONFIGURE I now enabled also TS, so the
+ *	       platform relocates it at the end of the SHMTI and return the
+ *	       new offset
+ *	       -> BIT[3:0] = 0110b
+ *
+ *	  - 1/B BLK_TSTAMP
+ *	  ------------------
+ *	     + that DE is then 're-enabled' with BLK TS: so it was ON, it
+ *	       remains ON but using DE_CONFIGURE, we now also enabled the TS,
+ *	       so the platform will:
+ *	       - IF a preceding BLK_TS line exist (with same clk rate)
+ *	         it relocates the DE at the end of the SHMTI and return the
+ *	         new offset (if there is enough room, if not in another SHMTI)
+ *	       - IF a preceding BLK_TS line DOES NOT exist (with same clk rate)
+ *	         it creates a new BLK_TS line at the end of the SHMTI and then
+ *	         relocates the DE after the new BLK_TS and return the
+ *	         new offset (if there is enough room, if not in another SHMTI)
+ *	       -> BIT[3:1] = 1010b
+ *
+ *	+ the hole left from the relocated DE can be reused by the platform
+ *	to fit another equally sized DE. (i.e. without shuffling around any
+ *	other enabled DE, since that would cause a change of the known offset)
+ *	anyway it will be marked as:
+ *	-> BIT[3:0] = 0101b iff it was a LINE_TSTAMP
+ *	-> BIT[3:0] = 0001b iff it was a BLK_TSTAMP
+ *
+ * CASE_2:
+ * -------
+ *	+ A DE is enabled with LINE timestamp enabled, so the TS_Line is there
+ *	  -> BIT[3:0] = 0110b
+ *	+ that DE has its timestamp disabled: again, you can do this without
+ *	  disabling it fully but just disabling the TS, so now that TS_line
+ *	  fields are still physically there but NOT valid
+ *	  -> BIT[3:0] = 0100b
+ *	+ the hole from the timestamp remain there unused until
+ *		- you enable again the TS so the hole is used again
+ *		  -> BIT[3:0] = 0110b
+ *			OR
+ *		- you disable fully the DE and then re-enable it with the TS
+ *		  -> potentially CASE_1 the DE is relocated on enable
+ *	+ same kind of dynamic applies if the DE had a BLK_TS line
+ */
+static struct payload __iomem *
+scmi_telemetry_tdcf_de_payld_get(struct telemetry_de *tde)
+{
+	struct payload __iomem *payld;
+
+	payld = tde->base + tde->offset;
+	if (DATA_INVALID(payld)) {
+		trace_scmi_tlm_access(PAYLD_ID(payld), "DE_DATA_INVALID", 0, 0);
+		return IOMEM_ERR_PTR(-EINVAL);
+	}
+
+	if (IS_BLK_TS_LINE(payld)) {
+		trace_scmi_tlm_access(tde->de.info->id, "BAD_DE_META", 0, 0);
+		return IOMEM_ERR_PTR(-EPROTO);
+	}
+
+	if (PAYLD_ID(payld) != tde->de.info->id) {
+		trace_scmi_tlm_access(tde->de.info->id, "DE_ID_MISMATCH", 0, 0);
+		return IOMEM_ERR_PTR(-ENODEV);
+	}
+
+	/*
+	 * A valid line using BLK_TS should have been initialized with the
+	 * related BLK_TS when enabled.
+	 */
+	if (WARN_ON((USE_BLK_TS(payld) && !tde->bts))) {
+		trace_scmi_tlm_access(tde->de.info->id, "BAD_USE_BLK_TS", 0, 0);
+		return IOMEM_ERR_PTR(-EPROTO);
+	}
+
+	return payld;
+}
+
+static int
+scmi_telemetry_tdcf_de_parse(struct telemetry_de *tde,
+			     struct scmi_telemetry_de_sample *sample)
+{
+	int retries = SCMI_TLM_TDCF_MAX_RETRIES;
+	struct tdcf __iomem *tdcf = tde->base;
+	u32 startm = 0, endm = TDCF_BAD_END_SEQ;
+
+	if (!tdcf)
+		return -ENODEV;
+
+	do {
+		struct payload __iomem *payld;
+		int err;
+
+		/* A bit of exponential backoff between retries */
+		fsleep((SCMI_TLM_TDCF_MAX_RETRIES - retries) * 1000);
+
+		startm = TDCF_START_SEQ_GET(tdcf);
+		if (IS_BAD_START_SEQ(startm)) {
+			trace_scmi_tlm_access(tde->de.info->id, "MSEQ_BADSTART",
+					      startm, 0);
+			continue;
+		}
+
+		/* Return last readings if nothing changed */
+		err = scmi_telemetry_tde_cache_lookup(tde, sample, &startm);
+		if (!err)
+			return 0;
+
+		/* Retry also when payld get gave a transient error (-EINVAL) */
+		payld = scmi_telemetry_tdcf_de_payld_get(tde);
+		if (!IS_ERR(payld))
+			scmi_telemetry_line_data_parse(tde, sample, payld, startm);
+		else if (PTR_ERR(payld) != -EINVAL)
+			return PTR_ERR(payld);
+
+		endm = TDCF_END_SEQ_GET(tde->eplg);
+		if (startm != endm)
+			trace_scmi_tlm_access(tde->de.info->id, "MSEQ_MISMATCH",
+					      startm, endm);
+	} while (startm != endm && --retries);
+
+	if (startm != endm) {
+		trace_scmi_tlm_access(tde->de.info->id, "TDCF_DE_FAIL",
+				      startm, endm);
+		return -EPROTO;
+	}
+
+	return 0;
+}
+
+static int scmi_telemetry_de_access(struct telemetry_de *tde,
+				    struct scmi_telemetry_de_sample *sample)
+{
+	if (!tde->de.fc_support)
+		return scmi_telemetry_tdcf_de_parse(tde, sample);
+
+	scmi_telemetry_de_data_fc_read(tde, sample);
+
+	return 0;
+}
+
+static int scmi_telemetry_de_collect(struct telemetry_info *ti,
+				     struct scmi_telemetry_de *de,
+				     struct scmi_telemetry_de_sample *sample)
+{
+	struct telemetry_de *tde = to_tde(de);
+
+	if (!de->enabled)
+		return -ENODATA;
+
+	/*
+	 * DE readings returns cached values when:
+	 *  - DE data value was retrieved via notification/delayed_response
+	 */
+	if (tde->cached_msg)
+		return scmi_telemetry_tde_cache_lookup(tde, sample, NULL);
+
+	return scmi_telemetry_de_access(tde, sample);
+}
+
+static int scmi_telemetry_de_data_read(const struct scmi_protocol_handle *ph,
+				       struct scmi_telemetry_de_sample *sample)
+{
+	struct telemetry_info *ti = ph->get_priv(ph);
+	struct scmi_telemetry_de *de;
+
+	if (!ti->info.enabled || !sample)
+		return -ENODATA;
+
+	de = xa_load(&ti->xa_des, sample->id);
+	if (!de)
+		return -ENOENT;
+
+	return scmi_telemetry_de_collect(ti, de, sample);
+}
+
+static int
+scmi_telemetry_samples_collect(struct telemetry_info *ti, int grp_id,
+			       int *num_samples,
+			       struct scmi_telemetry_de_sample *samples)
+{
+	struct scmi_telemetry_res_info *rinfo;
+	int max_samples;
+
+	max_samples = *num_samples;
+	*num_samples = 0;
+
+	rinfo = ti->res_get(ti);
+	for (int i = 0; i < rinfo->num_des; i++) {
+		struct scmi_telemetry_de *de;
+
+		de = rinfo->des[i];
+		/* Skip disabled DEs and not belonging to the selected Group */
+		if (!de->enabled ||
+		    (grp_id != SCMI_TLM_GRP_INVALID &&
+		     (!de->grp || de->grp->info->grp_id != grp_id)))
+			continue;
+
+		/* Must be checked here to skip disabled and non selected */
+		if (*num_samples == max_samples)
+			return -ENOSPC;
+
+		/* Note that this cannot fail when passing a NULL magic */
+		scmi_telemetry_tde_cache_lookup(to_tde(de),
+						&samples[(*num_samples)++], NULL);
+	}
+
+	return 0;
+}
+
+static int scmi_telemetry_des_bulk_read(const struct scmi_protocol_handle *ph,
+					int grp_id, int *num_samples,
+					struct scmi_telemetry_de_sample *samples)
+{
+	struct telemetry_info *ti = ph->get_priv(ph);
+
+	if (!ti->info.enabled || !num_samples || !samples)
+		return -EINVAL;
+
+	/* Trigger a full SHMTIs & FCs scan */
+	scmi_telemetry_scan_update(ti);
+
+	/* Collect all last cached values */
+	return scmi_telemetry_samples_collect(ti, grp_id, num_samples, samples);
+}
+
+static void
+scmi_telemetry_msg_payld_process(struct telemetry_info *ti,
+				 unsigned int num_dwords, __le32 *dwords,
+				 size_t payld_bytes)
+{
+	struct scmi_telemetry_res_info *rinfo;
+	u32 next = 0;
+
+	rinfo = ti->res_get(ti);
+	if (!rinfo->fully_enumerated) {
+		dev_warn_once(ti->ph->dev,
+			      "Cannot process DEs in message payload. Drop.\n");
+		return;
+	}
+
+	while (next < num_dwords) {
+		struct payload *payld = (struct payload *)&dwords[next];
+		struct scmi_telemetry_de *de;
+		struct telemetry_de *tde;
+		u32 de_id, meta = le32_to_cpu(payld->meta);
+		unsigned int wlen;
+
+		wlen = LINE_LENGTH_WORDS_RAW(meta);
+		/* Check Boundary */
+		if (next + wlen > payld_bytes / sizeof(u32))
+			return;
+
+		next += wlen;
+		de_id = le32_to_cpu(payld->id);
+		if (DATA_INVALID_RAW(meta)) {
+			trace_scmi_tlm_access(de_id, "MSG_INVALID", 0, 0);
+			continue;
+		}
+
+		de = xa_load(&ti->xa_des, de_id);
+		if (!de || !de->enabled) {
+			dev_err(ti->ph->dev,
+				"MSG - Received INVALID DE - ID:%u  enabled:%c\n",
+				de_id, de ? (de->enabled ? 'Y' : 'N') : 'X');
+			continue;
+		}
+
+		tde = to_tde(de);
+		guard(mutex)(&tde->mtx);
+		tde->cached_msg = true;
+		tde->last_val = LINE_DATA_GET_RAW(&payld->tsl);
+		/* TODO BLK_TS in notification payloads */
+		tde->last_ts = HAS_LINE_EXT_RAW(meta) &&
+			LINE_TS_VALID_RAW(meta) ?
+			LINE_TSTAMP_GET_RAW(&payld->tsl) : 0;
+
+		trace_scmi_tlm_collect(tde->last_ts, tde->de.info->id,
+				       tde->last_val, "MESSAGE");
+	}
+}
+
+static int scmi_telemetry_des_sample_get(const struct scmi_protocol_handle *ph,
+					 int grp_id, int *num_samples,
+					 struct scmi_telemetry_de_sample *samples)
+{
+	struct telemetry_info *ti = ph->get_priv(ph);
+	struct scmi_msg_telemetry_config_set *msg;
+	struct scmi_xfer *t;
+	bool is_group;
+	u32 control;
+	int ret;
+
+	if (!ti->info.enabled || !num_samples || !samples)
+		return -EINVAL;
+
+	is_group = grp_id != SCMI_TLM_GRP_INVALID;
+	if (is_group && grp_id >= ti->info.base.num_groups)
+		return -EINVAL;
+
+	ret = ph->xops->xfer_get_init(ph, TELEMETRY_CONFIG_SET,
+				      sizeof(*msg), 0, &t);
+	if (ret)
+		return ret;
+
+	msg = t->tx.buf;
+	msg->grp_id = cpu_to_le32(grp_id);
+	control = TELEMETRY_ENABLE;
+	control |= !is_group ? TELEMETRY_SET_SELECTOR_ALL :
+		TELEMETRY_SET_SELECTOR_GROUP;
+	control |= TELEMETRY_MODE_SINGLE;
+	msg->control = cpu_to_le32(control);
+	msg->sampling_rate = 0;
+
+	ret = ph->xops->do_xfer_with_response(ph, t);
+	if (!ret) {
+		struct scmi_msg_resp_telemetry_reading_complete *r = t->rx.buf;
+		u32 num_dwords = le32_to_cpu(r->num_dwords);
+
+		/* Update cached DEs values from payload */
+		if (num_dwords) {
+			size_t payld_sz = sizeof(*r) +
+				num_dwords * sizeof(r->dwords[0]);
+
+			if (payld_sz > t->rx.len) {
+				dev_err(ph->dev,
+					"Malformed Telemetry delayed response - num_dwords:%u  payld_sz:%zd  rx_len:%zd\n",
+					num_dwords, payld_sz, t->rx.len);
+				ret = -EPROTO;
+				goto out;
+			}
+
+			scmi_telemetry_msg_payld_process(ti, num_dwords, r->dwords,
+							 payld_sz - sizeof(*r));
+		}
+
+		/* Scan and update SMHTIs and FCs */
+		scmi_telemetry_scan_update(ti);
+
+		/* Collect all last cached values */
+		ret = scmi_telemetry_samples_collect(ti, grp_id, num_samples,
+						     samples);
+	}
+
+out:
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
 static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
 	.info_get = scmi_telemetry_info_get,
 	.de_lookup = scmi_telemetry_de_lookup,
@@ -2455,6 +2899,9 @@ static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
 	.state_get = scmi_telemetry_state_get,
 	.state_set = scmi_telemetry_state_set,
 	.collection_configure = scmi_telemetry_collection_configure,
+	.de_data_read = scmi_telemetry_de_data_read,
+	.des_bulk_read = scmi_telemetry_des_bulk_read,
+	.des_sample_get = scmi_telemetry_des_sample_get,
 };
 
 /**
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 15a0aa3d9e3a..96940d6e80a4 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -987,6 +987,13 @@ struct scmi_telemetry_info {
 	enum scmi_telemetry_collection current_mode;
 };
 
+struct scmi_telemetry_de_sample {
+	unsigned int id;
+	unsigned int pad;
+	unsigned long long tstamp;
+	unsigned long long val;
+};
+
 /**
  * struct scmi_telemetry_proto_ops - represents the various operations provided
  *	by SCMI Telemetry Protocol
@@ -1000,6 +1007,15 @@ struct scmi_telemetry_info {
  * @collection_configure: choose a sampling rate and enable SHMTI/FC sampling
  *			  for on demand collection via @de_data_read or async
  *			  notificatioins for all the enabled DEs.
+ * @de_data_read: on-demand read of a single DE and related optional timestamp:
+ *		  the value will be retrieved at the proper SHMTI offset OR
+ *		  from the dedicated FC area (if supported by that DE).
+ * @des_bulk_read: on-demand read of all the currently enabled DEs, or just
+ *		   the ones belonging to a specific group when provided.
+ * @des_sample_get: on-demand read of all the currently enabled DEs, or just
+ *		    the ones belonging to a specific group when provided.
+ *		    This causes an immediate update platform-side of all the
+ *		    enabled DEs.
  */
 struct scmi_telemetry_proto_ops {
 	const struct scmi_telemetry_info __must_check *(*info_get)
@@ -1019,6 +1035,14 @@ struct scmi_telemetry_proto_ops {
 				    unsigned int res_id, const bool *enable,
 				    const unsigned int *update_interval_ms,
 				    const enum scmi_telemetry_collection *mode);
+	int __must_check (*de_data_read)(const struct scmi_protocol_handle *ph,
+					 struct scmi_telemetry_de_sample *sample);
+	int __must_check (*des_bulk_read)(const struct scmi_protocol_handle *ph,
+					  int grp_id, int *num_samples,
+					  struct scmi_telemetry_de_sample *samples);
+	int __must_check (*des_sample_get)(const struct scmi_protocol_handle *ph,
+					   int grp_id, int *num_samples,
+					   struct scmi_telemetry_de_sample *samples);
 };
 
 /**
-- 
2.54.0

