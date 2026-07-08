Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8114071C1
	for <arm-scmi@vger.kernel.org>; Wed,  8 Jul 2026 09:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783501241; cv=none; b=c3D0dYc2SBnbB1EWnFc1BGYlq6s3KFiD+82Oi2L0wLCRdWVWNPsjcTZ+iOi+QY0DFIyFgVQerESjtjtpuuShxJfBKHavehhGiFbBFeuv4Q819BQRYomK/S9HYrriITXWAwjJi62Thyr1bPzWMlD6Al54XHubsuNWbxXCw71eFqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783501241; c=relaxed/simple;
	bh=Cs/ZSnMZwFzFD+TqYggRUQqvhJCbCCJAXmnUHDggwD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S7JevYegMKjlBvSTwLVeT8Ne35sqKkK1JhoAcMkIR+VuNrsVI3mJ0m3zjTWeDNbbApqSAy7pQ/cQv4fcUhlGyDeiiJx5sxUaf8Mwg4BRvnm71j5SnQBrqNWQo/SEeEcds4gIUMniIypq1FtWlyZQY00HCEcidMKBU0BqwAzbMS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AiexbsC/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AiexbsC/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D61491F00ACA;
	Wed,  8 Jul 2026 09:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783501236;
	bh=u8XbDlrGsoh7Ws9WTn9JiFPujht9GtEtWpZVuFjT17s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AiexbsC/7tz1c2R0hv1EBFvpStrU3WtapvUq5CtopcQx93d0Xv9rGwiWmt8pzjovn
	 IhAKEs93q2E67UmT7MNLw7GwIFbUus+bnXruAJ2pVg8EB5SOrj+Q8IgcuSaYuRPWVB
	 1eEKpsQFdWkjEBW451u6s8/u3AYUxCPMw0YBZbi+ygxIeNpAxESUpXDIJeP0wfwriO
	 uHJR6eAZO/6xYwvW5e9dpOp1taKFIDf0vVCdN0nSq3nGHBNgweh8NcbkMnHdA3Upj+
	 NnkEa8xxg6eL3h3v9Rvc4+kK5v4gkTej1AU2JQAAxal6g2JNlgbK6pAtxTypT7z6ZF
	 QXvscAE1CxWZQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 08 Jul 2026 10:00:08 +0100
Subject: [PATCH v4 12/16] firmware: arm_scmi: Fix OF node reference
 handling
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-scmi_core_fixes-v4-12-53142cd60b63@kernel.org>
References: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
In-Reply-To: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
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
index dcaefc1aa892..a14df82a9310 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -401,6 +401,7 @@ static void scmi_device_release(struct device *dev)
 	struct scmi_device *scmi_dev = to_scmi_dev(dev);
 
 	scmi_device_release_syspower(scmi_dev);
+	of_node_put(dev->of_node);
 	kfree_const(scmi_dev->name);
 	kfree(scmi_dev);
 }
@@ -464,7 +465,7 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 
 	scmi_dev->id = id;
 	scmi_dev->dev.parent = parent;
-	device_set_node(&scmi_dev->dev, of_fwnode_handle(np));
+	device_set_node(&scmi_dev->dev, of_fwnode_handle(of_node_get(np)));
 	scmi_dev->dev.bus = &scmi_bus_type;
 	scmi_dev->dev.release = scmi_device_release;
 	dev_set_name(&scmi_dev->dev, "scmi_dev.%d", id);
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 3e0f0fac9626..515ae884bb2c 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2789,14 +2789,12 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 		devm_kfree(info->dev, cinfo);
 		return -EINVAL;
 	}
-	of_node_get(of_node);
 
 	cinfo->id = prot_id;
 	cinfo->dev = &tdev->dev;
 	cinfo->handle = &info->handle;
 	ret = info->desc->ops->chan_setup(cinfo, info->dev, tx);
 	if (ret) {
-		of_node_put(of_node);
 		scmi_device_destroy(info->dev, prot_id, name);
 		devm_kfree(info->dev, cinfo);
 		return ret;
@@ -2820,7 +2818,6 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 		/* Destroy channel and device only if created by this call. */
 		if (tdev) {
 			info->desc->ops->chan_free(prot_id, cinfo, idr);
-			of_node_put(of_node);
 			scmi_device_destroy(info->dev, prot_id, name);
 			devm_kfree(info->dev, cinfo);
 		}
@@ -2906,7 +2903,6 @@ static int scmi_chan_destroy(int id, void *p, void *data)
 		struct scmi_info *info = handle_to_scmi_info(cinfo->handle);
 		struct scmi_device *sdev = to_scmi_dev(cinfo->dev);
 
-		of_node_put(cinfo->dev->of_node);
 		scmi_device_destroy(info->dev, cinfo->id, sdev->name);
 		cinfo->dev = NULL;
 	}

-- 
2.43.0

