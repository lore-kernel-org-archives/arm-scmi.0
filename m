Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1DC408007
	for <arm-scmi@vger.kernel.org>; Wed,  8 Jul 2026 09:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783501243; cv=none; b=stqKuD/U5KVCsRHbRyhZPWFrZV/Sh8ED3K8qEv9G2EGijBmpfXGmy+cSEvwDGHONJ+rEdImhg+ZQ+2T6vCMjf7I0I+MPiW/15EfARkuLwh7tKIvqitYSYj4wzCu90ExuDbG2KKf3G0YUdNZi7glyosWLOx/G4oMfIQCJP/PPQ24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783501243; c=relaxed/simple;
	bh=sMv8A4+LFF47Fy3N16qo79I/Wkt8BzsL2y8Y79yg2pE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CTB7B3rU/1/RkJqkYIpL1WbLVcDTyhe/1Iu2lVuiDu+/E7JycYDXThajUZ1FDiGbZPgRymxYO89qMXgspFV1JJfNaVOFoIjYis8A+5l+Q0CyoUcYUOEQdQz7j8z56rLgqQUk1z+DVuW8KEA99we7t7QsMjN2YMs6n40zuEg8Qc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XUqfHMHD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XUqfHMHD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C9F81F00A3E;
	Wed,  8 Jul 2026 09:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783501240;
	bh=gvc4cOFpx5prvpYKBDW+w8VBy4WicBwN3XrzpjNgkrY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XUqfHMHDX7OoC7d9pqhnfx6oLU7AJXlTpdyEN8o2nPVUA689MjrfkvnV3DTmCf5fq
	 gY5q9U+jSo5IVc5QIErRdiMG7YX9Hmj+1/NuyERyahShBQAJeBMmya0iH/2917zdc5
	 vboLB+3WS/qG4XjYOkLvrpDwvY0sI3XNjHJUXFxlr4wU7Z5NalviguIxl6IwJQjtVG
	 LiqVe3tiRnz0eNKcfDeImOMjpsD32mJd536tGVhRCF/8iXxYbR+/+tzsXoewX6/XSa
	 5IfH31QxUMvAUtVvdKK7l2tlxW61j+jyuNGVOADHjOwZvBnFHp7caCMrZHZ5yKFuBO
	 gLHOqyS1m8+5Q==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 08 Jul 2026 10:00:12 +0100
Subject: [PATCH v4 16/16] firmware: arm_scmi: Fix transport device teardown
 lookup
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-scmi_core_fixes-v4-16-53142cd60b63@kernel.org>
References: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
In-Reply-To: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

SCMI transport devices are deliberately excluded from normal SCMI bus
matching so protocol drivers cannot bind to the internal transport
children. However, scmi_device_destroy() uses the same protocol/name
lookup to find devices that must be unregistered during channel teardown.

Split the match helper so driver matching still skips transport devices,
while explicit child lookup can find them for teardown. Use a shared
transport-device name prefix macro for both matching and name generation.

Since transport-device names are derived from direction and protocol ID,
reject duplicate protocol channel setup before creating or finding a
transport device. This prevents malformed firmware with duplicate
protocol child nodes from reusing an existing transport device and then
destroying it when the duplicate IDR insertion fails.

Fixes: 9593804c44c2 ("firmware: arm_scmi: Exclude transport devices from bus matching")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/bus.c    | 22 +++++++++++++++++-----
 drivers/firmware/arm_scmi/common.h |  2 ++
 drivers/firmware/arm_scmi/driver.c |  5 ++++-
 3 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index e1f66c08c81d..7f06d56e4905 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -200,21 +200,33 @@ scmi_protocol_table_unregister(const struct scmi_device_id *id_table)
 		scmi_protocol_device_unrequest(entry);
 }
 
-static int scmi_dev_match_by_id_table(struct scmi_device *scmi_dev,
-				      const struct scmi_device_id *id_table)
+static bool scmi_device_is_transport(const struct scmi_device *scmi_dev)
+{
+	return !strncmp(scmi_dev->name, SCMI_TRANSPORT_DEVNAME_PREFIX,
+			strlen(SCMI_TRANSPORT_DEVNAME_PREFIX));
+}
+
+static int __scmi_dev_match_by_id_table(struct scmi_device *scmi_dev,
+					const struct scmi_device_id *id_table,
+					bool skip_transport)
 {
 	if (!id_table || !id_table->name)
 		return 0;
 
-	/* Always skip transport devices from matching */
 	for (; id_table->protocol_id && id_table->name; id_table++)
 		if (id_table->protocol_id == scmi_dev->protocol_id &&
-		    strncmp(scmi_dev->name, "__scmi_transport_device", 23) &&
+		    !(skip_transport && scmi_device_is_transport(scmi_dev)) &&
 		    !strcmp(id_table->name, scmi_dev->name))
 			return 1;
 	return 0;
 }
 
+static int scmi_dev_match_by_id_table(struct scmi_device *scmi_dev,
+				      const struct scmi_device_id *id_table)
+{
+	return __scmi_dev_match_by_id_table(scmi_dev, id_table, true);
+}
+
 static int scmi_dev_match_id(struct scmi_device *scmi_dev,
 			     const struct scmi_driver *scmi_drv)
 {
@@ -234,7 +246,7 @@ static int scmi_match_by_id_table(struct device *dev, const void *data)
 	struct scmi_device *scmi_dev = to_scmi_dev(dev);
 	const struct scmi_device_id *id_table = data;
 
-	return scmi_dev_match_by_id_table(scmi_dev, id_table);
+	return __scmi_dev_match_by_id_table(scmi_dev, id_table, false);
 }
 
 /* Returns a device_find_child() reference which must be dropped by caller. */
diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index b9723c105fc1..fe8c22cfb9f7 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -34,6 +34,8 @@
 
 #define SCMI_SHMEM_MAX_PAYLOAD_SIZE	104
 
+#define SCMI_TRANSPORT_DEVNAME_PREFIX	"__scmi_transport_device"
+
 enum scmi_error_codes {
 	SCMI_SUCCESS = 0,	/* Success */
 	SCMI_ERR_SUPPORT = -1,	/* Not supported */
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 515ae884bb2c..894c3427bc0b 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2762,6 +2762,9 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 	idx = tx ? 0 : 1;
 	idr = tx ? &info->tx_idr : &info->rx_idr;
 
+	if (idr_find(idr, prot_id))
+		return -EEXIST;
+
 	if (!info->desc->ops->chan_available(of_node, idx)) {
 		cinfo = idr_find(idr, SCMI_PROTOCOL_BASE);
 		if (unlikely(!cinfo)) /* Possible only if platform has no Rx */
@@ -2779,7 +2782,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 	cinfo->no_completion_irq = info->desc->no_completion_irq;
 
 	/* Create a unique name for this transport device */
-	snprintf(name, 32, "__scmi_transport_device_%s_%02X",
+	snprintf(name, sizeof(name), SCMI_TRANSPORT_DEVNAME_PREFIX "_%s_%02X",
 		 idx ? "rx" : "tx", prot_id);
 	/* Create a uniquely named, dedicated transport device for this chan */
 	tdev = scmi_device_create(of_node, info->dev, prot_id, name);

-- 
2.43.0

