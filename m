Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 452D73F65F5;
	Tue, 17 Mar 2026 16:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773766716; cv=none; b=By0ET4deBgPrARQozknWsfJeYADLxgLiXuoPsR0fykmHFm7hA2sTWGr1QZCfp6olkpoLn87xeIi9eubiTlEP4Ql/ywctNWKF7pudHsGXauZgKVtVx5K4ACQcRbrC1jtsfUk7m8VX3JYiL/i9BVTd6PNWZDy8sinCpSb+TZZkac4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773766716; c=relaxed/simple;
	bh=FJeN8+7oS17O2ePg8eSJn6wJtjw7rM5PT41uMilIbdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SZ5R4gBTIEEht52p46S52K89VzdiecKR/QxWjUhqGlWMpRjNeBHz2HawTnH2ao/BHSMnT7NWTlibpKAUj0vufG/iw0JXLPCFTcKvf5DeIBOCdO0gMhmoceySSMz4oTp00L7jIFlzZxuKiy9PUJ0GwfrOgUNI1KsPnchAhN+0v3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 995CB1477;
	Tue, 17 Mar 2026 09:58:28 -0700 (PDT)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 25C653F7BD;
	Tue, 17 Mar 2026 09:58:32 -0700 (PDT)
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
	dan.carpenter@linaro.org,
	gatien.chevallier@foss.st.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [RFC PATCH 3/4] firmware: arm_scmi: virtio: Rework transport probe sequence
Date: Tue, 17 Mar 2026 16:58:10 +0000
Message-ID: <20260317165811.3352752-4-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317165811.3352752-1-cristian.marussi@arm.com>
References: <20260317165811.3352752-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the new per-instance transport handles list to synchronize and
optionally defer the core SCMI probe up until the transport driver has
completely been initialized and is fully operational.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/transports/virtio.c | 93 ++++++++++++-------
 1 file changed, 57 insertions(+), 36 deletions(-)

diff --git a/drivers/firmware/arm_scmi/transports/virtio.c b/drivers/firmware/arm_scmi/transports/virtio.c
index 6e1ce01507a6..ee7247081be1 100644
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
@@ -113,8 +113,12 @@ struct scmi_vio_msg {
 
 static struct scmi_transport_core_operations *core;
 
-/* Only one SCMI VirtIO device can possibly exist */
-static struct virtio_device *scmi_vdev;
+struct scmi_virtio_device {
+	struct virtio_device *vdev;
+	struct list_head node;
+};
+
+static DEFINE_SCMI_TRANSPORT_INSTANCE_QUEUE(scmi_available_vdevs);
 
 static void scmi_vio_channel_ready(struct scmi_vio_channel *vioch,
 				   struct scmi_chan_info *cinfo)
@@ -376,24 +380,28 @@ static unsigned int virtio_get_max_msg(struct scmi_chan_info *base_cinfo)
 static bool virtio_chan_available(struct device_node *of_node, int idx, void *hndl)
 {
 	struct scmi_vio_channel *channels, *vioch = NULL;
+	struct scmi_virtio_device *sdev;
 
-	if (WARN_ON_ONCE(!scmi_vdev))
-		return false;
+	sdev = list_entry(hndl, struct scmi_virtio_device, node);
 
-	channels = (struct scmi_vio_channel *)scmi_vdev->priv;
+	channels = (struct scmi_vio_channel *)sdev->vdev->priv;
 
 	switch (idx) {
 	case VIRTIO_SCMI_VQ_TX:
 		vioch = &channels[VIRTIO_SCMI_VQ_TX];
 		break;
 	case VIRTIO_SCMI_VQ_RX:
-		if (scmi_vio_have_vq_rx(scmi_vdev))
+		if (scmi_vio_have_vq_rx(sdev->vdev))
 			vioch = &channels[VIRTIO_SCMI_VQ_RX];
 		break;
 	default:
 		return false;
 	}
 
+	dev_dbg(&sdev->vdev->dev, "%s Channel %sAVAILABLE on SCMI Virtio device.\n",
+		idx == VIRTIO_SCMI_VQ_TX ? "TX" : "RX",
+		(vioch && !vioch->cinfo) ? "" : "NOT ");
+
 	return vioch && !vioch->cinfo;
 }
 
@@ -405,21 +413,20 @@ static void scmi_destroy_tx_workqueue(void *deferred_tx_wq)
 static int
 virtio_chan_setup(struct scmi_chan_info *cinfo, struct device *dev, bool tx, void *hndl)
 {
+	struct scmi_virtio_device *sdev;
 	struct scmi_vio_channel *vioch;
 	int index = tx ? VIRTIO_SCMI_VQ_TX : VIRTIO_SCMI_VQ_RX;
 	int i;
 
-	if (!scmi_vdev)
-		return -EPROBE_DEFER;
-
-	vioch = &((struct scmi_vio_channel *)scmi_vdev->priv)[index];
+	sdev = list_entry(hndl, struct scmi_virtio_device, node);
+	vioch = &((struct scmi_vio_channel *)sdev->vdev->priv)[index];
 
 	/* Setup a deferred worker for polling. */
 	if (tx && !vioch->deferred_tx_wq) {
 		int ret;
 
 		vioch->deferred_tx_wq =
-			alloc_workqueue(dev_name(&scmi_vdev->dev),
+			alloc_workqueue(dev_name(&sdev->vdev->dev),
 					WQ_UNBOUND | WQ_FREEZABLE | WQ_SYSFS,
 					0);
 		if (!vioch->deferred_tx_wq)
@@ -460,6 +467,9 @@ virtio_chan_setup(struct scmi_chan_info *cinfo, struct device *dev, bool tx, voi
 
 	scmi_vio_channel_ready(vioch, cinfo);
 
+	dev_dbg(&sdev->vdev->dev, "%s Channel SETUP on SCMI Virtio device.\n",
+		tx ? "TX" : "RX");
+
 	return 0;
 }
 
@@ -801,7 +811,7 @@ static struct scmi_desc scmi_virtio_desc = {
 };
 
 static const struct of_device_id scmi_of_match[] = {
-	{ .compatible = "arm,scmi-virtio" },
+	{ .compatible = "arm,scmi-virtio", .data = &scmi_available_vdevs},
 	{ /* Sentinel */ },
 };
 
@@ -812,22 +822,20 @@ static int scmi_vio_probe(struct virtio_device *vdev)
 {
 	struct device *dev = &vdev->dev;
 	struct scmi_vio_channel *channels;
+	struct scmi_virtio_device *sdev;
 	bool have_vq_rx;
 	int vq_cnt;
 	int i;
 	int ret;
 	struct virtqueue *vqs[VIRTIO_SCMI_VQ_MAX_CNT];
 
-	/* Only one SCMI VirtiO device allowed */
-	if (scmi_vdev) {
-		dev_err(dev,
-			"One SCMI Virtio device was already initialized: only one allowed.\n");
-		return -EBUSY;
-	}
-
 	have_vq_rx = scmi_vio_have_vq_rx(vdev);
 	vq_cnt = have_vq_rx ? VIRTIO_SCMI_VQ_MAX_CNT : 1;
 
+	sdev = devm_kzalloc(dev, sizeof(*sdev), GFP_KERNEL);
+	if (!sdev)
+		return -ENOMEM;
+
 	channels = devm_kcalloc(dev, vq_cnt, sizeof(*channels), GFP_KERNEL);
 	if (!channels)
 		return -ENOMEM;
@@ -864,33 +872,25 @@ static int scmi_vio_probe(struct virtio_device *vdev)
 			sz = MSG_TOKEN_MAX;
 		}
 		channels[i].max_msg = sz;
+		dev_info(dev, "VQ%d initialized with max_msg: %d\n", i, sz);
 	}
 
 	vdev->priv = channels;
 
-	/* Ensure initialized scmi_vdev is visible */
-	smp_store_mb(scmi_vdev, vdev);
+	/* Ensure initialized vdev is visible */
+	smp_store_mb(sdev->vdev, vdev);
+	SCMI_TRANSPORT_INSTANCE_REGISTER(sdev->node, scmi_available_vdevs);
 
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
+	dev_info(dev, "Probed and initialized SCMI Virtio device.\n");
 
 	return 0;
 }
 
 static void scmi_vio_remove(struct virtio_device *vdev)
 {
-	platform_driver_unregister(&scmi_virtio_driver);
-
 	/*
 	 * Once we get here, virtio_chan_free() will have already been called by
 	 * the SCMI core for any existing channel and, as a consequence, all the
@@ -900,8 +900,6 @@ static void scmi_vio_remove(struct virtio_device *vdev)
 	 */
 	virtio_reset_device(vdev);
 	vdev->config->del_vqs(vdev);
-	/* Ensure scmi_vdev is visible as NULL */
-	smp_store_mb(scmi_vdev, NULL);
 }
 
 static int scmi_vio_validate(struct virtio_device *vdev)
@@ -936,7 +934,30 @@ static struct virtio_driver virtio_scmi_driver = {
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

