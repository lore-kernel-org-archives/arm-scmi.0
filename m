Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82F53FBEA4
	for <arm-scmi@vger.kernel.org>; Thu,  9 Jul 2026 08:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587189; cv=none; b=TigShoiqrKywlM86Sk8xgrm29R0+sonG0ttDHy/xzR65BKXH2yIG03JvuLGyQJAtOzomB30m+eKxG4u/Cfz2w+CThjs3i3/JhNg1yj6FyJTMQ90Sof5iADFlR0fukvQL2GbhTQXAZEFVpFt7KJL6NuinAHjyqeKPE/jtMyXCFak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587189; c=relaxed/simple;
	bh=Qpa7sHgGYChCnIl9iu5lxCyXUJomMKjB7xZz/HGNXE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nZ6cwGAdJUdvVCTLHA7LAJBm7S9RTfi2Jdn7pDHiHHADTBXJYFLiJ0xIglt8HF+6zuEowGrBlnjsBedGvDRO9zKTu8PCcyT/CGGClOxaazav5LdB9DODGV5+DwUir98wPKDwyejUpnZ3AEi53aOmXhPEzWOVlcTKZCzGGOcWw5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fnL3Yi/V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fnL3Yi/V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B1B71F00A3A;
	Thu,  9 Jul 2026 08:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587188;
	bh=j63KEgZfmI5uVi9AQ1/7Za7dPCkD9AQZOarKSl1v0vE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fnL3Yi/V+/eiWkzL6UguMGw4d7szBIeMxk7TUI3VpssM4M6QBfR43xdPvFVkGHjyw
	 Jq9N6x+cqN53jmMwYP/XPgUIqye3NvPhkx+cVAIc4qkDoKz+HDqjMksVs95ngwPPAO
	 HBInmNrjgC9ciVLAzNPy93KzLK74w4t19Oab/HtkxdBet/Ts8GcurgyjHOujMuOsiH
	 NxMUiKrrgl7+YTagUGKLL5rZly9P3cEjhABzKVIwkApKu7j0yKwO75axxQUuPCCW9b
	 UH1iPQZPrSYrF7qT9NSN8w+rQDBPvSMmD5f7vl2gkvxUFTOlEGVpc305cBVVsZ73Kf
	 QwU3TOcz1lNow==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 09 Jul 2026 09:52:34 +0100
Subject: [PATCH v5 10/16] firmware: arm_scmi: Drop handle on protocol bind
 failures
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-scmi_core_fixes-v5-10-bea6a3024f05@kernel.org>
References: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
In-Reply-To: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

The SCMI bus notifier acquires an SCMI handle when the driver core emits
BUS_NOTIFY_BIND_DRIVER, before invoking the protocol driver probe
callback. The protocol probe path only checks whether sdev->handle is
set.

If device_link_add() fails after the handle has been acquired, the
protocol device can still bind with a valid handle but without the
dependency link to the SCMI parent. A concurrent parent unbind can then
miss the child and tear down the SCMI instance while the child still
holds a handle into it.

If the protocol driver probe later fails, for example with
-EPROBE_DEFER, the driver core emits BUS_NOTIFY_DRIVER_NOT_BOUND rather
than BUS_NOTIFY_UNBOUND_DRIVER. The SCMI notifier only released the
handle on BUS_NOTIFY_UNBOUND_DRIVER, so each failed protocol-device bind
leaked the SCMI instance users refcount and left sdev->handle set after
the failed probe.

Make the link helper report failure and drop the acquired handle if the
link cannot be created. Also handle BUS_NOTIFY_DRIVER_NOT_BOUND in the
same cleanup path used for unbind so failed probes balance the earlier
BUS_NOTIFY_BIND_DRIVER acquisition.

Fixes: 971fc0665f13 ("firmware: arm_scmi: Move handle get/set helpers")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index a2871dca24dc..84d1294f269c 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2629,21 +2629,31 @@ static int scmi_handle_put(const struct scmi_handle *handle)
 	return 0;
 }
 
-static void scmi_device_link_add(struct device *consumer,
+static bool scmi_device_link_add(struct device *consumer,
 				 struct device *supplier)
 {
 	struct device_link *link;
 
 	link = device_link_add(consumer, supplier, DL_FLAG_AUTOREMOVE_CONSUMER);
 
-	WARN_ON(!link);
+	return !WARN_ON(!link);
+}
+
+static void scmi_clear_handle(struct scmi_device *scmi_dev)
+{
+	if (!scmi_dev->handle)
+		return;
+
+	scmi_handle_put(scmi_dev->handle);
+	scmi_dev->handle = NULL;
 }
 
 static void scmi_set_handle(struct scmi_device *scmi_dev)
 {
 	scmi_dev->handle = scmi_handle_get(&scmi_dev->dev);
-	if (scmi_dev->handle)
-		scmi_device_link_add(&scmi_dev->dev, scmi_dev->handle->dev);
+	if (scmi_dev->handle &&
+	    !scmi_device_link_add(&scmi_dev->dev, scmi_dev->handle->dev))
+		scmi_clear_handle(scmi_dev);
 }
 
 static int __scmi_xfer_info_init(struct scmi_info *sinfo,
@@ -2927,6 +2937,7 @@ static int scmi_bus_notifier(struct notifier_block *nb,
 {
 	struct scmi_info *info = bus_nb_to_scmi_info(nb);
 	struct scmi_device *sdev = to_scmi_dev(data);
+	const char *status;
 
 	/* Skip devices of different SCMI instances */
 	if (sdev->dev.parent != info->dev)
@@ -2936,18 +2947,22 @@ static int scmi_bus_notifier(struct notifier_block *nb,
 	case BUS_NOTIFY_BIND_DRIVER:
 		/* setup handle now as the transport is ready */
 		scmi_set_handle(sdev);
+		status = "about to be BOUND.";
+		break;
+	case BUS_NOTIFY_DRIVER_NOT_BOUND:
+		scmi_clear_handle(sdev);
+		status = "NOT BOUND.";
 		break;
 	case BUS_NOTIFY_UNBOUND_DRIVER:
-		scmi_handle_put(sdev->handle);
-		sdev->handle = NULL;
+		scmi_clear_handle(sdev);
+		status = "UNBOUND.";
 		break;
 	default:
 		return NOTIFY_DONE;
 	}
 
 	dev_dbg(info->dev, "Device %s (%s) is now %s\n", dev_name(&sdev->dev),
-		sdev->name, action == BUS_NOTIFY_BIND_DRIVER ?
-		"about to be BOUND." : "UNBOUND.");
+		sdev->name, status);
 
 	return NOTIFY_OK;
 }

-- 
2.43.0

