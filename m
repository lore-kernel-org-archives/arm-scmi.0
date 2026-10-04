Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5975841441E;
	Sun,  4 Oct 2026 08:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791100965; cv=none; b=cLQqCkvRiQ38vlojeJxz9R6xmYwzF0r3FBSSAPjvMv05ccoxjgvuaZmHw92SZSkfLnygVta9qQZu7Mbvd7ut1JkL74CT8JLLmBWV3d0Qwmm9kovhLldKeLoPKQQev6PIPrgODxpgnaptHO/N7HDzkXuTAmmlJHht/Tce6uMj+8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791100965; c=relaxed/simple;
	bh=dPySBwQNPprf0+XkVaMYsIHzDBqdza4CuF5L1F6r37s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZukMYyriwwefMgo6i+0YFbwkeJI5Fi8fVVHAILISWasWB97I7RtV0zeIv/xkP5t3/nMRUwbqpQGjPPtBjL4+nYYjGJ7lzuw0rCjNHX/AjVlrE6wt8BfzY55ITdetAbnPY7Q0FNClvA5C2+kZRz2G1Ea/gUKrjTu4czk4OmGoP8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=dR6StVpb; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="dR6StVpb"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D8851691;
	Sun,  4 Oct 2026 01:02:38 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F3FE3F85F;
	Sun,  4 Oct 2026 01:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791100961; bh=dPySBwQNPprf0+XkVaMYsIHzDBqdza4CuF5L1F6r37s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dR6StVpb0Y1C1jHpWqeGoPzo5o/yReMYcULH6CMw9m0w9p7LwnKI6Xgv7aRo2EYOj
	 J4NwkAQmBBQDW109WYzbWlbZZWb0Lfh4LE4yq2NayVLZOb++UsgWx3NG7rhlNMjUvZ
	 4o8uwQvJgwFpGJGhthFnT74evFkxNlZ96YMWPbKI=
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
Subject: [PATCH v13 09/25] firmware: arm_scmi: Add Telemetry DataEvent read capabilities
Date: Sun,  4 Oct 2026 09:00:50 +0100
Message-ID: <20261004080106.3355393-10-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261004080106.3355393-1-cristian.marussi@arm.com>
References: <20261004080106.3355393-1-cristian.marussi@arm.com>
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
v12 --> v13
 - use new RAW macros in line_data_parse and check for line validity
 - handle PARTIAL_ERROR by logging and carrying on
 - relocate tde->mtx guards higher up and add lockdep assertions
 - better tdcf/eplg init within tde->mtx
 - do not cache tde->base between DE read retries
 - retry scan on payld sanity errors
v11 --> v12
 - using new TDCF_INVALID_MATCH_SEQ macro
 - reporting transient DATA_INVALID lines as -EINVAL
 - added cacheable param to msg_payld_process
v10 --> v11
 - split out and relocate unrelated code to previous patches
 - add TDE mutex_lock when getting payload address
 - check LINE_TYPE while parsing payloads
 - check overflows and boundary on single sample replies
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
 drivers/firmware/arm_scmi/telemetry.c | 548 ++++++++++++++++++++++++--
 include/linux/scmi_protocol.h         |  24 ++
 2 files changed, 538 insertions(+), 34 deletions(-)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index f9748af45f0e..e0efaac1f70c 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -668,16 +668,37 @@ scmi_telemetry_tde_cache_unchanged(struct telemetry_de *tde, u32 magic)
 }
 
 static void
-scmi_telemetry_tde_cache_update(struct telemetry_de *tde, u64 val,
-				u64 *tstamp, u32 *magic)
+scmi_telemetry_tde_cache_update(struct telemetry_de *tde,
+				struct scmi_telemetry_de_sample *sample,
+				u32 *magic)
 {
 	lockdep_assert_held(&tde->mtx);
 
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
@@ -1891,7 +1912,8 @@ scmi_telemetry_tde_allocate(struct telemetry_info *ti, u32 de_id,
 }
 
 static inline void
-scmi_telemetry_line_data_parse(struct telemetry_de *tde, u64 *val, u64 *tstamp,
+scmi_telemetry_line_data_parse(struct telemetry_de *tde,
+			       struct scmi_telemetry_de_sample *sample,
 			       struct payload __iomem *payld, u32 magic)
 {
 	u32 meta = PAYLD_META(payld);
@@ -1899,36 +1921,35 @@ scmi_telemetry_line_data_parse(struct telemetry_de *tde, u64 *val, u64 *tstamp,
 	lockdep_assert_held(&tde->mtx);
 
 	/* Clear returned values in case of errors */
-	*val = 0;
+	sample->tstamp = 0;
+	sample->val = 0;
 
-	if (tstamp) {
-		*tstamp = 0;
-		if (USE_BLK_TS_RAW(meta)) {
-			/* Read out the actual BLK_TS */
-			*tstamp = scmi_telemetry_blkts_read(magic, tde);
-		} else if (LINE_TS_VALID_RAW(meta)) {
-			/*
-			 * Note that LINE_TS_VALID implies HAS_LINE_EXT and that
-			 * the per DE line_ts_rate is advertised in the DE
-			 * descriptor, BUT we check anyway against buggy FW.
-			 */
-			if (!HAS_LINE_EXT_RAW(meta)) {
-				trace_scmi_tlm_access(tde->de.info->id,
-						      "SHMTI_BAD_TS_LINE", 0, 0);
-				return;
-			}
-
-			*tstamp = LINE_TSTAMP_GET(&payld->tsl);
+	if (USE_BLK_TS_RAW(meta)) {
+		/* Read out the actual BLK_TS */
+		sample->tstamp = scmi_telemetry_blkts_read(magic, tde);
+	} else if (LINE_TS_VALID_RAW(meta)) {
+		/*
+		 * Note that LINE_TS_VALID implies HAS_LINE_EXT and that
+		 * the per DE line_ts_rate is advertised in the DE
+		 * descriptor, BUT we check anyway against buggy FW.
+		 */
+		if (!HAS_LINE_EXT_RAW(meta)) {
+			trace_scmi_tlm_access(tde->de.info->id,
+					      "SHMTI_BAD_TS_LINE", 0, 0);
+			return;
 		}
+
+		sample->tstamp = LINE_TSTAMP_GET(&payld->tsl);
 	}
 
 	/* Data is always valid since we are NOT handling BLK TS lines here */
-	*val = LINE_DATA_GET(&payld->l);
+	sample->val = LINE_DATA_GET(&payld->l);
 
-	trace_scmi_tlm_collect(tstamp ? *tstamp : 0, tde->de.info->id,
-			       *val, "SHMTI_DE_READ");
+	/* Trace originally read tstamp */
+	trace_scmi_tlm_collect(sample->tstamp, tde->de.info->id,
+			       sample->val, "SHMTI_DE_READ");
 
-	scmi_telemetry_tde_cache_update(tde, *val, tstamp, &magic);
+	scmi_telemetry_tde_cache_update(tde, sample, &magic);
 }
 
 static inline void scmi_telemetry_blkts_link(struct telemetry_de *tde,
@@ -2034,9 +2055,9 @@ static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
 					   struct telemetry_block_ts *active_bts,
 					   struct telemetry_uuid *active_uuid)
 {
+	struct scmi_telemetry_de_sample sample = {};
 	bool use_blk_ts = USE_BLK_TS(payld);
 	struct telemetry_de *tde;
-	u64 val, tstamp = 0;
 	u32 de_id;
 
 	de_id = PAYLD_ID(payld);
@@ -2087,9 +2108,8 @@ static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
 	/* Link the active UUID or the primary, it's unlinked on disable */
 	scmi_telemetry_uuid_link(tde, active_uuid ?: ti->primary_uuid);
 
-	/* Parse data words */
-	scmi_telemetry_line_data_parse(tde, &val, &tstamp, payld,
-				       shmti->last_magic);
+	/* Parse data words ... only for the sake of updating TDE cache */
+	scmi_telemetry_line_data_parse(tde, &sample, payld, shmti->last_magic);
 }
 
 /**
@@ -2866,6 +2886,463 @@ scmi_telemetry_collection_configure(const struct scmi_protocol_handle *ph,
 	return ret;
 }
 
+static inline void
+scmi_telemetry_de_data_fc_read(struct telemetry_de *tde,
+			       struct scmi_telemetry_de_sample *sample)
+{
+	struct fc_tsline __iomem *fc = tde->base + tde->offset;
+
+	lockdep_assert_held(&tde->mtx);
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
+		guard(mutex)(&tde->mtx);
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
+	lockdep_assert_held(&tde->mtx);
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
+	 * related BLK_TS when enabled, unless is a torn read.
+	 */
+	if ((USE_BLK_TS(payld) && !tde->bts)) {
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
+	u32 startm = TDCF_INVALID_MATCH_SEQ, endm = TDCF_BAD_END_SEQ;
+	int retries = SCMI_TLM_TDCF_MAX_RETRIES;
+	struct tdcf __iomem *tdcf;
+	int err = 0;
+
+	lockdep_assert_held(&tde->mtx);
+
+	do {
+		struct payload __iomem *payld;
+
+		/* A bit of exponential backoff between retries */
+		fsleep((SCMI_TLM_TDCF_MAX_RETRIES - retries) * 1000);
+
+		/*
+		 * Refresh tdcf on each retry, since it could have changed
+		 * by the platform while relocating the DE.
+		 */
+		tdcf = tde->base;
+		if (!tdcf)
+			continue;
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
+		/*
+		 * In this context any anomaly detected on the payload could
+		 * due to a torn read, and it is worth a retry.
+		 * Unless the entry was marked as DATA_INVALID (-EINVAL) which
+		 * indicates an entry referring a DE which has been disabled by
+		 * the user or some other sort of error platform side: if we
+		 * get all down here, though, it cannot be due to a disabled DE,
+		 * so bail-out to avoid retrying on permament/transient errors.
+		 */
+		payld = scmi_telemetry_tdcf_de_payld_get(tde);
+		err = PTR_ERR_OR_ZERO(payld);
+		if (!err)
+			scmi_telemetry_line_data_parse(tde, sample, payld, startm);
+		else if (err == -EINVAL)
+			return err;
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
+	return err;
+}
+
+static int scmi_telemetry_de_access(struct telemetry_de *tde,
+				    struct scmi_telemetry_de_sample *sample)
+{
+	lockdep_assert_held(&tde->mtx);
+
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
+	guard(mutex)(&tde->mtx);
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
+		struct telemetry_de *tde = to_tde(rinfo->des[i]);
+
+		guard(mutex)(&tde->mtx);
+
+		/* Skip disabled DEs and not belonging to the selected Group */
+		if (!tde->de.enabled ||
+		    (grp_id != SCMI_TLM_GRP_INVALID &&
+		     (!tde->de.grp || tde->de.grp->info->grp_id != grp_id)))
+			continue;
+
+		/* Must be checked here to skip disabled and non selected */
+		if (*num_samples == max_samples)
+			return -ENOSPC;
+
+		/* Note that this cannot fail when passing a NULL magic */
+		scmi_telemetry_tde_cache_lookup(tde, &samples[(*num_samples)++], NULL);
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
+				 size_t payld_bytes, bool cacheable)
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
+		if (LINE_TYPE_RAW(meta) != TDCF_DATA_LINE) {
+			trace_scmi_tlm_access(de_id, "MSG_BAD_TYPE", 0, 0);
+			continue;
+		}
+
+		if (USE_BLK_TS_RAW(meta)) {
+			trace_scmi_tlm_access(de_id, "MSG_BAD_USE_BLKTS", 0, 0);
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
+	/*
+	 * PARTIAL_ERRORs are reported as -EBADMSG and related lines,
+	 * marked as DATA_INVALID, will be properly skipped by
+	 * scmi_telemetry_msg_payld_process.
+	 */
+	if (!ret || ret == -EBADMSG) {
+		struct scmi_msg_resp_telemetry_reading_complete *r = t->rx.buf;
+		u32 num_dwords = le32_to_cpu(r->num_dwords);
+
+		if (ret == -EBADMSG)
+			trace_scmi_tlm_access(0, "BAD_SAMPLE_PARTIAL_ERROR", 0, 0);
+
+		/* Update cached DEs values from payload */
+		if (num_dwords) {
+			size_t payld_sz = 0, dwords_sz;
+
+			if (check_mul_overflow(num_dwords, sizeof(r->dwords[0]), &dwords_sz) ||
+			    check_add_overflow(sizeof(*r), dwords_sz, &payld_sz) ||
+			    payld_sz > t->rx.len) {
+				dev_err(ph->dev,
+					"Malformed Telemetry delayed response - num_dwords:%u  payld_sz:%zd  rx_len:%zd\n",
+					num_dwords, payld_sz, t->rx.len);
+				ret = -EPROTO;
+				goto out;
+			}
+
+			scmi_telemetry_msg_payld_process(ti, num_dwords, r->dwords,
+							 payld_sz - sizeof(*r), false);
+		}
+
+		/* Scan and update SMHTIs and FCs */
+		scmi_telemetry_scan_update(ti);
+
+		/* Collect all last cached values, override any PARTIAL_ERROR */
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
@@ -2873,6 +3350,9 @@ static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
 	.state_get = scmi_telemetry_state_get,
 	.state_set = scmi_telemetry_state_set,
 	.collection_configure = scmi_telemetry_collection_configure,
+	.de_data_read = scmi_telemetry_de_data_read,
+	.des_bulk_read = scmi_telemetry_des_bulk_read,
+	.des_sample_get = scmi_telemetry_des_sample_get,
 };
 
 /**
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index cadb7610c98f..52c9031c266b 100644
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

