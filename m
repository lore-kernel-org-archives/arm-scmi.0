Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABA82620DE
	for <arm-scmi@vger.kernel.org>; Sat, 21 Mar 2026 10:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774088018; cv=none; b=tIT6K7Jp+B1i1zHhEIDh/R9IPiwTY4p1UOpGrCp56p8S0JAsKrsRlMLAAaVW/jnzd/5EfRV6eSbdMEmTcTpB0PPz5DfFmgvRza2VySXUEAd5AtxYmzba3fR03N+kLro6E385++Yoy9umHdzmKTeDG8R1qynG44ADCHK+2WTvjvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774088018; c=relaxed/simple;
	bh=1uqFyv8sNbH4yrRykxbOsgxCTnxvIECLXyk/dbgpM28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mApSnBjiPm6BB3PVPbMlt1a4wJPc7ZjtBbzs7jqC09I2ERu5rbBYzq4rkKHRof/A8lQedoxnuTfD1nK5dDqCURJBoGRZt+a0pzvgQ0j+1wsH6gngft/MBp6ve7Nq1fl1HXKU043DsxB0z4leg2cIWEB+KvnObndtlU+tU8McXCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wJOEuiSS; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wJOEuiSS"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486b96760easo30123675e9.2
        for <arm-scmi@vger.kernel.org>; Sat, 21 Mar 2026 03:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774088016; x=1774692816; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KBfrdJJUZs1LM9q6ioHXhMJzsujMA5jyt7cbTuG7Xhg=;
        b=wJOEuiSSowi0Q7rGHF2IV5nTSoGDk2ru12R/y58eR6M90/bxDs45Ddj/xTuHZM3i1V
         LjFfz3MPP5up7iXE7GMv64gx3T0RaaenFq8wG9CD7uZ1CLjA/QV2lQnMprAj/SLgEhqY
         YsncC5z86CYktnl/6zOus2Dn66antTwjGc1hy4hI8AAQiayVVNOQseS3DjVnHCFQmYrg
         vfgXgxYXwNQnBN2b71PMgQCQgAgLhumfPKPBa5niTO6o9QKDSTO7LQ231vOWLEMITwFB
         a9FpjAso7jGSE1RLjGLSftVZ3UlrrexXO6flZz0vfMkp4xjE1mmSsRYQbQhRlQFlDpUx
         WUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774088016; x=1774692816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KBfrdJJUZs1LM9q6ioHXhMJzsujMA5jyt7cbTuG7Xhg=;
        b=grM+wdye4YIPB9UvZIKwaZEjgEk4M82DV+YTRz/Ywwmolgq3TNFPcljJ77f9pigpSp
         h/RV7tRPrXM2ysVxHnBCyxbTXFvNkglBqo8V0BF31/b/7SxjGAVXxAyZvv73HrbjvRdz
         d/iwhAaAXg4Uz+qBF2PHdgZ3zmkvj0Oysvluzq3eTGIB6mkH1wLU7GlDjl+oecC4K5cI
         mHT27Cn48c5dog6Kz0nHQg9bcWjMtDyaKlbRUvD1W6P7juk7xVkTUs/UalbN0XlY5Fxk
         KfJPeBqSrf4m10EhUWT/u+zhIb8ts4NcGsAyg/A64NJVQVItG1D5g+GNe6ZoNc/yG8jh
         DSiA==
X-Forwarded-Encrypted: i=1; AJvYcCUJmVRv+sLnwKEgVhom+eo/gK8MSY65CYsuJVwj0OeoENm+JQ5UtY5/LzhEOV4xwjLjXR1skxF1Dg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1QiGvjyXbJSKxmi6WX8mLFe1kACN02rIGL3OWKpMGjaaRdq8/
	sk4iYSKrtOk8KI07g1pzdW51Pn4ckzHu3SlPXjNxcoSY1SAxVfextvnPxKxsv3s2EWk=
X-Gm-Gg: ATEYQzyL3zTG/FKiOGDw5ikwTWt85t7FcVfslkiUULPtVDivBhqLNYLi2CfzvfbEByE
	sKe+APiaxW48wVnNYiQXwIktpzWlYCiKKAp2uU01l5F06xh4ump07JSCKutE8+o1DBiI7bRa27U
	BLtZnoZdDDVGeVRyaDRcRogNGTdE+SysFrl5qouLfO7SX0V9lg+aviiLX5Z1XYfSBwRHZMCsLyn
	M1l4s0j0SZ2Spg7Zc47Scl7DiFqu2a9BlHoE7Do2cyL7ZAI40Gd8tQI4JY++4RLE/VxGTH2NDN+
	2NND9zPNzvStX3LfUVzkIg0413dGgQ+KvuC9tzWiXh2hGDCcXvVVUMhFUkGUtGnach+3TILkdUC
	K/3nPY3UgCTKOQsAg+SjfxOkjPuSiHRNA5CPrFd2mEirSkxgc2RjRtI6IPbpjK6KbRFXtvSh5qU
	zS5AlOhGBId97pVMH0Wn4JtHGDGh6Pos1weNY0fvU=
X-Received: by 2002:a05:600c:c16e:b0:485:4eaf:eb53 with SMTP id 5b1f17b1804b1-486fee0f975mr77117095e9.19.1774088015816;
        Sat, 21 Mar 2026 03:13:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487004fee41sm47800325e9.3.2026.03.21.03.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 03:13:35 -0700 (PDT)
Date: Sat, 21 Mar 2026 13:13:32 +0300
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
Subject: [PATCH v5 2/7] pinctrl: scmi: Add SCMI_PIN_INPUT_VALUE
Message-ID: <b39ceff6729ebd79c9c5c774033947d146c56afb.1774087290.git.dan.carpenter@linaro.org>
References: <cover.1774087290.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1774087290.git.dan.carpenter@linaro.org>

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
2.51.0

