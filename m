Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50191408008
	for <arm-scmi@vger.kernel.org>; Thu,  9 Jul 2026 08:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587186; cv=none; b=O4+yDLy5H6gus96FHvWJMV5+pTZ0o/4bEM0QZZ94H6oLJPBPI7LDK+hL8s+WXkMgKZRBAVIBPzmu5rfw+F5NPkv9h6RNw1KgP4YYgmNkNwxM45EmlNxTmmhypE5yaFGTBR17zDB9zHqcfbJnfQ8GRxMRHwcyyHfKy0M8FMEJtJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587186; c=relaxed/simple;
	bh=x/gRMFmkfSl7NIwxx3cMPwVg/RfVyBisZNouOyQ3Mz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=keUhT/1JpgqC3RBdC+9Lk0noN69xrRpUH5Pe2qBlmVXudZQZCODQtkw6OWUH/sU6ocEkI6k+fktHn1B3FFtZNyF+rVuO3WNxFRl9+MmVC7haxoVeVnLJ5cO3lYJHlZ/Du0LZ3HRRE3rWKbQ+x+yr5+b+3VM12j6NsIMuJcnD4mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ELt2Z3c7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ELt2Z3c7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B2CA1F000E9;
	Thu,  9 Jul 2026 08:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587185;
	bh=WYaNQ0DxwlfFsYM4BOfM47oOjefNzM2WJRcEmS9pkWA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ELt2Z3c7ElnOvs51pPSUZ4XYDKwAj+7wrPKe5+Cf+9+EJJeImuN+Izp7z6WMGOOzL
	 KHbfkgF2rWl1jOy4PEH0j9jyP8kITg4z0NngtJWKAkw0x4CL0Sz5r6dROmvHWrUqcL
	 znaF2Mj9n1AheFhTLuvvvRnbOoSiU3Ic+MMgwwsv9oNbvDWrg0HEkOUM0grl3FyBBQ
	 OyNopfwYANQo5L3RiPkhhR6gcgoWjGTDsDprxWDBw4vUZDMYr22sFX2GmEwgqn9bNQ
	 R9k17kUAzOLDEoq7RprtRMp55EdNlExInC9rm4j0gke83M/p1qaBlJ86P2DM5FbEOg
	 CrSQOEFMZRUbg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 09 Jul 2026 09:52:30 +0100
Subject: [PATCH v5 06/16] firmware: arm_scmi: Reject out of range DT
 protocol IDs
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-scmi_core_fixes-v5-6-bea6a3024f05@kernel.org>
References: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
In-Reply-To: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

SCMI protocol IDs carried in message headers are limited by
MSG_PROTOCOL_ID_MASK. The DT parsing paths noticed protocol IDs
outside that range, but only logged an error and then kept processing
the invalid value.

That lets a malformed 32-bit DT reg value reach helpers which take a u8
protocol ID, where it can be truncated and/or treated as a different
protocol.

For channel setup, two different out-of-range values can also be used as
distinct IDR keys while aliasing the generated SCMI protocol identity.

Skip DT protocol nodes whose reg value does not fit the SCMI protocol ID
field before setting up channels or creating protocol devices.

Fixes: 05a2801d8b90 ("firmware: arm_scmi: Use dedicated devices to initialize channels")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index ad4587d75a08..81939309ce7e 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2873,9 +2873,11 @@ static int scmi_channels_setup(struct scmi_info *info)
 		if (of_property_read_u32(child, "reg", &prot_id))
 			continue;
 
-		if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id))
+		if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id)) {
 			dev_err(info->dev,
 				"Out of range protocol %d\n", prot_id);
+			continue;
+		}
 
 		ret = scmi_txrx_setup(info, child, prot_id);
 		if (ret)
@@ -3339,8 +3341,10 @@ static int scmi_probe(struct platform_device *pdev)
 		if (of_property_read_u32(child, "reg", &prot_id))
 			continue;
 
-		if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id))
+		if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id)) {
 			dev_err(dev, "Out of range protocol %d\n", prot_id);
+			continue;
+		}
 
 		if (!scmi_is_protocol_implemented(handle, prot_id)) {
 			dev_err(dev, "SCMI protocol %d not implemented\n",

-- 
2.43.0

