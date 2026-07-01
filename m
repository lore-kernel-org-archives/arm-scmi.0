Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A1433F58E
	for <arm-scmi@vger.kernel.org>; Wed,  1 Jul 2026 16:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924811; cv=none; b=ovDJWrrSImGSzrBgvZIp9Ilp8J/FJqXZ8H5FAAayJxgJ0ysLy658TVtA829cfmwclGX8abYXqi1Ac8vpWbhd55jE5vZI4bLWCn+3bjlJ5mASyB7wdl0aRsCqGM7YQ2hJaJg9/k+AWclOZkzMCDZRZTLWXsXTfeB5mnrC2eOYYJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924811; c=relaxed/simple;
	bh=mzBuXRfX4QkGg7HmO6zOy+aYfm3rKQkrSIjBhR6f8qQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ctXLcqpCCDwSC5ZJbT/z5bXtTGe1yqC9aaZi5ef5jeiTsTeBXedXkKlooZDYr+Ea5v1/YCVIx6A8JgzdHUc77ATqWnTM//4XZHwzer27YWYp5Kh2u1fZL0M2I0gkxuAS8Jfn/EzY4+GR5N5rKK6qoW1T8cI9SHtTGxBBETmVwtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MCmPJOj4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MCmPJOj4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69DA21F0155A;
	Wed,  1 Jul 2026 16:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782924810;
	bh=ijKjg1UKh+d0/IAuKWsqNeiw8kVOXVnEo2ybOVcIaKw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MCmPJOj4aa6JkENXtZbH64mZlCvfenp41NrAJQ+/xHREJMfh6jocgx/oOKr6gin1I
	 8WgTY9947SdBZVQjpfwoKHcXl80lRlxCyN+qi14yhkr0K/OwLi6QMqAahjmvJG6n0S
	 MJNFc9SWbnh8bTqgOXi+hvztk16aU0oe29ZXfS5KX9HcquQvEWilu7obX9xsd2RkTD
	 /XoFrksGTiLUk5LNuXZ4ss6ClkMRdjurLk+7DWnO0LEe+Sjt5hHZWnCy2rXk3KrfPt
	 XPXTBiHSnSU5FACmQaxD+UEM9bisFFBTafu8nStOyWVNHMJcSFUAzE2KRdXTK9y+Yg
	 isQ+O05l4jCJQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 01 Jul 2026 17:52:35 +0100
Subject: [PATCH v2 14/14] firmware: arm_scmi: Publish mailbox cinfo before
 channel request
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-scmi_core_fixes-v2-14-1f5e85553f73@kernel.org>
References: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
In-Reply-To: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
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

Publish cinfo->transport_info and smbox->cinfo, and initialize the
chan_lock, before requesting any mailbox channel. Clear the early
published pointers again on setup failure so later cleanup does not see
a half-initialized transport.

Fixes: 5c8a47a5a91d ("firmware: arm_scmi: Make scmi core independent of the transport type")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/transports/mailbox.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index 07a08ea5d9de..f1bee48ef7dd 100644
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
@@ -243,16 +248,15 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 		}
 	}
 
-	cinfo->transport_info = smbox;
-	smbox->cinfo = cinfo;
-	mutex_init(&smbox->chan_lock);
-
 	return 0;
 
 err_free_chan_receiver:
 	mbox_free_channel(smbox->chan_receiver);
 err_free_chan:
 	mbox_free_channel(smbox->chan);
+err_clear_cinfo:
+	cinfo->transport_info = NULL;
+	smbox->cinfo = NULL;
 	return ret;
 }
 

-- 
2.43.0

