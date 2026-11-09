Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215730;
	b=MvsN8gsjCCjflrriKPb1puF7IHTgsfHnZ4IibXYKe1JxWGWiqkJqkL0qCP7foJTL4R71
	 vN1reOg47P/8AbMOP6YjZQculNNkCrdhV/3BUX2Bpbakgjr9IzpZ+IhkqFZQI5WJVDh2o
	 kIsmXzjLbxAScV0TpD3TLgurEd7fLDhjwUC1ANonAFKOzVOaf9665Iihronzz5U+P2mkV
	 tPF2NZiaNCP0IkTL9ehPROO1RrZmuCIpchOwY16EriSF0pt6jd7ICcBmNQoA3h9pcd9Vg
	 JcdiRlC4qtVlmUjAG/iXMyrycXNYc0OZdCCJTmBlR9msm6YonbmPiGHusLtn3PcEZaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215730;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HPUmyB7LGfYww2avWVPL+YrLaDLxVIKi0Ra+NgGTVZA=;
	b=zlGKrgT1qK915AObt6g3xKklF3GcBky0K//UTWxjIrFIWIUV/OiTtC2IQay8pX3vwJHA
	 0R6I2y0Copliq44Vulsc6a0Vks94FQ+AVDftBJS73HdmWyF3ZmyVFLbT/ZalcDC7IgytS
	 5U8vdw/0kXVqaQZ/0pm2twX2Fjx23Rhz8LrN/8XcIgRxQz1Sp9MC4T14pp2gAfOWeJZnC
	 dY9nryYiV18PeFSWYqtFaJbV5b2jPjly4UkwQ9N4aDirwQ/8HDyNEMmUZnpvkwSCLL+hP
	 dbsJhjcn+lZpra481iOsIX37YoocSBAcW1PoyvWkQQ5ns16hUulEjz34C6obsbE9aZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JR58NxES;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14CB0606EE90;
	Mon,  9 Nov 2026 09:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14CB0606EE90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JR58NxES
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CCB314BF;
	Mon,  9 Nov 2026 01:15:25 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 63B3A3F85F;
	Mon,  9 Nov 2026 01:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794215728; bh=ph0WfTKGC93WgK5JY6g8yqcXA9dQCTntbWY5W5rQNIg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JR58NxESaDzw7d5J+VHFhGSS6MEBVcL/V/QqfcBup1sF1kHashX/qZ1ooQfNTXV+Q
	 NjlDSFamWk4E/3mHs+LhWAHTJ/DtAVjXNuYsrnxIYqlKO6epXxbXt2y9sJ7DM4a743
	 iEhcuy9adAV8n+adB2tB6cc/mg9R4mNYfZZekb3Y=
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
Subject: [PATCH v15 10/35] firmware: arm_scmi: Add Telemetry resources enumeration
Date: Mon,  9 Nov 2026 09:11:56 +0000
Message-ID: <20261109091221.2532706-11-cristian.marussi@arm.com>
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

Add basic Telemetry allocation and initialization routines, introducing and
wiring-up the logic needed to enumerate all the SCMI Telemetry resources
optionally using a lazy on-demand scheme: this approach factors in the
flexibility needed to minimize the amount of initialization work based on
the effective access pattern used by the upper layer ABI.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v14 --> v15
 - drop usage of devres for FC iomapping
 - trigger full enumeration of DE lookups
 - new IS_TDE_TS_ macro helpers
 - add a dedicated scmi_telemetry_free_tdes_add helper
 - better commenting
 - dropping needless __must_check
 - flag as fully enumerated only when ALL declared des were found
 - drop redundant iounmap
 - check FC size on enumeration
v13 --> v14
 - splitted out of the old Basic Telemetry patch, contains the basic
   instance allocations and the DEs enumeration process
 - renamed some fields to more strictly adhere to spec nomenclature
---
 drivers/firmware/arm_scmi/telemetry.c | 724 ++++++++++++++++++++++++++
 include/linux/scmi_protocol.h         |  37 ++
 2 files changed, 761 insertions(+)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 23eaac485691..db4108ef0232 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -8,15 +8,19 @@
 #include <linux/atomic.h>
 #include <linux/bitfield.h>
 #include <linux/compiler_types.h>
+#include <linux/completion.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/limits.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/sprintf.h>
 #include <linux/string.h>
 #include <linux/uuid.h>
+#include <linux/xarray.h>
 
 #include "protocols.h"
 #include "notify.h"
@@ -52,13 +56,214 @@ struct scmi_msg_resp_telemetry_protocol_attributes {
 	__le32 default_blk_ts_rate;
 };
 
+struct de_desc_fastchannel {
+	__le32 addr_low;
+	__le32 addr_high;
+	__le32 size;
+};
+
+struct scmi_de_desc {
+	__le32 de_id;
+	__le32 group_id;
+	__le32 de_data_sz;
+	__le32 de_attributes_1;
+#define	IS_NAME_SUPPORTED(d)	(le32_get_bits((d)->de_attributes_1, BIT(31)))
+#define	IS_FC_SUPPORTED(d)	(le32_get_bits((d)->de_attributes_1, BIT(30)))
+#define	GET_DE_TYPE(d)		(le32_get_bits((d)->de_attributes_1, GENMASK(29, 22)))
+#define	IS_PERSISTENT(d)	(le32_get_bits((d)->de_attributes_1, BIT(21)))
+#define GET_DE_UNIT_EXP(d)							\
+	({									\
+		__u32 __signed_exp =						\
+			le32_get_bits((d)->de_attributes_1, GENMASK(20, 13));	\
+										\
+		sign_extend32(__signed_exp, 7);					\
+	})
+#define	GET_DE_UNIT(d)		(le32_get_bits((d)->de_attributes_1, GENMASK(12, 5)))
+#define	TSTAMP_SUPPORT(d)	(le32_get_bits((d)->de_attributes_1, GENMASK(1, 0)))
+	__le32 de_attributes_2;
+#define	GET_DE_INSTA_ID(d)	(le32_get_bits((d)->de_attributes_2, GENMASK(31, 24)))
+#define	GET_COMPO_INSTA_ID(d)	(le32_get_bits((d)->de_attributes_2, GENMASK(23, 8)))
+#define	GET_COMPO_TYPE(d)	(le32_get_bits((d)->de_attributes_2, GENMASK(7, 0)))
+	__le32 de_attributes_3;
+};
+
+struct scmi_msg_resp_telemetry_de_description {
+	__le32 num_desc;	/* This does NOT count desc[] by the spec */
+	struct scmi_de_desc desc[];
+};
+
+#define IS_TDE_TSTAMP_TYPE(__t, __ttype)	((__t)->ts_type == (__ttype))
+#define IS_TDE_TS_NONE(_t)	(IS_TDE_TSTAMP_TYPE((_t), TSTAMP_NONE))
+#define IS_TDE_TS_LINE(_t)	(IS_TDE_TSTAMP_TYPE((_t), TSTAMP_LINE))
+#define IS_TDE_TS_BLK(_t)	(IS_TDE_TSTAMP_TYPE((_t), TSTAMP_BLK))
+
+#define TDE_FC_SIZE(_t)							\
+({									\
+	struct telemetry_de *__t = (_t);				\
+	size_t fc_size;							\
+									\
+	fc_size = __t->de.info->data_sz;				\
+	fc_size += __t->de.tstamp_support ? sizeof(u32) * 2 : 0;	\
+	(fc_size);							\
+})
+
+enum timestamps {
+	TSTAMP_NONE = 0,
+	TSTAMP_LINE = 1,
+	TSTAMP_BLK = 2,
+};
+
+#define SHMTI_ID_INVALID	GENMASK(31, 0)
+
+struct telemetry_de {
+	enum timestamps ts_type;
+	u32 ts_rate;
+	bool enumerated;
+	void __iomem *base;
+	u32 sid;
+	u32 offset;
+	/* NOTE THAT DE data_sz is registered in scmi_telemetry_de */
+	u32 fc_size;
+	struct list_head item;
+	struct scmi_telemetry_de de;
+	/* Protect last_val/ts/magic accesses - MUST BE KEPT LAST */
+	struct mutex mtx;
+};
+
+#define to_tde(d)	container_of(d, struct telemetry_de, de)
+
 struct telemetry_info {
 	bool streaming_mode;
 	unsigned int num_shmti;
 	unsigned int num_des_tstamp;
 	unsigned int default_blk_ts_rate;
 	const struct scmi_protocol_handle *ph;
+	struct telemetry_de *tdes;
+	struct xarray xa_des;
+	/* Mutex to protect access to @free_des */
+	struct mutex free_mtx;
+	struct list_head free_des;
+	struct list_head fcs_des;
 	struct scmi_telemetry_info info;
+	atomic_t rinfo_initializing;
+	struct completion rinfo_initdone;
+	struct scmi_telemetry_res_info *rinfo;
+	struct scmi_telemetry_res_info *(*res_get)(struct telemetry_info *ti);
+};
+
+static struct scmi_telemetry_res_info *
+__scmi_telemetry_resources_get(struct telemetry_info *ti);
+
+static struct telemetry_de *
+scmi_telemetry_free_tde_get(struct telemetry_info *ti)
+{
+	struct telemetry_de *tde;
+
+	guard(mutex)(&ti->free_mtx);
+
+	tde = list_first_entry_or_null(&ti->free_des, struct telemetry_de, item);
+	if (!tde)
+		return tde;
+
+	list_del(&tde->item);
+
+	return tde;
+}
+
+static inline void scmi_telemetry_free_tdes_add(struct telemetry_info *ti,
+						struct telemetry_de *tde)
+{
+	guard(mutex)(&ti->free_mtx);
+	list_add_tail(&tde->item, &ti->free_des);
+}
+
+static void scmi_telemetry_free_tde_put(struct telemetry_info *ti,
+					struct telemetry_de *tde)
+{
+	struct scmi_telemetry_de_info *info;
+
+	lockdep_assert_held(&tde->mtx);
+
+	/* Unmap any valid FC */
+	if (tde->de.fc_support && tde->base)
+		iounmap(tde->base);
+
+	/* Save clear and restore */
+	info = tde->de.info;
+	memset(info, 0, sizeof(*info));
+	memset(tde, 0, offsetof(struct telemetry_de, mtx));
+	tde->de.info = info;
+
+	scmi_telemetry_free_tdes_add(ti, tde);
+}
+
+static struct telemetry_de *scmi_telemetry_tde_lookup(struct telemetry_info *ti,
+						      unsigned int de_id)
+{
+	struct scmi_telemetry_de *de;
+
+	de = xa_load(&ti->xa_des, de_id);
+	if (!de)
+		return NULL;
+
+	return to_tde(de);
+}
+
+static struct telemetry_de *scmi_telemetry_tde_get(struct telemetry_info *ti,
+						   unsigned int de_id)
+{
+	struct telemetry_de *tde;
+
+	tde = scmi_telemetry_free_tde_get(ti);
+	if (!tde) {
+		dev_err(ti->ph->dev, "Cannot get TDE for ID:0x%08X\n", de_id);
+		return ERR_PTR(-ENOSPC);
+	}
+
+	tde->sid = SHMTI_ID_INVALID;
+
+	return tde;
+}
+
+static int scmi_telemetry_tde_register(struct telemetry_info *ti,
+				       struct telemetry_de *tde)
+{
+	struct scmi_telemetry_res_info *rinfo;
+	int ret;
+
+	lockdep_assert_held(&tde->mtx);
+
+	/* Get rinfo without triggering a recursive enumeration */
+	rinfo = __scmi_telemetry_resources_get(ti);
+
+	if (rinfo->num_des >= ti->info.base.num_des) {
+		ret = -ENOSPC;
+		goto err;
+	}
+
+	/* Store DE pointer by de_id ... */
+	ret = xa_insert(&ti->xa_des, tde->de.info->id, &tde->de, GFP_KERNEL);
+	if (ret)
+		goto err;
+
+	/* ... and in the general array */
+	rinfo->des[rinfo->num_des] = &tde->de;
+	/* Make sure the freshly registered DE is visible before the index update */
+	smp_store_release(&rinfo->num_des, rinfo->num_des + 1);
+
+	return 0;
+
+err:
+	dev_err(ti->ph->dev, "Cannot register TDE for ID:0x%08X - ret:%d\n",
+		tde->de.info->id, ret);
+
+	return ret;
+}
+
+struct scmi_tlm_de_priv {
+	struct telemetry_info *ti;
+	void *next;
+	size_t rx_len;
 };
 
 static int
@@ -100,6 +305,282 @@ scmi_telemetry_protocol_attributes_get(struct telemetry_info *ti)
 	return ret;
 }
 
+static void iter_tlm_prepare_message(void *message,
+				     unsigned int desc_index, const void *priv)
+{
+	put_unaligned_le32(desc_index, message);
+}
+
+static int iter_de_descr_update_state(struct scmi_iterator_state *st,
+				      const void *response, void *priv)
+{
+	const struct scmi_msg_resp_telemetry_de_description *r = response;
+	struct scmi_tlm_de_priv *p = priv;
+
+	st->num_returned = le32_get_bits(r->num_desc, GENMASK(15, 0));
+	st->num_remaining = le32_get_bits(r->num_desc, GENMASK(31, 16));
+
+	if (st->rx_len < (sizeof(*r) + sizeof(r->desc[0]) * st->num_returned))
+		return -EINVAL;
+
+	/* Initialized to first descriptor and initial payload size */
+	p->next = (void *)r->desc;
+	p->rx_len = st->rx_len - sizeof(*r);
+
+	return 0;
+}
+
+static inline size_t scmi_telemetry_tde_var_size_calc(struct telemetry_de *tde)
+{
+	size_t sz = 0;
+
+	sz += IS_TDE_TS_LINE(tde) ? sizeof(__le32) : 0;
+	sz += tde->de.fc_support ? sizeof(struct de_desc_fastchannel) : 0;
+	sz += tde->de.name_support ? SCMI_SHORT_NAME_MAX_SIZE : 0;
+
+	return sz;
+}
+
+static inline int
+scmi_telemetry_area_check(struct device *dev, const char *tag,
+			  u32 low, u32 high, u32 size,
+			  phys_addr_t *phys_addr, size_t *len)
+{
+	u64 addr = ((u64)high << 32) | low;
+	phys_addr_t pa = (phys_addr_t)addr;
+	unsigned long end_phys;
+
+	/* Does the returned pointer fits architetural size ? */
+	if ((u64)pa != addr) {
+		dev_err(dev, FW_BUG "%s phys_addr (0x%llX) pointer too big.\n",
+			tag, pa);
+		return -EOVERFLOW;
+	}
+
+	if (!IS_ALIGNED(pa, 4)) {
+		dev_err(dev, FW_BUG "%s phys_addr (0x%llX) misaligned.\n",
+			tag, pa);
+		return -EINVAL;
+	}
+
+	if (!IS_ALIGNED(size, 4)) {
+		dev_err(dev, FW_BUG "%s area length (%u) misaligned\n",
+			tag, size);
+		return -EINVAL;
+	}
+
+	if (check_add_overflow(pa, size, &end_phys)) {
+		dev_err(dev, FW_BUG "%s area (0x%llX/%u) wrap-around.\n",
+			tag, pa, size);
+		return -EOVERFLOW;
+	}
+
+	*phys_addr = pa;
+	*len = size;
+
+	return 0;
+}
+
+static int scmi_telemetry_de_descriptor_parse(struct telemetry_info *ti,
+					      struct telemetry_de *tde,
+					      void **next, size_t *rx_len)
+{
+	const struct scmi_de_desc *desc = *next;
+	size_t payld_sz = sizeof(*desc);
+
+	lockdep_assert_held(&tde->mtx);
+
+	if (*rx_len < payld_sz)
+		return -ENOSPC;
+
+	tde->de.info->id = le32_to_cpu(desc->de_id);
+	tde->de.info->grp_id = le32_to_cpu(desc->group_id);
+	tde->de.info->data_sz = le32_to_cpu(desc->de_data_sz);
+	tde->de.info->type = GET_DE_TYPE(desc);
+	tde->de.info->unit = GET_DE_UNIT(desc);
+	tde->de.info->unit_exp = GET_DE_UNIT_EXP(desc);
+	tde->de.info->instance_id = GET_DE_INSTA_ID(desc);
+	tde->de.info->compo_instance_id = GET_COMPO_INSTA_ID(desc);
+	tde->de.info->compo_type = GET_COMPO_TYPE(desc);
+	tde->de.info->persistent = IS_PERSISTENT(desc);
+	tde->ts_type = TSTAMP_SUPPORT(desc);
+	tde->de.tstamp_support = !!tde->ts_type;
+	tde->de.fc_support = IS_FC_SUPPORTED(desc);
+	tde->de.name_support = IS_NAME_SUPPORTED(desc);
+	/* Update DE_DESCRIPTOR size for the next iteration */
+	*next += sizeof(*desc);
+
+	payld_sz += scmi_telemetry_tde_var_size_calc(tde);
+	if (*rx_len < payld_sz)
+		return -ENOSPC;
+
+	if (IS_TDE_TS_LINE(tde)) {
+		__le32 *line_ts_rate = *next;
+
+		tde->de.info->ts_rate = le32_to_cpu((*line_ts_rate));
+
+		/* Variably sized depending on TS support */
+		*next += sizeof(*line_ts_rate);
+	} else if (tde->ts_type == TSTAMP_BLK) {
+		/* Setup default BLK TS value at first */
+		tde->de.info->ts_rate = ti->default_blk_ts_rate;
+	}
+
+	if (tde->de.fc_support) {
+		struct de_desc_fastchannel *dfc;
+		phys_addr_t phys_addr;
+		void __iomem *addr;
+		size_t size;
+		int ret;
+
+		dfc = *next;
+
+		ret = scmi_telemetry_area_check(ti->ph->dev, "FC",
+						le32_to_cpu(dfc->addr_low),
+						le32_to_cpu(dfc->addr_high),
+						le32_to_cpu(dfc->size),
+						&phys_addr, &size);
+		if (ret)
+			return ret;
+
+		/* Does it fit ? */
+		if (size < TDE_FC_SIZE(tde)) {
+			dev_err(ti->ph->dev,
+				FW_BUG "TDE FC size too small (%zu)\n", size);
+			return -EPROTO;
+		}
+
+		addr = ioremap(phys_addr, size);
+		if (!addr)
+			return -EADDRNOTAVAIL;
+
+		tde->base = addr;
+		tde->offset = 0;
+		tde->fc_size = size;
+
+		/* Variably sized depending on FC support */
+		*next += sizeof(*dfc);
+	}
+
+	if (tde->de.name_support) {
+		const char *de_name = *next;
+
+		strscpy(tde->de.info->name, de_name, SCMI_SHORT_NAME_MAX_SIZE);
+		/* Variably sized depending on name support */
+		*next += SCMI_SHORT_NAME_MAX_SIZE;
+	}
+
+	*rx_len -= payld_sz;
+
+	return 0;
+}
+
+static int iter_de_descr_process_response(const struct scmi_protocol_handle *ph,
+					  const void *response,
+					  struct scmi_iterator_state *st,
+					  void *priv)
+{
+	struct scmi_tlm_de_priv *p = priv;
+	struct telemetry_info *ti = p->ti;
+	const struct scmi_de_desc *desc = p->next;
+	struct telemetry_de *tde;
+	bool discovered = false;
+	unsigned int de_id;
+	int ret;
+
+	/* Is at least reading de_id safe */
+	if (p->rx_len < sizeof(desc->de_id))
+		return -ENOSPC;
+
+	de_id = le32_to_cpu(desc->de_id);
+	/*
+	 * Check if this DE was already been discovered by other means,
+	 * such as during boot if Telemetry was detected as already enabled
+	 * and the list of enabled DEs was enumerated separately.
+	 */
+	tde = scmi_telemetry_tde_lookup(ti, de_id);
+	if (!tde) {
+		/* Create a new one */
+		tde = scmi_telemetry_tde_get(ti, de_id);
+		if (IS_ERR(tde))
+			return PTR_ERR(tde);
+
+		discovered = true;
+	}
+
+	guard(mutex)(&tde->mtx);
+	if (tde->enumerated) {
+		/* Cannot be a duplicate of a DE already created by enumeration */
+		dev_err(ph->dev,
+			"Discovered INVALID DE with DUPLICATED ID:0x%08X\n",
+			de_id);
+		return -EINVAL;
+	}
+
+	ret = scmi_telemetry_de_descriptor_parse(ti, tde, &p->next, &p->rx_len);
+	if (ret) {
+		dev_err(ph->dev, "Malformed DE Descriptor - ret:%d\n", ret);
+		/* DE not enumerated at this point were created in this call */
+		if (discovered)
+			scmi_telemetry_free_tde_put(ti, tde);
+		return ret;
+	}
+
+	/* Now fully enumerated */
+	tde->enumerated = true;
+
+	/* Register if it was not already ... */
+	if (discovered) {
+		ret = scmi_telemetry_tde_register(ti, tde);
+		if (ret) {
+			/* DE not enumerated at this point were created in this call */
+			scmi_telemetry_free_tde_put(ti, tde);
+			return ret;
+		}
+	}
+
+	/* Count timestamped DEs */
+	ti->num_des_tstamp += !!tde->de.tstamp_support;
+
+	/* Add to FastChannels list */
+	if (tde->de.fc_support)
+		list_add(&tde->item, &ti->fcs_des);
+
+	return 0;
+}
+
+static int scmi_telemetry_de_descriptors_get(struct telemetry_info *ti)
+{
+	const struct scmi_protocol_handle *ph = ti->ph;
+
+	struct scmi_iterator_ops ops = {
+		.prepare_message = iter_tlm_prepare_message,
+		.update_state = iter_de_descr_update_state,
+		.process_response = iter_de_descr_process_response,
+	};
+	struct scmi_tlm_de_priv tpriv = {
+		.ti = ti,
+		.next = NULL,
+	};
+	void *iter;
+	int ret;
+
+	if (!ti->info.base.num_des)
+		return 0;
+
+	iter = ph->hops->iter_response_init(ph, &ops, ti->info.base.num_des,
+					    TELEMETRY_DE_DESCRIPTION,
+					    sizeof(u32), &tpriv);
+	if (IS_ERR(iter))
+		return PTR_ERR(iter);
+
+	ret = ph->hops->iter_response_run(iter);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static const struct scmi_telemetry_info *
 scmi_telemetry_info_get(const struct scmi_protocol_handle *ph)
 {
@@ -108,10 +589,247 @@ scmi_telemetry_info_get(const struct scmi_protocol_handle *ph)
 	return &ti->info;
 }
 
+static const struct scmi_telemetry_res_info *
+scmi_telemetry_resources_get(const struct scmi_protocol_handle *ph)
+{
+	struct scmi_telemetry_res_info *(*res_get)(struct telemetry_info *ti);
+	struct telemetry_info *ti = ph->get_priv(ph);
+
+	/* Ensure the latest installed res_get helper is visible */
+	res_get = smp_load_acquire(&ti->res_get);
+
+	return res_get(ti);
+}
+
+static const struct scmi_telemetry_de *
+scmi_telemetry_de_lookup(const struct scmi_protocol_handle *ph, u32 id)
+{
+	struct telemetry_info *ti = ph->get_priv(ph);
+
+	/* Trigger a full proper enumeration */
+	scmi_telemetry_resources_get(ph);
+
+	return xa_load(&ti->xa_des, id);
+}
+
 static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
 	.info_get = scmi_telemetry_info_get,
+	.de_lookup = scmi_telemetry_de_lookup,
+	.res_get = scmi_telemetry_resources_get,
 };
 
+/**
+ * scmi_telemetry_resources_alloc  - Resources allocation
+ * @ti: A reference to the telemetry info descriptor for this instance
+ *
+ * This allocates and initializes dedicated resources for the maximum possible
+ * number of needed telemetry resources, based on information gathered from
+ * the initial enumeration: these allocations represent an upper bound on
+ * the number of discoverable telemetry resources and they will be later
+ * populated during late deferred further discovery phases.
+ *
+ * Note that some of the allocations down below are designed to keep some
+ * class of data packed together since it eases retrieval from the ABI layer.
+ *
+ * Return: 0 on Success, errno otherwise
+ */
+static int scmi_telemetry_resources_alloc(struct telemetry_info *ti)
+{
+	/* Array to hold pointers to discovered DEs */
+	struct scmi_telemetry_de **des __free(kfree) =
+		kzalloc_objs(*des, ti->info.base.num_des);
+	if (!des)
+		return -ENOMEM;
+
+	/* The allocated DE descriptors */
+	struct telemetry_de *tdes __free(kfree) =
+		kzalloc_objs(*tdes, ti->info.base.num_des);
+	if (!tdes)
+		return -ENOMEM;
+
+	/* Allocate a set of contiguous DE info descriptors. */
+	struct scmi_telemetry_de_info *dei_store __free(kfree) =
+		kzalloc_objs(*dei_store, ti->info.base.num_des);
+	if (!dei_store)
+		return -ENOMEM;
+
+	struct scmi_telemetry_res_info *rinfo __free(kfree) =
+		kzalloc_obj(*rinfo);
+	if (!rinfo)
+		return -ENOMEM;
+
+	mutex_init(&ti->free_mtx);
+	INIT_LIST_HEAD(&ti->free_des);
+	for (int i = 0; i < ti->info.base.num_des; i++) {
+		mutex_init(&tdes[i].mtx);
+		/* Bind contiguous DE info structures */
+		tdes[i].de.info = &dei_store[i];
+		scmi_telemetry_free_tdes_add(ti, &tdes[i]);
+	}
+
+	INIT_LIST_HEAD(&ti->fcs_des);
+
+	ti->tdes = no_free_ptr(tdes);
+
+	rinfo->des = no_free_ptr(des);
+	rinfo->dei_store = no_free_ptr(dei_store);
+
+	/* Ensure all of the above assignments are visible */
+	smp_store_release(&ti->rinfo, no_free_ptr(rinfo));
+
+	return 0;
+}
+
+static struct scmi_telemetry_res_info *
+__scmi_telemetry_resources_get(struct telemetry_info *ti)
+{
+	/* Ensure rinfo descriptor is visible */
+	return smp_load_acquire(&ti->rinfo);
+}
+
+static void scmi_telemetry_resources_free(struct telemetry_info *ti)
+{
+	struct scmi_telemetry_res_info *rinfo;
+
+	/* Get rinfo without triggering a recursive enumeration, cannot be NULL */
+	rinfo = __scmi_telemetry_resources_get(ti);
+	/* Ensure rinfo is no more accessible upfront */
+	smp_store_release(&ti->rinfo, NULL);
+
+	kfree(ti->tdes);
+
+	kfree(rinfo->des);
+	kfree(rinfo->dei_store);
+
+	kfree(rinfo);
+
+	dev_dbg(ti->ph->dev, "SCMI Telemetry resources freed for instance\n");
+}
+
+static void scmi_telemetry_tdes_cleanup(struct telemetry_info *ti)
+{
+	struct scmi_telemetry_de *de;
+	unsigned long idx;
+
+	xa_for_each(&ti->xa_des, idx, de) {
+		struct telemetry_de *tde = to_tde(de);
+
+		guard(mutex)(&tde->mtx);
+
+		scmi_telemetry_free_tde_put(ti, tde);
+	}
+
+	xa_destroy(&ti->xa_des);
+}
+
+static void scmi_telemetry_instance_cleanup(void *arg)
+{
+	struct telemetry_info *ti = arg;
+
+	scmi_telemetry_tdes_cleanup(ti);
+	scmi_telemetry_resources_free(ti);
+}
+
+/**
+ * scmi_telemetry_resources_enumerate  - Enumeration helper
+ * @ti: A reference to the telemetry info descriptor for this instance
+ *
+ * This helper is configured to be called once on the first enumeration
+ * attempt, when triggered by invoking ti->res_get() from somewhere else.
+ *
+ * Once run it substitues itself in ti->res_get() with the simple accessor
+ * __scmi_telemetry_resources_get, which returns a descriptor to the resources
+ * that were possibly discovered.
+ *
+ * Note that, while it attempts to fully enumerate Data Events and Groups, it
+ * does NOT fail when such enumerations fail, instead it simply gives up with
+ * the end result that only a partially populated, but consistent, resources
+ * descriptor will be returned; in such a case the incomplete descriptor will
+ * be marked as NOT fully_enumerated: this design enables the kernel to deal
+ * with badly implemented out-of-spec firmware support while keep on providing
+ * a minimal sane, albeit possibly incomplete, set of telemetry respources.
+ *
+ * Return: A reference to a fully or partially populated resources descriptor
+ */
+static struct scmi_telemetry_res_info *
+scmi_telemetry_resources_enumerate(struct telemetry_info *ti)
+{
+	struct scmi_telemetry_res_info *rinfo;
+	struct device *dev = ti->ph->dev;
+	int ret;
+
+	/*
+	 * Ensure the following initialization can be called only once
+	 * from one thread of execution.
+	 */
+	if (atomic_cmpxchg(&ti->rinfo_initializing, 0, 1)) {
+		/*
+		 * When initialization is already ongoing in another thread,
+		 * just wait for its completion and return the fully or partially
+		 * populated rinfo.
+		 */
+		if (!completion_done(&ti->rinfo_initdone))
+			wait_for_completion(&ti->rinfo_initdone);
+
+		/* Ensure rinfo descriptor is visible */
+		return smp_load_acquire(&ti->rinfo);
+	}
+
+	/* Note that this code below can be run only once by one thread */
+	ret = scmi_telemetry_de_descriptors_get(ti);
+	if (ret) {
+		dev_err(dev, FW_BUG "Cannot fully enumerate DEs resources. Degraded system.\n");
+		goto done;
+	}
+
+	/* Get rinfo without triggering a recursive enumeration */
+	rinfo = __scmi_telemetry_resources_get(ti);
+	rinfo->fully_enumerated = rinfo->num_des == ti->info.base.num_des;
+done:
+	/* Disable initialization permanently */
+	smp_store_release(&ti->res_get, __scmi_telemetry_resources_get);
+
+	/* Unblock concurrent threads that have been stalled */
+	complete_all(&ti->rinfo_initdone);
+
+	/* Ensure local rinfo is visible before returning it */
+	smp_mb();
+	return ti->rinfo;
+}
+
+/**
+ * scmi_telemetry_instance_init  - Instance initializer
+ * @ti: A reference to the telemetry info descriptor for this instance
+ *
+ * Note that this allocates and initialize all the resources possibly needed
+ * and then setups the @scmi_telemetry_resources_enumerate helper as the
+ * default method for the first call to ti->res_get(): this mechanism enables
+ * the possibility of optionally implementing deferred enumeration policies
+ * which optionally delay the discovery phase and related SCMI message exchanges
+ * to a later point in time.
+ *
+ * Return: 0 on Success, errno otherwise
+ */
+static int scmi_telemetry_instance_init(struct telemetry_info *ti)
+{
+	int ret;
+
+	ret = scmi_telemetry_resources_alloc(ti);
+	if (ret)
+		return ret;
+
+	xa_init(&ti->xa_des);
+
+	/* Setup resources lazy initialization */
+	atomic_set(&ti->rinfo_initializing, 0);
+	init_completion(&ti->rinfo_initdone);
+	/* Ensure the new res_get() operation is visible after this point */
+	smp_store_mb(ti->res_get, scmi_telemetry_resources_enumerate);
+
+	return devm_add_action_or_reset(ti->ph->dev,
+					scmi_telemetry_instance_cleanup, ti);
+}
+
 static int scmi_telemetry_protocol_init(const struct scmi_protocol_handle *ph)
 {
 	struct device *dev = ph->dev;
@@ -133,6 +851,12 @@ static int scmi_telemetry_protocol_init(const struct scmi_protocol_handle *ph)
 		return ret;
 	}
 
+	ret = scmi_telemetry_instance_init(ti);
+	if (ret) {
+		dev_err(dev, "Cannot initialize instance. Abort.\n");
+		return ret;
+	}
+
 	ti->info.base.version = ph->version;
 
 	return ph->set_priv(ph, ti);
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index f076ce5601cf..cc5bd87705ed 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -830,6 +830,37 @@ struct scmi_pinctrl_proto_ops {
 	int (*pin_free)(const struct scmi_protocol_handle *ph, u32 pin);
 };
 
+struct scmi_telemetry_de_info {
+	unsigned int id;
+	unsigned int grp_id;
+	unsigned int data_sz;
+	unsigned int type;
+	unsigned int unit;
+	int unit_exp;
+	unsigned int ts_rate;
+	unsigned int instance_id;
+	unsigned int compo_instance_id;
+	unsigned int compo_type;
+	bool persistent;
+	char name[16];
+};
+
+struct scmi_telemetry_de {
+	bool tstamp_support;
+	bool fc_support;
+	bool name_support;
+	bool enabled;
+	bool tstamp_enabled;
+	struct scmi_telemetry_de_info *info;
+};
+
+struct scmi_telemetry_res_info {
+	bool fully_enumerated;
+	unsigned int num_des;
+	struct scmi_telemetry_de **des;
+	struct scmi_telemetry_de_info *dei_store;
+};
+
 struct scmi_telemetry_base_info {
 	unsigned int version;
 	uuid_t primary_revision;
@@ -853,10 +884,16 @@ struct scmi_telemetry_info {
  *	by SCMI Telemetry Protocol
  *
  * @info_get: get the general Telemetry information.
+ * @de_lookup: get a specific DE descriptor from the DE id.
+ * @res_get: get a reference to the Telemetry resources descriptor.
  */
 struct scmi_telemetry_proto_ops {
 	const struct scmi_telemetry_info *(*info_get)
 		(const struct scmi_protocol_handle *ph);
+	const struct scmi_telemetry_de __must_check *(*de_lookup)
+		(const struct scmi_protocol_handle *ph, u32 id);
+	const struct scmi_telemetry_res_info *(*res_get)
+		(const struct scmi_protocol_handle *ph);
 };
 
 /**
-- 
2.54.0

