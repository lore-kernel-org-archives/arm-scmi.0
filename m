Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5167215A864
	for <arm-scmi@vger.kernel.org>; Mon, 25 May 2026 20:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779741858; cv=none; b=IA8/wHGJu9oxrDLsn+Brd57Ih2a8UpJrG/Oc3zwVQbI5goTTHLZLk8Fj9FiWqx38GDeAHxuDha8OXJblSmXiTOwNf/iWsBu0UNXlLvViuyAF/ygqN9AKebiAjdzh4b2NhVUTQ4O5+A9DHY3iu/hJ8kwsLYtbHO0fzFu2xLlfhFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779741858; c=relaxed/simple;
	bh=U1ClHlyAsSw7FHn45czEa2yAaKoRZL29T5Ty0WiJ1ao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r5bCLCbrD/Qv729o92Qq8LXywREKQ/H9WUjwyu8RPLEA7iShXl98zkHqV5ON1ip8cytMTmJsElityjpyR3ZwqdSnCS8JpMM6f9e6BciMWQs6EiQmiZ5v0I2/0w6DNuR9uMpiXmWUTljPrEvb+2ChX46KDAxsffe8gATVoKG8Pf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bT0Qgt0z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bT0Qgt0z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A21F1F00A3A;
	Mon, 25 May 2026 20:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779741857;
	bh=Z+Vswv1R2Tz2UKBGbYKEv/x6VkVIjOVOoaSGhBHgA4Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bT0Qgt0zAb0KsLCcdo3K73oAGfjqHaGzo8UpQ5WBZAr5im1Gc6TJv2Xa0+w/Nfmm0
	 44AMqqNFLReRN8zaPWC8ivEOfj0d4uofiXzrfvX8hc8SQDZHKY0WQiXRaedhCzsasM
	 jW4xgk7UtDa+VsB6/wdK66UWeaMkDn3ulpmj5ovTPec7l0pZ9RqMzR1U5xBIqwD6/O
	 tfthOCnPPgkVVzVF56zVQfT8bJck781Kl6YzXRpUqS6rqaI3eNTKjb8GKOi7wUPKrE
	 CYH7nRJauVd9aK+W6VYtt+O9YoYP8RcsPKEva1iKmmI5LWiqZ58mjtklNeDnA4xjgp
	 R01UccPls8+VA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Mon, 25 May 2026 21:42:39 +0100
Subject: [PATCH v2 1/9] firmware: arm_scmi: Fix OF node reference handling
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-acpi_scmi_pcc-v2-1-4f38938d08d8@arm.com>
References: <20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com>
In-Reply-To: <20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

SCMI devices store the DT node in dev.of_node through
device_set_node(), but that helper only assigns the fwnode and
of_node pointers without taking an OF node reference.

Take a reference when assigning the node and release it from the
SCMI device release path. With the device owning that reference,
remove the separate channel-side get/put pair from the core driver.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/bus.c    | 3 ++-
 drivers/firmware/arm_scmi/driver.c | 4 ----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 793be9eabaed..7de45533b4c7 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -395,6 +395,7 @@ static void scmi_device_release(struct device *dev)
 {
 	struct scmi_device *scmi_dev = to_scmi_dev(dev);
 
+	of_node_put(scmi_dev->dev.of_node);
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
index f167194f7cf6..e04cb55e866a 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2748,13 +2748,11 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
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
@@ -2777,7 +2775,6 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 			"unable to allocate SCMI idr slot err %d\n", ret);
 		/* Destroy channel and device only if created by this call. */
 		if (tdev) {
-			of_node_put(of_node);
 			scmi_device_destroy(info->dev, prot_id, name);
 			devm_kfree(info->dev, cinfo);
 		}
@@ -2862,7 +2859,6 @@ static int scmi_chan_destroy(int id, void *p, void *idr)
 		struct scmi_info *info = handle_to_scmi_info(cinfo->handle);
 		struct scmi_device *sdev = to_scmi_dev(cinfo->dev);
 
-		of_node_put(cinfo->dev->of_node);
 		scmi_device_destroy(info->dev, id, sdev->name);
 		cinfo->dev = NULL;
 	}

-- 
2.43.0

