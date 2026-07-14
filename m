Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D8E4483BA
	for <arm-scmi@vger.kernel.org>; Tue, 14 Jul 2026 12:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784033932; cv=none; b=JngQCTMw93Wt56CuMaZ0SZNKWsSYm6w0id0Xd4E+RIM/JcGZloArKZNVswSzIswFgr4fLDMRUZ4lvPbKzSaA6UN4j2dR6VBqwHgcQU5c+pW7rl6PiVUByAuEKFC4IXrLTql2wGR54Wak6ZWkeEOUQLG8kwQEWpZNd005M/JxWpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784033932; c=relaxed/simple;
	bh=Yd/1UXM4EZ7MD+K0nT5yVnsdLMS7tHk+yEXf+d4v+2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KX4V2grw6wXIx9J0dg3aXgOKPNJMU7dL/R5AqqbbP3CGP8Scvvo3aHtdxse/HI+Euz2D1b9ThtUiF3dQO4txVTj5rk4YT6E7oloOJfFR0dBYsbf3Zc0zRIxCyzH19XUXciWDrh/eL6LK4VLEfTnFUCI+mXTEF56iYaFmsLp4agU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h2YDxWkg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h2YDxWkg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABDDA1F00A3E;
	Tue, 14 Jul 2026 12:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784033931;
	bh=uujWU4pxjJzuJYUbcpSqUlEN3LiP3PT6PxeH0l499rg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=h2YDxWkgfcFKmRzSmSDF/4r8Dv8U1qzLL+n0zQ2DBLNQjnYs/Q/URrwv/R613+e7Q
	 xHFXVxXxwbOk/S6q9p7OXRhhumpdRTm3eVt5GHbrNZKOYMiQmIYUNTqwkiGlCXpDcP
	 TTPCUSenlRtQ9r6Jc+RmeMSFkrh0hPQxHVFIWJd0eCKxGAINp1qvotuBzjbnQCM56g
	 XgPQcCXHtYdbq3kUFDtHYILqFeW4OIJAM7a9+72wljQuSsUZCXqXkhc5SS78683oyv
	 p15iojt9mL/tTTed/TXQEFD2dhRIZftTSkqMtFjR1iyRh1YntjLT10SaGN35vSKuNo
	 yDuACr6YTY4Gg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 14 Jul 2026 13:56:33 +0100
Subject: [PATCH v6 14/16] firmware: arm_scmi: Unwind P2A receiver mailbox
 setup failure
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-scmi_core_fixes-v6-14-3afe499d46e3@kernel.org>
References: <20260714-scmi_core_fixes-v6-0-3afe499d46e3@kernel.org>
In-Reply-To: <20260714-scmi_core_fixes-v6-0-3afe499d46e3@kernel.org>
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

