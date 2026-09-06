Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F9DE3B47F4;
	Sun,  6 Sep 2026 10:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788689270; cv=none; b=aqtNfJHKvjvPDIosOXBPQg9GdKgXZo2SUm/EAu9ubleqSESeybx2XV7e8M+T11Ft36mwWRU2qKs8arOTWX0CvgXbzdzA5V8S0l8jgaVRx7anQo4u1JKmLEVwsiHl9cFQv3t/amyFEFndeOWo5j8w5pdgD6fd++xf5kJJXhgh0dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788689270; c=relaxed/simple;
	bh=5SPafOB5U29Hx/mMcVXamT/CwPtC6r9tfBSuN3MONu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yggq7kwqQQtJrSl4O4STQ45Fi3erY+TFADtEHUhKuoe5UCamZqORI6582yt+iudU7Lq2GMSOpf1eV0C5tPfEOx15mchLFBMj01Ra1JLZiP+iqns1sQksB9NIe+Knj3y8ME0/tt8lhHWdxtyKvkGkB8fTppqUu/8rHiEIBzkH4ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=EBrsaIC8; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="EBrsaIC8"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80E3C1A9A;
	Sun,  6 Sep 2026 03:07:41 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2E2533F7D8;
	Sun,  6 Sep 2026 03:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788689265; bh=5SPafOB5U29Hx/mMcVXamT/CwPtC6r9tfBSuN3MONu4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EBrsaIC8KQjec16JvrCPVnmGhxLa8SYdZUZPqbm0zRAhMPbSgQW3D/Z4v0hzQH1sR
	 NxPnQuXKxmhlxWTK8K9Uhau77yRgGSMoUZPT1GcPcATGdnvIL7tDuSPrsPDdsA+7pf
	 HcQz8KoArAl9yUhbcC2TsezAKwy4maC3aeptNLVc=
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
Subject: [PATCH v11 08/25] firmware: arm_scmi: Add Telemetry configuration operations
Date: Sun,  6 Sep 2026 11:06:06 +0100
Message-ID: <20260906100623.3488327-9-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260906100623.3488327-1-cristian.marussi@arm.com>
References: <20260906100623.3488327-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for basic Telemetry configuration operations to selectively
enable or disable DataEvents monitoring.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v10 --> v11
 - refactor reply processing code on DE enable/disable
 - use the new des_ennabled mutex to protect des cache updates
 - clear sid on group disable for each composing DEs
 - add dev_warn_once on ZERO blk_ts offset
v8 --> v9
 - use new scmi_telemetry_shmti_overflow() inline
 - review DE offsets boundary and wraparound checks (Sashiko v8
 - update per-DE ts_rate for DE using BLK_TS too
v7 --> v8
 - Fixes for some Sashiko issues on v7
  - re-add functions unused in previous patch
  - add proper barriers to TDE/UUID binding process
  - update tde->sid on SCAN_UPDATE too
  - check wrap-arounds on shmti_de_offset manipulation
  - fix GROUP enable pollutes status update (was polluting global state)
  - remove .all_disable telemetry_operation since unused
  - add WARN on if a valid SHMTI ID is reported on enabling a FastChannel/DE
v6 --> v7
 - expose per-DE tracked sid/offset/UUIDs
 - trigger a full SHMTI scan when a SHMTI-based is enabled and it still has NO
   associated UUID
v5 --> v6
 - constify a few booleans used as inpurt in telemetry_operations
 - fixes (some) Sashiko reviews
   https://sashiko.dev/#/patchset/20260703123601.381275-1-cristian.marussi%40arm.com?part=9
   - underflow on de_offs
   - SHMTI overflow checks
   - bail out on failed group scan
   - unlink comprising DEs on group disable
   - add boudnary check on message response parsing
v4 --> v5
 - use renamed grp_id instead of old id in group descriptors
 - remove useless grp_ignore param from collection_configure
- fixes sparse warnings
v3 --> v4
 - track configured Telemetry DE states
 - add aggregate Telemetry state query
v2 --> v3
 - split from monolithic Telemetry patch
 - simplify clenaup with scmi_telemetry_de_unlink
---
 drivers/firmware/arm_scmi/telemetry.c | 546 ++++++++++++++++++++++++++
 include/linux/scmi_protocol.h         |  17 +
 2 files changed, 563 insertions(+)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 422f22cf3e68..44defa519668 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -1640,6 +1640,42 @@ static void scmi_telemetry_tdcf_uuid_parse(struct telemetry_info *ti,
 	*active_uuid = uuid;
 }
 
+static struct payload __iomem *
+scmi_telemetry_nearest_line_by_type(struct telemetry_shmti *shmti,
+				    void __iomem *last, enum tdcf_line_types ltype)
+{
+	struct tdcf __iomem *tdcf = shmti->base;
+	void __iomem *next, *found = NULL;
+
+	/* Scan from start of TDCF payloads up to last_payld */
+	next = tdcf->payld;
+	while (next < last) {
+		if (LINE_TYPE((struct payload __iomem *)next) == ltype)
+			found = next;
+
+		next += LINE_LENGTH_BYTES((struct payload __iomem *)next);
+	}
+
+	return found;
+}
+
+static struct telemetry_block_ts *
+scmi_telemetry_blkts_bind(struct telemetry_info *ti, struct telemetry_shmti *shmti,
+			  struct payload __iomem *payld,
+			  struct payload __iomem *bts_payld)
+{
+	/* Trigger a manual search when no BLK_TS payload offset was provided */
+	if (!bts_payld) {
+		/* Find the BLK_TS immediately preceding this DE payld */
+		bts_payld = scmi_telemetry_nearest_line_by_type(shmti, payld,
+								TDCF_BLK_TS_LINE);
+		if (!bts_payld)
+			return NULL;
+	}
+
+	return scmi_telemetry_blkts_get_or_create(ti, bts_payld);
+}
+
 /**
  * scmi_telemetry_tdcf_blkts_parse  - A BLK_TS line parser
  *
@@ -1767,6 +1803,19 @@ static inline void scmi_telemetry_uuid_link(struct telemetry_de *tde,
 	trace_scmi_tlm_access(tde->de.info->id, "UUID_LINK", 0, 0);
 }
 
+static struct telemetry_uuid *
+scmi_telemetry_uuid_bind(struct telemetry_info *ti, struct telemetry_shmti *shmti,
+			 struct payload __iomem *payld)
+{
+	struct payload __iomem *uuid;
+
+	uuid = scmi_telemetry_nearest_line_by_type(shmti, payld, TDCF_UUID_LINE);
+	if (!uuid)
+		return NULL;
+
+	return scmi_telemetry_uuid_get_or_create(ti, uuid);
+}
+
 /**
  * scmi_telemetry_tdcf_data_parse  - TDCF DataLine parsing
  * @ti: A reference to the telemetry info descriptor
@@ -2045,10 +2094,507 @@ static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
 	return 0;
 }
 
+static int scmi_telemetry_group_state_update(struct telemetry_info *ti,
+					     struct scmi_telemetry_group *grp,
+					     const bool *enable, const bool *tstamp)
+{
+	struct scmi_telemetry_res_info *rinfo;
+
+	rinfo = ti->res_get(ti);
+	for (int i = 0; i < grp->info->num_des; i++) {
+		struct scmi_telemetry_de *de = rinfo->des[grp->des[i]];
+
+		if (enable)
+			scmi_telemetry_de_state_update(ti, ENA_STATE,
+						       &de->enabled, *enable);
+
+		if (tstamp && de->tstamp_support)
+			scmi_telemetry_de_state_update(ti, ENA_TSTAMP,
+						       &de->tstamp_enabled, *tstamp);
+	}
+
+	return 0;
+}
+
+static void scmi_telemetry_group_disable(struct telemetry_info *ti,
+					 struct scmi_telemetry_group *grp)
+{
+	struct scmi_telemetry_res_info *rinfo;
+
+	rinfo = ti->res_get(ti);
+	/*
+	 * Unlink the related BLK_TS/UUID lines of DEs composing the group
+	 * and invalidate SHMTI reference.
+	 */
+	for (int i = 0; i < grp->info->num_des; i++) {
+		struct telemetry_de *tde = to_tde(rinfo->des[grp->des[i]]);
+
+		scmi_telemetry_blkts_unlink(tde);
+
+		guard(mutex)(&tde->mtx);
+		tde->sid = SHMTI_ID_INVALID;
+		tde->offset = 0;
+	}
+}
+
+static inline struct payload __iomem *
+scmi_telemetry_de_payld_safe_calc(struct telemetry_shmti *shmti, u32 de_offs)
+{
+	struct payload __iomem *payld;
+	u64 de_base, de_payld;
+	u32 de_end;
+
+	/* Check if accessing payld->meta is safe. */
+	if (check_add_overflow(de_offs, sizeof(u32), &de_end) ||
+	    de_end > shmti->info.len)
+		return IOMEM_ERR_PTR(-EPROTO);
+
+	de_base = (__force u64)shmti->base;
+	if (check_add_overflow(de_base, de_offs, &de_payld))
+		return IOMEM_ERR_PTR(-EPROTO);
+
+	payld = shmti->base + de_offs;
+	/* Check line boundary */
+	if (check_add_overflow(de_offs, LINE_LENGTH_BYTES(payld), &de_end) ||
+	    de_end > shmti->info.len)
+		return IOMEM_ERR_PTR(-EPROTO);
+
+	return payld;
+}
+
+static int
+scmi_telemetry_tde_linked_lines_process(struct telemetry_info *ti,
+					struct telemetry_de *tde,
+					struct telemetry_shmti *shmti,
+					struct payload __iomem *payld,
+					u32 bts_offs)
+{
+	struct payload __iomem *bts_payld;
+	bool needs_primary = false;
+
+	/*
+	 * On enable if a UUID was NOT already assigned scan
+	 * looking for possible Secondary UUID to bind: if NO
+	 * secondary could be found embedded in the preceding
+	 * SHMTI lines, install the primary UUID for this DE.
+	 */
+	scoped_guard(mutex, &tde->mtx) {
+		struct telemetry_uuid *uuid;
+
+		if (!tde->uuid) {
+			uuid = scmi_telemetry_uuid_bind(ti, shmti, payld);
+			if (uuid)
+				tde->uuid = uuid;
+			else
+				needs_primary = true;
+		}
+	}
+
+	if (needs_primary)
+		scmi_telemetry_uuid_link(tde, ti->primary_uuid);
+
+	/* Process related BLK_TS lines if any */
+	guard(mutex)(&tde->mtx);
+	if (!USE_BLK_TS(payld) || tde->bts)
+		return 0;
+
+	bts_payld = (bts_offs) ? tde->base + bts_offs : NULL;
+	/* Check SHMTI overflow on returned offset */
+	if (bts_payld) {
+		if (scmi_telemetry_shmti_overflow(shmti, bts_payld)) {
+			trace_scmi_tlm_access(0, "SHMTI_OVERFLOW", 0, 0);
+			return -EINVAL;
+		}
+	} else {
+		dev_warn_once(ti->ph->dev,
+			      "Received BLK_TS with zero offset.\n");
+		trace_scmi_tlm_access(0, "BLKTS_WITH_ZERO_OFFSET", 0, 0);
+	}
+
+	/* Look for a viable BLK_TS line */
+	tde->bts = scmi_telemetry_blkts_bind(ti, shmti,
+					     payld, bts_payld);
+	if (WARN_ON(!tde->bts)) {
+		trace_scmi_tlm_access(tde->de.info->id, "INVALID_USE_BLK_TS", 0, 0);
+		return -EPROTO;
+	}
+
+	/* Update per-DE BLK_TS if any */
+	if (tde->ts_type == TSTAMP_BLK &&
+	    tde->bts->last_rate)
+		tde->de.info->ts_rate = tde->bts->last_rate;
+
+	return 0;
+}
+
+static int
+scmi_telemetry_state_set_tde_resp(struct telemetry_info *ti,
+				  struct scmi_telemetry_de *de,
+				  u32 sid, u32 de_offs, u32 bts_offs)
+{
+	struct telemetry_shmti *shmti;
+	struct payload __iomem *payld;
+	struct telemetry_de *tde;
+
+	/* A FastChannel DE MUST return an INVALID SHMTI ID on enable */
+	if (WARN_ON(de->fc_support)) {
+		trace_scmi_tlm_access(de->info->id, "INVALID_DE_FC_ON_SHMTI", 0, 0);
+		return -EPROTO;
+	}
+
+	/* Update SHMTI/offset while skipping non-SHMTI based DES */
+	shmti = &ti->shmti[sid];
+	/* Check sanity of received location... */
+	payld = scmi_telemetry_de_payld_safe_calc(shmti, de_offs);
+	if (IS_ERR(payld))
+		return PTR_ERR(payld);
+
+	tde = to_tde(de);
+	scoped_guard(mutex, &tde->mtx) {
+		/* ...then assign once validated */
+		tde->sid = sid;
+		tde->base = shmti->base;
+		tde->offset = de_offs;
+		/* A handy reference to the Epilogue updated */
+		tde->eplg = SHMTI_EPLG(shmti);
+	}
+
+	return scmi_telemetry_tde_linked_lines_process(ti, tde, shmti,
+						       payld, bts_offs);
+}
+
+static int
+scmi_telemetry_state_set_resp_process(struct telemetry_info *ti, void *obj,
+				      void *r, bool is_group)
+{
+	struct scmi_msg_resp_telemetry_de_configure *resp = r;
+	u32 sid = le32_to_cpu(resp->shmti_id);
+
+	if (IS_SHMTI_ID_VALID(sid)) {
+		if (sid >= ti->num_shmti)
+			return -EPROTO;
+
+		if (!is_group) {
+			u32 de_offs, bts_offs;
+
+			de_offs = le32_to_cpu(resp->shmti_de_offset);
+			bts_offs = le32_to_cpu(resp->blk_ts_offset);
+			return scmi_telemetry_state_set_tde_resp(ti, obj, sid,
+								 de_offs, bts_offs);
+		} else {
+			int ret;
+
+			/*
+			 * A full SHMTI scan is needed when enabling a
+			 * group or its timestamps in order to retrieve
+			 * offsets: note that when group-timestamp is
+			 * enabled for composing DEs a re-scan is needed
+			 * since some DEs could have been relocated due
+			 * to lack of space in the TDCF.
+			 */
+			ret = scmi_telemetry_shmti_scan(ti, sid, SCAN_UPDATE);
+			if (ret) {
+				dev_err(ti->ph->dev,
+					"Failed group-scan of SHMTI ID:%d - ret:%d\n",
+					sid, ret);
+				return ret;
+			}
+		}
+	} else {
+		/* Unlink the related BLK_TS/UUID lines on disable */
+		if (!is_group) {
+			struct scmi_telemetry_de *de = obj;
+			struct telemetry_de *tde = to_tde(de);
+
+			scoped_guard(mutex, &tde->mtx) {
+				tde->sid = SHMTI_ID_INVALID;
+				tde->offset = 0;
+			}
+
+			/* UUID is never unlinked once discovered */
+			scmi_telemetry_blkts_unlink(tde);
+		} else {
+			scmi_telemetry_group_disable(ti, obj);
+		}
+	}
+
+	return 0;
+}
+
+static int __scmi_telemetry_state_set(const struct scmi_protocol_handle *ph,
+				      bool is_group, const bool *enable,
+				      bool *enabled_state, const bool *tstamp,
+				      bool *tstamp_enabled_state, void *obj)
+{
+	struct scmi_msg_resp_telemetry_de_configure *resp;
+	struct scmi_msg_telemetry_de_configure *msg;
+	struct telemetry_info *ti = ph->get_priv(ph);
+	struct scmi_telemetry_de *de = !is_group ? obj : NULL;
+	struct scmi_telemetry_group *grp = is_group ? obj : NULL;
+	unsigned int obj_id = !is_group ? de->info->id : grp->info->grp_id;
+	struct scmi_xfer *t;
+	int ret;
+
+	if (!enabled_state || !tstamp_enabled_state)
+		return -EINVAL;
+
+	/* Is anything to do at all on this DE ? */
+	if (!is_group && (!enable || *enable == *enabled_state) &&
+	    (!tstamp || *tstamp == *tstamp_enabled_state))
+		return 0;
+
+	/*
+	 * DE is currently disabled AND no enable state change was requested,
+	 * while timestamp is being changed: update only local state...no need
+	 * to send a message.
+	 */
+	if (!is_group && !enable && !*enabled_state) {
+		if (de->tstamp_support)
+			scmi_telemetry_de_state_update(ti, ENA_TSTAMP,
+						       tstamp_enabled_state,
+						       *tstamp);
+
+		return 0;
+	}
+
+	ret = ph->xops->xfer_get_init(ph, TELEMETRY_DE_CONFIGURE,
+				      sizeof(*msg), sizeof(*resp), &t);
+	if (ret)
+		return ret;
+
+	msg = t->tx.buf;
+	/* Note that BOTH DE and GROUPS have a first ID field.. */
+	msg->id = cpu_to_le32(obj_id);
+	/* Default to disable mode for one DE */
+	msg->flags = DE_DISABLE_ONE;
+	msg->flags |= cpu_to_le32(FIELD_PREP(GENMASK(3, 3),
+				 is_group ? EVENT_GROUP : EVENT_DE));
+
+	if ((!enable && *enabled_state) || (enable && *enable)) {
+		/* Already enabled but tstamp_enabled state changed */
+		if (tstamp) {
+			/* Here, tstamp cannot be NULL too */
+			msg->flags |= cpu_to_le32(*tstamp ?
+					DE_ENABLE_WTH_TSTAMP : DE_ENABLE_NO_TSTAMP);
+		} else {
+			msg->flags |= cpu_to_le32(*tstamp_enabled_state ?
+					DE_ENABLE_WTH_TSTAMP : DE_ENABLE_NO_TSTAMP);
+		}
+	}
+
+	resp = t->rx.buf;
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		ret = scmi_telemetry_state_set_resp_process(ti, obj, resp, is_group);
+		if (!ret) {
+			/* Update cached state on success */
+			if (enable) {
+				if (!is_group)
+					scmi_telemetry_de_state_update(ti, ENA_STATE,
+								       enabled_state,
+								       *enable);
+				else
+					*enabled_state = *enable;
+			}
+			if (tstamp) {
+				if (!is_group) {
+					if (de->tstamp_support)
+						scmi_telemetry_de_state_update(ti, ENA_TSTAMP,
+									       tstamp_enabled_state,
+									       *tstamp);
+				} else {
+					*tstamp_enabled_state = *tstamp;
+				}
+			}
+
+			if (is_group)
+				scmi_telemetry_group_state_update(ti, grp, enable,
+								  tstamp);
+		}
+	}
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_telemetry_state_get(const struct scmi_protocol_handle *ph,
+				    const u32 *id, bool *enabled, bool *tstamp_enabled,
+				    u32 *sid, u32 *offset, uuid_t  *uuid)
+{
+	struct telemetry_info *ti = ph->get_priv(ph);
+	struct scmi_telemetry_de *de;
+	struct telemetry_de *tde;
+
+	if (!enabled || !tstamp_enabled)
+		return -EINVAL;
+
+	if (!id) {
+		guard(mutex)(&ti->des_enabled_mtx);
+		/* Returning the all_des_* state */
+		*enabled =
+			(atomic_read(&ti->des_enabled[ENA_STATE]) == ti->info.base.num_des);
+		*tstamp_enabled =
+			(atomic_read(&ti->des_enabled[ENA_TSTAMP]) == ti->num_des_tstamp);
+
+		return 0;
+	}
+
+	de = xa_load(&ti->xa_des, *id);
+	if (!de)
+		return -ENODEV;
+
+	*enabled = de->enabled;
+	*tstamp_enabled = de->tstamp_enabled;
+
+	tde = to_tde(de);
+	if (sid)
+		*sid = tde->sid;
+	if (offset)
+		*offset = tde->offset;
+	if (uuid && tde->uuid)
+		uuid_copy(uuid, &tde->uuid->uuid);
+
+	return 0;
+}
+
+static int scmi_telemetry_state_set(const struct scmi_protocol_handle *ph,
+				    bool is_group, u32 id, const bool *enable,
+				    const bool *tstamp, u32 *sid, u32 *offset,
+				    uuid_t *uuid)
+{
+	struct telemetry_info *ti = ph->get_priv(ph);
+	bool *enabled_state, *tstamp_enabled_state;
+	struct scmi_telemetry_res_info *rinfo;
+	void *obj;
+	int ret;
+
+	rinfo = ti->res_get(ti);
+	if (!is_group) {
+		struct scmi_telemetry_de *de;
+
+		de = xa_load(&ti->xa_des, id);
+		if (!de)
+			return -ENODEV;
+
+		enabled_state = &de->enabled;
+		tstamp_enabled_state = &de->tstamp_enabled;
+		obj = de;
+	} else {
+		struct scmi_telemetry_group *grp;
+
+		if (id >= ti->info.base.num_groups)
+			return -EINVAL;
+
+		grp = &rinfo->grps[id];
+
+		enabled_state = &grp->enabled;
+		tstamp_enabled_state = &grp->tstamp_enabled;
+		obj = grp;
+	}
+
+	ret = __scmi_telemetry_state_set(ph, is_group, enable, enabled_state,
+					 tstamp, tstamp_enabled_state, obj);
+	if (ret)
+		return ret;
+
+	if (!is_group) {
+		struct telemetry_de *tde;
+
+		tde = to_tde(obj);
+		if (sid)
+			*sid = tde->sid;
+		if (offset)
+			*offset = tde->offset;
+		if (uuid && tde->uuid)
+			uuid_copy(uuid, &tde->uuid->uuid);
+	}
+
+	return 0;
+}
+
+static int
+scmi_telemetry_collection_configure(const struct scmi_protocol_handle *ph,
+				    unsigned int res_id, const bool *enable,
+				    const unsigned int *update_interval_ms,
+				    const enum scmi_telemetry_collection *mode)
+{
+	enum scmi_telemetry_collection *current_mode, next_mode;
+	struct telemetry_info *ti = ph->get_priv(ph);
+	struct scmi_msg_telemetry_config_set *msg;
+	bool tlm_enable, *current_state, is_group;
+	unsigned int *active_update_interval;
+	struct scmi_xfer *t;
+	__le32 interval;
+	u32 control;
+	int ret;
+
+	if (mode && *mode == SCMI_TLM_NOTIFICATION &&
+	    !ti->info.continuos_update_support)
+		return -EINVAL;
+
+	is_group = res_id != SCMI_TLM_GRP_INVALID;
+	if (is_group && res_id >= ti->info.base.num_groups)
+		return -EINVAL;
+
+	if (!is_group) {
+		active_update_interval = &ti->info.active_update_interval;
+		current_mode = &ti->info.current_mode;
+		current_state = &ti->info.enabled;
+	} else {
+		struct scmi_telemetry_res_info *rinfo;
+
+		rinfo = ti->res_get(ti);
+		active_update_interval =
+			&rinfo->grps[res_id].active_update_interval;
+		current_mode = &rinfo->grps[res_id].current_mode;
+		current_state = &rinfo->grps[res_id].enabled;
+	}
+
+	if (!enable && !update_interval_ms && (!mode || *mode == *current_mode))
+		return 0;
+
+	ret = ph->xops->xfer_get_init(ph, TELEMETRY_CONFIG_SET,
+				      sizeof(*msg), 0, &t);
+	if (ret)
+		return ret;
+
+	if (!update_interval_ms)
+		interval = cpu_to_le32(*active_update_interval);
+	else
+		interval = cpu_to_le32(*update_interval_ms);
+
+	tlm_enable = enable ? *enable : *current_state;
+	next_mode = mode ? *mode : *current_mode;
+
+	msg = t->tx.buf;
+	msg->grp_id = cpu_to_le32(res_id);
+	control = tlm_enable ? TELEMETRY_ENABLE : 0;
+	control |= !is_group ? TELEMETRY_SET_SELECTOR_ALL : TELEMETRY_SET_SELECTOR_GROUP;
+	control |= TELEMETRY_MODE_SET(next_mode);
+	msg->control = cpu_to_le32(control);
+	msg->sampling_rate = interval;
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		*current_state = tlm_enable;
+		*current_mode = next_mode;
+		ti->info.notif_enabled = *current_mode == SCMI_TLM_NOTIFICATION;
+		if (update_interval_ms)
+			*active_update_interval = le32_to_cpu(interval);
+	}
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
 static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
 	.info_get = scmi_telemetry_info_get,
 	.de_lookup = scmi_telemetry_de_lookup,
 	.res_get = scmi_telemetry_resources_get,
+	.state_get = scmi_telemetry_state_get,
+	.state_set = scmi_telemetry_state_set,
+	.collection_configure = scmi_telemetry_collection_configure,
 };
 
 /**
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 2850b018da0d..15a0aa3d9e3a 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -994,6 +994,12 @@ struct scmi_telemetry_info {
  * @info_get: get the general Telemetry information.
  * @de_lookup: get a specific DE descriptor from the DE id.
  * @res_get: get a reference to the Telemetry resources descriptor.
+ * @state_get: retrieve the specific DE or GROUP state, if NULL returns the
+ *	       cumulative state of all DEs.
+ * @state_set: enable/disable the specific DE or GROUP with or without timestamps.
+ * @collection_configure: choose a sampling rate and enable SHMTI/FC sampling
+ *			  for on demand collection via @de_data_read or async
+ *			  notificatioins for all the enabled DEs.
  */
 struct scmi_telemetry_proto_ops {
 	const struct scmi_telemetry_info __must_check *(*info_get)
@@ -1002,6 +1008,17 @@ struct scmi_telemetry_proto_ops {
 		(const struct scmi_protocol_handle *ph, u32 id);
 	const struct scmi_telemetry_res_info __must_check *(*res_get)
 		(const struct scmi_protocol_handle *ph);
+	int (*state_get)(const struct scmi_protocol_handle *ph,
+			 const u32 *id, bool *enabled, bool *tstamp_enabled,
+			 u32 *sid, u32 *offset, uuid_t *uuid);
+	int (*state_set)(const struct scmi_protocol_handle *ph,
+			 bool is_group, u32 id, const bool *enable,
+			 const bool *tstamp, u32 *sid, u32 *offset,
+			 uuid_t *uuid);
+	int (*collection_configure)(const struct scmi_protocol_handle *ph,
+				    unsigned int res_id, const bool *enable,
+				    const unsigned int *update_interval_ms,
+				    const enum scmi_telemetry_collection *mode);
 };
 
 /**
-- 
2.54.0

