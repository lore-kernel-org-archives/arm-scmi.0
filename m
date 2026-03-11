Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83C93382F7
	for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 19:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773257973; cv=none; b=dQ86rhnrr0Qlw4vJVBzDt51xPw4ZwCfM3YPzhicPfjZwpVAyq04m7VlRXbGkuU7hANSfaiJlViTC++GpFxIh49TpnolOiOUpSSUQ9P3i6vuPOs21mc140cQ4FP1orfr/ZA8Vq+ZT6biN2LD/A484J5c+1f2c19p8xjbcCF/zbjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773257973; c=relaxed/simple;
	bh=b0+EIOi8VZGnVfS2+VeQ8ek/Iuh35iblH8PEzYt72RI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qtjWZrTIvPwt//Q1X61MSh0otAV+McSS+zPL12sYdBhi5BpvsKTb2bTkhNSSxCsLogowEuyFqu9Eagu6GDyD8/Mk5Xx5qKsO5MLgTQuZ2ypDu+UjGAqLePEtIe50ZROVF29Z6NuldWu1TWPkSc7jA8AFjP7bH8MlQKykciS4ynU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mQDgDSU1; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mQDgDSU1"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439b8a3f2bcso184550f8f.3
        for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 12:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773257968; x=1773862768; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sctYsMoKQO849nQjqKlN3dvm2Uh2aK2/meOPVblHZeQ=;
        b=mQDgDSU1j7+4ILCSoXi0duEfpK0OukCQEU7RlfznQn4yjQuxhmasN5l5u0gZmp0GSm
         ALFNHhZRQpw5oO/pNkpq9VQgXZDlRwiDlMbcr/FQhRF5RUzrMUbUY8eL5KYPOTuRCros
         SCSjQT308+Zxr2SPTgxN5LNMyondlcIwYFKdA8UsX//LEFKwqIbSbeifs8+0y8dNdnzS
         qPJb9srYDsP/b7POSLqzRLz1qOu4OfmOmU3e9wFZlQd0hKcTEACYnVdCBkFABAMoyO6v
         6bGV61Yk828eCtmTq0eu9o5aMNZOOSU2z0EYwDB0MdOomrwu9tab0cOSTDuLa8//ansV
         fdMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257968; x=1773862768;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sctYsMoKQO849nQjqKlN3dvm2Uh2aK2/meOPVblHZeQ=;
        b=eQYFsPf0liPsu8t6aUVz7JJV38Ht8dmPKPVKhmvl6ldqzBXnBv96zk3aM2NXG9TF9p
         7d6EvEhggriikAlWLQbXdU+Kxlc/njHANyL4veOWNGcSaKDi67sYHB86Y+xmSTZT+lbm
         979atiurjemA8NHdw9nEyQYLKAikpvAtU+sD5C2i8JE5u1RrrWDhusZakmNZhYHIoqIA
         oW6zNVScaHzhvEIhq9ieX5JDPfQQBpY1CSqq+2S/McADnkVLTG1OAEdrV5Ig0t6pitBg
         CkhyPeCD4Aj37uZ6/MSQ2dWmbuq03x2RNELWNkHjzEEORVauBI5ZLKizsvJXKyRuuABZ
         zwZw==
X-Forwarded-Encrypted: i=1; AJvYcCXJmfkJAqAkvg7Y2hHc2zwgPiXK/LmFl4WixYX8l2j2oBcI8A5Ywv2VfZiAOtL9dmPwQyZjvxRhlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDgxYyN8m6GWhmZLEFNbi6LN7ON4NR+LpqhW4FfL4LX+pORvFi
	MCB/hUoO474ifMgohkK/ZUv69mc+EsbzUZiUF000Xmq1U2tbdcRPcLmWGtpgxdJjVLY=
X-Gm-Gg: ATEYQzytXLGOLGy6Jnyn3Y/FwJMP1H5DgJJyCBkM67T8tjCqRnQxlPmfX9M2ukaTDYY
	4XwmMJIwgwoFd1rDW+gzLlu5c452HUMyfTNM7K6MwMvHZFT/DFzDc18WDt+zWwuKLRmCPWNEwTq
	xv16L97dW+IluLHLO8Iz/xwKZU5E0LxZDE4unIVXCK/73Jwh/bt/VTjkHq63VAgOwT7lQf3MN8w
	X/ecP4tWGaMs7T5fPD+hj77dBECVMmFlv7z4d09Zp71EStgE6ddZODR0Pa3ARc6cR+116/ibZEj
	AOMhc0k30fzxKtF5cgd41U9OFU/22d7DONHvrrGucJRyai223OqrxAopTbWc9k58mqzEeibo26q
	JDPeQK0fi5jllyG6x8d+xGphIBKV49+7+sgT910foAoNfKPz4eXZHk1qebFbSN3F3KFqooEwsCd
	amC58BjdWhQBgHsZdELnO/bvQuaD+B
X-Received: by 2002:a05:6000:2508:b0:439:ac8f:5da5 with SMTP id ffacd0b85a97d-439f81bdae2mr7697986f8f.8.1773257967835;
        Wed, 11 Mar 2026 12:39:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19aec5sm1559967f8f.4.2026.03.11.12.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:39:27 -0700 (PDT)
Date: Wed, 11 Mar 2026 22:39:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linusw@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	arm-scmi@vger.kernel.org
Subject: [PATCH v3 7/7] gpio: add pinctrl based generic gpio driver
Message-ID: <93920f541564bc4e6aaf0f2b6df2f5aca721d452.1773150895.git.dan.carpenter@linaro.org>
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

From: AKASHI Takahiro <takahiro.akashi@linaro.org>

The ARM SCMI pinctrl protocol allows GPIO access.  Instead of creating
a new SCMI gpio driver, this driver is a generic GPIO driver that uses
standard pinctrl interfaces.

Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpio/Kconfig           |   7 ++
 drivers/gpio/Makefile          |   1 +
 drivers/gpio/gpio-by-pinctrl.c | 124 +++++++++++++++++++++++++++++++++
 3 files changed, 132 insertions(+)
 create mode 100644 drivers/gpio/gpio-by-pinctrl.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b45fb799e36c..4c8d2589c412 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -246,6 +246,13 @@ config GPIO_BRCMSTB
 	help
 	  Say yes here to enable GPIO support for Broadcom STB (BCM7XXX) SoCs.
 
+config GPIO_BY_PINCTRL
+	tristate "GPIO support based on a pure pin control backend"
+	depends on GPIOLIB
+	help
+	  Select this option to support GPIO devices based solely on pin
+	  control.  This is used to do GPIO over the ARM SCMI protocol.
+
 config GPIO_CADENCE
 	tristate "Cadence GPIO support"
 	depends on OF_GPIO
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index c05f7d795c43..20d4a57afdaa 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -51,6 +51,7 @@ obj-$(CONFIG_GPIO_BD9571MWV)		+= gpio-bd9571mwv.o
 obj-$(CONFIG_GPIO_BLZP1600)		+= gpio-blzp1600.o
 obj-$(CONFIG_GPIO_BRCMSTB)		+= gpio-brcmstb.o
 obj-$(CONFIG_GPIO_BT8XX)		+= gpio-bt8xx.o
+obj-$(CONFIG_GPIO_BY_PINCTRL)		+= gpio-by-pinctrl.o
 obj-$(CONFIG_GPIO_CADENCE)		+= gpio-cadence.o
 obj-$(CONFIG_GPIO_CGBC)			+= gpio-cgbc.o
 obj-$(CONFIG_GPIO_CLPS711X)		+= gpio-clps711x.o
diff --git a/drivers/gpio/gpio-by-pinctrl.c b/drivers/gpio/gpio-by-pinctrl.c
new file mode 100644
index 000000000000..c1fed14c9d01
--- /dev/null
+++ b/drivers/gpio/gpio-by-pinctrl.c
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (C) 2023 Linaro Inc.
+//   Author: AKASHI takahiro <takahiro.akashi@linaro.org>
+
+#include <linux/gpio/driver.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+#include "gpiolib.h"
+
+struct pin_control_gpio_priv {
+	struct gpio_chip chip;
+};
+
+static int pin_control_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	unsigned long config;
+	bool in, out;
+	int ret;
+
+	config = PIN_CONFIG_INPUT_ENABLE;
+	ret = pinctrl_gpio_get_config(gc, offset, &config);
+	if (ret)
+		return ret;
+	in = config;
+
+	config = PIN_CONFIG_OUTPUT_ENABLE;
+	ret = pinctrl_gpio_get_config(gc, offset, &config);
+	if (ret)
+		return ret;
+	out = config;
+
+	/* Consistency check - in theory both can be enabled! */
+	if (in && !out)
+		return GPIO_LINE_DIRECTION_IN;
+	if (!in && out)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return -EINVAL;
+}
+
+static int pin_control_gpio_direction_output(struct gpio_chip *chip,
+					     unsigned int offset, int val)
+{
+	return pinctrl_gpio_direction_output(chip, offset);
+}
+
+static int pin_control_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	unsigned long config;
+	int ret;
+
+	config = PIN_CONFIG_LEVEL;
+	ret = pinctrl_gpio_get_config(chip, offset, &config);
+	if (ret)
+		return ret;
+
+	return !!config;
+}
+
+static int pin_control_gpio_set(struct gpio_chip *chip, unsigned int offset,
+				 int val)
+{
+	unsigned long config;
+
+	config = PIN_CONF_PACKED(PIN_CONFIG_LEVEL, val);
+	return pinctrl_gpio_set_config(chip, offset, config);
+}
+
+static int pin_control_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct pin_control_gpio_priv *priv;
+	struct gpio_chip *chip;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	chip = &priv->chip;
+	chip->label = dev_name(dev);
+	chip->parent = dev;
+	chip->base = -1;
+
+	chip->request = gpiochip_generic_request;
+	chip->free = gpiochip_generic_free;
+	chip->get_direction = pin_control_gpio_get_direction;
+	chip->direction_input = pinctrl_gpio_direction_input;
+	chip->direction_output = pin_control_gpio_direction_output;
+	chip->get = pin_control_gpio_get;
+	chip->set = pin_control_gpio_set;
+	chip->set_config = gpiochip_generic_config;
+
+	ret = devm_gpiochip_add_data(dev, chip, priv);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, priv);
+
+	return 0;
+}
+
+static const struct of_device_id pin_control_gpio_match[] = {
+	{ .compatible = "scmi-pinctrl-gpio" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, pin_control_gpio_match);
+
+static struct platform_driver pin_control_gpio_driver = {
+	.probe = pin_control_gpio_probe,
+	.driver = {
+		.name = "pin-control-gpio",
+		.of_match_table = pin_control_gpio_match,
+	},
+};
+module_platform_driver(pin_control_gpio_driver);
+
+MODULE_AUTHOR("AKASHI Takahiro <takahiro.akashi@linaro.org>");
+MODULE_DESCRIPTION("Pinctrl based GPIO driver");
+MODULE_LICENSE("GPL");
-- 
2.51.0

