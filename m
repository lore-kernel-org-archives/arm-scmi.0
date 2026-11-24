Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549852;
	b=ldp+93m/984Uj9SptCx2fOz/juHmtEkeeNufJGL9+nZkVj0bG30tH8qbGBdz2D4W4LV5
	 yzlmxfma5Bej90iW+phfhLv1a6pOLPXnYZOa1dGRjCgx/++Yv5PZDyWjfUdmrrsidTd1c
	 zIS3+cMeLayWIK/Hh+9D+4pa42aU3knXsx0u+YbT4geaEqD/DALcGVESO64wMAz1u34i8
	 MAdA18ENW6FQVRdVVUMTfhIY2X4fkNk0mOaAJDY3Ec7lA7/5DMxNkMjYAUhokzjRuO2dP
	 4R7+C2gt0qecmC1FDhDVblrDs4hJpB5Qshi5W2R9WdGYCJlT6hRlyuS4eH79GtsVZdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549852;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tRimtWI4BiYEKFepBe2BqCQG5leOs5hkXa+2+bPuz6Y=;
	b=T1Z3CkSYXG13aEp8woiYYQCrGriiSay0bsv+EffHaWDZzVlGv9n3VCdU65OkRKqagAz5
	 ObWIeJN/MyfT5E9Ny5gtDV+67Jfd5Bg5dyAGgUZ74XmPSqDWAAu9rvgiOBT0lhCaDpaGl
	 AB3TkTc0qZsx1iK387sGjTAm3XFf8owXnVY9KSxuWqux2VGJBQS0hKHPi3pD8KB89H1jh
	 6891EFgF1ERcWzSG1U5E6fjukO5Nm2W1XfowI8LKzyvn4s99lSWorQ5hxTB8g+WlHJDqf
	 1LmJcppTZZHiU4jht3UQoZs2pPkP9hbwHF8uHH9o4X4ZfPauND9y1ZSEqgYbgaPTWDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YSwNHVpn;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3AEA606A31E;
	Tue, 24 Nov 2026 19:50:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3AEA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YSwNHVpn
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32B6F497;
	Tue, 24 Nov 2026 11:50:48 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D4843F763;
	Tue, 24 Nov 2026 11:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795549851; bh=yYY/WN4QUgvc4z04f7D6uz3KFfYrIZ3Qs9udXeGh/lM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YSwNHVpnB2B5/F3taejwVptiekHnjjFeq55ruMK0hgqkUkfQyRJ/a7W+lJYA1wmyq
	 NI5CqJkInSZYrBCAwKnGTWMx1k9et3JtNG9HL8pdEokemF/a0REepG7GIoHoA2SdDK
	 zscGZsLvZSoaqfGsZ6ufmdjIKQQISPqzWqX8UXa0=
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
Subject: [PATCH v17 13/34] firmware: arm_scmi: Add Telemetry global update intervals enumeration
Date: Tue, 24 Nov 2026 19:48:19 +0000
Message-ID: <20261124194841.1147072-14-cristian.marussi@arm.com>
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

Add support to enumerate global available Telemetry update intervals.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v16 --> v17
 - avoid FIELD_PREP check on size for exp
v15 --> v16
 - split out group update interval enumeration
v14 --> v15
 - removed unused dev reference in interval parsing
 - added missing initialization of intrvs->grp_id
v13 --> v14
 - splitted out of the old Basic Telemetry patch, contains the
   update_intervals enumeration routines
---
 drivers/firmware/arm_scmi/telemetry.c | 164 ++++++++++++++++++++++++++
 include/linux/scmi_protocol.h         |  21 ++++
 2 files changed, 185 insertions(+)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 94311cdc9398..4ef4e44230d1 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -92,6 +92,21 @@ struct scmi_msg_resp_telemetry_de_description {
 	struct scmi_de_desc desc[];
 };
 
+struct scmi_msg_telemetry_update_intervals {
+	__le32 index;
+	__le32 group_identifier;
+#define	ALL_DES_NO_GROUP	0x0
+#define SPECIFIC_GROUP_DES	0x1
+#define ALL_DES_ANY_GROUP	0x2
+	__le32 flags;
+};
+
+struct scmi_msg_resp_telemetry_update_intervals {
+	__le32 flags;
+#define INTERVALS_DISCRETE(x)	(le32_get_bits((x), BIT(12)) == 0)
+	__le32 intervals[];
+};
+
 #define IS_TDE_TSTAMP_TYPE(__t, __ttype)	((__t)->ts_type == (__ttype))
 #define IS_TDE_TS_NONE(_t)	(IS_TDE_TSTAMP_TYPE((_t), TSTAMP_NONE))
 #define IS_TDE_TS_LINE(_t)	(IS_TDE_TSTAMP_TYPE((_t), TSTAMP_LINE))
@@ -625,6 +640,149 @@ static int scmi_telemetry_de_descriptors_get(struct telemetry_info *ti)
 	return 0;
 }
 
+struct scmi_tlm_ivl_priv {
+	struct scmi_telemetry_intervals **intrvs;
+	unsigned int grp_id;
+	unsigned int flags;
+};
+
+static void iter_intervals_prepare_message(void *message,
+					   unsigned int desc_index,
+					   const void *priv)
+{
+	struct scmi_msg_telemetry_update_intervals *msg = message;
+	const struct scmi_tlm_ivl_priv *p = priv;
+
+	msg->index = cpu_to_le32(desc_index);
+	msg->group_identifier = cpu_to_le32(p->grp_id);
+	msg->flags = cpu_to_le32(FIELD_PREP(GENMASK(3, 0), p->flags));
+}
+
+static int iter_intervals_update_state(struct scmi_iterator_state *st,
+				       const void *response, void *priv)
+{
+	const struct scmi_msg_resp_telemetry_update_intervals *r = response;
+
+	st->num_returned = le32_get_bits(r->flags, GENMASK(11, 0));
+	st->num_remaining = le32_get_bits(r->flags, GENMASK(31, 16));
+
+	if (st->rx_len < (sizeof(*r) + sizeof(r->intervals[0]) * st->num_returned))
+		return -EINVAL;
+
+	/*
+	 * total intervals is not declared previously anywhere so we
+	 * assume it's returned+remaining on first call.
+	 */
+	if (!st->max_resources) {
+		struct scmi_tlm_ivl_priv *p = priv;
+		struct scmi_telemetry_intervals *intrvs;
+		bool discrete;
+		int inum;
+
+		discrete = INTERVALS_DISCRETE(r->flags);
+		/* Check consistency on first call */
+		if (!discrete && (st->num_returned != 3 || st->num_remaining != 0))
+			return -EINVAL;
+
+		inum = st->num_returned + st->num_remaining;
+		intrvs = kzalloc_flex(*intrvs, update_intervals, inum);
+		if (!intrvs)
+			return -ENOMEM;
+
+		intrvs->num_intervals = inum;
+		intrvs->discrete = discrete;
+		intrvs->grp_id = p->grp_id;
+		st->max_resources = intrvs->num_intervals;
+
+		*p->intrvs = intrvs;
+	}
+
+	return 0;
+}
+
+static int
+iter_intervals_process_response(const struct scmi_protocol_handle *ph,
+				const void *response,
+				struct scmi_iterator_state *st, void *priv)
+{
+	const struct scmi_msg_resp_telemetry_update_intervals *r = response;
+	struct scmi_tlm_ivl_priv *p = priv;
+	struct scmi_telemetry_intervals *intrvs = *p->intrvs;
+	unsigned int idx = st->loop_idx;
+
+	intrvs->update_intervals[st->desc_index + idx] =
+		le32_to_cpu(r->intervals[idx]);
+
+	return 0;
+}
+
+static int
+scmi_tlm_enumerate_update_intervals(struct telemetry_info *ti,
+				    struct scmi_telemetry_intervals **intervals,
+				    int grp_id, unsigned int flags)
+{
+	struct scmi_iterator_ops ops = {
+		.prepare_message = iter_intervals_prepare_message,
+		.update_state = iter_intervals_update_state,
+		.process_response = iter_intervals_process_response,
+	};
+	const struct scmi_protocol_handle *ph = ti->ph;
+	struct scmi_telemetry_intervals *intrvs = NULL;
+	struct scmi_tlm_ivl_priv ipriv = {
+		.grp_id = grp_id,
+		.intrvs = &intrvs,
+		.flags = flags,
+	};
+	void *iter;
+	int ret;
+
+	iter = ph->hops->iter_response_init(ph, &ops, 0,
+		TELEMETRY_LIST_UPDATE_INTERVALS,
+		sizeof(struct scmi_msg_telemetry_update_intervals),
+		&ipriv);
+	if (IS_ERR(iter))
+		return PTR_ERR(iter);
+
+	/* Cleanup iterator inner allocations on failure */
+	ret = ph->hops->iter_response_run(iter);
+	if (ret) {
+		kfree(intrvs);
+		return ret;
+	}
+
+	*intervals = intrvs;
+
+	return 0;
+}
+
+static void scmi_telemetry_intervals_free(void *interval)
+{
+	kfree(interval);
+}
+
+static int
+scmi_telemetry_enumerate_common_intervals(struct telemetry_info *ti)
+{
+	unsigned int flags;
+	int ret;
+
+	flags = !ti->info.per_group_config_support ?
+		ALL_DES_ANY_GROUP : ALL_DES_NO_GROUP;
+
+	ret = scmi_tlm_enumerate_update_intervals(ti, &ti->info.intervals,
+						  SCMI_TLM_GRP_INVALID, flags);
+	if (ret)
+		return ret;
+
+	/* A copy for UAPI access... */
+	ti->info.base.num_intervals = ti->info.intervals->num_intervals;
+
+	/* Delegate freeing of allocated intervals to unbind time */
+	return devm_add_action_or_reset(ti->ph->dev,
+					scmi_telemetry_intervals_free,
+					ti->info.intervals);
+}
+
 static const struct scmi_telemetry_info *
 scmi_telemetry_info_get(const struct scmi_protocol_handle *ph)
 {
@@ -886,6 +1044,12 @@ static int scmi_telemetry_protocol_init(const struct scmi_protocol_handle *ph)
 		return ret;
 	}
 
+	ret = scmi_telemetry_enumerate_common_intervals(ti);
+	if (ret) {
+		dev_err(dev, FW_BUG "Cannot enumerate update intervals. Abort.\n");
+		return ret;
+	}
+
 	ti->info.base.version = ph->version;
 
 	return ph->set_priv(ph, ti);
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index cc5bd87705ed..a373b782f05e 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -830,6 +830,25 @@ struct scmi_pinctrl_proto_ops {
 	int (*pin_free)(const struct scmi_protocol_handle *ph, u32 pin);
 };
 
+#define	SCMI_TLM_GET_UPDATE_INTERVAL_SECS(x)	(FIELD_GET(GENMASK(20, 5), (x)))
+#define SCMI_TLM_GET_UPDATE_INTERVAL_EXP(x)	(sign_extend32((x), 4))
+
+#define SCMI_TLM_GET_UPDATE_INTERVAL(x)		(FIELD_GET(GENMASK(20, 0), (x)))
+#define SCMI_TLM_BUILD_UPDATE_INTERVAL(s, e)				    \
+	(FIELD_PREP(GENMASK(20, 5), (s)) | FIELD_PREP(GENMASK(4, 0), (e) & GENMASK(4, 0)))
+
+#define SCMI_TLM_GRP_INVALID	0xFFFFFFFF
+
+struct scmi_telemetry_intervals {
+	unsigned int grp_id;
+	bool discrete;
+	unsigned int num_intervals;
+#define SCMI_TLM_UPDATE_INTVL_SEGMENT_LOW	0
+#define SCMI_TLM_UPDATE_INTVL_SEGMENT_HIGH	1
+#define SCMI_TLM_UPDATE_INTVL_SEGMENT_STEP	2
+	unsigned int update_intervals[] __counted_by(num_intervals);
+};
+
 struct scmi_telemetry_de_info {
 	unsigned int id;
 	unsigned int grp_id;
@@ -877,6 +896,8 @@ struct scmi_telemetry_info {
 	bool reset_support;
 	bool fc_support;
 	struct scmi_telemetry_base_info base;
+	unsigned int active_update_interval;
+	struct scmi_telemetry_intervals *intervals;
 };
 
 /**
-- 
2.54.0

