Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C48636C0CA
	for <arm-scmi@vger.kernel.org>; Wed,  1 Jul 2026 16:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924802; cv=none; b=VY1b+DRQlsULJTGFrsRdwfevrYGVv4qpfxawTxG95kywwyLiaHHvfDKkUuFf4skRulki6t8WIZACJEDQ5eO2gce5WYcxNFxsfbmdT3F7laxtTJhQYVpYHuoKcCEhXVb8GCJo1gqqPCbfDRalgn67jzUFzKKYSTNM2tuO4VdiMbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924802; c=relaxed/simple;
	bh=HBtfQ/U7iBOwsRbYqoYllme3eAUoqjVJ3OIbBCfti6g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UIr1tFdYRpXy1ffS9SFINMhA3uC7q7ct2VaTF1jEE8hCoBBZElfSNJNTQU7Ou3mf5LI6TOZ+rB7/mNSwWhw57eDL3YlCcy4I+AXa4aNWxsdLRkCQ9u2DXVijJeXoofxeziaJEPfyO+os/nEiPe7a6yGiPQFLsnXXfN4jd7d/nvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OwCeExYi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OwCeExYi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E03561F000E9;
	Wed,  1 Jul 2026 16:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782924801;
	bh=qJ0jOkL1ltEZQTlEuZlzOaSUuaAoYiJSzKQRTPeitxg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OwCeExYiTHlG46qCJDjUJ27Zo4xF69kGm8hR8p5/vnNF2uWsG1SGzEm9ifjCUBwhX
	 mNvqrxLYj614e7yKldV8JDGIRRNeSnPtzR8HsJbtbErjVfKBV3jKh1Hxj1GVe37PiW
	 h2nC39UBAWBD5eZYCY0iP0FOxglNTp1UVwzIZsVCVG0xppkRzTR83kULi8q5tNesgW
	 jWP3DCoHQQIly+bjrt9o95kT6wdlorepxNogH11VptLL2TjP/vOtJDZxFkra/CIo0y
	 Jf4/hLumB5cUcmdPQP/n0jsHEoNZyF+r71j28qeFwQUpQLA3ibzXo3Xb3/Y+o90MfM
	 tsvLZBnpGEEZw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 01 Jul 2026 17:52:26 +0100
Subject: [PATCH v2 05/14] firmware: arm_scmi: Free transport channel on IDR
 failure
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-scmi_core_fixes-v2-5-1f5e85553f73@kernel.org>
References: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
In-Reply-To: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

If transport channel setup succeeds but the following IDR insertion fails,
the error path destroys the transport device and frees the channel info
without invoking the transport cleanup callback.

Call chan_free() before destroying the device so transport specific
resources such as IRQs, mailbox channels and mapped shared memory are
released consistently with the normal teardown path.

Fixes: 05a2801d8b90 ("firmware: arm_scmi: Use dedicated devices to initialize channels")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 861087b2920e..4b369b003003 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2808,6 +2808,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 			"unable to allocate SCMI idr slot err %d\n", ret);
 		/* Destroy channel and device only if created by this call. */
 		if (tdev) {
+			info->desc->ops->chan_free(prot_id, cinfo, idr);
 			scmi_device_destroy(info->dev, prot_id, name);
 			devm_kfree(info->dev, cinfo);
 		}

-- 
2.43.0

