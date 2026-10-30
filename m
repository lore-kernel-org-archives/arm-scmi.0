Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375919;
	b=I5i4vZDBK9NzUQ2gxgtTFB8XKfOly5BnzGyHqjLqi6O6UnAij9xMbQ2ij3YA0IA/hGOZ
	 iNNvcF+Lb1nMREjm+I54aZpWlxuJSAW/QFKEs/M+j+PIHeIsZYHv3dF46n2P9Udkzra4L
	 xCFTzFXcaGDMhcnXNoHEG5AXWCuhQc6w4lsYhxbL1ybW0QTSQ2P8qmMOdYUaFbIbk0ABz
	 QkL9yELwnOYhwMZio0dE5/V4pHO+rRSyksyXHY6tBKW259JNxxgxPHYnw4GsYfyp2WJUy
	 9pskZfrYrVLHB3PAXiIVMk5pe5+UZ18V1lLEKR97AYk96KQa982MuXpocqdmIESLbVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=G0RjRTX/jH5mtYZPXYcgJHL1PDTWZ4mnU4uted4PjiE=;
	b=MwYxnGo3U6ROSG+kcPWJmJui9ta3Lc67PVbrIPjkunVzoK/HFwl2RR6Au898V82qhNnA
	 jO/EREjY9rKCsRJm1YEFsygpcjm61G8Qucs0P/M/gm0LL2U2g8vdvCHBBUDfOFp7Pc9nO
	 geRp6Gp/lhYROn10RG7MxRuYcwt5wE6skFKupNkBeo9VrF3Kvx6ww4rk+vixZRd8Qn/eo
	 Di7Crpl1A8a4Sdi/5LY9ENRbyJEPf+wR79kRjPltIJYKinOe7gr6UveBxqyKGaEzmq19g
	 IYAe1Dx6xV6BywObmbqL9s2pkxOph7lma46XDnmhJoEYYUys1+WHKcJT1A09ujx9RSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fbab5HK8;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674DD606A31F
	for <arm-scmi@vger.kernel.org>; Fri, 30 Oct 2026 15:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 674DD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fbab5HK8
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso6147555e9.1
        for <arm-scmi@vger.kernel.org>; Fri, 30 Oct 2026 08:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375917; x=1793980717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G0RjRTX/jH5mtYZPXYcgJHL1PDTWZ4mnU4uted4PjiE=;
        b=fbab5HK8y8wX1h6u51NvAWZytPsVMx/9Bp/G3NduLpiZtq22JP0dpsORhTBkWRBU1y
         fludwphpfzYzAo+EdGTm0Y8SixpuXyuGTQzCdyiO434bvBE0JeDgNoMUFlByuP8vyhh9
         g71q2T8jaQzpVnk7qpTPBa1lAkreue8/5kS19SSr9UlooAOF9fBK2V6SvGJHU+ekVv/b
         /DyWXQM8qoqcmizlD/wshtPqVOJGXkX9+qucfJJKB3Vjt7YIXwzw5HXk+IFvuTB5iPM0
         9CaDxpIyCXKeGFjLhX7pkOOVTvbT4Tnm35XNdQOsmiKJBn3vCgmiAQfTRn4PgRgMyra4
         PbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375917; x=1793980717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G0RjRTX/jH5mtYZPXYcgJHL1PDTWZ4mnU4uted4PjiE=;
        b=dkyf88cLA2ZLs/OgTtaoz/VenQK8Kb2kgxDxQ2gxaNrDKLU5InsIkdsTrhafJ2b+9o
         xWvXxQDCoVgL0Rxv0sCCCsBT2t8hcirSDdSHGrmKtdcfm+7c76p9I2I09RdKJ0GQ8+uv
         E6Yim2XOAtJwHCDd5C8YOOdFDYBOKsGXO6rtbVU+14wgzNGIkm3kFAzJAJhTU2Y7UM8k
         2hpI6dbfi3stEiKrETnmiVMo1PnXE0VVjy3bg74P8d+4Gj5HtAUfOSAyI9Ro0m3k9K2S
         NgPVOGCZFCAJLrNCOd+dKD9tvtIeG97m2qAOZRt+y7daO733Lqz1u8HGXLpD+i55OqsX
         5s6w==
X-Gm-Message-State: AFq9FYL+EGehA3bCcWeDg73yuNgPw0wSHlOkKmUbjsphSBytxDCqDieU
	3NeHknoLYdYoq7/xD1gQ3wvAsreO5nZhIbqlqK+ffsl8v4MCMmxUNZuMEJr84zxFKFo=
X-Gm-Gg: AYBFou3bZZNWJmo22zhTQS1hnURCvZlaitudOQc7khUWevayQr9Jhub/4h7/YD7J3TF
	Tfju79SMLuvcg2Yx/pGsKMc9S6PDsy/9wNiS24QkjQQ6R1+oqF9Gqlf8R2XFznUjfKrzkggDdWW
	sFqsBhHVuQZP7VARko7WQFEf00QHlMCdWC8u0+3xdCTxRh0ucRwTlSWSw3l+Pr1IqAfJtxsH2Ai
	XcWWcZ4XVfM34QDg5mu01Tt9bas2MZCZjttiAaJzwtZAnrsljeuJzzxR/U8c3bt2N18et5+1jzX
	awn8cjv3c9qgq6OinS5wkbNt8ADHNgI4EB2yxrddwV0TinBh8mgtd9sgyZYqbcjmxBDXm/hGJ2+
	p0guxQcBHJ1ctjPetW7GLlvIZsTPwawzCh0fuX7543OH6FekPJl2NRgPo2IBb6Lb7BwdqPgT/8c
	kkg3R3KTLMv0VrkifmjqBA6guBs3LzwPOsO4IgYFutXMsLU/TgwQHQ/5oPW5NMof/7osroFPOcJ
	Frgx/63nZ1kmuEgLA0XCLARlQoRPY4dhgNrg/H/uM47Shix5PiPZpBbbaLTVxwAp82mdPEgXGdG
	iMN7iWqOhD9f/sJ7Ca/NZYgkMhvBUZwKAWjWPaoO+kHy1yyg8J4=
X-Received: by 2002:a05:600c:811a:b0:4a1:d10c:7170 with SMTP id 5b1f17b1804b1-4ac1889d884mr57318135e9.31.1793375916707;
        Fri, 30 Oct 2026 08:58:36 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b286a0sm57000225e9.4.2026.10.30.08.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:36 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:32 +0100
Subject: [PATCH 01/11] pinctrl: scmi: send the drive strength in
 microamperes
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
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-1-52d92843ad97@baylibre.com>
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

SCMI gives the drive strength in microamperes, but
PIN_CONFIG_DRIVE_STRENGTH is in milliamperes and was sent unchanged.
Convert it on set and on get. It is the only unit that differs: the
debounce is in microseconds and the pull resistances in ohms on both
sides, and every other value is a flag or implementation defined.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index c93d61dfa282..6bc94c68e89a 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -14,6 +14,7 @@
 #include <linux/scmi_protocol.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/units.h>
 
 #include <linux/pinctrl/machine.h>
 #include <linux/pinctrl/pinconf.h>
@@ -155,6 +156,15 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	return 0;
 }
 
+static u32 pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param,
+					    u32 value)
+{
+	if (param == PIN_CONFIG_DRIVE_STRENGTH)
+		return value / MILLI;
+
+	return value;
+}
+
 static int pinctrl_scmi_map_pinconf_type_get(enum pin_config_param param,
 					     enum scmi_pinctrl_conf_type *type)
 {
@@ -167,13 +177,17 @@ static int pinctrl_scmi_map_pinconf_type_get(enum pin_config_param param,
 }
 
 static int pinctrl_scmi_map_pinconf_type_set(enum pin_config_param param,
-					     enum scmi_pinctrl_conf_type *type)
+					     enum scmi_pinctrl_conf_type *type,
+					     u32 *arg)
 {
 	if (param == PIN_CONFIG_LEVEL) {
 		*type = SCMI_PIN_OUTPUT_VALUE;
 		return 0;
 	}
 
+	if (param == PIN_CONFIG_DRIVE_STRENGTH)
+		*arg *= MILLI;
+
 	return pinctrl_scmi_map_pinconf_type(param, type);
 }
 
@@ -203,6 +217,7 @@ static int pinctrl_scmi_pinconf_get(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
+	config_value = pinctrl_scmi_map_pinconf_arg_get(config_type, config_value);
 	*config = pinconf_to_config_packed(config_type, config_value);
 
 	return 0;
@@ -267,12 +282,13 @@ static int pinctrl_scmi_pinconf_set(struct pinctrl_dev *pctldev,
 		param = pinconf_to_config_param(configs[i]);
 		if (param == PIN_CONFIG_PERSIST_STATE)
 			continue;
-		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[cnt]);
+		p_config_value[cnt] = pinconf_to_config_argument(configs[i]);
+		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[cnt],
+							&p_config_value[cnt]);
 		if (ret) {
 			dev_err(pmx->dev, "Error map pinconf_type %d\n", ret);
 			goto free_config;
 		}
-		p_config_value[cnt] = pinconf_to_config_argument(configs[i]);
 		cnt++;
 	}
 
@@ -310,13 +326,13 @@ static int pinctrl_scmi_pinconf_group_set(struct pinctrl_dev *pctldev,
 
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
-		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[i]);
+		p_config_value[i] = pinconf_to_config_argument(configs[i]);
+		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[i],
+							&p_config_value[i]);
 		if (ret) {
 			dev_err(pmx->dev, "Error map pinconf_type %d\n", ret);
 			goto free_config;
 		}
-
-		p_config_value[i] = pinconf_to_config_argument(configs[i]);
 	}
 
 	ret = pinctrl_ops->settings_conf(pmx->ph, group, GROUP_TYPE,
@@ -359,6 +375,7 @@ static int pinctrl_scmi_pinconf_group_get(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
+	config_value = pinctrl_scmi_map_pinconf_arg_get(config_type, config_value);
 	*config = pinconf_to_config_packed(config_type, config_value);
 
 	return 0;

-- 
2.56.0

