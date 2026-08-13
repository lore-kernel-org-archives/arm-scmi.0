Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47ED366DA5
	for <arm-scmi@vger.kernel.org>; Thu, 13 Aug 2026 11:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786620816; cv=none; b=XDwqwYKHh4CyLJaSNaWYyZA9mdshwApfjoL5wAuSMplkWvWsD++SafRz58WJdT9UJCRGZJ3tUq9aqqGuyOZgIJO0V+OoDO0+XEAFNyfKVIMkI7m1aHegiio7GiD90YEjhrV5vF/JRmPV1Tmt/ouNoJ7+nGnGYUZM588415xjJcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786620816; c=relaxed/simple;
	bh=znVv1CkIwsHMAd1kejN0EZHBhazc0s/ctJLO1YsiAMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UkzX0vTeD98IoDUUrXNWmvBKUsgtH28BVu5ta4Q/MomJWhaf7vEFIG2JGXftbi6AbWFB70GSGIweCmGyYOzWON8gBlnn9ENgfTYlubzQfsmLzdEwkk9+Lk9/E2XE/vYmTZSjtKBu6TKWRZrSt76HGQnGW/gf1AzmNABi/Bpo/XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OL0kaAKs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OL0kaAKs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DBC41F000E9;
	Thu, 13 Aug 2026 11:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786620814;
	bh=u1FIo7UaO27ajeNiuwJfSdqSr3/t/PA5OWV6gmfdpag=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OL0kaAKsOh9SG7dwHoOxyBvshDi5pRAKxTjLFGXhcTRbn7SPStNZuezoQ/SrC85I5
	 LpevjedNbTEVIVrKUwbe2Cfs1YadmBX4UHIXWTEyR8b/iiy/ijXsbkW9Qi0j9LQuKF
	 F/6fBMu9mILotQmC5jetdittIK27GS6MIK0SBXscYtzHpNO7GqtjKORZTP1IQkKdPu
	 6zcJ2fNmQjuT3C0ZPX65MRyhEckLLBZu40Osxn/Aybr+sC2zvuFPq/4Xxb++AAhzRa
	 aTVxxPcD45fzrI3vNn0gcbt3k/g5dgsTp2CDmqKuEDU2kRVfwd9jcmX+O5sytGxQue
	 ZOhUI3zEoGlvw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 13 Aug 2026 12:32:58 +0100
Subject: [PATCH v3 3/9] firmware: arm_scmi: Convert OF-only paths to
 generic fwnode in SCMI core
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-acpi_scmi_pcc-v3-3-cb6b88b4ebb3@kernel.org>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
In-Reply-To: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-team@meta.com
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15.2

Switch SCMI core plumbing from struct device_node * to struct
fwnode_handle * so the core can describe SCMI instances and protocols using
firmware nodes rather than OF nodes directly.

This change:
  - Replaces core OF property lookups with fwnode_property_*() helpers.
  - Switches child enumeration to
    fwnode_for_each_available_child_node_scoped().
  - Plumbs fwnode through the SCMI device creation and channel setup paths.
  - Updates transport ->chan_available() callbacks to take a fwnode.
  - Stores per-protocol child fwnodes in info->active_protocols so the core
    can later locate the descriptor for a given protocol ID.
  - Updates mailbox/optee/smc/virtio transports to accept fwnodes and map
    back to OF nodes where their existing parsing remains DT-specific.

DT-only transports such as mailbox, OP-TEE and SMC still parse DT
properties by mapping the fwnode back to an OF node. On non-DT systems
these transports report no channel available.

This is a mechanical step towards firmware-node neutrality and prepares the
SCMI core for non-DT transports, such as an ACPI/PCC transport. DT users
continue to work unchanged; no non-DT transport is enabled by this patch.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/bus.c                |  37 ++++-----
 drivers/firmware/arm_scmi/common.h             |   9 +-
 drivers/firmware/arm_scmi/driver.c             | 110 +++++++++++++------------
 drivers/firmware/arm_scmi/transports/mailbox.c |   6 +-
 drivers/firmware/arm_scmi/transports/optee.c   |   6 +-
 drivers/firmware/arm_scmi/transports/smc.c     |  11 ++-
 drivers/firmware/arm_scmi/transports/virtio.c  |   2 +-
 7 files changed, 98 insertions(+), 83 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index e060edbe7e83..a86fa18fc5d2 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -9,7 +9,7 @@
 
 #include <linux/types.h>
 #include <linux/module.h>
-#include <linux/of.h>
+#include <linux/property.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/device.h>
@@ -429,17 +429,16 @@ static void scmi_device_release(struct device *dev)
 	struct scmi_device *scmi_dev = to_scmi_dev(dev);
 
 	scmi_device_release_resources(scmi_dev);
-	of_node_put(dev->of_node);
+	fwnode_handle_put(dev_fwnode(dev));
 	kfree_const(scmi_dev->name);
 	kfree(scmi_dev);
 }
 
 static void __scmi_device_destroy(struct scmi_device *scmi_dev)
 {
-	pr_debug("(%pOF) Destroying SCMI device '%s' for protocol 0x%x (%s)\n",
-		 scmi_dev->dev.parent->of_node,
-		 dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
-		 scmi_dev->name);
+	pr_debug("(%pfwf) Destroying SCMI device '%s' for protocol 0x%x (%s)\n",
+		 dev_fwnode(&scmi_dev->dev), dev_name(&scmi_dev->dev),
+		 scmi_dev->protocol_id, scmi_dev->name);
 
 	device_del(&scmi_dev->dev);
 	scmi_device_release_resources(scmi_dev);
@@ -447,7 +446,7 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
 }
 
 static struct scmi_device *
-__scmi_device_create(struct device_node *np, struct device *parent,
+__scmi_device_create(struct fwnode_handle *fwnode, struct device *parent,
 		     int protocol, const char *name)
 {
 	int id, retval;
@@ -458,7 +457,7 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 	 * If the same protocol/name device already exist under the same parent
 	 * (i.e. SCMI instance) just return the existent device.
 	 * This avoids any race between the SCMI driver, creating devices for
-	 * each DT defined protocol at probe time, and the concurrent
+	 * each fwnode defined protocol at probe time, and the concurrent
 	 * registration of SCMI drivers.
 	 */
 	scmi_dev = scmi_child_dev_find_get(parent, protocol, name);
@@ -495,7 +494,7 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 
 	scmi_dev->id = id;
 	scmi_dev->dev.parent = parent;
-	device_set_node(&scmi_dev->dev, of_fwnode_handle(of_node_get(np)));
+	device_set_node(&scmi_dev->dev, fwnode_handle_get(fwnode));
 	scmi_dev->dev.bus = &scmi_bus_type;
 	scmi_dev->dev.release = scmi_device_release;
 	dev_set_name(&scmi_dev->dev, "scmi_dev.%d", id);
@@ -504,8 +503,8 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 	if (retval)
 		goto put_dev;
 
-	pr_debug("(%pOF) Created SCMI device '%s' for protocol 0x%x (%s)\n",
-		 parent->of_node, dev_name(&scmi_dev->dev), protocol, name);
+	pr_debug("(%pfwf) Created SCMI device '%s' - protocol 0x%x (%s)\n",
+		 fwnode, dev_name(&scmi_dev->dev), protocol, name);
 
 	return scmi_dev;
 put_dev:
@@ -521,15 +520,15 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 }
 
 static struct scmi_device *
-_scmi_device_create(struct device_node *np, struct device *parent,
+_scmi_device_create(struct fwnode_handle *fwnode, struct device *parent,
 		    int protocol, const char *name)
 {
 	struct scmi_device *sdev;
 
-	sdev = __scmi_device_create(np, parent, protocol, name);
+	sdev = __scmi_device_create(fwnode, parent, protocol, name);
 	if (!sdev)
-		pr_err("(%pOF) Failed to create device for protocol 0x%x (%s)\n",
-		       parent->of_node, protocol, name);
+		pr_err("(%pfwf) Failed to create device - protocol 0x%x (%s)\n",
+		       fwnode, protocol, name);
 
 	return sdev;
 }
@@ -537,7 +536,7 @@ _scmi_device_create(struct device_node *np, struct device *parent,
 /**
  * scmi_device_create  - A method to create one or more SCMI devices
  *
- * @np: A reference to the device node to use for the new device(s)
+ * @fwnode: A reference to the device node to use for the new device(s)
  * @parent: The parent device to use identifying a specific SCMI instance
  * @protocol: The SCMI protocol to be associated with this device
  * @name: The requested-name of the device to be created; this is optional
@@ -557,7 +556,7 @@ _scmi_device_create(struct device_node *np, struct device *parent,
  *	   could have been potentially created for a whole protocol, unless no
  *	   device was found to have been requested for that specific protocol.
  */
-struct scmi_device *scmi_device_create(struct device_node *np,
+struct scmi_device *scmi_device_create(struct fwnode_handle *fwnode,
 				       struct device *parent, int protocol,
 				       const char *name)
 {
@@ -566,7 +565,7 @@ struct scmi_device *scmi_device_create(struct device_node *np,
 	struct scmi_device *scmi_dev = NULL;
 
 	if (name)
-		return _scmi_device_create(np, parent, protocol, name);
+		return _scmi_device_create(fwnode, parent, protocol, name);
 
 	mutex_lock(&scmi_requested_devices_mtx);
 	phead = idr_find(&scmi_requested_devices, protocol);
@@ -580,7 +579,7 @@ struct scmi_device *scmi_device_create(struct device_node *np,
 	list_for_each_entry(rdev, phead, node) {
 		struct scmi_device *sdev;
 
-		sdev = _scmi_device_create(np, parent,
+		sdev = _scmi_device_create(fwnode, parent,
 					   rdev->id_table->protocol_id,
 					   rdev->id_table->name);
 		if (sdev)
diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index 0b896171faa2..042867c28b88 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -153,7 +153,7 @@ extern const struct bus_type scmi_bus_type;
 #define SCMI_BUS_NOTIFY_DEVICE_UNREQUEST	1
 extern struct blocking_notifier_head scmi_requested_devices_nh;
 
-struct scmi_device *scmi_device_create(struct device_node *np,
+struct scmi_device *scmi_device_create(struct fwnode_handle *fwnode,
 				       struct device *parent, int protocol,
 				       const char *name);
 void scmi_device_destroy(struct device *parent, int protocol, const char *name);
@@ -207,7 +207,7 @@ struct scmi_chan_info {
  * @poll_done: Callback to poll transfer status
  */
 struct scmi_transport_ops {
-	bool (*chan_available)(struct device_node *of_node, int idx);
+	bool (*chan_available)(struct fwnode_handle *fwnode, int idx);
 	int (*chan_setup)(struct scmi_chan_info *cinfo, struct device *dev,
 			  bool tx);
 	int (*chan_free)(int id, void *p, void *data);
@@ -233,7 +233,7 @@ struct scmi_transport_ops {
  *	be pending simultaneously in the system. May be overridden by the
  *	get_max_msg op.
  * @max_msg_size: Maximum size of data payload per message that can be handled.
- * @atomic_threshold: Optional system wide DT-configured threshold, expressed
+ * @atomic_threshold: Optional system wide fwnode-configured threshold, expressed
  *		      in microseconds, for atomic operations.
  *		      Only SCMI synchronous commands reported by the platform
  *		      to have an execution latency lesser-equal to the threshold
@@ -241,7 +241,8 @@ struct scmi_transport_ops {
  *		      decision is finally left up to the SCMI drivers.
  * @no_completion_irq: Flag to indicate that this transport has no completion
  *		       interrupt and has to be polled. This is similar to the
- *		       force_polling below, except this is set via DT property.
+ *		       force_polling below, except this is set via fwnode
+ *		       property.
  * @force_polling: Flag to force this whole transport to use SCMI core polling
  *		   mechanism instead of completion interrupts even if available.
  * @sync_cmds_completed_on_ret: Flag to indicate that the transport assures
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index ef29fd223287..9014723e0f7f 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -30,7 +30,7 @@
 #include <linux/hashtable.h>
 #include <linux/list.h>
 #include <linux/module.h>
-#include <linux/of.h>
+#include <linux/property.h>
 #include <linux/platform_device.h>
 #include <linux/processor.h>
 #include <linux/rcupdate.h>
@@ -102,7 +102,7 @@ struct scmi_xfers_info {
  *	initialization code to identify this instance.
  *
  * Each protocol is initialized independently once for each SCMI platform in
- * which is defined by DT and implemented by the SCMI server fw.
+ * which is defined by fwnode and implemented by the SCMI server fw.
  */
 struct scmi_protocol_instance {
 	const struct scmi_handle	*handle;
@@ -137,8 +137,9 @@ struct scmi_protocol_instance {
  * @protocols_imp: List of protocols implemented, currently maximum of
  *		   scmi_base_info.num_protocols elements allocated by the
  *		   base protocol
- * @active_protocols: IDR storing device_nodes for protocols actually defined
- *		      in the DT and confirmed as implemented by fw.
+ * @active_protocols: IDR storing fwnodes for protocols actually defined
+ *		      in the firmware description and confirmed as implemented
+ *		      by fw.
  * @notify_priv: Pointer to private data structure specific to notifications.
  * @node: List head
  * @users: Number of users of this instance
@@ -416,19 +417,19 @@ EXPORT_SYMBOL_GPL(scmi_protocol_unregister);
  * scmi_create_protocol_devices  - Create devices for all pending requests for
  * this SCMI instance.
  *
- * @np: The device node describing the protocol
+ * @fwnode: The firmware node describing the protocol
  * @info: The SCMI instance descriptor
  * @prot_id: The protocol ID
  * @name: The optional name of the device to be created: if not provided this
  *	  call will lead to the creation of all the devices currently requested
  *	  for the specified protocol.
  */
-static void scmi_create_protocol_devices(struct device_node *np,
+static void scmi_create_protocol_devices(struct fwnode_handle *fwnode,
 					 struct scmi_info *info,
 					 int prot_id, const char *name)
 {
 	mutex_lock(&info->devreq_mtx);
-	scmi_device_create(np, info->dev, prot_id, name);
+	scmi_device_create(fwnode, info->dev, prot_id, name);
 	mutex_unlock(&info->devreq_mtx);
 }
 
@@ -752,9 +753,10 @@ struct scmi_xfer *scmi_xfer_raw_get(const struct scmi_handle *handle)
  * @protocol_id: Identifier of the protocol
  *
  * Note that in a regular SCMI stack, usually, a protocol has to be defined in
- * the DT to have an associated channel and be usable; but in Raw mode any
- * protocol in range is allowed, re-using the Base channel, so as to enable
- * fuzzing on any protocol without the need of a fully compiled DT.
+ * the firmware description to have an associated channel and be usable; but in
+ * Raw mode any protocol in range is allowed, re-using the Base channel, so as
+ * to enable fuzzing on any protocol without the need of a fully compiled
+ * firmware description.
  *
  * Return: A reference to the channel to use, or an ERR_PTR
  */
@@ -768,7 +770,7 @@ scmi_xfer_raw_channel_get(const struct scmi_handle *handle, u8 protocol_id)
 	if (!cinfo) {
 		if (protocol_id == SCMI_PROTOCOL_BASE)
 			return ERR_PTR(-EINVAL);
-		/* Use Base channel for protocols not defined for DT */
+		/* Use Base channel for protocols not defined for fwnode */
 		cinfo = idr_find(&info->tx_idr, SCMI_PROTOCOL_BASE);
 		if (!cinfo)
 			return ERR_PTR(-EINVAL);
@@ -2749,7 +2751,7 @@ static int scmi_xfer_info_init(struct scmi_info *sinfo)
 	return ret;
 }
 
-static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
+static int scmi_chan_setup(struct scmi_info *info, struct fwnode_handle *fwnode,
 			   int prot_id, bool tx)
 {
 	int ret, idx;
@@ -2765,7 +2767,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 	if (idr_find(idr, prot_id))
 		return -EEXIST;
 
-	if (!info->desc->ops->chan_available(of_node, idx)) {
+	if (!info->desc->ops->chan_available(fwnode, idx)) {
 		cinfo = idr_find(idr, SCMI_PROTOCOL_BASE);
 		if (unlikely(!cinfo)) /* Possible only if platform has no Rx */
 			return -EINVAL;
@@ -2785,7 +2787,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 	snprintf(name, sizeof(name), SCMI_TRANSPORT_DEVNAME_PREFIX "_%s_%02X",
 		 idx ? "rx" : "tx", prot_id);
 	/* Create a uniquely named, dedicated transport device for this chan */
-	tdev = scmi_device_create(of_node, info->dev, prot_id, name);
+	tdev = scmi_device_create(fwnode, info->dev, prot_id, name);
 	if (!tdev) {
 		dev_err(info->dev,
 			"failed to create transport device (%s)\n", name);
@@ -2831,14 +2833,14 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 }
 
 static inline int
-scmi_txrx_setup(struct scmi_info *info, struct device_node *of_node,
+scmi_txrx_setup(struct scmi_info *info, struct fwnode_handle *fwnode,
 		int prot_id)
 {
-	int ret = scmi_chan_setup(info, of_node, prot_id, true);
+	int ret = scmi_chan_setup(info, fwnode, prot_id, true);
 
 	if (!ret) {
 		/* Rx is optional, report only memory errors */
-		ret = scmi_chan_setup(info, of_node, prot_id, false);
+		ret = scmi_chan_setup(info, fwnode, prot_id, false);
 		if (ret && ret != -ENOMEM)
 			ret = 0;
 	}
@@ -2855,15 +2857,15 @@ scmi_txrx_setup(struct scmi_info *info, struct device_node *of_node,
  *
  * @info: The SCMI instance descriptor.
  *
- * Initialize all the channels found described in the DT against the underlying
- * configured transport using custom defined dedicated devices instead of
- * borrowing devices from the SCMI drivers; this way channels are initialized
+ * Initialize all the channels found described in the fwnode against the
+ * underlying configured transport using custom defined dedicated devices instead
+ * of borrowing devices from the SCMI drivers; this way channels are initialized
  * upfront during core SCMI stack probing and are no more coupled with SCMI
  * devices used by SCMI drivers.
  *
  * Note that, even though a pair of TX/RX channels is associated to each
- * protocol defined in the DT, a distinct freshly initialized channel is
- * created only if the DT node for the protocol at hand describes a dedicated
+ * protocol defined in the fwnode, a distinct freshly initialized channel is
+ * created only if the fwnode for the protocol at hand describes a dedicated
  * channel: in all the other cases the common BASE protocol channel is reused.
  *
  * Return: 0 on Success
@@ -2871,17 +2873,17 @@ scmi_txrx_setup(struct scmi_info *info, struct device_node *of_node,
 static int scmi_channels_setup(struct scmi_info *info)
 {
 	int ret;
-	struct device_node *top_np = info->dev->of_node;
+	struct fwnode_handle *fwnode = dev_fwnode(info->dev);
 
 	/* Initialize a common generic channel at first */
-	ret = scmi_txrx_setup(info, top_np, SCMI_PROTOCOL_BASE);
+	ret = scmi_txrx_setup(info, fwnode, SCMI_PROTOCOL_BASE);
 	if (ret)
 		return ret;
 
-	for_each_available_child_of_node_scoped(top_np, child) {
+	fwnode_for_each_available_child_node_scoped(fwnode, child) {
 		u32 prot_id;
 
-		if (of_property_read_u32(child, "reg", &prot_id))
+		if (fwnode_property_read_u32(child, "reg", &prot_id))
 			continue;
 
 		if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id)) {
@@ -2969,14 +2971,14 @@ static int scmi_bus_notifier(struct notifier_block *nb,
 static int scmi_device_request_notifier(struct notifier_block *nb,
 					unsigned long action, void *data)
 {
-	struct device_node *np;
+	struct fwnode_handle *fwnode;
 	struct scmi_device_id *id_table = data;
 	struct scmi_info *info = req_nb_to_scmi_info(nb);
 
 	rcu_read_lock();
-	np = idr_find(&info->active_protocols, id_table->protocol_id);
+	fwnode = idr_find(&info->active_protocols, id_table->protocol_id);
 	rcu_read_unlock();
-	if (!np)
+	if (!fwnode)
 		return NOTIFY_DONE;
 
 	dev_dbg(info->dev, "%sRequested device (%s) for protocol 0x%x\n",
@@ -2985,7 +2987,7 @@ static int scmi_device_request_notifier(struct notifier_block *nb,
 
 	switch (action) {
 	case SCMI_BUS_NOTIFY_DEVICE_REQUEST:
-		scmi_create_protocol_devices(np, info, id_table->protocol_id,
+		scmi_create_protocol_devices(fwnode, info, id_table->protocol_id,
 					     id_table->name);
 		break;
 	case SCMI_BUS_NOTIFY_DEVICE_UNREQUEST:
@@ -3072,13 +3074,14 @@ static struct scmi_debug_info *scmi_debugfs_common_setup(struct scmi_info *info)
 	if (!dbg)
 		return NULL;
 
-	dbg->name = kstrdup(of_node_full_name(info->dev->of_node), GFP_KERNEL);
+	dbg->name = kstrdup(fwnode_get_name(dev_fwnode(info->dev)), GFP_KERNEL);
 	if (!dbg->name) {
 		devm_kfree(info->dev, dbg);
 		return NULL;
 	}
 
-	of_property_read_string(info->dev->of_node, "compatible", &c_ptr);
+	fwnode_property_read_string(dev_fwnode(info->dev), "compatible",
+				    &c_ptr);
 	dbg->type = kstrdup(c_ptr, GFP_KERNEL);
 	if (!dbg->type) {
 		kfree(dbg->name);
@@ -3184,23 +3187,23 @@ static const struct scmi_desc *scmi_transport_setup(struct device *dev)
 
 	dev_info(dev, "Using %s\n", dev_driver_string(trans->supplier));
 
-	ret = of_property_read_u32(dev->of_node, "arm,max-rx-timeout-ms",
-				   &trans->desc.max_rx_timeout_ms);
+	ret = fwnode_property_read_u32(dev_fwnode(dev), "arm,max-rx-timeout-ms",
+				       &trans->desc.max_rx_timeout_ms);
 	if (ret && ret != -EINVAL)
-		dev_err(dev, "Malformed arm,max-rx-timeout-ms DT property.\n");
+		dev_err(dev, "Malformed arm,max-rx-timeout-ms property.\n");
 
-	ret = of_property_read_u32(dev->of_node, "arm,max-msg-size",
-				   &trans->desc.max_msg_size);
+	ret = fwnode_property_read_u32(dev_fwnode(dev), "arm,max-msg-size",
+				       &trans->desc.max_msg_size);
 	if (ret && ret != -EINVAL)
-		dev_err(dev, "Malformed arm,max-msg-size DT property.\n");
+		dev_err(dev, "Malformed arm,max-msg-size property.\n");
 
-	ret = of_property_read_u32(dev->of_node, "arm,max-msg",
-				   &trans->desc.max_msg);
+	ret = fwnode_property_read_u32(dev_fwnode(dev), "arm,max-msg",
+				       &trans->desc.max_msg);
 	if (ret && ret != -EINVAL)
-		dev_err(dev, "Malformed arm,max-msg DT property.\n");
+		dev_err(dev, "Malformed arm,max-msg property.\n");
 
-	trans->desc.no_completion_irq = of_property_read_bool(dev->of_node,
-							      "arm,no-completion-irq");
+	trans->desc.no_completion_irq =
+		fwnode_property_read_bool(dev_fwnode(dev), "arm,no-completion-irq");
 
 	dev_info(dev,
 		 "SCMI max-rx-timeout: %dms / max-msg-size: %dbytes / max-msg: %d\n",
@@ -3208,8 +3211,8 @@ static const struct scmi_desc *scmi_transport_setup(struct device *dev)
 		 trans->desc.max_msg);
 
 	/* System wide atomic threshold for atomic ops .. if any */
-	if (!of_property_read_u32(dev->of_node, "atomic-threshold-us",
-				  &trans->desc.atomic_threshold))
+	if (!fwnode_property_read_u32(dev_fwnode(dev), "atomic-threshold-us",
+				      &trans->desc.atomic_threshold))
 		dev_info(dev,
 			 "SCMI System wide atomic threshold set to %u us\n",
 			 trans->desc.atomic_threshold);
@@ -3238,7 +3241,6 @@ static int scmi_probe(struct platform_device *pdev)
 	struct scmi_info *info;
 	bool coex = IS_ENABLED(CONFIG_ARM_SCMI_RAW_MODE_SUPPORT_COEX);
 	struct device *dev = &pdev->dev;
-	struct device_node *child, *np = dev->of_node;
 
 	desc = scmi_transport_setup(dev);
 	if (!desc) {
@@ -3277,7 +3279,7 @@ static int scmi_probe(struct platform_device *pdev)
 	handle->devm_protocol_put = scmi_devm_protocol_put;
 	handle->is_transport_atomic = scmi_is_transport_atomic;
 
-	/* Setup all channels described in the DT at first */
+	/* Setup all channels described in the fwnode at first */
 	ret = scmi_channels_setup(info);
 	if (ret) {
 		err_str = "failed to setup channels\n";
@@ -3352,10 +3354,10 @@ static int scmi_probe(struct platform_device *pdev)
 
 	scmi_enable_matching_quirks(info);
 
-	for_each_available_child_of_node(np, child) {
+	fwnode_for_each_available_child_node_scoped(dev_fwnode(dev), child) {
 		u32 prot_id;
 
-		if (of_property_read_u32(child, "reg", &prot_id))
+		if (fwnode_property_read_u32(child, "reg", &prot_id))
 			continue;
 
 		if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id)) {
@@ -3370,8 +3372,8 @@ static int scmi_probe(struct platform_device *pdev)
 		}
 
 		/*
-		 * Save this valid DT protocol descriptor amongst
-		 * @active_protocols for this SCMI instance/
+		 * Save this valid fwnode protocol descriptor amongst
+		 * @active_protocols for this SCMI instance.
 		 */
 		ret = idr_alloc(&info->active_protocols, child,
 				prot_id, prot_id + 1, GFP_KERNEL);
@@ -3381,7 +3383,7 @@ static int scmi_probe(struct platform_device *pdev)
 			continue;
 		}
 
-		of_node_get(child);
+		fwnode_handle_get(child);
 		scmi_create_protocol_devices(child, info, prot_id, NULL);
 	}
 
@@ -3409,7 +3411,7 @@ static void scmi_remove(struct platform_device *pdev)
 {
 	int id;
 	struct scmi_info *info = platform_get_drvdata(pdev);
-	struct device_node *child;
+	struct fwnode_handle *child;
 
 	if (IS_ENABLED(CONFIG_ARM_SCMI_RAW_MODE_SUPPORT))
 		scmi_raw_mode_cleanup(info->raw);
@@ -3434,7 +3436,7 @@ static void scmi_remove(struct platform_device *pdev)
 	mutex_unlock(&info->protocols_mtx);
 
 	idr_for_each_entry(&info->active_protocols, child, id)
-		of_node_put(child);
+		fwnode_handle_put(child);
 	idr_destroy(&info->active_protocols);
 
 	bus_unregister_notifier(&scmi_bus_type, &info->bus_nb);
diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index 308736c3ead9..b692cae4ff25 100644
--- a/drivers/firmware/arm_scmi/transports/mailbox.c
+++ b/drivers/firmware/arm_scmi/transports/mailbox.c
@@ -77,9 +77,13 @@ static void rx_callback(struct mbox_client *cl, void *m)
 		      core->shmem->read_header(smbox->shmem), NULL);
 }
 
-static bool mailbox_chan_available(struct device_node *of_node, int idx)
+static bool mailbox_chan_available(struct fwnode_handle *fwnode, int idx)
 {
 	int num_mb;
+	struct device_node *of_node = to_of_node(fwnode);
+
+	if (!of_node)
+		return false;
 
 	/*
 	 * Just check if bidirrectional channels are involved, and check the
diff --git a/drivers/firmware/arm_scmi/transports/optee.c b/drivers/firmware/arm_scmi/transports/optee.c
index dbe32e141748..07d3affa0964 100644
--- a/drivers/firmware/arm_scmi/transports/optee.c
+++ b/drivers/firmware/arm_scmi/transports/optee.c
@@ -314,9 +314,13 @@ static int invoke_process_msg_channel(struct scmi_optee_channel *channel, size_t
 	return 0;
 }
 
-static bool scmi_optee_chan_available(struct device_node *of_node, int idx)
+static bool scmi_optee_chan_available(struct fwnode_handle *fwnode, int idx)
 {
 	u32 channel_id;
+	struct device_node *of_node = to_of_node(fwnode);
+
+	if (!of_node)
+		return false;
 
 	return !of_property_read_u32_index(of_node, "linaro,optee-channel-id",
 					   idx, &channel_id);
diff --git a/drivers/firmware/arm_scmi/transports/smc.c b/drivers/firmware/arm_scmi/transports/smc.c
index 1fce3ccdeb7f..1079cd01190b 100644
--- a/drivers/firmware/arm_scmi/transports/smc.c
+++ b/drivers/firmware/arm_scmi/transports/smc.c
@@ -84,10 +84,15 @@ static irqreturn_t smc_msg_done_isr(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static bool smc_chan_available(struct device_node *of_node, int idx)
+static bool smc_chan_available(struct fwnode_handle *fwnode, int idx)
 {
-	struct device_node *np __free(device_node) =
-					of_parse_phandle(of_node, "shmem", 0);
+	struct device_node *of_node = to_of_node(fwnode);
+	struct device_node *np __free(device_node) = NULL;
+
+	if (!of_node)
+		return false;
+
+	np = of_parse_phandle(of_node, "shmem", 0);
 	if (!np)
 		return false;
 
diff --git a/drivers/firmware/arm_scmi/transports/virtio.c b/drivers/firmware/arm_scmi/transports/virtio.c
index 3282d8271839..6b060d61e0ca 100644
--- a/drivers/firmware/arm_scmi/transports/virtio.c
+++ b/drivers/firmware/arm_scmi/transports/virtio.c
@@ -375,7 +375,7 @@ static unsigned int virtio_get_max_msg(struct scmi_chan_info *base_cinfo)
 	return vioch->max_msg;
 }
 
-static bool virtio_chan_available(struct device_node *of_node, int idx)
+static bool virtio_chan_available(struct fwnode_handle *fwnode, int idx)
 {
 	struct scmi_vio_channel *channels, *vioch = NULL;
 

-- 
2.43.0

