Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485E9407571
	for <arm-scmi@vger.kernel.org>; Wed,  8 Jul 2026 09:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783501228; cv=none; b=niK/nK5p7QxpkPSaE7opaSh642PVjXmT4gR0+wVPbV7Mz+jNxCv1wbe/enuK7YM7iaXd8sqMDt70YOoPv1g9hyHP8BYWUCECujd2rjsJgw/7p9+MByrM00MLM7YIE2BEPzOUolQEYNK/aultpA+P/RK78HBAQIfU0zvK6N8DcZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783501228; c=relaxed/simple;
	bh=ZXo0kgX8JV5eawFdpWKjHv7U2nbc4Wgmgl8S4/XD+XU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XcnHL43TjlArZ9Ic+PeAKn0QAuB5YSEWb3PjCe47wddOTMefAUfYhhkepVMjh22DGEVICqfnMZdew8AOTfRCHEZQfINhbx8+t8u5a3GVUfCK4A/NOx4SLfnATIr4EW9zF+45lnk6KlkkZ5xMoMnVTvkqSSvTEdVWSutlQ72fW7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R1BoSBsI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R1BoSBsI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 750821F00A3D;
	Wed,  8 Jul 2026 09:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783501227;
	bh=qtnszWQ1EqP0wG06eKPYqJbUwcsky+YWGL6tHgkD3mY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=R1BoSBsIPRhcKS2FiPkIPBk+YIgMMvSTCZpub8rc8NNZCADe9WK4YuVoKEmg6u/tq
	 8va2iZu++FhCdODlvfKnfLk56829rjoZSDZ0XqPJplfFcvXR/EABl9Sad2KuhjOG7q
	 DCiA2s4j5aES7eNt99sD0rZ5pHpDTPgqjqHMWAEYLD8dhc+UGZugu3HU2pMcgfKIDW
	 r9AmNedz+k4Mus/8goJecwRuSymbquk7vksnBwGI2oxj2mbIj6szrKvd4EcPgRdtyt
	 m2zXSJg3edtVgliajxWQloxuRERdXXwvYYBVJrdU2zVg28FeEZmQbHu3ilE8cd7yFt
	 Gu87pRADDT7kg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 08 Jul 2026 09:59:58 +0100
Subject: [PATCH v4 02/16] firmware: arm_scmi: Quiesce notifications before
 teardown
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-scmi_core_fixes-v4-2-53142cd60b63@kernel.org>
References: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
In-Reply-To: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
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

Unregister the requested device notifier first, stop transport callbacks by
cleaning up TX/RX channels before releasing the notification core, and
cancel init_work before destroying the notification workqueue and releasing
the notification devres group.

Fixes: 1e7cbfaa66d3 ("firmware: arm_scmi: Free mailbox channels if probe fails")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 12 +++++-------
 drivers/firmware/arm_scmi/notify.c |  2 ++
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 1d1f5d25d773..6f588840bf11 100644
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
@@ -3367,10 +3367,9 @@ static int scmi_probe(struct platform_device *pdev)
 
 	return 0;
 
-notification_exit:
+raw_mode_cleanup:
 	if (IS_ENABLED(CONFIG_ARM_SCMI_RAW_MODE_SUPPORT))
 		scmi_raw_mode_cleanup(info->raw);
-	scmi_notification_exit(&info->handle);
 clear_dev_req_notifier:
 	blocking_notifier_chain_unregister(&scmi_requested_devices_nh,
 					   &info->dev_req_nb);
@@ -3378,7 +3377,7 @@ static int scmi_probe(struct platform_device *pdev)
 	bus_unregister_notifier(&scmi_bus_type, &info->bus_nb);
 clear_txrx_setup:
 	scmi_cleanup_txrx_channels(info);
-clear_ida:
+	scmi_notification_exit(&info->handle);
 	ida_free(&scmi_id, info->id);
 
 out_err:
@@ -3401,6 +3400,8 @@ static void scmi_remove(struct platform_device *pdev)
 	list_del(&info->node);
 	mutex_unlock(&scmi_list_mutex);
 
+	/* Stop transport callbacks before tearing down notifications. */
+	scmi_cleanup_txrx_channels(info);
 	scmi_notification_exit(&info->handle);
 
 	mutex_lock(&info->protocols_mtx);
@@ -3415,9 +3416,6 @@ static void scmi_remove(struct platform_device *pdev)
 					   &info->dev_req_nb);
 	bus_unregister_notifier(&scmi_bus_type, &info->bus_nb);
 
-	/* Safe to free channels since no more users */
-	scmi_cleanup_txrx_channels(info);
-
 	ida_free(&scmi_id, info->id);
 }
 
diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
index 40ec184eedae..be2eadfd93a4 100644
--- a/drivers/firmware/arm_scmi/notify.c
+++ b/drivers/firmware/arm_scmi/notify.c
@@ -1719,6 +1719,8 @@ void scmi_notification_exit(struct scmi_handle *handle)
 		return;
 	scmi_notification_instance_data_set(handle, NULL);
 
+	cancel_work_sync(&ni->init_work);
+
 	/* Destroy while letting pending work complete */
 	destroy_workqueue(ni->notify_wq);
 

-- 
2.43.0

