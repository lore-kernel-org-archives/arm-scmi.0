Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633B93F39EB
	for <arm-scmi@vger.kernel.org>; Thu,  9 Jul 2026 08:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587184; cv=none; b=bL1bUFG/8iaE0tqlEAQeBb6ubPGHOZ7aleHDQbsc1lS5gZykcBA+DLKOzsIUwfomrSwy9mjcDfg/LnOxc7kb8g1I2zgNlCFbj5gOZvTD6rxVeKXRLvzNBofel2whh0rQp+GGdj+8MCZ6yBCKDS3iedAnzjiqTmPdZOkuaDajqVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587184; c=relaxed/simple;
	bh=aK36TQg20MdL1ycgWDrePDTQKNFimkJuEolp/0QbdBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vgb68Q+e35TUnDnCioabH3dSxDr34vlO9QPuDUVtH4+0zSFEhWFHGeujlMWh3+p7MGRtt0QxCDvZXD/3fKeTY2p2h4ty0pVYxZHjkimHHQv2kdc7DPRdV2UqQ46+SU5OO3yHRnG1oXiKJbLM4SIOcQxzfkEhvySNXpNw6wtu1v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H0WBp+EF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H0WBp+EF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A3241F00A3E;
	Thu,  9 Jul 2026 08:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587182;
	bh=yFFulc+Le0ou7IB7lFets28c0DyVwRTFWSDm7SBac8M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=H0WBp+EFZ5AFr+A0M5wUOR9aSoEABalbTW4St07665pLbXGikc1FeLbmjBSsBDUMU
	 W9zxiGDQZ95q46Qw68LSnkikb3DCDOE899QyYZ9eNiE+aA0V2LacDPAX+8jRAox1Kw
	 Yy1oIXz7g7C2M56rDv6mrwPAFyW3qjh28gHpmweiFdEF4tXksv/QTAn3vAkpkZVsFt
	 DP7l3tSGI0CG9B0CESYwT20h8XPe+ilqmKq2rotahVPhmyNe660jlT2HkuB6cs3c3H
	 IhuxSnnLi8Mddma/y/sU8bHtmtgE6wwmCvhMUzAbY/ZKCMEu0HIk8f3L09R4P0BRa3
	 vmBNfBHzoeoBA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 09 Jul 2026 09:52:27 +0100
Subject: [PATCH v5 03/16] firmware: arm_scmi: Clean up channels on setup
 failure
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-scmi_core_fixes-v5-3-bea6a3024f05@kernel.org>
References: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
In-Reply-To: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
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
index 1354de59ea84..ef41b377d3de 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3263,7 +3263,7 @@ static int scmi_probe(struct platform_device *pdev)
 	ret = scmi_channels_setup(info);
 	if (ret) {
 		err_str = "failed to setup channels\n";
-		goto clear_ida;
+		goto clear_txrx_setup;
 	}
 
 	ret = bus_register_notifier(&scmi_bus_type, &info->bus_nb);
@@ -3379,7 +3379,6 @@ static int scmi_probe(struct platform_device *pdev)
 	scmi_notification_quiesce(&info->handle);
 	scmi_cleanup_txrx_channels(info);
 	scmi_notification_exit(&info->handle);
-clear_ida:
 	ida_free(&scmi_id, info->id);
 
 out_err:

-- 
2.43.0

