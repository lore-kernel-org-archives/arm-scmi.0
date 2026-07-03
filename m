Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5071B4F09
	for <arm-scmi@vger.kernel.org>; Fri,  3 Jul 2026 20:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783110333; cv=none; b=nynsDPa2WtcuvIn+TEOQc7fFc+cmWt7NiG9QVot3czdN2HDuUJKgHT0eT8qSU7Z3c3NE2nY7NBYAIpvUHaQ2fKhoSZTlA1z6CA4qJcmLaihimFSD/ZNkK+olh4/8knc9m1wiS3/BUWiBBfCriBr+iTk/gYPl72TYTazfyIeBwuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783110333; c=relaxed/simple;
	bh=25kQy/zlcj00LuE6ddoUmd+Tc1hrM8lQLt06A78U8jc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HdZsECSM4Z+NQg8KZlVWqD1i2ISW2ijMFu0beYa3d1KF8G74PoSo6EjujGFw92WFIsITioJcnPuHDXpw7I9OwPY3DTck5XODgv1FD1im1DL0MJr6aPjCv/tKbEeG9sATfXJFNxQvv2IWJHWGTMgkFyKevz1TThoxdBdLCAmKWGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a2alAJuF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a2alAJuF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6450C1F00A3F;
	Fri,  3 Jul 2026 20:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783110332;
	bh=qxc2gFJimpVn/+J/EPqtVGAE3aPM3BQpc13HFfekQmY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=a2alAJuFp4JwG/S1sOIjsWHoNN+Tw9RJHLNKjGGrdwSZ/qhPNnDw7KOyy/6TOgpoM
	 CovVZfsbXWtIDBaircpcFGldVIrHV77ynplm94qJshvEVvLDetCwdEEpYr/QinuiAE
	 XR/pmTWMFTeJNFZRFot3Wk0Rltad3GUc6lXcqKYIeCvZUSKaMTKc36O+LVezOwE9nc
	 5t5RJz9D2U28J3R9CrexO+pRxZu2t4I1P9pXCEr1VTW70b2UxNlfiJVdY3qqFVYHe9
	 jp9AH+RIUnUgb/fNoVkZRJ64qUBbd2yjjkdKGyoeuCxyFrOzdqmQ3mYRudwxVF0XQB
	 XwHscVU9RmIwA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 03 Jul 2026 21:22:40 +0100
Subject: [PATCH v3 04/17] firmware: arm_scmi: Fix SCMI device destroy
 lifetimes
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-scmi_core_fixes-v3-4-5bae9766abfc@kernel.org>
References: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
In-Reply-To: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

scmi_child_dev_find() drops the reference returned by
device_find_child() before returning the scmi_device pointer. A
concurrent unregister can then release the device while the destroy path
is still using the returned pointer.

Make the lookup helper return the device_find_child() reference and keep
it until scmi_device_destroy() has finished unregistering the child.

Also split device_unregister() in __scmi_device_destroy() so the SCMI bus
ID is not made reusable until after device_del() has removed the old
scmi_dev.N name from sysfs. This avoids a new SCMI device reusing the
same ID while the old device is still registered.

The final device release callback is also a possible cleanup path when
SCMI children are deleted by driver core recursion rather than
__scmi_device_destroy(). Release the SCMI bus ID from a common helper
used by destroy, register-failure and final-release paths, and clear
scmi_dev->id after freeing it so the final release cannot free the same
ID again.

Fixes: 46edb8d1322c ("firmware: arm_scmi: provide the mandatory device release callback")
Fixes: 9ca67840c0dd ("firmware: arm_scmi: Balance device refcount when destroying devices")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/bus.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index d4beefa4234f..cbd2e6058210 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -250,8 +250,9 @@ static int scmi_match_by_id_table(struct device *dev, const void *data)
 	return __scmi_dev_match_by_id_table(scmi_dev, id_table, false);
 }
 
-static struct scmi_device *scmi_child_dev_find(struct device *parent,
-					       int prot_id, const char *name)
+/* Returns a device_find_child() reference which must be dropped by caller. */
+static struct scmi_device *
+scmi_child_dev_find_get(struct device *parent, int prot_id, const char *name)
 {
 	struct scmi_device_id id_table[2] = { 0 };
 	struct device *dev;
@@ -263,9 +264,6 @@ static struct scmi_device *scmi_child_dev_find(struct device *parent,
 	if (!dev)
 		return NULL;
 
-	/* Drop the refcnt bumped implicitly by device_find_child */
-	put_device(dev);
-
 	return to_scmi_dev(dev);
 }
 
@@ -403,10 +401,19 @@ void scmi_driver_unregister(struct scmi_driver *driver)
 }
 EXPORT_SYMBOL_GPL(scmi_driver_unregister);
 
+static void scmi_device_release_resources(struct scmi_device *scmi_dev)
+{
+	if (scmi_dev->id) {
+		ida_free(&scmi_bus_id, scmi_dev->id);
+		scmi_dev->id = 0;
+	}
+}
+
 static void scmi_device_release(struct device *dev)
 {
 	struct scmi_device *scmi_dev = to_scmi_dev(dev);
 
+	scmi_device_release_resources(scmi_dev);
 	of_node_put(dev->of_node);
 	kfree_const(scmi_dev->name);
 	kfree(scmi_dev);
@@ -422,8 +429,9 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
 	if (scmi_dev->protocol_id == SCMI_PROTOCOL_SYSTEM)
 		atomic_set(&scmi_syspower_registered, 0);
 
-	ida_free(&scmi_bus_id, scmi_dev->id);
-	device_unregister(&scmi_dev->dev);
+	device_del(&scmi_dev->dev);
+	scmi_device_release_resources(scmi_dev);
+	put_device(&scmi_dev->dev);
 }
 
 static struct scmi_device *
@@ -440,9 +448,11 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 	 * each DT defined protocol at probe time, and the concurrent
 	 * registration of SCMI drivers.
 	 */
-	scmi_dev = scmi_child_dev_find(parent, protocol, name);
-	if (scmi_dev)
+	scmi_dev = scmi_child_dev_find_get(parent, protocol, name);
+	if (scmi_dev) {
+		put_device(&scmi_dev->dev);
 		return scmi_dev;
+	}
 
 	/*
 	 * Ignore any possible subsequent failures while creating the device
@@ -492,8 +502,8 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 
 	return scmi_dev;
 put_dev:
+	scmi_device_release_resources(scmi_dev);
 	put_device(&scmi_dev->dev);
-	ida_free(&scmi_bus_id, id);
 	return NULL;
 }
 
@@ -574,9 +584,11 @@ void scmi_device_destroy(struct device *parent, int protocol, const char *name)
 {
 	struct scmi_device *scmi_dev;
 
-	scmi_dev = scmi_child_dev_find(parent, protocol, name);
-	if (scmi_dev)
+	scmi_dev = scmi_child_dev_find_get(parent, protocol, name);
+	if (scmi_dev) {
 		__scmi_device_destroy(scmi_dev);
+		put_device(&scmi_dev->dev);
+	}
 }
 EXPORT_SYMBOL_GPL(scmi_device_destroy);
 

-- 
2.43.0

