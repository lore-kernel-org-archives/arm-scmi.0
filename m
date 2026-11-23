Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447302;
	b=RnWGKLOvL3wb37mQovUaEAm7BnNH6ETMFEEiPMC+iyWd4xGziglCqYqAPn1Gtj79Hcwc
	 xjmKJ9XE/jW1H0dtw4D/SFsNG6eoLZiol2udXF0nofYhi+y2LB6EqkYaE1Iqs/f65OjbB
	 FOEYwb3LL+Ruyl0OJttPl/coO2hQTjVT9YYgu5U34xZyuL6z2/lZHknuS74aSkHG923m1
	 1XJ45iAAcZiMnkodZgKpde0M9y2fHtjpE1bhhM8dkwtZlaSaYMfrY4vY9nX86d1IbDzLE
	 5DLTdPsND6cjONyO6t35FZjMxb0l9c+2baBqhW6MvlZAuis1K3h5jAykdBulSWFW2yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=82cpJHaTF2XahHyniK0CnRQ00nLg09WJnkzOKC3qftk=;
	b=z60yKWBaU8/jKRxxhxEDZZVxE25qznODX/ULdv7Z6nWq9umRtvl0BmOICmjWyeYBKarL
	 CnXg9Zwqbloa4yUjmHEnaJEERa9jgAMXrl7uPJ6LWDO77IJcLLtRT6thBAjsOOMoCbkjb
	 MlrmN7ti+Oz4d31Qb2VOk0Yo6gEKjRmClQAfbpyHK+bKgR5UFm8Ko9raSwwp0y/az/O3v
	 kceLQg+rL/nDt0X2QbGvuP+5K+Zk1D2i5aoB3+R4f9nzEc/mSLzURAjc/IYmlEfJCXhEq
	 aEAalkFl9WRbvct1P0qwB6jG4xrML+E8JS/bFYin7WUqOz+wPYNqcneZoc+n+kCjJpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=b1sFCBkg;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4348C60A262B
	for <arm-scmi@vger.kernel.org>; Mon, 23 Nov 2026 15:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4348C60A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=b1sFCBkg
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-498f5fa5103so2025781f8f.2
        for <arm-scmi@vger.kernel.org>; Mon, 23 Nov 2026 07:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447300; x=1796052100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=82cpJHaTF2XahHyniK0CnRQ00nLg09WJnkzOKC3qftk=;
        b=b1sFCBkgfhFhzOsyFgsBuguGSd4ohphQgP3C77v2vFJgEQDWALGkMiIN87XBqGlw5H
         L+bmvzpUXtB0+Vpu+2kDpLxxKJQRcQxKLVdkfZfsEy2Dc/28jkbO5Ug/nVX7Xuf0zijE
         j5Zxg2D4v+D1CHcnOK4BV3khvcC1jqRm5iBNWAX8UbstSVEiMHGXRgIEVaj06XVMG39s
         hVsXlIQSsQG9fptJsTKF7HpvsG03GtCd1bJX1zy3HIy8DLfcoIjXMzK2zT/fImojWk1M
         lqoU0P3hdkcq63Le6BCGcAkPELf8M1JbEvGT+aqIlM//4gJUd2s87wbTRXqAAtyyrfKd
         GP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447300; x=1796052100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=82cpJHaTF2XahHyniK0CnRQ00nLg09WJnkzOKC3qftk=;
        b=YTjtpwds8wp+0jY/ttjxC1iEASJgEC1L5oUrpILklkqOKuejEaqAN+XjPNahy4Kkuz
         XJKnaWJBLo6QmRnkXABR4DhfDRxZkTL7nkzqMXqWu2CKzED44XR7f1qUD9HdmH5MpEcc
         aS2Nlw8T9gFLNU6R5g9hILkfqIkE8MI9SV3UzFx7z4VRi8SA7/ocSGt4ZyRHQ7M5iIdQ
         rF8x31yXiPsPYjKDPq31Fo2mNlD4m3Tl8XpIEBdoDIhXovKLxMv2H4djmQ97p27lvemu
         MoXHb/NdfNf1DvzUCNIQGSNFDm2Myghuin7seKix3hRbkE4Pn1WbWNGNrHhDCVgza2BL
         vqgg==
X-Gm-Message-State: APuU4Z9BvILchK+t+Zx3IREzueeEpn0P5Xs8S1+Xw793eGkTb4E7BPj2
	dZ/YVHXYNX+hcjO6kPpmni/cyUIBUPlrAlibMMxtgQvAZsP9fRqbt25A5FTDUBPDK30=
X-Gm-Gg: AZFdTZf8QU04JiMnYC2MY20VvL8dcy71yLmjgGx49mxowbdVz+TvgKKDtCh/QCbx9t0
	Bl3Ph5HeEel5lc2ed8fCl6tEceAGl+K1WusSSZ+jkiPZGZWmlVRd6mpqFf/HxQP/ZrLUhzD/CuX
	H2nXLH6pgGoaYjSHoiIplsBY8hio53pWL14IwPRwGAb2KRj4BXJzivvlJAHRGLnoC6dZw5X0CdZ
	qLpJ4uB8rZkFAvFTWGXX3k6AdG+67FON6YqNNAYsPwvo29KghE9bTfshgbIg8wdsjxLUCC2M52k
	KXAvkzgg0FLZJPmy+2SXcjPKz3qCvw+IsaY8bDdpR1ZWB+mP/vEdRK5YcBgqaP3jpm4K5DSPAwr
	OypJ5V6rU70HAVbYdLeevFI0EQBWSM6AO55tzZh34ATPsuRHNcomXH8eoThycBrYYqvwbJ8cGZc
	WvsS/kNwWqpiGVCLOlvNgIV+ETzzqP/IbW5G/2AAIiwuMTKCZUwmQjqDw2d3l1pC3tcY3Dpj6lv
	eHEBZILzitAwPK9U4/qMDRFeNIf6jfCPLeSpMzMM87eUUM2XzslLRWXEoZQ1ZM2pez8Ht0rUpoe
	cghJKEUZ3jZf0Y+4upp6VDo50LBoQXnxK0p60jFXzFl78sL2nrQ=
X-Received: by 2002:adf:e183:0:b0:4a7:790c:4a56 with SMTP id ffacd0b85a97d-4abb5cc17dcmr21011491f8f.33.1795447299625;
        Mon, 23 Nov 2026 07:21:39 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b3415763f7sm4832434f8f.9.2026.11.23.07.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:39 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 23 Nov 2026 16:21:32 +0100
Subject: [PATCH v3 10/10] pinctrl: scmi: select the GPIO function on GPIO
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
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-10-d61f039be008@baylibre.com>
References: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
In-Reply-To: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev

On a GPIO request, select the GPIO function of the pin, on the pin for a
pin-only function or on its single-pin group. Without a GPIO function the
mux is left as it is.

Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 61 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index ed563514898a..a8285b5f307d 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -75,6 +75,66 @@ static int pinctrl_scmi_free(struct pinctrl_dev *pctldev, unsigned int offset)
 	return pinctrl_ops->pin_free(pmx->ph, offset);
 }
 
+static int pinctrl_scmi_gpio_mux_set(struct scmi_pinctrl *pmx, unsigned int pin)
+{
+	unsigned int nr_functions, nr_elems, nr_pins;
+	const unsigned int *elems, *pins;
+	bool pin_only, gpio;
+	int ret;
+
+	nr_functions = pinctrl_ops->count_get(pmx->ph, FUNCTION_TYPE);
+	for (unsigned int func = 0; func < nr_functions; func++) {
+		ret = pinctrl_ops->function_flags_get(pmx->ph, func, &pin_only, &gpio);
+		if (ret)
+			return ret;
+
+		if (!gpio)
+			continue;
+
+		ret = pinctrl_ops->function_groups_get(pmx->ph, func, &nr_elems, &elems);
+		if (ret)
+			return ret;
+
+		for (unsigned int i = 0; i < nr_elems; i++) {
+			if (pin_only) {
+				if (elems[i] != pin)
+					continue;
+
+				return pinctrl_ops->pin_mux_set(pmx->ph, func, pin);
+			}
+
+			ret = pinctrl_ops->group_pins_get(pmx->ph, elems[i], &pins, &nr_pins);
+			if (ret)
+				return ret;
+
+			if (nr_pins == 1 && pins[0] == pin)
+				return pinctrl_ops->mux_set(pmx->ph, func, elems[i]);
+		}
+	}
+
+	dev_dbg(pmx->dev, "No GPIO function for pin %u, mux left unchanged\n", pin);
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
@@ -83,6 +143,7 @@ static const struct pinmux_ops pinctrl_scmi_pinmux_ops = {
 	.get_function_groups = pinmux_generic_get_function_groups,
 	.function_is_gpio = pinmux_generic_function_is_gpio,
 	.set_mux = pinctrl_scmi_func_set_mux,
+	.gpio_request_enable = pinctrl_scmi_gpio_request_enable,
 };
 
 static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,

-- 
2.56.1

