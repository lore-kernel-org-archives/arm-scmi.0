Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC2E30AD0C
	for <arm-scmi@vger.kernel.org>; Fri,  3 Jul 2026 20:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783110330; cv=none; b=myn/LofK1NFwIOPaSTIWHhMbJBKjItOXJdG8PVGBJnbg6ikRAzHxK78xL3beI4Q8SDZZdy775kw7MDJYR8PuKigVrK3Dok/auC6dcZ3q39PTu6beYRuJfbRhupnkAMVkOYu+okeUJuxPj1m13myYye59GDQ5xzU6iR23avZm7vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783110330; c=relaxed/simple;
	bh=m0wOg+sfytDcm1tyCudRzyHfrL6/kDdXwC/zx/ALKQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IGcPu5YHKj/wAVWCafb73lBybc2Cfqhfp9K4DzChNCudXANC2LiOJA2BFBJKvcdR9ja7ze2zwCzmghTRlVvJyL9qwd908YLI51Q8BW8EIUbFL0+83CT+rzkd2J1RdlMSHuzkhwcDC+WCaBOm03OcVeln4k6fJIdKdbgiOYt1XkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kYeNcYCe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kYeNcYCe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9276E1F00A3A;
	Fri,  3 Jul 2026 20:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783110329;
	bh=TGwmfRVd+YyFvuzvOFe8H0UypjWMFncHsObt4CQMVcM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kYeNcYCeXt/AoSjH3VqCIaTbVXtaBRAogku8aoW9hsPmdlX+q2iD8DHTMWTOeZpnj
	 ECA6RN4GqxfZ702bZqHi+FTlsTuRTDdkIcBk0dT6hXkrqZDiorolQ7Ad9QbUp9dl2g
	 EoFol0jGWbT8NliFvPFUF8AuiLJ8roveuP9TlzjHA7ghKzgU5KWp7GyK8mPkV5QBxQ
	 PVHNGoXG0RKJXjdZRwE6ZkOJ1pSM2k0KAapRrFGLzRbhxAxbd0Jr4t5EVhOcgBXQ5C
	 Y4xlX9kUQuG7hiIyz1qtoDUvAhNG4wcbb2NZ0939inyd6UPmTry2ORc7sfPeN1T6zU
	 6FSbXDZ1upkPg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 03 Jul 2026 21:22:37 +0100
Subject: [PATCH v3 01/17] firmware: arm_scmi: Fix OF node reference
 handling
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-scmi_core_fixes-v3-1-5bae9766abfc@kernel.org>
References: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
In-Reply-To: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

SCMI devices store the DT node in dev.of_node through
device_set_node(), but that helper only assigns the fwnode and
of_node pointers without taking an OF node reference.

Take a reference when assigning the node and release it from the
SCMI device release path. With the device owning that reference,
remove the separate channel-side get/put pair from the core driver.

Fixes: 96da4a99ce50 ("firmware: arm_scmi: Set fwnode for the scmi_device")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/bus.c    | 3 ++-
 drivers/firmware/arm_scmi/driver.c | 4 ----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 793be9eabaed..f643a1f0e282 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -395,6 +395,7 @@ static void scmi_device_release(struct device *dev)
 {
 	struct scmi_device *scmi_dev = to_scmi_dev(dev);
 
+	of_node_put(dev->of_node);
 	kfree_const(scmi_dev->name);
 	kfree(scmi_dev);
 }
@@ -465,7 +466,7 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 	scmi_dev->id = id;
 	scmi_dev->protocol_id = protocol;
 	scmi_dev->dev.parent = parent;
-	device_set_node(&scmi_dev->dev, of_fwnode_handle(np));
+	device_set_node(&scmi_dev->dev, of_fwnode_handle(of_node_get(np)));
 	scmi_dev->dev.bus = &scmi_bus_type;
 	scmi_dev->dev.release = scmi_device_release;
 	dev_set_name(&scmi_dev->dev, "scmi_dev.%d", id);
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 3e0d975ec94c..b9245238e293 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2778,13 +2778,11 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 		devm_kfree(info->dev, cinfo);
 		return -EINVAL;
 	}
-	of_node_get(of_node);
 
 	cinfo->id = prot_id;
 	cinfo->dev = &tdev->dev;
 	ret = info->desc->ops->chan_setup(cinfo, info->dev, tx);
 	if (ret) {
-		of_node_put(of_node);
 		scmi_device_destroy(info->dev, prot_id, name);
 		devm_kfree(info->dev, cinfo);
 		return ret;
@@ -2807,7 +2805,6 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 			"unable to allocate SCMI idr slot err %d\n", ret);
 		/* Destroy channel and device only if created by this call. */
 		if (tdev) {
-			of_node_put(of_node);
 			scmi_device_destroy(info->dev, prot_id, name);
 			devm_kfree(info->dev, cinfo);
 		}
@@ -2892,7 +2889,6 @@ static int scmi_chan_destroy(int id, void *p, void *idr)
 		struct scmi_info *info = handle_to_scmi_info(cinfo->handle);
 		struct scmi_device *sdev = to_scmi_dev(cinfo->dev);
 
-		of_node_put(cinfo->dev->of_node);
 		scmi_device_destroy(info->dev, id, sdev->name);
 		cinfo->dev = NULL;
 	}

-- 
2.43.0

