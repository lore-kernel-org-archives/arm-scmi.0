Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63888448CFF
	for <arm-scmi@vger.kernel.org>; Tue, 14 Jul 2026 12:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784033931; cv=none; b=lWhcuNpXoS6kTT4Pl+oC0F8rc8EsrhdNQ9+iu/G4jAHr3xRMNSzFfLvQDXNyH2Ti0Y2Y+8FwIMPEAwZQqzknm958rNaM0LtPY/OEbUiAXivYj4i5tothnQqYgJnbMgZPkMllms+P674Iz5kgcUw28y0tgPvnjtQD8mmKZkLFZ+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784033931; c=relaxed/simple;
	bh=sZnLVSKYW1MZnY08FOy7CGpr9N37cuQlDVvfG7ZKMIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bPNJxFo0og/nr81BHzgltNuyoG+ra87uVs88CfGAaf/wdvLmRY/lAtargg8DM+8b+KeEF6tr2OhKTQM7J2UHbhxClYkulnkprVV+7CDIqnPJuTUwaFV7InOMFVbKv3KdlsbfrSAfpd8OVoO5eWNXNMh7jMBHb587mB5R/h4pgeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oO594GSp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oO594GSp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B935D1F0155D;
	Tue, 14 Jul 2026 12:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784033930;
	bh=wo1cSCYChzZ+SeD4Rr4ePKZmOVyTbiqYMm+hrcWkjS0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=oO594GSptzEGVod0PfZDkZ0B3Pej48asdckgAWnWyMzWnIKnU7HQ85lUQLJH9kHFg
	 ClFtThjrE2MCeKq6a+rzW3Xl8K2mm+/l/yEOKZVVPFQCgTMSXFNHmbSpltv0C4mJjc
	 c32E/4HgmL+7vF4ZuOKUtuh1qj5PJd7COP5UulwxJ377bWwUWA4PbyjIzRzFHq2h45
	 hq103iSdiguw0eqn2euOcrYyHEgdD+ZHY9Ud5cDeUf5Uta0h5BxDIqU9fX6AWpr87F
	 DA7nTn+v4Zfmg0TJHzpRnvVEq37YUCfvPY3oc/U33m8qF16T1ylzWFQZmttlfWgWmU
	 lUxTEDF9J5BvA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 14 Jul 2026 13:56:32 +0100
Subject: [PATCH v6 13/16] firmware: arm_scmi: Unwind TX receiver mailbox
 setup failure
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-scmi_core_fixes-v6-13-3afe499d46e3@kernel.org>
References: <20260714-scmi_core_fixes-v6-0-3afe499d46e3@kernel.org>
In-Reply-To: <20260714-scmi_core_fixes-v6-0-3afe499d46e3@kernel.org>
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

