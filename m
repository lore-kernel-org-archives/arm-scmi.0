Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1B733065D
	for <arm-scmi@vger.kernel.org>; Fri,  3 Jul 2026 20:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783110332; cv=none; b=FNOVRhTB701GBawBMAtPw/Q/acYSB10EbnVBUg9j/AKf5ykU/fOF3vQxHluFTfxg/eCd4tUFHaTjcokNAXsU+cYLLKkmL2p2G6qwtti+sLevMdXsmXfZUQnn3EsnSKKNTiQwqYoA72nO+X8OOGyB0UJE1z3jG7mLsnc1YMrn8aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783110332; c=relaxed/simple;
	bh=nKzC39pd0ReRtRrZgLa29tO35AO/j3ult14EKdAp+hI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NQqItBGVBRgKiEYLJGN5dk9flUXr5k7HC96dl13usMRSLujZBTmqRIn9tuaCzCy7p+WZciOWnr50tSNyKfQkXpt6gJE+RInv1FDv09lHfUeDMAKKa4y7fsTUOUHDtEUHIyrTf5sQEptTTGBm/HGK3cCtxUi81NXhDU0nAqBUnhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZLMFsmv8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZLMFsmv8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73B671F000E9;
	Fri,  3 Jul 2026 20:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783110331;
	bh=/cSGQxcB2p2Gyuq3R/odzpGEXeoQPr+VuqI6gIHS/2M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZLMFsmv8UsURNTp39o4477pZtkcgFZgaNNWx6pbtXoVarEf2QwdaE6jV9g7UiPjgA
	 /vVyMZnA/bA1GfI0xIO3eeSUmthyVEL1mdbyoLQ9HYL61yE7x48sCQ2JogeyHHgBfC
	 V/JaLHEUsnCSHu7wrCyPlNtUc8E1V4oPGBYgfEjxrc7W2XapAMYCGLvGw1KhXQgz5f
	 1T+DXO2vR1msLKYtHjGlXWwOm8BZj9LTUOIqSqMckJ8/ATW8X+t8ijerW7/3h8bm3g
	 eQAo7Yt29PfeyHwLJxiQzmyM/3gsS0GMqCceCJ7pm0V7Y/Lof76WMpk67/CkECU9Jq
	 EMsD4c7Yuwrpw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 03 Jul 2026 21:22:39 +0100
Subject: [PATCH v3 03/17] firmware: arm_scmi: Clean up channels on setup
 failure
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-scmi_core_fixes-v3-3-5bae9766abfc@kernel.org>
References: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
In-Reply-To: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

scmi_channels_setup() can fail after the common BASE channel or earlier
protocol channels have already been registered in the TX/RX IDRs.

Route this failure through the existing channel cleanup label so the
transport channels, transport devices and IDR state created before the
failure are released before the probe error path frees the SCMI instance
ID.

Fixes: 05a2801d8b90 ("firmware: arm_scmi: Use dedicated devices to initialize channels")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index b9ba566fc759..861087b2920e 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3262,7 +3262,7 @@ static int scmi_probe(struct platform_device *pdev)
 	ret = scmi_channels_setup(info);
 	if (ret) {
 		err_str = "failed to setup channels\n";
-		goto clear_ida;
+		goto clear_txrx_setup;
 	}
 
 	ret = bus_register_notifier(&scmi_bus_type, &info->bus_nb);
@@ -3377,7 +3377,6 @@ static int scmi_probe(struct platform_device *pdev)
 	bus_unregister_notifier(&scmi_bus_type, &info->bus_nb);
 clear_txrx_setup:
 	scmi_cleanup_txrx_channels(info);
-clear_ida:
 	ida_free(&scmi_id, info->id);
 
 out_err:

-- 
2.43.0

