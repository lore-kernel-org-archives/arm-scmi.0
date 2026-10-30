Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375921;
	b=qwiM8ZA67au6gdhhFKnCed6HH/grQE35jSyEnSkJhM3IYS4MMgmNERc2b9Q1yq9AtQI9
	 7WYNwiQxVAoXukPika7AyceH2t33XTOZ1iPa4tr+plXYIwqHKbsbo5nMo16EPSfEnQs4Y
	 rKj3H5r7RwRJXHyfLHhefCo8+MICWthcqOgU2SuijhE2zUlhfrQgGiVYrrC5ZTXPZRGdR
	 KbcX3lShrGSt5Y98hfqu0D4W/3KSz219SKo5SvMG2XsWFCWWZNVOAU9qOK8+5386MhH/X
	 O4o7Hrx7qvUC90m1CzRvSX9XEOZAzoUA1kd6GrAGtsbUkbt5McS4tGZOwq9kGSZLiZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=sdGs2n+FjnN9kQRvhMCKfS4IaxNbiNIQ2+gny9XTHQg=;
	b=N250P7DZuintpiqjKb6qJLq/iTVTT6nGvTsaLt5YsscH3dn5mHAExwhvpBAnKJBoeUn1
	 LBubQDpJIlTYGPYGw3xkw6YMshmReYdFcfK3KLVCAwy4sdl10mQorUTGeRW9SlrM8E/lu
	 tqHeSo4aWUqUD780rA8aHA2HUC14AeRblh1aREG+BgNv4Hrf4+D0DbIbDzNtVkV4dj/eL
	 pLu/8gOf1t70j4U18Vm6haDaxOdGoV51S9se0TRCYVmAZLB49WPClyhExfM3PJAbip5y9
	 lSl88Nk/hab1gFCSgocni3TRR8iOAx8Jbe3aLnxgXQuDVCQsdrnn0tS3XxMlIjc6OoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TkPrSPOh;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DA060A2605
	for <arm-scmi@vger.kernel.org>; Fri, 30 Oct 2026 15:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6DA060A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TkPrSPOh
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48df54150dfso433653f8f.0
        for <arm-scmi@vger.kernel.org>; Fri, 30 Oct 2026 08:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375919; x=1793980719; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sdGs2n+FjnN9kQRvhMCKfS4IaxNbiNIQ2+gny9XTHQg=;
        b=TkPrSPOhxPJ8/bxACPBSXVJ+BuLIvkXtRzxSHQG72tIqYLAMBWGX8ZMWGWVtCqWmQp
         N01CLFwpGFpFYlXH+bMZEjarAtD2WBgpICxPW5pAfFoH4T8b2Sb3eF/8pemtj5sj6zt6
         nr1EbGe2N0xwV0VUrkjnsCBvvueXWqPUfwXqu8ORlknhzB2JS7lYcvcIXZHYYK9Ep8PK
         DyVA/yLPcSmjLT8kcEgeMumP85YaVCItGKWb0/VFLR6mkvCo3a314ziPXHaH4y8Yy0n+
         1JmvVJk7cXax2dL9tV19lWq+AxYwxOTP80JdQt6CtRaFdPGPsavY/gHTo5foawxftbBU
         Sfqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375919; x=1793980719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sdGs2n+FjnN9kQRvhMCKfS4IaxNbiNIQ2+gny9XTHQg=;
        b=In8r/wX9MYTIfYsfD9Y3r/2bCtkab+mpYWD7O6C9x/F6Wuxcl3WU2rhbPP1k/9FCJE
         RNRh1S3AHNLa6y1enHIHy52rD+ZaIwwlsNLkglLlJZwRfmoCw6qpt4BM2RNZMvjYXDlA
         NWOoX6xhbGTiFSo+5HhDzCHLROVLk+dv5KgroWUKPRo+jGGoKh5fKuMhoDTlpFGlkm89
         OCUYSbMYgEbDkA87L+lZWILOlx0CbuiuezSUeIfE2n5l0/cgCcybjICY6iWEi+E2Wkmy
         rvKgZ3hP7bV14/vTESQ4zbQk214aeYIxZjQWn+wC+llxxJ5znGbT40neanckxhZAep4n
         8/8Q==
X-Gm-Message-State: AFq9FYKPlZutpmpeswQMSx806toZNhONaUbg6JGBDjGPC+eoQuohKbfJ
	VA4q1wQ5GS57QJgEkGz/iUbOzqs9pzTubqVjDBxpZwqbq1S6YroshIdVRP0SlV9Ho5o=
X-Gm-Gg: AYBFou0GFPTnM/6rBZGmA90ebmpt692+EkHqdM0KHixRFU89fVGZwr1LtfhypyTGqYr
	RdvwcemHR9TIz3mD5gOdB3hs3jzYL1u01ghjyXEWuxdDvnfPlUbr3ZXkmWDVBJEvfwf4f2ZbVEJ
	AyOLftZl/wf88kDUsQKb1XY+1BHDPMNa1CqDsvOyWTjJRs9AzHhSRelWoHHAjBOEW5FF7oyfC7Y
	Dn4Gv1Ni9Zn9fW1WKptFA7EL5MAPqRY7GxaQbzZ7IgMof9ZmkGwIDECcPgleD7RO9Y06PS/+6NU
	k9RnTbaB1hAsfCPVxKOu3Npsssk5HQgjH7Uo4bMQaoQjXCdFlBFI4Fn604lcWwI6vGxXwbgXnXU
	p+mkZp7JpONkiJrDJ+ewOvdXc5c4DPBgXxlULsytNYv2RzEd9llQXHv3/+F2OaGO63SQHoYJIJ9
	x2ZQJlI6Fr9zbofQ6vrMA52C/v8MBiwtE0LDbiPoGFCk1K5EFPPG6xcjC4MQVdVpl/kxEe/4XhE
	gDGSNstrUJiXA2V9avTlBo3dFu5WyqGWA9nuqjwXSdzpAxVydDjRGESRLQ+TlnepPR0Eg4q4/vR
	WRUNPxY7SrvblqJcgBfpfCMJJPy7x8T0Y26am7doDB5s7yeIkn4=
X-Received: by 2002:a05:6000:250a:b0:48a:f073:336b with SMTP id ffacd0b85a97d-48e6e2fcd88mr6043986f8f.23.1793375919216;
        Fri, 30 Oct 2026 08:58:39 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b789ecsm3862691f8f.29.2026.10.30.08.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:38 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:35 +0100
Subject: [PATCH 04/11] pinctrl: scmi: report an off setting as not set
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
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-4-52d92843ad97@baylibre.com>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
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

A get of a setting that is on or off, the flags and the pulls, returned
0 as a value, so every one of them showed as set on every pin. Return
-EINVAL when the platform answers 0, which is how pinconf reports a
setting that is not active.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 48 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index f74ef0952ba9..355ad26cb215 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -153,13 +153,41 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	return 0;
 }
 
-static u32 pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param,
-					    u32 value)
+static bool pinctrl_scmi_pinconf_inactive_flag(enum pin_config_param param,
+					       u32 value)
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
+	case PIN_CONFIG_INPUT_ENABLE:
+	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+	case PIN_CONFIG_OUTPUT_ENABLE:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static int pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param,
+					    u32 *value)
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
@@ -232,7 +260,10 @@ static int pinctrl_scmi_pinconf_get(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
-	config_value = pinctrl_scmi_map_pinconf_arg_get(config_type, config_value);
+	ret = pinctrl_scmi_map_pinconf_arg_get(config_type, &config_value);
+	if (ret)
+		return ret;
+
 	*config = pinconf_to_config_packed(config_type, config_value);
 
 	return 0;
@@ -390,7 +421,10 @@ static int pinctrl_scmi_pinconf_group_get(struct pinctrl_dev *pctldev,
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
2.56.0

