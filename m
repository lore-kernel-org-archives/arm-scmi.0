Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567973;
	b=VYJG78svjkt1wWRjW3tWtQmuHtvcaocxBGKjYXuVFcgtwRoZwgT9mNVgvSB0vaeKCmAo
	 Y6ji3yX9wQS6FK7JxTV34iHm1i4SIEMHaqyno0J4CIt2yAHCAS9N9ZhAVYgPi8gfjXBui
	 eEbv10WOmYaYBhnsMeB1FARRTIG0rDZ4zCFt9hsTJL0MJKjaPV9y7UfhTqIF+WjRBlbQb
	 /VRglB22ADB7+YUD/EVeBfo+OtWKOb9nagxvWJTDQomqpV4jCyx1fmVE/NHG8xxHu4FMC
	 lKwmIokzsggriS6/A9Wb/et5iT5fEVGsWj1iABJ2+xDoUOpHKGQgsQId4YXURBsa2Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=CI3m2IUBy4AJO/fxu7FDLRUHIb948rmd18iopbbst+c=;
	b=EeKyUgohhR3ePE1/gkY8ZokACAs1EqYuSmx86WemX69YFlHhegiOB1+LlyELANjqV9b0
	 ht1xSNekCxqUQZtqyrBAWmrY5R+JyoCn52IjAln0d0K9SOIOmJRusgNvO3BuAotrpQGtX
	 mTgAH9gzqq0cHLasnKpYpOTmqKCAWWsCKnksWlu4YQKBhSq6Jw3se1pobouaMg1RJ4GR/
	 dL8cXHp6qofdferBGRJwBwzmE/B2ToSZv/HVk6IEOXBI3KKDU73b1XPtDT1HwM7KaAWkg
	 Sj35i17wm818PHN2efRYPrTrvrD76Yjd03ny2s4ew+cBoF5aPf0bmvE6StKdmP30Eeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LHClu9Y2;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A78606DFE7
	for <arm-scmi@vger.kernel.org>; Fri, 13 Nov 2026 11:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70A78606DFE7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LHClu9Y2
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so382122f8f.3
        for <arm-scmi@vger.kernel.org>; Fri, 13 Nov 2026 03:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567971; x=1795172771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CI3m2IUBy4AJO/fxu7FDLRUHIb948rmd18iopbbst+c=;
        b=LHClu9Y2/nHrB30IHALaxE4iScltAFJ4M62ZvLmvcYVaSJy+ecjyPCZOKuHSBG1SXS
         4PJxS9f0oJX9PeW34ToT0rmpuRhhWj6vssLNwFQObLesRncJdMaEijDADIRbq5ocwv0y
         CNlQB5jD+Uc4nimIgHNB4HFhDPC2e3VGYlEY9av1KZhYm5hJj791cyjem+by+7KyhUvv
         m6trU7xoUpHZd/dReY4CcgSLsAZA9AlFWduFG38mYN/Yh3OvGFl6O7aEFdR+bw/CyOhM
         lOoTMJ/+CcGzxT10oOhwRMhlAxa4SvgSlg7CZt/qIGVhNf7ytGf1fBSk6anZVcPea9mB
         DyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567971; x=1795172771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CI3m2IUBy4AJO/fxu7FDLRUHIb948rmd18iopbbst+c=;
        b=fcdknY64GlAHmYygToxRGkEh6Fx25jxPbRwsdFlu79doT7VKPKCet7xzhfTI7qhgOQ
         2Ab3leVqaGw8iyW9ThFlrz7g32AvBCbv6n8sRY16KUqhZrq/LOF6RDB6EAfsmj4gkNES
         GTGLTsvtUbnWFnGqk7SBfxupj9IdPuXesx5CHr+ld0DPIOZMybZi/nl0rJ8EljHu4yVu
         yLq7aZEPSUHRrMTGTxrOzdDc9GecgKDnt5ZZ/DrbFkzmTS9DHdRPTgVkM8ZSuCq9yxmA
         iRk3Ej3qhIJMnvZH9Q19WWfLVe6n37vWs0e4CrZgN1pN1g1e4f5uytOBGejcXFcbu822
         ptNw==
X-Gm-Message-State: APuU4Z/lGpvlQN3N3hnV988twoHBBdgEGvE+3kHlHmMx52ntFs/eVdgF
	a1feATzdqh77QVs3oFrjXfC/O2zHRieQQlMBECBSIFocIFJQuEQa8Xxeg0v8xG2I3Wk=
X-Gm-Gg: AYBFou280VVdUrNvIL0patrKvTt23SurI0hYizT0hmQM45Ra+vsiQ/h/nQyAM7jO6Uj
	fxoBUNUXzFjZfkeFNhjw7S/K5Rwl4fsqcuKGlUHf0N6vjzpLqhIU9xudqEdkWL3a2NJRcPTqC1p
	vvPcrmu1C26pkFdoXf9rl2xVRZ+AjKus4BFO4HsODhV0B9l1izFQCftxMl0wHwbv78qPRA3gLXh
	FIV06JqrGEN/Un1wZnJf21HjXd064GE7d2TBSksM7soGq8/0GCK5Uh7oFrLdzeqgBVk1x/EQScd
	OXExzWSYuy2woLHqnBWUKP3cgCGM6BkF4fQNu+W+NtgGuddxw3kAB+xoAAkmDOd7orqRiGrqabb
	9IgM5JorHVy7cljdSFCNT+clkgCYXDhct/98Aw+FUL6prkO/mtReUf1uJZNfwiEHZJDMRuj9upQ
	rHwn5ui4Aq2n6nwd5VzGiEydzu0LaLx63t+YsFpDgfNqXBI8NEtJ99dIdcz5sf0I3QIB0sIjKVe
	zdTI3Q2Gl0bKo2rgvHjlz2OC6gxA43Of7IXcvPP/j/xCxQ/a8FYa4flnF5cv8VEP15be6zv7Gfr
	2cyfTLr5RIQ5uAOSCK1Zm4MK2brhDjYC3EwPRnKYoW6mQMq54FE=
X-Received: by 2002:a05:6000:3c5:b0:48e:3fc:e393 with SMTP id ffacd0b85a97d-49c6fc9e60emr4495337f8f.6.1794567970746;
        Fri, 13 Nov 2026 03:06:10 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c0e31sm3987770f8f.19.2026.11.13.03.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:06:10 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 13 Nov 2026 12:05:35 +0100
Subject: [PATCH v2 09/11] pinctrl: scmi: report whether a function is GPIO
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
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-9-faccb4685d88@baylibre.com>
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
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

Use pinmux_generic_function_is_gpio() for the function_is_gpio
operation.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 43b9d67eb9e5..6d51025013ec 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -80,6 +80,7 @@ static const struct pinmux_ops pinctrl_scmi_pinmux_ops = {
 	.get_functions_count = pinmux_generic_get_function_count,
 	.get_function_name = pinmux_generic_get_function_name,
 	.get_function_groups = pinmux_generic_get_function_groups,
+	.function_is_gpio = pinmux_generic_function_is_gpio,
 	.set_mux = pinctrl_scmi_func_set_mux,
 };
 

-- 
2.56.1

