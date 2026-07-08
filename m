Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FF03FC5A8
	for <arm-scmi@vger.kernel.org>; Wed,  8 Jul 2026 09:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783501236; cv=none; b=LhStorxW4HQZEGqCWYqQVag8EAAhR6Y5NkDCJ61P5KRcsWfT+Phrx/3b75kSdlqChFxsvNCQKnaO1BzuYPfp6ZViPgpTRUEydQ686RIMsUYTed+gc3afraiyNPGmnzV2dx4hnvAXHKUM0pgMGIPI+TjeRMFBbggq0YjpqHpYpak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783501236; c=relaxed/simple;
	bh=VwN/TpbubZS84isYsTyynTrFqDAraLPsjxYhEknTqTk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DvPgl9GaMH/kVV7UVl8ovlnflbP7vcTnRyDQbmLf7uqn8F6y5FuKboenabki4Ibx7G2z6dkcQGXTQlbmDBNLM/Hijfo5JZStlZDgmwQF1a/XUClmjpqWUAochrA/gn2rdCGfkPkqvuPhBhXNRe5rJandNjU+q8d0SBB4S4RIFVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i3RUqeVU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i3RUqeVU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2EF71F00A3A;
	Wed,  8 Jul 2026 09:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783501234;
	bh=BybbGgDiYgbz9TZX1FD4MxIQneZDoTZK5llcNLbHG8c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=i3RUqeVUGYa7012mJuLHBrb4cf5FE3G2MDlS89NcgC6xE+mIgTJc5IxeoaNqZQTm6
	 3T9rgtXKD/Lkn2oezaPtyIIvHJO0sP0mXqFxMZk/7jdC69fPzgVksr76EZ9HmtzPUi
	 jQmLyk/SGhsShNGihsLOA2tFCdRcScSf6wPnD8tesW43uOcciN4oQowhqdOcJqBl4O
	 hppYJ2M8nrN5BPKguHf8gIdraBSQHuW+IGwZ2P83ggyBL9pzP/ss8qTV3XKBSWIQaq
	 /rtxJbWhfUFVDB8U4adEeffiXoiUdlUvVeFKzj5IiEEv1TCcnPda5/ZFwshKRLmHq/
	 6qc9FXPurm6PQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 08 Jul 2026 10:00:06 +0100
Subject: [PATCH v4 10/16] firmware: arm_scmi: Drop handle on protocol bind
 failures
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-scmi_core_fixes-v4-10-53142cd60b63@kernel.org>
References: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
In-Reply-To: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
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
index 73cfe2eaacea..3e0f0fac9626 100644
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

