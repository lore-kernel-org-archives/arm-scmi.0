Received: from r3-11.sinamail.sina.com.cn (r3-11.sinamail.sina.com.cn [202.108.3.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E6B433C8
	for <arm-scmi@vger.kernel.org>; Mon, 16 Dec 2024 07:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734335575; cv=none; b=m2eEu1E++qj9MOdErCfQhtMdkQB9EP8uIdtWyDlcQqbeDgtZ5YHfVzn2aubDmnFGDoiI4Vs/8xZYcWT2ZMNkJou8ByP+klEGOwUMYlAVbpWVLTS/lrg8T7kDoWZknsgDW9CY6rJ6duAYbC1HWWiF9EAcwxMrxZw/iFZpULF6xk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734335575; c=relaxed/simple;
	bh=DaXMxJWe+maZHs011CH/Y8JkMepo5JmAYGmmAUY1iTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ayCvK1KPyUyLLR1vo86PKeIiIvZBx/mlzwQUG4O36Tm4fCyyKT6iTYtUqouZXLKcAIDdVlvLreS5B462MnXADRgaBALICsFX3AeFacrSAbdJSTgObddWY8uWgo3r8ys2xT2nhcDzygAajUhTet0leuDAkldOHY8bAIowBWX26lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=202.108.3.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([58.48.52.254])
	by sina.com (10.182.253.22) with ESMTP
	id 675FD8CA00004103; Mon, 16 Dec 2024 15:37:47 +0800 (CST)
X-Sender: guomin_chen@sina.com
X-Auth-ID: guomin_chen@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=guomin_chen@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=guomin_chen@sina.com
X-SMAIL-MID: 8382016816123
X-SMAIL-UIID: D0CEDDD720A14B498C74480E40F4A454-20241216-153747-1
From: guomin_chen@sina.com
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Xinqi Zhang <quic_xinqzhan@quicinc.com>,
	guomin chen <gchen.guomin@gmail.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	guomin chen <guomin_chen@sina.com>
Subject: [PATCH v2] firmware: arm_scmi: Delete the meaningless scmi_bus_id.
Date: Mon, 16 Dec 2024 15:37:45 +0800
Message-ID: <20241216073745.2973317-1-guomin_chen@sina.com>
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
use the unique tuple [Parent name,device name, protocol] to 
set the SCMI device name.

Signed-off-by: guomin chen <guomin_chen@sina.com>
---
 drivers/firmware/arm_scmi/bus.c    | 17 +++--------------
 drivers/firmware/arm_scmi/driver.c |  4 ++--
 2 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 157172a5f2b5..800e8ec9357c 100644
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
@@ -387,20 +385,13 @@ __scmi_device_create(struct device_node *np, struct device *parent,
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
+	dev_set_name(&scmi_dev->dev, "scmi_dev.%s.%s.%d", dev_name(parent),
+			scmi_dev->name, protocol);
 
 	retval = device_register(&scmi_dev->dev);
 	if (retval)
@@ -413,7 +404,6 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 	return scmi_dev;
 put_dev:
 	put_device(&scmi_dev->dev);
-	ida_free(&scmi_bus_id, id);
 	return NULL;
 }
 
@@ -526,7 +516,6 @@ static void __exit scmi_bus_exit(void)
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

