Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038D8407CC8
	for <arm-scmi@vger.kernel.org>; Thu,  9 Jul 2026 08:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587184; cv=none; b=NZzji+olltt6dPZaXgm1mdaJrVg2Rgj4Rot0SJ6m+5BXVrEXTmUi4Iye9gkrERcYETU2knPDW1hxdkevAmZqEvimWffm420/ySOWeism0I6CqO+yz2GfYwZ7RDfNMJfiQbUCVZxkVQ6aAsjexwzg104LzlcLsyhAawDOYwWAV28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587184; c=relaxed/simple;
	bh=y1fwmZ9pqwFY+jKXDrZVJVPRw3hDDmqW3kGYjzSvT8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IVPaLJapL1bH7LJucVqGhuH9pGh3KFVD5c1Aqe44mhU5u7eUTvDIAwjVkl4H1jp6LEy+3NOzrIM/WCBkb+KPmkIt1doz3hhpsjq7oY0qgJShbp9bvG2LIIPDbkQ5IDiNEw+4AAR96YKKTY7TYZ+nJ2acoSwCphCdml4xsUbwHZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=exN32Z6e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="exN32Z6e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9B0E1F00A3D;
	Thu,  9 Jul 2026 08:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587181;
	bh=UwVEbwj4d7me//Hg1skJQ018XqqImwex0pEPqXzq6D0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=exN32Z6eN3j5Uy6le9C6EpTDxYH6+lAxzkP1wlc2fL+DgwsRsDg0z08lAj03KD3w+
	 kaXFBF1oTohLFb8AowhkZJnMIHP+mWiiE/UUU+o3ELRJTu+fdjksqsiqflglLFmWk7
	 S/+eljlHAKx0tVDf33Am8eHRkzHcbDtwCqYxgDSPilIMc9R3jTAYy77LqB0F1LfClF
	 tmbrGNqaupor/gd2bI3QYdd8lv5bqPozoG2IP4vMx81hfgFS7mEcJ/JONI4PNcxshL
	 BQMhpf49zJqsAuc9AFQVRnKVCUSMx8Sg4PKU5ju54r8DsahsDPWjizWW/NmYv9So+X
	 nPkUzLjPegy7g==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 09 Jul 2026 09:52:26 +0100
Subject: [PATCH v5 02/16] firmware: arm_scmi: Quiesce notifications before
 teardown
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-scmi_core_fixes-v5-2-bea6a3024f05@kernel.org>
References: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
In-Reply-To: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

scmi_notification_exit() clears and releases the notification instance, but
transport callbacks can still deliver incoming notifications until the
TX/RX channels are freed. During remove, an RX interrupt in that window can
enter scmi_notify() while notification state is being torn down and then
dereference freed memory. The same ordering exists on the probe error path
after notification initialization.

The notification late-init worker has a separate lifetime issue: protocol
event registration queues ni->init_work on the system workqueue, so
destroying ni->notify_wq does not drain that work. If the devres group is
released while init_work is still pending or running, the late-init worker
can dereference the freed notification instance.

Unregister the requested device notifier first, quiesce the notification
core so no late-init work can run while channels are being torn down, then
clean up TX/RX channels before releasing the notification core resources.
The final notification exit path also cancels any pending late-init work
before destroying the notification workqueue and releasing the notification
devres group.

Fixes: 1e7cbfaa66d3 ("firmware: arm_scmi: Free mailbox channels if probe fails")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 13 +++++++------
 drivers/firmware/arm_scmi/notify.c | 32 +++++++++++++++++++++++++++++++-
 drivers/firmware/arm_scmi/notify.h |  1 +
 3 files changed, 39 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 1d1f5d25d773..1354de59ea84 100644
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
 
@@ -3401,6 +3402,9 @@ static void scmi_remove(struct platform_device *pdev)
 	list_del(&info->node);
 	mutex_unlock(&scmi_list_mutex);
 
+	/* Stop transport callbacks before tearing down notifications. */
+	scmi_notification_quiesce(&info->handle);
+	scmi_cleanup_txrx_channels(info);
 	scmi_notification_exit(&info->handle);
 
 	mutex_lock(&info->protocols_mtx);
@@ -3415,9 +3419,6 @@ static void scmi_remove(struct platform_device *pdev)
 					   &info->dev_req_nb);
 	bus_unregister_notifier(&scmi_bus_type, &info->bus_nb);
 
-	/* Safe to free channels since no more users */
-	scmi_cleanup_txrx_channels(info);
-
 	ida_free(&scmi_id, info->id);
 }
 
diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
index 40ec184eedae..2491c848d4f3 100644
--- a/drivers/firmware/arm_scmi/notify.c
+++ b/drivers/firmware/arm_scmi/notify.c
@@ -209,6 +209,7 @@ struct scmi_registered_events_desc;
  * @init_work: A work item to perform final initializations of pending handlers
  * @notify_wq: A reference to the allocated Kernel cmwq
  * @pending_mtx: A mutex to protect @pending_events_handlers
+ * @shutting_down: Flag to block late-init work scheduling during teardown
  * @registered_protocols: A statically allocated array containing pointers to
  *			  all the registered protocol-level specific information
  *			  related to events' handling
@@ -225,6 +226,7 @@ struct scmi_notify_instance {
 	struct workqueue_struct	*notify_wq;
 	/* lock to protect pending_events_handlers */
 	struct mutex		pending_mtx;
+	bool			shutting_down;
 	struct scmi_registered_events_desc	**registered_protocols;
 	DECLARE_HASHTABLE(pending_events_handlers, SCMI_PENDING_HASH_SZ);
 };
@@ -845,7 +847,10 @@ int scmi_register_protocol_events(const struct scmi_handle *handle, u8 proto_id,
 	 * Finalize any pending events' handler which could have been waiting
 	 * for this protocol's events registration.
 	 */
-	schedule_work(&ni->init_work);
+	mutex_lock(&ni->pending_mtx);
+	if (!ni->shutting_down)
+		schedule_work(&ni->init_work);
+	mutex_unlock(&ni->pending_mtx);
 
 	return 0;
 }
@@ -1706,6 +1711,29 @@ int scmi_notification_init(struct scmi_handle *handle)
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
+	mutex_lock(&ni->pending_mtx);
+	ni->shutting_down = true;
+	mutex_unlock(&ni->pending_mtx);
+
+	cancel_work_sync(&ni->init_work);
+}
+
 /**
  * scmi_notification_exit()  - Shutdown and clean Notification core
  * @handle: The handle identifying the platform instance to shutdown
@@ -1717,6 +1745,8 @@ void scmi_notification_exit(struct scmi_handle *handle)
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

