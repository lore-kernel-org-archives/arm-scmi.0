Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567962;
	b=m3QyLdiAViQoclD4rvcw9gKfF+UqLesbvmvAsx7nzlyYxgVNSR/3Jv0RDSAi7k3j4t+T
	 HqMxYHDsktZqFmdyxcUWtPxY2IAUOW4VPrrnPD1zkYeP6xDaheWy21t4E4gURL0qE7vf7
	 9LUE9Vu8R49DrLlujLNsjf4JMqfr/GMcXCYKWXmgxHZvT4YsdSEU95v/91vrE2kqy2S/Y
	 VmksMT9uLyNMcyZlHMDMfA/o4rgKLoTkdxB8A2LjUAiWM9+i45PS47c/rnIVnIq2hKGef
	 T4gDoBrfnqQiI++PtFlnzIiIPsD+9V2nXAdqa/HlbOB4IrvvbdGCLhFEnS7uj5EDclA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=DAyYccB2SWSa5VOhu+aKyrT2qwAelCLNdrL/lPHwb7k=;
	b=j8Jt8dy5ew5WlqhBVNASCXIcFDh55yBCsFBHVS+23U2mMTUAdd4bZBLzsRVMfPTD+/Wz
	 9mxDO+wLed3RcuGUB1ixaT80cz0z2evVai+Hnj7rNx1c7zjRJdlST2PesC+nDoKEgHcx2
	 G1gwzBJsJ0xQ6lIlOnH0C4ofo15nha9TBQJlA3mvvCOyhQv0l2XvqnU11p/CN2qw/w38h
	 /Cgy/Hwq8VEbFR8YEUOzDU9eeHQdWJBVf86Tp2KgrnBQaC5a9DqrvK0USPthGAMTCuSXy
	 XYvzeM9mVg58lPxNwcGfXt9b9BrZTt7ALR4g/mkoZoyxz5uXB0iXhhSIwpncOnxN5rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Q0stmUr8;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E7C60A2635
	for <arm-scmi@vger.kernel.org>; Fri, 13 Nov 2026 11:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55E7C60A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Q0stmUr8
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso245327f8f.2
        for <arm-scmi@vger.kernel.org>; Fri, 13 Nov 2026 03:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567961; x=1795172761; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DAyYccB2SWSa5VOhu+aKyrT2qwAelCLNdrL/lPHwb7k=;
        b=Q0stmUr8PTKJuq5N6R/dpqs3w1uJTNwjXaiy5/BcEIu+sR+HfsvNTbuyRo/2EHzqta
         2ec4y9eonNqLWjNScrUF3ERWWbomljVl2fttnevRBHqFgS4Ex5NwdRr5EkGb8QpJUBAe
         T9nZNf1N940LB6Pu2oApIkx1ICugTaYYuwPdlPd7yKYa/f8mbC9FuwwmimHQu6T5D/sa
         TvTaTJ5FifJIzFcWb3OsA9B+Q+Pz7iZYXvMCmJOmSx7KepQmmH0OVb06OBfgmIK8hw2O
         7ZZOS6k6OaJBQ16bzZ0DCNlylFgQ/gyzEkDxulSZAGSfKI/2IN/KMXhM0zUkejQdr0yB
         eAnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567961; x=1795172761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DAyYccB2SWSa5VOhu+aKyrT2qwAelCLNdrL/lPHwb7k=;
        b=EwWCSQhmDDPmJkGif3oF6IQXsPikMddWpxMs6EKbrPcj0CWSwYka/gP/yHh3hkcLsB
         uVbnxCk2zeHTgA7rL3O8NE8/7tA8YqtGKrc0Lnw5/IU/A9rdLV3AJhuWWp0rVsk8oKX/
         8+tz0jG5Icpdo8OgE80xwD5yHTO9NR1aX14eof4Idnkg9R8K63yo9hcIFm3T+voZccML
         GtGaApygpzV0yfiSkCm3NgP1v2awYLM8HrSMmNjzeaPPegXXjA7l+zNejBscFOLnf8eC
         +WFCmtoINPXwbED0KNn/6Bkj4WXGAqG9yjYgqmAIplMFc6lsinLs72VT9FTinoV/+vqR
         LeKg==
X-Gm-Message-State: APuU4Z/DVoI/KdAfdNeHt9AUcVeQOSssPT4ij3reDASL2G2mKcxc1lOr
	koKgzQqiZmIwYpL2UiTHXUO9QxGdiS54H+HKKjgpXWkLNCFZ03aPUZzidsvw4ePpHO4=
X-Gm-Gg: AYBFou2QzLYXyum6ansNS/4AbCHITqtErPD3SxwoiTY+5ey9obRDjMglMU4WQHlcY5S
	tOeLzmKZrkVcDkWBEsOsDnWRs1aLTFE0kslYaqkVC8PqQ4omH4c8S3JWPe0gmuRY8oL3yiHDKzw
	eh2LK0gmC4h5EftrFF6fQ6p6BxxKN8fyXdgxmdRm3CZT9At7Up9OQ1Wki9ehWrFEAuqEchrifuV
	4OQOKAuSX1QRNKjk7R53fOvL2hqD21WNe6qjebPWHiVmekMekaGIvvI4fyp6AD+6+F194E022uZ
	sHSzGDrXNqLo+nOgSCCsZn8+S6FfIuF4vjSNT2RtMSb1VVU7Ah7h228zjrQwWVlsSlIAp3qDQlK
	TASFdnQk64ENJMp0WKLv3J89YeRAgBW6UsqMNXiGL6xBd3Z/0II4Il9DTb/zqhcVtRtr3bzBSLB
	VdZ7uu5rKQr44eYtdGts5u9hR013NWp/QwJpKMTULw+Ip0f1G5X4PLkxBlt5d+7Vy+BYPuDXshX
	BhZujnaqHUNdMz9nK5dgZxZtniP9XKbmTmfzXexc5s+C7nFHHyt3Nq0M8SenrjuKsfZGKsUF6ht
	AnPks2RF+VcPEMgKynxnjseaVYWgFdIOQoc36VmjUC6xTGRFywg=
X-Received: by 2002:a05:6000:2909:b0:48e:66d0:664c with SMTP id ffacd0b85a97d-49c7316486bmr5048910f8f.15.1794567960637;
        Fri, 13 Nov 2026 03:06:00 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d22394esm4813292f8f.3.2026.11.13.03.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:06:00 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 13 Nov 2026 12:05:27 +0100
Subject: [PATCH v2 01/11] pinctrl: scmi: send the drive strength in
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
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-1-faccb4685d88@baylibre.com>
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

SCMI gives the drive strength in microamperes, but
PIN_CONFIG_DRIVE_STRENGTH is in milliamperes and was sent unchanged.
Convert it on set and on get. It is the only unit that differs: the
debounce is in microseconds and the pull resistances in ohms on both
sides, and every other value is a flag or implementation defined.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 43d5f3d54a8a..af33ddd4056b 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -14,6 +14,7 @@
 #include <linux/scmi_protocol.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/units.h>
 
 #include <linux/pinctrl/machine.h>
 #include <linux/pinctrl/pinconf.h>
@@ -155,6 +156,14 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	return 0;
 }
 
+static u32 pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param, u32 value)
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
@@ -167,13 +176,17 @@ static int pinctrl_scmi_map_pinconf_type_get(enum pin_config_param param,
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
 
@@ -203,6 +216,7 @@ static int pinctrl_scmi_pinconf_get(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
+	config_value = pinctrl_scmi_map_pinconf_arg_get(config_type, config_value);
 	*config = pinconf_to_config_packed(config_type, config_value);
 
 	return 0;
@@ -267,12 +281,13 @@ static int pinctrl_scmi_pinconf_set(struct pinctrl_dev *pctldev,
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
 
@@ -310,13 +325,13 @@ static int pinctrl_scmi_pinconf_group_set(struct pinctrl_dev *pctldev,
 
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
@@ -359,6 +374,7 @@ static int pinctrl_scmi_pinconf_group_get(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
+	config_value = pinctrl_scmi_map_pinconf_arg_get(config_type, config_value);
 	*config = pinconf_to_config_packed(config_type, config_value);
 
 	return 0;

-- 
2.56.1

