Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ABD85A0AC7;
	Fri, 16 Oct 2026 18:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792177039; cv=none; b=KBPMbugu6WlWGHzM80Vt/irYNqkAKrwphcWXChLeoi992QcFp3IrJzCnUI+J1R02VBLx5qsBWustOKyMBJAXM5xTHpZ9cAw+8j+WPs9TcZlLckj9ku4hRt4CpqgA0YPoJr5AUoa/X7WMFpp/0THcybaUfs3YBC6rnNaWBpyb44I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792177039; c=relaxed/simple;
	bh=7DfzRxaxqHHatX06fb6l08yLXGe11LfDf85JpQ+QkVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ONWavmd0Cme/SMaR+0KHx2Bc0TDQ8eXLsJsgZEnMlQwS38VCVvlFyv/9hDETtAEH6rUztwoH0SGOD2aie4Z76RLCNvsH5x3t9JSRMEHmGoxJ+vShPLasfqyqEebqaRGNouUj4hKn3P8XCw8q4zkZvaqmpoDBKtoiA7GSCbKkZmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=T0nd5H65; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="T0nd5H65"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DDD61516;
	Fri, 16 Oct 2026 11:57:14 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14D3A3F7B4;
	Fri, 16 Oct 2026 11:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792177037; bh=7DfzRxaxqHHatX06fb6l08yLXGe11LfDf85JpQ+QkVo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T0nd5H65wyXN9WtEMqVAC9eUmoSGZHuReRaYVMaL/5Dt0CRrghGM+M36zZoZcUzbU
	 w9x5VeEr6uqjP28urAhItmVk5xM1pVKAJ0rUXwcOxVMjVPO351FUcf/nCV98LGvZQL
	 QUxwTJHfhEV32egqzBNdaRtAtJyrz8sSOPgJEbBo=
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
Subject: [PATCH v14 11/32] firmware: arm_scmi: Add Telemetry SHMTI areas enumeration
Date: Fri, 16 Oct 2026 19:55:32 +0100
Message-ID: <20261016185553.2794459-12-cristian.marussi@arm.com>
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

Add Telemetry support to enumerate SHMTI areas.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v13 --> v14
 - splitted out of the old Basic Telemetry patch, contains the
   SHMTI areas enumeration routines
---
 drivers/firmware/arm_scmi/telemetry.c | 208 ++++++++++++++++++++++++++
 include/linux/scmi_protocol.h         |  59 ++++++++
 2 files changed, 267 insertions(+)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index b27d09496b53..f587cd21849c 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -55,6 +55,19 @@ struct scmi_msg_resp_telemetry_protocol_attributes {
 	__le32 default_blk_ts_rate;
 };
 
+struct scmi_shmti_desc {
+	__le32 id;
+	__le32 addr_low;
+	__le32 addr_high;
+	__le32 length;
+	__le32 flags;
+};
+
+struct scmi_msg_resp_telemetry_shmti_list {
+	__le32 num_shmti;
+	struct scmi_shmti_desc desc[];
+};
+
 struct de_desc_fastchannel {
 	__le32 addr_low;
 	__le32 addr_high;
@@ -106,6 +119,53 @@ struct scmi_msg_resp_telemetry_update_intervals {
 	__le32 intervals[];
 };
 
+/* TDCF */
+
+#define _I(__a)		(ioread32((void __iomem *)(__a)))
+
+struct prlg {
+	u32 sign_start;
+#define SIGNATURE_START	0x5442474E	/* TBGN */
+	u32 match_start;
+	u32 num_qwords;
+	u32 hdr_meta_1;
+#define TDCF_REVISION_GET(x)	(le32_get_bits((x)->hdr_meta_1, GENMASK(7, 0)))
+};
+
+struct eplg {
+	u32 match_end;
+	u32 sign_end;
+#define SIGNATURE_END	0x54454E44	/* TEND */
+};
+
+#define TDCF_EPLG_SZ	(sizeof(struct eplg))
+
+struct tdcf {
+	struct prlg prlg;
+	unsigned char payld[];
+};
+
+#define SHMTI_MIN_SIZE	(sizeof(struct tdcf) + TDCF_EPLG_SZ)
+
+#define TDCF_START_SIGNATURE(x)	(_I(&((x)->prlg.sign_start)))
+#define TDCF_END_SIGNATURE(e)	(_I(&((e)->sign_end)))
+
+struct telemetry_shmti {
+	u32 flags;
+	void __iomem *base;
+	u32 last_magic;
+	struct scmi_telemetry_shmti_info info;
+};
+
+#define SHMTI_EPLG(s)						\
+	({							\
+		struct telemetry_shmti *_s = (s);		\
+		struct eplg __iomem *_eplg;			\
+								\
+		_eplg = _s->base + _s->info.len - TDCF_EPLG_SZ;	\
+		(_eplg);					\
+	})
+
 enum timestamps {
 	TSTAMP_NONE = 0,
 	TSTAMP_LINE = 1,
@@ -119,6 +179,7 @@ struct telemetry_de {
 	u32 ts_rate;
 	bool enumerated;
 	void __iomem *base;
+	struct eplg __iomem *eplg;
 	u32 sid;
 	u32 offset;
 	/* NOTE THAT DE data_sz is registered in scmi_telemetry_de */
@@ -137,6 +198,7 @@ struct telemetry_info {
 	unsigned int num_des_tstamp;
 	unsigned int default_blk_ts_rate;
 	const struct scmi_protocol_handle *ph;
+	struct telemetry_shmti *shmti;
 	struct telemetry_de *tdes;
 	struct scmi_telemetry_group *grps;
 	struct xarray xa_des;
@@ -787,6 +849,146 @@ scmi_telemetry_enumerate_common_intervals(struct telemetry_info *ti)
 					ti->info.intervals);
 }
 
+static int iter_shmti_update_state(struct scmi_iterator_state *st,
+				   const void *response, void *priv)
+{
+	const struct scmi_msg_resp_telemetry_shmti_list *r = response;
+
+	st->num_returned = le32_get_bits(r->num_shmti, GENMASK(15, 0));
+	st->num_remaining = le32_get_bits(r->num_shmti, GENMASK(31, 16));
+
+	if (st->rx_len < (sizeof(*r) + sizeof(r->desc[0]) * st->num_returned))
+		return -EINVAL;
+
+	return 0;
+}
+
+static inline int
+scmi_telemetry_shmti_validate(struct device *dev, struct telemetry_shmti *shmti)
+{
+	struct tdcf __iomem *tdcf = shmti->base;
+	u32 sign_start, sign_end;
+
+	sign_start = TDCF_START_SIGNATURE(tdcf);
+	sign_end = TDCF_END_SIGNATURE(SHMTI_EPLG(shmti));
+
+	if (sign_start != SIGNATURE_START || sign_end != SIGNATURE_END) {
+		dev_err(dev,
+			"BAD signature for SHMTI ID:%u @phys:%pK - START:0x%04X END:0x%04X\n",
+			shmti->info.sid, shmti->base, sign_start, sign_end);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int iter_shmti_process_response(const struct scmi_protocol_handle *ph,
+				       const void *response,
+				       struct scmi_iterator_state *st,
+				       void *priv)
+{
+	const struct scmi_msg_resp_telemetry_shmti_list *r = response;
+	struct telemetry_info *ti = priv;
+	struct telemetry_shmti *shmti;
+	const struct scmi_shmti_desc *desc;
+	void __iomem *addr;
+	u64 phys_addr;
+	u32 len;
+
+	desc = &r->desc[st->loop_idx];
+	shmti = &ti->shmti[st->desc_index + st->loop_idx];
+
+	shmti->info.sid = le32_to_cpu(desc->id);
+	shmti->flags = le32_to_cpu(desc->flags);
+	phys_addr = le32_to_cpu(desc->addr_low);
+	phys_addr |= (u64)le32_to_cpu(desc->addr_high) << 32;
+
+	if (!IS_ALIGNED(phys_addr, 4)) {
+		dev_err(ph->dev,
+			"SHMTI ID %u is NOT 32-bit aligned (paddr:0x%llX). Abort.\n",
+			shmti->info.sid, phys_addr);
+		return -EINVAL;
+	}
+
+	len = le32_to_cpu(desc->length);
+	if (len < SHMTI_MIN_SIZE) {
+		dev_err(ph->dev, "Invalid length for SHMTI ID:%u len:%u\n",
+			shmti->info.sid, len);
+		return -EINVAL;
+	}
+
+	/* SHMTI base phys_addr SHOULD be 64bit aligned by the SCMI spec */
+	if (!IS_ALIGNED(phys_addr, 8))
+		dev_warn(ph->dev,
+			 "SHMTI ID:%u is NOT 64bit aligned (paddr:0x%llX)\n",
+			 shmti->info.sid, phys_addr);
+
+	addr = devm_ioremap(ph->dev, phys_addr, len);
+	if (!addr)
+		return -EADDRNOTAVAIL;
+
+	shmti->base = addr;
+	shmti->info.len = len;
+	shmti->info.phys = phys_addr;
+	shmti->info.offset = shmti->info.phys & ~PAGE_MASK;
+
+	return scmi_telemetry_shmti_validate(ph->dev, shmti);
+}
+
+static int scmi_telemetry_shmti_list(const struct scmi_protocol_handle *ph,
+				     struct telemetry_info *ti)
+{
+	struct scmi_iterator_ops ops = {
+		.prepare_message = iter_tlm_prepare_message,
+		.update_state = iter_shmti_update_state,
+		.process_response = iter_shmti_process_response,
+	};
+	void *iter;
+
+	iter = ph->hops->iter_response_init(ph, &ops, ti->num_shmti,
+					    TELEMETRY_LIST_SHMTI,
+					    sizeof(u32), ti);
+	if (IS_ERR(iter))
+		return PTR_ERR(iter);
+
+	return ph->hops->iter_response_run(iter);
+}
+
+static int scmi_telemetry_enumerate_shmti(struct telemetry_info *ti)
+{
+	const struct scmi_protocol_handle *ph = ti->ph;
+	struct scmi_telemetry_shmti_info **shmtis;
+	int ret;
+
+	if (!ti->num_shmti)
+		return 0;
+
+	ti->shmti = devm_kcalloc(ph->dev, ti->num_shmti, sizeof(*ti->shmti),
+				 GFP_KERNEL);
+	if (!ti->shmti)
+		return -ENOMEM;
+
+	ret = scmi_telemetry_shmti_list(ph, ti);
+	if (ret) {
+		dev_err(ph->dev, "Cannot get SHMTI list descriptors");
+		return ret;
+	}
+
+	/* Expose initialized SHMTIs references */
+	shmtis = devm_kcalloc(ph->dev, ti->num_shmti,
+			      sizeof(*shmtis), GFP_KERNEL);
+	if (!shmtis)
+		return -ENOMEM;
+
+	for (int i = 0; i < ti->num_shmti; i++)
+		shmtis[i] = &ti->shmti[i].info;
+
+	ti->info.shmtis = shmtis;
+	ti->info.base.num_shmtis = ti->num_shmti;
+
+	return 0;
+}
+
 static const struct scmi_telemetry_info *
 scmi_telemetry_info_get(const struct scmi_protocol_handle *ph)
 {
@@ -1109,6 +1311,12 @@ static int scmi_telemetry_protocol_init(const struct scmi_protocol_handle *ph)
 		return ret;
 	}
 
+	ret = scmi_telemetry_enumerate_shmti(ti);
+	if (ret) {
+		dev_err(dev, FW_BUG "Cannot enumerate SHMTIs. Abort.\n");
+		return ret;
+	}
+
 	ti->info.base.version = ph->version;
 
 	return ph->set_priv(ph, ti);
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 26a18698681a..3c09c14b66fa 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -826,6 +826,57 @@ struct scmi_pinctrl_proto_ops {
 	int (*pin_free)(const struct scmi_protocol_handle *ph, u32 pin);
 };
 
+enum scmi_telemetry_de_type {
+	SCMI_TLM_DE_TYPE_USPECIFIED,
+	SCMI_TLM_DE_TYPE_ACCUMUL_IDLE_RESIDENCY,
+	SCMI_TLM_DE_TYPE_ACCUMUL_IDLE_COUNTS,
+	SCMI_TLM_DE_TYPE_ACCUMUL_OTHERS,
+	SCMI_TLM_DE_TYPE_INSTA_IDLE_STATE,
+	SCMI_TLM_DE_TYPE_INSTA_OTHERS,
+	SCMI_TLM_DE_TYPE_AVERAGE,
+	SCMI_TLM_DE_TYPE_STATUS,
+	SCMI_TLM_DE_TYPE_RESERVED_START,
+	SCMI_TLM_DE_TYPE_RESERVED_END = 0xef,
+	SCMI_TLM_DE_TYPE_OEM_START = 0xf0,
+	SCMI_TLM_DE_TYPE_OEM_END = 0xff,
+};
+
+enum scmi_telemetry_compo_type {
+	SCMI_TLM_COMPO_TYPE_USPECIFIED,
+	SCMI_TLM_COMPO_TYPE_CPU,
+	SCMI_TLM_COMPO_TYPE_CLUSTER,
+	SCMI_TLM_COMPO_TYPE_GPU,
+	SCMI_TLM_COMPO_TYPE_NPU,
+	SCMI_TLM_COMPO_TYPE_INTERCONNECT,
+	SCMI_TLM_COMPO_TYPE_MEM_CNTRL,
+	SCMI_TLM_COMPO_TYPE_L1_CACHE,
+	SCMI_TLM_COMPO_TYPE_L2_CACHE,
+	SCMI_TLM_COMPO_TYPE_L3_CACHE,
+	SCMI_TLM_COMPO_TYPE_LL_CACHE,
+	SCMI_TLM_COMPO_TYPE_SYS_CACHE,
+	SCMI_TLM_COMPO_TYPE_DISP_CNTRL,
+	SCMI_TLM_COMPO_TYPE_IPU,
+	SCMI_TLM_COMPO_TYPE_CHIPLET,
+	SCMI_TLM_COMPO_TYPE_PACKAGE,
+	SCMI_TLM_COMPO_TYPE_SOC,
+	SCMI_TLM_COMPO_TYPE_SYSTEM,
+	SCMI_TLM_COMPO_TYPE_SMCU,
+	SCMI_TLM_COMPO_TYPE_ACCEL,
+	SCMI_TLM_COMPO_TYPE_BATTERY,
+	SCMI_TLM_COMPO_TYPE_CHARGER,
+	SCMI_TLM_COMPO_TYPE_PMIC,
+	SCMI_TLM_COMPO_TYPE_BOARD,
+	SCMI_TLM_COMPO_TYPE_MEMORY,
+	SCMI_TLM_COMPO_TYPE_PERIPH,
+	SCMI_TLM_COMPO_TYPE_PERIPH_SUBC,
+	SCMI_TLM_COMPO_TYPE_LID,
+	SCMI_TLM_COMPO_TYPE_DISPLAY,
+	SCMI_TLM_COMPO_TYPE_RESERVED_START = 0x1d,
+	SCMI_TLM_COMPO_TYPE_RESERVED_END = 0xdf,
+	SCMI_TLM_COMPO_TYPE_OEM_START = 0xe0,
+	SCMI_TLM_COMPO_TYPE_OEM_END = 0xff,
+};
+
 #define	SCMI_TLM_GET_UPDATE_INTERVAL_SECS(x)	(FIELD_GET(GENMASK(20, 5), (x)))
 #define SCMI_TLM_GET_UPDATE_INTERVAL_EXP(x)	(sign_extend32((x), 4))
 
@@ -905,6 +956,13 @@ struct scmi_telemetry_base_info {
 	unsigned int num_shmtis;
 };
 
+struct scmi_telemetry_shmti_info {
+	unsigned int sid;
+	unsigned int len;
+	unsigned long offset;
+	phys_addr_t phys;
+};
+
 struct scmi_telemetry_info {
 	bool single_read_support;
 	bool continuous_update_support;
@@ -914,6 +972,7 @@ struct scmi_telemetry_info {
 	struct scmi_telemetry_base_info base;
 	unsigned int active_update_interval;
 	struct scmi_telemetry_intervals *intervals;
+	struct scmi_telemetry_shmti_info **shmtis;
 };
 
 /**
-- 
2.54.0

