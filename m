Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E820954DACE;
	Fri, 16 Oct 2026 18:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792177070; cv=none; b=I9Iocg1HxhSzzrZpDrHJgq6qeKD9FAaVOLwxqi2+HndxykkSHjDG09vRv3n21crylTNQOFXvgSkNi29F+WNDIZvhkoYt8tnoOgiKvvXnhv6kZpYCMCvdPWdNJPwOqtwczIple85XfWgoe+If7F9FP2HBKprN90sVcEO234rK58g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792177070; c=relaxed/simple;
	bh=HmWJjxZqE+MrKbGPgqkCwL8+V+rd0OF1VxjDKlMGsCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gjbpuZlsOEcg+jZ576UYFCQgzRaYHLa++wgOHL9WOzeyLvTz1OP9neBR6MDD0k7F99SADOyCDFyfVCDq8bhU66+cAYKppdWit06gD6tPIsHZfwAWQbeyOa2VPfdHX5DFZn21s1SHlrXVSDh3vqX/us4Jg3VHpAEbJLXxsZ2dOCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=tk/Q2dm3; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="tk/Q2dm3"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0372416A3;
	Fri, 16 Oct 2026 11:57:44 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF58C3F7B4;
	Fri, 16 Oct 2026 11:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792177067; bh=HmWJjxZqE+MrKbGPgqkCwL8+V+rd0OF1VxjDKlMGsCk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tk/Q2dm3ybbvGZhNUCEvZK1pmGgLwNluzT0I+88N7oqF6JNYT8Z25VMcm6lzMBIbE
	 F8AlR+Kg/s9iScBB6c0mlbwPP+gKnGIYBSIYsfzshJV79JUCH9LLDFHhuH2DvXyF1f
	 PlQrSCLh2/lwCIAvdJaab+A9CpOBcGOx4svzNaKA=
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
Subject: [PATCH v14 19/32] firmware: arm_scmi: Add Telemetry boot-on support
Date: Fri, 16 Oct 2026 19:55:40 +0100
Message-ID: <20261016185553.2794459-20-cristian.marussi@arm.com>
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

Add the initialization and discovery logic needed to detect when the
platform SCMI server is configured with telemetry enabled at boot and
perform all the needed resource enumerations to keep the kernel telemetry
subsystem state aligned with the platform boot-on configurations.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v13 --> v14
 - moved some definitions from earlier split patch
 - renamed some fields to more strictly adhere to spec nomenclature
v12 --> v13
 - greb tde->mtx on DE_ENABLED_LIST
v11 --> v12
 - fixed TS_RATE determination at boot-on
v10 --> v11
 - fix non-conformancy on CONFIG_GET when groups NON configurable
 - use SCAN_UPDATE also on BOOT-ON initial scan (NO discovery)
 - avoid 'naked' ti->rinfo accesses
v8 -- > v9
 - remove useless initial state lookup after RESET
 - properly set de->tstamp_support on DE_ENABLED_LIST
v5 --> v6
 - reporte properly an error on scmi_telemetry_config_lookup() failure
   (Sashiko)
v4 --> v5
 - use renamed grp_id instead of old id in group descriptors
 - fixes sparse warnings
v3 --> v4
 - bail-out FW_BUG errors
 - fix typos in comments
 - track boot-on Telemetry DE states
v2 --> v3
 - split from monolithic telemetry protocol patch
 - swap logic in scmi_telemetry_initial_state_lookup
---
 drivers/firmware/arm_scmi/telemetry.c | 270 +++++++++++++++++++++++++-
 1 file changed, 266 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 71d885a326eb..08250372a282 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -135,6 +135,21 @@ struct scmi_msg_resp_telemetry_update_intervals {
 	__le32 intervals[];
 };
 
+struct scmi_msg_telemetry_de_enabled_list {
+	__le32 index;
+	__le32 flags;
+};
+
+struct scmi_enabled_de_desc {
+	__le32 id;
+	__le32 mode;
+};
+
+struct scmi_msg_resp_telemetry_de_enabled_list {
+	__le32 flags;
+	struct scmi_enabled_de_desc array[];
+};
+
 struct scmi_msg_telemetry_de_configure {
 	__le32 identifier;
 	__le32 flags;
@@ -183,6 +198,20 @@ struct scmi_msg_resp_telemetry_reading_complete {
 	__le32 array[] __counted_by_le(num_dwords);
 };
 
+struct scmi_msg_telemetry_config_get {
+	__le32 group_identifier;
+	__le32 flags;
+#define TELEMETRY_GET_SELECTOR(x)	(FIELD_PREP(GENMASK(3, 0), (x)))
+#define	TELEMETRY_GET_SELECTOR_ORPHANS	TELEMETRY_GET_SELECTOR(TLM_ORPHANS)
+#define	TELEMETRY_GET_SELECTOR_GROUP	TELEMETRY_GET_SELECTOR(TLM_GROUP)
+#define	TELEMETRY_GET_SELECTOR_ALL	TELEMETRY_GET_SELECTOR(TLM_ALL)
+};
+
+struct scmi_msg_resp_telemetry_config_get {
+	__le32 control;
+	__le32 sampling_rate;
+};
+
 /* TDCF */
 
 #define _I(__a)		(ioread32((void __iomem *)(__a)))
@@ -460,6 +489,8 @@ static inline bool scmi_tde_has_tstamp(struct telemetry_de *t)
 	return t->de.tstamp_support && t->de.tstamp_enabled;
 }
 
+#define DE_ENABLED_WITH_TSTAMP	2
+
 enum de_state {
 	ENA_STATE,
 	ENA_TSTAMP,
@@ -816,8 +847,13 @@ static int scmi_telemetry_de_descriptor_parse(struct telemetry_info *ti,
 		/* Variably sized depending on TS support */
 		*next += sizeof(*line_ts_rate);
 	} else if (tde->ts_type == TSTAMP_BLK) {
-		/* Setup default BLK TS value at first */
-		tde->de.info->ts_rate = ti->default_blk_ts_rate;
+		/*
+		 * Setup default BLK TS rate value at first, if it has NOT
+		 * already been picked from the BLK_TS line by the boot-on
+		 * SCAN_UPDATE.
+		 */
+		if (!tde->de.info->ts_rate)
+			tde->de.info->ts_rate = ti->default_blk_ts_rate;
 	}
 
 	if (tde->de.fc_support) {
@@ -928,6 +964,215 @@ static int iter_de_descr_process_response(const struct scmi_protocol_handle *ph,
 	return 0;
 }
 
+static int scmi_telemetry_config_lookup(struct telemetry_info *ti,
+					unsigned int grp_id, bool *enabled,
+					unsigned int *active_update_interval)
+{
+	const struct scmi_protocol_handle *ph = ti->ph;
+	struct scmi_msg_telemetry_config_get *msg;
+	struct scmi_msg_resp_telemetry_config_get *resp;
+	struct scmi_xfer *t;
+	u32 flags;
+	int ret;
+
+	ret = ph->xops->xfer_get_init(ph, TELEMETRY_CONFIG_GET,
+				      sizeof(*msg), sizeof(*resp), &t);
+	if (ret)
+		return ret;
+
+	msg = t->tx.buf;
+	msg->group_identifier = cpu_to_le32(grp_id);
+
+	/* Spec mandates the ALL selector when per-group config not available */
+	if (!ti->info.per_group_config_support)
+		flags = TELEMETRY_GET_SELECTOR_ALL;
+	else
+		flags = grp_id == SCMI_TLM_GRP_INVALID ?
+			TELEMETRY_GET_SELECTOR_ORPHANS :
+			TELEMETRY_GET_SELECTOR_GROUP;
+
+	msg->flags = cpu_to_le32(flags);
+
+	resp = t->rx.buf;
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		*enabled = le32_get_bits(resp->control, TELEMETRY_ENABLE);
+		*active_update_interval =
+			SCMI_TLM_GET_UPDATE_INTERVAL(le32_to_cpu(resp->sampling_rate));
+	}
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_telemetry_group_config_lookup(struct telemetry_info *ti,
+					      struct scmi_telemetry_group *grp)
+{
+	return scmi_telemetry_config_lookup(ti, grp->info->grp_id, &grp->enabled,
+					    &grp->active_update_interval);
+}
+
+static void iter_enabled_list_prepare_message(void *message,
+					      unsigned int desc_index,
+					      const void *priv)
+{
+	struct scmi_msg_telemetry_de_enabled_list *msg = message;
+
+	msg->index = cpu_to_le32(desc_index);
+	msg->flags = 0;
+}
+
+static int iter_enabled_list_update_state(struct scmi_iterator_state *st,
+					  const void *response, void *priv)
+{
+	const struct scmi_msg_resp_telemetry_de_enabled_list *r = response;
+
+	st->num_returned = le32_get_bits(r->flags, GENMASK(15, 0));
+	st->num_remaining = le32_get_bits(r->flags, GENMASK(31, 16));
+
+	if (st->rx_len < (sizeof(*r) + sizeof(r->array[0]) * st->num_returned))
+		return -EINVAL;
+
+	/*
+	 * total enabled is not declared previously anywhere so we
+	 * assume it's returned+remaining on first call.
+	 */
+	if (!st->max_resources)
+		st->max_resources = st->num_returned + st->num_remaining;
+
+	return 0;
+}
+
+static int
+iter_enabled_list_process_response(const struct scmi_protocol_handle *ph,
+				   const void *response,
+				   struct scmi_iterator_state *st, void *priv)
+{
+	const struct scmi_msg_resp_telemetry_de_enabled_list *r = response;
+	const struct scmi_enabled_de_desc *desc;
+	struct telemetry_info *ti = priv;
+	struct telemetry_de *tde;
+	u32 de_id;
+	int ret;
+
+	desc = &r->array[st->loop_idx];
+	de_id = le32_to_cpu(desc->id);
+	if (scmi_telemetry_tde_lookup(ti, de_id)) {
+		dev_err(ph->dev,
+			"Found INVALID DE with DUPLICATED ID:0x%08X\n", de_id);
+		return -EINVAL;
+	}
+
+	tde = scmi_telemetry_tde_get(ti, de_id);
+	if (IS_ERR(tde))
+		return PTR_ERR(tde);
+
+	guard(mutex)(&tde->mtx);
+	tde->de.info->id = de_id;
+	tde->de.enabled = true;
+	tde->de.tstamp_enabled = le32_to_cpu(desc->mode) == DE_ENABLED_WITH_TSTAMP;
+	/*
+	 * Guessing that, if a DE is reported as enabled with timestamp, it has
+	 * to support timestamp: NOTE THAT the timestamp type (tde->ts_type) can
+	 * ONLY be discovered later by  DE_DESCRIPTION.
+	 */
+	tde->de.tstamp_support = tde->de.tstamp_enabled;
+
+	ret = scmi_telemetry_tde_register(ti, tde);
+	if (ret) {
+		scmi_telemetry_free_tde_put(ti, tde);
+		return ret;
+	}
+
+	scmi_telemetry_de_state_update(ti, ENA_STATE, NULL, true);
+	if (tde->de.tstamp_enabled)
+		scmi_telemetry_de_state_update(ti, ENA_TSTAMP, NULL, true);
+
+	dev_dbg(ph->dev, "Registered new ENABLED DE with ID:0x%08X\n",
+		tde->de.info->id);
+
+	return 0;
+}
+
+static int scmi_telemetry_enumerate_des_enabled_list(struct telemetry_info *ti)
+{
+	const struct scmi_protocol_handle *ph = ti->ph;
+	struct scmi_telemetry_res_info *rinfo;
+	struct scmi_iterator_ops ops = {
+		.prepare_message = iter_enabled_list_prepare_message,
+		.update_state = iter_enabled_list_update_state,
+		.process_response = iter_enabled_list_process_response,
+	};
+	void *iter;
+	int ret;
+
+	iter = ph->hops->iter_response_init(ph, &ops, 0,
+					    TELEMETRY_DE_ENABLED_LIST,
+					    sizeof(u32) * 2, ti);
+	if (IS_ERR(iter))
+		return PTR_ERR(iter);
+
+	ret = ph->hops->iter_response_run(iter);
+	if (ret)
+		return ret;
+
+	/* Get rinfo as it is...without triggering an enumeration */
+	rinfo = __scmi_telemetry_resources_get(ti);
+
+	dev_info(ti->ph->dev, "Found %u enabled DEs.\n", rinfo->num_des);
+
+	return 0;
+}
+
+static int scmi_telemetry_initial_state_lookup(struct telemetry_info *ti)
+{
+	struct device *dev = ti->ph->dev;
+	int ret;
+
+	ret = scmi_telemetry_config_lookup(ti, SCMI_TLM_GRP_INVALID,
+					   &ti->info.enabled,
+					   &ti->info.active_update_interval);
+	if (ret)
+		return ret;
+
+	if (!ti->info.enabled)
+		return 0;
+
+	/*
+	 * When Telemetry is found already enabled on the platform, proceed with
+	 * passive discovery using DE_ENABLED_LIST and TDCF scanning: note that
+	 * this CAN only discover DEs exposed via SHMTIs.
+	 * FastChannel DEs need a proper DE_DESCRIPTION enumeration, while, even
+	 * though incoming Notifications could be used for passive discovery too,
+	 * it would carry a considerable risk of assimilating trash as DEs.
+	 */
+	dev_info(dev,
+		 "Telemetry found enabled with update interval %lux10^%d\n",
+		 SCMI_TLM_GET_UPDATE_INTERVAL_SECS(ti->info.active_update_interval),
+		 SCMI_TLM_GET_UPDATE_INTERVAL_EXP(ti->info.active_update_interval));
+	/*
+	 * Query enabled DEs list: collect states. It will include DEs from any
+	 * interface. Enabled groups still NOT enumerated.
+	 */
+	ret = scmi_telemetry_enumerate_des_enabled_list(ti);
+	if (ret) {
+		dev_err(dev, FW_BUG "Cannot query enabled DE list. Abort.\n");
+		return ret;
+	}
+
+	/* Discover DEs on SHMTis: collect states/offsets/values */
+	for (int id = 0; id < ti->num_shmti; id++) {
+		ret = scmi_telemetry_shmti_scan(ti, id, SCAN_UPDATE);
+		if (ret)
+			dev_warn(dev,
+				 "Failed discovery-scan of SHMTI ID:%d - ret:%d\n",
+				 id, ret);
+	}
+
+	return 0;
+}
+
 static int
 scmi_telemetry_de_groups_init(struct device *dev, struct telemetry_info *ti)
 {
@@ -1008,6 +1253,9 @@ scmi_telemetry_de_groups_init(struct device *dev, struct telemetry_info *ti)
 		}
 	}
 
+	for (int i = 0; i < ti->info.base.num_groups; i++)
+		scmi_telemetry_group_config_lookup(ti, &rinfo->grps[i]);
+
 	/* Expose all groups once all fully initialized */
 	rinfo->num_groups = num_groups;
 
@@ -2075,9 +2323,17 @@ static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
 		tde->eplg = SHMTI_EPLG(shmti);
 		tde->offset = (void __iomem *)payld - (void __iomem *)shmti->base;
 
+		/* Just in case it was passively discovered boot-on */
+		if (tde->ts_type == TSTAMP_NONE) {
+			if (use_blk_ts)
+				tde->ts_type = TSTAMP_BLK;
+			else if (LINE_TS_VALID(payld))
+				tde->ts_type = TSTAMP_LINE;
+		}
+
 		dev_dbg(ti->ph->dev,
-			"TDCF-updated DE_ID:0x%08X - shmti:%pK  offset:%u\n",
-			tde->de.info->id, tde->base, tde->offset);
+			"TDCF-updated DE_ID:0x%08X - shmti:%pK  offset:%u  ts_type:%d\n",
+			tde->de.info->id, tde->base, tde->offset, tde->ts_type);
 	}
 
 	/* Has any value/tstamp really changed ?*/
@@ -3981,6 +4237,12 @@ static int scmi_telemetry_protocol_init(const struct scmi_protocol_handle *ph)
 		return ret;
 	}
 
+	ret = scmi_telemetry_initial_state_lookup(ti);
+	if (ret) {
+		dev_err(dev, FW_BUG "Cannot retrieve initial state. Abort.\n");
+		return ret;
+	}
+
 	ti->info.base.version = ph->version;
 
 	ret = ph->set_priv(ph, ti);
-- 
2.54.0

