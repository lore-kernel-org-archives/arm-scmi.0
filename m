Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE2C2EC57C
	for <arm-scmi@vger.kernel.org>; Sat, 21 Mar 2026 10:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774088052; cv=none; b=pguqO1VGTLtnXUJRXCEQTDZAeDrZfHl3x1w4D8W8lftmTTok0XhlISaMeUiPDwfPkmXLaTAGcWatpxOjcUtf0agesmSAR65vazUZuXflyO+GzeAWymjsB83uyWpCm0cUX4DJbs7VPhUdks4Sz80d6IgmkWvgisqQ5o3meZMbSiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774088052; c=relaxed/simple;
	bh=wY6WUJysSNDVSdiuttZZAjpu/Kme0Jnq6xQ0HwcjrAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eUVN6P/Bt5t5WLwdIPvTlqJhHpXDWawoog0PQY0tM2StIberc5vD7GSwItEdghYEPup4HX3Kndmy5yQcDMVNljJfOzXu46q/4kFs+JbLNQCFi4C7EjNdkjKRSW79kumFmoa8346hNroBvBRsnGxeUNBb9wuX/fsOVo+bXJ5Q3vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Md0kCWEX; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Md0kCWEX"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4870206f73bso6232165e9.3
        for <arm-scmi@vger.kernel.org>; Sat, 21 Mar 2026 03:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774088050; x=1774692850; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FIJ0ORdOnYrgZlpE3wQ5WhQb4mR1i2tid5DR6xBBUpk=;
        b=Md0kCWEX/AHi7Z5qa74DyS0r7t117Qiv5iHsVXDEbtk5cJF8wViUtuRc2WV2tFKHzm
         YNMn0Hh2rBNPLF1NAqBxH3QXzxmyTUXkdc5DmSkhUXbwewjrBWsWqwjx9zSi3hgqU+c5
         18IIEyzyYUgWJEzRZhdcyDefqIgHiufTmvN0CUdBKBpEjSZEtRTM44qWs8sMXOVJLtg9
         AszIo9TqVmHCGGqSIg9bp+g0qwitcOH7+Jjmz8ubrrsk6iiTjpCwbdw3FVagFwadJKwO
         1rEleZxpGLWzba9med1+fYcIu2O/a1oRBf3+kpsLcS+AhN9eLNV0Z462ucI78FCQHwkW
         LPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774088050; x=1774692850;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FIJ0ORdOnYrgZlpE3wQ5WhQb4mR1i2tid5DR6xBBUpk=;
        b=G+gs5S6tBXIiGIVfmMI2PdaKbOXo7MJEGDECHOe3rfygLT715WRzf47qdgU6GAakHk
         xlh0kLjHlkH/08VU3lOc7KTleq776Pl4WmGCYiuS7Jkti/L+c+7y1ZDrirtoSY7s5yhT
         XewEpvZ3SiqrDyJ/JCwNXCdhnB9H1hPSsE8akCNJ73hkVwKzAiNYmpFZC9SFaUjHyjGK
         /GRIS/psiv7wGbh/glQZGtFLD5ngC6a8Yg/CdYm/D5eghD5SF0q+fRrrds+ZCNMguKve
         dTjmVMoLsHU8VuCn4uJR04Z5aUtMvRsy71uO2ZxmdikFoEApi0DtHtJXaOczniwz4KW/
         ojhA==
X-Forwarded-Encrypted: i=1; AJvYcCUgrbjLTJvBPyBcnw+l9n8GIp8yAKm8O+dcWqxy9QQnzSpM27MhnDvJZsfto9NUVcigMm+XGsEPGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx38/pjGYphoWQHPETnRD6ikLsBSUuKNeQcPfqOWifvzqsJdFfY
	8EzKqKO6GM3g/O5mpq1uq2Om7i5lzfpyio1y6W1PB7umSoctqze/mz4gDSqOmPqdlpA=
X-Gm-Gg: ATEYQzy9gFMkf1zT85xixLFUCF2vHKFShNqCxgbxmiAuZaV3ANcR/AoOjB4Yc9i1O2d
	/eVe/usV1G0hmJHPZJ8dYgYped/TcIOgNZA2g4uEfZYEnZAs6roZz3EpDcny99s91b/1VsEmuNp
	jgY+O9rZ6hb0v+3YPv34s4wSbeXz0xkXgoxwt6u5n81PIHJHGKNH9h1K3Rf+QNpjvEXO7aFjd9P
	c0S/7bXfDkvws0hJli+VbcugV2dAcNFMOnupa6q5Q2X6lmn6+GDsHgBCOwc5/JuqNowAIMUx4Zh
	jgkOy+8Awwtto9OLlxYiEWledzVewMbRref9ubpWaQ0IJmcZw7v2SXrBK3layD0z+sWbt+MnAxu
	ew7ObfiL2GNBHwmADwwCZsKgM7u4JJr3mFpJDeTr+l2nTDumjKrpmIPxGhb1oSGPL7uFlimtDAZ
	Ih14QNAcCj19MhnwZJ/xOdpQ43wiTo
X-Received: by 2002:a05:600c:3549:b0:485:3fe6:21f5 with SMTP id 5b1f17b1804b1-486fedb5928mr82796725e9.10.1774088049928;
        Sat, 21 Mar 2026 03:14:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe6d923fsm205276045e9.1.2026.03.21.03.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 03:14:09 -0700 (PDT)
Date: Sat, 21 Mar 2026 13:14:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linusw@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	arm-scmi@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v5 7/7] gpio: gpio-by-pinctrl: add pinctrl based generic GPIO
 driver
Message-ID: <4aabafcd30c1e5549dde11d6c2fe5f3f9976bce8.1774087290.git.dan.carpenter@linaro.org>
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

From: AKASHI Takahiro <takahiro.akashi@linaro.org>

The ARM SCMI pinctrl protocol allows GPIO access.  Instead of creating
a new SCMI GPIO driver, this driver is a generic GPIO driver that uses
standard pinctrl interfaces.

Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
v5: Clean up based on Andy's feedback:
    Update Kconfig entry
    Update Copyright date
    Fix includes
    Get rid of unused private data
    Simplify pin_control_gpio_get_direction()
v4: Add r-b tags
v3: Forward port and update

 drivers/gpio/Kconfig           |  13 +++++
 drivers/gpio/Makefile          |   1 +
 drivers/gpio/gpio-by-pinctrl.c | 101 +++++++++++++++++++++++++++++++++
 3 files changed, 115 insertions(+)
 create mode 100644 drivers/gpio/gpio-by-pinctrl.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b45fb799e36c..c631ecb01e07 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -246,6 +246,19 @@ config GPIO_BRCMSTB
 	help
 	  Say yes here to enable GPIO support for Broadcom STB (BCM7XXX) SoCs.
 
+config GPIO_BY_PINCTRL
+	tristate "GPIO support based on a pure pin control backend"
+	depends on GPIOLIB
+	help
+	  Support for generic GPIO handling based on top of pin control.
+	  Traditionally, firmware creates a GPIO interface or a pin
+	  controller interface and we have a driver to support it.  But
+	  in SCMI, the pin control interface is generic and we can
+	  create a simple GPIO device based on the pin control interface
+	  without doing anything custom.
+
+	  This driver used to do GPIO over the ARM SCMI protocol.
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
index 000000000000..4661c4df8e38
--- /dev/null
+++ b/drivers/gpio/gpio-by-pinctrl.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (C) 2026 Linaro Inc.
+//   Author: AKASHI takahiro <takahiro.akashi@linaro.org>
+
+#include <linux/errno.h>
+#include <linux/gpio/driver.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+
+#include "gpiolib.h"
+
+static int pin_control_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	unsigned long config;
+	int ret;
+
+	config = PIN_CONFIG_OUTPUT_ENABLE;
+	ret = pinctrl_gpio_get_config(gc, offset, &config);
+	if (ret)
+		return ret;
+	if (config)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
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
+				int val)
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
+	struct gpio_chip *chip;
+
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
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
+	return devm_gpiochip_add_data(dev, chip, NULL);
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

