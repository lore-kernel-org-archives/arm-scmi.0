Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C864A37A498
	for <arm-scmi@vger.kernel.org>; Tue, 30 Jun 2026 09:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782810401; cv=none; b=c3kC2FVxpWxVxiERbSAd+PPvDdqTPWvV49DMYmbJRjRXPSYDGcNiu1JESXO0CcKbX3UCkDB1PQnFHZJHz32Szgi8Q8+xcStoabHyfvgSiuMVjgJd13VlKZAVmrnSNr1Tx/McBCY4wnACghlOsr+bN0sENndO5n96feKc8Ke+kRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782810401; c=relaxed/simple;
	bh=nKzC39pd0ReRtRrZgLa29tO35AO/j3ult14EKdAp+hI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jEGWtabeMmeNYJvxU9HrwE12XVhtaEFbDk4f8oIjtSTwsPuNpKnkuxt0nx6RFidJfLjxdXYtHRTZ4soTn5l9GTwzOY+6yLq42Ym7kfyEFqdJUy9XAGoK3voP9cjIAT9ouE8YwEMq4DVANZ8fj48gz54E3K5MbhiLepxImoGK52I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UG44LBcd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UG44LBcd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 903271F00A3E;
	Tue, 30 Jun 2026 09:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782810400;
	bh=/cSGQxcB2p2Gyuq3R/odzpGEXeoQPr+VuqI6gIHS/2M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UG44LBcd68DmNg7+gsm6bM0OQ33wtz++vT2QmPOpV6Tk5VU2FlxadwFTxzf6SB64p
	 nl8NBFykrcsDqQTOKGurH2Hr33vT5cyzA1oEeBiXAL4T5gCOFP11xcKPTlJ7BDK1hl
	 IMLQxDXtMFmZcMYrtUfhUjaal0hbpF7vfHU/oQn1Jo5m1JXrVzuYELU7skoVCGeS5J
	 jgqfy9n3xfOtQJWoSJipkrJuEEwEBWa2jG5MDHh8BCYf/ES0eQL8DqajAT6p4HvRzv
	 Kl5vXobi/Hoa7Tvwml2qkGYkqVHbM/Yu4R0xdxMm2pOU5QSE8w39XJ6ieBHyy/9PKe
	 R5y8s5S7l0eRw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 30 Jun 2026 10:05:59 +0100
Subject: [PATCH 3/9] firmware: arm_scmi: Clean up channels on setup failure
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-scmi_core_fixes-v1-3-f932c1e51992@kernel.org>
References: <20260630-scmi_core_fixes-v1-0-f932c1e51992@kernel.org>
In-Reply-To: <20260630-scmi_core_fixes-v1-0-f932c1e51992@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, Sashiko <sashiko-bot@kernel.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>
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

