Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215716;
	b=J0qGM2l7lVfUmwI2CzUzk5t7QEyB/ROEYGnqSLHXR48t64QEvFthXTq9B3W3GLUIHr2g
	 LNxcP/duDCnITrbfWUFVdZsIaqv7avhPOp8c0eFH1Wr9XfSfeYyMvGIbtsx+yRTAkvyl7
	 7v+GFC6mFmUL8HH56cCjEnBods0XYCIj7N7FXg2scrlXIYeoCXng7X6vUmiGK9mAcWRHh
	 7k0O1Yr92C1fD2Wf0fCxG2BNWvYAahbWgFtTYvOfnt4iExIYygirjtGwJo9tdOO/AI+Ck
	 IsvJj6EFqfXW6mZnvf7GVBgxbn3V0Adz3fM03EEU10W/bOOAlSeuRh5SJqo9dO8qU8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215716;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SVitkgS0yJ/VxCEM1ze9jnWIXsE4xk6UQ+tNRfh7uD0=;
	b=1EmjpjgLunBHph27JxBeFMqRHoUpy1ihGQn7I3aep8IOtfvPrzXDL46DwH4qqi/Q+0hr
	 3c5Y3oPObK0J4Xo6HYvDLKL964O1DrbMc62AKkmIuYFiaAMqofFSnU2MYTRDSQtHTPHWy
	 5M7jtBP21vujtI3wHxQ867cJL5tpplv6SnsNWUDAlcZUJzBzkO8kdTWALQDsnbu3twCTs
	 sqTg59UlDfpFUlGwTMO9yb0J5bgK5zy+BTHVXmtvvyf9EaHzO1nLwKcU0TbJ8CDin0dGs
	 WjfKUTAg5LeHhYFj8SoXOHn23s07PFytDF3oX/Ac02SWo2+6FG2QjCCmpt6VHH6FVMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=sYGdX+s9;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7CBA606D83A;
	Mon,  9 Nov 2026 09:15:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7CBA606D83A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=sYGdX+s9
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3558714BF;
	Mon,  9 Nov 2026 01:15:12 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5635C3FA1F;
	Mon,  9 Nov 2026 01:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794215715; bh=65/ZOZZWxB5G/2KRGI2Jb1owHsQU/JBqJmzRWWK+2F8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sYGdX+s9bmPmNbOnXajpSw9BIKt4AsDFMlJMDdZXHNLnG29qbyHDQVMdhiDvxn/wj
	 9ErcbDsiIbcsp5NexUiI7y2HEaMgqK+n+B1tcg1bkdEI6XNY1S+10M1U+/PA9mT7La
	 n46K6/9N1YqVqES/OGicrEL0YNl6dWw01Sd4OR98=
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
Subject: [PATCH v15 06/35] firmware: arm_scmi: Introduce protocol instance notifiers
Date: Mon,  9 Nov 2026 09:11:52 +0000
Message-ID: <20261109091221.2532706-7-cristian.marussi@arm.com>
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
index cdd6f887fae7..e9f3051e8016 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -19,6 +19,7 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/property.h>
+#include <linux/notifier.h>
 #include <linux/refcount.h>
 #include <linux/scmi_protocol.h>
 #include <linux/spinlock.h>
@@ -122,7 +123,9 @@ struct scmi_device *scmi_device_create(struct fwnode_handle *fwnode,
 void scmi_device_destroy(struct device *parent, int protocol, const char *name);
 
 int scmi_protocol_acquire(const struct scmi_handle *handle, u8 protocol_id);
+int scmi_protocol_acquire_unlocked(const struct scmi_handle *handle, u8 protocol_id);
 void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id);
+void scmi_protocol_release_unlocked(const struct scmi_handle *handle, u8 protocol_id);
 
 /* SCMI Transport */
 /**
@@ -693,8 +696,29 @@ static struct platform_driver __drv = {					       \
 #define DEFINE_SCMI_ACPI_TRANSPORT_DRIVER(__tag, __drv, __desc, __match, __core_ops)\
 	__DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, NULL, __match, __core_ops)
 
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
index 55d9cc487916..dfb4749bf69c 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -92,6 +92,8 @@ struct scmi_xfers_info {
  * @gid: A reference for per-protocol devres management.
  * @users: A refcount to track effective users of this protocol.
  * @priv: Reference for optional protocol private data.
+ * @pno: A protocol instance notifier descriptor: active only when the
+ *	 included notifier block @nb is non-NULL.
  * @version: Protocol version supported by the platform as detected at runtime.
  * @negotiated_version: When the platform supports a newer protocol version,
  *			the agent will try to negotiate with the platform the
@@ -111,6 +113,7 @@ struct scmi_protocol_instance {
 	void				*gid;
 	refcount_t			users;
 	void				*priv;
+	struct scmi_protocol_notifier   pno;
 	unsigned int			version;
 	unsigned int			negotiated_version;
 	struct scmi_protocol_handle	ph;
@@ -1687,6 +1690,24 @@ static void *scmi_get_protocol_priv(const struct scmi_protocol_handle *ph)
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
@@ -2297,6 +2318,7 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
 	pi->ph.hops = &helpers_ops;
 	pi->ph.set_priv = scmi_set_protocol_priv;
 	pi->ph.get_priv = scmi_get_protocol_priv;
+	pi->ph.instance_notifier_register = scmi_register_instance_notifier;
 	refcount_set(&pi->users, 1);
 
 	/*
@@ -2358,12 +2380,12 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
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
@@ -2371,16 +2393,44 @@ scmi_get_protocol_instance(const struct scmi_handle *handle, u8 protocol_id)
 
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
@@ -2396,23 +2446,32 @@ int scmi_protocol_acquire(const struct scmi_handle *handle, u8 protocol_id)
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
@@ -2431,9 +2490,23 @@ void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id)
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
index fa2339209a69..6fe95a79465d 100644
--- a/drivers/firmware/arm_scmi/notify.c
+++ b/drivers/firmware/arm_scmi/notify.c
@@ -1061,6 +1061,44 @@ static int scmi_register_event_handler(struct scmi_notify_instance *ni,
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
@@ -1438,6 +1476,67 @@ static int scmi_notifier_register(const struct scmi_handle *handle,
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
@@ -1495,6 +1594,61 @@ static int scmi_notifier_unregister(const struct scmi_handle *handle,
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
index b295006ef1fd..d1f1bde8a7cc 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -175,6 +175,13 @@ struct scmi_proto_helpers_ops;
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
@@ -194,6 +201,9 @@ struct scmi_protocol_handle {
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

