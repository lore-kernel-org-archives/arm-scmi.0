Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29ED93CF95E
	for <arm-scmi@vger.kernel.org>; Tue, 30 Jun 2026 09:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782810399; cv=none; b=Iiql9xJu7diLj96oqsooeIZXUg1agWNvTx4MjVjUe8dSSSl4nhl929wn1JRgNcjxROZiMRWDCHEFfU2iRk+EhF9547L6ctzhvwOS/WqE6qjyTRRgJGdkQ/SAT8hrzQYQiCDFaIuf7XIL8XvChhTrPIFeIZDqe9okrSKPfiLe/OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782810399; c=relaxed/simple;
	bh=m0wOg+sfytDcm1tyCudRzyHfrL6/kDdXwC/zx/ALKQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CjCLgUoODe3/65G5rTzxdKs1SJsAtZU3eMwx91za8NYXjvR/hoPqzSyzU5yFafzxBf7CyWf2ZZYvcTQpJ8PDKfz8x1soqDsgQauu+urZY5LQjeUBsf4OspgLXzDdVgb6MMeYuMac2vsi1kJ0i58rG2gcyH637Ud/8UEyTFOfAE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ELSOEmft; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ELSOEmft"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F1CF1F00A3E;
	Tue, 30 Jun 2026 09:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782810398;
	bh=TGwmfRVd+YyFvuzvOFe8H0UypjWMFncHsObt4CQMVcM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ELSOEmftiRcI5+NKiPFYvcSbAaq3ScnhAMQNJCSdoWlwR2nsWUKaN0jSiRu+1kDZy
	 hJopDvu6p+bQiIRcmpMxNjqFwh102WuEmNI/+QY3e7D0tEg9gOPi+J0lEORsSnt1pJ
	 EPr6pGWSM10cdoXvwjMUCyPzOsNJr1JeYNAQ5I/+YOjx2Jqpn67mkrGn0wDOTCayFo
	 vStauyVA93rP5bokmfLdq4HOHHBz+ZgYKi3H1eCpwCfFOu1aWe/DFZiEpkcr7bNxeG
	 szIdRbY5/wsXJCiqlFUbAuk9KXXq/vvUahmgyTeiFxflfXhFrEpVQ8gfI6bv2rvGOm
	 oX2WXFCzIK+hg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 30 Jun 2026 10:05:57 +0100
Subject: [PATCH 1/9] firmware: arm_scmi: Fix OF node reference handling
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-scmi_core_fixes-v1-1-f932c1e51992@kernel.org>
References: <20260630-scmi_core_fixes-v1-0-f932c1e51992@kernel.org>
In-Reply-To: <20260630-scmi_core_fixes-v1-0-f932c1e51992@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>
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

