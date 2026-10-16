Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6AB84C33C0;
	Fri, 16 Oct 2026 18:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792177032; cv=none; b=O7SdXzz07IeoeqTG8hMMltMMGmFjYe7oCfH/7/o1/OrpvS/wQj9nT2IAyzW012JK67BeVs+bEGfKv658CfGpugElAeLo2POZ4QY/qAJCEnwzr/sTkO1/ZKacMo+TGddx9ngRVbBIAeoT+m7EgvZqEZEQHWvDbcVkWto1d9ltzvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792177032; c=relaxed/simple;
	bh=Pg0Kkrt38JbQ+jnbQMME/VJfwfO9clPsJospolzHTc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rvYDev62X2RRm9kDz9Pa7gQn6mnusDpb5lAOfbTiolIrAvwXplAHkU1EA9uQ5MDWyukDFaGKeJnBuOZ1Ge1pzu2pK2bI4C9r9emDhrVPWlZ9/N78uU+2gI4nwXztGDFeNMePmZ1sbfx6LjQ2od5mOpulGSMcPOo4TCA12cKU9m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=SXOOhKVY; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="SXOOhKVY"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9D4214BF;
	Fri, 16 Oct 2026 11:57:06 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B4B883F7B4;
	Fri, 16 Oct 2026 11:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792177030; bh=Pg0Kkrt38JbQ+jnbQMME/VJfwfO9clPsJospolzHTc4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SXOOhKVYlh5Bs1xeCIlPg3JbpFx52nAC3/RV+E1AQYwDPg75Lg4b0p05GbjGcRQEG
	 t6fCsKgK5SAbiaupE4s5+gbU4ol3izafihnZ2ekbtpqFk/N8490FrKmZKq8ZBhANXF
	 C3cGXgKavIuAknPX0GW++ALNWBHy8NUGqbDzACVU=
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
Subject: [PATCH v14 09/32] firmware: arm_scmi: Add Telemetry groups initialization
Date: Fri, 16 Oct 2026 19:55:30 +0100
Message-ID: <20261016185553.2794459-10-cristian.marussi@arm.com>
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

Allocate and initialize Telemetry Groups from base DataEvent data.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v13 --> v14
- splitted out of the old Basic Telemetry patch, contains the
  groups initialization code.
---
 drivers/firmware/arm_scmi/telemetry.c | 149 +++++++++++++++++++++++++-
 include/linux/scmi_protocol.h         |  20 ++++
 2 files changed, 167 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 87ff75805935..9e3dc2c2cc4b 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -123,6 +123,7 @@ struct telemetry_info {
 	unsigned int default_blk_ts_rate;
 	const struct scmi_protocol_handle *ph;
 	struct telemetry_de *tdes;
+	struct scmi_telemetry_group *grps;
 	struct xarray xa_des;
 	/* Mutex to protect access to @free_des */
 	struct mutex free_mtx;
@@ -321,6 +322,7 @@ static int scmi_telemetry_de_descriptor_parse(struct telemetry_info *ti,
 {
 	const struct scmi_de_desc *desc = *next;
 	size_t payld_sz = sizeof(*desc);
+	unsigned int grp_id;
 
 	lockdep_assert_held(&tde->mtx);
 
@@ -328,7 +330,22 @@ static int scmi_telemetry_de_descriptor_parse(struct telemetry_info *ti,
 		return -ENOSPC;
 
 	tde->de.info->id = le32_to_cpu(desc->de_id);
-	tde->de.info->grp_id = le32_to_cpu(desc->group_id);
+	grp_id = le32_to_cpu(desc->group_id);
+	if (grp_id != SCMI_TLM_GRP_INVALID) {
+		struct scmi_telemetry_res_info *rinfo;
+
+		/* Get rinfo without triggering a recursive enumeration */
+		rinfo = __scmi_telemetry_resources_get(ti);
+
+		/* Group descriptors are empty but allocated at this point */
+		if (grp_id >= ti->info.base.num_groups)
+			return -EINVAL;
+
+		/* Link to parent group */
+		tde->de.grp = &rinfo->grps[grp_id];
+	}
+
+	tde->de.info->grp_id = grp_id;
 	tde->de.info->data_sz = le32_to_cpu(desc->de_data_sz);
 	tde->de.info->type = GET_DE_TYPE(desc);
 	tde->de.info->unit = GET_DE_UNIT(desc);
@@ -459,6 +476,96 @@ static int iter_de_descr_process_response(const struct scmi_protocol_handle *ph,
 	if (tde->de.fc_support)
 		list_add(&tde->item, &ti->fcs_des);
 
+	/* Account for this DE in group num_de counter */
+	if (tde->de.grp)
+		tde->de.grp->info->num_des++;
+
+	return 0;
+}
+
+static int
+scmi_telemetry_de_groups_init(struct device *dev, struct telemetry_info *ti)
+{
+	struct scmi_telemetry_res_info *rinfo;
+	unsigned int num_groups = 0;
+
+	/* Get rinfo without triggering a recursive enumeration */
+	rinfo = __scmi_telemetry_resources_get(ti);
+
+	/* Allocate all groups DEs IDs arrays at first ... */
+	for (int i = 0; i < ti->info.base.num_groups; i++, num_groups++) {
+		struct scmi_telemetry_group *grp = &rinfo->grps[i];
+		size_t des_str_sz;
+
+		unsigned int *des __free(kfree) =
+			kzalloc_objs(unsigned int, grp->info->num_des);
+		if (!des)
+			break;
+
+		/*
+		 * Max size 32bit ID string in Hex: 0xCAFECAFE
+		 *  - 10 digits + ' '/'\n' = 11 bytes per  number
+		 *  - terminating NUL character
+		 */
+		des_str_sz = grp->info->num_des * 11 + 1;
+		char *des_str __free(kfree) = kzalloc_objs(*des_str, des_str_sz);
+		if (!des_str)
+			break;
+
+		grp->des = no_free_ptr(des);
+		grp->des_str = no_free_ptr(des_str);
+		/* Reset group DE counter */
+		grp->info->num_des = 0;
+	}
+
+	/* Unroll on failure... */
+	if (num_groups < ti->info.base.num_groups) {
+		for (int i = num_groups - 1; i >= 0; i--) {
+			kfree(rinfo->grps[i].des);
+			rinfo->grps[i].des = NULL;
+			kfree(rinfo->grps[i].des_str);
+			rinfo->grps[i].des_str = NULL;
+		}
+
+		return -ENOMEM;
+	}
+
+	/* Scan DEs and populate DE IDs arrays for all groups */
+	for (int i = 0; i < rinfo->num_des; i++) {
+		struct scmi_telemetry_group *grp;
+
+		grp = rinfo->des[i]->grp;
+		if (!grp)
+			continue;
+
+		/*
+		 * Note that, at this point, num_des is guaranteed to be
+		 * sane (in-bounds) by construction.
+		 */
+		grp->des[grp->info->num_des++] = i;
+	}
+
+	/* Build composing DES string */
+	for (int i = 0; i < ti->info.base.num_groups; i++) {
+		struct scmi_telemetry_group *grp = &rinfo->grps[i];
+		size_t bufsize = grp->info->num_des * 11 + 1;
+		char *buf = grp->des_str;
+
+		for (int j = 0; j < grp->info->num_des; j++) {
+			char term = j != (grp->info->num_des - 1) ? ' ' : '\0';
+			int len;
+
+			len = scnprintf(buf, bufsize, "0x%08X%c",
+					rinfo->des[grp->des[j]]->info->id, term);
+
+			buf += len;
+			bufsize -= len;
+		}
+	}
+
+	/* Expose all groups once all fully initialized */
+	rinfo->num_groups = num_groups;
+
 	return 0;
 }
 
@@ -491,7 +598,7 @@ static int scmi_telemetry_de_descriptors_get(struct telemetry_info *ti)
 	if (ret)
 		return ret;
 
-	return 0;
+	return scmi_telemetry_de_groups_init(ph->dev, ti);
 }
 
 static const struct scmi_telemetry_info *
@@ -561,6 +668,18 @@ static int scmi_telemetry_resources_alloc(struct telemetry_info *ti)
 	if (!dei_store)
 		return -ENOMEM;
 
+	/* Array to hold descriptors of discovered GROUPs */
+	struct scmi_telemetry_group *grps __free(kfree) =
+		kzalloc_objs(*grps, ti->info.base.num_groups);
+	if (!grps)
+		return -ENOMEM;
+
+	/* Allocate a set of contiguous Group info descriptors. */
+	struct scmi_telemetry_grp_info *grps_store __free(kfree) =
+		kzalloc_objs(*grps_store, ti->info.base.num_groups);
+	if (!grps_store)
+		return -ENOMEM;
+
 	struct scmi_telemetry_res_info *rinfo __free(kfree) =
 		kzalloc_obj(*rinfo);
 	if (!rinfo)
@@ -577,12 +696,20 @@ static int scmi_telemetry_resources_alloc(struct telemetry_info *ti)
 		scmi_telemetry_free_tde_put(ti, &tdes[i]);
 	}
 
+	for (int i = 0; i < ti->info.base.num_groups; i++) {
+		grps_store[i].grp_id = i;
+		/* Bind contiguous Group info struct */
+		grps[i].info = &grps_store[i];
+	}
+
 	INIT_LIST_HEAD(&ti->fcs_des);
 
 	ti->tdes = no_free_ptr(tdes);
 
 	rinfo->des = no_free_ptr(des);
 	rinfo->dei_store = no_free_ptr(dei_store);
+	rinfo->grps = no_free_ptr(grps);
+	rinfo->grps_store = no_free_ptr(grps_store);
 
 	/* Ensure all of the above assignments are visible */
 	smp_store_release(&ti->rinfo, no_free_ptr(rinfo));
@@ -611,6 +738,9 @@ static void scmi_telemetry_resources_free(struct telemetry_info *ti)
 	kfree(rinfo->des);
 	kfree(rinfo->dei_store);
 
+	kfree(rinfo->grps);
+	kfree(rinfo->grps_store);
+
 	kfree(rinfo);
 
 	dev_dbg(ti->ph->dev, "SCMI Telemetry resources freed for instance\n");
@@ -632,10 +762,25 @@ static void scmi_telemetry_tdes_cleanup(struct telemetry_info *ti)
 	xa_destroy(&ti->xa_des);
 }
 
+static void scmi_telemetry_groups_free(struct scmi_telemetry_res_info *rinfo)
+{
+	/* Cannot be NULL here by construction, make sure it remains like that */
+	if (WARN_ON(!rinfo))
+		return;
+
+	for (int i = 0; i < rinfo->num_groups; i++) {
+		struct scmi_telemetry_group *grp = &rinfo->grps[i];
+
+		kfree(grp->des);
+		kfree(grp->des_str);
+	}
+}
+
 static void scmi_telemetry_instance_cleanup(void *arg)
 {
 	struct telemetry_info *ti = arg;
 
+	scmi_telemetry_groups_free(ti->rinfo);
 	scmi_telemetry_tdes_cleanup(ti);
 	scmi_telemetry_resources_free(ti);
 }
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 018427daf55f..51d4cbfc0969 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -826,6 +826,22 @@ struct scmi_pinctrl_proto_ops {
 	int (*pin_free)(const struct scmi_protocol_handle *ph, u32 pin);
 };
 
+#define SCMI_TLM_GRP_INVALID		0xFFFFFFFF
+
+struct scmi_telemetry_grp_info {
+	unsigned int grp_id;
+	unsigned int num_des;
+	unsigned int num_intervals;
+};
+
+struct scmi_telemetry_group {
+	bool enabled;
+	bool tstamp_enabled;
+	unsigned int *des;
+	char *des_str;
+	struct scmi_telemetry_grp_info *info;
+};
+
 struct scmi_telemetry_de_info {
 	unsigned int id;
 	unsigned int grp_id;
@@ -846,6 +862,7 @@ struct scmi_telemetry_de {
 	bool fc_support;
 	bool name_support;
 	struct scmi_telemetry_de_info *info;
+	struct scmi_telemetry_group *grp;
 	bool enabled;
 	bool tstamp_enabled;
 };
@@ -855,6 +872,9 @@ struct scmi_telemetry_res_info {
 	unsigned int num_des;
 	struct scmi_telemetry_de **des;
 	struct scmi_telemetry_de_info *dei_store;
+	unsigned int num_groups;
+	struct scmi_telemetry_group *grps __counted_by_ptr(num_groups);
+	struct scmi_telemetry_grp_info *grps_store;
 };
 
 struct scmi_telemetry_base_info {
-- 
2.54.0

