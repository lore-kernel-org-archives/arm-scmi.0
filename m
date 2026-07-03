Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C491B4F09
	for <arm-scmi@vger.kernel.org>; Fri,  3 Jul 2026 20:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783110336; cv=none; b=pJp7RDy6pdVHsJS+IlcokFu5FDOCjLHg2ZtS7U6LnLdlZW3ojE+aaq3IXAtGFvLtxFxpQpiheAMISp/eEuD6xZU31/w79ZUsO2vihDtVdIiBp+wC33oUyiweAglUmEriYO16B9jTZSjMLrDzdy4MqFwjWgJfTS4A+i29yiVfu7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783110336; c=relaxed/simple;
	bh=ZWGQfII9xzmFsHd9ZYgZBJv6UpDHGCTtDOMPBmiOpGg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oH17QfA4FNxRmVA6vzSelsTTV6dwWGkmvvuCK95E79qh0RlQUd7txhcGBg8DMVnNDF149qvJFUhYb7rorXB8ua25pUJQ8EinQpnrY86Ny052BYeM08zT5SWOsOHhkK6/ddQ0oP2v+rFtoHRFgdAB2c+aNXV/MQjsoTV5Rgl4qVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n3SAwxNd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n3SAwxNd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258EC1F00A3A;
	Fri,  3 Jul 2026 20:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783110335;
	bh=fR0jgISqKjRrDnBjgwv19P7Pi1A7PRvJPSCLopA5W0I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=n3SAwxNdtBqjBAvaBvIveJJdCrjVBAD9F635LkE4k0GO1cR94aKUNZTBiWPdlBMUE
	 /OMkZCdeZqtXtEjOWvin4LvUekag1nBwnI2BF5UmCvT7Sr8ByEh0MoAyT1ip+/Tfgu
	 kUyh/LzCGLry3qTiYs/qe8fhRDpMcnUw4rDo0Uysd/cIAgNYOUH2f3gkLX6OaMz1R3
	 5rSp6FjVqqffCTxhAcNv4pRgp+H/iQCej9v5GJfr4Jb0BTYIZjZtOWH07yE8hlYX1i
	 UZbPRDQ9BCuTYLz1WoX33YOBkREJtRJCIVdg52c9Dtxe9vGUXQ6Y2l+Z46OMZFgA+K
	 HwTifavDI7WpA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 03 Jul 2026 21:22:44 +0100
Subject: [PATCH v3 08/17] firmware: arm_scmi: Unwind P2A receiver mailbox
 setup failure
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-scmi_core_fixes-v3-8-5bae9766abfc@kernel.org>
References: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
In-Reply-To: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
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
index 44d45ce838e5..d41b8451bd21 100644
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
 

-- 
2.43.0

