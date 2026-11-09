Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215739;
	b=YdWl851RiOJiYTcbxRYvXUYSOI4vcBaPDOKovbVLX9iDoJakolJATs2ady3t4ZQt1wcL
	 OUVmmSwdIitb/rvi/Iibd/TSP/QhXQrJti/NiRb0gS75h7Z10cnD1eA8EpRyhhwsWzkjf
	 Ly7s33zwSUkiRLckgLOVelYLggUayc9xgt10BpHSo6LBr2s4XzZJF3nzUrQLpEbVHmmJa
	 0oKbeVCEDP25ml819aJf8Vu/vzQPi1MLnq1z0+cCK/pTK9JKffMZBVoRtNwE1J3peV+Jh
	 AXlI7WO4bRoM5w2PqvKV3dmnzLgsL+MA2y+TQXf0diblncz/94VwuzL7lmUp0XT/V5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215739;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=39253fG5bWpxqRcq98FHg3AJ57QeDnuKVQKjUqB+oW8=;
	b=0IVT42SYMfccnSN+pzHXwSrZruyyrFwRWDvl1cWkkTmzgkHZ3cQzegBvQdsIn4+CNwwP
	 6I2Oxkb/Xgc1AsjR33T3oiMXfBmJ+hxNiyAkOPXTf7/oCX4FkbobvpxFHyjwtaYcGs6jc
	 YlNN7ws8r+ALwfLAiMC1UcBQbCZjK34nW5cHXuRsYz8z528u1784m435T8CtrXQm/gmOK
	 psLxRsWzm2M5OmHnVxHnaaJubrzsZ2eHjAjEKru7/VLJqBDNgjPY9BGgAptL9TreXz43a
	 Lju1wDpxUFQczyKfShrBWR+ZZz+wwHWvhqgPqo6b/tPZCB1AIDMyIHaMCcydzxHHBSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QyVHJTh3;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D8316082BD9;
	Mon,  9 Nov 2026 09:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D8316082BD9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QyVHJTh3
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D04081691;
	Mon,  9 Nov 2026 01:15:34 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF38C3F85F;
	Mon,  9 Nov 2026 01:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794215737; bh=HnDt57KF77aM1IoX8Rmdekamsci2JJ30Aljarb8nxRY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QyVHJTh3i/Va1d6qOuuPB9dQ+oi57mbBciIVXgN53cqq/BHcBq88a2YNgBb+iR6LJ
	 X4goda1Y8D50od1FScy+kDZFpbE+Nb8VbJlfPavllDNIJu8Wo2QQMC5sEda66e5AN/
	 QRR1oEJ6mnu8x1ORXLMzfNqJZYFrIiafkV1R/seE=
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
Subject: [PATCH v15 13/35] firmware: arm_scmi: Add Telemetry SHMTI areas enumeration
Date: Mon,  9 Nov 2026 09:11:59 +0000
Message-ID: <20261109091221.2532706-14-cristian.marussi@arm.com>
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

Add Telemetry support to enumerate SHMTI areas.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v14 --> v15
 - fix prologue/epilogue endianity fields
 - rework SHMTI initialization and allocation
 - add snapshot suppport data structures
 - added alignment checks on SHMTII length size
 - fixed error string formatting
 - warn if less than expected SHMTIs are enumerated
 - improve memory area sanity checks
v13 --> v14
 - splitted out of the old Basic Telemetry patch, contains the
   SHMTI areas enumeration routines
---
 drivers/firmware/arm_scmi/telemetry.c | 312 ++++++++++++++++++++++++++
 include/linux/scmi_protocol.h         |  59 +++++
 2 files changed, 371 insertions(+)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index e57534c93b26..d9f1a3e3468e 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -16,6 +16,7 @@
 #include <linux/limits.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/sizes.h>
 #include <linux/slab.h>
 #include <linux/sprintf.h>
 #include <linux/string.h>
@@ -56,6 +57,19 @@ struct scmi_msg_resp_telemetry_protocol_attributes {
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
@@ -107,6 +121,72 @@ struct scmi_msg_resp_telemetry_update_intervals {
 	__le32 intervals[];
 };
 
+/* TDCF */
+
+#define _I(__a)		(ioread32((void __iomem *)(__a)))
+
+struct prlg {
+	__le32 sign_start;
+#define SIGNATURE_START	0x5442474E	/* TBGN */
+	__le32 match_start;
+	__le32 num_qwords;
+	__le32 hdr_meta_1;
+#define TDCF_REVISION_GET(x)	(le32_get_bits((x)->hdr_meta_1, GENMASK(7, 0)))
+};
+
+struct eplg {
+	__le32 match_end;
+	__le32 sign_end;
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
+/* An arbitrary upper bound to avoid crazy allocations driven by buggy FW */
+#define SHMTI_MAX_SIZE	SZ_64K
+
+#define TDCF_START_SIGNATURE(x)	(_I(&((x)->prlg.sign_start)))
+#define TDCF_END_SIGNATURE(e)	(_I(&((e)->sign_end)))
+
+struct telemetry_shmti;
+
+struct shmti_snap {
+	struct telemetry_shmti *shmti;
+	u32 magic;
+	u8 base[] __aligned(8);
+};
+
+struct telemetry_shmti {
+	u32 flags;
+	void __iomem *base;
+	struct scmi_telemetry_shmti_info info;
+	/* Protect srcu operation */
+	struct mutex lock;
+	struct srcu_struct srcu;
+	struct shmti_snap *snaps[2];
+	struct shmti_snap __rcu	*cur;
+	/* Mutex to protect @xa_lines */
+	struct mutex lines_mtx;
+	struct xarray xa_lines;
+	#define PAYLD_HASH_BITS  4
+	struct mutex payld_locks[1 << PAYLD_HASH_BITS];
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
 #define IS_TDE_TSTAMP_TYPE(__t, __ttype)	((__t)->ts_type == (__ttype))
 #define IS_TDE_TS_NONE(_t)	(IS_TDE_TSTAMP_TYPE((_t), TSTAMP_NONE))
 #define IS_TDE_TS_LINE(_t)	(IS_TDE_TSTAMP_TYPE((_t), TSTAMP_LINE))
@@ -135,6 +215,7 @@ struct telemetry_de {
 	u32 ts_rate;
 	bool enumerated;
 	void __iomem *base;
+	struct eplg __iomem *eplg;
 	u32 sid;
 	u32 offset;
 	/* NOTE THAT DE data_sz is registered in scmi_telemetry_de */
@@ -153,6 +234,7 @@ struct telemetry_info {
 	unsigned int num_des_tstamp;
 	unsigned int default_blk_ts_rate;
 	const struct scmi_protocol_handle *ph;
+	struct telemetry_shmti *shmti;
 	struct telemetry_de *tdes;
 	struct xarray xa_des;
 	/* Mutex to protect access to @free_des */
@@ -878,6 +960,211 @@ scmi_telemetry_enumerate_common_intervals(struct telemetry_info *ti)
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
+			"BAD signature for SHMTI ID:%u @phys:%pa - START:0x%08X END:0x%08X\n",
+			shmti->info.sid, &shmti->info.phys, sign_start, sign_end);
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
+	phys_addr_t phys_addr;
+	size_t len;
+	int ret;
+
+	desc = &r->desc[st->loop_idx];
+	shmti = &ti->shmti[st->desc_index + st->loop_idx];
+
+	shmti->info.sid = le32_to_cpu(desc->id);
+	shmti->flags = le32_to_cpu(desc->flags);
+
+	ret = scmi_telemetry_area_check(ph->dev, "SHMTI",
+					le32_to_cpu(desc->addr_low),
+					le32_to_cpu(desc->addr_high),
+					le32_to_cpu(desc->length),
+					&phys_addr, &len);
+	if (ret) {
+		dev_err(ph->dev, "Malformed SHMTI ID:%u. Abort.\n",
+			shmti->info.sid);
+		return ret;
+	}
+
+	if (len < SHMTI_MIN_SIZE || len > SHMTI_MAX_SIZE) {
+		dev_err(ph->dev,
+			FW_BUG "Invalid length for SHMTI ID:%u len:%zu. Abort.\n",
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
+	ret = scmi_telemetry_shmti_validate(ph->dev, shmti);
+	if (ret)
+		return ret;
+
+	ti->num_shmti++;
+
+	return 0;
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
+	int num_shmti;
+	void *iter;
+	int ret;
+
+	/* Save and zero...calculate real number of returned */
+	num_shmti = ti->num_shmti;
+	ti->num_shmti = 0;
+	iter = ph->hops->iter_response_init(ph, &ops, num_shmti,
+					    TELEMETRY_LIST_SHMTI,
+					    sizeof(u32), ti);
+	if (IS_ERR(iter))
+		return PTR_ERR(iter);
+
+	ret = ph->hops->iter_response_run(iter);
+	if (ret)
+		return ret;
+
+	if (num_shmti != ti->num_shmti)
+		dev_warn(ph->dev,
+			 FW_BUG "SHMTI enumeration returned %u items, expected %u\n",
+			 ti->num_shmti, num_shmti);
+
+	return 0;
+}
+
+static void scmi_telemetry_shmti_cleanup(void *arg)
+{
+	struct telemetry_shmti *shmti = arg;
+
+	cleanup_srcu_struct(&shmti->srcu);
+
+	kvfree(shmti->snaps[0]);
+	kvfree(shmti->snaps[1]);
+
+	xa_destroy(&shmti->xa_lines);
+}
+
+static int scmi_telemetry_shmti_init(struct device *dev,
+				     struct telemetry_shmti *shmti)
+{
+	int ret;
+
+	struct shmti_snap *s0 __free(kvfree) =
+		kvzalloc_flex(*s0, base, shmti->info.len);
+	if (!s0)
+		return -ENOMEM;
+
+	struct shmti_snap *s1 __free(kvfree) =
+		kvzalloc_flex(*s1, base, shmti->info.len);
+	if (!s1)
+		return -ENOMEM;
+
+	ret = init_srcu_struct(&shmti->srcu);
+	if (ret)
+		return ret;
+
+	for (int i = 0; i < 1 << PAYLD_HASH_BITS; i++)
+		mutex_init(&shmti->payld_locks[i]);
+
+	mutex_init(&shmti->lock);
+	RCU_INIT_POINTER(shmti->cur, NULL);
+
+	mutex_init(&shmti->lines_mtx);
+	xa_init(&shmti->xa_lines);
+
+	s0->shmti = shmti;
+	shmti->snaps[0] = no_free_ptr(s0);
+
+	s1->shmti = shmti;
+	shmti->snaps[1] = no_free_ptr(s1);
+
+	return devm_add_action_or_reset(dev, scmi_telemetry_shmti_cleanup, shmti);
+}
+
+static int scmi_telemetry_enumerate_shmti(struct telemetry_info *ti)
+{
+	const struct scmi_protocol_handle *ph = ti->ph;
+	int ret;
+
+	if (!ti->num_shmti)
+		return 0;
+
+	ret = scmi_telemetry_shmti_list(ph, ti);
+	if (ret) {
+		dev_err(ph->dev, "Cannot get SHMTI list descriptors");
+		return ret;
+	}
+
+	for (int i = 0; i < ti->num_shmti; i++) {
+		ret = scmi_telemetry_shmti_init(ph->dev, &ti->shmti[i]);
+		if (ret)
+			return ret;
+
+		ti->info.shmtis[i] = &ti->shmti[i].info;
+	}
+
+	/* Expose the fully initialized SHMTI infos */
+	smp_store_release(&ti->info.base.num_shmtis, ti->num_shmti);
+
+	return 0;
+}
+
 static const struct scmi_telemetry_info *
 scmi_telemetry_info_get(const struct scmi_protocol_handle *ph)
 {
@@ -931,7 +1218,20 @@ static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
  * Return: 0 on Success, errno otherwise
  */
 static int scmi_telemetry_resources_alloc(struct telemetry_info *ti)
+
 {
+	/* Array to hold SHMTIs descriptors */
+	struct telemetry_shmti *shmtis __free(kfree) =
+		kzalloc_objs(*shmtis, ti->num_shmti);
+	if (!shmtis)
+		return -ENOMEM;
+
+	/* Array of initialized SHMTIs references */
+	struct scmi_telemetry_shmti_info **shmtis_info __free(kfree) =
+		kzalloc_objs(*shmtis_info, ti->num_shmti);
+	if (!shmtis_info)
+		return -ENOMEM;
+
 	/* Array to hold pointers to discovered DEs */
 	struct scmi_telemetry_de **des __free(kfree) =
 		kzalloc_objs(*des, ti->info.base.num_des);
@@ -984,6 +1284,9 @@ static int scmi_telemetry_resources_alloc(struct telemetry_info *ti)
 
 	INIT_LIST_HEAD(&ti->fcs_des);
 
+	ti->shmti = no_free_ptr(shmtis);
+	ti->info.shmtis = no_free_ptr(shmtis_info);
+
 	ti->tdes = no_free_ptr(tdes);
 
 	rinfo->des = no_free_ptr(des);
@@ -1013,6 +1316,9 @@ static void scmi_telemetry_resources_free(struct telemetry_info *ti)
 	/* Ensure rinfo is no more accessible upfront */
 	smp_store_release(&ti->rinfo, NULL);
 
+	kfree(ti->info.shmtis);
+	kfree(ti->shmti);
+
 	kfree(ti->tdes);
 
 	kfree(rinfo->des);
@@ -1205,6 +1511,12 @@ static int scmi_telemetry_protocol_init(const struct scmi_protocol_handle *ph)
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
index f38ca2f8099b..b7b8bd77b37d 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -830,6 +830,57 @@ struct scmi_pinctrl_proto_ops {
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
 
@@ -913,6 +964,13 @@ struct scmi_telemetry_base_info {
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
@@ -922,6 +980,7 @@ struct scmi_telemetry_info {
 	struct scmi_telemetry_base_info base;
 	unsigned int active_update_interval;
 	struct scmi_telemetry_intervals *intervals;
+	struct scmi_telemetry_shmti_info **shmtis;
 };
 
 /**
-- 
2.54.0

