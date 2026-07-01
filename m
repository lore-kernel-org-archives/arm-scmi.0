Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210AB36C9C1
	for <arm-scmi@vger.kernel.org>; Wed,  1 Jul 2026 16:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924810; cv=none; b=UgHe5Yamdwt358l5Hr3K1+c2CNH36EvqTJvMS/Qm9tn5Su35df7/5tOwcZ3pk+FYfgGH23YF0mpquVKl5BCeQREV8EngYzseOCMqEzpjbQaTKuICWoOMUA6rcLf/ndSdjEbYTDMpIc5sy+0fRPNUHiO+emL203mJ7N3HmLWYsmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924810; c=relaxed/simple;
	bh=8njaMSURX0k0EU1DJoQ9zFsIOzRYCwfY35fDpBKXBco=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RGU0+QuhTbl/jIVPvSj6JHa1YwDlx+CLHiuRfQIMe1TJJhjFjAuV9JJ9MDdMInwNxzpu99nMKVG2TVBMHM3xVqYZPXhHA98nBXgvQe6MIuPMtahrJgv9jkGYWnCxfvr07yEJ+ntp0+C28GiHuycRp++LUfM01z5ABkxsMGYhdrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FBCrALLN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FBCrALLN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76CB91F00A3E;
	Wed,  1 Jul 2026 16:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782924809;
	bh=u8G7v3kCj3ZfKZLuYQ6CnoGyLi7YxlqqbXOp6kXO5fc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FBCrALLNVfpnBzx6Y2Yr8y95Cc7TsDcxp2Er5hfxqAJwo8k2Fv/Gi+rflxlo310nI
	 X9NXSpbQTsOJt6+IIoBVk13YyHmNZcb22sp5ZtWphA3jB01nnEoR4qfiGvOO+hwV8y
	 Q4feYVutsiMPsmUNKyc/aAEFCP25Ywl4rYzhLM65IOgu4ag4HjcF/RINUO48+ndzTK
	 a4I9tqj/kfqz5rjtgJqtqBPR6v7QNMy7lGO27lCmtAtXR49VYSI5mVWH3qZcgjIED/
	 J18lEct8U56d3I7+E8btTfn47szZ09q/Qh4duts42lSNWfSxKsdwAssWMwZEMEb/C3
	 C4w0jtW8Lww1w==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 01 Jul 2026 17:52:34 +0100
Subject: [PATCH v2 13/14] firmware: arm_scmi: Stop channels before
 notification teardown
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-scmi_core_fixes-v2-13-1f5e85553f73@kernel.org>
References: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
In-Reply-To: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

scmi_notification_exit() clears and releases the notification instance,
but transport callbacks can still deliver incoming notifications until
the TX/RX channels are freed.

During remove, an RX interrupt in that window can enter scmi_notify()
while the notification instance is being torn down and then dereference
freed notification state. The same ordering exists on the probe error
path after notification initialization.

Unregister the requested device notifier first, then stop transport
callbacks by cleaning up the TX/RX channels before releasing the
notification core. This keeps the notification data alive until no
transport callback can queue or process a new event.

Fixes: 1e7cbfaa66d3 ("firmware: arm_scmi: Free mailbox channels if probe fails")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index f515b192c1bd..ddd026b05300 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3328,7 +3328,7 @@ static int scmi_probe(struct platform_device *pdev)
 			dev_err(dev, "%s", err_str);
 			return 0;
 		}
-		goto notification_exit;
+		goto raw_mode_cleanup;
 	}
 
 	mutex_lock(&scmi_list_mutex);
@@ -3372,10 +3372,9 @@ static int scmi_probe(struct platform_device *pdev)
 
 	return 0;
 
-notification_exit:
+raw_mode_cleanup:
 	if (IS_ENABLED(CONFIG_ARM_SCMI_RAW_MODE_SUPPORT))
 		scmi_raw_mode_cleanup(info->raw);
-	scmi_notification_exit(&info->handle);
 clear_dev_req_notifier:
 	blocking_notifier_chain_unregister(&scmi_requested_devices_nh,
 					   &info->dev_req_nb);
@@ -3383,6 +3382,7 @@ static int scmi_probe(struct platform_device *pdev)
 	bus_unregister_notifier(&scmi_bus_type, &info->bus_nb);
 clear_txrx_setup:
 	scmi_cleanup_txrx_channels(info);
+	scmi_notification_exit(&info->handle);
 	ida_free(&scmi_id, info->id);
 
 out_err:
@@ -3405,11 +3405,13 @@ static void scmi_remove(struct platform_device *pdev)
 	list_del(&info->node);
 	mutex_unlock(&scmi_list_mutex);
 
-	scmi_notification_exit(&info->handle);
-
 	blocking_notifier_chain_unregister(&scmi_requested_devices_nh,
 					   &info->dev_req_nb);
 
+	/* Stop transport callbacks before tearing down notifications. */
+	scmi_cleanup_txrx_channels(info);
+	scmi_notification_exit(&info->handle);
+
 	mutex_lock(&info->protocols_mtx);
 	idr_destroy(&info->protocols);
 	mutex_unlock(&info->protocols_mtx);
@@ -3420,9 +3422,6 @@ static void scmi_remove(struct platform_device *pdev)
 
 	bus_unregister_notifier(&scmi_bus_type, &info->bus_nb);
 
-	/* Safe to free channels since no more users */
-	scmi_cleanup_txrx_channels(info);
-
 	ida_free(&scmi_id, info->id);
 }
 

-- 
2.43.0

