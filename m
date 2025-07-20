Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABE722424C
	for <arm-scmi@vger.kernel.org>; Sun, 20 Jul 2025 19:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753040344; cv=none; b=ON9svuJW0jVpAtd5TOTw8fw6Dmn76DujYcCujzsrO7B1nvUCjOWGQV3Wk0fbp8Whs48rwK/cmIAoYIOatfh4l2Ca2P3NECV3L40rgtw/TB61Eu9+B6uhd2SzxqAhGOExt251eYqYk+FoWz0ip4ELyCk/BjkMTN31rnttm7X7Kqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753040344; c=relaxed/simple;
	bh=9auUBQhB8O3iigsJ/KehzMZyztYeJf1B88SFG08/JSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u71TOVZ8KyZUNWYYqcjLMnLWJJKk+ccwgHgYuT3H/pihG4acLU7AnVRvHovOzkw5hb8VB/m8sE+gjvxTvc6gVFqWKAdfqw5qKWZz+BDfyNfpSVc/4/Cjf/nhZl9AZDoDx3Ne90velXvp3EWizBSwxFfasw9TkIUAoPz3oL2WBR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rq+X066Y; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rq+X066Y"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2e95f0b6cb7so1274945fac.3
        for <arm-scmi@vger.kernel.org>; Sun, 20 Jul 2025 12:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753040342; x=1753645142; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6uCGwy/uGkpfb0pvgcXUB8vgobgSJDaGpbJSvSenFqI=;
        b=rq+X066YPJYvj7caU6QoRh+ck4ryX4OBTUpKgnOv18omKOBrBoveEWtqW7OR1YHFjX
         yMNzJibFgVDjbmQCRT4RpaN+uH2+2qU/EpXLAg+NxdfFJeEAfnrRl7SaUgcsM6cV7+tv
         rwEZu/Vw5JWZt51u6lmnjOQjNydOHkHF1B2a9TJWP2OOWY6oioQQGvuryAN88KmeByKS
         6Ufu+JCjyuU5ajWVOVH+O5420L4Yd43zAdiqfpXObIPC9SSEkzcLzxVmXDweqwiyIfmz
         ABGZKDG69/eahe5HyIGgOwVX0I64tg9sH9a7olXVf1vtHVxlnD4jcaOrDmtUl4IecLVo
         HjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753040342; x=1753645142;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uCGwy/uGkpfb0pvgcXUB8vgobgSJDaGpbJSvSenFqI=;
        b=sC1rY/iyreXHw85Jqhxaj+XdX3Gh1TyAzKVgiNQrTkCmUK5BOWI5w+naViVed3bQfM
         Z7Xn0QVaBsc4692EYlap00VIO+yd1nGNfjYSNbt8JY15c5/YZahasTaDHdcDi2Tkv1tt
         uDTCdYYmNhK3pZWiP0y1dHXdrFMEsyfsSU7N6lmDfC5zvisM/gPVXGBhZVw2QlnUyRYt
         P++1JzzGkki5k+w9Z29K65z8rIYPzXa3mhJTLDxsQqfj382qFtUNknVn29KW4AXFylw1
         uPmNvURntDqxfCd8z+mg2vgseRuLdWYoCEYwHa8hlXeaCloB+DfOxRk3Tmx5aZCBjlgH
         nT8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW6pmwCiwaDHVTyfAUDkEXICXkjDrqCQchrLZL+MRRu3rX/I7SEGAJYvLh4ZKYV4YGcKZ72S/8cyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFQ6IBWcBALR+Yth5fOil/G/vhE2sQLlN123x+JeCPNlmkj7wM
	IyveODf8EFPIuuf+zJFtuKWDttdi9Xs5qQvIYWMu747/5cq1brUxi7HKrh0yk4WFB40=
X-Gm-Gg: ASbGncvMI0yKXYNDK1w3/dqxrRIEJOuBN5We3p5GpJN7i5hv1iGRZngWjPwo9/YCM6/
	TJb30kCiv6mOMSuH/+iUPB9qa52VbB9kOsQi+s3qfxbFibrgPZ3/6ki8GIPm0wcA69KtV2gon3X
	8thDHsgFtPIBWczj+QFz17lIhJQiMLX34BUMjChHhgubfnDpFezPF8A8YmPoxc2ODaejs2spNE5
	nz/yyvhl2LFLSwiMrZMM9pEwc2Bz0/FtAY1NfLq9XpuTkQDan+UejmaSNjFpiUV7SYbj00S6Cwt
	B1NVU96y2fT+KbST7nRioT+e3jy6iG6IuWvil33n5N68+yJGTIFEctgtTKgPSKBClZPYW6wXYMm
	tSs63UQmtRxc=
X-Google-Smtp-Source: AGHT+IH8XmyhhsiwXlgfzLZBUO70j3GY7Ll+3IavnthbKLQPwxSitZFNpac9MaQeewUcKGCyD5gWsw==
X-Received: by 2002:a05:6871:7383:b0:2d5:ba2d:80da with SMTP id 586e51a60fabf-2ffaf5c8720mr13188863fac.36.1753040342019;
        Sun, 20 Jul 2025 12:39:02 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::1fec])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-30103d1d804sm2810796fac.29.2025.07.20.12.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 12:39:01 -0700 (PDT)
Date: Sun, 20 Jul 2025 14:38:59 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Michal Simek <michal.simek@amd.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC v2 4/7] pinctrl-scmi: add PIN_CONFIG_INPUT_VALUE
Message-ID: <6f732f53-7e00-4f0d-82a3-480bc81497bd@sabinyo.mountain>
References: <cover.1753039612.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1753039612.git.dan.carpenter@linaro.org>

In SCMI the value of the pin is just another configuration option.  Add
this as an option in the pin_config_param enum and creating a mapping to
SCMI_PIN_INPUT_VALUE in pinctrl_scmi_map_pinconf_type()

Since this is an RFC patch, I'm going to comment that I think the SCMI
pinctrl driver misuses the PIN_CONFIG_OUTPUT enum.  It should be for
enabling and disabling output on pins which can serve as both input and
output.  Enabling it is supposed to write a 1 and disabling it is
supposed to write a 0 but we use that side effect to write 1s and 0s.  I
did't change this because it would break userspace but I'd like to add a
PIN_CONFIG_OUTPUT_VALUE enum as well and use that in the GPIO driver.
But in this patchset I just use PIN_CONFIG_OUTPUT.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/pinctrl-scmi.c          | 3 +++
 include/linux/pinctrl/pinconf-generic.h | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 383681041e4c..d1f2f971cd96 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -250,6 +250,9 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
 		*type = SCMI_PIN_INPUT_MODE;
 		break;
+	case PIN_CONFIG_INPUT_VALUE:
+		*type = SCMI_PIN_INPUT_VALUE;
+		break;
 	case PIN_CONFIG_MODE_LOW_POWER:
 		*type = SCMI_PIN_LOW_POWER_MODE;
 		break;
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index 1bcf071b860e..b37838171581 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -83,6 +83,8 @@ struct pinctrl_map;
  *      schmitt-trigger mode is disabled.
  * @PIN_CONFIG_INPUT_SCHMITT_UV: this will configure an input pin to run in
  *	schmitt-trigger mode. The argument is in uV.
+ * @PIN_CONFIG_INPUT_VALUE: This is used in SCMI to read the value from the
+ *	pin.
  * @PIN_CONFIG_MODE_LOW_POWER: this will configure the pin for low power
  *	operation, if several modes of operation are supported these can be
  *	passed in the argument on a custom form, else just use argument 1
@@ -135,6 +137,7 @@ enum pin_config_param {
 	PIN_CONFIG_INPUT_SCHMITT,
 	PIN_CONFIG_INPUT_SCHMITT_ENABLE,
 	PIN_CONFIG_INPUT_SCHMITT_UV,
+	PIN_CONFIG_INPUT_VALUE,
 	PIN_CONFIG_MODE_LOW_POWER,
 	PIN_CONFIG_MODE_PWM,
 	PIN_CONFIG_OUTPUT,
-- 
2.47.2

