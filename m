Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E793E3B5847
	for <arm-scmi@vger.kernel.org>; Thu, 13 Aug 2026 11:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786620812; cv=none; b=HOn92mHaHuuotKN1XESjByqTbKsn7gvMiXTF56ipsNZ6UTdnWMoC4eEsyY1qFtZ5aGFOQQ2pb4gDRXpgUzLJKcVnkBt9uYgesZIiNcBdF4HTthloXWGiuRE1K2S/664WH22BpsTzmcbS2LiLtZ5YJ8+/GV6cKf67sTzflUrw/xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786620812; c=relaxed/simple;
	bh=I9SjXMnb3WYjHU0c+2Ls91s3fZ+95Vjuxa1snjPl3Ns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DnV7uEooZo5yOal1M9wgDKKliO/RdOCuqFU3uYvLRkmwRZV1d8x/msNtSx6Phv7CyasgcRPXxqwIqyNoRH4YUR2Vr5ES4ijMuEBBVJ3VQxnk3LfNeRXQVWKBR7vD9XkkqnkES4rohg6DvPdnamK3s1FEV6ODwNob22jZ19JaL/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E4bxJHRs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E4bxJHRs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A806E1F00A3A;
	Thu, 13 Aug 2026 11:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786620811;
	bh=YZnmnlHOIAnwAFNNa9mq1vsRvjLPPK8mfvrGHyS9lec=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=E4bxJHRsLsz6zpf5Oxm7P7oWjuQ/dqRV85N8xf466bioJ6cZ0WSlA1vp2RyRp1ccb
	 UuBWbNEOMuDXOBj8JEUoWhIJxdbDBKIjKqq0gYHL0/Vgzd7i7ppXapFjqZ8uU+tKAi
	 K34G90mW1HxGrIgOFZFmHpe9phvE7/z9obvJeuuLkoTvs35/eRbAqj8AN1vyqfTSTR
	 CAJq9adnvXAgRukfjoyI1EYhF9XHolu27WlCAzzmFvgNYYI+xzOiYopMp/F6RxG2RE
	 ZjZikkNIglLLiliS+0dsYDpTGZ8qJrX9uHW4dZ0A0qnNic8O+PWy+5gNVrGZaNcvy8
	 bkoN6nau5Vd7g==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 13 Aug 2026 12:32:56 +0100
Subject: [PATCH v3 1/9] firmware: arm_scmi: Set fwnode for the generated
 SCMI platform device
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-acpi_scmi_pcc-v3-1-cb6b88b4ebb3@kernel.org>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
In-Reply-To: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-team@meta.com
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15.2

Add a call to device_set_node() in the SCMI probe helper to associate
generated SCMI platform device with the firmware node of its supplier
transport device.

This complements device_set_of_node_from_dev() and ensures that
firmware node information is propagated correctly for both Device Tree
and non-DT (e.g. ACPI) based systems.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/common.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index fe8c22cfb9f7..cc7d11c3c1f3 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -650,6 +650,7 @@ static int __tag##_probe(struct platform_device *pdev)			       \
 	}								       \
 									       \
 	device_set_of_node_from_dev(&spdev->dev, dev);			       \
+	device_set_node(&spdev->dev, dev_fwnode(dev));			       \
 									       \
 	strans.supplier = supplier;					       \
 	memcpy(&strans.desc, &(__desc), sizeof(strans.desc));		       \

-- 
2.43.0

