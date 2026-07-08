Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E723A3E63A4
	for <arm-scmi@vger.kernel.org>; Wed,  8 Jul 2026 09:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783501241; cv=none; b=GMKURFoAPAwimX/VvQhECo33kOhPbfTkIGQ8qA8XnLjwH+UdIBx43I9ISVnxwqZepHp/v4p/RKIQCvNbvu4XmLzYk6t+LYu0F4L0Aljatg8qkROOXQJYp7yCyrZgP+MFtn+BFApqbT53jdrBSq0ugEGMdNs3EwhnGNlwo+hknVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783501241; c=relaxed/simple;
	bh=Yd/1UXM4EZ7MD+K0nT5yVnsdLMS7tHk+yEXf+d4v+2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CboNCgNoCfS1NWP/zSbGxRGJS3+Okm1AJpNceROa8ey8CZjaF+nWYKl9l4ojI3S/gfrTFA2G7kfbacHcyaCcuGV7dw/WNNd9iAgRTNoso3ZOH/2DszI9K265Qka0W+vFxitc++O6P6Xw2x62wshqBPK3K62iqq2+FgyEO5SgORY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J1New+MT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J1New+MT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8B261F00A3A;
	Wed,  8 Jul 2026 09:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783501238;
	bh=uujWU4pxjJzuJYUbcpSqUlEN3LiP3PT6PxeH0l499rg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=J1New+MTdEK4xAH04oUgG0dKCW4yEZj1lq/KwjVGJkFLEEQGZ6LzTnJC5FcRayPOM
	 rzk2vLAtO8KLmm1fbr4I8wlOwQ4MQsk0ym1/m1M01FzIdAkjtRAkv4ruvHN21E6qqC
	 TqAjZxTjxTQKF569OSLbMoTjChgonnjHCxmFRzUS9yycDLQWPIJH+Q9SYOdUvakhAC
	 7h77soTtttzY0aBfNtg42cjzi60vLuOAC3S/7sCV2ABkn9i/XOJPVQvY/Uce2St+Sa
	 o9JKpbJAC1kLfKEs2vGPTIwN3W8+h3LG0meT38i2Xx6mZFSEhobYIsm2isQ5cGkVRS
	 1NkDV1CvToPhA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 08 Jul 2026 10:00:10 +0100
Subject: [PATCH v4 14/16] firmware: arm_scmi: Unwind P2A receiver mailbox
 setup failure
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-scmi_core_fixes-v4-14-53142cd60b63@kernel.org>
References: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
In-Reply-To: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
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

