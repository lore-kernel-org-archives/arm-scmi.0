Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A8236F8F1
	for <arm-scmi@vger.kernel.org>; Tue, 14 Jul 2026 12:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784033926; cv=none; b=tb4N474b8vfyyA1Oj6Yv1JE3kajJxDcK7xpQKRSaZ7JBi7hs/DrXwNE1z3gD1uhJ0pTn+R1WqglD77VcUROlsy/LAwuEGDLcMK8gtI8nvofGQvFIWBMGz6XiR6pecsTwNYJPHFZSgZkkHbXeQgDW6ycn9ZjdmLsQNzI0eJRa2jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784033926; c=relaxed/simple;
	bh=k7nO9s+tHlUnPAwAmXfZR3PjyOve2PVPkS//hGeqN2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pm+dbtfXF8OtnZtjwSNrVupP6UpYYPL+eEmCSi5peDOZuaPeyW1VoEC+mxVYpWJcfOrpHbBtvtj0Rpm6aEyZopm7dbe617RT/ApKrdoxE14Cj3xoG4rgFi8eHf5SXp9B1nVMoqZLfckmRsTaMz5kA3v4hjHqWloduk1ag09fWu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TEpz52gD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TEpz52gD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0826F1F00A3D;
	Tue, 14 Jul 2026 12:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784033925;
	bh=sEGMtxrd0vreRs/fTZMYtfAYQrWT8ElE/sKVAVpzQXU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TEpz52gDSGyfPGlzZklVynCFzbohJ2+wdZCT4jwwIW3OYfO8ndQIzH/d8a0BREbl3
	 RZVtHsopZon419VcgDaw06qyiU8ZnXxjD5HuHStRJIxcPtb0w0PjZiOn34b2bgECsy
	 4eRXSLPOaFCaa4PgcCyRDf7Tr9gPGYGtWrONixocS/YtC1OivjXULFcO7MbwnqvWoi
	 Z9XlS3p8b85NyIhl4K3EScqoagplVMSIs8bV4+oSx28m9HQt8wS4m8wWj0vf3ttfvw
	 sTvMHDus3kGRfPNBwlpkAJz5p2LK3cnyV3beYwRjh2OqH1FaHBELL2YYGlnqt5+OLD
	 WnqlFEiqrZ44Q==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 14 Jul 2026 13:56:27 +0100
Subject: [PATCH v6 08/16] firmware: arm_scmi: Use channel ID for transport
 teardown
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-scmi_core_fixes-v6-8-3afe499d46e3@kernel.org>
References: <20260714-scmi_core_fixes-v6-0-3afe499d46e3@kernel.org>
In-Reply-To: <20260714-scmi_core_fixes-v6-0-3afe499d46e3@kernel.org>
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
index 0735c6374269..f607557c04ad 100644
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

