Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8687F37C92E
	for <arm-scmi@vger.kernel.org>; Tue, 30 Jun 2026 09:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782810406; cv=none; b=dOj9hMw/pVkBt2sihoXl7uvOD9skWTpnkb1tC81+lMRz2AbgV/H37/QTsS0ji5tyna8cJ/pUVXj75eODC/ptUyX812opmWuM4wZ6Rgmt8wSbwUpSDDXLUMWVzEcZw2MVUMB+Wg8MoSIFnjYPxbIAwuon1AvR1CMUJyDpIf6Oyvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782810406; c=relaxed/simple;
	bh=lWVD6aJPKu8xyWMKSWFl8yXnlMntX5GCtD5Ac6Dkhlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tkrba5KwsH9F0TldzXUV4mBtXeXosRomLUqXM9UGYQ3ao2xUR1pM/LxLM9yCroKbgU0Jnj88KQhv4amVjjdvZPY3gF+zjCTPZsh688NMEqzfXWIEPIRC5ZhP2yLue1oQ4qwAK5J29Sh65gpAEPxOVMp/ixVAq7RhqVZL5CtlNdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TRaQIIsl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TRaQIIsl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88CEE1F000E9;
	Tue, 30 Jun 2026 09:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782810405;
	bh=xsC7twIJ3ucnfIY/XQ0lBk229dOSIqHl6m5TjxkfYO4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TRaQIIslnyP56XHlxJLrKlhDRclwQcw9V4XZD/AqW6HZVvWJ5VfKkh/5Z9AR5Z0+Z
	 iPvqjPOS55ANIy+4jBkf2zb5VFXAuY0hoXCQE6i5P2tywM+qpORfASlYZftEZDvJwL
	 gZzqGs0anZzydpK8amo6MZSlMDPDFD7TLMvzMKeRuRTkPIpyUnWF62EeNdxHnznKil
	 mqODjDTZrvxZRhUAPQjsyFx+K31bVw8bQEq6xy853Me4QXIp8r8+PAwKbmgwJ2hYlx
	 KuFhAs/eyaQBTaGMykn/S20NEjWUP39TcFDu5EiAYIP7sw70LMilHvOkii7gdACjmm
	 HVpNCrOfliAlg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 30 Jun 2026 10:06:03 +0100
Subject: [PATCH 7/9] firmware: arm_scmi: Unwind TX receiver mailbox setup
 failure
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-scmi_core_fixes-v1-7-f932c1e51992@kernel.org>
References: <20260630-scmi_core_fixes-v1-0-f932c1e51992@kernel.org>
In-Reply-To: <20260630-scmi_core_fixes-v1-0-f932c1e51992@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, Sashiko <sashiko-bot@kernel.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>
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
 drivers/firmware/arm_scmi/transports/mailbox.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index ae0f67e6cc45..44d45ce838e5 100644
--- a/drivers/firmware/arm_scmi/transports/mailbox.c
+++ b/drivers/firmware/arm_scmi/transports/mailbox.c
@@ -225,9 +225,10 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
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
 
@@ -246,6 +247,10 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 	mutex_init(&smbox->chan_lock);
 
 	return 0;
+
+err_free_chan:
+	mbox_free_channel(smbox->chan);
+	return ret;
 }
 
 static int mailbox_chan_free(int id, void *p, void *data)

-- 
2.43.0

