Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793192711;
	b=3TMA5EUVR+l3Oy+M/v1AAEVWEhAr2gxDbZBwOR2IQ51XW56x6seRCpT+LXPFXz4agyYi
	 9j1f+mJuURnax5U7pxn+eDHvBt3PUz2bBLX6fkZqCjf5U+0joQ1TYvCSNp4vHrS+W2K/t
	 APOM7w9c5C3i/5TMNmZRibRFzmBHeoLREjoWZvIt04kmm4/lfaX6Lf7KEkFxpaWFri7KI
	 pnkvFJltQqPGTrW/qyOZp9FP8Ba2hvfuQYMr5tU/6F7Uk9W+iO24O8L01lHMed1+7q2lk
	 /eLpLekeBymijRcZUO1A/phU9ncI9Z0/I1Mx4s9BiHESyDDjhVrQEXVHuazeCMpXZdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793192711;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Lupen3Bz7z6fzGugIVqcT5Cw4W+hgoB1rBA+DEWqbiw=;
	b=3CjCO/ibqdDTqAb6DWsVzEesfm95Y0Ty8vRzBXRi9Wripc6Q//Cao0kz+fwKvwyBD5/P
	 hg3mqaWGJVoLTbHRToMVmPpSbjs52nKyCGW82IzGV11iRlRsPONI+e9z+Ub07J+mbvSod
	 cp8W59yyj9iJViYVA7KxVAhGRRMm1+rdgvZvTtO85BICyPB70C332ak5+6vStfpitpx8E
	 ho77XvBPwB9HRQ+0sDTS94yGivZN+M76LuizEUJUi4PNMhL1vHv5Rg91yzNHlnOtAQ59i
	 tM2WEzZYgPZ+ppWMjF/C94kClIATlFWKxbpYYsfOdPluBGQBWELEzp5M7AhGTTN5ntA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T5KDMnv6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A10F606A31C
	for <arm-scmi@vger.kernel.org>; Wed, 28 Oct 2026 13:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T5KDMnv6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D157C1F031E0;
	Wed, 28 Oct 2026 13:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793192711;
	bh=Lupen3Bz7z6fzGugIVqcT5Cw4W+hgoB1rBA+DEWqbiw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=T5KDMnv6A1NFN4vPEdpRUQJ718pEuJGhdnw85GpT4/p4nvfAuyHSXPMP8bhzsuhmL
	 zEgoBoaPEtS79y+fBobpSArdWJXco0sWNWQiOBuEj8W4LMPzMbARmYGjQc7hyPQFZv
	 M7xC6d8RJ9QLAsgYbYIEBTKpI9y4JfMwzSrS6c/Oih6YsR/9sYwfecDi/dXAEB3S6e
	 rW18zVk3HY4jnQuomP+Z26hA1DNhGTAd7ubevGWA09QwWKz0NDjpZcnzZzdmGLFibl
	 X14HOB36UaqCVEo+X1A8l80RZvd50DGGrwBd0zPo/KLSb3yiiHogeNLGNVLUq25EC7
	 7LPB5ZVWplvmA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Peng Fan <peng.fan@nxp.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH 3/3] firmware: arm_scmi: Unregister notifier on enable failure
Date: Wed, 28 Oct 2026 13:05:02 +0000
Message-ID: <20261028130502.2999676-3-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028130502.2999676-2-sudeep.holla@kernel.org>
References: <20261028130502.2999676-1-sudeep.holla@kernel.org>
 <20261028130502.2999676-2-sudeep.holla@kernel.org>
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

scmi_notifier_register() adds the caller's notifier block before
enabling the corresponding event at the platform.

If enablement fails, the caller receives an error and can free its
notifier block. A concurrent registration can retain and later enable
the handler, leaving the failed caller's block in its notification
chain. Event delivery can then dereference the freed block.

Remove the notifier block before dropping the handler reference when
event enablement fails.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-c3c9437c-ba1a-4db6-837f-cb0950d89018
Fixes: e7c215f358a3 ("firmware: arm_scmi: Add notification callbacks-registration")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/notify.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
index fb60fb07c0ed..e5de0d29c346 100644
--- a/drivers/firmware/arm_scmi/notify.c
+++ b/drivers/firmware/arm_scmi/notify.c
@@ -1395,8 +1395,10 @@ static int scmi_notifier_register(const struct scmi_handle *handle,
 	/* Enable events for not pending handlers */
 	if (!IS_HNDL_PENDING(hndl)) {
 		ret = scmi_event_handler_enable_events(hndl);
-		if (ret)
+		if (ret) {
+			blocking_notifier_chain_unregister(&hndl->chain, nb);
 			scmi_put_handler(ni, hndl);
+		}
 	}
 
 	return ret;
-- 
2.43.0

