Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795304654;
	b=XE+Hb+93gpyfhgAsl09dr1mujsWeHXFdJ8ubnDry22TL/4kSkhZZlrCGceFAl5OS+6tM
	 xWKx5LX8UfxO7OobLQ1mf2dRpFjFajlFXLujhaEKrSo7ihdR5AeJVDVgYRf/LUCbQPZ43
	 PMB9tXqDUwaF+4dwHwwL+YIoQFvDAtETO9b0jSlypr8LoICKTi+abuU/6vmyi8/nXwR3b
	 GyQAB3Rmo308b2jWzWxLwvbWVx7uy1SyXXxHh5LDnu8fkMLwoEp0aKI8g7Vs1LRFkiWrg
	 FDfid9ag+rb1w2l6BLaTNOUSCNiejEAlPOJFwbzKGRO6ZRSHUvhsdjpePFnJch00eDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795304654;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jaBjYmBdElqa4mMzlABtn/SoY1106vU3rQxUBC2ZKsE=;
	b=fJ+5MNbitbxzXgu2UnEG3YepitPpvGZj/3PucuipPDEB+YcSngCUCgGjPgJr7155RDEh
	 UUgrzyC+QM2aAx+c37jKMxkSWQPPUeFqVh9JNQMmPf6P0QnJ7hFc/MAAJtXAwFqt2Xb74
	 fGFGta+ouvWmJvgFlcz4nqT0O/XAhnKoeKDc/R/794xZ0NEBPykRFHLVErvFzPLckBb3J
	 o1RBCFwEwZEhM5Rx98wQKDKM+QJWybYTm5gTzS6Dl+WjbqnVOCzaztQfbU0fw4KInwAa5
	 2xf5McMiybUUaDn7FecC6A3UjOHhz4yeOXxN7+GbsFRkWguWf1g0rXuhbgie3i9XGXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=gLoCOfkg;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C56D2606A339;
	Sat, 21 Nov 2026 23:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C56D2606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=gLoCOfkg
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38A0A176B;
	Sat, 21 Nov 2026 15:44:10 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5134E3F632;
	Sat, 21 Nov 2026 15:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795304653; bh=yPXlbyxfPszypBVLAU4x3PWP87zfD02iDfGeiOOrzpg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gLoCOfkgm+2gEHJZc2jE+eYtvDywMaDCYLZSBPd245vYUtQcnkj++/il2brRfRErC
	 mRakaXyYiZCTYHtP4e5Qfg2SG5LsJoW1N63OvZOD3rPbGXIHKg5cKCN+XscsjBvgyX
	 6qKc3C3iLClJKe0wJ7F+4bCF1P20GmPxgl1MWz5U=
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
Subject: [PATCH v16 15/31] firmware: arm_scmi: Add Telemetry TDCF parsing for BLK_TS lines
Date: Sat, 21 Nov 2026 23:39:49 +0000
Message-ID: <20261121234005.1525419-16-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261121234005.1525419-1-cristian.marussi@arm.com>
References: <20261121234005.1525419-1-cristian.marussi@arm.com>
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support to parse, track and link TDCF BLK_TS lines to the related
discovered DataEvents.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v15 --> v16
 - WARN_ON(BLK_TS_INVALID) but keep active_bts valid
 - invalidate TDE cache on blkts_unlin
 - cleanup stale lines on shmti cleanup
v14 --> v15
 - use proper cast on tlm_collect
 - use snapshots to track and collect BLK_TS during full scan bulk reads
 - fix too early invocation xa_destroy(xa_lines)
v13 --> v14
 - split out of previous single patch implementing parse SHMTI routines
---
 drivers/firmware/arm_scmi/telemetry.c | 341 +++++++++++++++++++++++++-
 1 file changed, 334 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 4790929d10be..eea070fd0cd1 100644
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
@@ -159,6 +160,11 @@ struct line {
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
@@ -263,6 +269,7 @@ struct payload {
 	union {
 		struct line l;
 		struct tsline tsl;
+		struct blk_tsline blk_tsl;
 	};
 };
 
@@ -471,6 +478,10 @@ struct telemetry_info {
 	struct scmi_telemetry_res_info *(*res_get)(struct telemetry_info *ti);
 };
 
+static void __scmi_telemetry_line_put(struct telemetry_line *line);
+
+static void scmi_telemetry_de_unlink(struct scmi_telemetry_de *de);
+
 static struct scmi_telemetry_res_info *
 __scmi_telemetry_resources_get(struct telemetry_info *ti);
 
@@ -479,6 +490,12 @@ static inline struct tdcf *snap_tdcf(struct shmti_snap *s);
 static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
 				     unsigned int shmti_id, enum scan_mode mode);
 
+static inline
+struct mutex *lock_for_payld(struct mutex *locks, unsigned long offset)
+{
+	return &locks[hash_long(offset, PAYLD_HASH_BITS)];
+}
+
 static inline void
 scmi_telemetry_de_state_update(struct telemetry_info *ti, enum de_state state,
 			       bool *current_state, const bool next_state)
@@ -610,6 +627,14 @@ static int scmi_telemetry_tde_register(struct telemetry_info *ti,
 	return ret;
 }
 
+static inline void scmi_telemetry_tde_cache_invalidate(struct telemetry_de *tde)
+{
+	lockdep_assert_held(&tde->mtx);
+
+	/* Invalidate cache */
+	tde->last_magic = TDCF_BAD_END_SEQ;
+}
+
 static inline bool
 scmi_telemetry_tde_cache_stale(struct telemetry_de *tde, const u32 magic)
 {
@@ -958,11 +983,18 @@ static void scmi_telemetry_tdes_cleanup(void *arg)
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
 
 		guard(mutex)(&tde->mtx);
 
+		scmi_telemetry_de_unlink(&tde->de);
 		scmi_telemetry_free_tde_put(ti, tde);
 	}
 }
@@ -996,7 +1028,7 @@ static int scmi_telemetry_de_descriptors_get(struct telemetry_info *ti)
 	if (ret)
 		return ret;
 
-	return devm_add_action_or_reset(ph->dev, scmi_telemetry_tdes_cleanup, ti);
+	return 0;
 }
 
 struct scmi_tlm_ivl_priv {
@@ -1270,16 +1302,29 @@ static int scmi_telemetry_shmti_list(const struct scmi_protocol_handle *ph,
 	return 0;
 }
 
+static void scmi_telemetry_shmti_lines_cleanup(struct telemetry_shmti *shmti)
+{
+	struct telemetry_line *line;
+	unsigned long idx;
+
+	guard(mutex)(&shmti->lines_mtx);
+	/* Drop all remaining currently unbound lines and their containers */
+	xa_for_each(&shmti->xa_lines, idx, line)
+		__scmi_telemetry_line_put(line);
+
+	xa_destroy(&shmti->xa_lines);
+}
+
 static void scmi_telemetry_shmti_cleanup(void *arg)
 {
 	struct telemetry_shmti *shmti = arg;
 
+	scmi_telemetry_shmti_lines_cleanup(shmti);
+
 	cleanup_srcu_struct(&shmti->srcu);
 
 	kvfree(shmti->snaps[0]);
 	kvfree(shmti->snaps[1]);
-
-	xa_destroy(&shmti->xa_lines);
 }
 
 static int scmi_telemetry_shmti_init(struct device *dev,
@@ -1344,7 +1389,7 @@ static int scmi_telemetry_enumerate_shmti(struct telemetry_info *ti)
 	/* Expose the fully initialized SHMTI infos */
 	smp_store_release(&ti->info.base.num_shmtis, ti->num_shmti);
 
-	return 0;
+	return devm_add_action_or_reset(ph->dev, scmi_telemetry_tdes_cleanup, ti);
 }
 
 static const struct scmi_telemetry_info *
@@ -1406,11 +1451,242 @@ scmi_telemetry_payld_offset_safe_calc(struct telemetry_shmti *shmti, u32 offs)
 }
 
 static u64
-scmi_telemetry_blkts_read(u32 magic, struct telemetry_de *tde)
+scmi_telemetry_blkts_read(u32 magic, struct telemetry_de *tde,
+			  struct payload *bts_payld, struct shmti_snap *snap)
 {
+	struct telemetry_block_ts *bts;
+
+	/* Acquiring order is: tde -> line */
 	lockdep_assert_held(&tde->mtx);
+	if (WARN_ON(!tde->bts || (!bts_payld && !snap)))
+		return 0;
 
-	return 0;
+	bts = tde->bts;
+	guard(mutex)(&bts->line.mtx);
+
+	if (bts->line.last_magic == magic)
+		return bts->last_ts;
+
+	/* Unless specified otherwise, use the snapshot BLK_TS paylod */
+	if (!bts_payld) {
+		void *base = snap_tdcf(snap);
+
+		bts_payld = base + bts->line.offset;
+	}
+
+	/* Note that the bts->last_rate can change ONLY on creation */
+	bts->last_ts = BLK_TS_STAMP_RAW(&bts_payld->blk_tsl);
+	bts->line.last_magic = magic;
+
+	return bts->last_ts;
+}
+
+static void
+scmi_telemetry_blkts_update_snap(struct telemetry_info *ti,
+				 struct telemetry_block_ts *bts,
+				 struct payload *bts_payld, u32 magic)
+{
+	guard(mutex)(&bts->line.mtx);
+	if (bts->line.last_magic != magic) {
+		bts->last_ts = BLK_TS_STAMP_RAW(&bts_payld->blk_tsl);
+		bts->last_rate = BLK_TS_RATE_RAW(bts_payld);
+		/* BLK_TS clock rate value can change ONLY here on creation */
+		if (!bts->last_rate)
+			bts->last_rate = ti->default_blk_ts_rate;
+		bts->line.last_magic = magic;
+
+		trace_scmi_tlm_access(0, "BLK_TS_UPDATE", magic, 0);
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
+		WARN_ON(1);
+		break;
+	}
+}
+
+static void __scmi_telemetry_line_put(struct telemetry_line *line)
+{
+	lockdep_assert_held(&line->shmti->lines_mtx);
+
+	mutex_lock(&line->mtx);
+	if (refcount_dec_and_test(&line->users)) {
+		xa_erase(&line->shmti->xa_lines, line->offset);
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
+	guard(mutex)(&line->shmti->lines_mtx);
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
+
+	scmi_telemetry_tde_cache_invalidate(tde);
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
+scmi_telemetry_line_get(struct telemetry_shmti *shmti, unsigned long offset)
+{
+	struct telemetry_line *line;
+
+	/* Acquiring coarse grain first ... */
+	guard(mutex)(&shmti->lines_mtx);
+	line = xa_load(&shmti->xa_lines, offset);
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
+scmi_telemetry_line_init(struct telemetry_shmti *shmti, struct telemetry_line *line,
+			 unsigned long offset, enum tdcf_line_types type)
+{
+	line->type = type;
+	refcount_set(&line->users, 1);
+	line->offset = offset;
+	line->shmti = shmti;
+	mutex_init(&line->mtx);
+
+	guard(mutex)(&shmti->lines_mtx);
+	return xa_insert(&shmti->xa_lines, offset, line, GFP_KERNEL);
+}
+
+static struct telemetry_block_ts *
+scmi_telemetry_blkts_create(struct telemetry_shmti *shmti, unsigned long offset)
+{
+	struct telemetry_block_ts *bts;
+	int ret;
+
+	bts = kzalloc_obj(*bts);
+	if (!bts)
+		return NULL;
+
+	ret = scmi_telemetry_line_init(shmti, &bts->line, offset, TDCF_BLK_TS_LINE);
+	if (ret) {
+		kfree(bts);
+		return NULL;
+	}
+
+	trace_scmi_tlm_collect(0, shmti->info.sid, offset, "SHMTI_NEW_BLKTS");
+
+	return bts;
+}
+
+static struct telemetry_block_ts *
+scmi_telemetry_blkts_get_or_create(struct telemetry_shmti *shmti,
+				   unsigned long offset)
+{
+	struct telemetry_line *line;
+
+	/* Avoid races on line creation for this payld */
+	guard(mutex)(lock_for_payld(shmti->payld_locks, offset));
+
+	line = scmi_telemetry_line_get(shmti, offset);
+	if (line)
+		return to_blkts(line);
+
+	return scmi_telemetry_blkts_create(shmti, offset);
+}
+
+/**
+ * scmi_telemetry_tdcf_blkts_parse  - A BLK_TS line parser
+ *
+ * @ti: A reference to the telemetry_info descriptor
+ * @bts_payld: TDCF payld line to process
+ * @snap: A reference to the working SHMTI snapshot that will be processed
+ * @active_bts: Input/output reference to keep track of the last blk_ts found
+ *
+ * Process a valid TDCF BLK_TS line and, after having looked up or created a
+ * blk_ts descriptor, update the related data and return it as the currently
+ * active blk_ts, given that it is effectively the last found during this
+ * scan.
+ *
+ * Note that the current BLK_TS line could be malformed due to garbage in
+ * the TDCF: in such a case we warn/log and bailout BUT we don't throw away
+ * the currently active_bts (if any) since the current malformed line could
+ * be bogus and never intended to be a BLK_TS line.
+ */
+static void scmi_telemetry_tdcf_blkts_parse(struct telemetry_info *ti,
+					    struct payload *bts_payld,
+					    struct shmti_snap *snap,
+					    struct telemetry_block_ts **active_bts)
+{
+	struct telemetry_block_ts *bts, *previous = *active_bts;
+	struct telemetry_shmti *shmti = snap->shmti;
+	u32 meta = PAYLD_META_RAW(bts_payld);
+	unsigned long offset;
+
+	/* Check for spec compliance. */
+	if (WARN_ON(BLK_TS_INVALID_RAW(meta))) {
+		trace_scmi_tlm_access(0, "BLK_TS_INVALID", 0, meta);
+		return;
+	}
+
+	offset = TDCF_OFFS(snap->base, bts_payld);
+	/* A BLK_TS descriptor MUST be returned: it is found or it is created */
+	bts = scmi_telemetry_blkts_get_or_create(shmti, offset);
+	/*
+	 * On error processing the new BLK_TS bailout taking care to clear
+	 * the previous last active BLK_TS to avoid mistakenly binding to the
+	 * next data lines.
+	 */
+	if (WARN_ON(!bts))
+		goto out;
+
+	/* Update the descriptor with the lastest TS */
+	scmi_telemetry_blkts_update_snap(ti, bts, bts_payld, snap->magic);
+
+out:
+	/* Drop one refcount on the previous active since we found a new one */
+	if (previous)
+		scmi_telemetry_line_put(&previous->line);
+
+	*active_bts = bts;
 }
 
 static inline int
@@ -1429,7 +1705,8 @@ scmi_telemetry_line_data_parse(struct telemetry_de *tde, struct shmti_snap *snap
 		*tstamp = 0;
 		if (USE_BLK_TS_RAW(meta)) {
 			/* Read out the actual BLK_TS */
-			*tstamp = scmi_telemetry_blkts_read(magic, tde);
+			*tstamp = scmi_telemetry_blkts_read(magic, tde,
+							    bts_payld, snap);
 		} else if (LINE_TS_VALID_RAW(meta)) {
 			/*
 			 * Note that LINE_TS_VALID implies HAS_LINE_EXT and that
@@ -1457,6 +1734,26 @@ scmi_telemetry_line_data_parse(struct telemetry_de *tde, struct shmti_snap *snap
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
@@ -1500,11 +1797,19 @@ static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
 					   struct telemetry_uuid *active_uuid)
 {
 	struct telemetry_shmti *shmti = snap->shmti;
+	u32 meta = PAYLD_META_RAW(payld);
+	bool use_blk_ts = USE_BLK_TS_RAW(meta);
 	struct telemetry_de *tde;
 	u64 val, tstamp = 0;
 	u32 de_id;
 
 	de_id = PAYLD_ID_RAW(payld);
+	/* Discard malformed lines...a preceding BLK_TS must exist */
+	if (use_blk_ts && !active_bts) {
+		trace_scmi_tlm_access(de_id, "BAD_USE_BLK_TS", 0, 0);
+		return;
+	}
+
 	/* Is this DE ID known ? */
 	tde = scmi_telemetry_tde_lookup(ti, de_id);
 	if (!tde) {
@@ -1563,6 +1868,15 @@ static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
 	if (!scmi_telemetry_tde_cache_stale(tde, snap->magic))
 		return;
 
+	/*
+	 * Link the related BTS when needed, it's unlinked on disable.
+	 * Note that each DEs timestamp types is statically defined and
+	 * enumerated once for all at init: a Data line cannot suddenly
+	 * 'migrate' to a different timestamp type.
+	 */
+	if (use_blk_ts && BLK_TS_CHANGED(tde, shmti, active_bts->line.offset))
+		scmi_telemetry_blkts_link(tde, active_bts);
+
 	/*
 	 * Parse data words ... only for the sake of updating TDE cache,
 	 * any error is logged by ignored.
@@ -1625,6 +1939,9 @@ static int scmi_telemetry_tdcf_line_parse(struct telemetry_info *ti,
 		scmi_telemetry_tdcf_data_parse(ti, payld, snap, mode,
 					       *active_bts, *active_uuid);
 		break;
+	case TDCF_BLK_TS_LINE:
+		scmi_telemetry_tdcf_blkts_parse(ti, payld, snap, active_bts);
+		break;
 	default:
 		trace_scmi_tlm_access(PAYLD_ID_RAW(payld), "TDCF_LINE_UNKNOWN", 0, 0);
 		break;
@@ -1765,6 +2082,15 @@ scmi_telemetry_shmti_refresh(struct telemetry_shmti *shmti, int *idx)
 	return work;
 }
 
+static inline void
+scmi_telemetry_reset_active_lines(struct telemetry_block_ts **active_bts)
+{
+	if (*active_bts) {
+		scmi_telemetry_line_put(&(*active_bts)->line);
+		*active_bts = NULL;
+	}
+}
+
 /**
  * scmi_telemetry_shmti_scan  - Full SHMTI scan
  * @ti: A reference to the telemetry info descriptor
@@ -1832,6 +2158,7 @@ static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
 		qwords -= used_qwords;
 	}
 
+	scmi_telemetry_reset_active_lines(&active_bts);
 	srcu_read_unlock(&shmti->srcu, idx);
 
 	if (ret)
-- 
2.54.0

