Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8ABA349CE0
	for <arm-scmi@vger.kernel.org>; Wed,  8 Jul 2026 09:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783501231; cv=none; b=LXyn1Jheh5U1Rm1BHuhy1jBovR16eS3iiEq1vIVYkeTiDok5n4YLK0o95Zhx02aayJd9gbH/l8TLKi57FsUz6dadwQJFzXtLcNLEybo5v17FkefHOXBJRMmqAiw/ljUgoL3vi9LNFk7MBVWVQU7OkRORYZcOUqdeMtic2Mwky4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783501231; c=relaxed/simple;
	bh=sZmnKD01wM+nBqSe62jgNvCu6+SjMltpX5EgMoIyS+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=os+DbOHO5ELG8icRK5OZrML2gKC1Xzvaq8JvmEZ+Dm4WN8Vv7+gur8UQyI14+xBHeGXUcyWd2G7da5juOX9gq7/c0kUexp0fwU4s/lK5Xjc5QrPxdLCoIfGN7L6yXjG8ml4E4J2DuxptrrmLgKbOoQK6o3muWtKlrU0VlEj+J+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BXMIvPPs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BXMIvPPs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 394CD1F00A3A;
	Wed,  8 Jul 2026 09:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783501230;
	bh=y1yMKaThBH4by4GQ13G90z2f3G5Qb2br9h5YbOQflV8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BXMIvPPs118em0CzQTi9Wx6iq4blEjTIlziU35Ka0qPEQqfd5GZ1tU1mTJiPHWNbv
	 tpA9LxlildFpfJmjLhnGYc1rf76sUfnq4sMDx82wkHLXcdhB+A6FRN6MBpD82WB7DZ
	 Qws8y1Uj0kJ+4mu+83UcWC4UBYLOBokUecP6zcXY9ooW2vom15s6UXaXn2rJgGM83/
	 I7rDgfxYvarVDtgH3Zw8jTWioLeau+nNnofHzI0jqWrcInZDxC4fki6NYg0JfpWWhn
	 HeIGVWzavQRtAB5w0oO61v07PURGmdXdNWgHfyW31WTo/Dypcqo+juS2zaU9xzHlVE
	 NV4oAsNcE1iWw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 08 Jul 2026 10:00:02 +0100
Subject: [PATCH v4 06/16] firmware: arm_scmi: Reject out of range DT
 protocol IDs
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-scmi_core_fixes-v4-6-53142cd60b63@kernel.org>
References: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
In-Reply-To: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
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
index 3b0c8b6087e6..8c4a3036ae43 100644
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

