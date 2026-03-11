Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF8F31A07F
	for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 19:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773257904; cv=none; b=T5oZLyA7EsLE5zrXRQYCU+cUxTLywIxfQzjmedivjzA5RiuxX4mggDe6miBnOBjey0CAh/W01E/Mpb3VjW2FzaZEIN/0tHWRHjlAOMbAIzG5WLb1Lhxc9chs01sfx8OqZkyZY+OeoUuS42/rlFzyENzazRFC/MmONqxFJsvSrJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773257904; c=relaxed/simple;
	bh=jNLbaa/EdHOV24YnPDzn3wt5qXtVOjsJPr+S7zUA+TI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kFyKMiDTIjHwySH6Hic4kZ0PMZJ256wJqzeUdd1PuJeEcuxLO5qQt0KeaOk2jusYCQjhgTtnhjzGtEzqfR22I7fHshjWHmlTfb3FzV/zxtH2L+saA8iVBGc4bhcC4P6rPg+Mv/yzBKFegVWlhftZkEPAnQQyWzADpFlaFBHJtx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eAg4UdIA; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eAg4UdIA"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso2721495e9.0
        for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 12:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773257900; x=1773862700; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O5jKa1mhx8JE7wb9TTu7vy92JT5A3X2bElgi3jOUD4I=;
        b=eAg4UdIAJa9z/d11Pa7zVO9wdlPLstLSppd3cFqP7WDW7msRVgPXciDvGoEKv6TDaV
         qNRf+wO1CpbLrIZO91W74RQ1BvUqFiCK7duPMkNn7EYfvQrEC1ZL24e/fhm37tUuetsd
         KpkioWSKSFpPrI4KRlUI5L6CnPSdEpRGtGFiztIdrjnUw/+KqI88E4MLBjNAGnLrV9Rt
         /tQXkvYx+NVo4mD4IoltOP06AVkJlclrs/H/1ph270oSyi+AGBzcXa/hfV8q57UKrySV
         LXRUNg+sipW14TJs36v3DiSyAj94hT7MHUbQeYUdRWa0VZb1Os9LSX0nwVqQ4O0nzgGt
         9ZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257900; x=1773862700;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O5jKa1mhx8JE7wb9TTu7vy92JT5A3X2bElgi3jOUD4I=;
        b=BM4pSHUpBCeMZx7wEZU8njnGnfQWllaBTA2yTUcn7k2ZthNLSuHpWiElvaC9kFXMuz
         mo+C1+184gbdtp4QPbmGL0mZIukwxOAIClSSJkEJpq53exAgcPqLYEGM1/39j65wGB9o
         f29CDM8FAk3L5MOmI8h8/+1p3CoSCEMOfi5Pb/xfFAywn/8B0U+R+Ylr9B21fwHFLMTj
         DrBrbf2b0dAM07QyROIxK6CAbWDpyo3f2gfsnE+SK/G+VMTsOizPIYNP68GhFrhQQQze
         BDI7/JLJCDPK0o3hexP9oft8WyTGHhMLhcBgssIyzB/oEEtbdHk5yriCE19d2ddrQIlD
         bXkA==
X-Forwarded-Encrypted: i=1; AJvYcCXtgEUgLN5F8+vRugCbCfhlsCxtTCHc2tRD1n+XMVs8ddBfI+FNRc7QD7QnmRMkL5VTFCtIsGlgLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YytYsE1HvL4dyXNtAlIwGMLyIS6oK0EJGa2Wco/bxHT55GSWRFy
	4TUEzQsDbjo7MH7QWBod/z9U0Wjg0nZREZfjitdLEi4qKnaILEsGP+SzfjkDA8TL5t4=
X-Gm-Gg: ATEYQzz6XWGZ0kT/+eO2dg34g+p99SQKBbSDwOPVrzmM+GcrX5t15RnNaGyqWGmkMdY
	H/MbSHkT8K9V/Zdc2I30lL9ZbixScWbO9z/oiJIKaLfgDHfHMDT7Tt9aXNGFnqkwD6DVQI0KXtL
	6eH8p6GhonYAaF4YOI11p6+ME6ie6NUMgwLiU+vo+bI7LEQKq3I4XKnzmaBuwSDo8MFszl6bO63
	b52gJHXNNoV2num6TetsrGy4eOQMu9XLctBAeCn/UxmyZ6uxqHGXXWiES3sQKeFUdA/8JNPO91f
	YVJzZkrkNkVweii8HQJv8oWOoLRwEluObuHAGXVkFZWmHQJEMAdN13KLfaAuG8Y7BQqjquzkOpB
	MI68/gDeg598s10T3aC07OykkFwyJXRyMZd6XPzz0dqoXixDIT5JRPGKeMFyVi7knAXZRGKCtnr
	ZX/yXqUmkYncjs6RZz/yU5j3Q2FAes
X-Received: by 2002:a05:600c:608c:b0:485:34b3:8589 with SMTP id 5b1f17b1804b1-4854b136ae3mr63730725e9.31.1773257900308;
        Wed, 11 Mar 2026 12:38:20 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2187aasm1506034f8f.30.2026.03.11.12.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:38:19 -0700 (PDT)
Date: Wed, 11 Mar 2026 22:38:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 2/7] pinctrl: scmi: Add SCMI_PIN_INPUT_VALUE
Message-ID: <ce2b6b8f5b5432ac551720bad5776ef2ce490b68.1773150895.git.dan.carpenter@linaro.org>
References: <cover.1773150895.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1773150895.git.dan.carpenter@linaro.org>

The PIN_CONFIG_LEVEL parameter represents the value of the pin, whether
reading or writing to the pin.  In SCMI, the parameter is represented by
two different values SCMI_PIN_OUTPUT_VALUE for writing to a pin and
SCMI_PIN_INPUT_VALUE for reading.  The current code translates
PIN_CONFIG_LEVEL as SCMI_PIN_OUTPUT_VALUE (writing).

Add a function to translate it to either INPUT or OUTPUT depending on
whether it is called from a _get or _set() operation.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
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
2.51.0

