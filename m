Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A1F3EFD30
	for <arm-scmi@vger.kernel.org>; Thu,  9 Jul 2026 08:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587193; cv=none; b=Av3X7yoM6guo7qRpvzpm8xIaeMfYXXsAdKtJV+FrUBoZ5/YPTMH4xKYBe8PNMJ5svFDLEyL+34jgnbHmXvBVgBuYOtVij3z28vnDrgIYSU3uDq5pocklD9M8sczdwRk9N888HxSTcjUhes+4hrFz0HEyaP186uK/kKx4DUIAHzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587193; c=relaxed/simple;
	bh=Yd/1UXM4EZ7MD+K0nT5yVnsdLMS7tHk+yEXf+d4v+2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D7k0pUjYo+1Nec68cq/0bVUEId62aAFSyk4XGK8ZWPx0a8mfZmbQydx1a/VB3oHP6RR1guQfwdeYa4P9ciTxjhHLgRb5+w5mNA6ElZGdzonLlGyB0BFIVZJ5WDGqbocpXYguqjyexgz76Jx/pPRtFSZwdUb70cgXy917Eu3yiXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ENJ0Ic2c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ENJ0Ic2c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF9231F000E9;
	Thu,  9 Jul 2026 08:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587192;
	bh=uujWU4pxjJzuJYUbcpSqUlEN3LiP3PT6PxeH0l499rg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ENJ0Ic2cKoCXyj6dWklG6Lqc5w8RXN1ofVUnKr45WDUG/IJxMSg6x4Rx3ClGOC/ku
	 kaHeEv5KUuB0a1UBy+trTdnDrKLSvHDJDjrBNUvhCIBpPGlgvsPio4IZwxbPUM3wbR
	 HMkeuuXPAD4JBIQR7tHuJzunjwdN1XqMv3Q0EGE8oLmgci8a3MpMKXMCtWFBlmg4aN
	 ZQE32TugZ1ORjQqFfux2hdNtshSfXtJ6TaTh8aSCjzCtISxzisP6Qtj/gq9UvWHjGB
	 TQBjbtc1/MCGnUXrhRC58pL/Bs0i0rFYGotttocVw5l8HKjLC1bdU58alfLGXpEDKY
	 5HRVIPgYEJ+2w==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 09 Jul 2026 09:52:38 +0100
Subject: [PATCH v5 14/16] firmware: arm_scmi: Unwind P2A receiver mailbox
 setup failure
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-scmi_core_fixes-v5-14-bea6a3024f05@kernel.org>
References: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
In-Reply-To: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

mailbox_chan_setup() can request an additional P2A receiver channel after
successfully acquiring the primary P2A channel. If that later request
fails, the function returns immediately and leaves the primary channel
allocated.

Unwind the primary mailbox channel before returning the error so probe
deferral or other setup failures do not leave the channel busy for later
probe attempts.

Fixes: fa8b28ba22d9 ("firmware: arm_scmi: Add support for platform to agent channel completion")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/transports/mailbox.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index 37e3eab529ea..308736c3ead9 100644
--- a/drivers/firmware/arm_scmi/transports/mailbox.c
+++ b/drivers/firmware/arm_scmi/transports/mailbox.c
@@ -241,9 +241,10 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 		smbox->chan_platform_receiver = mbox_request_channel(cl, p2a_rx_chan);
 		if (IS_ERR(smbox->chan_platform_receiver)) {
 			ret = PTR_ERR(smbox->chan_platform_receiver);
+			smbox->chan_platform_receiver = NULL;
 			if (ret != -EPROBE_DEFER)
 				dev_err(cdev, "failed to request SCMI P2A Receiver mailbox\n");
-			return ret;
+			goto err_free_chan;
 		}
 	}
 

-- 
2.43.0

