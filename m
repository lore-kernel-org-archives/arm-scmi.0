Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795304645;
	b=JBZqVE5CWEWAeiDQEha36SOHL9KQVXNzlXvpDXHWSueyV+pSAuwT4UdT7zYKjJU2xwXv
	 vdxY4632CuzczOrC55KIzYGHD4IOEShw091fesDUa+73UqNIWe7hEXLjgOUzbPpDf1btl
	 kL5GmEZ7lAKSijzFonC8gWfaxHHyl9CNwWTncst9MWZayp03oBOhdmg6ePVVnxHg8s29S
	 CvLWG4Ibcsu5VSWqnGnmpTj1nIrJpLjUo2PjBB+IISn5DqHg4onEnb7T/+Gz2UGkays16
	 xqZWgaIDxLC88++hzjHRFQEFBMmeSJybXP2C837L1Kb1dNWScZbzz2DrHK3UTyOzlbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795304645;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hb9T5ArgrAzr/JClJPi4G2cB6w0raB9303L+BYr/rpA=;
	b=YnogXrs2SWz7GgKog4Eb59k9yy9xKBu7tDGYr6UrwvLiw1sYobmDPvEAQrrV6+GnbM27
	 eWofhdFkvGmWhQAnmDSMJtA7CGc/wO0UdiMaQdXQSRaPsZuRa1F3cpjAFLtYMxL/rmX4I
	 7xYvNZU/sw1WtK96shrvQGNj7Sb2eB68iB2fTrrkILZBwjVsfFLSA62x44ACLh2oxh2OT
	 WEgeOTWrA1mSQe75NUxvWf9RRxnBcHmuqYBO4ayiASSD34c8sZaemjI5FO9wafr6l60wb
	 gfI0bSoxGViaKVPFVIGHrQ0WypKAsHyxYjT3RasKywoqq53VSi7KDJIbIFUfPctVH+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=TSCZ+NiD;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38B4C606A331;
	Sat, 21 Nov 2026 23:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38B4C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=TSCZ+NiD
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B053D16F2;
	Sat, 21 Nov 2026 15:44:00 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C80AA3F632;
	Sat, 21 Nov 2026 15:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795304643; bh=3VSAcbVmbrlnSQIUOy2KA4THCCM+THqJTZo0o6GstzU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TSCZ+NiD3P5Mtfp7kfMAClGJ97vHgAbP9xskirDmgRqm1iSzzJgH1TaEftsGA4+bV
	 debg2gnwjJMm+s2rrzPPiyE3ujwCXraxaXKfIU6FBO8IEggqVx7EMQmE0JxH6TvEAY
	 q6lhNHZECWzhvCN5srDiNe6mLFZthVd7bilsQlLA=
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
Subject: [PATCH v16 12/31] firmware: arm_scmi: Add Telemetry global update intervals enumeration
Date: Sat, 21 Nov 2026 23:39:46 +0000
Message-ID: <20261121234005.1525419-13-cristian.marussi@arm.com>
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

Add support to enumerate global available Telemetry update intervals.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
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
index 64c92d9ab900..115aebcc918f 100644
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
@@ -618,6 +633,149 @@ static int scmi_telemetry_de_descriptors_get(struct telemetry_info *ti)
 	return devm_add_action_or_reset(ph->dev, scmi_telemetry_tdes_cleanup, ti);
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
@@ -878,6 +1036,12 @@ static int scmi_telemetry_protocol_init(const struct scmi_protocol_handle *ph)
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
index cc5bd87705ed..74ed6411ff76 100644
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
+	(FIELD_PREP(GENMASK(20, 5), (s)) | FIELD_PREP(GENMASK(4, 0), (e)))
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

