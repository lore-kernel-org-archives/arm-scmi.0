Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F993DCDAC
	for <arm-scmi@vger.kernel.org>; Wed,  8 Jul 2026 09:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783501241; cv=none; b=lIrq0CP4vEorXwjZYJCka/6M+OecIwq6UpPtakhHCFbK8jOp15KiXb0nSbym8/oXd6KdFoWEG+kZN202GQf9oZIEZo7dW7GEw1JV3ZXY9O6m25N7WIapbEzNYhq8DCc4YhV4LR9zfjDKeh5Y9WMJ2dh1KqUWontfxnvmIxs4Xms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783501241; c=relaxed/simple;
	bh=kdKRkywuPTu45EEDZZPr3FBsixv1h/6Dw39RWsmiMZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bAhjrEc0bZ2o0vpeQGA/y5FXJ0XgyQakmq1MeqJUjDFmjWL88IwKeQZBhqEL5Ry30Rg0Z7a4Z8NREpDbDkD5qnnVQ+HfnZxT/8WxF65rmL4wOS+XIFLvm03lmoBbp1wD17F6pPk2gv6scqNX5qXw7qpPaFlglnHBAG5sM1fJKqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PkOlbRxv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PkOlbRxv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB8E91F000E9;
	Wed,  8 Jul 2026 09:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783501239;
	bh=3LmDNA6n/wCEDx/4MyjN30bZMYHbGggBnQ4KmGwZnlo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PkOlbRxvYBy07ZQfhwTUPtOOyauaQURLx32jDAzDzQIt8wbtBl6pp7rUkbEpa87pu
	 Dtbj2UnVfQp25A3c5ke3n8xPgB3kkiJ9BV6nm+3eia+5iBzzLrWbDD3suUA4kSqmP3
	 Hzwm+ipIGKaDLvCW6iVTjy82o588QuDibIsNSHkBDT6Jj5UoLWhbvBcRAutLgyiURr
	 c8auVr5GPJ0ESEjwR43qh/JWazmB5UB3o0CpqIMX8ESasSABsdEtTPhUakmf7rE8E3
	 XFf+0rxPNaZ9lajywMnAM3nQWstobUyJEWoI3ecODMlVPBm3bV9i3hJDfLZV1B2MIX
	 qmimIkoNUAmAQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 08 Jul 2026 10:00:11 +0100
Subject: [PATCH v4 15/16] firmware: arm_scmi: Fix SCMI device destroy
 lifetimes
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-scmi_core_fixes-v4-15-53142cd60b63@kernel.org>
References: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
In-Reply-To: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
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

Fixes: 9ca67840c0dd ("firmware: arm_scmi: Balance device refcount when destroying devices")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/bus.c | 39 +++++++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index a14df82a9310..e1f66c08c81d 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -237,8 +237,9 @@ static int scmi_match_by_id_table(struct device *dev, const void *data)
 	return scmi_dev_match_by_id_table(scmi_dev, id_table);
 }
 
-static struct scmi_device *scmi_child_dev_find(struct device *parent,
-					       int prot_id, const char *name)
+/* Returns a device_find_child() reference which must be dropped by caller. */
+static struct scmi_device *
+scmi_child_dev_find_get(struct device *parent, int prot_id, const char *name)
 {
 	struct scmi_device_id id_table[2] = { 0 };
 	struct device *dev;
@@ -250,9 +251,6 @@ static struct scmi_device *scmi_child_dev_find(struct device *parent,
 	if (!dev)
 		return NULL;
 
-	/* Drop the refcnt bumped implicitly by device_find_child */
-	put_device(dev);
-
 	return to_scmi_dev(dev);
 }
 
@@ -390,17 +388,22 @@ void scmi_driver_unregister(struct scmi_driver *driver)
 }
 EXPORT_SYMBOL_GPL(scmi_driver_unregister);
 
-static void scmi_device_release_syspower(struct scmi_device *scmi_dev)
+static void scmi_device_release_resources(struct scmi_device *scmi_dev)
 {
 	if (scmi_dev->protocol_id == SCMI_PROTOCOL_SYSTEM)
 		cmpxchg(&scmi_syspower_registered, scmi_dev, NULL);
+
+	if (scmi_dev->id) {
+		ida_free(&scmi_bus_id, scmi_dev->id);
+		scmi_dev->id = 0;
+	}
 }
 
 static void scmi_device_release(struct device *dev)
 {
 	struct scmi_device *scmi_dev = to_scmi_dev(dev);
 
-	scmi_device_release_syspower(scmi_dev);
+	scmi_device_release_resources(scmi_dev);
 	of_node_put(dev->of_node);
 	kfree_const(scmi_dev->name);
 	kfree(scmi_dev);
@@ -413,9 +416,9 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
 		 dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
 		 scmi_dev->name);
 
-	scmi_device_release_syspower(scmi_dev);
-	ida_free(&scmi_bus_id, scmi_dev->id);
-	device_unregister(&scmi_dev->dev);
+	device_del(&scmi_dev->dev);
+	scmi_device_release_resources(scmi_dev);
+	put_device(&scmi_dev->dev);
 }
 
 static struct scmi_device *
@@ -433,9 +436,11 @@ __scmi_device_create(struct device_node *np, struct device *parent,
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
 
 	scmi_dev = kzalloc_obj(*scmi_dev);
 	if (!scmi_dev)
@@ -479,13 +484,13 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 
 	return scmi_dev;
 put_dev:
+	scmi_device_release_resources(scmi_dev);
 	put_device(&scmi_dev->dev);
-	ida_free(&scmi_bus_id, id);
 	return NULL;
 free_name:
 	kfree_const(scmi_dev->name);
 free_dev:
-	scmi_device_release_syspower(scmi_dev);
+	scmi_device_release_resources(scmi_dev);
 	kfree(scmi_dev);
 	return NULL;
 }
@@ -567,9 +572,11 @@ void scmi_device_destroy(struct device *parent, int protocol, const char *name)
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

