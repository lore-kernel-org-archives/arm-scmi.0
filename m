Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D167C30AD0C
	for <arm-scmi@vger.kernel.org>; Fri,  3 Jul 2026 20:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783110335; cv=none; b=rWjMJ7DqzMpHTC7R1KVdJH2KlCqAps2r364JTZuK6ec/TZDWdtWJHRUujJL9c38ryBzlJ5ZgF+j9O89xS5oxcbVjTWm47yEIVWIaoO5xiNDD0IO1iuJxmNHbIt+D6zrkAaLScSPKcekHRbPYIw6VaXmmCviZMD143w6FQOS2MFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783110335; c=relaxed/simple;
	bh=lWVD6aJPKu8xyWMKSWFl8yXnlMntX5GCtD5Ac6Dkhlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EV5zdH+6TuZoqugb7jNC5dSDSFVxptmnDm0m2D5zqi57B8S/KEZ6Ot2UYH6toAcHdPkc/S4OjmU5F7jGjnwt0TZ1rXE5DXCfOs+3dyR5l4Sk5CdYPPFFF6DxwrRuc9gRPqwU/27TC7Znk8WuyqoyVRobJ08rrMa8JIEyHWbo3sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f1d5QP4S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f1d5QP4S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 353B31F000E9;
	Fri,  3 Jul 2026 20:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783110334;
	bh=xsC7twIJ3ucnfIY/XQ0lBk229dOSIqHl6m5TjxkfYO4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=f1d5QP4SeOVgzwWX7qaIrKqBl1A18BEuTsOE/7IvZcGCUGWFRFAQNsy1dElparTMb
	 vYCjrNQfpjoYL3KelYvXj9rT1WZ9nNGZo8sIU9E1yosdp5eH7crT8NQz3pXkU72ssN
	 08aT6ddhrGWYzkqSu5PYmHOBFBfq5G1NaO7Vn5stplIhd3FumaQldLnRND2X+cfPwX
	 42uO5zNK9UDnxd+3IsQ7OtlMuugfHJw0LHQBjOzrHzAEu2BbGaGjKLOyouZtGiBLQ2
	 YxtLG/Cd4fWhZHKiPlfd4CqJ0s/qzTpnnLhzCaRqOQftcKn3nEygNYB6PSR1CYtiGl
	 XwV60R6zMcxsw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 03 Jul 2026 21:22:43 +0100
Subject: [PATCH v3 07/17] firmware: arm_scmi: Unwind TX receiver mailbox
 setup failure
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-scmi_core_fixes-v3-7-5bae9766abfc@kernel.org>
References: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
In-Reply-To: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
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

