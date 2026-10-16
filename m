Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51AA75AEC54;
	Fri, 16 Oct 2026 18:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792177048; cv=none; b=PMKa3+TyA6sIwmqVFmJViEEQWqE9AGDk77qakwXKGe7ktl4Exjg/TO0Udh64GDR1WM33tEdleXx4VTXLbgnVyKXbvWeBjFJ8bFXsffcTcz7hfaAhoFTXHbvd9XWLKUMI2B2k6ufyT/qXosxJ3N6EpT0AZ4oKh7F6XZ7ptQa5suk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792177048; c=relaxed/simple;
	bh=DS+x/z/5JmCmMX1bVLQf07fuAxy4//d4A5+5tOZGWYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XKxTm3qWlRsb4TMJqZQ9hGRmrFqL0hocdcWsNFccv48aaKvoxmH0hq2pBS4hzIyNgBZnOwQGmgz9qaXUS36KPf4sMRW40IU7t98WMCx3NuuyX2cpFg9olxY2PbZ0GkzEKWEHd/fuseMBMK03PA/+3Q81kRPnwToG14H83z0DxC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=szUwWjDM; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="szUwWjDM"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D1F11516;
	Fri, 16 Oct 2026 11:57:21 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E2E23F7B4;
	Fri, 16 Oct 2026 11:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792177044; bh=DS+x/z/5JmCmMX1bVLQf07fuAxy4//d4A5+5tOZGWYQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=szUwWjDMxofHGWujY5GUncFpOsl+2eeliALKmQnR2+utW7J9LSqkONH0StLQlKZv+
	 nmWuXHc8or2glPp2jipkS5jYXLVFBoo1Uy6fcwNIFBL4V3lEz5elrmCnOSa6JnBJlc
	 BqrMbujEDXZ1rfC6wSSD9X+fXCzSQtjtgTqHcsX4=
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
Subject: [PATCH v14 13/32] firmware: arm_scmi: Add Telemetry TDCF parsing for BLK_TS lines
Date: Fri, 16 Oct 2026 19:55:34 +0100
Message-ID: <20261016185553.2794459-14-cristian.marussi@arm.com>
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

Add support to parse, track and link TDCF BLK_TS lines to the related
discovered DataEvents.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v13 --> v14
 - split out of previous single patch implementing parse SHMTI routines
---
 drivers/firmware/arm_scmi/telemetry.c | 288 +++++++++++++++++++++++++-
 1 file changed, 287 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 04481a3df587..69bed616fa04 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -12,6 +12,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
+#include <linux/hash.h>
 #include <linux/io.h>
 #include <linux/limits.h>
 #include <linux/minmax.h>
@@ -157,6 +158,11 @@ struct line {
 	__le32 data_high;
 };
 
+struct blk_tsline {
+	__le32 ts_low;
+	__le32 ts_high;
+};
+
 struct tsline {
 	__le32 data_low;
 	__le32 data_high;
@@ -234,6 +240,7 @@ struct payload {
 	union {
 		struct line l;
 		struct tsline tsl;
+		struct blk_tsline blk_tsl;
 	};
 };
 
@@ -390,6 +397,9 @@ struct telemetry_info {
 	struct telemetry_de *tdes;
 	struct scmi_telemetry_group *grps;
 	struct xarray xa_des;
+	/* Mutex to protect @xa_lines */
+	struct mutex lines_mtx;
+	struct xarray xa_lines;
 	/* Mutex to protect access to @free_des */
 	struct mutex free_mtx;
 	struct list_head free_des;
@@ -398,6 +408,7 @@ struct telemetry_info {
 	atomic_t rinfo_initializing;
 	struct completion rinfo_initdone;
 	#define PAYLD_HASH_BITS  4
+	struct mutex payld_locks[1 << PAYLD_HASH_BITS];
 	struct scmi_telemetry_res_info *rinfo;
 	struct scmi_telemetry_res_info *(*res_get)(struct telemetry_info *ti);
 };
@@ -408,6 +419,12 @@ __scmi_telemetry_resources_get(struct telemetry_info *ti);
 static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
 				     unsigned int shmti_id, enum scan_mode mode);
 
+static inline
+struct mutex *lock_for_payld(struct mutex *locks, struct payload __iomem *payld)
+{
+	return &locks[hash_long((__force unsigned long)payld, PAYLD_HASH_BITS)];
+}
+
 static inline void
 scmi_telemetry_de_state_update(struct telemetry_info *ti, enum de_state state,
 			       bool *current_state, const bool next_state)
@@ -1250,9 +1267,214 @@ scmi_telemetry_resources_get(const struct scmi_protocol_handle *ph)
 static u64
 scmi_telemetry_blkts_read(u32 magic, struct telemetry_de *tde)
 {
+	struct telemetry_block_ts *bts;
+
+	/* Acquiring order is: tde -> line */
 	lockdep_assert_held(&tde->mtx);
+	if (WARN_ON(!tde->bts))
+		return 0;
 
-	return 0;
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
+static inline void scmi_telemetry_line_free(struct telemetry_line *line)
+{
+	void *blob;
+
+	switch (line->type) {
+	case TDCF_BLK_TS_LINE:
+		blob = to_blkts(line);
+		kfree(blob);
+		break;
+	default:
+		dev_warn(line->ti->ph->dev,
+			 "Unknown LINE type %u\n", line->type);
+		break;
+	}
+}
+
+static void __scmi_telemetry_line_put(struct telemetry_line *line)
+{
+	lockdep_assert_held(&line->ti->lines_mtx);
+
+	mutex_lock(&line->mtx);
+	if (refcount_dec_and_test(&line->users)) {
+		xa_erase(&line->ti->xa_lines, (unsigned long)line->payld);
+
+		/* Unlock and free the containing structure: blkts or uuid */
+		mutex_unlock(&line->mtx);
+
+		trace_scmi_tlm_access(0, "DROP_LINE", line->type, line->last_magic);
+		scmi_telemetry_line_free(line);
+
+		return;
+	}
+	mutex_unlock(&line->mtx);
+}
+
+static void scmi_telemetry_line_put(struct telemetry_line *line)
+{
+	/* Acquiring coarse grain first ... */
+	guard(mutex)(&line->ti->lines_mtx);
+	__scmi_telemetry_line_put(line);
+}
+
+static void scmi_telemetry_blkts_unlink(struct telemetry_de *tde)
+{
+	/* Acquiring order is: tde -> line */
+	lockdep_assert_held(&tde->mtx);
+	if (!tde->bts)
+		return;
+
+	scmi_telemetry_line_put(&tde->bts->line);
+	tde->bts = NULL;
+
+	trace_scmi_tlm_access(tde->de.info->id, "BLKTS_UNLINK", 0, 0);
+}
+
+static void scmi_telemetry_de_unlink(struct scmi_telemetry_de *de)
+{
+	struct telemetry_de *tde = to_tde(de);
+
+	lockdep_assert_held(&tde->mtx);
+
+	/* Unlink all related lines triggering their deallocation */
+	scmi_telemetry_blkts_unlink(tde);
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
+
+	line = scmi_telemetry_line_get(ti, payld);
+	if (line)
+		return to_blkts(line);
+
+	return scmi_telemetry_blkts_create(ti, payld);
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
+	struct telemetry_block_ts *bts, *previous = *active_bts;
+
+	/* Check for spec compliance */
+	if (BLK_TS_INVALID(payld)) {
+		trace_scmi_tlm_access(0, "BLK_TS_INVALID", 0, PAYLD_META(payld));
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
+	/* Drop one refcount on the previous active since we found a new one */
+	if (previous)
+		scmi_telemetry_line_put(&previous->line);
+
+	*active_bts = bts;
 }
 
 static inline struct telemetry_de *
@@ -1325,6 +1547,26 @@ scmi_telemetry_line_data_parse(struct telemetry_de *tde, u64 *val, u64 *tstamp,
 	return 0;
 }
 
+static inline void scmi_telemetry_blkts_link(struct telemetry_de *tde,
+					     struct telemetry_block_ts *bts)
+{
+	/* Acquiring order is: tde -> line */
+	lockdep_assert_held(&tde->mtx);
+
+	/* Unlink old stale BTS if existent */
+	scmi_telemetry_blkts_unlink(tde);
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
 /**
  * scmi_telemetry_tdcf_data_parse  - TDCF DataLine parsing
  * @ti: A reference to the telemetry info descriptor
@@ -1378,11 +1620,18 @@ static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
 					   struct telemetry_block_ts *active_bts,
 					   struct telemetry_uuid *active_uuid)
 {
+	bool use_blk_ts = USE_BLK_TS(payld);
 	struct telemetry_de *tde;
 	u64 val, tstamp = 0;
 	u32 de_id;
 
 	de_id = PAYLD_ID(payld);
+	/* Discard malformed lines...a preceding BLK_TS must exist */
+	if (use_blk_ts && !active_bts) {
+		trace_scmi_tlm_access(de_id, "BAD_USE_BLK_TS", 0, 0);
+		return;
+	}
+
 	/* Is this DE ID known ? */
 	tde = scmi_telemetry_tde_lookup(ti, de_id);
 	if (!tde) {
@@ -1417,6 +1666,10 @@ static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
 	if (scmi_telemetry_tde_cache_unchanged(tde, shmti->last_magic))
 		return;
 
+	/* Link the related BTS when needed, it's unlinked on disable */
+	if (use_blk_ts && BLK_TS_CHANGED(tde, active_bts->line.payld))
+		scmi_telemetry_blkts_link(tde, active_bts);
+
 	/*
 	 * Parse data words ... only for the sake of updating TDE cache,
 	 * any error is logged by ignored.
@@ -1468,6 +1721,9 @@ static int scmi_telemetry_tdcf_line_parse(struct telemetry_info *ti,
 		scmi_telemetry_tdcf_data_parse(ti, payld, shmti, mode,
 					       *active_bts, *active_uuid);
 		break;
+	case TDCF_BLK_TS_LINE:
+		scmi_telemetry_tdcf_blkts_parse(ti, payld, shmti, active_bts);
+		break;
 	default:
 		trace_scmi_tlm_access(PAYLD_ID(payld), "TDCF_LINE_UNKNOWN", 0, 0);
 		break;
@@ -1490,6 +1746,21 @@ scmi_telemetry_shmti_overflow(struct telemetry_shmti *shmti, void __iomem *next)
 	return next >= limit;
 }
 
+static inline void
+scmi_telemetry_reset_active_lines(struct telemetry_block_ts **active_bts,
+				  struct telemetry_uuid **active_uuid)
+{
+	if (*active_bts) {
+		scmi_telemetry_line_put(&(*active_bts)->line);
+		*active_bts = NULL;
+	}
+
+	if (*active_uuid) {
+		scmi_telemetry_line_put(&(*active_uuid)->line);
+		*active_uuid = NULL;
+	}
+}
+
 /**
  * scmi_telemetry_shmti_scan  - Full SHMTI scan
  * @ti: A reference to the telemetry info descriptor
@@ -1518,6 +1789,9 @@ static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
 		/* A bit of exponential backoff between retries */
 		fsleep((SCMI_TLM_TDCF_MAX_RETRIES - retries) * SCMI_TLM_TDCF_RETRY_GAP);
 
+		/* Reset line trackers between attempts */
+		scmi_telemetry_reset_active_lines(&active_bts, &active_uuid);
+
 		/*
 		 * Note that during a full SHMTI scan the magic seq numbers are
 		 * checked only at the start and at the end of the scan, NOT
@@ -1571,6 +1845,13 @@ static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
 			trace_scmi_tlm_access(0, "MSEQ_MISMATCH", startm, endm);
 	} while (startm != endm && --retries);
 
+	/*
+	 * Put the initial creation reference so that lines will be
+	 * effectively dropped when there are no more data lines referencing
+	 * them.
+	 */
+	scmi_telemetry_reset_active_lines(&active_bts, &active_uuid);
+
 	if (startm != endm) {
 		trace_scmi_tlm_access(0, "TDCF_SCAN_FAIL", startm, endm);
 		return -EPROTO;
@@ -1711,6 +1992,7 @@ static void scmi_telemetry_tdes_cleanup(struct telemetry_info *ti)
 
 		guard(mutex)(&tde->mtx);
 
+		scmi_telemetry_de_unlink(&tde->de);
 		scmi_telemetry_free_tde_put(ti, tde);
 	}
 
@@ -1834,6 +2116,10 @@ static int scmi_telemetry_instance_init(struct telemetry_info *ti)
 		return ret;
 
 	xa_init(&ti->xa_des);
+	xa_init(&ti->xa_lines);
+	mutex_init(&ti->lines_mtx);
+	for (int i = 0; i < 1 << PAYLD_HASH_BITS; i++)
+		mutex_init(&ti->payld_locks[i]);
 
 	atomic_set(&ti->des_enabled[ENA_STATE], 0);
 	atomic_set(&ti->des_enabled[ENA_TSTAMP], 0);
-- 
2.54.0

