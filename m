Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215764;
	b=EjbWN/msIIZquXdqrk2vPfkKXe7hschBWkz9JkeV4ohN8KKZIo3xApJQLgRUgvJVA5ZL
	 TTJprpnM2xTXcZzScte626DZXCl3+2wqY9GQXgkGN0cdJZwZ9v7atpQoF85V67UnxDbcI
	 VGxAIpQVxpGRXkfflPbiTHTI2q8m+wPOWkzgTjBIWzX8KfXE+4ZukSNbJFQxP5OpKRMlw
	 JMIv8rUlR2cjU2KnxmDf59w+jtiPuxCnbaiQT2CCTWU8USuWbxsTp9R8lvYhHFCsmC5Xj
	 SBdMvWX76ESWfppZ2O58tu3bwOCd8jhBQCNmGYQYgPkGnVcnI4KsSniNJCP97yN8RFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215764;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rHUaNiJHm9OVw0eGrt3YT7LvgObhHe+iGU9JtkMPoyw=;
	b=KyZanB3PP37vtbG8LcLQ+pIgzPzrcb9UP/0kAfvbfht+tXj2vUUeYxxo8NSeIEfiLf84
	 IB11wNIxsDaI4qbSGJDa0sJTNnnOMMobZkRCHLYem8tUt7QFUsH7lKMRio+5xzKmj9hpN
	 Ga4hM3Zris9VnSRXSq/8vIlWyU3/i2XNLku/+7i+faCPJsAYf7LgrYq+Omr6mBR/H21kc
	 earG8bdMgylx4M9PR74YsFMuK7oL2wlJjI4i5LjVWwk+bU/s/5pzUG1nLFHPmRCw/P9Cb
	 t6HVvN+apqZyBilmGZySU/HoHepD/FxqwklZPyticjtO88yanqjb5Sy1eDApA6zxZew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AUwY+ugV;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDD7D60A261F;
	Mon,  9 Nov 2026 09:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDD7D60A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AUwY+ugV
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19C0914BF;
	Mon,  9 Nov 2026 01:16:00 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A9CE3F85F;
	Mon,  9 Nov 2026 01:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794215763; bh=4X5oZxIWLIPkq7d4nPclCyF7wyK96AViekl8NFuhTE4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AUwY+ugVBGtMXQq47y+jOWH+SZ4mNAiDDIxHvhW/aksbbEWKy19upCvyv9JyIP4kF
	 fAvLyZt2B7tsT9OQVCNFC6RrM9xLLTrJ2LD/ZLIUspgmpLurf2BeCZ+6cca/0jesIe
	 bkqo5WU9ula1YBSBPlIQrBBgKiQMrGpI0G4a+TdY=
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
Subject: [PATCH v15 21/35] firmware: arm_scmi: Add Telemetry boot-on support
Date: Mon,  9 Nov 2026 09:12:07 +0000
Message-ID: <20261109091221.2532706-22-cristian.marussi@arm.com>
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

Add the initialization and discovery logic needed to detect when the
platform SCMI server is configured with telemetry enabled at boot and
perform all the needed resource enumerations to keep the kernel telemetry
subsystem state aligned with the platform boot-on configurations.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v14 --> v15
 - use IS_TDE_TS_ macro
 - retrieve collection_mode at boot-on and force ignore groups
 - count only successfully initialized groups at boot-on
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
 drivers/firmware/arm_scmi/telemetry.c | 287 +++++++++++++++++++++++++-
 1 file changed, 280 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 918067e225d5..2322348f98c9 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -141,6 +141,21 @@ struct scmi_msg_resp_telemetry_update_intervals {
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
@@ -189,6 +204,20 @@ struct scmi_msg_resp_telemetry_reading_complete {
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
@@ -528,6 +557,8 @@ static inline bool scmi_tde_has_tstamp(struct telemetry_de *t)
 	return t->de.tstamp_support && t->de.tstamp_enabled;
 }
 
+#define DE_ENABLED_WITH_TSTAMP	2
+
 enum de_state {
 	ENA_STATE,
 	ENA_TSTAMP,
@@ -943,9 +974,14 @@ static int scmi_telemetry_de_descriptor_parse(struct telemetry_info *ti,
 
 		/* Variably sized depending on TS support */
 		*next += sizeof(*line_ts_rate);
-	} else if (tde->ts_type == TSTAMP_BLK) {
-		/* Setup default BLK TS value at first */
-		tde->de.info->ts_rate = ti->default_blk_ts_rate;
+	} else if (IS_TDE_TS_BLK(tde)) {
+		/*
+		 * Setup default BLK TS rate value at first, if it has NOT
+		 * already been picked from the BLK_TS line by the boot-on
+		 * SCAN_UPDATE.
+		 */
+		if (!tde->de.info->ts_rate)
+			tde->de.info->ts_rate = ti->default_blk_ts_rate;
 	}
 
 	if (tde->de.fc_support) {
@@ -1077,6 +1113,224 @@ static int iter_de_descr_process_response(const struct scmi_protocol_handle *ph,
 	return 0;
 }
 
+static int scmi_telemetry_config_lookup(struct telemetry_info *ti,
+					unsigned int grp_id, bool *enabled,
+					unsigned int *active_update_interval,
+					enum scmi_telemetry_collection *mode,
+					bool ignore_groups)
+{
+	const struct scmi_protocol_handle *ph = ti->ph;
+	struct scmi_msg_telemetry_config_get *msg;
+	struct scmi_msg_resp_telemetry_config_get *resp;
+	bool is_group = grp_id != SCMI_TLM_GRP_INVALID;
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
+	if (!ti->info.per_group_config_support || ignore_groups)
+		flags = TELEMETRY_GET_SELECTOR_ALL;
+	else
+		flags = !is_group ? TELEMETRY_GET_SELECTOR_ORPHANS :
+			TELEMETRY_GET_SELECTOR_GROUP;
+
+	msg->flags = cpu_to_le32(flags);
+
+	resp = t->rx.buf;
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		*enabled = le32_get_bits(resp->control, TELEMETRY_ENABLE);
+		*mode = le32_get_bits(resp->control, TELEMETRY_MODE);
+		if (!is_group)
+			ti->streaming_mode = *mode == SCMI_TLM_NOTIFICATION;
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
+					    &grp->active_update_interval,
+					    &grp->current_mode, false);
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
+	/* Discover the initial state ONLY for DEs, ignoring groups */
+	ret = scmi_telemetry_config_lookup(ti, SCMI_TLM_GRP_INVALID,
+					   &ti->info.enabled,
+					   &ti->info.active_update_interval,
+					   &ti->info.current_mode, true);
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
+		 "Telemetry found enabled with update interval %lux10^%d mode:%u\n",
+		 SCMI_TLM_GET_UPDATE_INTERVAL_SECS(ti->info.active_update_interval),
+		 SCMI_TLM_GET_UPDATE_INTERVAL_EXP(ti->info.active_update_interval),
+		 ti->info.current_mode);
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
 scmi_telemetry_de_groups_init(struct telemetry_info *ti)
 {
@@ -1163,8 +1417,13 @@ scmi_telemetry_de_groups_init(struct telemetry_info *ti)
 		}
 	}
 
-	/* Expose all groups once all fully initialized */
-	rinfo->num_groups = num_groups;
+	for (int i = 0; i < ti->info.base.num_groups; i++) {
+		/* Expose groups once successfully initialized */
+		if (!scmi_telemetry_group_config_lookup(ti, &rinfo->grps[i]))
+			rinfo->num_groups++;
+		else
+			trace_scmi_tlm_access(0, "GROUP_LOOKUP_FAILED", 0, 0);
+	}
 
 	return 0;
 }
@@ -2335,9 +2594,17 @@ static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
 
 		trace_scmi_tlm_access(de_id, "DE_LOCATION_UPDATED", 0, 0);
 
+		/* Just in case it was passively discovered boot-on */
+		if (IS_TDE_TS_NONE(tde)) {
+			if (use_blk_ts)
+				tde->ts_type = TSTAMP_BLK;
+			else if (LINE_TS_VALID_RAW(meta))
+				tde->ts_type = TSTAMP_LINE;
+		}
+
 		dev_dbg(ti->ph->dev,
-			"TDCF-updated DE_ID:0x%08X - shmti:%pK  offset:%u\n",
-			tde->de.info->id, tde->base, tde->offset);
+			"TDCF-updated DE_ID:0x%08X - shmti:%pK  offset:%u  ts_type:%d\n",
+			tde->de.info->id, tde->base, tde->offset, tde->ts_type);
 	}
 
 	/*
@@ -4643,6 +4910,12 @@ static int scmi_telemetry_protocol_init(const struct scmi_protocol_handle *ph)
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

