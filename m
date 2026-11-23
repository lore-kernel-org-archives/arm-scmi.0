Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447293;
	b=vyPCQXHk2L6nU1zcGOxOdWZc0g09LxoICmqXKrBy+NgCyy1c2IEvmJ1NvADoNDHT31FX
	 vsqFhuGXw0PCejhcyvzvj8SvegseGYDlwFTceVFr/naGqO18hIdiazx3s0vLbrvH5e0tq
	 VrgIyLH4oC1eUpgX4YNbKDNff+pToS2FBve0aT2ReUNWL8SU4IrSuUTr+xsn86oWb0BTh
	 pE++1bKErEYYPaXEAXStBeuTQMGK98tqVMu+Bdzm5yl3waxIC1bQ9QMc5KdP5D0RZjS9Z
	 OYhtpOvk06bbqmjFJi/CtAITxfqV4OIAxW4BNby1QulCJsAY5W7wNZk73OvoonVbINA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=Tzu+AkAZn6+BM4Gh9gxc/QFjQzzUORAibHelZ267KOs=;
	b=TexCaHw5nWdgj0svUVfiIVXwuIswrYxN5WzmkMyfWJCPM7HEBhVQo5fQfPZ/4buoZ1fc
	 0LNFXanyV/P5+nLwhTQ5fxm8xiIYi6+wMt5SFQhelLHI5bT+j/4MzvjuzwZBnVu5uQT1v
	 HD/mgHMIjI1LyvPBSkGJqMaMfqOjRXsG+wwDi2FBrRsmKuko5iOA9RYLhR0hZ+PMHphKX
	 5OQtjk0WrORFMCQwPuxdxkDMUt74rT/QPacTw2YJCEoV5Mg8FMepXGLMBOTJ2bRces7Yz
	 lXgR2hQoocqSThkIa0dR9Uya2uZuGElQpER02npb4Q9JHMv8xSpJw05JuXk22/6+fcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bXTdx4tv;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B495606A33E
	for <arm-scmi@vger.kernel.org>; Mon, 23 Nov 2026 15:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B495606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bXTdx4tv
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso3075220f8f.2
        for <arm-scmi@vger.kernel.org>; Mon, 23 Nov 2026 07:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447291; x=1796052091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tzu+AkAZn6+BM4Gh9gxc/QFjQzzUORAibHelZ267KOs=;
        b=bXTdx4tvohK72GoHLOxkkGD9DwiHrUpMfwXxr/zqn18JqrESbQYap3hX09WzNeStmU
         JptDL0LdtxhIqEtBvTPVB6ft0jN8rUkuntlrlLhD4zOManTWxiPN9Pt34PZrLi1PEV8u
         iZGwFQZHDmw38obBBCl/x8wcpGfbbuZmrKhrdLJB02vUEHqzlvmaqkLtXxNUE/lunBWF
         uBxsyuL8hklIWu89Mtbmcfla90gaWbwDpzk1pCnFSw4Drf6TxsSYLTTFMGf+2/D92I3K
         IV8xxAkvxwXqTPsVEQ/FI01qQqHRxHPxpG9JO+sZhHswPy48JAxMSZYnsYi3Qwf5t53/
         +Z5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447291; x=1796052091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tzu+AkAZn6+BM4Gh9gxc/QFjQzzUORAibHelZ267KOs=;
        b=Vh74Nd5qgpxIbnspU91n7WdV3vYW/dUNtyX5hjd2VocdJN1N6kllCvEqT42MI8f7bY
         naHq8ddtcM+06NMbmmRoxGsWYfb9GZ5HRH9SCQDl47hkw9Vif1Yx8JMXMQrhWpdOSmLK
         ZFfelDfokAKv6LA00w2Q9K12SHCJKr2XOb0CuCeK9xC8e84iwwo5CLfrMGoigUdaMTFb
         v0hBMDa2b9EUznHiCATtm4rLGHl4yu6sf7WzffPhRbVY+DkHZLd1PawBzJrDjTlalpAb
         8j78V+cmPp5875vvagNajzexkxl4rRWbvSZjIoDGe+CRZJSM04hs08bd9TLHYRhEwym6
         sxyg==
X-Gm-Message-State: APuU4Z8rYTu89RvLxUTbrn1Bmk7XsgOR0GbE8tKY2JC9CUm3Rf0B1aB7
	ciWBO80ODSSKTURlRSGtTrloRzpDaBZv/m+4vIyW5gHIADKqDjzPsA4RnZ808VrZSRQ=
X-Gm-Gg: AZFdTZeyHPD4cdGuiES2XtXTMXcaIhvWqrqis979qfRpOTVqUKTycfBnHist7XmNtut
	gQQMpKcrPlgqYy0jw8za0Vfu+4FSL/Up4FiTiCcfg2cAdg9HbhMGMyg2uduBbWsAe9OjqDCCfEH
	JZXoPaQGMhggDXqu31Tw0ZcS0AYsqQUyuTL8m1ZPbKItVWLTqYR5h/S9ZPfE5Lbng3QQjtFvAVC
	c0Igm2uQoq+bdvkbvewbcSJm2X2Tat9EQzsoa5dU5YMwGe/hpuuppBwLWKgnep2sSHTMrPrImdw
	LuA7hpTUc6J0pGngWb3KmeujmzHFFP+K9phZbSHtMuo/+iK5r0oU/+Cvi9aLWMR1iznw53Y1CVh
	9yx4T8TKFHjOtFRMINrVuZwTuD2cnWWOvLxunTyE6dvuLB0hw+ssabrtL4920TBIbdCodomr7pY
	K77R6V73VPxzdftkJr7P0jeoR145PJ+Y9ITCIn4hkNtIpVAfgnghZQAsE9xt2hfCO7F8uW7QU3W
	YPVFNcBnYU0OC9Whc7vqb/HiEK88s2WuJRlIdpVE4fSKnLyLg++bE+ebayHoMUqffiA4lH15Ts5
	0Np5WCD5TQ46kfbIEDLpc5Cm+x7lxv3xEDPpsRvfAwU2lbh60GU=
X-Received: by 2002:a05:6000:4b15:b0:48d:df08:307c with SMTP id ffacd0b85a97d-4abb8ac0d92mr20347784f8f.44.1795447290982;
        Mon, 23 Nov 2026 07:21:30 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm23236628f8f.3.2026.11.23.07.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:30 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 23 Nov 2026 16:21:23 +0100
Subject: [PATCH v3 01/10] pinctrl: scmi: report an off setting as not set
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
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-1-d61f039be008@baylibre.com>
References: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
In-Reply-To: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev

A get of a setting that is on or off, the flags and the pulls, returned
0 as a value, so every one of them showed as set on every pin. Return
-EINVAL when the platform answers 0, which is how pinconf reports a
setting that is not active.
The input, output and schmitt enables keep their value: 0 means disabled
for them, and the pinctrl based GPIO driver reads the output enable to
tell the direction of a line.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 43 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 982c79bc77cc..b088a24e4ec0 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -153,13 +153,36 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	return 0;
 }
 
-static u32 pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param,
-					    u32 value)
+static bool pinctrl_scmi_pinconf_inactive_flag(enum pin_config_param param, u32 value)
 {
-	if (param == PIN_CONFIG_DRIVE_STRENGTH)
-		return value / MILLI;
+	if (value)
+		return false;
 
-	return value;
+	switch (param) {
+	case PIN_CONFIG_BIAS_BUS_HOLD:
+	case PIN_CONFIG_BIAS_DISABLE:
+	case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+	case PIN_CONFIG_BIAS_PULL_PIN_DEFAULT:
+	case PIN_CONFIG_BIAS_PULL_UP:
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+	case PIN_CONFIG_DRIVE_OPEN_SOURCE:
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static int pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param, u32 *value)
+{
+	if (pinctrl_scmi_pinconf_inactive_flag(param, *value))
+		return -EINVAL;
+
+	if (param == PIN_CONFIG_DRIVE_STRENGTH)
+		*value /= MILLI;
+
+	return 0;
 }
 
 static int pinctrl_scmi_map_pinconf_type_get(enum pin_config_param param,
@@ -232,7 +255,10 @@ static int pinctrl_scmi_pinconf_get(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
-	config_value = pinctrl_scmi_map_pinconf_arg_get(config_type, config_value);
+	ret = pinctrl_scmi_map_pinconf_arg_get(config_type, &config_value);
+	if (ret)
+		return ret;
+
 	*config = pinconf_to_config_packed(config_type, config_value);
 
 	return 0;
@@ -390,7 +416,10 @@ static int pinctrl_scmi_pinconf_group_get(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
-	config_value = pinctrl_scmi_map_pinconf_arg_get(config_type, config_value);
+	ret = pinctrl_scmi_map_pinconf_arg_get(config_type, &config_value);
+	if (ret)
+		return ret;
+
 	*config = pinconf_to_config_packed(config_type, config_value);
 
 	return 0;

-- 
2.56.1

