Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549882;
	b=QCE5zUbiBNMDyiMm1NS3myZxpfnlPLTm9/9BCEukNqjXqAB+jd2BVVRDe92UUY6DyjyL
	 WNn138T94klqJTumzSBsBcWOWf1JnmUTlOs8OR5iHwa5IIlqIAKdYBqdHzrO82BlRfcLy
	 tpic4l8FqerBWQeB9kLpGAWQ0K61c3DrQ32oBYRlUO+1wvAkM1pUHeBwAAUngljAnc2Kc
	 jwML32TcGEASYsDXDKjAZn6Ao7ZTDLVVSPFW91BXa6foHftFs7WpZmH2c0+5r8/cwsCfQ
	 c+XTKovF+4DI2NZdSX+yMDoynfgMv3X9jBQcgG/51iTfJXB3FY1dRz/wysI4HXj/FMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549882;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9TPHuxusDSZgjIk6horqgEQKNSFVZzq37QCnBQlmGN8=;
	b=NF/QaJxdysUjiH16dNhppJEqrTg1yQSbhcphHGiFL/VxBDb0HpfE4Te4t+sLota4jbuW
	 w6k2LOBV9+f2pgs+l/SvufyqYkXx50Gb8SIeHsy43BrFXmPz3GtZ0wCPz1k5g7XSXYd+K
	 oiOLBzVun+w+MeHO6pYVcMadhl91/gS3WV+sGL8ISdJ6OKSRgxj9weOYoJFWoTooBp/hs
	 Am9gXDF+q+6917NQCzwscjNv46FFMssxDKpAhF7Kzh31/y8u9JRUGiYu4WCKwMspbuuIF
	 sgQyleZE36cay3D1fn3eWGQBh1G98IfwA3IGQOzwt2kYN04IqqAHLi6N7S3X+Yg7b6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MzrBkzXq;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93983606A321;
	Tue, 24 Nov 2026 19:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93983606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MzrBkzXq
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13B9A175A;
	Tue, 24 Nov 2026 11:51:18 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 086803F763;
	Tue, 24 Nov 2026 11:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795549880; bh=aP/iG2SxBp50Z30oIGj1V5kAOdu0KTWo9qpuLh87Zgk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MzrBkzXqAujvl0elBcCxAIX7uGO1UobE5VcBY9p5Yvs660Fv1RIwKorPjoLEBxR3R
	 DontKLvhQ2ix1I6nYgqDszzWLtviKG06/E5LlKyAlvcsPGBm1N8xe/HnKwvZ8iPiv1
	 WZs9/0iSRXUfJGBKfU0GAazD+iedHMFieA4fsodQ=
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
Subject: [PATCH v17 20/34] firmware: arm_scmi: Add Telemetry Single/Bulk DEs reads
Date: Tue, 24 Nov 2026 19:48:26 +0000
Message-ID: <20261124194841.1147072-21-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261124194841.1147072-1-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
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
v16 --> v17
 - fix shmti_oveflow WITH LEN
 - check liveness on de_snapshot
 - remove des_sample and notif structure and logic
 - add a comment on bulk read reporting on failures
 - return ENODATA when TLM off
v15 --> v16
 - removed SINGLE SAMPLE delayed response reads capabilities
 - removed groups references
 - check liveness in de_snapshot
 - add shmti_overflow check on snap
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
 drivers/firmware/arm_scmi/telemetry.c | 529 ++++++++++++++++++++++++--
 include/linux/scmi_protocol.h         |  17 +
 2 files changed, 511 insertions(+), 35 deletions(-)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 6e5564c36a2d..34389ac82b4f 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -383,6 +383,12 @@ struct tdcf {
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
@@ -710,8 +716,9 @@ scmi_telemetry_tde_cache_stale(struct telemetry_de *tde, const u32 magic)
 }
 
 static void
-scmi_telemetry_tde_cache_update(struct telemetry_de *tde, u64 val,
-				u64 *tstamp, const u32 *magic)
+scmi_telemetry_tde_cache_update(struct telemetry_de *tde,
+				struct scmi_telemetry_de_sample *sample,
+				const u32 *magic)
 {
 	lockdep_assert_held(&tde->mtx);
 
@@ -723,10 +730,37 @@ scmi_telemetry_tde_cache_update(struct telemetry_de *tde, u64 val,
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
@@ -1984,45 +2018,45 @@ static void scmi_telemetry_tdcf_blkts_parse(struct telemetry_info *ti,
 
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
@@ -2128,11 +2162,11 @@ static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
 					   struct telemetry_uuid *active_uuid)
 {
 	struct telemetry_shmti *shmti = snap->shmti;
+	struct scmi_telemetry_de_sample sample = {};
 	struct device *dev = ti->ph->dev;
 	u32 meta = PAYLD_META_RAW(payld);
 	bool use_blk_ts = USE_BLK_TS_RAW(meta);
 	struct telemetry_de *tde;
-	u64 val, tstamp = 0;
 	u32 de_id;
 
 	de_id = PAYLD_ID_RAW(payld);
@@ -2225,7 +2259,7 @@ static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
 	 * Parse data words ... only for the sake of updating TDE cache,
 	 * any error is logged but ignored.
 	 */
-	if (scmi_telemetry_line_data_parse(tde, snap, &val, &tstamp, payld,
+	if (scmi_telemetry_line_data_parse(tde, snap, &sample, payld,
 					   NULL, snap->magic))
 		dev_err(dev, "Malformed DATA line.\n");
 }
@@ -3155,6 +3189,429 @@ scmi_telemetry_collection_configure(const struct scmi_protocol_handle *ph,
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
+	u32 startm, endm, live = 0;
+	int err;
+
+	lockdep_assert_held(&tde->mtx);
+
+	do {
+		struct payload __iomem *payld, *bts_payld;
+		ssize_t len;
+
+		/* A bit of exponential backoff between retries */
+		fsleep((SCMI_TLM_TDCF_MAX_RETRIES - retries) * SCMI_TLM_TDCF_RETRY_GAP_US);
+
+		err = 0;
+		startm = TDCF_START_SEQ_GET(tdcf);
+		/* Build a default endm certainly different from startm */
+		endm = startm + 1;
+		if (IS_BAD_START_SEQ(startm)) {
+			trace_scmi_tlm_access(tde->de.info->id, "MSEQ_BADSTART_DE",
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
+		/* Sanitize length before snapshot */
+		len = scmi_telemetry_shmti_overflow(tde->base, tde->eplg, payld);
+		if (len < 0)
+			continue;
+		memcpy_fromio(&snap->payld, payld, len);
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
+			/* Sanitize length before snapshot */
+			len = scmi_telemetry_shmti_overflow(tde->base,
+							    tde->eplg, bts_payld);
+			if (len < 0)
+				continue;
+			memcpy_fromio(&snap->bts_payld, bts_payld, len);
+		}
+
+		/* Assure the snapshot has been fully taken before checking seqnum */
+		rmb();
+
+		/* Used to detect changes while copying */
+		live = TDCF_START_SEQ_GET(tdcf);
+		endm = TDCF_END_SEQ_GET(tde->eplg);
+		if (startm != endm || startm != live)
+			trace_scmi_tlm_access(tde->de.info->id, "MSEQ_MISMATCH_DE",
+					      startm, startm != endm ? endm : live);
+	} while ((startm != endm || startm != live || err) && --retries);
+
+	if (startm != endm || startm != live || err) {
+		trace_scmi_tlm_access(tde->de.info->id, "TDCF_SNAPSHOT_DE_FAIL",
+				      startm, startm != endm ? endm : live);
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
+	if (grp_id != SCMI_TLM_GRP_INVALID)
+		return -EOPNOTSUPP;
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
+		/* Skip disabled DEs */
+		if (!tde->de.enabled)
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
+	if (!ti->info.enabled)
+		return -ENODATA;
+
+	if (!num_samples || !samples)
+		return -EINVAL;
+
+	/* Trigger a full SHMTIs & FCs scan */
+	scmi_telemetry_scan_update(ti);
+
+	/*
+	 * Collect all last cached values.
+	 * Note that on any read failure this reports the latest successfully
+	 * collected values: timestamp, where available, can be used to spot
+	 * stale values. Single DE reads and related batch requests can be used
+	 * to attain a more fine grained access with detailed error reporting.
+	 */
+	return scmi_telemetry_samples_collect(ti, grp_id, num_samples, samples);
+}
+
 static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
 	.info_get = scmi_telemetry_info_get,
 	.de_lookup = scmi_telemetry_de_lookup,
@@ -3162,6 +3619,8 @@ static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
 	.state_get = scmi_telemetry_state_get,
 	.state_set = scmi_telemetry_state_set,
 	.collection_configure = scmi_telemetry_collection_configure,
+	.de_data_read = scmi_telemetry_de_data_read,
+	.des_bulk_read = scmi_telemetry_des_bulk_read,
 };
 
 /**
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index ba240c8595a8..f0b091e6709f 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -969,6 +969,13 @@ struct scmi_telemetry_info {
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
@@ -983,6 +990,11 @@ struct scmi_telemetry_info {
  * @collection_configure: choose a sampling rate and enable SHMTI/FC sampling
  *			  for on demand collection via @de_data_read or async
  *			  notificatioins for all the enabled DEs.
+ * @de_data_read: on-demand read of a single DE and related optional timestamp:
+ *		  the value will be retrieved at the proper SHMTI offset OR
+ *		  from the dedicated FC area (if supported by that DE).
+ * @des_bulk_read: on-demand read of all the currently enabled DEs, or just
+ *		   the ones belonging to a specific group when provided.
  */
 struct scmi_telemetry_proto_ops {
 	const struct scmi_telemetry_info *(*info_get)
@@ -1002,6 +1014,11 @@ struct scmi_telemetry_proto_ops {
 				    unsigned int res_id, const bool *enable,
 				    const unsigned int *update_interval,
 				    const enum scmi_telemetry_collection *mode);
+	int __must_check (*de_data_read)(const struct scmi_protocol_handle *ph,
+					 struct scmi_telemetry_de_sample *sample);
+	int __must_check (*des_bulk_read)(const struct scmi_protocol_handle *ph,
+					  int grp_id, unsigned int *num_samples,
+					  struct scmi_telemetry_de_sample *samples);
 };
 
 /**
-- 
2.54.0

