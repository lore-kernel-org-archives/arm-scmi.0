Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D801B4F09
	for <arm-scmi@vger.kernel.org>; Fri,  3 Jul 2026 20:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783110340; cv=none; b=nP7zA/h/FOAbnZX0ujU2DwL4Yl9UW79islqc2HJpZHZ3sBaiXmWDeVwKL+3XYu3f/GGK06jdq20t37JL2Ck7uoMC6vPrDOKmxOUMdR/46o3BrF4ACZ80wIfqFuDm840yXneQkSqxKDK174dyQw3wU23DMQSAkGIeIBVDvgf+JnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783110340; c=relaxed/simple;
	bh=UdGHv+eP+WGk3Gfm8djkY0UlIr1eYCKI0JjQfXvajdM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iuqNaXqyBLKtJvyMrR+B0CZ1ZSt4bBw/wXkeewTfjxBkuHUjZeTdgESmEFGPMipijFUFfNdqORMvzzziZXAYnqPN5rJQntzYxHu9vhHWFS6Ly2r75IjcDnNv1Ut778zqN382YeR3XLlAr2kle4MaJ3WKyPr0I2nGluomNWj7mqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q2TZD7Vh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q2TZD7Vh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC9371F000E9;
	Fri,  3 Jul 2026 20:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783110339;
	bh=FD/NU7GMm4Zv7S8veQFrmWmOgLAG1xEI2EsNyDH4suY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Q2TZD7Vh0c93x3ZZ+vHsgY90YDnYmo9sRYsBSxwRkemcEnX5hVadXK+nmiPSt14wm
	 jM1W3QLY8779wVvNCFEzcrbLtyO5SQBFBmILMyDXBm5eaWyGhS5VwyraHIpBtAmTFg
	 Pyst9NQP7zpR8lNbdYcahJxVh0A13da44uHJ/T+BogLBOETbR1IJQ/pLL77G4Sq6OU
	 PwYYIHTV+R/msrgO8EWfvvMAbkL0R1GVUGsZvCrXSG9MhZDzFUr3zAKNpKFjIINIoH
	 +8MVgJzJny2PtP/Nl1aOS40uEeiOnwMyBqaPIXZy1FGQXCkQi4ukNtfHlr3eUWNPVx
	 xssTHtMKA//sw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 03 Jul 2026 21:22:48 +0100
Subject: [PATCH v3 12/17] firmware: arm_scmi: Reject out of range DT
 protocol IDs
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-scmi_core_fixes-v3-12-5bae9766abfc@kernel.org>
References: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
In-Reply-To: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
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
index ae4b7128276b..f515b192c1bd 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2874,9 +2874,11 @@ static int scmi_channels_setup(struct scmi_info *info)
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
@@ -3341,8 +3343,10 @@ static int scmi_probe(struct platform_device *pdev)
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

