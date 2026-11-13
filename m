Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567966;
	b=QzIoqxU21Auq9YdKkKxQYqnwR/NkipjtPm+HCXz3RNAYx+5RU8U7LSaTfxvDCDQfKEwE
	 N07FOZZsHFf0Cfn5mDt0zDiN3N6RncwJTucCucbhio7BsnKG5XuUwCUo7iNnCsnqVpU4k
	 c3aTEzz0mjVjHUcYwW3gW2xXQO18d5U3LDHFAbmglWtye3UHoSDkKJfdKMS1nGkN18uZy
	 Y9GI9z2au4Ug1u8Uk23ANC/jtSiiZGmyKGxjr8w+O/2Xh9orrggDCXfrEJ2TAyicLY7jF
	 jPl7le/k9zgqm4Fz1QrFwxJ2TFhKqdx6OqocPno4X9t1tFtYz5pcKGIXIdyizqX6DDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=eOLY3dlbAwNdoJXtv7cVJ37SerT+IG/dv7/ALlwvJrA=;
	b=uR+W/cg2ajE/kSAQ/GpfltWwIstYnDfeCC9AGMFpMdcwgkRTIdUXa+f6/NSWKmgADSPS
	 Y0G2FUC7KS771Mm1Eg6H8Dz1+37yJA2JrZY2E+ckYAFhRR+e/O7/I1kqlkx14ntZN9RjN
	 0fj+ygiLUQ9789N7NV7iCdM29ovdDqoRSdeCMtkweq9hQL5jLDyC8qw+wRiy2b5Xx9/Na
	 UDpcTVNZ/5YHtnCsRu0gYWg9i3uiGY0iCpgiMnHVJYCmQyFS9o0d8XrI/RIkNkD+dJ/Iw
	 xYmGsIEXMNsUSsHFWHmsxfTyUEN7W/3DUOPjeqCgWEuVg7q2Mn0OZtmu/Q5aBg0/3YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Dax6wfLM;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261CB606A331
	for <arm-scmi@vger.kernel.org>; Fri, 13 Nov 2026 11:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 261CB606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Dax6wfLM
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso249408f8f.1
        for <arm-scmi@vger.kernel.org>; Fri, 13 Nov 2026 03:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567964; x=1795172764; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eOLY3dlbAwNdoJXtv7cVJ37SerT+IG/dv7/ALlwvJrA=;
        b=Dax6wfLM43BtWlBdA6TmhsSZHQD43usQ1eUz09r4SYV6X3cTpfuKNpnJowxd2Nnc6x
         V8Vl+p/fK6O6Ja2lE4QPI3zSJ9Z2P8scxjQJVGGBz5QMivQRbmgkoU4fOXAgZ9y4IFNT
         VlqRr+XSHoTIKClYnW0Hd8qVnABWREGfUg/WQry2O4Sqts8w2o1R5i/O5Gp4SlH1xdGb
         6/dLbwYHjzImuQxRH30LhVOSdtgDv9mzb4+J87mGoMrqQ8jRDtnuP22rnViecaYCXO9w
         yynsN0S9BsSgM1cuU/lrCjKVT1TUvCYl4pbQTgtm5cH+Jmr0mKwpi2nfq9qKbb0mObJ4
         t0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567964; x=1795172764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eOLY3dlbAwNdoJXtv7cVJ37SerT+IG/dv7/ALlwvJrA=;
        b=by1Cym2IkDTy5qm1c/4tyBEhgvd7SeqNuUvUorbFPm3xNo3YnSwI19qKQuo6nYQ3I3
         8vjIPUCFuuVTanSOVew928TbodFbGlDkxK/doEdWK1K5EjVn84ORt0QXvTowoEk7SR7k
         Efv6uxW9Tm+FyyUuNuXFFTcMxkxlMkJCaWeuFMMMP2oMp5RMYl87t5zMidgXaDOOS2y2
         51Y1gdw3RGrH0XSs9RwKCRcT4hOdXpygHw/lbRvQOeL4cmC2jrQixfK/94xqDcB4fcxn
         yzDLD7FE3nzvw19LrLHXtQwXJK1kmPAXqgdp6+rjb+z7Qa9oACQlvVwyoa0CPwPeuU8v
         xiNg==
X-Gm-Message-State: APuU4Z/0cCB9AaT40w4GmG1ZWSiicQBAUdcpkLr+DAAQKY1EtDy6jQEM
	lf5A2XPOD+nzWhnZyd3aEssHIvQzTYXKy24uml5p1TKCvoXFM2ZSApGxGSCe6IsejyQ=
X-Gm-Gg: AYBFou0+WmzmUASX5MJNU5grO6Q/gFCYyL131UeaeFn0rhkMCI044O8XH8hikXKD7IM
	BHGaV0Rz3BT0PvjTjRPbG3dN2G8RPiC2z/HU5XPeqafvu6g0Ytr4UEWFnH421ZnjcN/uhFJzC5t
	1/9wMmZhDAIy2hzEezuDbnLj7gW/kbhJeTdwtL9Gzby8SLkV3By9G/E6rSU09TP6tE8CgAURYCb
	IaxbH7WWMyaNJ0v0HKa26Ao8pk6SuYryJKGOiWvaFzEElJiuUnbUB6nqxX424JUnxxQbN0KZGyB
	8Wzy6LbYIOXIfk9Hd9dHkQlEwdicc1t1fB2x8qATf76KDsiHNZWHIJm50yGT9B/9jSXiaJ6IdwB
	332MwMp2cTVHHTbS81xxm2qkWups9dtfAn9uwFi5XuMIVIx8yKno+c9x3gbfIQ9dJWNIQUDgB0H
	52OiV9OEVpzLQmChbwKSfBxv/vscKV3cZoc0XaLbo2kcTKIVGhRVe+n5AUu9kadgHuTP5Noc1/P
	tVLrKLk3zTcCi42kziawJDI3oJjhhep4dfm0IEv5KAkhArdFL3iDOA6UABw6cGXWIEQYOrWSMXO
	ZM3JhtEHI6m1AXsBv++1wwA2Z5qzLb/7HV6D
X-Received: by 2002:a05:6000:2c03:b0:48d:f4ea:49c9 with SMTP id ffacd0b85a97d-49c73ecf935mr5406877f8f.54.1794567964456;
        Fri, 13 Nov 2026 03:06:04 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c0e0dsm4600274f8f.15.2026.11.13.03.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:06:04 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 13 Nov 2026 12:05:30 +0100
Subject: [PATCH v2 04/11] pinctrl: scmi: report an off setting as not set
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
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-4-faccb4685d88@baylibre.com>
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
 drivers/pinctrl/pinctrl-scmi.c | 42 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 36 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 221dd8d30009..b088a24e4ec0 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -153,12 +153,36 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	return 0;
 }
 
-static u32 pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param, u32 value)
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
@@ -231,7 +255,10 @@ static int pinctrl_scmi_pinconf_get(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
-	config_value = pinctrl_scmi_map_pinconf_arg_get(config_type, config_value);
+	ret = pinctrl_scmi_map_pinconf_arg_get(config_type, &config_value);
+	if (ret)
+		return ret;
+
 	*config = pinconf_to_config_packed(config_type, config_value);
 
 	return 0;
@@ -389,7 +416,10 @@ static int pinctrl_scmi_pinconf_group_get(struct pinctrl_dev *pctldev,
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

