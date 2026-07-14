Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AF344CAC9
	for <arm-scmi@vger.kernel.org>; Tue, 14 Jul 2026 12:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784033922; cv=none; b=Ntpl0IvdDSC+8bfjyszz+GiZoYmVvG9ZIzxg6uEGA4QLGPbxwBL2+ApKCLq59NEfiMPAjqbVG8dOdjbP/jqrJWkcaHuVtskMk39WQEnpURjeb4g0pF1RTsAx2KtUdqTOKivAzWmQtnwJvYlGltCgWtW1yeIDqT0Ohl90Uj+Mubk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784033922; c=relaxed/simple;
	bh=Xb0MhSg8Hf6ZtX64aqLUF5KPXWgsuQtn0815kSvtq+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WxIwN3646p+5bOQoBP5T8ScrZSQ4i6xZjXeFgYkeVWHDZrMn0+9+OUn1oQpIS9q9e0A/FHCcRvLUeb+Y/lEDr43KI6+/v0wYdv67VF4DDxT4wcjZ3BF/vy3BjZzIwor8iVl8dEeKn/tor28oBfS+jAU2GrYhp25UjUVLEEoZTh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qpv2yZMo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qpv2yZMo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C9B11F00A3D;
	Tue, 14 Jul 2026 12:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784033920;
	bh=QOQi0GQwy8LOev89x4shyoqxLybJwHsxamnktAUjmeI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Qpv2yZMoV0IwLkDWYBeTujtcCkPjxoO392MiDs1lu7Pk/naBHnxQnDT/ZrjwOh/ig
	 EsonaUbiHchwnW1+LgZdbAhqGSmKVp5DN9oGY/4vBHSnU/7cCAISCtV+d0vbzP+zbx
	 nS0nTcfU8MoW9AR8IPzK7Eqx6fiMHcOoaY3jg8S/2AyLFkIQ3s3SQqp/NDhRnqh1cW
	 M11h0mAnRtXqK3tCFLUHSlqjYZZec5IN6f26nVlkL81NyMvEIriWCd9mmn4UgtNOht
	 gs5FFfQZWNL49SmSVkOrwOhqFL0LbVC5Zw4z/kpze8Vgrqs6uRtTBTTSPk10P7ykHf
	 58prhXcvKiZyg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 14 Jul 2026 13:56:22 +0100
Subject: [PATCH v6 03/16] firmware: arm_scmi: Quiesce notifications before
 teardown
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-scmi_core_fixes-v6-3-3afe499d46e3@kernel.org>
References: <20260714-scmi_core_fixes-v6-0-3afe499d46e3@kernel.org>
In-Reply-To: <20260714-scmi_core_fixes-v6-0-3afe499d46e3@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

scmi_notification_exit() clears and releases the notification instance,
but transport callbacks can still deliver incoming notifications until
the TX/RX channels are freed. During remove, an RX interrupt in that
window can enter scmi_notify() while notification state is being torn
down and then dereference freed memory. The same ordering exists on the
probe error path after notification initialization.

The notification late-init worker has a separate lifetime issue: protocol
event registration queues ni->init_work on the system workqueue, so
destroying ni->notify_wq does not drain that work. If the devres group is
released while init_work is still pending or running, the late-init worker
can dereference the freed notification instance.

Quiesce the notification core before TX/RX channels are torn down, then
clean up the channels before releasing the notification core resources.
Use disable_work_sync() so future late-init queueing is rejected and any
already queued or running late-init work has completed before channel
teardown starts.

Fixes: 1e7cbfaa66d3 ("firmware: arm_scmi: Free mailbox channels if probe fails")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 13 +++++++------
 drivers/firmware/arm_scmi/notify.c | 21 +++++++++++++++++++++
 drivers/firmware/arm_scmi/notify.h |  1 +
 3 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 52aff3aded4c..ec373595f955 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3325,7 +3325,7 @@ static int scmi_probe(struct platform_device *pdev)
 			dev_err(dev, "%s", err_str);
 			return 0;
 		}
-		goto notification_exit;
+		goto raw_mode_cleanup;
 	}
 
 	mutex_lock(&scmi_list_mutex);
@@ -3367,17 +3367,18 @@ static int scmi_probe(struct platform_device *pdev)
 
 	return 0;
 
-notification_exit:
+raw_mode_cleanup:
 	if (IS_ENABLED(CONFIG_ARM_SCMI_RAW_MODE_SUPPORT))
 		scmi_raw_mode_cleanup(info->raw);
-	scmi_notification_exit(&info->handle);
 clear_dev_req_notifier:
 	blocking_notifier_chain_unregister(&scmi_requested_devices_nh,
 					   &info->dev_req_nb);
 clear_bus_notifier:
 	bus_unregister_notifier(&scmi_bus_type, &info->bus_nb);
 clear_txrx_setup:
+	scmi_notification_quiesce(&info->handle);
 	scmi_cleanup_txrx_channels(info);
+	scmi_notification_exit(&info->handle);
 clear_ida:
 	ida_free(&scmi_id, info->id);
 
@@ -3404,6 +3405,9 @@ static void scmi_remove(struct platform_device *pdev)
 	blocking_notifier_chain_unregister(&scmi_requested_devices_nh,
 					   &info->dev_req_nb);
 
+	/* Stop transport callbacks before tearing down notifications. */
+	scmi_notification_quiesce(&info->handle);
+	scmi_cleanup_txrx_channels(info);
 	scmi_notification_exit(&info->handle);
 
 	mutex_lock(&info->protocols_mtx);
@@ -3416,9 +3420,6 @@ static void scmi_remove(struct platform_device *pdev)
 
 	bus_unregister_notifier(&scmi_bus_type, &info->bus_nb);
 
-	/* Safe to free channels since no more users */
-	scmi_cleanup_txrx_channels(info);
-
 	ida_free(&scmi_id, info->id);
 }
 
diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
index 40ec184eedae..3239c28d6fa9 100644
--- a/drivers/firmware/arm_scmi/notify.c
+++ b/drivers/firmware/arm_scmi/notify.c
@@ -1706,6 +1706,25 @@ int scmi_notification_init(struct scmi_handle *handle)
 	return -ENOMEM;
 }
 
+/**
+ * scmi_notification_quiesce()  - Stop notification late initialization
+ * @handle: The handle identifying the platform instance to quiesce
+ *
+ * Prevent new late-init work from being queued and wait for any already queued
+ * or running late-init work to complete before transport channels are torn
+ * down.
+ */
+void scmi_notification_quiesce(struct scmi_handle *handle)
+{
+	struct scmi_notify_instance *ni;
+
+	ni = scmi_notification_instance_data_get(handle);
+	if (!ni)
+		return;
+
+	disable_work_sync(&ni->init_work);
+}
+
 /**
  * scmi_notification_exit()  - Shutdown and clean Notification core
  * @handle: The handle identifying the platform instance to shutdown
@@ -1717,6 +1736,8 @@ void scmi_notification_exit(struct scmi_handle *handle)
 	ni = scmi_notification_instance_data_get(handle);
 	if (!ni)
 		return;
+
+	scmi_notification_quiesce(handle);
 	scmi_notification_instance_data_set(handle, NULL);
 
 	/* Destroy while letting pending work complete */
diff --git a/drivers/firmware/arm_scmi/notify.h b/drivers/firmware/arm_scmi/notify.h
index 76758a736cf4..f18f98c5ab3b 100644
--- a/drivers/firmware/arm_scmi/notify.h
+++ b/drivers/firmware/arm_scmi/notify.h
@@ -82,6 +82,7 @@ struct scmi_protocol_events {
 };
 
 int scmi_notification_init(struct scmi_handle *handle);
+void scmi_notification_quiesce(struct scmi_handle *handle);
 void scmi_notification_exit(struct scmi_handle *handle);
 int scmi_register_protocol_events(const struct scmi_handle *handle, u8 proto_id,
 				  const struct scmi_protocol_handle *ph,

-- 
2.43.0

