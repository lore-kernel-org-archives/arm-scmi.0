Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF41D395ACE;
	Sat, 15 Aug 2026 23:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786836444; cv=none; b=lajMvUxoTn6bqLrDim3yQRvtsCyQLfINzc5eoqS4+67KoaeMcHQoSFE52OADLydFdR23xcYy/ImiUpj6VJOmNApp+gnEE5pB9wzHwD9/VnL0WZdVUXwwO76MtFVA6/D7sIwwFE4ij6xt9lLrrKzAzaIFMjG0bde12VSBsflVF2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786836444; c=relaxed/simple;
	bh=f7gYEbNK7lFRDw+xo7n3gLFpoHXAGs/SXDNksojdQ7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gCVHP5KHxSxEO0ZqhaJLsvR9a8PSfcB5K6wYgiPknTMdJzY9P+M5+fG5frSJmYSNXAbSbaXEW/lGN3sa+g3paidsRaG2j/Ueq3dZN/VN088ySz9xp5adIT0iUChLpRwC3ve4PrzF4L4k+8NAmBHge9ekaX1jVhkGk2Gi5LVyXm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MSZtThYq; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MSZtThYq"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D69E15A1;
	Sat, 15 Aug 2026 16:27:17 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E27DE3F673;
	Sat, 15 Aug 2026 16:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786836441; bh=f7gYEbNK7lFRDw+xo7n3gLFpoHXAGs/SXDNksojdQ7Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MSZtThYqjp7CahXRgUUr5Vc8ofgYZQGXMJ+S//6nY3YBwrjTNvvt0UxakXhFTHLjr
	 g7ykqk3iqBeEtQ1O3zWanUcIvOFgrrp/ixCUNc+KlN+jKilk+/ecLooJQ4Wuvr17wL
	 2nv1hSaCl6OHB4cZN8nJhW6NK5XcqcRxc/bDmWms=
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
Subject: [PATCH v10 12/24] firmware: arm_scmi: Add support for boot-on Telemetry
Date: Sun, 16 Aug 2026 00:25:52 +0100
Message-ID: <20260815232604.3730754-13-cristian.marussi@arm.com>
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

Add the initialization and discovery logic needed to detect when the
platform SCMI server is configured with telemetry enabled at boot and
perform all the needed resource enumerations to keep the kernel telemetry
subsystem state aligned with the platform boot-on configurations.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
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
 drivers/firmware/arm_scmi/telemetry.c | 208 ++++++++++++++++++++++++++
 1 file changed, 208 insertions(+)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 4d8fbc50b1f4..78120236340c 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -908,6 +908,204 @@ static int iter_de_descr_process_response(const struct scmi_protocol_handle *ph,
 	return ret;
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
+	msg->grp_id = cpu_to_le32(grp_id);
+	flags = grp_id == SCMI_TLM_GRP_INVALID ?
+		TELEMETRY_GET_SELECTOR_ORPHANS : TELEMETRY_GET_SELECTOR_GROUP;
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
+	if (st->rx_len < (sizeof(*r) + sizeof(r->entry[0]) * st->num_returned))
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
+	desc = &r->entry[st->loop_idx];
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
+	struct scmi_telemetry_res_info *rinfo = ti->rinfo;
+	const struct scmi_protocol_handle *ph = ti->ph;
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
+		ret = scmi_telemetry_shmti_scan(ti, id, SCAN_DISCOVERY);
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
@@ -987,6 +1185,9 @@ scmi_telemetry_de_groups_init(struct device *dev, struct telemetry_info *ti)
 		}
 	}
 
+	for (int i = 0; i < ti->info.base.num_groups; i++)
+		scmi_telemetry_group_config_lookup(ti, &rinfo->grps[i]);
+
 	/* Expose all groups once all fully initialized */
 	rinfo->num_groups = num_groups;
 
@@ -2964,6 +3165,7 @@ static int scmi_telemetry_reset(const struct scmi_protocol_handle *ph)
 		struct telemetry_info *ti = ph->get_priv(ph);
 
 		scmi_telemetry_local_resources_reset(ti);
+		/* NO need to lookup the initial state we have just reset all */
 	}
 
 	ph->xops->xfer_put(ph, t);
@@ -3420,6 +3622,12 @@ static int scmi_telemetry_protocol_init(const struct scmi_protocol_handle *ph)
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

