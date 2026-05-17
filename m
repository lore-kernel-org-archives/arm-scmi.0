Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66AE2F5313
	for <arm-scmi@vger.kernel.org>; Sun, 17 May 2026 19:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779044659; cv=none; b=lxF2jRvM69wrI0fAwjJhdiWKRgcHaVyb+3sAWGR0BPhdtKtR9DULis+CjiKBU1fNEmuMnabocN8V/4cBZKSeNHCR9tk91ZAPfAl2hVHPqYeKA2b6TaE+PDo8yESv7cBczacQEfFeUCbAMz7v/LfV7LcarRqA5crtp00DsFhWvZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779044659; c=relaxed/simple;
	bh=N9O3vxXoMdpQ51OeP/FlfrEMA19XNtmgtu0oCSZdBQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=TuT2GkJC/POXvHbxunTbcS+b4QExCDKjHVodGtP4tEoEbJZ6PuaparxBPgCWNu0UJ4uqhOXzCE3BJ3FeUQjXuiR15UVFWfkCxqrDfce7VDiX71gg1psTIFq/aPMq9kPlbcO+F8UVXFoECsaqtVKJio0aTreO3gd7GOMmaGJ4APs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DLin+HbA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DLin+HbA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FD48C2BCC6;
	Sun, 17 May 2026 19:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779044659;
	bh=N9O3vxXoMdpQ51OeP/FlfrEMA19XNtmgtu0oCSZdBQU=;
	h=From:Date:Subject:References:In-Reply-To:To:From;
	b=DLin+HbAOAg6iPlqj/EwGZ9xsdpoJ/nw+U0izai/MpZ6uk5QjD1J2AYNh+jipuFzd
	 7ImuJ/cVUIctcnDNQjNhF04GMT8TT+lFgLr8K6QaA0eh3FCnkRSzl2kUtE1yncnEVM
	 1yio9ogHUscUtiHJ6OUXcWYFBbSgA8VwaS3sGwR056OkQgg7QO6Nfxa1XULUhtb7U8
	 Iq7tXc4zhjeKfp+Usc6c6chg9EVfbEB+n8NTarhuH0AhTYZa5jh5SqfIXwMtF8hsbx
	 bQqydvg7wxQpsF/3T8hK+3fxofYQQLaRrZ3GSdq9yV86z3RV589lOd00GAjUGlX9Mf
	 Tog8LR6XkA3Dg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Sun, 17 May 2026 20:02:40 +0100
Subject: [PATCH 1/4] firmware: arm_scmi: Read sensor config as 32-bit value
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-scmi_fixes-v1-1-d86daec4defd@kernel.org>
References: <20260517-scmi_fixes-v1-0-d86daec4defd@kernel.org>
In-Reply-To: <20260517-scmi_fixes-v1-0-d86daec4defd@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.15.2

The SENSOR_CONFIG_GET response contains a 32-bit sensor_config field,
and the xfer is initialized with a 4-byte RX buffer. Reading it with
get_unaligned_le64() can consume bytes past the returned payload.

Use get_unaligned_le32() to match the protocol layout and the allocated
response size.

Fixes: 7b83c5f41088 ("firmware: arm_scmi: Add SCMI v3.0 sensor configuration support")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/sensors.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/sensors.c b/drivers/firmware/arm_scmi/sensors.c
index 882d55f987d2..836c294a9f42 100644
--- a/drivers/firmware/arm_scmi/sensors.c
+++ b/drivers/firmware/arm_scmi/sensors.c
@@ -793,7 +793,7 @@ static int scmi_sensor_config_get(const struct scmi_protocol_handle *ph,
 	if (!ret) {
 		struct scmi_sensor_info *s = si->sensors + sensor_id;
 
-		*sensor_config = get_unaligned_le64(t->rx.buf);
+		*sensor_config = get_unaligned_le32(t->rx.buf);
 		s->sensor_config = *sensor_config;
 	}
 

-- 
2.43.0

