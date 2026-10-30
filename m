Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375926;
	b=M4qD7+cg/I2/kgllLjzBE5LsDLfBQIPeaNEGtVltUPgjtz/7HdHIzAbbXNx3zp3yCRsC
	 zpUsFuDXLXgLfncL5qkUPmrHdHXvCbWAhAb4STE/kxTRnIknEfpaaY48O9+YPVFgDdm4v
	 uQpvnJQJBjOMyUsUCA43O5eYm3p2RSoIL7gG2oND6yLCxkmHYRwnN60HNnWS7RkhIv0Ug
	 0CbVQSWUwI7/j/sgKF14ekHowBYM8D2azxx+YS5AFgBWFZ98e+Ogl0VIcheewgjccse2w
	 N54yqv7pjq8ujhd4Ve1df6a93nuem0EtSFQtzm76u9NbCD2ch43kzz/RLD9coaJqy1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=j7BatgHj5ITP9IvPD8k1iBj2N7wXMOFQgCoh9MUEa7E=;
	b=unc2fYJWj0PcdKihSf3fRYd2Vtj432gLYtwcLSHT97lKojhPPFMqCccCFrNcxTyuI8M/
	 Q08Z94HAZrjRLmOOMFZVFsDvG843xJXGTd0IWL4I1rUHloSbhjJSR5T+4aAo3sshyYzzT
	 gD624NGViGXg0GUJK/MnsR6FdmYM9//mjBcFVS9IEOywwIYMuih3Wvh4OicMIZqC587tW
	 Y45Ud4Z+KHSNGeHkK8EmR38L1XfI9lZV2ycRwnKp7sWQAbYHIa/I8HCYP876Hp/fVEgyl
	 B3xRR/0ukaHFU3+GZxGhrdSbNON4FzVBka9FdifUepz2Q6IpqRu7nKgCg31gmQE9HHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RvKXdaZt;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D47C60A2614
	for <arm-scmi@vger.kernel.org>; Fri, 30 Oct 2026 15:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D47C60A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RvKXdaZt
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so4753315e9.2
        for <arm-scmi@vger.kernel.org>; Fri, 30 Oct 2026 08:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375925; x=1793980725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j7BatgHj5ITP9IvPD8k1iBj2N7wXMOFQgCoh9MUEa7E=;
        b=RvKXdaZtJhcETgl8YlbAnDofeGmtAsB+7fotRSXMvp+ewDqiLebBIUsEVR+pn8VKE0
         6YJQjRpujfC2eeGVDS/RrI0ACEzIzK9QVkuiYQGaXwvVc4itSm5zafOlg6UsBYMp0XVa
         LUI1x6/dNrB6xAJ7j2uqxs+4cBDI9mfhD/6qc+S/rfvC0F/vyCEtgyCh45U3zjDQW9wJ
         BcN8xrEIcFZyrBXxwVqX1sgZa0tFpwnfEumbXDHrCnSv390gF6Qdf8razGfWLmSLZgn0
         lVZLcXDL6DzxNDaUBQb1DAf0xbXk1BRuoJ79+R+NW3PUxM0RufNmhgKHqY0beTQ/yPIy
         1yWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375925; x=1793980725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j7BatgHj5ITP9IvPD8k1iBj2N7wXMOFQgCoh9MUEa7E=;
        b=Tuihk+ZfMZOl5IyiZJPB4hfNCked9THXHCYaQr4EbFLWmp2I0L7iY+PSW+YPSS8OY1
         hDJA8x5wbH2NALwegVXM/wqCErCOKCrDEkV8sOgf0MhS+EY8XXoeLdNNTUWjV+Sw9uM+
         gWluEST1G7qnxoJN0AfjxxLpv8AQhBn/lnM30gKjAWHyHwzPAmoJ3RM6a+VmvOXEFdWx
         S8Iu6f7bdWsYiWFPnJqgn+1hbj7obOqLLgI921NiK11PbLisXDZRPD2GPtMw42Tjqxaq
         ew95XrdBe8NdWVE6pMlyn4KSXgx3y+Q4on92oTQaBVyU/vH7XQpR4/KAKm0pw9jVpH2G
         XCxA==
X-Gm-Message-State: AFq9FYLr61PmQWjKvpDxljAQPGdH4BBUjxKgc4WxFgMf+yrKt+O8e5Ft
	6wTnrATGldVWKZBHMp4eIjChu1PRiUHGDFK9OuuE0VMNNhfhhQlIfDxE4Km/+3m2Czs=
X-Gm-Gg: AYBFou3VshtEj6Gz6mKtO+PXRTCeoVhdEfcET4I35+xaysNpvo46pL3a+DNmvP3OpAu
	iLODjDB71nTC+1L2oHBiJ5X1Kl0uhA5nrA9A/1Qa8gCTdFKWuEh/FCpY3hg1tdHPtoCAbLu7E9S
	Vey4IRww06mvgaC7ckPQU0StLRrr6ynLZA/B7vk4niFpedo7neAhsV0XRo/J+AkoxEwend25tF8
	o2QrilpZZiHb4CugbUGuggSIzWcxpZ47llF2S9X4G6wU7z8xr9aZ9V7yg8+538U5QDrWcxXrUha
	FEZdv5G060tTJptH+Gd4irc0eG7ZdkuAisj49EQAToTg4/QPPutxPAV1vjCuxxfaDNN/2hWj5cw
	O6eUOvv9pSw2RUhCFefOZoz0aXrRrkzKSflw1K4yvUDdYPNOFLUrODgnZgWL5OMyXZJwV1BrVBQ
	eCvTb/18dhIsRvf8HIyq8LCs5jE5sDZVcP/eDP2MTYtT8QB5zwl/Wr8T6yxvdNMwnl39inIYEh9
	ZVJ8Uzj80grh7HnNKAvhyL2D3f42vRrm8EPJLjBr3pleS8o+2+G4oq3FJTxZTrvWyzJ81G3gs4J
	LDNDCyraELUZozZB8SqItfDisyg1K5FDR0E/XdUoC4YdXiZ5wumD
X-Received: by 2002:a05:600d:a:b0:4ac:aae6:6400 with SMTP id 5b1f17b1804b1-4acaae665a6mr33076135e9.13.1793375924966;
        Fri, 30 Oct 2026 08:58:44 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04785sm146942255e9.4.2026.10.30.08.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:44 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:42 +0100
Subject: [PATCH 11/11] pinctrl: scmi: select the GPIO function on GPIO
 requests
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
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-11-52d92843ad97@baylibre.com>
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

On a GPIO request, select the GPIO function of the pin, on the pin for a
pin-only function or on its single-pin group. Without a GPIO function the
mux is left as it is.

Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 64 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 6f44e8c0fee6..ba649304638e 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -74,6 +74,69 @@ static int pinctrl_scmi_free(struct pinctrl_dev *pctldev, unsigned int offset)
 	return pinctrl_ops->pin_free(pmx->ph, offset);
 }
 
+static int pinctrl_scmi_gpio_mux_set(struct scmi_pinctrl *pmx, unsigned int pin)
+{
+	const unsigned int *elems, *pins;
+	unsigned int nr_elems, nr_pins, i;
+	bool pin_only, gpio;
+	int nr_functions, func, ret;
+
+	nr_functions = pinctrl_ops->count_get(pmx->ph, FUNCTION_TYPE);
+	for (func = 0; func < nr_functions; func++) {
+		ret = pinctrl_ops->function_flags_get(pmx->ph, func, &pin_only,
+						      &gpio);
+		if (ret)
+			return ret;
+
+		if (!gpio)
+			continue;
+
+		ret = pinctrl_ops->function_groups_get(pmx->ph, func, &nr_elems,
+						       &elems);
+		if (ret)
+			return ret;
+
+		for (i = 0; i < nr_elems; i++) {
+			if (pin_only) {
+				if (elems[i] != pin)
+					continue;
+
+				return pinctrl_ops->pin_mux_set(pmx->ph, func,
+								pin);
+			}
+
+			ret = pinctrl_ops->group_pins_get(pmx->ph, elems[i],
+							  &pins, &nr_pins);
+			if (ret)
+				return ret;
+
+			if (nr_pins == 1 && pins[0] == pin)
+				return pinctrl_ops->mux_set(pmx->ph, func,
+							    elems[i]);
+		}
+	}
+
+	return 0;
+}
+
+static int pinctrl_scmi_gpio_request_enable(struct pinctrl_dev *pctldev,
+					    struct pinctrl_gpio_range *range,
+					    unsigned int offset)
+{
+	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
+	int ret;
+
+	ret = pinctrl_ops->pin_request(pmx->ph, offset);
+	if (ret)
+		return ret;
+
+	ret = pinctrl_scmi_gpio_mux_set(pmx, offset);
+	if (ret)
+		pinctrl_ops->pin_free(pmx->ph, offset);
+
+	return ret;
+}
+
 static const struct pinmux_ops pinctrl_scmi_pinmux_ops = {
 	.request = pinctrl_scmi_request,
 	.free = pinctrl_scmi_free,
@@ -82,6 +145,7 @@ static const struct pinmux_ops pinctrl_scmi_pinmux_ops = {
 	.get_function_groups = pinmux_generic_get_function_groups,
 	.function_is_gpio = pinmux_generic_function_is_gpio,
 	.set_mux = pinctrl_scmi_func_set_mux,
+	.gpio_request_enable = pinctrl_scmi_gpio_request_enable,
 };
 
 static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,

-- 
2.56.0

