Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBAC344DAA
	for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 19:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773257942; cv=none; b=RBiGvLzaVM8RM6w2IuntPi1tKfjwGGSJZASi6Q/88zynYjGKeQhnuAUWK4SD1VHyoEV+m8vVfQ8fPe2MYKt/cGoS9GwEr6HWXu0IHlTr/4/ynLMwjJ9LVsDhVhCxi2pW3jzFQF15+FAMUf4zoBDoPx/4vbq4lnLcact0PixHxLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773257942; c=relaxed/simple;
	bh=+lx0NoL+4Abj33jCYoRiMh0L0i+BewAAr0Ejn6Jvz6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Znm6CNQ5Dw49nY1hlDhDmKxdplRkvocGudhvHkFOoucDHWkb7H7LQT+j56F3MsbWC+kdSsrJnbaDHTAZgaVyXR+QpSWznnYeDkCE1DjTYFyQtyv3HxHMEUN2zBMugYlUerTSXK2oKFhO0oJzMBzjg50ZBjdgEFMJp6jYLKltZL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I4DQ0t1g; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I4DQ0t1g"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48529c325f0so1644415e9.0
        for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 12:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773257937; x=1773862737; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9CaxwIwvIcGgO9P9X/34fCDqJsPmK1yqw1P6zBQb93s=;
        b=I4DQ0t1gjw74QWOjRWbXCHxIpofvDn58dJJ7T9l4XdfPLxRPDqCidsU1vdOz48PqGr
         3rSV69O5pHr4a8pj/1Rpqp7xT1RAKwD/Nk4Uf9wU/JHR2JfRZTc5oOQbGawgSNNgrKbl
         ed0BghKgeHIDG3VV/qvi7RNBkHa3NYODAzopthxqe4jRaAOGcCWTT07wCdBqkN/mKTNy
         8g4rGraz1bCVNx+/zKT/XBsjoq6dO7GYP3I54cmtN2s3rKVjiZC15P9gKfI9aiOoCavF
         qnMgNLqjJ1K06UD9j6aFTkJPVVNirgQgRfzDzTjWbTGtHViaS2joH5DBhlJNQms+Y1J0
         QMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257937; x=1773862737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9CaxwIwvIcGgO9P9X/34fCDqJsPmK1yqw1P6zBQb93s=;
        b=bNz/w/62s3yYYcfPWqAWKl8HEXXcA69oAellV5fJhkW57Bx5ESGqB3cT8kceuFLpez
         RfqsOjfAJhAkYmCDl878vRo6gwvHlQVm8UDbnWW0xWvK0NdzEBZNA0Wks4xQXlqJ9cJT
         U/jkL5zL26ARGGTO7mczJ1vJp2so+4KbV1v5GnX4SL96Jf/7QHmEkcAqVxrpnpgdu1H5
         QIoMBG0x96NYoQDZUBVz7IDTmHa3Q5Q+f1d9fF/Rk8PrHsJXnRt/ylX99RHnz7eVG3Rr
         X+UJ11wjLVKMUQlL4pJwhm7tssT2n/p0Hv+IFeXBIiZSu19IP8lgmEI4lVGNMXqioKYT
         8hmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlXu4PMATprSoFew83Y7X3FcvWvj78Q60Hi23h91qUw0o/gJjzFYxbVNXrOTvxKUIk9Xdsw4TedQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKAJwK/lCnLhRkQuiDc67UoQT4tktX4+HtfxuyAa01MplFYVup
	C+gGOmoPrZDw5mhwGCoyYKlz4JFRhMhsWPBnsk6DA4elb1sNAzUxtuHHFmQuMF8Ny64=
X-Gm-Gg: ATEYQzxyRaG1cmH5yeCmQOERLUCupdIjTnLSx4exopW9q9oc59Ps+S2MgDQP2qJWt3n
	OMBleeVi8WCx/vLjGiODgFNCp1JJJiUZV4ReNqBxfjzS6L+WVvmyij33a4D28SNwn/0c+XMle4J
	nz1K5S91/MR85zlWw8LmtyHTfR5uoxn5hbHJxB8AMwR90m1W8PyPu4LMgyS1Yn4CHtZ0gXDSoXM
	ME5t1fddwBnAx3w7eynYvP4cCfu0YpvFcXkqRPoJVFEreSiRaqUBlq5kdBp/nUvwlPTjIPLPz37
	cC5/hSX6JldGZLPmWolAG9m6v880YoQCNSWFme+j+VfSjSJZAprTLS8UC+uh19B5tkRjdIghnxw
	2xnutGK0KlVcyuqMY9epF+m/S4KoNRVIQBmpHLe1+55BYwkGO5UpH4vGV08g21QOb87Bqe70hUQ
	KVALpBOumhz3QboG16NQwaq106EGXYVf4W4sDAiqI=
X-Received: by 2002:a05:600c:c4b7:b0:485:304a:58cd with SMTP id 5b1f17b1804b1-4854b0a4a4cmr64000115e9.4.1773257937205;
        Wed, 11 Mar 2026 12:38:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20c473sm1460894f8f.24.2026.03.11.12.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:38:56 -0700 (PDT)
Date: Wed, 11 Mar 2026 22:38:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 4/7] pinctrl-scmi: ignore PIN_CONFIG_PERSIST_STATE
Message-ID: <b24c7b023c84ec14cfa7e49352e834262e3fefb5.1773150895.git.dan.carpenter@linaro.org>
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

The PIN_CONFIG_PERSIST_STATE setting ensures that the pin state persists
across a sleep or controller reset.  The SCMI spec does not have an
equivalent command to this so just ignore it.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/pinctrl-scmi.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index de8c113bc61d..f22be6b7b82a 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -361,7 +361,7 @@ static int pinctrl_scmi_pinconf_set(struct pinctrl_dev *pctldev,
 				    unsigned long *configs,
 				    unsigned int num_configs)
 {
-	int i, ret;
+	int i, cnt, ret;
 	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
 	enum scmi_pinctrl_conf_type config_type[SCMI_NUM_CONFIGS];
 	u32 config_value[SCMI_NUM_CONFIGS];
@@ -377,17 +377,21 @@ static int pinctrl_scmi_pinconf_set(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
+	cnt = 0;
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
-		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[i]);
+		if (param == PIN_CONFIG_PERSIST_STATE)
+			continue;
+		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[cnt]);
 		if (ret) {
 			dev_err(pmx->dev, "Error map pinconf_type %d\n", ret);
 			goto free_config;
 		}
-		p_config_value[i] = pinconf_to_config_argument(configs[i]);
+		p_config_value[cnt] = pinconf_to_config_argument(configs[i]);
+		cnt++;
 	}
 
-	ret = pinctrl_ops->settings_conf(pmx->ph, pin, PIN_TYPE, num_configs,
+	ret = pinctrl_ops->settings_conf(pmx->ph, pin, PIN_TYPE, cnt,
 					 p_config_type,  p_config_value);
 	if (ret)
 		dev_err(pmx->dev, "Error parsing config %d\n", ret);
-- 
2.51.0

