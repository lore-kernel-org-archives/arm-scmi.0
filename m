Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773B430AD0C
	for <arm-scmi@vger.kernel.org>; Fri,  3 Jul 2026 20:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783110341; cv=none; b=MGrH24NojaZmEulCuLgqJ0nGqnRbyspxuECY6d/nN4erX1AKF73meuDN61w6a8frdWxnJ5XTR1RDmmoimwzpj7FrLshsELhPdh2gFNV4ZTCbcNaZ2mo4Dr/mEkmxeAZLVpktqeJgXe/To5EcoZxMx2p3eis8ARgFFVoxFQdV+QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783110341; c=relaxed/simple;
	bh=8njaMSURX0k0EU1DJoQ9zFsIOzRYCwfY35fDpBKXBco=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R7bcsmlH4bjzNqnC2OX4/RW/672QC5Dpcwq2bglnfwTOpp6g5sBhp2NkYM63pKBPp/7IF53Kw66i4n4EdpZpTtHjPxPIc7YdGB7Da1s062AUKE++EkwEjKxjMd6ZnpRN7qyUZB1I2eBIyIqpBD4OPBULbf7Vd1BzSFrPgbNuR1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ccPdtRD4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ccPdtRD4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3A01F00A3A;
	Fri,  3 Jul 2026 20:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783110340;
	bh=u8G7v3kCj3ZfKZLuYQ6CnoGyLi7YxlqqbXOp6kXO5fc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ccPdtRD4Y1a2pAgu6e9ntU8TQjMjFBgonaaSsnP9+yaz+D4AG0OVGo7EULMylO+lz
	 inGN8jBVcsOJJFj8Gj3Jaf0kmTJZXUUZi40aZmNznUV3U50o+PIxx4vY+2AI+Mi5Cm
	 y5hzH4vlkKxNrsYnvEev7ct2HB9+5ZRJ/FGDnT8XEHMBKPQGvFRV0lf9pjE39XbFXW
	 RascYGm+BhjwwAc5UxEc2MpJ8k9Jkq+XHeuzU/hmTBXbkponpKSaxpJX34ix1bcw0N
	 EtJ/jn2cS0UxG3GF4nPv0cKKCuh+/D0AxV22FFp3DBpCz+JIuybJsCEyzNMd3Svn6w
	 HpwEnesQdkqJA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 03 Jul 2026 21:22:49 +0100
Subject: [PATCH v3 13/17] firmware: arm_scmi: Stop channels before
 notification teardown
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-scmi_core_fixes-v3-13-5bae9766abfc@kernel.org>
References: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
In-Reply-To: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
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

