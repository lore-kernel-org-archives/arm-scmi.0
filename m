Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038665AEC66;
	Fri, 16 Oct 2026 18:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792177051; cv=none; b=ZNdDuoTM9LRt75Y2BPHZSWTjx4oRPULxTkVJCfwfabtWTMj47fRYzE3noF9+V/guVwWiMwgDfKK3sNtq3CLCi5brBDJcVh2pZqEDWD6cpsz3H+X2Ei2XTojODnFrfdORaIfnI9abkQn/wMaZuBz67yhTYTZ4EyZaPGQVWZ91DK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792177051; c=relaxed/simple;
	bh=EUHo6AKg/dHfR8YdnW53yXaZU6/LYPKKiiGrSKMMrcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IN64pTlDPe968Gk5SCINxGZ20NGRQ1oCCoDQPihElqepJHp61qVOxgpfLwlHzFl4R+BDNq6+vjOM7DiXCHdtnA3khHrou4TCO7zqMrqcS4yI2on6TxUEM7w+hJTfk4/0lpFoT17KinvblNQ1ug+B3xH2poZxFEVwOxwkLm6oAEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Y0CKSk5M; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Y0CKSk5M"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 28B1314BF;
	Fri, 16 Oct 2026 11:57:25 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A57B3F7B4;
	Fri, 16 Oct 2026 11:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792177048; bh=EUHo6AKg/dHfR8YdnW53yXaZU6/LYPKKiiGrSKMMrcY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y0CKSk5MyeHB+rPcEQX1OaYP/alYY+jeXIU9wYZR50ESSVfCU8saLdONNHgED/WVA
	 yaqdGMB8bJ/Xe2gwLA4uKtRmAchEpMmL5PNAiuOE8MDcX6r0uA4D2j4diAPfwgmmEI
	 zQzgUW/deSmdtO0ibP/xsGQSKGDk96wAy4iC7aNg=
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
Subject: [PATCH v14 14/32] firmware: arm_scmi: Add Telemetry TDCF parsing for UUID lines
Date: Fri, 16 Oct 2026 19:55:35 +0100
Message-ID: <20261016185553.2794459-15-cristian.marussi@arm.com>
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

Add support to parse, track and link TDCF UUID lines to the related
discovered DataEvents.

Maintain also a central list of discovered UUID lines.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v13 --> v14
 - split out of previous single patch implementing parse SHMTI routines
---
 drivers/firmware/arm_scmi/telemetry.c | 291 +++++++++++++++++++++++++-
 include/linux/scmi_protocol.h         |   2 +
 2 files changed, 292 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 69bed616fa04..68e272b1106f 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -18,6 +18,7 @@
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/rcupdate.h>
 #include <linux/refcount.h>
 #include <linux/slab.h>
 #include <linux/sprintf.h>
@@ -170,6 +171,10 @@ struct tsline {
 	__le32 ts_high;
 };
 
+struct uuid_line {
+	__be32 dwords[SCMI_TLM_DE_IMPL_NUM_DWORDS];
+};
+
 #define LINE_DATA_GET(f)				\
 ({							\
 	typeof(f) _f = (f);				\
@@ -241,6 +246,7 @@ struct payload {
 		struct line l;
 		struct tsline tsl;
 		struct blk_tsline blk_tsl;
+		struct uuid_line uuid_l;
 	};
 };
 
@@ -388,6 +394,10 @@ struct telemetry_info {
 	bool streaming_mode;
 	unsigned int num_shmti;
 	unsigned int num_des_tstamp;
+#define SCMI_UUID_DB_THRESH	3
+	/* Protect uuids_len */
+	struct mutex uuids_mtx;
+	unsigned int uuids_len;
 	/* Mutex to protect des_enabled_mtx */
 	struct mutex des_enabled_mtx;
 	atomic_t des_enabled[ENA_MAX];
@@ -400,6 +410,7 @@ struct telemetry_info {
 	/* Mutex to protect @xa_lines */
 	struct mutex lines_mtx;
 	struct xarray xa_lines;
+	struct telemetry_uuid *primary_uuid;
 	/* Mutex to protect access to @free_des */
 	struct mutex free_mtx;
 	struct list_head free_des;
@@ -419,6 +430,9 @@ __scmi_telemetry_resources_get(struct telemetry_info *ti);
 static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
 				     unsigned int shmti_id, enum scan_mode mode);
 
+static inline void scmi_telemetry_uuid_link(struct telemetry_de *tde,
+					    struct telemetry_uuid *uuid);
+
 static inline
 struct mutex *lock_for_payld(struct mutex *locks, struct payload __iomem *payld)
 {
@@ -796,8 +810,10 @@ static int iter_de_descr_process_response(const struct scmi_protocol_handle *ph,
 	}
 
 	/* Add to FastChannels list */
-	if (tde->de.fc_support)
+	if (tde->de.fc_support) {
+		scmi_telemetry_uuid_link(tde, ti->primary_uuid);
 		list_add(&tde->item, &ti->fcs_des);
+	}
 
 	/* Account for this DE in group num_de counter */
 	if (tde->de.grp)
@@ -1304,6 +1320,7 @@ static void scmi_telemetry_blkts_update(struct telemetry_info *ti, u32 magic,
 
 static inline void scmi_telemetry_line_free(struct telemetry_line *line)
 {
+	struct telemetry_uuid *uuid;
 	void *blob;
 
 	switch (line->type) {
@@ -1311,6 +1328,18 @@ static inline void scmi_telemetry_line_free(struct telemetry_line *line)
 		blob = to_blkts(line);
 		kfree(blob);
 		break;
+	case TDCF_UUID_LINE:
+		uuid = to_uuid_from_line(line);
+		/*
+		 * By construction a UUID line, once published in the UUIDs
+		 * global array, will ONLY be freed on cleanup while being
+		 * un-published while coping with the needed RCU machinery.
+		 * Warn if this invariant is NOT respected.
+		 */
+		if (WARN_ON((smp_load_acquire(&uuid->published))))
+			return;
+		kfree(uuid);
+		break;
 	default:
 		dev_warn(line->ti->ph->dev,
 			 "Unknown LINE type %u\n", line->type);
@@ -1357,6 +1386,19 @@ static void scmi_telemetry_blkts_unlink(struct telemetry_de *tde)
 	trace_scmi_tlm_access(tde->de.info->id, "BLKTS_UNLINK", 0, 0);
 }
 
+static void scmi_telemetry_uuid_unlink(struct telemetry_de *tde)
+{
+	/* Acquiring order is: tde -> line */
+	lockdep_assert_held(&tde->mtx);
+	if (!tde->uuid)
+		return;
+
+	scmi_telemetry_line_put(&tde->uuid->line);
+	tde->uuid = NULL;
+
+	trace_scmi_tlm_access(tde->de.info->id, "UUID_UNLINK", 0, 0);
+}
+
 static void scmi_telemetry_de_unlink(struct scmi_telemetry_de *de)
 {
 	struct telemetry_de *tde = to_tde(de);
@@ -1365,6 +1407,7 @@ static void scmi_telemetry_de_unlink(struct scmi_telemetry_de *de)
 
 	/* Unlink all related lines triggering their deallocation */
 	scmi_telemetry_blkts_unlink(tde);
+	scmi_telemetry_uuid_unlink(tde);
 }
 
 static struct telemetry_line *
@@ -1436,6 +1479,145 @@ scmi_telemetry_blkts_get_or_create(struct telemetry_info *ti,
 	return scmi_telemetry_blkts_create(ti, payld);
 }
 
+static int scmi_telemetry_uuids_update(struct telemetry_info *ti,
+				       struct telemetry_uuid *uuid)
+{
+	uuid_t **cur_uuids;
+
+	guard(mutex)(&ti->uuids_mtx);
+
+	/* Resize array if needed ... */
+	if (ti->info.num_uuids + SCMI_UUID_DB_THRESH >= ti->uuids_len) {
+		uuid_t **new_uuids, **old_uuids;
+		unsigned int new_len = ti->uuids_len * 2;
+
+		new_uuids = kzalloc_objs(*new_uuids, new_len);
+		if (!new_uuids)
+			return -ENOMEM;
+
+		old_uuids = rcu_dereference_protected(ti->info.uuids,
+						      lockdep_is_held(&ti->uuids_mtx));
+		/* Copy/move old allocated UUIDs */
+		for (int i = 0; i < ti->info.num_uuids; i++)
+			new_uuids[i] = old_uuids[i];
+
+		/* Expose new UUID pointer */
+		rcu_assign_pointer(ti->info.uuids, new_uuids);
+		ti->uuids_len = new_len;
+
+		kfree_rcu_mightsleep(old_uuids);
+	}
+
+	/* Bump refcount on this line ... cannot fail by construction */
+	scmi_telemetry_line_get(ti, uuid->line.payld);
+	/* Store new UUID reference into the globally accessible UUIDS */
+	cur_uuids = rcu_dereference_protected(ti->info.uuids,
+					      lockdep_is_held(&ti->uuids_mtx));
+	cur_uuids[ti->info.num_uuids] = &uuid->uuid;
+	rcu_assign_pointer(ti->info.uuids, cur_uuids);
+	uuid->published = true;
+	/* Update UUIDs count */
+	smp_store_release(&ti->info.num_uuids, ti->info.num_uuids + 1);
+
+	return 0;
+}
+
+static struct telemetry_uuid *
+scmi_telemetry_uuid_create(struct telemetry_info *ti,
+			   struct payload __iomem *payld)
+{
+	__be32 dwords[SCMI_TLM_DE_IMPL_NUM_DWORDS];
+	struct uuid_line __iomem *uuid_l;
+	struct telemetry_uuid *uuid;
+
+	uuid = kzalloc_obj(*uuid);
+	if (!uuid)
+		return NULL;
+
+	/* A NULL payload is used for the unique primary UUID */
+	if (!payld)
+		return uuid;
+
+	uuid_l = &payld->uuid_l;
+	/*
+	 * Use proper mem accessors BUT no swapping, maintain UUID
+	 * in memory BE layout.
+	 */
+	for (int i = 0; i < SCMI_TLM_DE_IMPL_NUM_DWORDS; i++)
+		dwords[i] = (__force __be32)__raw_readl(&uuid_l->dwords[i]);
+
+	/*
+	 * Fetch BigEndian in-memory UUID fields as per SCMIv4.0
+	 * specification 3.12.2.2
+	 */
+	import_uuid(&uuid->uuid, (__force const __u8 *)&dwords[0]);
+
+	return uuid;
+}
+
+static struct telemetry_uuid *
+scmi_telemetry_uuid_register(struct telemetry_info *ti,
+			     struct payload __iomem *payld,
+			     struct telemetry_uuid *uuid)
+{
+	if (scmi_telemetry_line_init(ti, &uuid->line, payld, TDCF_UUID_LINE)) {
+		kfree(uuid);
+		return NULL;
+	}
+
+	if (scmi_telemetry_uuids_update(ti, uuid)) {
+		scmi_telemetry_line_put(&uuid->line);
+		return NULL;
+	}
+
+	trace_scmi_tlm_collect(0, (__force u64)payld, 0, "SHMTI_NEW_UUID");
+
+	return uuid;
+}
+
+static struct telemetry_uuid *
+scmi_telemetry_uuid_get_or_create(struct telemetry_info *ti,
+				  struct payload __iomem *payld)
+{
+	struct telemetry_line *line;
+	struct telemetry_uuid *uuid;
+
+	guard(mutex)(lock_for_payld(ti->payld_locks, payld));
+	line = scmi_telemetry_line_get(ti, payld);
+	if (line)
+		return to_uuid_from_line(line);
+
+	uuid = scmi_telemetry_uuid_create(ti, payld);
+	if (!uuid)
+		return uuid;
+
+	return scmi_telemetry_uuid_register(ti, payld, uuid);
+}
+
+static void scmi_telemetry_tdcf_uuid_parse(struct telemetry_info *ti,
+					   struct payload __iomem *payld,
+					   struct telemetry_shmti *shmti,
+					   struct telemetry_uuid **active_uuid)
+{
+	struct telemetry_uuid *uuid, *previous = *active_uuid;
+
+	if (UUID_INVALID(payld)) {
+		trace_scmi_tlm_access(0, "UUID_INVALID", 0, 0);
+		return;
+	}
+
+	/* A UUID descriptor MUST be returned: it is found or it is created */
+	uuid = scmi_telemetry_uuid_get_or_create(ti, payld);
+	if (WARN_ON(!uuid))
+		return;
+
+	/* Drop one refcount on the previous active since we found a new one */
+	if (previous)
+		scmi_telemetry_line_put(&previous->line);
+
+	*active_uuid = uuid;
+}
+
 /**
  * scmi_telemetry_tdcf_blkts_parse  - A BLK_TS line parser
  *
@@ -1567,6 +1749,22 @@ static inline void scmi_telemetry_blkts_link(struct telemetry_de *tde,
 	trace_scmi_tlm_access(tde->de.info->id, "BLKTS_LINK", 0, 0);
 }
 
+static inline void scmi_telemetry_uuid_link(struct telemetry_de *tde,
+					    struct telemetry_uuid *uuid)
+{
+	/* Acquiring order is: tde -> line */
+	lockdep_assert_held(&tde->mtx);
+	if (tde->uuid)
+		return;
+
+	guard(mutex)(&uuid->line.mtx);
+	refcount_inc(&uuid->line.users);
+
+	/* Update UUID association */
+	tde->uuid = uuid;
+	trace_scmi_tlm_access(tde->de.info->id, "UUID_LINK", 0, 0);
+}
+
 /**
  * scmi_telemetry_tdcf_data_parse  - TDCF DataLine parsing
  * @ti: A reference to the telemetry info descriptor
@@ -1670,6 +1868,9 @@ static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
 	if (use_blk_ts && BLK_TS_CHANGED(tde, active_bts->line.payld))
 		scmi_telemetry_blkts_link(tde, active_bts);
 
+	/* Link the active UUID or the primary, it's unlinked on disable */
+	scmi_telemetry_uuid_link(tde, active_uuid ?: ti->primary_uuid);
+
 	/*
 	 * Parse data words ... only for the sake of updating TDE cache,
 	 * any error is logged by ignored.
@@ -1724,6 +1925,9 @@ static int scmi_telemetry_tdcf_line_parse(struct telemetry_info *ti,
 	case TDCF_BLK_TS_LINE:
 		scmi_telemetry_tdcf_blkts_parse(ti, payld, shmti, active_bts);
 		break;
+	case TDCF_UUID_LINE:
+		scmi_telemetry_tdcf_uuid_parse(ti, payld, shmti, active_uuid);
+		break;
 	default:
 		trace_scmi_tlm_access(PAYLD_ID(payld), "TDCF_LINE_UNKNOWN", 0, 0);
 		break;
@@ -1976,6 +2180,35 @@ static void scmi_telemetry_resources_free(struct telemetry_info *ti)
 	dev_dbg(ti->ph->dev, "SCMI Telemetry resources freed for instance\n");
 }
 
+static void scmi_telemetry_uuids_cleanup(struct telemetry_info *ti)
+{
+	uuid_t **cur_uuids;
+
+	/* Drop reference to UUID lines kept in the growable array */
+	scoped_guard(mutex, &ti->uuids_mtx) {
+		int num_uuids;
+
+		/* Ensure looking up an updated counter */
+		num_uuids = smp_load_acquire(&ti->info.num_uuids);
+		/* Ensure zeroing is visible */
+		smp_store_release(&ti->info.num_uuids, 0);
+		/* Inhibit further accesses to cur_uuids */
+		cur_uuids = rcu_replace_pointer(ti->info.uuids, NULL,
+						lockdep_is_held(&ti->uuids_mtx));
+		synchronize_rcu();
+
+		for (int i = 0; i < num_uuids; i++) {
+			struct telemetry_uuid *uuid = to_uuid_from_uuid_t(cur_uuids[i]);
+
+			/* Ensure un-publishing is visible */
+			smp_store_release(&uuid->published, false);
+			scmi_telemetry_line_put(&uuid->line);
+		}
+	}
+
+	kfree_rcu_mightsleep(cur_uuids);
+}
+
 static void scmi_telemetry_tdes_cleanup(struct telemetry_info *ti)
 {
 	struct scmi_telemetry_de *de;
@@ -2020,6 +2253,7 @@ static void scmi_telemetry_instance_cleanup(void *arg)
 
 	scmi_telemetry_groups_free(ti->rinfo);
 	scmi_telemetry_tdes_cleanup(ti);
+	scmi_telemetry_uuids_cleanup(ti);
 	scmi_telemetry_resources_free(ti);
 }
 
@@ -2093,6 +2327,28 @@ scmi_telemetry_resources_enumerate(struct telemetry_info *ti)
 	return ti->rinfo;
 }
 
+static int scmi_telemetry_primary_uuid_init(struct telemetry_info *ti)
+{
+	struct telemetry_uuid *uuid;
+
+	/* Primary UUID is stored on key 0 (NULL) */
+	uuid = scmi_telemetry_uuid_create(ti, NULL);
+	if (!uuid)
+		return -ENOMEM;
+
+	uuid_copy(&uuid->uuid, &ti->info.base.primary_revision);
+	/* Make it available in the uuid list once initialized */
+	if (!scmi_telemetry_uuid_register(ti, NULL, uuid)) {
+		dev_err(ti->ph->dev, "Failed to register Primary UUID\n");
+		return -ENOMEM;
+	}
+
+	/* Ensure Primary UUID association is visible */
+	smp_store_release(&ti->primary_uuid, uuid);
+
+	return 0;
+}
+
 /**
  * scmi_telemetry_instance_init  - Instance initializer
  * @ti: A reference to the telemetry info descriptor for this instance
@@ -2108,6 +2364,8 @@ scmi_telemetry_resources_enumerate(struct telemetry_info *ti)
  */
 static int scmi_telemetry_instance_init(struct telemetry_info *ti)
 {
+	unsigned int uuids_len;
+	uuid_t **cur_uuids;
 	int ret;
 
 	/* Allocate and Initialize on first call... */
@@ -2121,6 +2379,37 @@ static int scmi_telemetry_instance_init(struct telemetry_info *ti)
 	for (int i = 0; i < 1 << PAYLD_HASH_BITS; i++)
 		mutex_init(&ti->payld_locks[i]);
 
+	/*
+	 * Always allocate at least one slot for the primary and anyway at
+	 * least enough to avoid immediate resizing, assuring uuids_len
+	 * always greater or equal to one.
+	 */
+	uuids_len = max(ti->num_shmti * 2, SCMI_UUID_DB_THRESH + 1);
+	cur_uuids = kzalloc_objs(*cur_uuids, uuids_len);
+	if (!cur_uuids) {
+		xa_destroy(&ti->xa_lines);
+		xa_destroy(&ti->xa_des);
+		scmi_telemetry_resources_free(ti);
+		return -ENOMEM;
+	}
+
+	mutex_init(&ti->uuids_mtx);
+	/* Expose new UUID pointer */
+	scoped_guard(mutex, &ti->uuids_mtx) {
+		rcu_assign_pointer(ti->info.uuids, cur_uuids);
+		ti->uuids_len = uuids_len;
+	}
+
+	/* Initialize the first UUIDs in the global list with the primary */
+	ret = scmi_telemetry_primary_uuid_init(ti);
+	if (ret) {
+		scmi_telemetry_uuids_cleanup(ti);
+		xa_destroy(&ti->xa_lines);
+		xa_destroy(&ti->xa_des);
+		scmi_telemetry_resources_free(ti);
+		return ret;
+	}
+
 	atomic_set(&ti->des_enabled[ENA_STATE], 0);
 	atomic_set(&ti->des_enabled[ENA_TSTAMP], 0);
 	mutex_init(&ti->des_enabled_mtx);
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 3c09c14b66fa..763ba26eb9f0 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -973,6 +973,8 @@ struct scmi_telemetry_info {
 	unsigned int active_update_interval;
 	struct scmi_telemetry_intervals *intervals;
 	struct scmi_telemetry_shmti_info **shmtis;
+	unsigned int num_uuids;
+	uuid_t * __rcu *uuids __counted_by_ptr(num_uuids);
 };
 
 /**
-- 
2.54.0

