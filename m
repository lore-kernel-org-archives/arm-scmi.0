Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F94147141E
	for <arm-scmi@vger.kernel.org>; Fri,  2 Oct 2026 09:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933822; cv=none; b=BbvkSfbw31bGD8vUb8r6HX6SIrKAa79OgqXRl2b31W8VH2IeoVAE3DBPf/SlIWxPklFsUHJ1Y9wuBzqvxzVsyhPjPYFczXR5lMK3pY38HPZfPmHrL84UpATLh5+Cr4EYGquml0IjLJxEjXhAvUfkkivBl9s5vuRK2OMC9DU0a+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933822; c=relaxed/simple;
	bh=UK1KcmqkdF1wtlSwFYdsksZBEkmMraVy/Fn4eefSpfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OkqrYa+SW33WfLRrUb7vrujDSSob+xMCOAwufy8sXHeD7eSCVf9tn6XQsTQ6tLMVmgzSqJY/Kcsh+0tcExRHBJLVStC4/IRe5njuqojKXXNMcZesPgmp59zpWVuvtWYZDmcKV2d+Mqqdt1m8Pyd9LoVuZ2BBpqY2yV3kswBLwx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DJYsnZr4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DJYsnZr4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5567D1F000FF;
	Fri,  2 Oct 2026 09:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790933820;
	bh=VQvteEw2moaJCIGVYdnwiBUqGVYZ/ZhRfbEv+m8+1HY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DJYsnZr4LEvh+90eeR5GoS3aDyz4Ivdcl1X1OaxsvWddCOF1MCCZdVxEhp6KoTHC9
	 LSg3UsaGUPOXH5JtBBWraNrxoKUt/txZu5ulLBmRkJOyvJGx0+00tGo5b7YXc3ppnJ
	 2XdrJEuuFapTrAa+onyRj35m1LjEFtdlje9WwU29P3WhSlP7T6fDy3gpX8kqDJb/IG
	 I+jCEcuegYEzrrr8rhu0L+vdRsbtFWQiRwBU3btoiIhCq2Ji75keiw44o8cveWUhqD
	 CfhNdsjQThjALnGBVi9VVHqOTD4FgScEtF93/YoXHD7Xal2yT+bdBeZSe+b5dlMhjC
	 ARbqAWA5b/wWg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 02 Oct 2026 10:36:33 +0100
Subject: [PATCH 4/4] firmware: arm_scmi: Skip unused performance-domain
 devices
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-scmi_bus_fixes-v1-4-8695cbab3fe7@kernel.org>
References: <20261002-scmi_bus_fixes-v1-0-8695cbab3fe7@kernel.org>
In-Reply-To: <20261002-scmi_bus_fixes-v1-0-8695cbab3fe7@kernel.org>
To: arm-scmi@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Peng Fan <peng.fan@oss.nxp.com>
X-Mailer: b4 0.16.0

The SCMI performance-domain driver uses the named "perf" device only
when its firmware node declares #power-domain-cells. Otherwise its
probe returns without registering a provider, while the same SCMI
protocol may still be needed by the separate "cpufreq" device.

Do not create the "perf" device when the provider property is absent.
This avoids an unnecessary device claiming the protocol fwnode and
leaves cpufreq creation unchanged. Update the device-creation contract
to document that an intentionally omitted named device returns NULL.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/bus.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 230ee9f6f1aa..9a9a816eb119 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -571,6 +571,11 @@ _scmi_device_create(struct fwnode_handle *fwnode, struct device *parent,
 {
 	struct scmi_device *sdev;
 
+	/* The perf device is only needed when it provides power domains. */
+	if (protocol == SCMI_PROTOCOL_PERF && !strcmp(name, "perf") &&
+	    !fwnode_property_present(fwnode, "#power-domain-cells"))
+		return NULL;
+
 	sdev = __scmi_device_create(fwnode, parent, protocol, name);
 	if (!sdev)
 		pr_err("(%pfwf) Failed to create device - protocol 0x%x (%s)\n",
@@ -597,10 +602,8 @@ _scmi_device_create(struct fwnode_handle *fwnode, struct device *parent,
  *
  * Return: The created device (or one of them if @name was NOT provided and
  *	   multiple devices were created) or NULL if no device was created;
- *	   note that NULL indicates an error ONLY in case a specific @name
- *	   was provided: when @name param was not provided, a number of devices
- *	   could have been potentially created for a whole protocol, unless no
- *	   device was found to have been requested for that specific protocol.
+ *	   note that NULL can also indicate that a named device is not needed
+ *	   for this fwnode, or that no device was requested when @name is NULL.
  */
 struct scmi_device *scmi_device_create(struct fwnode_handle *fwnode,
 				       struct device *parent, int protocol,

-- 
2.43.0

