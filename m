Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1D761917F1
	for <arm-scmi@vger.kernel.org>; Fri, 17 Oct 2025 13:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760707456; cv=none; b=PajqCsQzL2A1+bC6vv4fpiP9Idcq9zYXGNJSAJeERFwugHJZXpAxCX+vCBhQbFRFnuLN+2sSW5ZPnKNqQcPHu9KhRAa7x401Cb4b3y4oDZLyna7UE0/a3GeD3vKiwY6FF78saLBG+9WwyWGOR6r3eC0ZPirZKWnndv4r6iCgztc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760707456; c=relaxed/simple;
	bh=zkfTfEhDHghH7jhiC8pD5T4H5NcuHFMVY4K/jTGQk00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=tToh/pEVCpvacT6a5aCf0xDCdvMSvwW/2e+AKr3yYrvGAMZLTHIbe90S3pzMCmgiUfkKz1cV6Nsijzl+KgfYV5ZBx5Hl9Fp9CQn5YBo8oIvghYBcjbw4VtB47YdT61aDMLaZPC+ZJPgY7M2yxAUj1pE9nR9fK6PsknTXxeSmE0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41C7D1C25;
	Fri, 17 Oct 2025 06:24:05 -0700 (PDT)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4DF113F66E;
	Fri, 17 Oct 2025 06:24:12 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 17 Oct 2025 14:23:46 +0100
Subject: [PATCH 3/8] firmware: arm_scmi: Convert OF-only paths to generic
 fwnode in SCMI core
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-acpi_scmi_pcc-v1-3-0adbab7709d9@arm.com>
References: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
In-Reply-To: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Sudeep Holla <sudeep.holla@arm.com>
X-Mailer: b4 0.14.3

Switch SCMI core plumbing from struct device_node* to struct
fwnode_handle* so transports and core code work with both DT and
ACPI firmware descriptions.

This change:
  - Replaces of_* property lookups with fwnode_property_*() helpers.
  - Switches child enumeration to
    fwnode_for_each_available_child_node_scoped().
  - Plumbs fwnode through the SCMI device creation and channel setup
    paths and updates transport ->chan_available() signatures to take a
    fwnode.
  - Stores the per-protocol child fwnodes in info->active_protocols so
    the core can later locate the descriptor for a given protocol ID.
  - Update mailbox/optee/smc/virtio transports to accept fwnode and
    map to OF nodes where needed

DT-only transports (mailbox/optee/smc) still parse DT properties by
mapping the fwnode back to an OF node; on non-DT (e.g. ACPI) systems
these transports will report no channel available.

This refactor is a prerequisite for adding an ACPI-first transport like
PCC and brings the SCMI core closer to DT/ACPI parity. This is a mechanical
step towards firmware-node neutrality; DT users continue to work unchanged,
and ACPI paths can be enabled on top.

No functional change is expected on DT platforms; ACPI platforms can now
discover and participate in SCMI where a suitable transport is present.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_scmi/bus.c                |  33 ++++----
 drivers/firmware/arm_scmi/common.h             |   6 +-
 drivers/firmware/arm_scmi/driver.c             | 104 ++++++++++++-------------
 drivers/firmware/arm_scmi/transports/mailbox.c |   3 +-
 drivers/firmware/arm_scmi/transports/optee.c   |   3 +-
 drivers/firmware/arm_scmi/transports/smc.c     |   3 +-
 drivers/firmware/arm_scmi/transports/virtio.c  |   2 +-
 7 files changed, 78 insertions(+), 76 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index c7698cfaa4e8..a20f2ac65a65 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -401,10 +401,9 @@ static void scmi_device_release(struct device *dev)
 
 static void __scmi_device_destroy(struct scmi_device *scmi_dev)
 {
-	pr_debug("(%pOF) Destroying SCMI device '%s' for protocol 0x%x (%s)\n",
-		 scmi_dev->dev.parent->of_node,
-		 dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
-		 scmi_dev->name);
+	pr_debug("(%pfwf) Destroying SCMI device '%s' for protocol 0x%x (%s)\n",
+		 dev_fwnode(&scmi_dev->dev), dev_name(&scmi_dev->dev),
+		 scmi_dev->protocol_id, scmi_dev->name);
 
 	if (scmi_dev->protocol_id == SCMI_PROTOCOL_SYSTEM)
 		atomic_set(&scmi_syspower_registered, 0);
@@ -414,7 +413,7 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
 }
 
 static struct scmi_device *
-__scmi_device_create(struct device_node *np, struct device *parent,
+__scmi_device_create(struct fwnode_handle *fwnode, struct device *parent,
 		     int protocol, const char *name)
 {
 	int id, retval;
@@ -424,7 +423,7 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 	 * If the same protocol/name device already exist under the same parent
 	 * (i.e. SCMI instance) just return the existent device.
 	 * This avoids any race between the SCMI driver, creating devices for
-	 * each DT defined protocol at probe time, and the concurrent
+	 * each fwnode defined protocol at probe time, and the concurrent
 	 * registration of SCMI drivers.
 	 */
 	scmi_dev = scmi_child_dev_find(parent, protocol, name);
@@ -465,7 +464,7 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 	scmi_dev->id = id;
 	scmi_dev->protocol_id = protocol;
 	scmi_dev->dev.parent = parent;
-	device_set_node(&scmi_dev->dev, of_fwnode_handle(np));
+	device_set_node(&scmi_dev->dev, fwnode);
 	scmi_dev->dev.bus = &scmi_bus_type;
 	scmi_dev->dev.release = scmi_device_release;
 	dev_set_name(&scmi_dev->dev, "scmi_dev.%d", id);
@@ -474,8 +473,8 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 	if (retval)
 		goto put_dev;
 
-	pr_debug("(%pOF) Created SCMI device '%s' for protocol 0x%x (%s)\n",
-		 parent->of_node, dev_name(&scmi_dev->dev), protocol, name);
+	pr_debug("(%pfwf) Created SCMI device '%s' - protocol 0x%x (%s)\n",
+		 fwnode, dev_name(&scmi_dev->dev), protocol, name);
 
 	return scmi_dev;
 put_dev:
@@ -485,15 +484,15 @@ __scmi_device_create(struct device_node *np, struct device *parent,
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
@@ -501,7 +500,7 @@ _scmi_device_create(struct device_node *np, struct device *parent,
 /**
  * scmi_device_create  - A method to create one or more SCMI devices
  *
- * @np: A reference to the device node to use for the new device(s)
+ * @fwnode: A reference to the device node to use for the new device(s)
  * @parent: The parent device to use identifying a specific SCMI instance
  * @protocol: The SCMI protocol to be associated with this device
  * @name: The requested-name of the device to be created; this is optional
@@ -521,7 +520,7 @@ _scmi_device_create(struct device_node *np, struct device *parent,
  *	   could have been potentially created for a whole protocol, unless no
  *	   device was found to have been requested for that specific protocol.
  */
-struct scmi_device *scmi_device_create(struct device_node *np,
+struct scmi_device *scmi_device_create(struct fwnode_handle *fwnode,
 				       struct device *parent, int protocol,
 				       const char *name)
 {
@@ -530,7 +529,7 @@ struct scmi_device *scmi_device_create(struct device_node *np,
 	struct scmi_device *scmi_dev = NULL;
 
 	if (name)
-		return _scmi_device_create(np, parent, protocol, name);
+		return _scmi_device_create(fwnode, parent, protocol, name);
 
 	mutex_lock(&scmi_requested_devices_mtx);
 	phead = idr_find(&scmi_requested_devices, protocol);
@@ -544,7 +543,7 @@ struct scmi_device *scmi_device_create(struct device_node *np,
 	list_for_each_entry(rdev, phead, node) {
 		struct scmi_device *sdev;
 
-		sdev = _scmi_device_create(np, parent,
+		sdev = _scmi_device_create(fwnode, parent,
 					   rdev->id_table->protocol_id,
 					   rdev->id_table->name);
 		if (sdev)
diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index d038fec72360..4e30283036e5 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -150,7 +150,7 @@ extern const struct bus_type scmi_bus_type;
 #define SCMI_BUS_NOTIFY_DEVICE_UNREQUEST	1
 extern struct blocking_notifier_head scmi_requested_devices_nh;
 
-struct scmi_device *scmi_device_create(struct device_node *np,
+struct scmi_device *scmi_device_create(struct fwnode_handle *fwnode,
 				       struct device *parent, int protocol,
 				       const char *name);
 void scmi_device_destroy(struct device *parent, int protocol, const char *name);
@@ -204,7 +204,7 @@ struct scmi_chan_info {
  * @poll_done: Callback to poll transfer status
  */
 struct scmi_transport_ops {
-	bool (*chan_available)(struct device_node *of_node, int idx);
+	bool (*chan_available)(struct fwnode_handle *fwnode, int idx);
 	int (*chan_setup)(struct scmi_chan_info *cinfo, struct device *dev,
 			  bool tx);
 	int (*chan_free)(int id, void *p, void *data);
@@ -230,7 +230,7 @@ struct scmi_transport_ops {
  *	be pending simultaneously in the system. May be overridden by the
  *	get_max_msg op.
  * @max_msg_size: Maximum size of data payload per message that can be handled.
- * @atomic_threshold: Optional system wide DT-configured threshold, expressed
+ * @atomic_threshold: Optional system wide fwnode-configured threshold, expressed
  *		      in microseconds, for atomic operations.
  *		      Only SCMI synchronous commands reported by the platform
  *		      to have an execution latency lesser-equal to the threshold
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index bd56a877fdfc..bc5fea11b5db 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -29,9 +29,9 @@
 #include <linux/hashtable.h>
 #include <linux/list.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/processor.h>
+#include <linux/property.h>
 #include <linux/refcount.h>
 #include <linux/slab.h>
 #include <linux/xarray.h>
@@ -100,7 +100,7 @@ struct scmi_xfers_info {
  *	initialization code to identify this instance.
  *
  * Each protocol is initialized independently once for each SCMI platform in
- * which is defined by DT and implemented by the SCMI server fw.
+ * which is defined by fwnode and implemented by the SCMI server fw.
  */
 struct scmi_protocol_instance {
 	const struct scmi_handle	*handle;
@@ -152,7 +152,7 @@ struct scmi_debug_info {
  *		   scmi_revision_info.num_protocols elements allocated by the
  *		   base protocol
  * @active_protocols: IDR storing device_nodes for protocols actually defined
- *		      in the DT and confirmed as implemented by fw.
+ *		      in the fwnode and confirmed as implemented by fw.
  * @notify_priv: Pointer to private data structure specific to notifications.
  * @node: List head
  * @users: Number of users of this instance
@@ -430,19 +430,19 @@ EXPORT_SYMBOL_GPL(scmi_protocol_unregister);
  * scmi_create_protocol_devices  - Create devices for all pending requests for
  * this SCMI instance.
  *
- * @np: The device node describing the protocol
+ * @fwnode: The device node describing the protocol
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
 
@@ -766,9 +766,9 @@ struct scmi_xfer *scmi_xfer_raw_get(const struct scmi_handle *handle)
  * @protocol_id: Identifier of the protocol
  *
  * Note that in a regular SCMI stack, usually, a protocol has to be defined in
- * the DT to have an associated channel and be usable; but in Raw mode any
+ * the fwnode to have an associated channel and be usable; but in Raw mode any
  * protocol in range is allowed, re-using the Base channel, so as to enable
- * fuzzing on any protocol without the need of a fully compiled DT.
+ * fuzzing on any protocol without the need of a fully compiled device node.
  *
  * Return: A reference to the channel to use, or an ERR_PTR
  */
@@ -782,7 +782,7 @@ scmi_xfer_raw_channel_get(const struct scmi_handle *handle, u8 protocol_id)
 	if (!cinfo) {
 		if (protocol_id == SCMI_PROTOCOL_BASE)
 			return ERR_PTR(-EINVAL);
-		/* Use Base channel for protocols not defined for DT */
+		/* Use Base channel for protocols not defined for fwnode */
 		cinfo = idr_find(&info->tx_idr, SCMI_PROTOCOL_BASE);
 		if (!cinfo)
 			return ERR_PTR(-EINVAL);
@@ -2667,7 +2667,7 @@ static int scmi_xfer_info_init(struct scmi_info *sinfo)
 	return ret;
 }
 
-static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
+static int scmi_chan_setup(struct scmi_info *info, struct fwnode_handle *fwnode,
 			   int prot_id, bool tx)
 {
 	int ret, idx;
@@ -2680,7 +2680,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 	idx = tx ? 0 : 1;
 	idr = tx ? &info->tx_idr : &info->rx_idr;
 
-	if (!info->desc->ops->chan_available(of_node, idx)) {
+	if (!info->desc->ops->chan_available(fwnode, idx)) {
 		cinfo = idr_find(idr, SCMI_PROTOCOL_BASE);
 		if (unlikely(!cinfo)) /* Possible only if platform has no Rx */
 			return -EINVAL;
@@ -2699,20 +2699,20 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 	snprintf(name, 32, "__scmi_transport_device_%s_%02X",
 		 idx ? "rx" : "tx", prot_id);
 	/* Create a uniquely named, dedicated transport device for this chan */
-	tdev = scmi_device_create(of_node, info->dev, prot_id, name);
+	tdev = scmi_device_create(fwnode, info->dev, prot_id, name);
 	if (!tdev) {
 		dev_err(info->dev,
 			"failed to create transport device (%s)\n", name);
 		devm_kfree(info->dev, cinfo);
 		return -EINVAL;
 	}
-	of_node_get(of_node);
 
 	cinfo->id = prot_id;
 	cinfo->dev = &tdev->dev;
+	fwnode_handle_get(fwnode);
 	ret = info->desc->ops->chan_setup(cinfo, info->dev, tx);
 	if (ret) {
-		of_node_put(of_node);
+		fwnode_handle_put(fwnode);
 		scmi_device_destroy(info->dev, prot_id, name);
 		devm_kfree(info->dev, cinfo);
 		return ret;
@@ -2735,7 +2735,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 			"unable to allocate SCMI idr slot err %d\n", ret);
 		/* Destroy channel and device only if created by this call. */
 		if (tdev) {
-			of_node_put(of_node);
+			fwnode_handle_put(fwnode);
 			scmi_device_destroy(info->dev, prot_id, name);
 			devm_kfree(info->dev, cinfo);
 		}
@@ -2747,14 +2747,14 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
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
@@ -2771,15 +2771,15 @@ scmi_txrx_setup(struct scmi_info *info, struct device_node *of_node,
  *
  * @info: The SCMI instance descriptor.
  *
- * Initialize all the channels found described in the DT against the underlying
+ * Initialize all the channels found described in fwnode against the underlying
  * configured transport using custom defined dedicated devices instead of
  * borrowing devices from the SCMI drivers; this way channels are initialized
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
@@ -2787,17 +2787,17 @@ scmi_txrx_setup(struct scmi_info *info, struct device_node *of_node,
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
 
 		if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id))
@@ -2820,7 +2820,7 @@ static int scmi_chan_destroy(int id, void *p, void *idr)
 		struct scmi_info *info = handle_to_scmi_info(cinfo->handle);
 		struct scmi_device *sdev = to_scmi_dev(cinfo->dev);
 
-		of_node_put(cinfo->dev->of_node);
+		fwnode_handle_put(dev_fwnode(cinfo->dev));
 		scmi_device_destroy(info->dev, id, sdev->name);
 		cinfo->dev = NULL;
 	}
@@ -2881,12 +2881,12 @@ static int scmi_bus_notifier(struct notifier_block *nb,
 static int scmi_device_request_notifier(struct notifier_block *nb,
 					unsigned long action, void *data)
 {
-	struct device_node *np;
+	struct fwnode_handle *fwnode;
 	struct scmi_device_id *id_table = data;
 	struct scmi_info *info = req_nb_to_scmi_info(nb);
 
-	np = idr_find(&info->active_protocols, id_table->protocol_id);
-	if (!np)
+	fwnode = idr_find(&info->active_protocols, id_table->protocol_id);
+	if (!fwnode)
 		return NOTIFY_DONE;
 
 	dev_dbg(info->dev, "%sRequested device (%s) for protocol 0x%x\n",
@@ -2895,7 +2895,7 @@ static int scmi_device_request_notifier(struct notifier_block *nb,
 
 	switch (action) {
 	case SCMI_BUS_NOTIFY_DEVICE_REQUEST:
-		scmi_create_protocol_devices(np, info, id_table->protocol_id,
+		scmi_create_protocol_devices(fwnode, info, id_table->protocol_id,
 					     id_table->name);
 		break;
 	case SCMI_BUS_NOTIFY_DEVICE_UNREQUEST:
@@ -2982,13 +2982,14 @@ static struct scmi_debug_info *scmi_debugfs_common_setup(struct scmi_info *info)
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
@@ -3097,20 +3098,20 @@ static const struct scmi_desc *scmi_transport_setup(struct device *dev)
 
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
 
 	dev_info(dev,
 		 "SCMI max-rx-timeout: %dms / max-msg-size: %dbytes / max-msg: %d\n",
@@ -3118,8 +3119,8 @@ static const struct scmi_desc *scmi_transport_setup(struct device *dev)
 		 trans->desc.max_msg);
 
 	/* System wide atomic threshold for atomic ops .. if any */
-	if (!of_property_read_u32(dev->of_node, "atomic-threshold-us",
-				  &trans->desc.atomic_threshold))
+	if (!fwnode_property_read_u32(dev_fwnode(dev), "atomic-threshold-us",
+				      &trans->desc.atomic_threshold))
 		dev_info(dev,
 			 "SCMI System wide atomic threshold set to %u us\n",
 			 trans->desc.atomic_threshold);
@@ -3148,7 +3149,6 @@ static int scmi_probe(struct platform_device *pdev)
 	struct scmi_info *info;
 	bool coex = IS_ENABLED(CONFIG_ARM_SCMI_RAW_MODE_SUPPORT_COEX);
 	struct device *dev = &pdev->dev;
-	struct device_node *child, *np = dev->of_node;
 
 	desc = scmi_transport_setup(dev);
 	if (!desc) {
@@ -3187,7 +3187,7 @@ static int scmi_probe(struct platform_device *pdev)
 	handle->devm_protocol_put = scmi_devm_protocol_put;
 	handle->is_transport_atomic = scmi_is_transport_atomic;
 
-	/* Setup all channels described in the DT at first */
+	/* Setup all channels described in the fwnode at first */
 	ret = scmi_channels_setup(info);
 	if (ret) {
 		err_str = "failed to setup channels\n";
@@ -3262,10 +3262,10 @@ static int scmi_probe(struct platform_device *pdev)
 
 	scmi_enable_matching_quirks(info);
 
-	for_each_available_child_of_node(np, child) {
+	fwnode_for_each_available_child_node_scoped(dev_fwnode(dev), child) {
 		u32 prot_id;
 
-		if (of_property_read_u32(child, "reg", &prot_id))
+		if (fwnode_property_read_u32(child, "reg", &prot_id))
 			continue;
 
 		if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id))
@@ -3278,10 +3278,11 @@ static int scmi_probe(struct platform_device *pdev)
 		}
 
 		/*
-		 * Save this valid DT protocol descriptor amongst
+		 * Save this valid fwnode protocol descriptor amongst
 		 * @active_protocols for this SCMI instance/
 		 */
-		ret = idr_alloc(&info->active_protocols, child,
+		ret = idr_alloc(&info->active_protocols,
+				fwnode_handle_get(child),
 				prot_id, prot_id + 1, GFP_KERNEL);
 		if (ret != prot_id) {
 			dev_err(dev, "SCMI protocol %d already activated. Skip\n",
@@ -3289,7 +3290,6 @@ static int scmi_probe(struct platform_device *pdev)
 			continue;
 		}
 
-		of_node_get(child);
 		scmi_create_protocol_devices(child, info, prot_id, NULL);
 	}
 
@@ -3317,7 +3317,7 @@ static void scmi_remove(struct platform_device *pdev)
 {
 	int id;
 	struct scmi_info *info = platform_get_drvdata(pdev);
-	struct device_node *child;
+	struct fwnode_handle *child;
 
 	if (IS_ENABLED(CONFIG_ARM_SCMI_RAW_MODE_SUPPORT))
 		scmi_raw_mode_cleanup(info->raw);
@@ -3336,7 +3336,7 @@ static void scmi_remove(struct platform_device *pdev)
 	mutex_unlock(&info->protocols_mtx);
 
 	idr_for_each_entry(&info->active_protocols, child, id)
-		of_node_put(child);
+		fwnode_handle_put(child);
 	idr_destroy(&info->active_protocols);
 
 	blocking_notifier_chain_unregister(&scmi_requested_devices_nh,
diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index ae0f67e6cc45..bc27505879af 100644
--- a/drivers/firmware/arm_scmi/transports/mailbox.c
+++ b/drivers/firmware/arm_scmi/transports/mailbox.c
@@ -77,9 +77,10 @@ static void rx_callback(struct mbox_client *cl, void *m)
 		      core->shmem->read_header(smbox->shmem), NULL);
 }
 
-static bool mailbox_chan_available(struct device_node *of_node, int idx)
+static bool mailbox_chan_available(struct fwnode_handle *fwnode, int idx)
 {
 	int num_mb;
+	struct device_node *of_node = to_of_node(fwnode);
 
 	/*
 	 * Just check if bidirrectional channels are involved, and check the
diff --git a/drivers/firmware/arm_scmi/transports/optee.c b/drivers/firmware/arm_scmi/transports/optee.c
index dc0f46340153..846d28472923 100644
--- a/drivers/firmware/arm_scmi/transports/optee.c
+++ b/drivers/firmware/arm_scmi/transports/optee.c
@@ -312,9 +312,10 @@ static int invoke_process_msg_channel(struct scmi_optee_channel *channel, size_t
 	return 0;
 }
 
-static bool scmi_optee_chan_available(struct device_node *of_node, int idx)
+static bool scmi_optee_chan_available(struct fwnode_handle *fwnode, int idx)
 {
 	u32 channel_id;
+	struct device_node *of_node = to_of_node(fwnode);
 
 	return !of_property_read_u32_index(of_node, "linaro,optee-channel-id",
 					   idx, &channel_id);
diff --git a/drivers/firmware/arm_scmi/transports/smc.c b/drivers/firmware/arm_scmi/transports/smc.c
index 21abb571e4f2..75e539578670 100644
--- a/drivers/firmware/arm_scmi/transports/smc.c
+++ b/drivers/firmware/arm_scmi/transports/smc.c
@@ -84,8 +84,9 @@ static irqreturn_t smc_msg_done_isr(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static bool smc_chan_available(struct device_node *of_node, int idx)
+static bool smc_chan_available(struct fwnode_handle *fwnode, int idx)
 {
+	struct device_node *of_node = to_of_node(fwnode);
 	struct device_node *np __free(device_node) =
 					of_parse_phandle(of_node, "shmem", 0);
 	if (!np)
diff --git a/drivers/firmware/arm_scmi/transports/virtio.c b/drivers/firmware/arm_scmi/transports/virtio.c
index 326c4a93e44b..cb749ac7ab46 100644
--- a/drivers/firmware/arm_scmi/transports/virtio.c
+++ b/drivers/firmware/arm_scmi/transports/virtio.c
@@ -373,7 +373,7 @@ static unsigned int virtio_get_max_msg(struct scmi_chan_info *base_cinfo)
 	return vioch->max_msg;
 }
 
-static bool virtio_chan_available(struct device_node *of_node, int idx)
+static bool virtio_chan_available(struct fwnode_handle *fwnode, int idx)
 {
 	struct scmi_vio_channel *channels, *vioch = NULL;
 

-- 
2.34.1

