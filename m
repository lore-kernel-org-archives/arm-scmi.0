Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F9640800E
	for <arm-scmi@vger.kernel.org>; Thu,  9 Jul 2026 08:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587187; cv=none; b=Z9sfcwbGOSczGBlSGWCfkcVhA1TIhB2fi1yxSGUNJQi6xLMpYq3n/jRzeSFAYhpbTO460uPrCfyUUGw94j6xQxQle+Wh0D0VJ1lfFA5AgCOgc77E5mwigkBUPMYp0K4Pj6czZQGDseydbSzYe+hiDe6BIA5yRl0BouNx/u99OPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587187; c=relaxed/simple;
	bh=UEr8viBp4e+wrcQzm48UDZBdzM+warmR/QPvAHwfQMQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WKLSuxp15YYu1D+YehRL1ECa70RPHQGSuAtsGNv2DqEr7z700z1qMn8eGtFB3KlMnGO8w0bzp4maO/shCGuKl8Wwsh8ZQ7tXPALNa7mXa7AaRdrOy0evc4OdbEn/tA9y15wH7vi0/rKLioHblAFiKFlRQ8Sy7okgjzzYXq/DpIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TQKQMizU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TQKQMizU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6B71F00A3A;
	Thu,  9 Jul 2026 08:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587185;
	bh=BaQ8rCcJLdRZseKLXXiMOJ/HPW7WDuU0WyPWOnfMZ1g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TQKQMizUYYdVaaFTQ6owHTMD/gxwGYzRdwo7dFj44PHi9mqIAjslAmcDYrqOoNh2e
	 cRB/yxN16KVaxyYj26mNmYdlDtRsTS8RpO5VR0+g2eb9klfWsg+Delp9khY4ckp1Eo
	 radFqalYDofwgx1K+QT95gbo3XZv5M0zepGHWgXU3aoU8YAGMFEu8Ok975bMVERedA
	 16uSHU1C/l38KHFpHV7U3GYSPcO18A6fWrbxsrBbWcXjtZR/ZVjpnNjMpixe2+Mv0m
	 /bYcKgHH6ZIkxQ4ce2pwmi/wIbbBer3rnI/ZYN6HNzRZNMqpaOVSNqf52LRz4oYZEl
	 Fg5IWaoBt/1iA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 09 Jul 2026 09:52:31 +0100
Subject: [PATCH v5 07/16] firmware: arm_scmi: Use channel ID for transport
 teardown
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-scmi_core_fixes-v5-7-bea6a3024f05@kernel.org>
References: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
In-Reply-To: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

SCMI protocols can share the BASE transport channel when firmware does
not describe a dedicated channel for the protocol. In that case multiple
IDR entries can point at the same scmi_chan_info, whose owning transport
device was created with cinfo->id.

scmi_chan_destroy() used the IDR iterator key when destroying the
transport device. If an alias entry is visited before the owning channel
entry, the lookup can miss the device because the iterator key does not
match the protocol ID used when the transport device was created. The
code then clears cinfo->dev, so the later owning entry skips teardown and
leaks the transport device.

Destroy the transport device using cinfo->id, which is the protocol ID
that owns the channel and was used when creating the transport device.

Fixes: 05a2801d8b90 ("firmware: arm_scmi: Use dedicated devices to initialize channels")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 81939309ce7e..0d93ea3ef4d5 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2896,7 +2896,7 @@ static int scmi_chan_destroy(int id, void *p, void *data)
 		struct scmi_device *sdev = to_scmi_dev(cinfo->dev);
 
 		of_node_put(cinfo->dev->of_node);
-		scmi_device_destroy(info->dev, id, sdev->name);
+		scmi_device_destroy(info->dev, cinfo->id, sdev->name);
 		cinfo->dev = NULL;
 	}
 

-- 
2.43.0

