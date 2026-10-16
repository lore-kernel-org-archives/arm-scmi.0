Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 435E14BF360;
	Fri, 16 Oct 2026 18:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792177080; cv=none; b=BDIS1CqeQoo5Vxwves5zPjGrDPRZA6VD4kG84maw8h71HNY/PphWp+mA+MeIPcflrrwYM1QqwNtP0J2lo63XLJILOpjg5pyNdmA+kCRNLNsSCGtf9Vw2VkXcWpI2SBg2GnSZe+0AYF+dLWrkdWCZdOfKYi75DuSaB5mM0cWi3P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792177080; c=relaxed/simple;
	bh=nmRBVcLvoCB8WYfYzEXQOWzXL5juiFsMx9PUp537VJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pCqgupuJE3Sfdwy7GF1xnXJj1/CNtCNT+mZZ5KsjuggTnOPxAywPY85dvIbJECCyKgGLRsIr6mm3zCBDYoUVaXVAtPygp0ryD5cXhLVr2LpKTiTSrSF+ERzKJ6Nx6Q5R3ZNkCpj+TUA4mhtREfJCKd8JmiAF1HYgCx9UX1JvNFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=PlgkSj2v; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="PlgkSj2v"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FF6A14BF;
	Fri, 16 Oct 2026 11:57:51 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A06E3F7B4;
	Fri, 16 Oct 2026 11:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792177074; bh=nmRBVcLvoCB8WYfYzEXQOWzXL5juiFsMx9PUp537VJg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PlgkSj2vkbWt/pJQNPNeGHcAHBGycs2NCFkkA/brrobSU32H+O3Aac+BvbBsoM0j4
	 MHdKVGD2rNj/DiXV4bBZUQcfUUgyOZSZ51S2hU/FSaYihYGxqr2fDB41kPeP7SlqH7
	 8esYf/7bBH8BAOpyLZjHcU8PujLJFeaPPp6aI3bc=
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
Subject: [PATCH v14 21/32] firmware: arm_scmi: Add Telemetry generation counter event
Date: Fri, 16 Oct 2026 19:55:42 +0100
Message-ID: <20261016185553.2794459-22-cristian.marussi@arm.com>
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

Add a per-instance generation counter to track configuration changes which
uses the common telemetry events framework.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v12 --> v13
 - update generation counter on do_xfer succcess even if failing to process
   response since the change hass been applied: this avoids state misalignment
v11 -->v12
 - reviewed generation counter update logic
v6 --> v7
 - use new Generic event mechanism based on EventFD instead of WaitQ
v5 --> v6
 - add relese semantic to the atomic set of the generation counter
 - use new eventfd_ctx common event logic
---
 drivers/firmware/arm_scmi/telemetry.c | 51 ++++++++++++++++++++++++++-
 include/linux/scmi_protocol.h         |  6 ++--
 2 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index b1e3f986919e..a28d13048b54 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -16,6 +16,7 @@
 #include <linux/hash.h>
 #include <linux/io.h>
 #include <linux/limits.h>
+#include <linux/lockdep.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -26,6 +27,7 @@
 #include <linux/string.h>
 #include <linux/uuid.h>
 #include <linux/xarray.h>
+#include <linux/wait.h>
 
 #include "protocols.h"
 #include "notify.h"
@@ -35,6 +37,7 @@
 /* Updated only after ALL the mandatory features for that version are merged */
 #define SCMI_PROTOCOL_SUPPORTED_VERSION		0x10000
 
+#define SCMI_TLM_GENERATION_ONE		(SCMI_TLM_GENERATION_INVALID + 1U)
 #define SCMI_TLM_TDCF_MAX_RETRIES	5
 #define SCMI_TLM_TDCF_RETRY_GAP		1234
 
@@ -733,6 +736,37 @@ scmi_telemetry_tde_cache_lookup(struct telemetry_de *tde,
 	return 0;
 }
 
+static inline void __scmi_telemetry_generation_set(struct telemetry_info *ti,
+						   unsigned int new)
+{
+	int ret;
+
+	atomic_set_release(&ti->info.generation, new);
+
+	ret = scmi_telemetry_event_signal(ti, SCMI_TLM_EVT_GENERATION);
+	if (ret)
+		dev_warn_once(ti->ph->dev,
+			      "Could NOT signal telemetry event %d\n",
+			      SCMI_TLM_EVT_GENERATION);
+}
+
+static inline void scmi_telemetry_generation_update(struct telemetry_info *ti)
+{
+	unsigned int next;
+
+	lockdep_assert_held(&ti->config_mtx);
+
+	/* Wrap around skipping invalid generation 0 */
+	next = (atomic_read(&ti->info.generation) + 1) ?: SCMI_TLM_GENERATION_ONE;
+
+	__scmi_telemetry_generation_set(ti, next);
+}
+
+static inline void scmi_telemetry_generation_reset(struct telemetry_info *ti)
+{
+	__scmi_telemetry_generation_set(ti, SCMI_TLM_GENERATION_ONE);
+}
+
 struct scmi_tlm_de_priv {
 	struct telemetry_info *ti;
 	void *next;
@@ -2875,6 +2909,9 @@ scmi_telemetry_remote_state_update_needed(struct telemetry_info *ti,
 						  is_group ? obj : NULL,
 						  !is_group ? obj : NULL);
 
+		/* A local change can have an impact anyway */
+		scmi_telemetry_generation_update(ti);
+
 		return false;
 	}
 
@@ -2973,6 +3010,8 @@ static int scmi_telemetry_tde_state_set(const struct scmi_protocol_handle *ph,
 			dev_err(ph->dev,
 				"Could NOT process DE ID 0x%08X state response - ret:%d\n",
 				tde->de.info->id, ret);
+
+		scmi_telemetry_generation_update(ti);
 	}
 
 	ph->xops->xfer_put(ph, t);
@@ -3019,6 +3058,8 @@ static int scmi_telemetry_group_state_set(const struct scmi_protocol_handle *ph,
 			dev_err(ph->dev,
 				"Could NOT process GROUP %u state response - ret:%d\n",
 				grp->info->grp_id, ret);
+
+		scmi_telemetry_generation_update(ti);
 	}
 
 	ph->xops->xfer_put(ph, t);
@@ -3170,6 +3211,9 @@ scmi_telemetry_collection_configure(const struct scmi_protocol_handle *ph,
 
 	ph->xops->xfer_put(ph, t);
 
+	if (!ret)
+		scmi_telemetry_generation_update(ti);
+
 	return ret;
 }
 
@@ -3707,8 +3751,11 @@ static int scmi_telemetry_reset(const struct scmi_protocol_handle *ph)
 
 	put_unaligned_le32(0, t->tx.buf);
 	ret = ph->xops->do_xfer(ph, t);
-	if (!ret)
+	if (!ret) {
 		scmi_telemetry_local_resources_reset(ti);
+		/* Reset generation now that server has been reset */
+		scmi_telemetry_generation_reset(ti);
+	}
 
 	ph->xops->xfer_put(ph, t);
 
@@ -4281,6 +4328,8 @@ static int scmi_telemetry_instance_init(struct telemetry_info *ti)
 		INIT_LIST_HEAD(&ti->events[i]);
 	mutex_init(&ti->events_mtx);
 
+	/* Generation counter init */
+	atomic_set(&ti->info.generation, SCMI_TLM_GENERATION_ONE);
 	atomic_set(&ti->des_enabled[ENA_STATE], 0);
 	atomic_set(&ti->des_enabled[ENA_TSTAMP], 0);
 	mutex_init(&ti->des_enabled_mtx);
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 8ca6803df60a..0210247c0166 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -891,6 +891,7 @@ enum scmi_telemetry_collection {
 	SCMI_TLM_SINGLE_READ,
 };
 
+#define SCMI_TLM_GENERATION_INVALID	0U
 #define SCMI_TLM_GRP_INVALID		0xFFFFFFFF
 
 struct scmi_telemetry_intervals {
@@ -986,6 +987,7 @@ struct scmi_telemetry_info {
 	bool enabled;
 	bool notif_enabled;
 	enum scmi_telemetry_collection current_mode;
+	atomic_t generation;
 };
 
 struct scmi_telemetry_de_sample {
@@ -996,7 +998,7 @@ struct scmi_telemetry_de_sample {
 };
 
 enum scmi_telemetry_event {
-	SCMI_TLM_EVT_DUMMY,
+	SCMI_TLM_EVT_GENERATION,
 	SCMI_TLM_EVT_MAX,
 };
 
@@ -1022,11 +1024,11 @@ enum scmi_telemetry_event {
  *		    the ones belonging to a specific group when provided.
  *		    This causes an immediate update platform-side of all the
  *		    enabled DEs.
- * @reset: reset configuration and telemetry data.
  * @event_subscribe: subscribe to the specified event @type using the provided
  *		     @eventfd_ctx.
  * @event_unsubscribe: unsubscribe to the specified event @type the previously
  *		       registered @eventfd_ctx.
+ * @reset: reset configuration and telemetry data.
  */
 struct scmi_telemetry_proto_ops {
 	const struct scmi_telemetry_info __must_check *(*info_get)
-- 
2.54.0

