Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A99A3D45E5;
	Fri,  3 Jul 2026 12:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783082245; cv=none; b=SMIE84s37dka3hWS1d3rxjd1nwNZILmWDQq9JMX2m0INhivRUf9SExf9wNJBQL5O0PY7KOUHP4Rb128Tl8/UxXLz10M2aGdiOUobkR9TeMu4Twn7ocGinoLB/pHGUdolhjk1klV0DR4T0KcVF53Cq7L0upCXNXkT0yGAKZvqOm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783082245; c=relaxed/simple;
	bh=3MUqAjheDyUpfTI6rCN29biS9tx0wF5pqNDfXEGm4QE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CKs3yh+6lqXP2Xkl/aKgTo8iLJgY35Z4o0+KdEr7PGbUHCXpYrFnf1AuUWT/79oOkMZmCtmQRPh3JMB/zDJ2QbRCe9d4BZCgZLrSHz+q9ZbnXTeIa2V+CRaRCiEr4dkG8nJ8dwHDAkHEcBf1PFi1g4m1WHbcjCmkE3mdvdxkP44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Ghd5mdhI; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ghd5mdhI"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 790A4463D;
	Fri,  3 Jul 2026 05:37:18 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8071D3F905;
	Fri,  3 Jul 2026 05:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783082242; bh=3MUqAjheDyUpfTI6rCN29biS9tx0wF5pqNDfXEGm4QE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ghd5mdhIsi35XX+8jwpYsxhzkHxJwwIIb6ZJaEMIUuU1g1x/qpWC6F4JU9O+x+a6p
	 zQywez7HN438yCbbDY84mSp8WJiZrN/Et7Cuv1Hmrtu5/GauCYYfrVaEzab6LzsBuM
	 6mDfUzjmuWxsLAj6aznEcKzrhxtR0G1KcPs3tO1c=
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
	jic23@kernel.org,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	brauner@kernel.org,
	david@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v5 14/23] firmware: arm_scmi: Add Telemetry generation counter
Date: Fri,  3 Jul 2026 13:35:52 +0100
Message-ID: <20260703123601.381275-15-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703123601.381275-1-cristian.marussi@arm.com>
References: <20260703123601.381275-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a per-instance generation counter to track configuration changes and
expose a telemetry operations to get a related waitqueue for monitoring.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/telemetry.c | 53 +++++++++++++++++++++++++++
 include/linux/scmi_protocol.h         |  5 +++
 2 files changed, 58 insertions(+)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 1cd24a58c51d..f54e7d262f7f 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -21,6 +21,7 @@
 #include <linux/sprintf.h>
 #include <linux/string.h>
 #include <linux/xarray.h>
+#include <linux/wait.h>
 
 #include "protocols.h"
 #include "notify.h"
@@ -30,6 +31,7 @@
 /* Updated only after ALL the mandatory features for that version are merged */
 #define SCMI_PROTOCOL_SUPPORTED_VERSION		0x10000
 
+#define SCMI_TLM_GENERATION_ONE		(SCMI_TLM_GENERATION_INVALID + 1U)
 #define SCMI_TLM_TDCF_MAX_RETRIES	5
 
 enum scmi_telemetry_protocol_cmd {
@@ -459,6 +461,7 @@ struct telemetry_info {
 	struct list_head free_des;
 	struct list_head fcs_des;
 	struct scmi_telemetry_info info;
+	struct wait_queue_head gen_wq;
 	struct notifier_block telemetry_nb;
 	atomic_t rinfo_initializing;
 	struct completion rinfo_initdone;
@@ -608,6 +611,29 @@ scmi_telemetry_tde_cache_lookup(struct telemetry_de *tde,
 	return 0;
 }
 
+static inline void __scmi_telemetry_generation_set(struct telemetry_info *ti,
+						   unsigned int new)
+{
+	atomic_set(&ti->info.generation, new);
+
+	wake_up_all(&ti->gen_wq);
+}
+
+static inline void scmi_telemetry_generation_update(struct telemetry_info *ti)
+{
+	unsigned int next;
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
@@ -2098,6 +2124,8 @@ static int __scmi_telemetry_state_set(const struct scmi_protocol_handle *ph,
 						       tstamp_enabled_state,
 						       *tstamp);
 
+		/* A local change can have an impact anyway */
+		scmi_telemetry_generation_update(ti);
 		return 0;
 	}
 
@@ -2159,6 +2187,9 @@ static int __scmi_telemetry_state_set(const struct scmi_protocol_handle *ph,
 
 	ph->xops->xfer_put(ph, t);
 
+	if (!ret)
+		scmi_telemetry_generation_update(ti);
+
 	return ret;
 }
 
@@ -2262,6 +2293,9 @@ static int scmi_telemetry_all_disable(const struct scmi_protocol_handle *ph,
 
 	ph->xops->xfer_put(ph, t);
 
+	if (!ret)
+		scmi_telemetry_generation_update(ti);
+
 	return ret;
 }
 
@@ -2334,6 +2368,9 @@ scmi_telemetry_collection_configure(const struct scmi_protocol_handle *ph,
 
 	ph->xops->xfer_put(ph, t);
 
+	if (!ret)
+		scmi_telemetry_generation_update(ti);
+
 	return ret;
 }
 
@@ -2769,6 +2806,10 @@ static int scmi_telemetry_reset(const struct scmi_protocol_handle *ph)
 		struct telemetry_info *ti = ph->get_priv(ph);
 
 		scmi_telemetry_local_resources_reset(ti);
+
+		/* Reset generation now that server has been reset */
+		scmi_telemetry_generation_reset(ti);
+
 		/* Fetch again the states from platform. */
 		ret = scmi_telemetry_initial_state_lookup(ti);
 		if (ret)
@@ -2781,6 +2822,14 @@ static int scmi_telemetry_reset(const struct scmi_protocol_handle *ph)
 	return ret;
 }
 
+static struct wait_queue_head *
+scmi_telemetry_event_wq_get(const struct scmi_protocol_handle *ph)
+{
+	struct telemetry_info *ti = ph->get_priv(ph);
+
+	return &ti->gen_wq;
+}
+
 static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
 	.info_get = scmi_telemetry_info_get,
 	.de_lookup = scmi_telemetry_de_lookup,
@@ -2793,6 +2842,7 @@ static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
 	.des_bulk_read = scmi_telemetry_des_bulk_read,
 	.des_sample_get = scmi_telemetry_des_sample_get,
 	.reset = scmi_telemetry_reset,
+	.event_wq_get = scmi_telemetry_event_wq_get,
 };
 
 static bool
@@ -3083,6 +3133,9 @@ static int scmi_telemetry_instance_init(struct telemetry_info *ti)
 
 	xa_init(&ti->xa_des);
 	xa_init(&ti->xa_lines);
+	/* Generation counter init */
+	atomic_set(&ti->info.generation, SCMI_TLM_GENERATION_ONE);
+	init_waitqueue_head(&ti->gen_wq);
 	atomic_set(&ti->des_enabled[ENA_STATE], 0);
 	atomic_set(&ti->des_enabled[ENA_TSTAMP], 0);
 	/* Setup resources lazy initialization */
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 44ace368fc99..de6b3c7cc959 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -13,6 +13,7 @@
 #include <linux/device.h>
 #include <linux/notifier.h>
 #include <linux/types.h>
+#include <linux/wait.h>
 
 #define SCMI_MAX_STR_SIZE		64
 #define SCMI_SHORT_NAME_MAX_SIZE	16
@@ -889,6 +890,7 @@ enum scmi_telemetry_collection {
 	SCMI_TLM_SINGLE_READ,
 };
 
+#define SCMI_TLM_GENERATION_INVALID	0U
 #define SCMI_TLM_GRP_INVALID		0xFFFFFFFF
 #define SCMI_TLM_DE_IMPL_MAX_DWORDS	4
 
@@ -983,6 +985,7 @@ struct scmi_telemetry_info {
 	bool enabled;
 	bool notif_enabled;
 	enum scmi_telemetry_collection current_mode;
+	atomic_t generation;
 };
 
 struct scmi_telemetry_de_sample {
@@ -1016,6 +1019,7 @@ struct scmi_telemetry_de_sample {
  *		    This causes an immediate update platform-side of all the
  *		    enabled DEs.
  * @reset: reset configuration and telemetry data.
+ * @event_wq_get: get a reference to the event waitqueue for this instance.
  */
 struct scmi_telemetry_proto_ops {
 	const struct scmi_telemetry_info __must_check *(*info_get)
@@ -1042,6 +1046,7 @@ struct scmi_telemetry_proto_ops {
 					   int grp_id, int *num_samples,
 					   struct scmi_telemetry_de_sample *samples);
 	int (*reset)(const struct scmi_protocol_handle *ph);
+	struct wait_queue_head *(*event_wq_get)(const struct scmi_protocol_handle *ph);
 };
 
 /**
-- 
2.54.0

