Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215755;
	b=RH+cxeMvzvoxNTlahELZ9hjGInwRCPiS/Vbb8eGNX2W1RaWUDKXRJfL8cNN7+rtVFyLw
	 /NJ6sKhRmn1zeBqln2D8EWuR7yiQc591aNyDnJKXhhzD7UaWpWn2GQcZN/uECQ5S46vCv
	 Ld9VqGHqbGsTKuknmkwFHrz8s9e3i0cJruIcO8spspich13/nZ9jEJ2TCgcjPlmY8k3F+
	 f3BbNFl4LLyDzkW4bRDJO+1Fvagywb2ASRTz8PJjMgQUaYX4pe/6kMoCsMEgD/g5yzq45
	 b/bzJa9+BlBvtx1TYc1A2ISVMa2CvgVg2xi/5GOGoXZ9bwFAHyJ/IZgtot8V41MpLNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215755;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AyIpW8eH61e9AeB9SCGJmhgkbl/82Zp5c93VDtyC5BE=;
	b=YHKxJoo56iVwtGjZ23MtqcdRS+oOaKbaeEiheAUpkZczntbeI6o8jCH0ihWobznpUReB
	 B/gBvPsZ98lM8chDRchWYaSCATTZESQWgU/RzkIpG+teoB1cJGorGDzDsg6Kxyq+9piDW
	 yRDCr4kZIVOPgR+TNOGmpPcTcY3VmkM7h057G+9r881uJfzBTlm0ati+5N+7wdycbslk+
	 ca//Rq70XSSvfLiJ2J7ynhpSQzlAy/hHEP1+JNeQldNj8cieghwTnTDr7rDqFvwQQV+M9
	 3aQ5U3N5KaptWaf7pzz41cp5vYWNHsWg1haE2Kc8vQEs1DSPFEgtOeGaIbFW9UlfzbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=nwDDVGgq;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 216CA6083626;
	Mon,  9 Nov 2026 09:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 216CA6083626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=nwDDVGgq
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5B5515A1;
	Mon,  9 Nov 2026 01:15:50 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C25863FA1F;
	Mon,  9 Nov 2026 01:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794215753; bh=PUSili5RFf7gpMIwxF/gPMYJpl253O16tc2DlysRYs8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nwDDVGgqUb2ygijB6ddCtGOlxQ62hbkO8AARFyymSThi33RQoFfDVN4ud16Lc71Qp
	 YgVoayVu9T5EFztqkmuPcAUZuV060l4f/xq9WWeotta+GQcPemBfk2/7e5BkRKJYuq
	 vN1diod9CERcJFM1JwUDNqtdGRqqCpAVTJOLQuPU=
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
Subject: [PATCH v15 18/35] firmware: arm_scmi: Add Telemetry DataEvent read capabilities
Date: Mon,  9 Nov 2026 09:12:04 +0000
Message-ID: <20261109091221.2532706-19-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109091221.2532706-1-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
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
v14 --> v15
 - use IS_TDE_TS_LINE macro
 - use NOT IS_DATA_LINE in tdcf_de_payld_get
 - use better startm/endm initial markers in tdcf_de_payld_get
 - retry scmi_telemetry_tdcf_de_parse on error too
 - trigger resource enumeration also on de_data_read
 - skip unitialized FCs on reads and return -EPROTO
 - introduce localized single DE snapshot on single DE data read
 - widen tde->mtx locking in msg_payld_process
 - use unsigned int samples
 - better des_sample_get sanity checks
 - refactor msg_payld_process
v13 --> v14
 - report scmi_telemetry_line_data_parse errors
 - add traces for CACHED_DE_UPDATED
 - moved some definitions from earlier patches
 - using a less regular time interval for TDCF scan retries
 - renamed some fields to more strictly adhere to spec nomenclature
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
 drivers/firmware/arm_scmi/telemetry.c | 678 ++++++++++++++++++++++++--
 include/linux/scmi_protocol.h         |  24 +
 2 files changed, 666 insertions(+), 36 deletions(-)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 1f6505fff199..bf37faf99865 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -176,6 +176,11 @@ struct scmi_msg_telemetry_config_set {
 	__le32 sampling_rate;
 };
 
+struct scmi_msg_resp_telemetry_reading_complete {
+	__le32 num_dwords;
+	__le32 array[] __counted_by_le(num_dwords);
+};
+
 /* TDCF */
 
 #define _I(__a)		(ioread32((void __iomem *)(__a)))
@@ -384,6 +389,12 @@ struct tdcf {
 #define TDCF_END_SIGNATURE(e)	(_I(&((e)->sign_end)))
 #define	TDCF_BAD_END_SEQ	GENMASK(31, 0)
 
+struct telemetry_de_snapshot {
+	u32 magic;
+	struct payload payld;
+	struct payload bts_payld;
+};
+
 struct telemetry_shmti;
 
 struct shmti_snap {
@@ -482,6 +493,7 @@ struct telemetry_de {
 	enum timestamps ts_type;
 	u32 ts_rate;
 	bool enumerated;
+	bool cached_msg;
 	void __iomem *base;
 	struct eplg __iomem *eplg;
 	u32 sid;
@@ -695,8 +707,9 @@ scmi_telemetry_tde_cache_stale(struct telemetry_de *tde, u32 magic)
 }
 
 static void
-scmi_telemetry_tde_cache_update(struct telemetry_de *tde, u64 val,
-				u64 *tstamp, u32 *magic)
+scmi_telemetry_tde_cache_update(struct telemetry_de *tde,
+				struct scmi_telemetry_de_sample *sample,
+				u32 *magic)
 {
 	lockdep_assert_held(&tde->mtx);
 
@@ -708,10 +721,37 @@ scmi_telemetry_tde_cache_update(struct telemetry_de *tde, u64 val,
 		return;
 
 	tde->last_magic = magic ? *magic : TDCF_BAD_END_SEQ;
-	tde->last_val = val;
-	tde->last_ts = tstamp && scmi_tde_has_tstamp(tde) ? *tstamp : 0;
-	if (tstamp)
-		*tstamp = tde->last_ts;
+	tde->last_val = sample->val;
+	tde->last_ts = scmi_tde_has_tstamp(tde) ? sample->tstamp : 0;
+	/* Update returned value too */
+	sample->tstamp = tde->last_ts;
+
+	trace_scmi_tlm_collect(tde->last_ts, tde->de.info->id,
+			       tde->last_val, "CACHED_DE_UPDATED");
+}
+
+static int
+scmi_telemetry_tde_cache_lookup(struct telemetry_de *tde,
+				struct scmi_telemetry_de_sample *sample,
+				u32 *magic)
+{
+	lockdep_assert_held(&tde->mtx);
+
+	/*
+	 * Bailout without providing any sample when the cache is
+	 * stale, i.e. last_magic < *magic
+	 */
+	if (magic && scmi_telemetry_tde_cache_stale(tde, *magic))
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
@@ -2068,45 +2108,45 @@ scmi_telemetry_tde_allocate(struct telemetry_info *ti, u32 de_id,
 
 static inline int
 scmi_telemetry_line_data_parse(struct telemetry_de *tde, struct shmti_snap *snap,
-			       u64 *val, u64 *tstamp, struct payload *payld,
-			       struct payload *bts_payld, u32 magic)
+			       struct scmi_telemetry_de_sample *sample,
+			       struct payload *payld, struct payload *bts_payld,
+			       u32 magic)
 {
 	u32 meta = PAYLD_META_RAW(payld);
 
 	lockdep_assert_held(&tde->mtx);
 
 	/* Clear returned values in case of errors */
-	*val = 0;
-
-	if (tstamp) {
-		*tstamp = 0;
-		if (USE_BLK_TS_RAW(meta)) {
-			/* Read out the actual BLK_TS */
-			*tstamp = scmi_telemetry_blkts_read(magic, tde,
-							    bts_payld, snap);
-		} else if (LINE_TS_VALID_RAW(meta)) {
-			/*
-			 * Note that LINE_TS_VALID implies HAS_LINE_EXT and that
-			 * the per DE line_ts_rate is advertised in the DE
-			 * descriptor, BUT we check anyway against buggy FW.
-			 */
-			if (!HAS_LINE_EXT_RAW(meta)) {
-				trace_scmi_tlm_access(tde->de.info->id,
-						      "SHMTI_BAD_TS_LINE", 0, 0);
-				return -EPROTO;
-			}
-
-			*tstamp = LINE_TSTAMP_GET_RAW(&payld->tsl);
+	sample->tstamp = 0;
+	sample->val = 0;
+
+	if (USE_BLK_TS_RAW(meta)) {
+		/* Read out the actual BLK_TS */
+		sample->tstamp = scmi_telemetry_blkts_read(magic, tde,
+							   bts_payld, snap);
+	} else if (LINE_TS_VALID_RAW(meta)) {
+		/*
+		 * Note that LINE_TS_VALID implies HAS_LINE_EXT and that
+		 * the per DE line_ts_rate is advertised in the DE
+		 * descriptor, BUT we check anyway against buggy FW.
+		 */
+		if (!HAS_LINE_EXT_RAW(meta)) {
+			trace_scmi_tlm_access(tde->de.info->id,
+					      "SHMTI_BAD_TS_LINE", 0, 0);
+			return -EPROTO;
 		}
+
+		sample->tstamp = LINE_TSTAMP_GET_RAW(&payld->tsl);
 	}
 
 	/* Data is always valid since we are NOT handling BLK TS lines here */
-	*val = LINE_DATA_GET_RAW(&payld->l);
+	sample->val = LINE_DATA_GET_RAW(&payld->l);
 
-	trace_scmi_tlm_collect(tstamp ? *tstamp : 0, tde->de.info->id,
-			       *val, "SHMTI_DE_READ");
+	/* Trace originally read tstamp */
+	trace_scmi_tlm_collect(sample->tstamp, tde->de.info->id,
+			       sample->val, "SHMTI_DE_READ");
 
-	scmi_telemetry_tde_cache_update(tde, *val, tstamp, &magic);
+	scmi_telemetry_tde_cache_update(tde, sample, &magic);
 
 	return 0;
 }
@@ -2223,10 +2263,10 @@ static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
 					   struct telemetry_uuid *active_uuid)
 {
 	struct telemetry_shmti *shmti = snap->shmti;
+	struct scmi_telemetry_de_sample sample = {};
 	u32 meta = PAYLD_META_RAW(payld);
 	bool use_blk_ts = USE_BLK_TS_RAW(meta);
 	struct telemetry_de *tde;
-	u64 val, tstamp = 0;
 	u32 de_id;
 
 	de_id = PAYLD_ID_RAW(payld);
@@ -2314,8 +2354,7 @@ static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
 	 * Parse data words ... only for the sake of updating TDE cache,
 	 * any error is logged by ignored.
 	 */
-	scmi_telemetry_line_data_parse(tde, snap, &val, &tstamp, payld, NULL,
-				       snap->magic);
+	scmi_telemetry_line_data_parse(tde, snap, &sample, payld, NULL, snap->magic);
 }
 
 /**
@@ -3366,6 +3405,570 @@ scmi_telemetry_collection_configure(const struct scmi_protocol_handle *ph,
 	return ret;
 }
 
+static inline int
+scmi_telemetry_de_data_fc_read(struct telemetry_de *tde,
+			       struct scmi_telemetry_de_sample *sample)
+{
+	struct fc_tsline __iomem *fc;
+
+	lockdep_assert_held(&tde->mtx);
+
+	/*
+	 * A FastChannel DE that was discovered as enabled at boot but later
+	 * failed to be enumerated cannot be accessed.
+	 */
+	if (!tde->base)
+		return -EPROTO;
+
+	fc = tde->base + tde->offset;
+	sample->val = LINE_DATA_GET(fc);
+	sample->tstamp = IS_TDE_TS_LINE(tde) ? LINE_TSTAMP_GET(fc) : 0;
+
+	/* Trace originally read tstamp */
+	trace_scmi_tlm_collect(sample->tstamp, tde->de.info->id, sample->val,
+			       "FC_READ");
+
+	/* Cache anyway since TDE caches are on the read path anyway */
+	scmi_telemetry_tde_cache_update(tde, sample, NULL);
+
+	return 0;
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
+		/*
+		 * Only for the sake of updating TDE cache.
+		 * Ignoring errors deriving from malformed FCs.
+		 */
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
+static int scmi_telemetry_tdcf_de_payld_check(struct telemetry_de *tde,
+					      struct payload *payld)
+{
+	u32 meta = PAYLD_META_RAW(payld);
+
+	lockdep_assert_held(&tde->mtx);
+
+	if (DATA_INVALID_RAW(meta)) {
+		trace_scmi_tlm_access(PAYLD_ID_RAW(payld), "DE_DATA_INVALID", 0, 0);
+		return -EINVAL;
+	}
+
+	if (!IS_DATA_LINE_RAW(meta)) {
+		trace_scmi_tlm_access(tde->de.info->id, "BAD_DE_LINE_TYPE", 0, 0);
+		return -EPROTO;
+	}
+
+	if (PAYLD_ID_RAW(payld) != tde->de.info->id) {
+		trace_scmi_tlm_access(tde->de.info->id, "DE_ID_MISMATCH", 0, 0);
+		return -ENODEV;
+	}
+
+	/*
+	 * A valid line using BLK_TS should have been initialized with the
+	 * related BLK_TS when enabled, unless is a torn read.
+	 */
+	if ((USE_BLK_TS_RAW(meta) && !tde->bts)) {
+		trace_scmi_tlm_access(tde->de.info->id, "BAD_USE_BLK_TS", 0, 0);
+		return -EPROTO;
+	}
+
+	return 0;
+}
+
+static int scmi_telemetry_de_snapshot(struct tdcf __iomem *tdcf,
+				      struct telemetry_de *tde,
+				      struct telemetry_de_snapshot *snap)
+{
+	int retries = SCMI_TLM_TDCF_MAX_RETRIES;
+	u32 startm, endm;
+	int err = 0;
+
+	lockdep_assert_held(&tde->mtx);
+
+	do {
+		struct payload __iomem *payld, *bts_payld;
+
+		/* A bit of exponential backoff between retries */
+		fsleep((SCMI_TLM_TDCF_MAX_RETRIES - retries) * SCMI_TLM_TDCF_RETRY_GAP_US);
+
+		startm = TDCF_START_SEQ_GET(tdcf);
+		/* Build a default endm certainly different from startm */
+		endm = startm + 1;
+		if (IS_BAD_START_SEQ(startm)) {
+			trace_scmi_tlm_access(tde->de.info->id, "MSEQ_BADSTART",
+					      startm, 0);
+			continue;
+		}
+
+		/*
+		 * In this context any anomaly detected on the payload could
+		 * due to a torn read, and it is worth retrying a snapshot.
+		 *
+		 * Note that TDE base/offset have been sanitized when
+		 * initialized and cannot have changed: accessing them here
+		 * is safe.
+		 */
+		payld = tde->base + tde->offset;
+		memcpy_fromio(&snap->payld, payld, LINE_LENGTH_BYTES(payld));
+		err = scmi_telemetry_tdcf_de_payld_check(tde, &snap->payld);
+		if (err)
+			continue;
+
+		/*
+		 * Here the associated BLK_TS line, if any, has been verified
+		 * as sane when linked/bound: no need of further validation.
+		 */
+		if (tde->bts) {
+			bts_payld = tde->base + tde->bts->line.offset;
+			memcpy_fromio(&snap->bts_payld, bts_payld,
+				      LINE_LENGTH_BYTES(bts_payld));
+		}
+
+		/* Assure the snapshot has been fully taken before checking seqnum */
+		rmb();
+
+		endm = TDCF_END_SEQ_GET(tde->eplg);
+		if (startm != endm)
+			trace_scmi_tlm_access(tde->de.info->id, "MSEQ_MISMATCH",
+					      startm, endm);
+	} while ((startm != endm || err) && --retries);
+
+	if (startm != endm || err) {
+		trace_scmi_tlm_access(tde->de.info->id,
+				      "TDCF_SNAPSHOT_DE_FAIL", startm, endm);
+		return err ?: -EPROTO;
+	}
+
+	/* Ensure any snapshot is visible before updating magic */
+	smp_store_release(&snap->magic, startm);
+
+	trace_scmi_tlm_access(tde->de.info->id, "TDCF_SNAPSHOT_DE_OK",
+			      startm, endm);
+
+	return 0;
+}
+
+static int
+scmi_telemetry_tdcf_de_sample_cached(struct tdcf __iomem *tdcf,
+				     struct telemetry_de *tde,
+				     struct scmi_telemetry_de_sample *sample)
+{
+	lockdep_assert_held(&tde->mtx);
+
+	u32 startm;
+
+	/* If updating cannot be cached */
+	startm = TDCF_START_SEQ_GET(tdcf);
+	if (IS_BAD_START_SEQ(startm))
+		return -EAGAIN;
+
+	return scmi_telemetry_tde_cache_lookup(tde, sample, &startm);
+}
+
+/**
+ * scmi_telemetry_tdcf_de_parse  - Helper to read one SHMTI/DE
+ * @tde: A reference to the DE descriptor to read
+ * @sample: A reference to the sample used as a container for output
+ *
+ * This helper can be used to retrieve the data value of a SHMTI based DE
+ * and any related BLK_TS line: unless the values are found already available
+ * and up to date in the TDE cache, a limited snapshot of the involved lines
+ * is taken at first so that all the subsequent DE parsing and processing can
+ * happen on a stable in RAM copy.
+ *
+ * Taking a limited snapshot does not carry relevant overhead and has the
+ * benefit of allowing the reuse of the same RAM-baased data accessors used
+ * during a full scan and related full snapshot, instead of a set of dedicated
+ * __iomem helpers.
+ *
+ * NOTE that since each TDE has its own cache, which is accessed and updated
+ * both during a single DE read and while performing a bulk read, while
+ * caching consistency assures to provide always the 'freshest' value
+ * retrieved, mixing single and bulk reads can lead to the values produced by
+ * the bulk reads to contain 'fresher' late values derived from concurrent
+ * single DE reads: IOW mixing single and bulk reads can produce a set of bulk
+ * DEs values that are NOT all from the same moment in time.
+ *
+ * Moreover in general, since no assumption can be made about the TDCF sequence
+ * numbers across different SHMTIs and related optional DE timestamps, it is NOT
+ * possible to guarantee anyway that data values retrieved from DEs located in
+ * distinct SHMTIs areas comes from the same platform update cycle at all.
+ */
+static int
+scmi_telemetry_tdcf_de_parse(struct telemetry_de *tde,
+			     struct scmi_telemetry_de_sample *sample)
+{
+	struct telemetry_de_snapshot snap = {};
+	struct tdcf __iomem *tdcf;
+	int ret;
+
+	lockdep_assert_held(&tde->mtx);
+
+	/*
+	 * TDEs can be relocated by platform only during enable phase,
+	 * thing that cannot happen until tde->mtx is released.
+	 */
+	tdcf = tde->base;
+	if (!tdcf)
+		return -ENODEV;
+
+	if (!scmi_telemetry_tdcf_de_sample_cached(tdcf, tde, sample))
+		return 0;
+
+	/* Attempt a localized DE snapshot: DATA_LINE + optionally BLK_TS */
+	ret = scmi_telemetry_de_snapshot(tdcf, tde, &snap);
+	if (ret)
+		return ret;
+
+	/* Now parse the stable line snapshot */
+	return scmi_telemetry_line_data_parse(tde, NULL, sample, &snap.payld,
+					      &snap.bts_payld, snap.magic);
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
+	return scmi_telemetry_de_data_fc_read(tde, sample);
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
+	ti->res_get(ti);
+	de = xa_load(&ti->xa_des, sample->id);
+	if (!de)
+		return -ENOENT;
+
+	return scmi_telemetry_de_collect(ti, de, sample);
+}
+
+static int
+scmi_telemetry_samples_collect(struct telemetry_info *ti, int grp_id,
+			       unsigned int *num_samples,
+			       struct scmi_telemetry_de_sample *samples)
+{
+	struct scmi_telemetry_res_info *rinfo;
+	unsigned int max_samples;
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
+					int grp_id, unsigned int *num_samples,
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
+		struct scmi_telemetry_de_sample sample = {};
+		struct scmi_telemetry_de *de;
+		struct telemetry_de *tde;
+		u32 de_id, meta = le32_to_cpu(payld->meta);
+		unsigned int wlen;
+
+		wlen = LINE_LENGTH_WORDS_RAW(meta);
+		/* Check Boundary and prepare next iteration */
+		if (check_add_overflow(next, wlen, &next) ||
+		    next > payld_bytes / sizeof(u32)) {
+			trace_scmi_tlm_access(0, "MSG_OVERFLOW", 0, 0);
+			return;
+		}
+
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
+		if (!de) {
+			trace_scmi_tlm_access(de_id, "MSG_DE_UNKNOWN", 0, 0);
+			continue;
+		}
+
+		tde = to_tde(de);
+		guard(mutex)(&tde->mtx);
+		if (!de->enabled) {
+			trace_scmi_tlm_access(de_id, "MSG_DE_DISABLED", 0, 0);
+			continue;
+		}
+
+		tde->cached_msg = cacheable;
+
+		sample.val = LINE_DATA_GET_RAW(&payld->tsl);
+		sample.tstamp = HAS_LINE_EXT_RAW(meta) &&
+			LINE_TS_VALID_RAW(meta) ? LINE_TSTAMP_GET_RAW(&payld->tsl) : 0;
+
+		/* Update the cache holding the TDE mutex */
+		scmi_telemetry_tde_cache_update(tde, &sample, NULL);
+
+		trace_scmi_tlm_collect(sample.tstamp, de->info->id, sample.val,
+				       "MESSAGE");
+	}
+}
+
+static int scmi_telemetry_des_sample_get(const struct scmi_protocol_handle *ph,
+					 int grp_id, unsigned int *num_samples,
+					 struct scmi_telemetry_de_sample *samples)
+{
+	struct telemetry_info *ti = ph->get_priv(ph);
+	struct scmi_msg_telemetry_config_set *msg;
+	struct scmi_xfer *t;
+	bool is_group;
+	u32 control;
+	int ret;
+
+	if (!ti->info.enabled || !num_samples || !samples ||
+	    !ti->info.single_read_support)
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
+	msg->group_identifier = cpu_to_le32(grp_id);
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
+		u32 num_dwords;
+
+		if (ret == -EBADMSG)
+			trace_scmi_tlm_access(0, "BAD_SAMPLE_PARTIAL_ERROR", 0, 0);
+
+		if (t->rx.len < sizeof(*r))
+			return -EPROTO;
+
+		num_dwords = le32_to_cpu(r->num_dwords);
+		/* Update cached DEs values from payload */
+		if (num_dwords) {
+			size_t payld_sz = 0, dwords_sz;
+
+			if (check_mul_overflow(num_dwords, sizeof(r->array[0]), &dwords_sz) ||
+			    check_add_overflow(sizeof(*r), dwords_sz, &payld_sz) ||
+			    payld_sz > t->rx.len) {
+				dev_err(ph->dev,
+					"Malformed Telemetry delayed response - num_dwords:%u  payld_sz:%zd  rx_len:%zd\n",
+					num_dwords, payld_sz, t->rx.len);
+				ret = -EPROTO;
+				goto out;
+			}
+
+			scmi_telemetry_msg_payld_process(ti, num_dwords, r->array,
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
@@ -3373,6 +3976,9 @@ static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
 	.state_get = scmi_telemetry_state_get,
 	.state_set = scmi_telemetry_state_set,
 	.collection_configure = scmi_telemetry_collection_configure,
+	.de_data_read = scmi_telemetry_de_data_read,
+	.des_bulk_read = scmi_telemetry_des_bulk_read,
+	.des_sample_get = scmi_telemetry_des_sample_get,
 };
 
 /**
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index ce35734d2249..7177f739f062 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -994,6 +994,13 @@ struct scmi_telemetry_info {
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
@@ -1008,6 +1015,15 @@ struct scmi_telemetry_info {
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
 	const struct scmi_telemetry_info *(*info_get)
@@ -1027,6 +1043,14 @@ struct scmi_telemetry_proto_ops {
 				    unsigned int res_id, const bool *enable,
 				    const unsigned int *update_interval_ms,
 				    const enum scmi_telemetry_collection *mode);
+	int __must_check (*de_data_read)(const struct scmi_protocol_handle *ph,
+					 struct scmi_telemetry_de_sample *sample);
+	int __must_check (*des_bulk_read)(const struct scmi_protocol_handle *ph,
+					  int grp_id, unsigned int *num_samples,
+					  struct scmi_telemetry_de_sample *samples);
+	int __must_check (*des_sample_get)(const struct scmi_protocol_handle *ph,
+					   int grp_id, unsigned int *num_samples,
+					   struct scmi_telemetry_de_sample *samples);
 };
 
 /**
-- 
2.54.0

