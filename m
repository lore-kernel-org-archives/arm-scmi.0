Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 253713E3C5D;
	Mon,  4 May 2026 16:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777913545; cv=none; b=jqZ0n9/6VJ7q8K9ePDkaf40nZWzymI2K5ySiu+BJ975dC7zEXW8P9W7R20ZA3q2X81KuJIqM3gLrhDluAAmglzJ/gCrAOe+/nI+MdWehmnr/tVcWu/0foymWsEQVlKkX1nsaDSheMTBmiraQi50t+KT3DUDuuo7QVpIZN4IXCNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777913545; c=relaxed/simple;
	bh=fNj4ckZbgvI8AyVn1FXEnd6VYSCu3WCPkOhkPWudMAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KAoJdCgiK0Nm3cCjf3U98NKI3NHBoew1hdHpRsMkTCx6/fZIpCB1pkzVC3xEH4n3z9h2Yhufn7fFXgH/ufpUenZ5uRQHy+hIRcoyswj2u95c+l5GFFdDLQlHi89iJ/RpRbEe9NDlEPoOlzk02EEXl7es8FaGywAO69PRyz42Hyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=JHSLk09o; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="JHSLk09o"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 297EB25E2;
	Mon,  4 May 2026 09:52:17 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E9FE3F763;
	Mon,  4 May 2026 09:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777913542; bh=fNj4ckZbgvI8AyVn1FXEnd6VYSCu3WCPkOhkPWudMAs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JHSLk09oshm55IFWHj7GAerZcXmxKUJ/5lldZIEtinybxhlnVpFHO9gXv8ihwL5gP
	 51Kc4yBiAjpK3Ldn81oZRauuMmGpxWpdLeLZWz1IqyRNWdwPniMb1y90mriCCCq1VS
	 UAkSX5hfal9LxL6c5xhJ34Q1kv8Z6OadJARGhzoo=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	philip.radford@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	gatien.chevallier@foss.st.com,
	u.kleine-koenig@baylibre.com,
	dakr@kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v1 2/3] firmware: arm_scmi: virtio: Rework transport probe sequence
Date: Mon,  4 May 2026 17:52:03 +0100
Message-ID: <20260504165204.639499-3-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260504165204.639499-1-cristian.marussi@arm.com>
References: <20260504165204.639499-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the new per-instance transport handles helpers to synchronize and
optionally defer the core SCMI driver probe up until the transport driver
has completely been initialized and it is fully operational as a supplier.

Introduce proper module init/exit routines while removing the ugly trick of
registering a driver from within the probe sequence of another one, just to
avoid to have to deal with probe deferrals.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/transports/virtio.c | 137 +++++++++++++++---
 1 file changed, 120 insertions(+), 17 deletions(-)

diff --git a/drivers/firmware/arm_scmi/transports/virtio.c b/drivers/firmware/arm_scmi/transports/virtio.c
index 326c4a93e44b..7ff9c31c3a8c 100644
--- a/drivers/firmware/arm_scmi/transports/virtio.c
+++ b/drivers/firmware/arm_scmi/transports/virtio.c
@@ -4,7 +4,7 @@
  * (SCMI).
  *
  * Copyright (C) 2020-2022 OpenSynergy.
- * Copyright (C) 2021-2024 ARM Ltd.
+ * Copyright (C) 2021-2026 ARM Ltd.
  */
 
 /**
@@ -17,6 +17,7 @@
  * virtqueue. Access to each virtqueue is protected by spinlocks.
  */
 
+#include <linux/cleanup.h>
 #include <linux/completion.h>
 #include <linux/errno.h>
 #include <linux/platform_device.h>
@@ -116,6 +117,79 @@ static struct scmi_transport_core_operations *core;
 /* Only one SCMI VirtIO device can possibly exist */
 static struct virtio_device *scmi_vdev;
 
+/**
+ * struct scmi_virtio_suppliers  - Transport descriptor
+ * @mtx: A mutex to protect @available
+ * @available: A reference to an initialized transport device ready to use
+ *	       which  will cycle through the following 3 states:
+ *	       1. PTR_ERR(-EPROBE_DEFER) at start before transport is ready
+ *	       2. <supplier_dev> when transport is initialized, ready for use,
+ *	          but still unused
+ *	       3. PTR_ERR(-EBUSY) when transport supplier device is in use
+ * @th: An embedded transport handle object that embeds the helpers
+ *	implementing the above mentioned logic
+ *
+ * Note that this transport driver enforces single instance probing.
+ */
+struct scmi_virtio_suppliers {
+	/* Protect @available */
+	struct mutex mtx;
+	struct device *available;
+	const struct scmi_transport_handle th;
+};
+
+#define to_vsup(t)	container_of(t, struct scmi_virtio_suppliers, th)
+
+static int scmi_virtio_supplier_init(const struct scmi_transport_handle *th,
+				     struct device *dev)
+{
+	struct scmi_virtio_suppliers *vsup = to_vsup(th);
+
+	guard(mutex)(&vsup->mtx);
+	/* Was any transport already registered ? */
+	if (!IS_ERR(vsup->available))
+		return -EBUSY;
+
+	vsup->available = dev;
+
+	return 0;
+}
+
+static struct device *
+scmi_virtio_supplier_get(const struct scmi_transport_handle *th)
+{
+	struct scmi_virtio_suppliers *vsup = to_vsup(th);
+	struct device *supplier;
+
+	guard(mutex)(&vsup->mtx);
+	supplier = vsup->available;
+	if (!IS_ERR(supplier))
+		vsup->available = ERR_PTR(-EBUSY);
+
+	return supplier;
+}
+
+static void scmi_virtio_supplier_put(const struct scmi_transport_handle *th,
+				     struct device *supplier)
+{
+	struct scmi_virtio_suppliers *vsup = to_vsup(th);
+
+	guard(mutex)(&vsup->mtx);
+	vsup->available = supplier;
+}
+
+static void scmi_virtio_supplier_cleanup(const struct scmi_transport_handle *th)
+{
+	scmi_virtio_supplier_put(th, ERR_PTR(-EPROBE_DEFER));
+}
+
+static struct scmi_virtio_suppliers scmi_transport_suppliers = {
+	.mtx = __MUTEX_INITIALIZER(mutexname),
+	.available = INIT_ERR_PTR(-EPROBE_DEFER),
+	.th.supplier_get = scmi_virtio_supplier_get,
+	.th.supplier_put = scmi_virtio_supplier_put,
+};
+
 static void scmi_vio_channel_ready(struct scmi_vio_channel *vioch,
 				   struct scmi_chan_info *cinfo)
 {
@@ -377,7 +451,7 @@ static bool virtio_chan_available(struct device_node *of_node, int idx)
 {
 	struct scmi_vio_channel *channels, *vioch = NULL;
 
-	if (WARN_ON_ONCE(!scmi_vdev))
+	if (!scmi_vdev)
 		return false;
 
 	channels = (struct scmi_vio_channel *)scmi_vdev->priv;
@@ -394,6 +468,10 @@ static bool virtio_chan_available(struct device_node *of_node, int idx)
 		return false;
 	}
 
+	dev_dbg(&scmi_vdev->dev, "%s Channel %sAVAILABLE on SCMI Virtio device.\n",
+		idx == VIRTIO_SCMI_VQ_TX ? "TX" : "RX",
+		(vioch && !vioch->cinfo) ? "" : "NOT ");
+
 	return vioch && !vioch->cinfo;
 }
 
@@ -410,7 +488,7 @@ static int virtio_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 	int i;
 
 	if (!scmi_vdev)
-		return -EPROBE_DEFER;
+		return -EINVAL;
 
 	vioch = &((struct scmi_vio_channel *)scmi_vdev->priv)[index];
 
@@ -460,6 +538,9 @@ static int virtio_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 
 	scmi_vio_channel_ready(vioch, cinfo);
 
+	dev_dbg(&scmi_vdev->dev, "%s Channel SETUP on SCMI Virtio device.\n",
+		tx ? "TX" : "RX");
+
 	return 0;
 }
 
@@ -801,7 +882,7 @@ static struct scmi_desc scmi_virtio_desc = {
 };
 
 static const struct of_device_id scmi_of_match[] = {
-	{ .compatible = "arm,scmi-virtio" },
+	{ .compatible = "arm,scmi-virtio", .data = &scmi_transport_suppliers.th},
 	{ /* Sentinel */ },
 };
 
@@ -864,33 +945,30 @@ static int scmi_vio_probe(struct virtio_device *vdev)
 			sz = MSG_TOKEN_MAX;
 		}
 		channels[i].max_msg = sz;
+		dev_dbg(dev, "VQ%d initialized with max_msg: %d\n", i, sz);
 	}
 
 	vdev->priv = channels;
+	ret = scmi_virtio_supplier_init(&scmi_transport_suppliers.th,
+					&vdev->dev);
+	if (ret) {
+		vdev->priv = NULL;
+		vdev->config->del_vqs(vdev);
+		return ret;
+	}
 
 	/* Ensure initialized scmi_vdev is visible */
 	smp_store_mb(scmi_vdev, vdev);
-
 	/* Set device ready */
 	virtio_device_ready(vdev);
 
-	ret = platform_driver_register(&scmi_virtio_driver);
-	if (ret) {
-		vdev->priv = NULL;
-		vdev->config->del_vqs(vdev);
-		/* Ensure NULLified scmi_vdev is visible */
-		smp_store_mb(scmi_vdev, NULL);
-
-		return ret;
-	}
+	dev_dbg(dev, "Probed and initialized SCMI Virtio device.\n");
 
 	return 0;
 }
 
 static void scmi_vio_remove(struct virtio_device *vdev)
 {
-	platform_driver_unregister(&scmi_virtio_driver);
-
 	/*
 	 * Once we get here, virtio_chan_free() will have already been called by
 	 * the SCMI core for any existing channel and, as a consequence, all the
@@ -900,8 +978,10 @@ static void scmi_vio_remove(struct virtio_device *vdev)
 	 */
 	virtio_reset_device(vdev);
 	vdev->config->del_vqs(vdev);
+
 	/* Ensure scmi_vdev is visible as NULL */
 	smp_store_mb(scmi_vdev, NULL);
+	scmi_virtio_supplier_cleanup(&scmi_transport_suppliers.th);
 }
 
 static int scmi_vio_validate(struct virtio_device *vdev)
@@ -936,7 +1016,30 @@ static struct virtio_driver virtio_scmi_driver = {
 	.validate = scmi_vio_validate,
 };
 
-module_virtio_driver(virtio_scmi_driver);
+static int __init scmi_transport_virtio_init(void)
+{
+	int ret;
+
+	ret = register_virtio_driver(&virtio_scmi_driver);
+	if (ret)
+		return ret;
+
+	ret = platform_driver_register(&scmi_virtio_driver);
+	if (ret) {
+		unregister_virtio_driver(&virtio_scmi_driver);
+		return ret;
+	}
+
+	return ret;
+}
+module_init(scmi_transport_virtio_init);
+
+static void __exit scmi_transport_virtio_exit(void)
+{
+	platform_driver_unregister(&scmi_virtio_driver);
+	unregister_virtio_driver(&virtio_scmi_driver);
+}
+module_exit(scmi_transport_virtio_exit);
 
 MODULE_AUTHOR("Igor Skalkin <igor.skalkin@opensynergy.com>");
 MODULE_AUTHOR("Peter Hilber <peter.hilber@opensynergy.com>");
-- 
2.53.0

