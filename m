Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795304663;
	b=QFvetTMFhII/CxaBEk1KH4FJN+W7fdK5fsWm1CmZcTVWs41WE4ipsBcH3kqV8wGOXNzX
	 wP9zB4KMQ3GpP0s9VhKQ8WtduVNPw1d1/7siHclDl3caq+8kOxesTNV9NfTSFaNRsUrHH
	 PRmnktco5BysqpsmPnSaoxkRAIduUgW3nswkjJk9yfLt7ipsZTbOc0vpzz+2KpcW+U60f
	 fbyNs83CA79+s1O08K3+Rb6PFdU8qcBCL2fGtYbClkDH5bt492LLZFoSWAfLQNNRYWHH/
	 +w9T3wq5aqalgI71wikahVOUV22TqrqzMcwmHFvcHT1L5Z84yCg8CxhFJHsJ2cZQiGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795304663;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1ks1qtON9t7AUvsQWNFxu5MU0gY/VQveKsMo3JPBMgg=;
	b=SgRWOS2cj7iUweBryibZfMT6bmiACHBJK6ogr4/QdwVUlIgjbendIiJyt/YBiM8amiJV
	 qc8vFDHnDB5cigJg9ZsuSKGZc7CqUaP5pPHwie4yd7vRZEhjVOZMNywaSMRmpt035RSvq
	 gAfqDyap2KTvg5Eq7yg9FzfCemryO1XoGft+wCw6BCskAwdgu/nxSeshmO0o4F5zr+4Js
	 sBQwckitXlFyy4MCdDNOx3s5XCNKpIhK3J2LieVwUfDYoc+lGm68BOSM65ybx7kApgk43
	 66n4ma+lp3C5rYJE0Z5XCv8UiGmarKj//KNpR8F66OA7hS3pTisg/c4HxLozUCvRxVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ts21B2lR;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18AC9606A33A;
	Sat, 21 Nov 2026 23:44:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18AC9606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ts21B2lR
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9573516F2;
	Sat, 21 Nov 2026 15:44:19 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A81603F632;
	Sat, 21 Nov 2026 15:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795304662; bh=7ASed0irKhbquWxwateY6WQZIArl0OMm5dYsGNK5iXM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ts21B2lRNxp91M7iItVxv+6S68+hgws6nU5xhSaKtBgp33J+BG8I3M+vdnj/hRLJ8
	 W1YYNSC/tcae94V33I/bjpLIhjKdHrcTw77XK5OK44NSouB4RkqSwYZHcz7di3Uvy0
	 nfvk+P8opgya5EbYFYb12zWFCmrICRs7Bj0zAlFs=
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
Subject: [PATCH v16 18/31] firmware: arm_scmi: Add Telemetry global configuration support
Date: Sat, 21 Nov 2026 23:39:52 +0000
Message-ID: <20261121234005.1525419-19-cristian.marussi@arm.com>
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

Add support to configure Telemetry globally by setting its enabled state
and the requested update interval.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v15 --> v16
 - fix mode check logic
---
 drivers/firmware/arm_scmi/telemetry.c | 68 +++++++++++++++++++++++++++
 include/linux/scmi_protocol.h         | 15 ++++++
 2 files changed, 83 insertions(+)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 1453adee393c..2c71c090588d 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -3046,12 +3046,80 @@ static int scmi_telemetry_state_set(const struct scmi_protocol_handle *ph,
 	return 0;
 }
 
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
+	/* Stall concurrent configuration request */
+	guard(mutex)(&ti->config_mtx);
+
+	if (mode && (*mode != SCMI_TLM_ONDEMAND))
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
+		ti->streaming_mode = *current_mode == SCMI_TLM_NOTIFICATION;
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
 	.state_get = scmi_telemetry_state_get,
 	.state_set = scmi_telemetry_state_set,
+	.collection_configure = scmi_telemetry_collection_configure,
 };
 
 /**
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index c111b8ff87db..9a1257185309 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -888,6 +888,12 @@ enum scmi_telemetry_compo_type {
 #define SCMI_TLM_BUILD_UPDATE_INTERVAL(s, e)				    \
 	(FIELD_PREP(GENMASK(20, 5), (s)) | FIELD_PREP(GENMASK(4, 0), (e)))
 
+enum scmi_telemetry_collection {
+	SCMI_TLM_ONDEMAND,
+	SCMI_TLM_NOTIFICATION,
+	SCMI_TLM_SINGLE_READ,
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
+				    const unsigned int *update_interval_ms,
+				    const enum scmi_telemetry_collection *mode);
 };
 
 /**
-- 
2.54.0

