Received: from smtp153-141.sina.com.cn (smtp153-141.sina.com.cn [61.135.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2136D381AA
	for <arm-scmi@vger.kernel.org>; Wed, 11 Dec 2024 13:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733925048; cv=none; b=GMGXnDQjfY/r7FRuvuo4F/LYEJZIt4W8qZQOY1hnHa/MQsmivV0mH6BYwmhf1fOTkl0rBLgzBLEX1o3wgwm/VxEdjaiOAQWkewC9JeYVcJyeM0PnL4cWNyGjWr60nbCCFYdMMjJB26M3ZAxTMlLA+NcQ9BckpkhK1qYSG6TJ8r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733925048; c=relaxed/simple;
	bh=yUwWwN0tJzzWu/F++GGgWXmlCkkyINEgK/cx5DVX9dU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R+EVT+f1bWZ8RC4/mmmhLSUWEsWsEaThDDfuKIAzE57Mcr4xzsf54kpsM8ulKelCNRwI/zR9k+aAa6F7rVZg4OMd/3YpXNoE03evFCoG42uYJydvsCtsIxmRv1Y8UB2YzYrCWrPEDIbsayRRczJc879sgka+LpImttEZQAvOUDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=61.135.153.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([58.48.52.254])
	by sina.com (10.182.253.25) with ESMTP
	id 675997620000376C; Wed, 11 Dec 2024 21:45:08 +0800 (CST)
X-Sender: guomin_chen@sina.com
X-Auth-ID: guomin_chen@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=guomin_chen@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=guomin_chen@sina.com
X-SMAIL-MID: 30054012059153
X-SMAIL-UIID: 1F8406BE2AA2478480B6D63F9C5D81B4-20241211-214508-1
From: guomin_chen@sina.com
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Xinqi Zhang <quic_xinqzhan@quicinc.com>,
	guomin chen <gchen.guomin@gmail.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	guomin chen <guomin_chen@sina.com>
Subject: [PATCH] firmware: arm_scmi: Delete the meaningless scmi_bus_id.
Date: Wed, 11 Dec 2024 21:45:05 +0800
Message-ID: <20241211134505.2218386-1-guomin_chen@sina.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: guomin chen <guomin_chen@sina.com>

Currently, scmi_bus_id is only used to set scmi_dev.id,
which in turn sets the SCMI device name. After removing
scmi_bus_id, it is clearer and more meaningful to directly
use the input parameters name and protocol to set the SCMI
device name.

Signed-off-by: guomin chen <guomin_chen@sina.com>
---
 drivers/firmware/arm_scmi/bus.c    | 16 ++--------------
 drivers/firmware/arm_scmi/driver.c |  4 ++--
 2 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 157172a5f2b5..c4e013a77e33 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -20,7 +20,6 @@
 BLOCKING_NOTIFIER_HEAD(scmi_requested_devices_nh);
 EXPORT_SYMBOL_GPL(scmi_requested_devices_nh);
 
-static DEFINE_IDA(scmi_bus_id);
 
 static DEFINE_IDR(scmi_requested_devices);
 /* Protect access to scmi_requested_devices */
@@ -341,7 +340,6 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
 	if (scmi_dev->protocol_id == SCMI_PROTOCOL_SYSTEM)
 		atomic_set(&scmi_syspower_registered, 0);
 
-	ida_free(&scmi_bus_id, scmi_dev->id);
 	device_unregister(&scmi_dev->dev);
 }
 
@@ -349,7 +347,7 @@ static struct scmi_device *
 __scmi_device_create(struct device_node *np, struct device *parent,
 		     int protocol, const char *name)
 {
-	int id, retval;
+	int retval;
 	struct scmi_device *scmi_dev;
 
 	/*
@@ -387,20 +385,12 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 		return NULL;
 	}
 
-	id = ida_alloc_min(&scmi_bus_id, 1, GFP_KERNEL);
-	if (id < 0) {
-		kfree_const(scmi_dev->name);
-		kfree(scmi_dev);
-		return NULL;
-	}
-
-	scmi_dev->id = id;
 	scmi_dev->protocol_id = protocol;
 	scmi_dev->dev.parent = parent;
 	device_set_node(&scmi_dev->dev, of_fwnode_handle(np));
 	scmi_dev->dev.bus = &scmi_bus_type;
 	scmi_dev->dev.release = scmi_device_release;
-	dev_set_name(&scmi_dev->dev, "scmi_dev.%d", id);
+	dev_set_name(&scmi_dev->dev, "scmi_dev.%s.%d", scmi_dev->name, protocol);
 
 	retval = device_register(&scmi_dev->dev);
 	if (retval)
@@ -413,7 +403,6 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 	return scmi_dev;
 put_dev:
 	put_device(&scmi_dev->dev);
-	ida_free(&scmi_bus_id, id);
 	return NULL;
 }
 
@@ -526,7 +515,6 @@ static void __exit scmi_bus_exit(void)
 	 */
 	scmi_devices_unregister();
 	bus_unregister(&scmi_bus_type);
-	ida_destroy(&scmi_bus_id);
 }
 module_exit(scmi_bus_exit);
 
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 1b5fb2c4ce86..bbf1f05f2be3 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2641,8 +2641,8 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 	cinfo->max_msg_size = info->desc->max_msg_size;
 
 	/* Create a unique name for this transport device */
-	snprintf(name, 32, "__scmi_transport_device_%s_%02X",
-		 idx ? "rx" : "tx", prot_id);
+	snprintf(name, 32, "__scmi_transport_device_%s",
+		 idx ? "rx" : "tx");
 	/* Create a uniquely named, dedicated transport device for this chan */
 	tdev = scmi_device_create(of_node, info->dev, prot_id, name);
 	if (!tdev) {
-- 
2.47.1

