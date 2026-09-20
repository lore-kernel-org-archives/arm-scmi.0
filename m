Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 578113E558A;
	Sun, 20 Sep 2026 09:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789896076; cv=none; b=IVdIUy2RJKHt/UDqTjT6DRDK/oOvpUPcuZRfUS8xlnSsaa6T83QPDod+xZeXJqZgqTx4iDIsr36rxV605qNLWloZFuHIE6Hi8Qv41290CAAQTUZMVEQp9ThebYdlmC7VVRHMFMxB1F/r7iAvaA3crJpzN8ot4NSus6UvL1dULmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789896076; c=relaxed/simple;
	bh=t9wyyeFMtxTXqDtnieZJaEnVceYHrygP7s5U8LrdN4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cH/KzKDFfwI55ADm5chpYhTlmzC3A///clUZgXEznOBvCPcGPfgIjmEUMfHeq54eed/hdCsSHDWR8fFOPyn0UWudg9+N2kJw9SXL52TIETjMcK50KqzArXusFWptnh3d348YsgRVBgZFYkfjro4BSV7gu0bP9ktvpzVrNSGNY8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=LAfe+EYK; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="LAfe+EYK"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C20B71650;
	Sun, 20 Sep 2026 02:21:06 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F4F13F59E;
	Sun, 20 Sep 2026 02:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789896070; bh=t9wyyeFMtxTXqDtnieZJaEnVceYHrygP7s5U8LrdN4U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LAfe+EYKuJjFImL9E5GNvvtEJzJICNNETd3BtNGHQ996sgFy8dWc/5pNwTQ4HmSU2
	 E6DePx9z6IdxoYs2IjUl5thX3i5XIKGbvrwG7xqc+r+PtYZlRBZ4kT082CwW4uhfnV
	 +LSMaNSWiRGW24wvu23rzgCXgSJTd3iQs+oKN+jM=
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
	david@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v12 14/25] firmware: arm_scmi: Add Telemetry generation counter event
Date: Sun, 20 Sep 2026 10:19:17 +0100
Message-ID: <20260920091928.2014972-15-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260920091928.2014972-1-cristian.marussi@arm.com>
References: <20260920091928.2014972-1-cristian.marussi@arm.com>
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
v11 -->v12
 - reviewed generation counter update logic
v6 --> v7
 - use new Generic event mechanism based on EventFD instead of WaitQ
v5 --> v6
 - add relese semantic to the atomic set of the generation counter
 - use new eventfd_ctx common event logic
---
 drivers/firmware/arm_scmi/telemetry.c | 48 ++++++++++++++++++++++++++-
 include/linux/scmi_protocol.h         |  6 ++--
 2 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index c76409083160..ada4838d2351 100644
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
 
 #define SCMI_TLM_DE_IMPL_NUM_DWORDS	4
@@ -719,6 +722,37 @@ scmi_telemetry_tde_cache_lookup(struct telemetry_de *tde,
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
@@ -2734,6 +2768,8 @@ static int __scmi_telemetry_state_set(const struct scmi_protocol_handle *ph,
 						       tstamp_enabled_state,
 						       *tstamp);
 
+		/* A local change can have an impact anyway */
+		scmi_telemetry_generation_update(ti);
 		return 0;
 	}
 
@@ -2766,11 +2802,13 @@ static int __scmi_telemetry_state_set(const struct scmi_protocol_handle *ph,
 	ret = ph->xops->do_xfer(ph, t);
 	if (!ret) {
 		ret = scmi_telemetry_state_set_resp_process(ti, obj, resp, is_group);
-		if (!ret)
+		if (!ret) {
 			/* Update cached state on success */
 			scmi_telemetry_state_cache_update(ti, enable, enabled_state,
 							  tstamp, tstamp_enabled_state,
 							  grp, de);
+			scmi_telemetry_generation_update(ti);
+		}
 	}
 
 	ph->xops->xfer_put(ph, t);
@@ -2959,6 +2997,9 @@ scmi_telemetry_collection_configure(const struct scmi_protocol_handle *ph,
 
 	ph->xops->xfer_put(ph, t);
 
+	if (!ret)
+		scmi_telemetry_generation_update(ti);
+
 	return ret;
 }
 
@@ -3473,6 +3514,9 @@ static int scmi_telemetry_reset(const struct scmi_protocol_handle *ph)
 		struct telemetry_info *ti = ph->get_priv(ph);
 
 		scmi_telemetry_local_resources_reset(ti);
+		/* Reset generation now that server has been reset */
+		scmi_telemetry_generation_reset(ti);
+
 		/* NO need to lookup the initial state we have just reset all */
 	}
 
@@ -3994,6 +4038,8 @@ static int scmi_telemetry_instance_init(struct telemetry_info *ti)
 	for (int i = 0; i < SCMI_TLM_EVT_MAX; i++)
 		INIT_LIST_HEAD(&ti->events[i]);
 	mutex_init(&ti->events_mtx);
+	/* Generation counter init */
+	atomic_set(&ti->info.generation, SCMI_TLM_GENERATION_ONE);
 	atomic_set(&ti->des_enabled[ENA_STATE], 0);
 	atomic_set(&ti->des_enabled[ENA_TSTAMP], 0);
 	mutex_init(&ti->des_enabled_mtx);
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index b4b3e95547ba..56b098bc472d 100644
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

