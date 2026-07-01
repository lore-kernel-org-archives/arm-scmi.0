Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9767E36165F
	for <arm-scmi@vger.kernel.org>; Wed,  1 Jul 2026 16:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924801; cv=none; b=DTtiwrYN4marpszU/r+trxgfpZlgjC3vNXh1gAlL4VT/FIzXRzQMzXug6UON/tkJc0rtZ8dNj38zccBCAI6nIJcpQNbdSmjhs83mrZUcVKj4+zFFxLFrtD5Lb355Z3kS6Ro7xj3KIK9MDA+7DWZ4nKSR9fOIR8EGVcLMfv8IOCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924801; c=relaxed/simple;
	bh=wix0Xh1YQutzSBWTyKn7+sahuxEeGpjwiQBOQw/nlfc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Af6jky6KaOZ84oLi8hbE9h1NIyrOyn+HJvFRZykJHXMIYfKQOiem0IBEKQXTkWBGW52PV+ia1/C98xR+pfX92VZrGA8ZoqtpW7/amLe3dlr/F0tBskDLj7BGAJiguuWCTtEBMYso5oDN5B/JJaT8pNiEgQXFq6cCkpG57pDRKNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G7NSELVW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G7NSELVW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDBAB1F00A3A;
	Wed,  1 Jul 2026 16:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782924800;
	bh=WI8N45gPmQ8iJjB+GBzTf6cfCJJQqV/EJ7frAbCwTn0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=G7NSELVWGhn1RRD/UspFPix48SEfW9DsnTHHdzwPeUCzJlyqr5ysZ2XwiNC/g9yjM
	 WH0TRv2ATNPdmReEyfwYqsFBxM64UNnNzkqG+QmoeI91rZk7Yira2gApWhQ9Opmr7E
	 dMpCHmiMT7kWhuklMVrGGZ8pw4RIB9B193qtG6myEVk729TU6cVRI/Me0A/WwvgBrD
	 EKyZEF7TpIb7Dad0flVx/xIzEepVldt+3n/DAcNajIDhHCL2afAJKpodkw+Hv1nEK2
	 QJ9nZmzzG46EpQEBNR0AhTO9T2Bn5xrq1FyP/zdV9bBzeDzmOaRVPbMxwrrrWjJG3T
	 tpD+HpHhkSsmg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 01 Jul 2026 17:52:25 +0100
Subject: [PATCH v2 04/14] firmware: arm_scmi: Fix SCMI device destroy
 lifetimes
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-scmi_core_fixes-v2-4-1f5e85553f73@kernel.org>
References: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
In-Reply-To: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
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

Fixes: 46edb8d1322c ("firmware: arm_scmi: provide the mandatory device release callback")
Fixes: 9ca67840c0dd ("firmware: arm_scmi: Balance device refcount when destroying devices")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/bus.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index d4beefa4234f..e1deb1b3011d 100644
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
 
@@ -422,8 +420,9 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
 	if (scmi_dev->protocol_id == SCMI_PROTOCOL_SYSTEM)
 		atomic_set(&scmi_syspower_registered, 0);
 
+	device_del(&scmi_dev->dev);
 	ida_free(&scmi_bus_id, scmi_dev->id);
-	device_unregister(&scmi_dev->dev);
+	put_device(&scmi_dev->dev);
 }
 
 static struct scmi_device *
@@ -440,9 +439,11 @@ __scmi_device_create(struct device_node *np, struct device *parent,
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
@@ -492,8 +493,8 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 
 	return scmi_dev;
 put_dev:
+	ida_free(&scmi_bus_id, scmi_dev->id);
 	put_device(&scmi_dev->dev);
-	ida_free(&scmi_bus_id, id);
 	return NULL;
 }
 
@@ -574,9 +575,11 @@ void scmi_device_destroy(struct device *parent, int protocol, const char *name)
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

