Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C002561A2;
	Sat, 27 Dec 2025 16:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766854293; cv=none; b=EZUOEo8GvjZ4z/B3aXD01wYKk4BUxMu+lYn4WBOd4mxUfKb0LShp3roTS4NXpL8siaFYjkJ0lMWmBD1b6eFLlfj2kIxkK4q6TxcMoe+oFuGOWqAZRYp8byxEol2xSzhTHMhjlNIyEPhzi5j1KfpUdMuUZACOIGD8n9/r85hNNLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766854293; c=relaxed/simple;
	bh=wRuJq++J+Pc3TX+wUFfaYnwNuo9Gnb7ukxqxrwkPfZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oviPfyR7XTgdoNXczAz9LrLhNpt6YxorbCZ/o5+Ovveub091KXrh4yrdX9jhpJcPCVY7jBvuEiqPPHGkBMobCkd/U7r2fxvLXSHuT5ZwQI+qNPqBNvYl5AGDDZWNt+r+tKcbhVNrYmxlwhPQAEF4+leZzJHK3hydiL9mBpB0ZqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95BD81684;
	Sat, 27 Dec 2025 08:42:02 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 45F9A3F694;
	Sat, 27 Dec 2025 08:42:06 -0800 (PST)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	philip.radford@arm.com,
	peng.fan@oss.nxp.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 2/2] firmware: arm_scmi: Remove legacy protocol versioning logic
Date: Sat, 27 Dec 2025 16:41:32 +0000
Message-ID: <20251227164132.1311988-3-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251227164132.1311988-1-cristian.marussi@arm.com>
References: <20251227164132.1311988-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Protocol version negotiation logic is centralized in the SCMI core stack
so that most of the legacy per-protocol versioning logic is redundant and
can be removed.

Remove protocol-specific versioning code and refactor all the protocols to
use the new simplified centralized logic.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/base.c              | 11 +---
 drivers/firmware/arm_scmi/clock.c             | 24 +++-----
 drivers/firmware/arm_scmi/driver.c            |  5 +-
 drivers/firmware/arm_scmi/perf.c              | 57 +++++++------------
 drivers/firmware/arm_scmi/pinctrl.c           | 12 +---
 drivers/firmware/arm_scmi/power.c             | 18 ++----
 drivers/firmware/arm_scmi/powercap.c          | 21 +++----
 drivers/firmware/arm_scmi/protocols.h         |  5 +-
 drivers/firmware/arm_scmi/reset.c             | 18 ++----
 drivers/firmware/arm_scmi/sensors.c           | 22 +++----
 drivers/firmware/arm_scmi/system.c            | 14 +----
 .../arm_scmi/vendors/imx/imx-sm-bbm.c         | 10 +---
 .../arm_scmi/vendors/imx/imx-sm-cpu.c         |  9 +--
 .../arm_scmi/vendors/imx/imx-sm-lmm.c         |  9 +--
 .../arm_scmi/vendors/imx/imx-sm-misc.c        | 10 +---
 drivers/firmware/arm_scmi/voltage.c           | 13 +----
 16 files changed, 72 insertions(+), 186 deletions(-)

diff --git a/drivers/firmware/arm_scmi/base.c b/drivers/firmware/arm_scmi/base.c
index 86b376c50a13..22267bbd0f4d 100644
--- a/drivers/firmware/arm_scmi/base.c
+++ b/drivers/firmware/arm_scmi/base.c
@@ -375,18 +375,13 @@ static int scmi_base_protocol_init(const struct scmi_protocol_handle *ph)
 {
 	int id, ret;
 	u8 *prot_imp;
-	u32 version;
 	char name[SCMI_SHORT_NAME_MAX_SIZE];
 	struct device *dev = ph->dev;
 	struct scmi_revision_info *rev = scmi_revision_area_get(ph);
 
-	ret = ph->xops->version_get(ph, &version);
-	if (ret)
-		return ret;
-
-	rev->major_ver = PROTOCOL_REV_MAJOR(version);
-	rev->minor_ver = PROTOCOL_REV_MINOR(version);
-	ph->set_priv(ph, rev, version);
+	rev->major_ver = PROTOCOL_REV_MAJOR(ph->version);
+	rev->minor_ver = PROTOCOL_REV_MINOR(ph->version);
+	ph->set_priv(ph, rev);
 
 	ret = scmi_base_attributes_get(ph);
 	if (ret)
diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index afa7981efe82..ab36871650a1 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -157,7 +157,6 @@ struct scmi_clock_rate_notify_payld {
 };
 
 struct clock_info {
-	u32 version;
 	int num_clocks;
 	int max_async_req;
 	bool notify_rate_changed_cmd;
@@ -346,8 +345,7 @@ scmi_clock_get_permissions(const struct scmi_protocol_handle *ph, u32 clk_id,
 }
 
 static int scmi_clock_attributes_get(const struct scmi_protocol_handle *ph,
-				     u32 clk_id, struct clock_info *cinfo,
-				     u32 version)
+				     u32 clk_id, struct clock_info *cinfo)
 {
 	int ret;
 	u32 attributes;
@@ -370,7 +368,7 @@ static int scmi_clock_attributes_get(const struct scmi_protocol_handle *ph,
 		attributes = le32_to_cpu(attr->attributes);
 		strscpy(clk->name, attr->name, SCMI_SHORT_NAME_MAX_SIZE);
 		/* clock_enable_latency field is present only since SCMI v3.1 */
-		if (PROTOCOL_REV_MAJOR(version) >= 0x2)
+		if (PROTOCOL_REV_MAJOR(ph->version) >= 0x2)
 			latency = le32_to_cpu(attr->clock_enable_latency);
 		clk->enable_latency = latency ? : U32_MAX;
 	}
@@ -381,7 +379,7 @@ static int scmi_clock_attributes_get(const struct scmi_protocol_handle *ph,
 	 * If supported overwrite short name with the extended one;
 	 * on error just carry on and use already provided short name.
 	 */
-	if (!ret && PROTOCOL_REV_MAJOR(version) >= 0x2) {
+	if (!ret && PROTOCOL_REV_MAJOR(ph->version) >= 0x2) {
 		if (SUPPORTS_EXTENDED_NAMES(attributes))
 			ph->hops->extended_name_get(ph, CLOCK_NAME_GET, clk_id,
 						    NULL, clk->name,
@@ -393,7 +391,7 @@ static int scmi_clock_attributes_get(const struct scmi_protocol_handle *ph,
 		if (cinfo->notify_rate_change_requested_cmd &&
 		    SUPPORTS_RATE_CHANGE_REQUESTED_NOTIF(attributes))
 			clk->rate_change_requested_notifications = true;
-		if (PROTOCOL_REV_MAJOR(version) >= 0x3) {
+		if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {
 			if (SUPPORTS_PARENT_CLOCK(attributes))
 				scmi_clock_possible_parents(ph, clk_id, clk);
 			if (SUPPORTS_GET_PERMISSIONS(attributes))
@@ -1068,16 +1066,11 @@ static const struct scmi_protocol_events clk_protocol_events = {
 
 static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
 {
-	u32 version;
 	int clkid, ret;
 	struct clock_info *cinfo;
 
-	ret = ph->xops->version_get(ph, &version);
-	if (ret)
-		return ret;
-
 	dev_dbg(ph->dev, "Clock Version %d.%d\n",
-		PROTOCOL_REV_MAJOR(version), PROTOCOL_REV_MINOR(version));
+		PROTOCOL_REV_MAJOR(ph->version), PROTOCOL_REV_MINOR(ph->version));
 
 	cinfo = devm_kzalloc(ph->dev, sizeof(*cinfo), GFP_KERNEL);
 	if (!cinfo)
@@ -1095,12 +1088,12 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
 	for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
 		struct scmi_clock_info *clk = cinfo->clk + clkid;
 
-		ret = scmi_clock_attributes_get(ph, clkid, cinfo, version);
+		ret = scmi_clock_attributes_get(ph, clkid, cinfo);
 		if (!ret)
 			scmi_clock_describe_rates_get(ph, clkid, clk);
 	}
 
-	if (PROTOCOL_REV_MAJOR(version) >= 0x3) {
+	if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {
 		cinfo->clock_config_set = scmi_clock_config_set_v2;
 		cinfo->clock_config_get = scmi_clock_config_get_v2;
 	} else {
@@ -1108,8 +1101,7 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
 		cinfo->clock_config_get = scmi_clock_config_get;
 	}
 
-	cinfo->version = version;
-	return ph->set_priv(ph, cinfo, version);
+	return ph->set_priv(ph, cinfo);
 }
 
 static const struct scmi_protocol scmi_clock = {
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 094cfcf51d28..3e76a3204ba4 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1627,17 +1627,15 @@ static int version_get(const struct scmi_protocol_handle *ph, u32 *version)
  *
  * @ph: A reference to the protocol handle.
  * @priv: The private data to set.
- * @version: The detected protocol version for the core to register.
  *
  * Return: 0 on Success
  */
 static int scmi_set_protocol_priv(const struct scmi_protocol_handle *ph,
-				  void *priv, u32 version)
+				  void *priv)
 {
 	struct scmi_protocol_instance *pi = ph_to_pi(ph);
 
 	pi->priv = priv;
-	pi->version = version;
 
 	return 0;
 }
@@ -1657,7 +1655,6 @@ static void *scmi_get_protocol_priv(const struct scmi_protocol_handle *ph)
 }
 
 static const struct scmi_xfer_ops xfer_ops = {
-	.version_get = version_get,
 	.xfer_get_init = xfer_get_init,
 	.reset_rx_to_maxsz = reset_rx_to_maxsz,
 	.do_xfer = do_xfer,
diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
index 683fd9b85c5c..c4f6284ccb31 100644
--- a/drivers/firmware/arm_scmi/perf.c
+++ b/drivers/firmware/arm_scmi/perf.c
@@ -178,7 +178,6 @@ struct perf_dom_info {
 })
 
 struct scmi_perf_info {
-	u32 version;
 	u16 num_domains;
 	enum scmi_power_scale power_scale;
 	u64 stats_addr;
@@ -215,7 +214,7 @@ static int scmi_perf_attributes_get(const struct scmi_protocol_handle *ph,
 
 		if (POWER_SCALE_IN_MILLIWATT(flags))
 			pi->power_scale = SCMI_POWER_MILLIWATTS;
-		if (PROTOCOL_REV_MAJOR(pi->version) >= 0x3)
+		if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3)
 			if (POWER_SCALE_IN_MICROWATT(flags))
 				pi->power_scale = SCMI_POWER_MICROWATTS;
 
@@ -251,8 +250,7 @@ static void scmi_perf_xa_destroy(void *data)
 static int
 scmi_perf_domain_attributes_get(const struct scmi_protocol_handle *ph,
 				struct perf_dom_info *dom_info,
-				bool notify_lim_cmd, bool notify_lvl_cmd,
-				u32 version)
+				bool notify_lim_cmd, bool notify_lvl_cmd)
 {
 	int ret;
 	u32 flags;
@@ -280,7 +278,7 @@ scmi_perf_domain_attributes_get(const struct scmi_protocol_handle *ph,
 			dom_info->perf_level_notify =
 				SUPPORTS_PERF_LEVEL_NOTIFY(flags);
 		dom_info->perf_fastchannels = SUPPORTS_PERF_FASTCHANNELS(flags);
-		if (PROTOCOL_REV_MAJOR(version) >= 0x4)
+		if (PROTOCOL_REV_MAJOR(ph->version) >= 0x4)
 			dom_info->level_indexing_mode =
 				SUPPORTS_LEVEL_INDEXING(flags);
 		dom_info->rate_limit_us = le32_to_cpu(attr->rate_limit_us) &
@@ -323,7 +321,7 @@ scmi_perf_domain_attributes_get(const struct scmi_protocol_handle *ph,
 	 * If supported overwrite short name with the extended one;
 	 * on error just carry on and use already provided short name.
 	 */
-	if (!ret && PROTOCOL_REV_MAJOR(version) >= 0x3 &&
+	if (!ret && PROTOCOL_REV_MAJOR(ph->version) >= 0x3 &&
 	    SUPPORTS_EXTENDED_NAMES(flags))
 		ph->hops->extended_name_get(ph, PERF_DOMAIN_NAME_GET,
 					    dom_info->id, NULL, dom_info->info.name,
@@ -345,19 +343,14 @@ static int opp_cmp_func(const void *opp1, const void *opp2)
 	return t1->perf - t2->perf;
 }
 
-struct scmi_perf_ipriv {
-	u32 version;
-	struct perf_dom_info *perf_dom;
-};
-
 static void iter_perf_levels_prepare_message(void *message,
 					     unsigned int desc_index,
 					     const void *priv)
 {
 	struct scmi_msg_perf_describe_levels *msg = message;
-	const struct scmi_perf_ipriv *p = priv;
+	const struct perf_dom_info *perf_dom = priv;
 
-	msg->domain = cpu_to_le32(p->perf_dom->id);
+	msg->domain = cpu_to_le32(perf_dom->id);
 	/* Set the number of OPPs to be skipped/already read */
 	msg->level_index = cpu_to_le32(desc_index);
 }
@@ -445,21 +438,21 @@ iter_perf_levels_process_response(const struct scmi_protocol_handle *ph,
 {
 	int ret;
 	struct scmi_opp *opp;
-	struct scmi_perf_ipriv *p = priv;
+	struct perf_dom_info *perf_dom = priv;
 
-	opp = &p->perf_dom->opp[p->perf_dom->opp_count];
-	if (PROTOCOL_REV_MAJOR(p->version) <= 0x3)
-		ret = process_response_opp(ph->dev, p->perf_dom, opp,
+	opp = &perf_dom->opp[perf_dom->opp_count];
+	if (PROTOCOL_REV_MAJOR(ph->version) <= 0x3)
+		ret = process_response_opp(ph->dev, perf_dom, opp,
 					   st->loop_idx, response);
 	else
-		ret = process_response_opp_v4(ph->dev, p->perf_dom, opp,
+		ret = process_response_opp_v4(ph->dev, perf_dom, opp,
 					      st->loop_idx, response);
 
 	/* Skip BAD duplicates received from firmware */
 	if (ret)
 		return ret == -EBUSY ? 0 : ret;
 
-	p->perf_dom->opp_count++;
+	perf_dom->opp_count++;
 
 	dev_dbg(ph->dev, "Level %d Power %d Latency %dus Ifreq %d Index %d\n",
 		opp->perf, opp->power, opp->trans_latency_us,
@@ -470,7 +463,7 @@ iter_perf_levels_process_response(const struct scmi_protocol_handle *ph,
 
 static int
 scmi_perf_describe_levels_get(const struct scmi_protocol_handle *ph,
-			      struct perf_dom_info *perf_dom, u32 version)
+			      struct perf_dom_info *perf_dom)
 {
 	int ret;
 	void *iter;
@@ -479,15 +472,11 @@ scmi_perf_describe_levels_get(const struct scmi_protocol_handle *ph,
 		.update_state = iter_perf_levels_update_state,
 		.process_response = iter_perf_levels_process_response,
 	};
-	struct scmi_perf_ipriv ppriv = {
-		.version = version,
-		.perf_dom = perf_dom,
-	};
 
 	iter = ph->hops->iter_response_init(ph, &ops, MAX_OPPS,
 					    PERF_DESCRIBE_LEVELS,
 					    sizeof(struct scmi_msg_perf_describe_levels),
-					    &ppriv);
+					    perf_dom);
 	if (IS_ERR(iter))
 		return PTR_ERR(iter);
 
@@ -576,7 +565,6 @@ static int __scmi_perf_limits_set(const struct scmi_protocol_handle *ph,
 static int scmi_perf_limits_set(const struct scmi_protocol_handle *ph,
 				u32 domain, u32 max_perf, u32 min_perf)
 {
-	struct scmi_perf_info *pi = ph->get_priv(ph);
 	struct perf_dom_info *dom;
 
 	dom = scmi_perf_domain_lookup(ph, domain);
@@ -586,7 +574,7 @@ static int scmi_perf_limits_set(const struct scmi_protocol_handle *ph,
 	if (!dom->set_limits)
 		return -EOPNOTSUPP;
 
-	if (PROTOCOL_REV_MAJOR(pi->version) >= 0x3 && !max_perf && !min_perf)
+	if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3 && !max_perf && !min_perf)
 		return -EINVAL;
 
 	if (dom->level_indexing_mode) {
@@ -1281,22 +1269,15 @@ static const struct scmi_protocol_events perf_protocol_events = {
 static int scmi_perf_protocol_init(const struct scmi_protocol_handle *ph)
 {
 	int domain, ret;
-	u32 version;
 	struct scmi_perf_info *pinfo;
 
-	ret = ph->xops->version_get(ph, &version);
-	if (ret)
-		return ret;
-
 	dev_dbg(ph->dev, "Performance Version %d.%d\n",
-		PROTOCOL_REV_MAJOR(version), PROTOCOL_REV_MINOR(version));
+		PROTOCOL_REV_MAJOR(ph->version), PROTOCOL_REV_MINOR(ph->version));
 
 	pinfo = devm_kzalloc(ph->dev, sizeof(*pinfo), GFP_KERNEL);
 	if (!pinfo)
 		return -ENOMEM;
 
-	pinfo->version = version;
-
 	ret = scmi_perf_attributes_get(ph, pinfo);
 	if (ret)
 		return ret;
@@ -1311,8 +1292,8 @@ static int scmi_perf_protocol_init(const struct scmi_protocol_handle *ph)
 
 		dom->id = domain;
 		scmi_perf_domain_attributes_get(ph, dom, pinfo->notify_lim_cmd,
-						pinfo->notify_lvl_cmd, version);
-		scmi_perf_describe_levels_get(ph, dom, version);
+						pinfo->notify_lvl_cmd);
+		scmi_perf_describe_levels_get(ph, dom);
 
 		if (dom->perf_fastchannels)
 			scmi_perf_domain_init_fc(ph, dom);
@@ -1322,7 +1303,7 @@ static int scmi_perf_protocol_init(const struct scmi_protocol_handle *ph)
 	if (ret)
 		return ret;
 
-	return ph->set_priv(ph, pinfo, version);
+	return ph->set_priv(ph, pinfo);
 }
 
 static const struct scmi_protocol scmi_perf = {
diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index 3855c98caf06..ecb83b329f23 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -117,7 +117,6 @@ struct scmi_pin_info {
 };
 
 struct scmi_pinctrl_info {
-	u32 version;
 	int nr_groups;
 	int nr_functions;
 	int nr_pins;
@@ -843,15 +842,10 @@ static const struct scmi_pinctrl_proto_ops pinctrl_proto_ops = {
 static int scmi_pinctrl_protocol_init(const struct scmi_protocol_handle *ph)
 {
 	int ret;
-	u32 version;
 	struct scmi_pinctrl_info *pinfo;
 
-	ret = ph->xops->version_get(ph, &version);
-	if (ret)
-		return ret;
-
 	dev_dbg(ph->dev, "Pinctrl Version %d.%d\n",
-		PROTOCOL_REV_MAJOR(version), PROTOCOL_REV_MINOR(version));
+		PROTOCOL_REV_MAJOR(ph->version), PROTOCOL_REV_MINOR(ph->version));
 
 	pinfo = devm_kzalloc(ph->dev, sizeof(*pinfo), GFP_KERNEL);
 	if (!pinfo)
@@ -876,9 +870,7 @@ static int scmi_pinctrl_protocol_init(const struct scmi_protocol_handle *ph)
 	if (!pinfo->functions)
 		return -ENOMEM;
 
-	pinfo->version = version;
-
-	return ph->set_priv(ph, pinfo, version);
+	return ph->set_priv(ph, pinfo);
 }
 
 static int scmi_pinctrl_protocol_deinit(const struct scmi_protocol_handle *ph)
diff --git a/drivers/firmware/arm_scmi/power.c b/drivers/firmware/arm_scmi/power.c
index 59aa16444c64..bb5062ab8280 100644
--- a/drivers/firmware/arm_scmi/power.c
+++ b/drivers/firmware/arm_scmi/power.c
@@ -67,7 +67,6 @@ struct power_dom_info {
 };
 
 struct scmi_power_info {
-	u32 version;
 	bool notify_state_change_cmd;
 	int num_domains;
 	u64 stats_addr;
@@ -109,7 +108,7 @@ static int scmi_power_attributes_get(const struct scmi_protocol_handle *ph,
 static int
 scmi_power_domain_attributes_get(const struct scmi_protocol_handle *ph,
 				 u32 domain, struct power_dom_info *dom_info,
-				 u32 version, bool notify_state_change_cmd)
+				 bool notify_state_change_cmd)
 {
 	int ret;
 	u32 flags;
@@ -141,7 +140,7 @@ scmi_power_domain_attributes_get(const struct scmi_protocol_handle *ph,
 	 * If supported overwrite short name with the extended one;
 	 * on error just carry on and use already provided short name.
 	 */
-	if (!ret && PROTOCOL_REV_MAJOR(version) >= 0x3 &&
+	if (!ret && PROTOCOL_REV_MAJOR(ph->version) >= 0x3 &&
 	    SUPPORTS_EXTENDED_NAMES(flags)) {
 		ph->hops->extended_name_get(ph, POWER_DOMAIN_NAME_GET,
 					    domain, NULL, dom_info->name,
@@ -323,15 +322,10 @@ static const struct scmi_protocol_events power_protocol_events = {
 static int scmi_power_protocol_init(const struct scmi_protocol_handle *ph)
 {
 	int domain, ret;
-	u32 version;
 	struct scmi_power_info *pinfo;
 
-	ret = ph->xops->version_get(ph, &version);
-	if (ret)
-		return ret;
-
 	dev_dbg(ph->dev, "Power Version %d.%d\n",
-		PROTOCOL_REV_MAJOR(version), PROTOCOL_REV_MINOR(version));
+		PROTOCOL_REV_MAJOR(ph->version), PROTOCOL_REV_MINOR(ph->version));
 
 	pinfo = devm_kzalloc(ph->dev, sizeof(*pinfo), GFP_KERNEL);
 	if (!pinfo)
@@ -349,13 +343,11 @@ static int scmi_power_protocol_init(const struct scmi_protocol_handle *ph)
 	for (domain = 0; domain < pinfo->num_domains; domain++) {
 		struct power_dom_info *dom = pinfo->dom_info + domain;
 
-		scmi_power_domain_attributes_get(ph, domain, dom, version,
+		scmi_power_domain_attributes_get(ph, domain, dom,
 						 pinfo->notify_state_change_cmd);
 	}
 
-	pinfo->version = version;
-
-	return ph->set_priv(ph, pinfo, version);
+	return ph->set_priv(ph, pinfo);
 }
 
 static const struct scmi_protocol scmi_power = {
diff --git a/drivers/firmware/arm_scmi/powercap.c b/drivers/firmware/arm_scmi/powercap.c
index 1fa79bba492e..ab9733f4458b 100644
--- a/drivers/firmware/arm_scmi/powercap.c
+++ b/drivers/firmware/arm_scmi/powercap.c
@@ -122,7 +122,6 @@ struct scmi_powercap_state {
 };
 
 struct powercap_info {
-	u32 version;
 	int num_domains;
 	bool notify_cap_cmd;
 	bool notify_measurements_cmd;
@@ -434,7 +433,7 @@ static int __scmi_powercap_cap_set(const struct scmi_protocol_handle *ph,
 	}
 
 	/* Save the last explicitly set non-zero powercap value */
-	if (PROTOCOL_REV_MAJOR(pi->version) >= 0x2 && !ret && power_cap)
+	if (PROTOCOL_REV_MAJOR(ph->version) >= 0x2 && !ret && power_cap)
 		pi->states[domain_id].last_pcap = power_cap;
 
 	return ret;
@@ -454,7 +453,7 @@ static int scmi_powercap_cap_set(const struct scmi_protocol_handle *ph,
 		return -EINVAL;
 
 	/* Just log the last set request if acting on a disabled domain */
-	if (PROTOCOL_REV_MAJOR(pi->version) >= 0x2 &&
+	if (PROTOCOL_REV_MAJOR(ph->version) >= 0x2 &&
 	    !pi->states[domain_id].enabled) {
 		pi->states[domain_id].last_pcap = power_cap;
 		return 0;
@@ -635,7 +634,7 @@ static int scmi_powercap_cap_enable_set(const struct scmi_protocol_handle *ph,
 	u32 power_cap;
 	struct powercap_info *pi = ph->get_priv(ph);
 
-	if (PROTOCOL_REV_MAJOR(pi->version) < 0x2)
+	if (PROTOCOL_REV_MAJOR(ph->version) < 0x2)
 		return -EINVAL;
 
 	if (enable == pi->states[domain_id].enabled)
@@ -676,7 +675,7 @@ static int scmi_powercap_cap_enable_get(const struct scmi_protocol_handle *ph,
 	struct powercap_info *pi = ph->get_priv(ph);
 
 	*enable = true;
-	if (PROTOCOL_REV_MAJOR(pi->version) < 0x2)
+	if (PROTOCOL_REV_MAJOR(ph->version) < 0x2)
 		return 0;
 
 	/*
@@ -961,15 +960,10 @@ static int
 scmi_powercap_protocol_init(const struct scmi_protocol_handle *ph)
 {
 	int domain, ret;
-	u32 version;
 	struct powercap_info *pinfo;
 
-	ret = ph->xops->version_get(ph, &version);
-	if (ret)
-		return ret;
-
 	dev_dbg(ph->dev, "Powercap Version %d.%d\n",
-		PROTOCOL_REV_MAJOR(version), PROTOCOL_REV_MINOR(version));
+		PROTOCOL_REV_MAJOR(ph->version), PROTOCOL_REV_MINOR(ph->version));
 
 	pinfo = devm_kzalloc(ph->dev, sizeof(*pinfo), GFP_KERNEL);
 	if (!pinfo)
@@ -1006,7 +1000,7 @@ scmi_powercap_protocol_init(const struct scmi_protocol_handle *ph)
 						     &pinfo->powercaps[domain].fc_info);
 
 		/* Grab initial state when disable is supported. */
-		if (PROTOCOL_REV_MAJOR(version) >= 0x2) {
+		if (PROTOCOL_REV_MAJOR(ph->version) >= 0x2) {
 			ret = __scmi_powercap_cap_get(ph,
 						      &pinfo->powercaps[domain],
 						      &pinfo->states[domain].last_pcap);
@@ -1018,8 +1012,7 @@ scmi_powercap_protocol_init(const struct scmi_protocol_handle *ph)
 		}
 	}
 
-	pinfo->version = version;
-	return ph->set_priv(ph, pinfo, version);
+	return ph->set_priv(ph, pinfo);
 }
 
 static const struct scmi_protocol scmi_powercap = {
diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
index 2766c2b822b5..4c75970326e6 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -183,8 +183,7 @@ struct scmi_protocol_handle {
 	unsigned int version;
 	const struct scmi_xfer_ops *xops;
 	const struct scmi_proto_helpers_ops *hops;
-	int (*set_priv)(const struct scmi_protocol_handle *ph, void *priv,
-			u32 version);
+	int (*set_priv)(const struct scmi_protocol_handle *ph, void *priv);
 	void *(*get_priv)(const struct scmi_protocol_handle *ph);
 };
 
@@ -291,7 +290,6 @@ struct scmi_proto_helpers_ops {
 
 /**
  * struct scmi_xfer_ops  - References to the core SCMI xfer operations.
- * @version_get: Get this version protocol.
  * @xfer_get_init: Initialize one struct xfer if any xfer slot is free.
  * @reset_rx_to_maxsz: Reset rx size to max transport size.
  * @do_xfer: Do the SCMI transfer.
@@ -304,7 +302,6 @@ struct scmi_proto_helpers_ops {
  * another protocol.
  */
 struct scmi_xfer_ops {
-	int (*version_get)(const struct scmi_protocol_handle *ph, u32 *version);
 	int (*xfer_get_init)(const struct scmi_protocol_handle *ph, u8 msg_id,
 			     size_t tx_size, size_t rx_size,
 			     struct scmi_xfer **p);
diff --git a/drivers/firmware/arm_scmi/reset.c b/drivers/firmware/arm_scmi/reset.c
index 0aa82b96f41b..06df8e40c6c6 100644
--- a/drivers/firmware/arm_scmi/reset.c
+++ b/drivers/firmware/arm_scmi/reset.c
@@ -65,7 +65,6 @@ struct reset_dom_info {
 };
 
 struct scmi_reset_info {
-	u32 version;
 	int num_domains;
 	bool notify_reset_cmd;
 	struct reset_dom_info *dom_info;
@@ -100,8 +99,7 @@ static int scmi_reset_attributes_get(const struct scmi_protocol_handle *ph,
 
 static int
 scmi_reset_domain_attributes_get(const struct scmi_protocol_handle *ph,
-				 struct scmi_reset_info *pinfo,
-				 u32 domain, u32 version)
+				 struct scmi_reset_info *pinfo, u32 domain)
 {
 	int ret;
 	u32 attributes;
@@ -137,7 +135,7 @@ scmi_reset_domain_attributes_get(const struct scmi_protocol_handle *ph,
 	 * If supported overwrite short name with the extended one;
 	 * on error just carry on and use already provided short name.
 	 */
-	if (!ret && PROTOCOL_REV_MAJOR(version) >= 0x3 &&
+	if (!ret && PROTOCOL_REV_MAJOR(ph->version) >= 0x3 &&
 	    SUPPORTS_EXTENDED_NAMES(attributes))
 		ph->hops->extended_name_get(ph, RESET_DOMAIN_NAME_GET, domain,
 					    NULL, dom_info->name,
@@ -340,15 +338,10 @@ static const struct scmi_protocol_events reset_protocol_events = {
 static int scmi_reset_protocol_init(const struct scmi_protocol_handle *ph)
 {
 	int domain, ret;
-	u32 version;
 	struct scmi_reset_info *pinfo;
 
-	ret = ph->xops->version_get(ph, &version);
-	if (ret)
-		return ret;
-
 	dev_dbg(ph->dev, "Reset Version %d.%d\n",
-		PROTOCOL_REV_MAJOR(version), PROTOCOL_REV_MINOR(version));
+		PROTOCOL_REV_MAJOR(ph->version), PROTOCOL_REV_MINOR(ph->version));
 
 	pinfo = devm_kzalloc(ph->dev, sizeof(*pinfo), GFP_KERNEL);
 	if (!pinfo)
@@ -364,10 +357,9 @@ static int scmi_reset_protocol_init(const struct scmi_protocol_handle *ph)
 		return -ENOMEM;
 
 	for (domain = 0; domain < pinfo->num_domains; domain++)
-		scmi_reset_domain_attributes_get(ph, pinfo, domain, version);
+		scmi_reset_domain_attributes_get(ph, pinfo, domain);
 
-	pinfo->version = version;
-	return ph->set_priv(ph, pinfo, version);
+	return ph->set_priv(ph, pinfo);
 }
 
 static const struct scmi_protocol scmi_reset = {
diff --git a/drivers/firmware/arm_scmi/sensors.c b/drivers/firmware/arm_scmi/sensors.c
index 791efd0f82d7..882d55f987d2 100644
--- a/drivers/firmware/arm_scmi/sensors.c
+++ b/drivers/firmware/arm_scmi/sensors.c
@@ -214,7 +214,6 @@ struct scmi_sensor_update_notify_payld {
 };
 
 struct sensors_info {
-	u32 version;
 	bool notify_trip_point_cmd;
 	bool notify_continuos_update_cmd;
 	int num_sensors;
@@ -524,8 +523,7 @@ scmi_sensor_axis_extended_names_get(const struct scmi_protocol_handle *ph,
 }
 
 static int scmi_sensor_axis_description(const struct scmi_protocol_handle *ph,
-					struct scmi_sensor_info *s,
-					u32 version)
+					struct scmi_sensor_info *s)
 {
 	int ret;
 	void *iter;
@@ -555,7 +553,7 @@ static int scmi_sensor_axis_description(const struct scmi_protocol_handle *ph,
 	if (ret)
 		return ret;
 
-	if (PROTOCOL_REV_MAJOR(version) >= 0x3 &&
+	if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3 &&
 	    apriv.any_axes_support_extended_names)
 		ret = scmi_sensor_axis_extended_names_get(ph, s);
 
@@ -621,7 +619,7 @@ iter_sens_descr_process_response(const struct scmi_protocol_handle *ph,
 	s->type = SENSOR_TYPE(attrh);
 	/* Use pre-allocated pool wherever possible */
 	s->intervals.desc = s->intervals.prealloc_pool;
-	if (si->version == SCMIv2_SENSOR_PROTOCOL) {
+	if (ph->version == SCMIv2_SENSOR_PROTOCOL) {
 		s->intervals.segmented = false;
 		s->intervals.count = 1;
 		/*
@@ -659,7 +657,7 @@ iter_sens_descr_process_response(const struct scmi_protocol_handle *ph,
 	 * one; on error just carry on and use already provided
 	 * short name.
 	 */
-	if (PROTOCOL_REV_MAJOR(si->version) >= 0x3 &&
+	if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3 &&
 	    SUPPORTS_EXTENDED_NAMES(attrl))
 		ph->hops->extended_name_get(ph, SENSOR_NAME_GET, s->id,
 					    NULL, s->name, SCMI_MAX_STR_SIZE);
@@ -683,7 +681,7 @@ iter_sens_descr_process_response(const struct scmi_protocol_handle *ph,
 	}
 
 	if (s->num_axis > 0)
-		ret = scmi_sensor_axis_description(ph, s, si->version);
+		ret = scmi_sensor_axis_description(ph, s);
 
 	st->priv = ((u8 *)sdesc + dsize);
 
@@ -1148,21 +1146,15 @@ static const struct scmi_protocol_events sensor_protocol_events = {
 
 static int scmi_sensors_protocol_init(const struct scmi_protocol_handle *ph)
 {
-	u32 version;
 	int ret;
 	struct sensors_info *sinfo;
 
-	ret = ph->xops->version_get(ph, &version);
-	if (ret)
-		return ret;
-
 	dev_dbg(ph->dev, "Sensor Version %d.%d\n",
-		PROTOCOL_REV_MAJOR(version), PROTOCOL_REV_MINOR(version));
+		PROTOCOL_REV_MAJOR(ph->version), PROTOCOL_REV_MINOR(ph->version));
 
 	sinfo = devm_kzalloc(ph->dev, sizeof(*sinfo), GFP_KERNEL);
 	if (!sinfo)
 		return -ENOMEM;
-	sinfo->version = version;
 
 	ret = scmi_sensor_attributes_get(ph, sinfo);
 	if (ret)
@@ -1176,7 +1168,7 @@ static int scmi_sensors_protocol_init(const struct scmi_protocol_handle *ph)
 	if (ret)
 		return ret;
 
-	return ph->set_priv(ph, sinfo, version);
+	return ph->set_priv(ph, sinfo);
 }
 
 static const struct scmi_protocol scmi_sensors = {
diff --git a/drivers/firmware/arm_scmi/system.c b/drivers/firmware/arm_scmi/system.c
index ec3d355d1772..0f51c36f6a9d 100644
--- a/drivers/firmware/arm_scmi/system.c
+++ b/drivers/firmware/arm_scmi/system.c
@@ -34,7 +34,6 @@ struct scmi_system_power_state_notifier_payld {
 };
 
 struct scmi_system_info {
-	u32 version;
 	bool graceful_timeout_supported;
 	bool power_state_notify_cmd;
 };
@@ -141,29 +140,22 @@ static const struct scmi_protocol_events system_protocol_events = {
 
 static int scmi_system_protocol_init(const struct scmi_protocol_handle *ph)
 {
-	int ret;
-	u32 version;
 	struct scmi_system_info *pinfo;
 
-	ret = ph->xops->version_get(ph, &version);
-	if (ret)
-		return ret;
-
 	dev_dbg(ph->dev, "System Power Version %d.%d\n",
-		PROTOCOL_REV_MAJOR(version), PROTOCOL_REV_MINOR(version));
+		PROTOCOL_REV_MAJOR(ph->version), PROTOCOL_REV_MINOR(ph->version));
 
 	pinfo = devm_kzalloc(ph->dev, sizeof(*pinfo), GFP_KERNEL);
 	if (!pinfo)
 		return -ENOMEM;
 
-	pinfo->version = version;
-	if (PROTOCOL_REV_MAJOR(pinfo->version) >= 0x2)
+	if (PROTOCOL_REV_MAJOR(ph->version) >= 0x2)
 		pinfo->graceful_timeout_supported = true;
 
 	if (!ph->hops->protocol_msg_check(ph, SYSTEM_POWER_STATE_NOTIFY, NULL))
 		pinfo->power_state_notify_cmd = true;
 
-	return ph->set_priv(ph, pinfo, version);
+	return ph->set_priv(ph, pinfo);
 }
 
 static const struct scmi_protocol scmi_system = {
diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c
index aa176c1a5eef..33f9ebf6092b 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c
+++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c
@@ -48,7 +48,6 @@ enum scmi_imx_bbm_protocol_cmd {
 #define SCMI_IMX_BBM_EVENT_RTC_MASK		GENMASK(31, 24)
 
 struct scmi_imx_bbm_info {
-	u32 version;
 	int nr_rtc;
 	int nr_gpr;
 };
@@ -345,16 +344,11 @@ static const struct scmi_imx_bbm_proto_ops scmi_imx_bbm_proto_ops = {
 
 static int scmi_imx_bbm_protocol_init(const struct scmi_protocol_handle *ph)
 {
-	u32 version;
 	int ret;
 	struct scmi_imx_bbm_info *binfo;
 
-	ret = ph->xops->version_get(ph, &version);
-	if (ret)
-		return ret;
-
 	dev_info(ph->dev, "NXP SM BBM Version %d.%d\n",
-		 PROTOCOL_REV_MAJOR(version), PROTOCOL_REV_MINOR(version));
+		 PROTOCOL_REV_MAJOR(ph->version), PROTOCOL_REV_MINOR(ph->version));
 
 	binfo = devm_kzalloc(ph->dev, sizeof(*binfo), GFP_KERNEL);
 	if (!binfo)
@@ -364,7 +358,7 @@ static int scmi_imx_bbm_protocol_init(const struct scmi_protocol_handle *ph)
 	if (ret)
 		return ret;
 
-	return ph->set_priv(ph, binfo, version);
+	return ph->set_priv(ph, binfo);
 }
 
 static const struct scmi_protocol scmi_imx_bbm = {
diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c
index 66f47f5371e5..753274af11d2 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c
+++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c
@@ -233,15 +233,10 @@ static int scmi_imx_cpu_attributes_get(const struct scmi_protocol_handle *ph,
 static int scmi_imx_cpu_protocol_init(const struct scmi_protocol_handle *ph)
 {
 	struct scmi_imx_cpu_info *info;
-	u32 version;
 	int ret, i;
 
-	ret = ph->xops->version_get(ph, &version);
-	if (ret)
-		return ret;
-
 	dev_info(ph->dev, "NXP SM CPU Protocol Version %d.%d\n",
-		 PROTOCOL_REV_MAJOR(version), PROTOCOL_REV_MINOR(version));
+		 PROTOCOL_REV_MAJOR(ph->version), PROTOCOL_REV_MINOR(ph->version));
 
 	info = devm_kzalloc(ph->dev, sizeof(*info), GFP_KERNEL);
 	if (!info)
@@ -257,7 +252,7 @@ static int scmi_imx_cpu_protocol_init(const struct scmi_protocol_handle *ph)
 			return ret;
 	}
 
-	return ph->set_priv(ph, info, version);
+	return ph->set_priv(ph, info);
 }
 
 static const struct scmi_protocol scmi_imx_cpu = {
diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c
index b519c67fe920..c56ae247774d 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c
+++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c
@@ -226,15 +226,10 @@ static int scmi_imx_lmm_protocol_attributes_get(const struct scmi_protocol_handl
 static int scmi_imx_lmm_protocol_init(const struct scmi_protocol_handle *ph)
 {
 	struct scmi_imx_lmm_priv *info;
-	u32 version;
 	int ret;
 
-	ret = ph->xops->version_get(ph, &version);
-	if (ret)
-		return ret;
-
 	dev_info(ph->dev, "NXP SM LMM Version %d.%d\n",
-		 PROTOCOL_REV_MAJOR(version), PROTOCOL_REV_MINOR(version));
+		 PROTOCOL_REV_MAJOR(ph->version), PROTOCOL_REV_MINOR(ph->version));
 
 	info = devm_kzalloc(ph->dev, sizeof(*info), GFP_KERNEL);
 	if (!info)
@@ -244,7 +239,7 @@ static int scmi_imx_lmm_protocol_init(const struct scmi_protocol_handle *ph)
 	if (ret)
 		return ret;
 
-	return ph->set_priv(ph, info, version);
+	return ph->set_priv(ph, info);
 }
 
 static const struct scmi_protocol scmi_imx_lmm = {
diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
index 700a3f24f4ef..73d80f221b9d 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
+++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
@@ -32,7 +32,6 @@ enum scmi_imx_misc_protocol_cmd {
 };
 
 struct scmi_imx_misc_info {
-	u32 version;
 	u32 nr_dev_ctrl;
 	u32 nr_brd_ctrl;
 	u32 nr_reason;
@@ -380,15 +379,10 @@ static const struct scmi_imx_misc_proto_ops scmi_imx_misc_proto_ops = {
 static int scmi_imx_misc_protocol_init(const struct scmi_protocol_handle *ph)
 {
 	struct scmi_imx_misc_info *minfo;
-	u32 version;
 	int ret;
 
-	ret = ph->xops->version_get(ph, &version);
-	if (ret)
-		return ret;
-
 	dev_info(ph->dev, "NXP SM MISC Version %d.%d\n",
-		 PROTOCOL_REV_MAJOR(version), PROTOCOL_REV_MINOR(version));
+		 PROTOCOL_REV_MAJOR(ph->version), PROTOCOL_REV_MINOR(ph->version));
 
 	minfo = devm_kzalloc(ph->dev, sizeof(*minfo), GFP_KERNEL);
 	if (!minfo)
@@ -410,7 +404,7 @@ static int scmi_imx_misc_protocol_init(const struct scmi_protocol_handle *ph)
 	if (ret && ret != -EOPNOTSUPP)
 		return ret;
 
-	return ph->set_priv(ph, minfo, version);
+	return ph->set_priv(ph, minfo);
 }
 
 static const struct scmi_protocol scmi_imx_misc = {
diff --git a/drivers/firmware/arm_scmi/voltage.c b/drivers/firmware/arm_scmi/voltage.c
index 17127880e10a..b9391c1ee8a0 100644
--- a/drivers/firmware/arm_scmi/voltage.c
+++ b/drivers/firmware/arm_scmi/voltage.c
@@ -66,7 +66,6 @@ struct scmi_resp_voltage_level_set_complete {
 };
 
 struct voltage_info {
-	unsigned int version;
 	unsigned int num_domains;
 	struct scmi_voltage_info *domains;
 };
@@ -243,7 +242,7 @@ static int scmi_voltage_descriptors_get(const struct scmi_protocol_handle *ph,
 		 * If supported overwrite short name with the extended one;
 		 * on error just carry on and use already provided short name.
 		 */
-		if (PROTOCOL_REV_MAJOR(vinfo->version) >= 0x2) {
+		if (PROTOCOL_REV_MAJOR(ph->version) >= 0x2) {
 			if (SUPPORTS_EXTENDED_NAMES(attributes))
 				ph->hops->extended_name_get(ph,
 							VOLTAGE_DOMAIN_NAME_GET,
@@ -405,20 +404,14 @@ static const struct scmi_voltage_proto_ops voltage_proto_ops = {
 static int scmi_voltage_protocol_init(const struct scmi_protocol_handle *ph)
 {
 	int ret;
-	u32 version;
 	struct voltage_info *vinfo;
 
-	ret = ph->xops->version_get(ph, &version);
-	if (ret)
-		return ret;
-
 	dev_dbg(ph->dev, "Voltage Version %d.%d\n",
-		PROTOCOL_REV_MAJOR(version), PROTOCOL_REV_MINOR(version));
+		PROTOCOL_REV_MAJOR(ph->version), PROTOCOL_REV_MINOR(ph->version));
 
 	vinfo = devm_kzalloc(ph->dev, sizeof(*vinfo), GFP_KERNEL);
 	if (!vinfo)
 		return -ENOMEM;
-	vinfo->version = version;
 
 	ret = scmi_protocol_attributes_get(ph, vinfo);
 	if (ret)
@@ -437,7 +430,7 @@ static int scmi_voltage_protocol_init(const struct scmi_protocol_handle *ph)
 		dev_warn(ph->dev, "No Voltage domains found.\n");
 	}
 
-	return ph->set_priv(ph, vinfo, version);
+	return ph->set_priv(ph, vinfo);
 }
 
 static const struct scmi_protocol scmi_voltage = {
-- 
2.52.0

