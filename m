Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A820D3EFD30
	for <arm-scmi@vger.kernel.org>; Thu,  9 Jul 2026 08:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587191; cv=none; b=g2TVNzXA/soOwcx58cm9yI524TI12SHKZ394WtqDnYFGUXPA3kZrSTJRtTQ/53+eYYiUkhchfFUumqcph4RgSlxgA1RSkHoLhkLAQczH9DqsBGUdSw5SbXeALern34XTEGk9B8TUJwgxAyHdzBo8zw+0MhDxbkEDMUC4vl9D2a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587191; c=relaxed/simple;
	bh=PDTeTHF7HnDk7xRPF4Oo9ijNRuAcJuOj/UfV5LF7mDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PpKF/cuvyRrk6FVg+CO/D7QVPZh9D1DMqdSvbgU8tE7cGNWmPHKo0ZsKZUssviIyr5lg7qDOIXLL5jMkU/C4eYLS8kt4Jr1eUyiYI4MxrKVoxkT8nJhLOndhuKhkTaZprmzIU6nHZpu0yPk88Fnqyv9ZFUuuTPNBfQLSDZdwryU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PP9Idy69; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PP9Idy69"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B75E1F00A3A;
	Thu,  9 Jul 2026 08:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587190;
	bh=ehQFaZwB++NiZIOgrY7uUtxuBIui57J6SGoKkKl6y/o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PP9Idy69pIrBhW81LnLYxrRXudK3gAI1k9/gUP2BD+HI9Mo6MoPp5+6zuErmu4LcS
	 Xm+mhb5Iv2CyMM7UwwuPD18psoJ3rEAJSXn9A/xgcYThS6n2FExl5tESCjtCnvWIyI
	 XSoaJi9hVnlavhzzvv/xAAjR8UussSMkx+0l7ju4qhXx2JfhPbLni2wgJ7zQe8rILj
	 Ns4O3OLPzlov2RhO+2BWai4Z2KsnkYBCVdoyLm7U1blojB9PiHcubxA6zpgGJJPO9T
	 KqeDR9Fm3nJ4ZMDGvTuMgOY9IMjTq7Lw2VIFMlnKiI+A0Qk1LyqlMi702PoAX/7TQ8
	 agdEuf1YpOkcw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 09 Jul 2026 09:52:36 +0100
Subject: [PATCH v5 12/16] firmware: arm_scmi: Fix OF node reference
 handling
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-scmi_core_fixes-v5-12-bea6a3024f05@kernel.org>
References: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
In-Reply-To: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
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
index 84d1294f269c..532f1f65b2ab 100644
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

