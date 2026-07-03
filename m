Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6612F1B4F09
	for <arm-scmi@vger.kernel.org>; Fri,  3 Jul 2026 20:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783110342; cv=none; b=qNgwBmHafMAOMrcVtP3/P9jCSqsomjENWnhLR2OaAw3lerHHfMqeH5XgERKTNf10InWhf4Db8mqqoj7/7SGp1lObNJtRhctAJ1nec27jhPuoB0aS8iLKVWeSUMy3iDSf9KA/wftMtT3/34ZF/0h2IIoSQUjowRc44bTfahW6Lgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783110342; c=relaxed/simple;
	bh=6YczpdRj6+adALQOKIpcbwRcQAdjNOGAylEkmjkss9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n1PpID7nnVtKeut/3fuXW5BYNNDiRuf395Vfw+ABlka107Ggyg/4RubCgIzc3Ce2KXygQyyM4BRv3V5Xq4AmFkl041l+AMyJYqwRQqYtL6Y3RgRCcBIX2Z3FeH7EjkZC0WxSkXDMIeYh7VbFvS5B1cEniXYyvnmZVUZvCGRTjrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KI/PD6AK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KI/PD6AK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED391F0155D;
	Fri,  3 Jul 2026 20:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783110341;
	bh=cAGzEqJJIxNTkDBafWgxGLh0GxaMB4SJoR3kl1AArdk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KI/PD6AKdUYMdp9RGuFHgWts7tipyyhpnQQ9MkivWHWlukWkF2UaM9S3RjbnzRpoj
	 iXIuvYBTu3rTpf3iSS6i/JBFNaU8lbYcBk/s9q2r0wkagmmJPmAH6FaVYiqMn6CRm0
	 3nW+SjdKbfB7T5WVRN3pnfJXOyu0ZgeAzPvz1KY3tcBlLpeTTeBi6Auxc/tRzCktzc
	 uVOHctk67fRdL/HJWXdIKz8FSb9bcbMxGsIxJo8sgftc0ADgxB/ni87D2MCbMLw7P6
	 tX+05AJDR0oduxbFXWI1/aihQpI84k+E/kr/z81RmF8oi73bW8X/Esia8VBR7YTCZL
	 9yQux+QZCfl2w==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 03 Jul 2026 21:22:50 +0100
Subject: [PATCH v3 14/17] firmware: arm_scmi: Publish channel state before
 mailbox request
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-scmi_core_fixes-v3-14-5bae9766abfc@kernel.org>
References: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
In-Reply-To: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

mailbox_chan_setup() initializes smbox->cinfo only after all mailbox
channels have been requested successfully. That is too late because
mbox_request_channel() binds the client before invoking the controller
startup callback, and startup can enable interrupt delivery.

If a pending or spurious mailbox interrupt fires during that window,
mbox_chan_received_data() can call the SCMI mailbox rx_callback() before
smbox->cinfo is set. The callback dereferences smbox->cinfo on both the
spurious IRQ path and the normal RX path, so this can crash before
channel setup has completed.

Publishing only the mailbox transport pointers is not sufficient because
an early mailbox callback can enter the SCMI core before scmi_chan_setup()
has assigned cinfo->handle. The core derives scmi_info from cinfo->handle
in the RX path, so a NULL handle can still fault even though smbox->cinfo
is valid.

Publish cinfo->transport_info, smbox->cinfo, and cinfo->handle before
requesting any mailbox channel. Also initialize the chan_lock before the
request, and clear the early published transport pointers again on setup
failure so later cleanup does not see a half-initialized transport.

Fixes: 5c8a47a5a91d ("firmware: arm_scmi: Make scmi core independent of the transport type")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c             |  2 +-
 drivers/firmware/arm_scmi/transports/mailbox.c | 14 +++++++++-----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index ddd026b05300..df574961875c 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2785,6 +2785,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 
 	cinfo->id = prot_id;
 	cinfo->dev = &tdev->dev;
+	cinfo->handle = &info->handle;
 	ret = info->desc->ops->chan_setup(cinfo, info->dev, tx);
 	if (ret) {
 		scmi_device_destroy(info->dev, prot_id, name);
@@ -2816,7 +2817,6 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 		return ret;
 	}
 
-	cinfo->handle = &info->handle;
 	return 0;
 }
 
diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index d41b8451bd21..4c9d1e4abd85 100644
--- a/drivers/firmware/arm_scmi/transports/mailbox.c
+++ b/drivers/firmware/arm_scmi/transports/mailbox.c
@@ -211,13 +211,18 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 	cl->tx_block = false;
 	cl->knows_txdone = tx;
 
+	cinfo->transport_info = smbox;
+	smbox->cinfo = cinfo;
+	mutex_init(&smbox->chan_lock);
+
 	smbox->chan = mbox_request_channel(cl, tx ? 0 : p2a_chan);
 	if (IS_ERR(smbox->chan)) {
 		ret = PTR_ERR(smbox->chan);
+		smbox->chan = NULL;
 		if (ret != -EPROBE_DEFER)
 			dev_err(cdev,
 				"failed to request SCMI %s mailbox\n", desc);
-		return ret;
+		goto err_clear_cinfo;
 	}
 
 	/* Additional unidirectional channel for TX if needed */
@@ -243,14 +248,13 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 		}
 	}
 
-	cinfo->transport_info = smbox;
-	smbox->cinfo = cinfo;
-	mutex_init(&smbox->chan_lock);
-
 	return 0;
 
 err_free_chan:
 	mbox_free_channel(smbox->chan);
+err_clear_cinfo:
+	cinfo->transport_info = NULL;
+	smbox->cinfo = NULL;
 	return ret;
 }
 

-- 
2.43.0

