Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE743655CB
	for <arm-scmi@vger.kernel.org>; Tue, 30 Jun 2026 09:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782810407; cv=none; b=FNx7u5zcOAn0tC3jjd+yPeAGAGXl4ZIkGPUcj20m8Qd6+zGLh5IaPg1/7PrV5CtXO9ZA9oFUPd6uDjPtzdI0QvNOUi7GoAT/LNWlfc+XaB4WLUM2tEPqIZjptVhKyzfDKkPLIGL7usDmUwf4FGuJAvK2F5s5oM4Wa+/jIznBLo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782810407; c=relaxed/simple;
	bh=7YpZgnOTDq/T2rkpWO/uZlblzupxPOCrjbewsjFv7oQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PUs1CtfXIARhkAK1/8blaWUOJZy4mQn1aQhXo5A1nsYcybeWj2BhAzlepqvjoTNqmQrHmBzJY0uZM+UfhMagy4UDvna4QvBm7Xy/DsdlrvEN0mzJlABs/Kqgcx1K9lfwPkmKu1LkAea+kDUFujDFjmPp3kzD7fvSCcNvFs/tlQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mEb2XRZn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mEb2XRZn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C39DF1F00A3A;
	Tue, 30 Jun 2026 09:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782810406;
	bh=8VE+1IF89JPg2cS6LsWuiQU7BFezbrXsY0qjq7Bvb7Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mEb2XRZnUXGPlkIHm4jpNGiLtC8unMNx3B7JQSRltckJLw3i+JuOWEAjdn+X6y4Rv
	 RIATgxpAjAW+dF2ZkTqpHNzl8BeTn0qTWXRvcCIMNU0n26r//+QJnvn69RVXoBhLra
	 dwhPgf4AV4cn3OIbjAdf+FnlFHBbY4wbGZVlAy6pxyEkjtN5oCT8YYQZeF+QS43cno
	 XvnprbaOLO+wupI607fY2Q0mticPlajAuBr2l/GJou9EgWafdRC8xqEmorOgt6ztVL
	 vi17L05+P+e4mqI67Bx1wmOdMCXsayLzqIo6W1PZhCju4hWBwyZfjfvAWFbXKq+qJn
	 Mqr1taMvmvrtA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 30 Jun 2026 10:06:04 +0100
Subject: [PATCH 8/9] firmware: arm_scmi: Unwind P2A receiver mailbox setup
 failure
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-scmi_core_fixes-v1-8-f932c1e51992@kernel.org>
References: <20260630-scmi_core_fixes-v1-0-f932c1e51992@kernel.org>
In-Reply-To: <20260630-scmi_core_fixes-v1-0-f932c1e51992@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, Sashiko <sashiko-bot@kernel.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>
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
 drivers/firmware/arm_scmi/transports/mailbox.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index 44d45ce838e5..f2bda95953d4 100644
--- a/drivers/firmware/arm_scmi/transports/mailbox.c
+++ b/drivers/firmware/arm_scmi/transports/mailbox.c
@@ -236,9 +236,10 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 		smbox->chan_platform_receiver = mbox_request_channel(cl, p2a_rx_chan);
 		if (IS_ERR(smbox->chan_platform_receiver)) {
 			ret = PTR_ERR(smbox->chan_platform_receiver);
+			smbox->chan_platform_receiver = NULL;
 			if (ret != -EPROBE_DEFER)
 				dev_err(cdev, "failed to request SCMI P2A Receiver mailbox\n");
-			return ret;
+			goto err_free_chan_receiver;
 		}
 	}
 
@@ -248,6 +249,8 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 
 	return 0;
 
+err_free_chan_receiver:
+	mbox_free_channel(smbox->chan_receiver);
 err_free_chan:
 	mbox_free_channel(smbox->chan);
 	return ret;

-- 
2.43.0

