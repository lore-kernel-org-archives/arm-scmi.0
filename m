Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6340A36C0CA
	for <arm-scmi@vger.kernel.org>; Wed,  1 Jul 2026 16:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924805; cv=none; b=u1CV5G64fw4VyS6aXTLVGfVPw0yIuJcP/urEcNeJBlESWnJkteVZpbjNBAjq+N9XppqYnAjBMsX1potXzAZuax2szNoAvygl7GRGnLNtl8wttKnlte77o4MMPIe1ncn3EXL8yBl+JTv6EVUffx2PTXmX4K37aRdMNCMKj7Qri/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924805; c=relaxed/simple;
	bh=AMbfBCDaXKMBDkwHQvgGB3UCKABrQ4ALf4zn4BbSnPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VAm9siURUbKeaN//OwreGANfYFGtA3fGGogj1gMurfyUfVrKrGjWhkVtkhoWJRlAW74TifdzQ0Uk+BSv+jLrNfqG452WlIu3lmBJjuZ074EUgwZvWu/oU15dYd1Haev0Ot2Wdkunq1aY6uJ+wfPhBuzes6cmSQWeiRS3LrFAk3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fZVE6Voy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fZVE6Voy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9E981F00A3E;
	Wed,  1 Jul 2026 16:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782924804;
	bh=nx3J+pJavz1fFM7CBGqP9zmvQYThVuvASvjjlaxrEZE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fZVE6VoyOpoEGDzsYcszNUAZQv6yp1QP60/7gNzFDN7oBuT8hdKMCVpvmvIKm3EnN
	 jntitu3vFdCNo5BuDwDE2SLZqyeiPPTQdwTkbrejVNddvovEAOqvO6BHgCpuRjcWYp
	 u/ExxRY7Y+ChwS/lXuwYQFeRurXylsmaW1rUtElzYBWtkTTMzZjvRl7OAo4HG4KYQb
	 oEM78NNgZHtIHhGgtqy8wwq5vW1M3OBTeLZpDWRv4QvRydaTALvT2HbtFPsAmzWqo6
	 IrKWMJwYUlrnlxhWYPsoMZUQ7gwAhB+fIXx/qA45mao/INCwThdtPtrvc0L8SWvwUO
	 QG1funnE7vpow==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 01 Jul 2026 17:52:29 +0100
Subject: [PATCH v2 08/14] firmware: arm_scmi: Unwind P2A receiver mailbox
 setup failure
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-scmi_core_fixes-v2-8-1f5e85553f73@kernel.org>
References: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
In-Reply-To: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
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
 drivers/firmware/arm_scmi/transports/mailbox.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index 44d45ce838e5..07a08ea5d9de 100644
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
+			goto err_free_chan;
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

