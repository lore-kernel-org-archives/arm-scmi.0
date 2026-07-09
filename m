Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B846E3FBB77
	for <arm-scmi@vger.kernel.org>; Thu,  9 Jul 2026 08:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587190; cv=none; b=lBU2TRF7SxRkjVcg1ENnLumi+Jn/+v8n2xTS/0TfuIVF7Tdhp02M1tYyXk/dNrXSe++5Nbyd/cHjM7KJH20n0C8kNLBIFfyXwd1rt2chc4GRdF00VQfuSlVNeTFWFzWO18ui3OmLj057AwPhjwthkhP+ac/OLpnUiiDYGiD4Zs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587190; c=relaxed/simple;
	bh=QU7FMbRqZmRrbMTi5MXALu8nDRd3ZSFtbiBzRhVrEVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e+J/191kkJzUJ84Bcw+z2u2D6Tblq7ULgayJqtnmF3FuSZiwGnixn9/Nj+wMrQle6qyoNiKFUljCaW/ZpctJaH4D0109cdCiBGWv1ESzjHHaJAcubR6pyffvctgX0W3vbZHn5PXMR9ARXSzf8LX6vPX9mCvX6/z86n2A3TUEOZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y42YLwAo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y42YLwAo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B8211F000E9;
	Thu,  9 Jul 2026 08:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587189;
	bh=1/1+F1RFMl2GV9XWTGIsSj/agttsISF6u+8SbWZvUWE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Y42YLwAoMYdnKw2te+9pIxu/adZDYLDby2JEemEnqigXGF/yebra/LzeVZhGaXARO
	 sxJMdRjlV+s8nQ+xcN10lRFPN769HMA1PQTEqPC/GxL6hRFaBxFa55qGt6fDW0s/Wu
	 O9ODj+zL8QnPc1990L3hW5MfuMbu9/7ncXWNdWFSO2gGaUJJ95MTvkkCwOnyLUqPE0
	 JY6o+HrKIKiZm+U26NxJt3TEISKhmRAa2dHt24hfNrmqHu2fzA2rxZnwPl+y5kQRIX
	 Nep0v/7owz05u4+CvEw6tvkVKvQ4/E6odZqOLq+XLQf93PuZgGX8tSFgbfpOdbMosh
	 /1XBVIVHRZ/Jw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 09 Jul 2026 09:52:35 +0100
Subject: [PATCH v5 11/16] firmware: arm_scmi: Clear SystemPower flag on
 create failure
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-scmi_core_fixes-v5-11-bea6a3024f05@kernel.org>
References: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
In-Reply-To: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

__scmi_device_create() reserves the singleton SystemPower protocol device
before registering the SCMI device. If any later step fails, a stale
reservation can make a later retry reject SystemPower device creation
permanently, for example after probe deferral.

A plain global boolean is not enough to track the reservation. A delayed
final release of an older SystemPower device could clear the boolean after
a newer device has already claimed it, breaking the singleton guarantee for
the active device.

Track the reservation with the scmi_device pointer itself. Claim it with
cmpxchg(NULL, scmi_dev) after allocating the device object, and release it
with cmpxchg(scmi_dev, NULL) from the common cleanup helper. This lets the
create-failure, explicit destroy and final release paths clear only the
reservation owned by the device being cleaned up.

Fixes: 2c3e674465e7 ("firmware: arm_scmi: Refactor device create/destroy helpers")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/bus.c | 59 ++++++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 27 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 793be9eabaed..dcaefc1aa892 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -7,7 +7,6 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <linux/atomic.h>
 #include <linux/types.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -33,8 +32,8 @@ struct scmi_requested_dev {
 	struct list_head node;
 };
 
-/* Track globally the creation of SCMI SystemPower related devices */
-static atomic_t scmi_syspower_registered = ATOMIC_INIT(0);
+/* Track globally the SCMI SystemPower protocol device. */
+static struct scmi_device *scmi_syspower_registered;
 
 /**
  * scmi_protocol_device_request  - Helper to request a device
@@ -391,10 +390,17 @@ void scmi_driver_unregister(struct scmi_driver *driver)
 }
 EXPORT_SYMBOL_GPL(scmi_driver_unregister);
 
+static void scmi_device_release_syspower(struct scmi_device *scmi_dev)
+{
+	if (scmi_dev->protocol_id == SCMI_PROTOCOL_SYSTEM)
+		cmpxchg(&scmi_syspower_registered, scmi_dev, NULL);
+}
+
 static void scmi_device_release(struct device *dev)
 {
 	struct scmi_device *scmi_dev = to_scmi_dev(dev);
 
+	scmi_device_release_syspower(scmi_dev);
 	kfree_const(scmi_dev->name);
 	kfree(scmi_dev);
 }
@@ -406,9 +412,7 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
 		 dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
 		 scmi_dev->name);
 
-	if (scmi_dev->protocol_id == SCMI_PROTOCOL_SYSTEM)
-		atomic_set(&scmi_syspower_registered, 0);
-
+	scmi_device_release_syspower(scmi_dev);
 	ida_free(&scmi_bus_id, scmi_dev->id);
 	device_unregister(&scmi_dev->dev);
 }
@@ -419,6 +423,7 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 {
 	int id, retval;
 	struct scmi_device *scmi_dev;
+	bool syspower = (protocol == SCMI_PROTOCOL_SYSTEM);
 
 	/*
 	 * If the same protocol/name device already exist under the same parent
@@ -431,39 +436,33 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 	if (scmi_dev)
 		return scmi_dev;
 
+	scmi_dev = kzalloc_obj(*scmi_dev);
+	if (!scmi_dev)
+		return NULL;
+
+	scmi_dev->protocol_id = protocol;
+
 	/*
-	 * Ignore any possible subsequent failures while creating the device
-	 * since we are doomed anyway at that point; not using a mutex which
-	 * spans across this whole function to keep things simple and to avoid
-	 * to serialize all the __scmi_device_create calls across possibly
-	 * different SCMI server instances (parent)
+	 * Reserve the singleton SystemPower protocol device using the device
+	 * pointer itself, so delayed release of an older device cannot clear
+	 * a reservation owned by a newer device.
 	 */
-	if (protocol == SCMI_PROTOCOL_SYSTEM &&
-	    atomic_cmpxchg(&scmi_syspower_registered, 0, 1)) {
+	if (syspower && cmpxchg(&scmi_syspower_registered, NULL, scmi_dev)) {
 		dev_warn(parent,
 			 "SCMI SystemPower protocol device must be unique !\n");
+		kfree(scmi_dev);
 		return NULL;
 	}
 
-	scmi_dev = kzalloc_obj(*scmi_dev);
-	if (!scmi_dev)
-		return NULL;
-
 	scmi_dev->name = kstrdup_const(name ?: "unknown", GFP_KERNEL);
-	if (!scmi_dev->name) {
-		kfree(scmi_dev);
-		return NULL;
-	}
+	if (!scmi_dev->name)
+		goto free_dev;
 
 	id = ida_alloc_min(&scmi_bus_id, 1, GFP_KERNEL);
-	if (id < 0) {
-		kfree_const(scmi_dev->name);
-		kfree(scmi_dev);
-		return NULL;
-	}
+	if (id < 0)
+		goto free_name;
 
 	scmi_dev->id = id;
-	scmi_dev->protocol_id = protocol;
 	scmi_dev->dev.parent = parent;
 	device_set_node(&scmi_dev->dev, of_fwnode_handle(np));
 	scmi_dev->dev.bus = &scmi_bus_type;
@@ -482,6 +481,12 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 	put_device(&scmi_dev->dev);
 	ida_free(&scmi_bus_id, id);
 	return NULL;
+free_name:
+	kfree_const(scmi_dev->name);
+free_dev:
+	scmi_device_release_syspower(scmi_dev);
+	kfree(scmi_dev);
+	return NULL;
 }
 
 static struct scmi_device *

-- 
2.43.0

