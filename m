Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567963;
	b=jgcO3a4UlomWk61xJoGP/bag/xCx93X/tizaYR22/R2c/6RKaCOuMJjSM5wOYd9rsnxQ
	 ey3Kq1zUdQF68NllK/OFdBdfJNmQUG6zxqGJ1SlxTLjpBPiKSQSw2U2rZmHPPddedCUm3
	 Aq+jEyNkHbeIAViJaugzcb9yL2k6j0UWekUiAbtpFQR7GZATpTt55gjSJmbpG0LeykRy4
	 Q/WDmbGpN1f3dmpIeFLzOmwNRMrtVGuOQbGBRDlcpODpcyaRl3wSWcQX0fi+H7Vk/gaTt
	 xoVsv+cNsmyFlyttIr9xOR3nxI6F9h/tyqBAFviF5qgth7mYwPaKaoq1jTJcVkwKiNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=yg0iZZhCVCWjBVUqZaveZMuIdKfbsHhFyJo5yYUlYrE=;
	b=vfX9+PoKBMprRcavINpgHeLX6kwPpedKPgq50hneYOaxPD4hFgIssVm1mmXT9tpkWBED
	 XXRNlVTGll6JMMrdAuwrhmhEcSVfvEdh5tvSGY9sSzKyfu4v+i26Gkbnai1X/JbHd8qE1
	 4GcGiedi5FEX74+W0kmMqg5fCXECN0OTeUWgd7hINSrTMosLeRrD/5CJS/qh1kjNRdEqN
	 VJbP4uFucl7r0ZhMgTXvNQgCJW8HQOwDUL7z7clT4Nmku2xMrusLJI+LpBr4qYjiqGoRr
	 3eb/QYPDZBJ2BkOMTAMHdkMBLqK/Enbm+tDdWnD9waDHTzai9lu4gCQR2klbaAwgUEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bD5rIA6W;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E5560A382B
	for <arm-scmi@vger.kernel.org>; Fri, 13 Nov 2026 11:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59E5560A382B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bD5rIA6W
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so5907395e9.0
        for <arm-scmi@vger.kernel.org>; Fri, 13 Nov 2026 03:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567962; x=1795172762; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yg0iZZhCVCWjBVUqZaveZMuIdKfbsHhFyJo5yYUlYrE=;
        b=bD5rIA6WLcIQpx8DTYeXxEY3FOwPzZOkYVEms9yqlDmrAm3UraDvLisHOLTtIZbore
         wH6mPfa+PbaEbEOUHJW4hq/ZgdqU1Exx+1/hKgzBlNFzV/BR3JWXKsIELtm1LW6pRyTc
         8LaH3ZkFXZVUtvkEZziZqfJcz4qX5A7oBCZCD2+LjDVVOOCDQbG7DqoMwDeCmSeTYB2p
         hVSx4dq8z/HlWUwt9jOabLRgWmoSbZqrk/88G4ZF5BqDL7RDf/+6Wa0kPnP8/5rurOqi
         YiM2PlMsNoqg1zCERHGN4BojmJG8f6j+y8fm+7p96aLjPDyp9VDo6Nd6KvKDQY9wPQeS
         +h1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567962; x=1795172762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yg0iZZhCVCWjBVUqZaveZMuIdKfbsHhFyJo5yYUlYrE=;
        b=OsVfQmX+XC2XJA29KAd6l6YFhElM+bzz2lvmvoeCkbncP9QTo2Jp7AEqof4ZYI1Al7
         vBrif9jofA7UAtERTDW3tS2VdOhmutT9dkivffV3V/9oKja4NryISLIAzrXdx7Vk/FAa
         rimFxu2nXEfoIrf5Tk1N4lSBAkXBlGgU7yCYSD1oYurBLXfU6u96Fq9gpCTPaepr5k43
         9wQAwLbBTZ1qztu9ACIl/HA2PIKFqQ5lwvN+Dl1tvBDvYVAbIVizb2a3ux3IPkUyHR5G
         lj3OYD3Hu6aX/gsBSdBD7pVdTuyqLN/q1JHrrSorT91vVVWM8WYeNXSdc/VRJFPzE4sC
         BsuQ==
X-Gm-Message-State: APuU4Z9LzHVoEKs1T/Z+UbAw3RgfTFoOLRJieVflikKUyuLJmksOxIFW
	zWNXWHxBooKyvW3FjU44RJHAFiX3eeJPVFMcwP9Luc5Cy7+rHY7YyeZORl+Cl3Pvpws=
X-Gm-Gg: AYBFou23l37emLauTaUjAcGcFIBDT/jQ/kimHyntSXhL8RrZb667XGQwNp/5mh49aN7
	hOoak97QSpzHGsKOO9VmNKuYHcyz69w4hwNZs3d+XL5BnDW32uXFANPLBRtlJild5wV3RcOdhFU
	CgOBfpKnQsSfCE6OpnWGzu2f+Ds7f9RDbiid68yg7R1PizkqVFdIMCdznNZ7F0fplQEjaBRN6D2
	YToDkRccpSiRbw51Dp3PhyrKieq0AneXNVYAsyoxV1/Os2yaKqQC3Womd/4ZoMerKOO+O2dWHQ1
	ugAIrMYMp0QAIXIK9HvlGumopHSPSTaQlcvavukznCrYB61fjNsSnOyREXkyP4lBT069ERBJqqa
	rlKDDcq91mFgOWzsBEXG09P92/bcOpge2RQ0uYWm1KAUeeSfZTCuzgRzX5cCTPoeUvTH3DKiYG6
	FZR0xxeKCO0O+ZUmhbwBOoglZMyCkmwvPH4/rozXiExt9eZlIal0OQEnJ7gaaWN0QGwEF/7j6Y7
	TLIWRsd+twE+AUwqYIySa7Mhs8zhdOx5RUCmL8LqliLBWGHS/tgu4F65nyXxrBZ3nXshF1AtXOV
	xKGR/R+7erC2vCX5Z3aqYnaNmnkyGvo+AC/aRW3TSS5MCg3YDXA=
X-Received: by 2002:a05:600c:8905:b0:4a3:5a98:c279 with SMTP id 5b1f17b1804b1-4bb55a57c66mr28918645e9.8.1794567961834;
        Fri, 13 Nov 2026 03:06:01 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d69c21a17sm399461f8f.50.2026.11.13.03.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:06:01 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 13 Nov 2026 12:05:28 +0100
Subject: [PATCH v2 02/11] pinctrl: scmi: map the schmitt trigger enable to
 its SCMI type
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-2-faccb4685d88@baylibre.com>
References: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
In-Reply-To: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

PIN_CONFIG_INPUT_SCHMITT_ENABLE was sent as INPUT_MODE, which drives
the input buffer, and PIN_CONFIG_INPUT_SCHMITT, a threshold, as
INPUT_SCHMITT, which only takes 0 or 1. Send the enable as
INPUT_SCHMITT and refuse the threshold, the protocol has no type for
it.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index af33ddd4056b..cbe4f3b6368f 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -128,11 +128,8 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	case PIN_CONFIG_INPUT_ENABLE:
 		*type = SCMI_PIN_INPUT_MODE;
 		break;
-	case PIN_CONFIG_INPUT_SCHMITT:
-		*type = SCMI_PIN_INPUT_SCHMITT;
-		break;
 	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
-		*type = SCMI_PIN_INPUT_MODE;
+		*type = SCMI_PIN_INPUT_SCHMITT;
 		break;
 	case PIN_CONFIG_MODE_LOW_POWER:
 		*type = SCMI_PIN_LOW_POWER_MODE;

-- 
2.56.1

