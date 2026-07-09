Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AB63F0746
	for <arm-scmi@vger.kernel.org>; Thu,  9 Jul 2026 08:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587194; cv=none; b=iMtMUd8k2lkNodI3In3sp36l596D0cFsf1vxEVqd40pOoJp7obsNsz2++Fe34zd3R6IJSAZnyB3+g6ucdE/d83DIEPFN3ijAC3z/IZILl0lac4PPJVJJrv/FcTiM9AZV2it2wEum9tLVL43NeBFSue3pY6gB6S1K8rkptTe8joM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587194; c=relaxed/simple;
	bh=kdKRkywuPTu45EEDZZPr3FBsixv1h/6Dw39RWsmiMZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hnf2oqHyK7RWcnIzSC+l0BYsKJDDGGF5hoXjG3nLxnBcy3YUgow43aNJwS59mJpbdhoVQh+xCHH6q7doJHBBsyzxgBIX91gEhef1FJeQaGIU4A5W0TLppoi/Lbti/zhy+JWDpa36N4vGI3TgNrc8i7SafMbQ5zNtyUAfj0rok3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MPPp0W59; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MPPp0W59"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFCFD1F00A3A;
	Thu,  9 Jul 2026 08:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587193;
	bh=3LmDNA6n/wCEDx/4MyjN30bZMYHbGggBnQ4KmGwZnlo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MPPp0W59Z8rDbt4ON9hFkZunDKX5mMp/vkE4HO0dy6ow4nlKGey+c8G7EGEzDQA+k
	 /Wm/ibfTdjlKaQ4CrU0UhPBon45iTFPRhxm2j4wzTcdDEC07ryL6EZgdQbXUQK1s6p
	 48y1NmuvWG+lZ2gndw5weiSz7f1MrBqVeDlJkQcsBIjPDpKd3OrzGP9D7RQVG0Cr15
	 CA/JTD2C6iQ+Je2J6/WV2igrqYn/bWKBobnqt2EUvgv3LefiOpCjR7Tei9u5FLQUQO
	 Gf6aIuyNkxe5RlZrQJ2aBtsx75+kBKnbLUxvjGXKuDp2zsUwL6aNgOYgV4huL37HIX
	 4vJN0LD9uO1Nw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 09 Jul 2026 09:52:39 +0100
Subject: [PATCH v5 15/16] firmware: arm_scmi: Fix SCMI device destroy
 lifetimes
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-scmi_core_fixes-v5-15-bea6a3024f05@kernel.org>
References: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
In-Reply-To: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
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

