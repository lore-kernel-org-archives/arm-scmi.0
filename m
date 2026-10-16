Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00AF549BB70;
	Fri, 16 Oct 2026 18:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792177014; cv=none; b=ScuDax5pP/3bivU8enqcCeZp5ggJkC0EZR3jKzkPG+sdpxbZuyjQ7bcWW0IAouY8UYAt7YgsDwnamZ7F9qg2FcmtziQs1svxesp9K2kh4UN6qorrVewM2T8Iyt6KYQIwwcTpcDGBlByFjCElcs44MiJkGfrDmCYPn89iVpX/Hgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792177014; c=relaxed/simple;
	bh=qcNxvBYUxvak7L4ykcWqB9CyYf/TaTPiqk68UbVzZ0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gmFTgwBM8EX5Umzhkp83Cwu7y9eTx8VUHIyOdtGCQ4aanLvGEUnq8w9usS5jrsuqrJmWDFEmc/KAAVF3OmDpFHmB9qVl8+QuHs4a9NpyurUbbOwonq9V8PYUQnW8pGuIzlAML2VXmzauImAklQMSzpaZW7Evf074rx3eB6YolnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=It+EavHs; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="It+EavHs"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1129A14BF;
	Fri, 16 Oct 2026 11:56:48 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8509E3F7B4;
	Fri, 16 Oct 2026 11:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792177011; bh=qcNxvBYUxvak7L4ykcWqB9CyYf/TaTPiqk68UbVzZ0E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=It+EavHsT4uUA5uTkpD/DdWv8ZZLjP34wGHbWfbtiY7qE1ixM4f4SxPbdk13M2Jf8
	 qdMhaP05ElGXs1ge3nm0HieovlsBHuJ9Qq04oZr92LiR323++Vg1ikniQ5dauJyGke
	 fMw3n8ZfjLhx0eCuZTioQuGbupxgcLUg+3xqoqsM=
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
Subject: [PATCH v14 04/32] firmware: arm_scmi: Introduce protocol instance notifiers
Date: Fri, 16 Oct 2026 19:55:25 +0100
Message-ID: <20261016185553.2794459-5-cristian.marussi@arm.com>
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

SCMI Protocol notifications are typically used by SCMI drivers to detect
and react to particular conditions: this was the assumption and the classic
usage scenario upon which the SCMI notification framework was built.

Some protocols like Telemetry, though, could be interested in enabling and
registering for such notifications: in such a scenario each initialized
protocol instance could want to register a common protocol notifier.

In order to reuse the existing SCMI Notifications machinery, allow
protocols themselves to register for their own notifications and provide
their own notifier callbacks.

Each protocol, at the end of its initialization phase, can now provide one
unique per-protocol-instance notifier block, which will be registered, by
the core SCMI stack, on the related notification chain: such notifier will
be automatically removed during the protocol de-initialization phase.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v13 --> v14
 - reworked the helpers used to register protocol notifiers so as to
   possibly worked during the protocol initialization phase when locks
   are enabled
v12 --> v13
 - refactored a few IFs
v10 -->v11
 - added a few dev_dbg
v8 --> v9
 - Added membarrier comment
v7 --> v8
 - Reworked logic around protocol notifier registration to address
   possible races as pointed out by Sashiko
 - Reviewed commit message
v5 -->v6
 - move protocol notifier registration out of proto_init
v2-->v3
 - split out unrelated changes on event sizing
v1-->v2
 - Fixed multiline comment format
---
 drivers/firmware/arm_scmi/common.h    |  24 ++++
 drivers/firmware/arm_scmi/driver.c    | 115 +++++++++++++++----
 drivers/firmware/arm_scmi/notify.c    | 154 ++++++++++++++++++++++++++
 drivers/firmware/arm_scmi/protocols.h |  10 ++
 4 files changed, 282 insertions(+), 21 deletions(-)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index 678258bc7a93..c31896672b81 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -18,6 +18,7 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/property.h>
+#include <linux/notifier.h>
 #include <linux/refcount.h>
 #include <linux/scmi_protocol.h>
 #include <linux/spinlock.h>
@@ -162,7 +163,9 @@ struct scmi_device *scmi_device_create(struct device_node *np,
 void scmi_device_destroy(struct device *parent, int protocol, const char *name);
 
 int scmi_protocol_acquire(const struct scmi_handle *handle, u8 protocol_id);
+int scmi_protocol_acquire_unlocked(const struct scmi_handle *handle, u8 protocol_id);
 void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id);
+void scmi_protocol_release_unlocked(const struct scmi_handle *handle, u8 protocol_id);
 
 /* SCMI Transport */
 /**
@@ -687,8 +690,29 @@ static struct platform_driver __drv = {					       \
 	.probe = __tag##_probe,						       \
 }
 
+struct scmi_protocol_notifier {
+	u8 proto_id;
+	u8 evt_id;
+	const u32 *src_id;
+	struct notifier_block *nb;
+	bool registered;
+};
+
 void scmi_notification_instance_data_set(const struct scmi_handle *handle,
 					 void *priv);
 void *scmi_notification_instance_data_get(const struct scmi_handle *handle);
+
+int scmi_protocol_notifier_register(const struct scmi_handle *handle,
+				    struct scmi_protocol_notifier *pno);
+int scmi_protocol_notifier_unregister(const struct scmi_handle *handle,
+				      struct scmi_protocol_notifier *pno);
+
+static inline bool
+scmi_protocol_notifier_registered(struct scmi_protocol_notifier *pno)
+{
+	/* Ensure registered is visible */
+	return smp_load_acquire(&pno->registered);
+}
+
 int scmi_inflight_count(const struct scmi_handle *handle);
 #endif /* _SCMI_COMMON_H */
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index a666ad39acdf..929f3782ee36 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -91,6 +91,8 @@ struct scmi_xfers_info {
  * @gid: A reference for per-protocol devres management.
  * @users: A refcount to track effective users of this protocol.
  * @priv: Reference for optional protocol private data.
+ * @pno: A protocol instance notifier descriptor: active only when the
+ *	 included notifier block @nb is non-NULL.
  * @version: Protocol version supported by the platform as detected at runtime.
  * @negotiated_version: When the platform supports a newer protocol version,
  *			the agent will try to negotiate with the platform the
@@ -110,6 +112,7 @@ struct scmi_protocol_instance {
 	void				*gid;
 	refcount_t			users;
 	void				*priv;
+	struct scmi_protocol_notifier   pno;
 	unsigned int			version;
 	unsigned int			negotiated_version;
 	struct scmi_protocol_handle	ph;
@@ -1656,6 +1659,24 @@ static void *scmi_get_protocol_priv(const struct scmi_protocol_handle *ph)
 	return pi->priv;
 }
 
+static int
+scmi_register_instance_notifier(const struct scmi_protocol_handle *ph, u8 evt_id,
+				const u32 *src_id, struct notifier_block *nb)
+{
+	struct scmi_protocol_instance *pi = ph_to_pi(ph);
+
+	pi->pno.proto_id = pi->proto->id;
+	pi->pno.evt_id = evt_id;
+	pi->pno.src_id = src_id;
+	/*
+	 * Ensure the descriptor fields are visibile when the notifier block is
+	 * made available
+	 */
+	smp_store_release(&pi->pno.nb, nb);
+
+	return 0;
+}
+
 static const struct scmi_xfer_ops xfer_ops = {
 	.xfer_get_init = xfer_get_init,
 	.reset_rx_to_maxsz = reset_rx_to_maxsz,
@@ -2256,6 +2277,7 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
 	pi->ph.hops = &helpers_ops;
 	pi->ph.set_priv = scmi_set_protocol_priv;
 	pi->ph.get_priv = scmi_get_protocol_priv;
+	pi->ph.instance_notifier_register = scmi_register_instance_notifier;
 	refcount_set(&pi->users, 1);
 
 	/*
@@ -2317,12 +2339,12 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
 static struct scmi_protocol_instance * __must_check
 scmi_get_protocol_instance(const struct scmi_handle *handle, u8 protocol_id)
 {
-	struct scmi_protocol_instance *pi;
 	struct scmi_info *info = handle_to_scmi_info(handle);
+	struct scmi_protocol_instance *pi;
 
-	mutex_lock(&info->protocols_mtx);
-	pi = idr_find(&info->protocols, protocol_id);
+	guard(mutex)(&info->protocols_mtx);
 
+	pi = idr_find(&info->protocols, protocol_id);
 	if (pi) {
 		refcount_inc(&pi->users);
 	} else {
@@ -2330,16 +2352,44 @@ scmi_get_protocol_instance(const struct scmi_handle *handle, u8 protocol_id)
 
 		/* Fails if protocol not registered on bus */
 		proto = scmi_protocol_get(protocol_id, &info->version);
-		if (proto)
-			pi = scmi_alloc_init_protocol_instance(info, proto);
-		else
-			pi = ERR_PTR(-EPROBE_DEFER);
+		if (!proto)
+			return ERR_PTR(-EPROBE_DEFER);
+
+		pi = scmi_alloc_init_protocol_instance(info, proto);
+		if (IS_ERR(pi))
+			return pi;
+
+		/*
+		 * A unique protocol notifier, when present, is registered
+		 * after the protocol itself and all of its supported events
+		 * have been successfully initialized.
+		 */
+		if (smp_load_acquire(&pi->pno.nb) &&
+		    scmi_protocol_notifier_register(pi->handle, &pi->pno))
+			dev_warn(handle->dev,
+				 "Failed to register protocol [0x%X] notifier\n",
+				 proto->id);
 	}
-	mutex_unlock(&info->protocols_mtx);
 
 	return pi;
 }
 
+int scmi_protocol_acquire_unlocked(const struct scmi_handle *handle, u8 protocol_id)
+{
+	struct scmi_info *info = handle_to_scmi_info(handle);
+	struct scmi_protocol_instance *pi;
+
+	lockdep_assert_held(&info->protocols_mtx);
+
+	pi = idr_find(&info->protocols, protocol_id);
+	if (WARN_ON(!pi))
+		return -ENODEV;
+
+	refcount_inc(&pi->users);
+
+	return 0;
+}
+
 /**
  * scmi_protocol_acquire  - Protocol acquire
  * @handle: A reference to the SCMI platform instance.
@@ -2355,23 +2405,32 @@ int scmi_protocol_acquire(const struct scmi_handle *handle, u8 protocol_id)
 	return PTR_ERR_OR_ZERO(scmi_get_protocol_instance(handle, protocol_id));
 }
 
-/**
- * scmi_protocol_release  - Protocol de-initialization helper.
- * @handle: A reference to the SCMI platform instance.
- * @protocol_id: The protocol being requested.
- *
- * Remove one user for the specified protocol and triggers de-initialization
- * and resources de-allocation once the last user has gone.
- */
-void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id)
+void scmi_protocol_release_unlocked(const struct scmi_handle *handle,
+				    u8 protocol_id)
 {
 	struct scmi_info *info = handle_to_scmi_info(handle);
 	struct scmi_protocol_instance *pi;
 
-	mutex_lock(&info->protocols_mtx);
+	lockdep_assert_held(&info->protocols_mtx);
+
 	pi = idr_find(&info->protocols, protocol_id);
 	if (WARN_ON(!pi))
-		goto out;
+		return;
+
+	/*
+	 * If a protocol notifier was registered and this is the last instance
+	 * releasing the protocol, un-register the notifier: note that the
+	 * notifier itself counts as one user, as for any other regular notifier,
+	 * so if a protocol notifier was registered and there are only 2 users
+	 * active we can derive that this is the last protocol instance
+	 * de-registering.
+	 */
+	if (scmi_protocol_notifier_registered(&pi->pno) &&
+	    refcount_read(&pi->users) == 2 &&
+	    scmi_protocol_notifier_unregister(pi->handle, &pi->pno))
+		dev_err(handle->dev,
+			"Failed to release protocol [0x%X] notifier\n",
+			protocol_id);
 
 	if (refcount_dec_and_test(&pi->users)) {
 		void *gid = pi->gid;
@@ -2390,9 +2449,23 @@ void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id)
 		dev_dbg(handle->dev, "De-Initialized protocol: 0x%X\n",
 			protocol_id);
 	}
+}
 
-out:
-	mutex_unlock(&info->protocols_mtx);
+/**
+ * scmi_protocol_release  - Protocol de-initialization helper.
+ * @handle: A reference to the SCMI platform instance.
+ * @protocol_id: The protocol being requested.
+ *
+ * Remove one user for the specified protocol and triggers de-initialization
+ * and resources de-allocation once the last user has gone.
+ */
+void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id)
+{
+	struct scmi_info *info = handle_to_scmi_info(handle);
+
+	guard(mutex)(&info->protocols_mtx);
+
+	scmi_protocol_release_unlocked(handle, protocol_id);
 }
 
 void scmi_setup_protocol_implemented(const struct scmi_protocol_handle *ph,
diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
index 2bc2e03df639..c51f48894f15 100644
--- a/drivers/firmware/arm_scmi/notify.c
+++ b/drivers/firmware/arm_scmi/notify.c
@@ -1059,6 +1059,44 @@ static int scmi_register_event_handler(struct scmi_notify_instance *ni,
 	return ret;
 }
 
+static inline struct scmi_event_handler *
+scmi_create_registered_handler(struct scmi_notify_instance *ni, u32 evt_key)
+{
+	struct scmi_registered_event *r_evt;
+	struct scmi_event_handler *hndl;
+	int ret;
+
+	/* Protocol/events MUST have been registered by now */
+	r_evt = SCMI_GET_REVT(ni, KEY_XTRACT_PROTO_ID(evt_key),
+			      KEY_XTRACT_EVT_ID(evt_key));
+
+	if (WARN_ON(!r_evt))
+		return ERR_PTR(-ENODEV);
+
+	if (r_evt->not_supported_by_platform)
+		return ERR_PTR(-EOPNOTSUPP);
+
+	/* Create if still not found and required */
+	hndl = scmi_allocate_event_handler(evt_key);
+	if (!hndl)
+		return ERR_PTR(-ENOMEM);
+
+	ret = scmi_protocol_acquire_unlocked(ni->handle,
+					     KEY_XTRACT_PROTO_ID(hndl->key));
+	if (ret) {
+		scmi_put_handler_unlocked(ni, hndl);
+		return ERR_PTR(ret);
+	}
+
+	/* Being created registered it never pass by pending list */
+	hndl->r_evt = r_evt;
+
+	guard(mutex)(&r_evt->proto->registered_mtx);
+	hash_add(r_evt->proto->registered_events_handlers, &hndl->hash, hndl->key);
+
+	return hndl;
+}
+
 /**
  * __scmi_event_handler_get_ops()  - Utility to get or create an event handler
  * @ni: A reference to the notification instance to use
@@ -1436,6 +1474,67 @@ static int scmi_notifier_register(const struct scmi_handle *handle,
 	return ret;
 }
 
+/**
+ * scmi_protocol_notifier_register  - Register the protocol notifier
+ * @handle: The handle identifying the platform instance against which the
+ *	    callback is registered
+ * @pno: The protocol notifier descriptor
+ *
+ * A protocol can optionally register a single protocol notifier callback
+ * during its initialization phase: the notifier_block will be the registered
+ * using the usual common SCMI notification framework.
+ *
+ * This custom wrapper function is used to register such a notifier since, by
+ * construction, when a protocol notifier is registered:
+ *  - it is the first notifier to be registered
+ *  - the related protocol and its events have been already initialized so this
+ *    notifier will never need to transition from the pending events list
+ *
+ * Return: 0 on Success
+ */
+int scmi_protocol_notifier_register(const struct scmi_handle *handle,
+				    struct scmi_protocol_notifier *pno)
+{
+	struct scmi_event_handler *hndl;
+	struct scmi_notify_instance *ni;
+	u32 evt_key;
+	int ret;
+
+	ni = scmi_notification_instance_data_get(handle);
+	if (!ni)
+		return -ENODEV;
+
+	/* Ensure registered was visible */
+	if (smp_load_acquire(&pno->registered))
+		return -EBUSY;
+
+	evt_key = MAKE_HASH_KEY(pno->proto_id, pno->evt_id,
+				pno->src_id ? *pno->src_id : SRC_ID_MASK);
+
+	/* This protocol handler notifier cannot exist already at this point */
+	hndl = scmi_create_registered_handler(ni, evt_key);
+	if (IS_ERR(hndl))
+		return PTR_ERR(hndl);
+
+	blocking_notifier_chain_register(&hndl->chain, pno->nb);
+	ret = scmi_event_handler_enable_events(hndl);
+	if (ret) {
+		/* When enable fails throw the handler away */
+		scmi_put_handler_unlocked(ni, hndl);
+		/* Drop protocol refcount acquired after creation */
+		scmi_protocol_release_unlocked(handle, pno->proto_id);
+		return ret;
+	}
+
+	/* Make sure registration is visible */
+	smp_store_release(&pno->registered, true);
+
+	dev_dbg(handle->dev,
+		"Registered SCMI protocol [0x%X] notifier\n", pno->proto_id);
+
+	return 0;
+}
+
 /**
  * scmi_notifier_unregister()  - Unregister a notifier_block for an event
  * @handle: The handle identifying the platform instance against which the
@@ -1493,6 +1592,61 @@ static int scmi_notifier_unregister(const struct scmi_handle *handle,
 	return 0;
 }
 
+int scmi_protocol_notifier_unregister(const struct scmi_handle *handle,
+				      struct scmi_protocol_notifier *pno)
+{
+	struct scmi_registered_event *r_evt;
+	struct scmi_event_handler *hndl;
+	struct scmi_notify_instance *ni;
+	u32 evt_key;
+	bool freed;
+
+	ni = scmi_notification_instance_data_get(handle);
+	if (!ni)
+		return -ENODEV;
+
+	evt_key = MAKE_HASH_KEY(pno->proto_id, pno->evt_id,
+				pno->src_id ? *pno->src_id : SRC_ID_MASK);
+
+	r_evt = SCMI_GET_REVT(ni, KEY_XTRACT_PROTO_ID(evt_key),
+			      KEY_XTRACT_EVT_ID(evt_key));
+
+	if (WARN_ON(!r_evt))
+		return -ENODEV;
+
+	/* Make sure de-registration is visible BEFORE calling unregister */
+	smp_store_release(&pno->registered, false);
+
+	scoped_guard(mutex, &r_evt->proto->registered_mtx) {
+		hndl = KEY_FIND(r_evt->proto->registered_events_handlers,
+				hndl, evt_key);
+		if (!hndl) {
+			/* Visibly revert registered state on failure */
+			smp_store_release(&pno->registered, true);
+			return -ENOMEM;
+		}
+
+		blocking_notifier_chain_unregister(&hndl->chain, pno->nb);
+
+		freed = scmi_put_handler_unlocked(ni, hndl);
+		/* This must cause the handler to be freed at this point */
+		WARN_ON(!freed);
+	}
+
+	/*
+	 * Releasing the protocol for this notifier only here AFTER unlocking
+	 * registered_mtx, since releasing the protocol itself can trigger its
+	 * de-initialization (ie. including r_evt and registered_mtx)
+	 */
+	if (freed)
+		scmi_protocol_release_unlocked(handle, pno->proto_id);
+
+	dev_dbg(handle->dev,
+		"Unregistered SCMI protocol [0x%X] notifier\n", pno->proto_id);
+
+	return 0;
+}
+
 struct scmi_notifier_devres {
 	const struct scmi_handle *handle;
 	u8 proto_id;
diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
index 15ad5162e37a..b7f29003a7dc 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -166,6 +166,13 @@ struct scmi_proto_helpers_ops;
  *	  can be used by the protocol implementation to generate SCMI messages.
  * @set_priv: A method to set protocol private data for this instance.
  * @get_priv: A method to get protocol private data previously set.
+ * @instance_notifier_register: A method to register interest for specific
+ *				notifications from within a protocol
+ *				implementation unit: ONLY one instance notifier
+ *				can be registered per-protocol.
+ *				The related notifier block will be registered
+ *				right after the protocol is initialized and
+ *				automatically removed on protocol release.
  *
  * This structure represents a protocol initialized against specific SCMI
  * instance and it will be used as follows:
@@ -185,6 +192,9 @@ struct scmi_protocol_handle {
 	const struct scmi_proto_helpers_ops *hops;
 	int (*set_priv)(const struct scmi_protocol_handle *ph, void *priv);
 	void *(*get_priv)(const struct scmi_protocol_handle *ph);
+	int (*instance_notifier_register)(const struct scmi_protocol_handle *ph,
+					  u8 evt_id, const u32 *src_id,
+					  struct notifier_block *nb);
 };
 
 /**
-- 
2.54.0

