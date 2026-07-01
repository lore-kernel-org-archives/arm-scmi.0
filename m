Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EF536165F
	for <arm-scmi@vger.kernel.org>; Wed,  1 Jul 2026 16:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924804; cv=none; b=DIVXRWp72rRfAANZjhQPWOtyVIhNIwVAEvhOcS9Kb6sIC2GonwJyP1Fz5YAt5a017w+zfPuExoE1MCXWP5lzb7KiNtC6F9hcKkOWobsTtJOjlnuPox7L7Wq5xkK+mziDEwei7GXBgGhxrjtQteTrncTJ01lLNXvCduCpZpoRqF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924804; c=relaxed/simple;
	bh=lWVD6aJPKu8xyWMKSWFl8yXnlMntX5GCtD5Ac6Dkhlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mGK3exs2icYzS8ZAPJC+/hWtdHkDnBzBm42EloOkDxR3YlxT/osmWmSLzkf8eNljunE1RNoudlSj4mD9+vidr5zpXyQnXclJb2wwtQjJPk+NDKsLGXIpRr9pksPAZTWT268QVuj7YLLq9pIxbZyuhhNvEbY41P2d2vHP2V1/5Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EjQJrbgz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EjQJrbgz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C71EE1F00A3F;
	Wed,  1 Jul 2026 16:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782924803;
	bh=xsC7twIJ3ucnfIY/XQ0lBk229dOSIqHl6m5TjxkfYO4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EjQJrbgzXLOpVc33xXnofE68QrIVR2JvFOxCbp9zD2YUh6FXMEizovFBmWxLzf7sk
	 uOejw87+kQw1SsirHQpDUX1L6zaIDqmTc+92SFIjL6bSW+6W/dToyLopKLx9cVWky+
	 5kFWR8ZObSZETbUSjmcUUpC8RqAqUqKA0ZzCNjiLcDaKEA/jtt/cwP93h3d0gdKA+J
	 KSLoTCaQFE+J8fKXzJT9zkxmNJe7NGmE9Sar2qiTVK30oJUDKva5ELw+9GhBrYMT1a
	 dmwAxypp4Zh7iOQoBZfc49I8qcBkOgBpiV9EWxsu7QbO492JDfkAj+qqcq2VL7avcF
	 OM1Nr7bFVxPSw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 01 Jul 2026 17:52:28 +0100
Subject: [PATCH v2 07/14] firmware: arm_scmi: Unwind TX receiver mailbox
 setup failure
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-scmi_core_fixes-v2-7-1f5e85553f73@kernel.org>
References: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
In-Reply-To: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
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

