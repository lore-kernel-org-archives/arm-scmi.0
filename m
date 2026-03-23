Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F397314B62
	for <arm-scmi@vger.kernel.org>; Mon, 23 Mar 2026 19:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774292482; cv=none; b=LmDeaabBYUg7xPYzeokZ1RvOyAUhcucOlsrmY0uHI+QIgncasRMWAGNXzcsBgQt8TBa/AwMnQ+dUIWfiE8UzFxE4xgxKUvxLpUoFJfFQvAKFIoRjbkJBTr2ayeNYA+ugd2dfkTDUG+rN04YiAvaEx1xiCzWTZr7W8SsRiP0d/C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774292482; c=relaxed/simple;
	bh=9ndQcMnASHDbDGInbvhNloK+6vYvAxVufHQrRaTqfBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/5rxDjCWCUCy3fy8VB8IdxLuygJTvoh7hxb05A1OD6qdQxcAyALv+f89xblJIgt45WuQeSvuzLN3Hqety0z0LhxDrLpNoCOXw34iAl56MKnTgjpZU/wO2xykURZ7GZvZfn/bzyawUvqeNBSX81Y/FQD8IzRSX7FJ+3Qtb8SU+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lfaTK2Lk; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lfaTK2Lk"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43b4915161fso3089507f8f.2
        for <arm-scmi@vger.kernel.org>; Mon, 23 Mar 2026 12:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774292480; x=1774897280; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cYNDUizmJ/rKIkz2DY5qa0t62hb9uVCR9S4PHSBe3sY=;
        b=lfaTK2LkXzYhLRsZbF2zfeQEHweoJBNUrcrF6XswHplYxJvc1x1kegGN3P/7U7AW3K
         NGlVFGjTaFHUReqAv4s6PSYKqx2WVAR0cM1Jc/1BZa1qM9OLFbuXRZMYF+4m74QvMX36
         0z3hn4aPY+2C537MufwQg4eSJy8h+3gDeSPcl2kPGgkgqVAODD9htDBNTbf3Fr884I+N
         ttC08fyUjUM/Gm0/8bqOSauVUohP6ATr3Phw8Wwgq595I1Sgbak57LlbQMA0INgcDtzI
         Bbl0xaCbrp7amKEMSoPv6gaf+9dSxKQ7F/zQ6QmUS80pJnnCNTwgh4icvRbAErZU/BNz
         s6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774292480; x=1774897280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYNDUizmJ/rKIkz2DY5qa0t62hb9uVCR9S4PHSBe3sY=;
        b=I8ZEK2VBx11mOUNOU7Ln/oApGI+CP67XOlfna7Iq8kd2wW4sQs7ZsV5Yh8h34VBX+i
         OsEOAt7OR7gRSbwjmDebQWF5071qFOO0YMUNzG85b/KhwcOI9oGAgz7nm9KHgiknF3MV
         yzLXfEe0qRshqeN3vWQrx5Xi96lyUkte9NvNoWDo+Pa8jwaQ6RDjzG2ORr5+keytYW5Q
         0/VY6hyCSENPXH/HW9keHubyIkbpMjaXj6n2JDtizbkrydpBTYqbLcFYgUnyyXgJ55y0
         otnmOTwwL4+Dc9WoG2wUpidYPc+9uSxkUhwL5CR5RUEZcqs2FSe9RiAOVgSo3fwN8/Aw
         7OUw==
X-Forwarded-Encrypted: i=1; AJvYcCXVgab0bHoKBt7DHnXqkLVGk2uss17AAESy6GDvlVIAyNr1LmaCzaKiwCfj1mseh1CwEleMlDQmxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdhRmGiVu3lg0T3PjnjlxAbCczVRoL8D74q2P8Q+HCqLvySUpn
	ezoU5FMEbd9i5C5/Xwsp4Si2OTfa97y7amOhgtGtUDa1g3hT7cUaLDDvU+KSxmQtPKM=
X-Gm-Gg: ATEYQzw93AtCMHJ7sAA4FNgFS32hY4dxYVA4qIC8GFgQZRgJDQh0AeGgLzuI/+9mG0R
	ZZZbhS3bSXVZAS9iJv9wM2ZEVkBR7E3ky7FrP0Nr36Orh+ZWSQM+AXhd1KLS/uHqlbTWKvwKlls
	o/wl3ZBqQU9B1xfmCc2S4PeKhHK1r46jvM0xw7VeYAuqklfdpZ4jnUgATCGkguWozFkN94QJyAX
	crosVTmIuuVYrgp+EMbukI+KJH7sumVd+2k8ir2xEhnRkkmDKsRX9NQch8aenXktB4SWgQsZeUk
	xn1y6oLaP3v2BetoDV9eytFtnZWUES9X6HwCFy/SVNY3Bi2bE6Rysw/5GP7dZXaCg+XWWAR+Y9Q
	/nRbRvm4pRXAYwuDN5q9NtWb67ihH6y2SKpc6fVZVtbiQcadEt/z8mlf35gGVTEaONx5GPgLvQs
	S0Ei5DcGSMsIdgFTtOO5PZexQ342ir
X-Received: by 2002:a05:6000:4382:b0:43b:5192:894b with SMTP id ffacd0b85a97d-43b642426afmr20898486f8f.23.1774292479509;
        Mon, 23 Mar 2026 12:01:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae16fsm32522970f8f.8.2026.03.23.12.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:01:19 -0700 (PDT)
Date: Mon, 23 Mar 2026 22:01:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v6 2/7] pinctrl: scmi: Add SCMI_PIN_INPUT_VALUE
Message-ID: <cf3f9e6f296ebe3828741b42dad9e511e51c5cc1.1774283146.git.dan.carpenter@linaro.org>
References: <cover.1774283146.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1774283146.git.dan.carpenter@linaro.org>

The PIN_CONFIG_LEVEL parameter represents the value of the pin, whether
reading or writing to the pin.  In SCMI, the parameter is represented by
two different values SCMI_PIN_OUTPUT_VALUE for writing to a pin and
SCMI_PIN_INPUT_VALUE for reading.  The current code translates
PIN_CONFIG_LEVEL as SCMI_PIN_OUTPUT_VALUE (writing).

Add a function to translate it to either INPUT or OUTPUT depending on
whether it is called from a _get or _set() operation.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Acked-by: Sudeep Holla <sudeep.holla@kernel.org>
---
v5: no change
v4: add r-b tags
v3: new patch

 drivers/pinctrl/pinctrl-scmi.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index f4f296e07be5..5d347e6b2e4c 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -251,9 +251,6 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	case PIN_CONFIG_MODE_LOW_POWER:
 		*type = SCMI_PIN_LOW_POWER_MODE;
 		break;
-	case PIN_CONFIG_LEVEL:
-		*type = SCMI_PIN_OUTPUT_VALUE;
-		break;
 	case PIN_CONFIG_OUTPUT_ENABLE:
 		*type = SCMI_PIN_OUTPUT_MODE;
 		break;
@@ -276,6 +273,28 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	return 0;
 }
 
+static int pinctrl_scmi_map_pinconf_type_get(enum pin_config_param param,
+					     enum scmi_pinctrl_conf_type *type)
+{
+	if (param == PIN_CONFIG_LEVEL) {
+		*type = SCMI_PIN_INPUT_VALUE;
+		return 0;
+	}
+
+	return pinctrl_scmi_map_pinconf_type(param, type);
+}
+
+static int pinctrl_scmi_map_pinconf_type_set(enum pin_config_param param,
+					     enum scmi_pinctrl_conf_type *type)
+{
+	if (param == PIN_CONFIG_LEVEL) {
+		*type = SCMI_PIN_OUTPUT_VALUE;
+		return 0;
+	}
+
+	return pinctrl_scmi_map_pinconf_type(param, type);
+}
+
 static int pinctrl_scmi_pinconf_get(struct pinctrl_dev *pctldev,
 				    unsigned int pin, unsigned long *config)
 {
@@ -290,7 +309,7 @@ static int pinctrl_scmi_pinconf_get(struct pinctrl_dev *pctldev,
 
 	config_type = pinconf_to_config_param(*config);
 
-	ret = pinctrl_scmi_map_pinconf_type(config_type, &type);
+	ret = pinctrl_scmi_map_pinconf_type_get(config_type, &type);
 	if (ret)
 		return ret;
 
@@ -363,7 +382,7 @@ static int pinctrl_scmi_pinconf_set(struct pinctrl_dev *pctldev,
 
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
-		ret = pinctrl_scmi_map_pinconf_type(param, &p_config_type[i]);
+		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[i]);
 		if (ret) {
 			dev_err(pmx->dev, "Error map pinconf_type %d\n", ret);
 			goto free_config;
@@ -405,7 +424,7 @@ static int pinctrl_scmi_pinconf_group_set(struct pinctrl_dev *pctldev,
 
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
-		ret = pinctrl_scmi_map_pinconf_type(param, &p_config_type[i]);
+		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[i]);
 		if (ret) {
 			dev_err(pmx->dev, "Error map pinconf_type %d\n", ret);
 			goto free_config;
@@ -440,7 +459,7 @@ static int pinctrl_scmi_pinconf_group_get(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	config_type = pinconf_to_config_param(*config);
-	ret = pinctrl_scmi_map_pinconf_type(config_type, &type);
+	ret = pinctrl_scmi_map_pinconf_type_get(config_type, &type);
 	if (ret) {
 		dev_err(pmx->dev, "Error map pinconf_type %d\n", ret);
 		return ret;
-- 
2.53.0

