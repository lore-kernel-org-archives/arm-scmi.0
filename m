Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9823D3F0746
	for <arm-scmi@vger.kernel.org>; Thu,  9 Jul 2026 08:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587192; cv=none; b=VHUvA7ZWyMPEZWyOZfp451p8O2evFfFBhMLSiPY9gm4f7WNtd8HwLjYiYq7ncnv6kT80+zyG9DUSHkXpE7NUk1dB9457faFESfoY5R6TJ7II5xDRHYNnGnMbIaV6pwPNDLsU4mNY95wc/1Ul4M9c43JcmA1pKH0Q1ILNjgKgIFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587192; c=relaxed/simple;
	bh=sZnLVSKYW1MZnY08FOy7CGpr9N37cuQlDVvfG7ZKMIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bbyffRfbRsAXt7yF+kZYqEbrQRYixdsUl12ReupZr0rCCGSwizAl3uXTuLZIwFSd/tI0HDSf3LY0nplzyvUhbxbRBI+/c5F4+qB2OWfZXU6sKzOd0HrBhOpU5/+YQaDmkZ1D752yrNS7YARNTAslWg7drOiL5cUo/BRSHVMShUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RmeCyhPt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RmeCyhPt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF60A1F00A3D;
	Thu,  9 Jul 2026 08:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587191;
	bh=wo1cSCYChzZ+SeD4Rr4ePKZmOVyTbiqYMm+hrcWkjS0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RmeCyhPtF8BNHhug50TYHpv0PhKpjxp+ji79UYqwm0DDbsTKCisbsfs76qBKKh0Ln
	 0hz9BURu17YvzkQ5YEKRN7B58DkjZDDGH/w62aG22gxMC1xRa/gT8xrQdGc5rjVvIz
	 NfaVnP6j2/Ypnkmira6Ui/SA70zb4XBIv38bK0EGRXIMUMueOcHcSbMKyFTiAF+oZu
	 v1/CxiD7GkUgV/tcCD+ZycUNU6BkWScSdYJoBS4e4VScDhug2JDy7M2+RCprIii727
	 fHpqeRd2Ml4v0ZL8s6AM/Pj0Tu50cpxu08wDchSUdIa9BQqiCiFi9vSGLSNs1zxNiN
	 Yl46YHM6PcLFA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 09 Jul 2026 09:52:37 +0100
Subject: [PATCH v5 13/16] firmware: arm_scmi: Unwind TX receiver mailbox
 setup failure
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-scmi_core_fixes-v5-13-bea6a3024f05@kernel.org>
References: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
In-Reply-To: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

mailbox_chan_setup() can request an additional unidirectional TX
receiver channel after successfully acquiring the primary channel. If
that second request fails, the function returns immediately and leaves
the primary channel allocated.

Unwind the primary mailbox channel before returning the error so probe
deferral or other setup failures do not leave the channel busy for later
probe attempts.

Fixes: 9f68ff79ec2c ("firmware: arm_scmi: Add support for unidirectional mailbox channels")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/transports/mailbox.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index b6459fbb8151..37e3eab529ea 100644
--- a/drivers/firmware/arm_scmi/transports/mailbox.c
+++ b/drivers/firmware/arm_scmi/transports/mailbox.c
@@ -230,9 +230,10 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 		smbox->chan_receiver = mbox_request_channel(cl, a2p_rx_chan);
 		if (IS_ERR(smbox->chan_receiver)) {
 			ret = PTR_ERR(smbox->chan_receiver);
+			smbox->chan_receiver = NULL;
 			if (ret != -EPROBE_DEFER)
 				dev_err(cdev, "failed to request SCMI Tx Receiver mailbox\n");
-			return ret;
+			goto err_free_chan;
 		}
 	}
 
@@ -248,6 +249,8 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 
 	return 0;
 
+err_free_chan:
+	mbox_free_channel(smbox->chan);
 err_clear_cinfo:
 	cinfo->transport_info = NULL;
 	smbox->cinfo = NULL;

-- 
2.43.0

