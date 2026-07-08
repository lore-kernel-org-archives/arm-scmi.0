Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72D13E7160
	for <arm-scmi@vger.kernel.org>; Wed,  8 Jul 2026 09:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783501249; cv=none; b=L8cct0yyhv+iC+T/5UNMzbdnnO22TLGrMyZ4eqrSD4sAaVYAm066g5Tx8uGgOaDgUKEw5l2eP8REwoC3gKtcWRrcbdk7zV/9kfKBADH0P9JTr9jdPMKXK5BUMMRVVpsRE6x3IXUMaKBFg0LmBL1kEX0Smri36G2HRRTaCzgiNis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783501249; c=relaxed/simple;
	bh=sZnLVSKYW1MZnY08FOy7CGpr9N37cuQlDVvfG7ZKMIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gkish3ph0tyIEwRPNLB5SjTrzcBsUjf8rB9/fx7ZCOIEYYka8QPthB0YMPA5RiDoXdoaifh3EaMUKyF15/xUzO5w5Oi0CVtpIuiDXxcwcckI+cIIdhwjtZI1yAYtCxeblTwXmZ6pWG+jY65+c0OpP9OxLxbJwgfIkfkczpCcI3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UWVyCicP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UWVyCicP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C706A1F00A3F;
	Wed,  8 Jul 2026 09:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783501237;
	bh=wo1cSCYChzZ+SeD4Rr4ePKZmOVyTbiqYMm+hrcWkjS0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UWVyCicP2vd4Hqdjn6YarNc/v6EXOCehpqC3QBGrC7RoY7Gsm1eb81KsSJ4/JINWj
	 AzKCrbKxpSvCyAyM/ZEU+pYfnxyNdess6Aq5PoL4rlyppNE5k5cwM0Y1pRwYz6XzBq
	 dLqAsIE8NSszJQI74hvQFCvD9Uqq3npPZxwjAjq78ypZEwWCqmc1KWhg9jG6CEVWCr
	 AfxAIGKRYguW2bhmak9h3ABIeyimh0HDqY8qKvZOAC0xsg2laC3pP2mr1esCk+S0b9
	 tBzKNgcE6Gm6rw2rU+qgg+nY07fI234Zg3XHa8vr9LsszaBoIVPLC2SajSN28VooFd
	 ZGEmlHHP/13sg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 08 Jul 2026 10:00:09 +0100
Subject: [PATCH v4 13/16] firmware: arm_scmi: Unwind TX receiver mailbox
 setup failure
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-scmi_core_fixes-v4-13-53142cd60b63@kernel.org>
References: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
In-Reply-To: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
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

