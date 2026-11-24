Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549877;
	b=dW/t2Go2/P+UrL786N+adwIRLgkQ/57qXJlMTOS3BVquiGsgxJiL/r3j8V+krPDPl2O+
	 QFcf39yPxF70KjJ/mpB8A6NbbOZUTWUQ9gdM1t6bBcpS7xkS5Y13Qxj6MXQslYMc0cWYa
	 1BRo21mxzduiEuGu6EupUiFmurcsqZgXL2ygUQ0I+fpnl+bRLo4BsxKNTE7QePrR5Vv2l
	 z4njljDnKEwLi1AgAJ0iddinKH4jWBoLTN5h6s9/j5JXb3YktEFWu4T24WN5m5ZhJpksb
	 XBfmzjzsM4p9cUzf71wXu7HAM07VM3RKeIP9+ORX0awPVy2YabLHMN6VFgPFcz8EqzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549877;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=o2e17lgClUL6FnN4PkSNyg+0+A+ZWeJi0pzpu2mZ/90=;
	b=UR0YJUyO/CeV78omInCAxeKg0nzCk5hJOrW8+1mzQkEXVVpV0QUS2o3aUSu7I3+hHwjd
	 VGTVi5vc78odNRkM/WcNW40B0ttHFbXvb+l7QLbsNOAQ/nbIfyvmwOw6WE90JkdG8ytDW
	 KdjLXK7H7f9beLAX6/b0hTlxNRgmdStTa6VB1hk6yW1dd3Y0aBlIp4+z8fdXjPcNVSzpe
	 u2vP4dKXHrAI63cjZc9DZCGZGBd3Fa8FlORl/fpU1FBBbjs53iKJkoOmdL1ZIEWR/n+oD
	 3wPVJZTFDGPfjUv5YpxG8MQ+3edSDgMfIYBpWxY0zXzcUiyrQkhYRWxIwghq7TdhTZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=aR5LjR9Q;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2063D606A337;
	Tue, 24 Nov 2026 19:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2063D606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=aR5LjR9Q
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9A8316F3;
	Tue, 24 Nov 2026 11:51:13 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B9AC33F763;
	Tue, 24 Nov 2026 11:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795549876; bh=BryguWDhx6sj/MVWpMUomWhwh0S4a+pxPzh6d2NC51o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aR5LjR9QEkODftp+RK+jYZAPajQIb4Gbr2IxXz7AoZpdA2uwISrYwa/WFC6X2JW20
	 lIKn5Gu9jzHSYvgN0sDJTfpa+PzFxZ57UpjJbpeBYQ1ZNae0BA1eaCoY7Que0FViiC
	 sYGBsRtWDWR6guKtWPKYpKttBzW5HD59RhphflO4=
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
Subject: [PATCH v17 19/34] firmware: arm_scmi: Add Telemetry global configuration support
Date: Tue, 24 Nov 2026 19:48:25 +0000
Message-ID: <20261124194841.1147072-20-cristian.marussi@arm.com>
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

Add support to configure Telemetry globally by setting its enabled state
and the requested update interval.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v16 --> v17
 - avoid collection name clashes
 - rename update_interval_ms to ename update_interval
v15 --> v16
 - fix mode check logic
---
 drivers/firmware/arm_scmi/telemetry.c | 69 +++++++++++++++++++++++++++
 include/linux/scmi_protocol.h         | 15 ++++++
 2 files changed, 84 insertions(+)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 140ff1072b99..6e5564c36a2d 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -3087,12 +3087,81 @@ static int scmi_telemetry_state_set(const struct scmi_protocol_handle *ph,
 					    de, sid, offset, uuid);
 }
 
+static int
+scmi_telemetry_collection_configure(const struct scmi_protocol_handle *ph,
+				    unsigned int res_id, const bool *enable,
+				    const unsigned int *update_interval,
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
+	/* Stall concurrent configuration request */
+	guard(mutex)(&ti->config_mtx);
+
+	if (mode && (*mode != SCMI_TLM_COLLECTION_ONDEMAND))
+		return -EOPNOTSUPP;
+
+	is_group = res_id != SCMI_TLM_GRP_INVALID;
+	if (is_group)
+		return -EOPNOTSUPP;
+
+	active_update_interval = &ti->info.active_update_interval;
+	current_mode = &ti->info.current_mode;
+	current_state = &ti->info.enabled;
+
+	if (!enable && !update_interval && (!mode || *mode == *current_mode))
+		return 0;
+
+	ret = ph->xops->xfer_get_init(ph, TELEMETRY_CONFIG_SET,
+				      sizeof(*msg), 0, &t);
+	if (ret)
+		return ret;
+
+	if (!update_interval)
+		interval = cpu_to_le32(*active_update_interval);
+	else
+		interval = cpu_to_le32(*update_interval);
+
+	tlm_enable = enable ? *enable : *current_state;
+	next_mode = mode ? *mode : *current_mode;
+
+	msg = t->tx.buf;
+	msg->group_identifier = cpu_to_le32(res_id);
+	control = tlm_enable ? TELEMETRY_ENABLE : 0;
+	control |= !is_group ? TELEMETRY_SET_SELECTOR_ALL : TELEMETRY_SET_SELECTOR_GROUP;
+	control |= TELEMETRY_MODE_SET(next_mode);
+	msg->control = cpu_to_le32(control);
+	msg->sampling_rate = interval;
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		*current_mode = next_mode;
+		*current_state = tlm_enable;
+		ti->streaming_mode =
+			*current_mode == SCMI_TLM_COLLECTION_NOTIFICATION;
+		if (update_interval)
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
 	.state_get = scmi_telemetry_state_get,
 	.state_set = scmi_telemetry_state_set,
+	.collection_configure = scmi_telemetry_collection_configure,
 };
 
 /**
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index ad116978ed47..ba240c8595a8 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -888,6 +888,12 @@ enum scmi_telemetry_compo_type {
 #define SCMI_TLM_BUILD_UPDATE_INTERVAL(s, e)				    \
 	(FIELD_PREP(GENMASK(20, 5), (s)) | FIELD_PREP(GENMASK(4, 0), (e) & GENMASK(4, 0)))
 
+enum scmi_telemetry_collection {
+	SCMI_TLM_COLLECTION_ONDEMAND,
+	SCMI_TLM_COLLECTION_NOTIFICATION,
+	SCMI_TLM_COLLECTION_SINGLE_READ,
+};
+
 #define SCMI_TLM_GRP_INVALID	0xFFFFFFFF
 
 struct scmi_telemetry_intervals {
@@ -959,6 +965,8 @@ struct scmi_telemetry_info {
 	struct scmi_telemetry_shmti_info **shmtis;
 	unsigned int num_uuids;
 	uuid_t * __rcu *uuids;
+	bool enabled;
+	enum scmi_telemetry_collection current_mode;
 };
 
 /**
@@ -972,6 +980,9 @@ struct scmi_telemetry_info {
  *	       cumulative state of all DEs. Global group state can be looked-up
  *	       directly from @scmi_telemetry_info via @info_get.
  * @state_set: enable/disable the specific DE or GROUP with or without timestamps.
+ * @collection_configure: choose a sampling rate and enable SHMTI/FC sampling
+ *			  for on demand collection via @de_data_read or async
+ *			  notificatioins for all the enabled DEs.
  */
 struct scmi_telemetry_proto_ops {
 	const struct scmi_telemetry_info *(*info_get)
@@ -987,6 +998,10 @@ struct scmi_telemetry_proto_ops {
 			 bool is_group, u32 id, const bool *enable,
 			 const bool *tstamp, u32 *sid, u32 *offset,
 			 uuid_t *uuid);
+	int (*collection_configure)(const struct scmi_protocol_handle *ph,
+				    unsigned int res_id, const bool *enable,
+				    const unsigned int *update_interval,
+				    const enum scmi_telemetry_collection *mode);
 };
 
 /**
-- 
2.54.0

