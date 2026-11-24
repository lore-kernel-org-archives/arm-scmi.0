Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549869;
	b=OHLKe42cmaav5qZe1ZarhMg0otjwl/vTE2Ph5GFrKlp/Xk+dd3j04G4QuJ3gJx/Af8Bj
	 b2uMuYT524YsKGx/0CwLjKpSdgO1WATI4ZiC4Vlr2LTLkE5aFfm37yISlth3fJRDpoAyo
	 86V2Wz0Rl8CglOd6PpvhbFX1pReXZ6PFx2z2qCZwOOWUT30eLBxu9LpEd8Js6lFDAD8r7
	 FxyINsVaEh4KYg22xDJTPVvEDcBKKXGqNKJ28weF2qt1DUP7bMBoYJOKSx/WwgjPN+Fmp
	 PJMsgz5Wx0A3KYW0umNJdADm0MYNG/fPtCu0y4mRVwMK3DEbkz0CnlS5Y7JBAwBonKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549869;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=orTBgcPWSFDONL+DOqOHORQnJCSoIGVHZ3M80sTXWHQ=;
	b=GEpYJPzm7k6DMlmziVPmAmiOcDelZBm+os4/YawJSl33H+Go8uSUGG4TrsD0vSZ+HTS2
	 T+Twe4mthkmVcdlWHeF5auF0GaQxk4pxOlLWUIKHS1Lgcn4FHFTMAmdO6kkPp63Gdfo9B
	 hVDepMRoY4U1yd0t2IHFrFhTF3RB+TbtIqMH1IPlpzOWitZd/p0t+1G9ABw3z3YBtNK0P
	 6XJ+pEP+UgQv1tj7VIu4Q2Q9qrlya80sBBZVlhgbtCQQYiY+RrND60m+lswzSOUtwuWYO
	 +uG2OwHYbeOReAUSjU9Gmo0V3wKl5T0rycYhM+mAMbVq8auCwkgRj5ez4LkjiAS1png==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=RK0MlFpG;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B46B0606A327;
	Tue, 24 Nov 2026 19:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B46B0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=RK0MlFpG
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 642DE339;
	Tue, 24 Nov 2026 11:51:05 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A0E33F763;
	Tue, 24 Nov 2026 11:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795549868; bh=xiStcxP+9MP9dLfzlSwKwRQemonDgee+9pCFRr2f5VY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RK0MlFpGFWrxagl4Ib4W7kVf2wk4wPHe4qUz2xsGGIzuVb/6bdVND/HHvGDKYY4f4
	 Tj7yen2pY0XIVtbvHH1jOXtpqis/t2miY768svrx2moaYFynsZVSN64+gDDSnOQItB
	 G2Gx4/5XN5rRIOmQy3Qzji0ANwlopvGQ+ilfDn8I=
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
Subject: [PATCH v17 17/34] firmware: arm_scmi: Add Telemetry TDCF parsing for UUID lines
Date: Tue, 24 Nov 2026 19:48:23 +0000
Message-ID: <20261124194841.1147072-18-cristian.marussi@arm.com>
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

Add support to parse, track and link TDCF UUID lines to the related
discovered DataEvents.

Maintain also a central list of discovered UUID lines.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v16 --> v17
 - removed unused node+_lst
v15 --> v16
 - WARN_ON invalid UUID line
 - uuid array drop counted_by
v14 --> v15
 - use proper casting in tlm_collect
 - use snapshots to collect UUIDs during full scans
 - stop tracking UUIDs lines singularly..it's useless
 - use UUIDs line hashing for lookup
 - clarified UUID/DE binding are permanent
 - fixed WARN_ON invocation on missing active_uuid
v13 --> v14
 - split out of previous single patch implementing parse SHMTI routines
---
 drivers/firmware/arm_scmi/telemetry.c | 281 +++++++++++++++++++++++++-
 include/linux/scmi_protocol.h         |   2 +
 2 files changed, 280 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 414765f46c77..fe63e7f5d145 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -13,11 +13,14 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/hash.h>
+#include <linux/hashtable.h>
+#include <linux/jhash.h>
 #include <linux/io.h>
 #include <linux/limits.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/rcupdate.h>
 #include <linux/refcount.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
@@ -172,6 +175,10 @@ struct tsline {
 	__le32 ts_high;
 };
 
+struct uuid_line {
+	__be32 dwords[SCMI_TLM_DE_IMPL_NUM_DWORDS];
+};
+
 #define LINE_DATA_GET_RAW(f)				\
 ({							\
 	typeof(f) _f = (f);				\
@@ -270,6 +277,7 @@ struct payload {
 		struct line l;
 		struct tsline tsl;
 		struct blk_tsline blk_tsl;
+		struct uuid_line uuid_l;
 	};
 };
 
@@ -398,9 +406,7 @@ struct telemetry_block_ts {
 #define to_blkts(l)	container_of(l, struct telemetry_block_ts, line)
 
 struct telemetry_uuid {
-	u32 key;
 	struct hlist_node node_ht;
-	struct hlist_node node_lst;
 	uuid_t uuid;
 };
 
@@ -458,6 +464,12 @@ struct telemetry_info {
 	bool streaming_mode;
 	unsigned int num_shmti;
 	unsigned int num_des_tstamp;
+#define SCMI_UUID_DB_THRESH	3
+	/* Protect uuids_len */
+	struct mutex uuids_mtx;
+	unsigned int uuids_len;
+#define SCMI_UUID_HASH_SZ	5
+	DECLARE_HASHTABLE(uuids_ht, SCMI_UUID_HASH_SZ);
 	/* Mutex to protect des_enabled_mtx */
 	struct mutex des_enabled_mtx;
 	atomic_t des_enabled[ENA_MAX];
@@ -466,6 +478,7 @@ struct telemetry_info {
 	struct telemetry_shmti *shmti;
 	struct telemetry_de *tdes;
 	struct xarray xa_des;
+	struct telemetry_uuid *primary_uuid;
 	/* Mutex to protect access to @free_des */
 	struct mutex free_mtx;
 	struct list_head free_des;
@@ -489,6 +502,9 @@ static inline struct tdcf *snap_tdcf(struct shmti_snap *s);
 static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
 				     unsigned int shmti_id, enum scan_mode mode);
 
+static inline void scmi_telemetry_uuid_link(struct telemetry_de *tde,
+					    struct telemetry_uuid *uuid);
+
 static inline
 struct mutex *lock_for_payld(struct mutex *locks, unsigned long offset)
 {
@@ -613,8 +629,10 @@ static int scmi_telemetry_tde_register(struct telemetry_info *ti,
 		goto err;
 
 	/* Add to FastChannels list */
-	if (tde->de.fc_support)
+	if (tde->de.fc_support) {
+		scmi_telemetry_uuid_link(tde, ti->primary_uuid);
 		list_add(&tde->item, &ti->fcs_des);
+	}
 
 	/* ... and in the general array */
 	rinfo->des[rinfo->num_des] = &tde->de;
@@ -1563,6 +1581,17 @@ static void scmi_telemetry_blkts_unlink(struct telemetry_de *tde)
 	trace_scmi_tlm_access(tde->de.info->id, "BLKTS_UNLINK", 0, 0);
 }
 
+static void scmi_telemetry_uuid_unlink(struct telemetry_de *tde)
+{
+	/* Acquiring order is: tde -> line */
+	lockdep_assert_held(&tde->mtx);
+	if (!tde->uuid)
+		return;
+
+	tde->uuid = NULL;
+	trace_scmi_tlm_access(tde->de.info->id, "UUID_UNLINK", 0, 0);
+}
+
 static void scmi_telemetry_de_unlink(struct scmi_telemetry_de *de)
 {
 	struct telemetry_de *tde = to_tde(de);
@@ -1571,6 +1600,7 @@ static void scmi_telemetry_de_unlink(struct scmi_telemetry_de *de)
 
 	/* Unlink all related lines triggering their deallocation */
 	scmi_telemetry_blkts_unlink(tde);
+	scmi_telemetry_uuid_unlink(tde);
 }
 
 static struct telemetry_line *
@@ -1641,6 +1671,154 @@ scmi_telemetry_blkts_get_or_create(struct telemetry_shmti *shmti,
 	return scmi_telemetry_blkts_create(shmti, offset);
 }
 
+static int scmi_telemetry_uuids_update(struct telemetry_info *ti,
+				       struct telemetry_uuid *uuid)
+{
+	uuid_t **cur_uuids;
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
+	/* Store new UUID reference into the globally accessible UUIDS */
+	cur_uuids = rcu_dereference_protected(ti->info.uuids,
+					      lockdep_is_held(&ti->uuids_mtx));
+	cur_uuids[ti->info.num_uuids] = &uuid->uuid;
+	rcu_assign_pointer(ti->info.uuids, cur_uuids);
+	/* Update UUIDs count */
+	smp_store_release(&ti->info.num_uuids, ti->info.num_uuids + 1);
+
+	return 0;
+}
+
+static int scmi_telemetry_uuid_register(struct telemetry_info *ti, u32 key,
+					struct telemetry_uuid *uuid)
+{
+	int ret;
+
+	lockdep_assert_held(&ti->uuids_mtx);
+
+	ret = scmi_telemetry_uuids_update(ti, uuid);
+	if (ret)
+		return ret;
+
+	/* Register by key for easy lookup */
+	hash_add(ti->uuids_ht, &uuid->node_ht, key);
+
+	trace_scmi_tlm_collect(0, key, 0, "SHMTI_NEW_UUID");
+
+	return 0;
+}
+
+static struct telemetry_uuid *
+scmi_telemetry_uuid_create(struct telemetry_info *ti, __be32 *dwords)
+{
+	u32 key;
+	int ret;
+
+	lockdep_assert_held(&ti->uuids_mtx);
+
+	struct telemetry_uuid *uuid __free(kfree) = kzalloc_obj(*uuid);
+	if (!uuid)
+		return NULL;
+
+	/*
+	 * Fetch BigEndian in-memory UUID fields as per SCMIv4.0
+	 * specification 3.12.2.2
+	 */
+	import_uuid(&uuid->uuid, (__force const __u8 *)dwords);
+	key = jhash2((__force const u32 *)dwords, SCMI_TLM_DE_IMPL_NUM_DWORDS, 1);
+	ret = scmi_telemetry_uuid_register(ti, key, uuid);
+	if (ret)
+		return NULL;
+
+	return no_free_ptr(uuid);
+}
+
+static struct telemetry_uuid *
+scmi_telemetry_uuid_lookup(struct telemetry_info *ti, __be32 *dwords)
+{
+	struct telemetry_uuid *uuid;
+	u32 key;
+
+	lockdep_assert_held(&ti->uuids_mtx);
+
+	key = jhash2((__force const u32 *)dwords, SCMI_TLM_DE_IMPL_NUM_DWORDS, 1);
+	hash_for_each_possible(ti->uuids_ht, uuid, node_ht, key)
+		if (!memcmp(&uuid->uuid, dwords, sizeof(uuid->uuid)))
+			return uuid;
+
+	return NULL;
+}
+
+static struct telemetry_uuid *
+scmi_telemetry_uuid_get_or_create(struct telemetry_info *ti, __be32 *dwords)
+{
+	struct telemetry_uuid *uuid;
+
+	guard(mutex)(&ti->uuids_mtx);
+
+	uuid = scmi_telemetry_uuid_lookup(ti, dwords);
+	if (uuid)
+		return uuid;
+
+	return scmi_telemetry_uuid_create(ti, dwords);
+}
+
+/**
+ * scmi_telemetry_tdcf_uuid_parse  - A UUID line parser
+ *
+ * @ti: A reference to the telemetry_info descriptor
+ * @uuid_payld: UUID payld line to process
+ * @snap: A reference to the working SHMTI snapshot that will be processed
+ * @active_uuid: Input/output reference to keep track of the last uuid found
+ *
+ * Note that by the SCMI v4.0 Telemetry specification the associations between
+ * DEs and UUIDs, both primary and secondary, are permanent across the same
+ * session (boot): once discovered they cannot change.
+ *
+ * Moreover, since the current UUID line could be malformed due to garbage in
+ * the TDCF, in such a case we warn/log and bailout BUT we don't throw away
+ * the currently active_uuid (if any) since the current malformed line could
+ * be bogus and never intended to be a UUID line.
+ */
+static void scmi_telemetry_tdcf_uuid_parse(struct telemetry_info *ti,
+					   struct payload *uuid_payld,
+					   struct shmti_snap *snap,
+					   struct telemetry_uuid **active_uuid)
+{
+	__be32 *dwords = uuid_payld->uuid_l.dwords;
+	u32 meta = PAYLD_META_RAW(uuid_payld);
+
+	if (WARN_ON(UUID_INVALID_RAW(meta))) {
+		trace_scmi_tlm_access(0, "UUID_INVALID",
+				      snap->magic, snap->magic);
+		return;
+	}
+
+	*active_uuid = scmi_telemetry_uuid_get_or_create(ti, dwords);
+
+	WARN_ON(!*active_uuid);
+}
+
 /**
  * scmi_telemetry_tdcf_blkts_parse  - A BLK_TS line parser
  *
@@ -1762,6 +1940,18 @@ static inline void scmi_telemetry_blkts_link(struct telemetry_de *tde,
 	trace_scmi_tlm_access(tde->de.info->id, "BLKTS_LINK", 0, 0);
 }
 
+static inline void scmi_telemetry_uuid_link(struct telemetry_de *tde,
+					    struct telemetry_uuid *uuid)
+{
+	lockdep_assert_held(&tde->mtx);
+	if (tde->uuid)
+		return;
+
+	/* Update UUID association */
+	tde->uuid = uuid;
+	trace_scmi_tlm_access(tde->de.info->id, "UUID_LINK", 0, 0);
+}
+
 /**
  * scmi_telemetry_tdcf_data_parse  - TDCF DataLine parsing
  * @ti: A reference to the telemetry info descriptor
@@ -1895,6 +2085,9 @@ static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
 			tde->de.info->ts_rate = tde->bts->last_rate;
 	}
 
+	/* Link the active UUID or the primary, it's unlinked on disable */
+	scmi_telemetry_uuid_link(tde, active_uuid ?: ti->primary_uuid);
+
 	/*
 	 * Parse data words ... only for the sake of updating TDE cache,
 	 * any error is logged but ignored.
@@ -1961,6 +2154,9 @@ static int scmi_telemetry_tdcf_line_parse(struct telemetry_info *ti,
 	case TDCF_BLK_TS_LINE:
 		scmi_telemetry_tdcf_blkts_parse(ti, payld, snap, active_bts);
 		break;
+	case TDCF_UUID_LINE:
+		scmi_telemetry_tdcf_uuid_parse(ti, payld, snap, active_uuid);
+		break;
 	default:
 		trace_scmi_tlm_access(PAYLD_ID_RAW(payld), "TDCF_LINE_UNKNOWN", 0, 0);
 		break;
@@ -2258,6 +2454,7 @@ static int scmi_telemetry_resources_alloc(struct telemetry_info *ti)
 	}
 
 	INIT_LIST_HEAD(&ti->fcs_des);
+	hash_init(ti->uuids_ht);
 
 	ti->shmti = no_free_ptr(shmtis);
 	ti->info.shmtis = no_free_ptr(shmtis_info);
@@ -2305,10 +2502,42 @@ static void scmi_telemetry_resources_free(struct telemetry_info *ti)
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
+			struct telemetry_uuid *uuid;
+
+			uuid = to_uuid_from_uuid_t(cur_uuids[i]);
+			hash_del(&uuid->node_ht);
+			kfree(uuid);
+
+			trace_scmi_tlm_access(0, "DROP_LINE", TDCF_UUID_LINE, 0);
+		}
+	}
+
+	kfree_rcu_mightsleep(cur_uuids);
+}
+
 static void scmi_telemetry_instance_cleanup(void *arg)
 {
 	struct telemetry_info *ti = arg;
 
+	scmi_telemetry_uuids_cleanup(ti);
 	scmi_telemetry_resources_free(ti);
 }
 
@@ -2379,6 +2608,23 @@ scmi_telemetry_resources_enumerate(struct telemetry_info *ti)
 	return ti->rinfo;
 }
 
+static int scmi_telemetry_primary_uuid_init(struct telemetry_info *ti)
+{
+	__be32 *dwords = (__be32 *)&ti->info.base.primary_revision.b;
+	struct telemetry_uuid *uuid;
+
+	uuid = scmi_telemetry_uuid_get_or_create(ti, dwords);
+	if (!uuid) {
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
@@ -2394,12 +2640,41 @@ scmi_telemetry_resources_enumerate(struct telemetry_info *ti)
  */
 static int scmi_telemetry_instance_init(struct telemetry_info *ti)
 {
+	unsigned int uuids_len;
+	uuid_t **cur_uuids;
 	int ret;
 
 	ret = scmi_telemetry_resources_alloc(ti);
 	if (ret)
 		return ret;
 
+	/*
+	 * Always allocate at least one slot for the primary and anyway at
+	 * least enough to avoid immediate resizing, assuring uuids_len
+	 * always greater or equal to one.
+	 */
+	uuids_len = max(ti->num_shmti * 2, SCMI_UUID_DB_THRESH + 1);
+	cur_uuids = kzalloc_objs(*cur_uuids, uuids_len);
+	if (!cur_uuids) {
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
+		scmi_telemetry_resources_free(ti);
+		return ret;
+	}
+
 	atomic_set(&ti->des_enabled[ENA_STATE], 0);
 	atomic_set(&ti->des_enabled[ENA_TSTAMP], 0);
 	mutex_init(&ti->des_enabled_mtx);
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 4a765a529ebf..b828cbc1eb21 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -957,6 +957,8 @@ struct scmi_telemetry_info {
 	unsigned int active_update_interval;
 	struct scmi_telemetry_intervals *intervals;
 	struct scmi_telemetry_shmti_info **shmtis;
+	unsigned int num_uuids;
+	uuid_t * __rcu *uuids;
 };
 
 /**
-- 
2.54.0

