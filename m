Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3E23EAC72
	for <arm-scmi@vger.kernel.org>; Tue, 17 Mar 2026 14:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758469; cv=none; b=T9oMqwZiupGwIicTnXsBN2J18JEci7R2Jl2yYbqtLU8cfsrPYuQd/HSJzwttvQLHuZRSV4KrBQsp7ecytp7TELJ2NuCWreOubjZ4Zuijga1ak3Py2I8RWphmj9hLc8rIvauxQCg/0yii4U3K2AN2x7NuV9ztdJ/6ozxwmQddsAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758469; c=relaxed/simple;
	bh=i9Ayqo355UdyuhP914T/ztwqiF56+xsVE0G7YXUVSLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VFpTbZzIYi9AeoI/fwKIc1ZUu9QEJjAZznzV+aE7DxVfKf8g+POSCuTPGCqp9OBL0wHD51gU2AhrnECCoaWeXx8mv9nhmEmCM/uxYi6b4oEE5QpaVCD5yayol8sYEFWdJ2DcF4kfT5qS21qN2oMUyH8dE/8wISzJtPjb9MDc+d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yYmIqpZS; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yYmIqpZS"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-661cfb9f3aaso8418903a12.2
        for <arm-scmi@vger.kernel.org>; Tue, 17 Mar 2026 07:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773758465; x=1774363265; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pkm9Eij4ujkDM8tLP/o4Q7PXNVlD809Spia5hvG8Py4=;
        b=yYmIqpZSjYLTVzK1fcim+t+pKwkyclTSIi0WomaE+iR5CBW3qvhxRAuot00RN8osyV
         Y7XYoCYfyVeZ2bcbTw3VO0ClzS9/KFG0uTdKkXFEPtwHdoz8ZWUFjYWO3sAsug+YnFr1
         tFKvsKlBN6HNmvtVgjJj+uVrfBj6c/YorbkQ7Wpwkr5XWokYcl1iKVJxsJ9EK+9P7c3q
         2gcsoIxFo4cU1cQHawhJyVS/sTEyOsH0tLbWeTd6hv+4/oKkd3pqC+yv7w5UnTjahZZp
         sIK3NKF1UaywTi9ggFwjzcYQGd3HbBhUbjIYc2j/xMNCPSwncyCEfTrBIo8yx/3lJcqL
         19RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773758465; x=1774363265;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pkm9Eij4ujkDM8tLP/o4Q7PXNVlD809Spia5hvG8Py4=;
        b=VNylg2/LsEO+nEQbHebQwxa6vfSULX8sGJVgvY/GpFarrZyjjh9dlOGfJ9iwZEjSI5
         YBU0e8WdIJxTQbw9YzYfQpypaWduqfFBYxU+4BFao71AmWUxHG7Fm3tPB1iQNM8bAHtc
         w3zX+6b0PI7IZ8Txgyk/DLrRgkm+c5sMlK0JyJM9VUVUnmvb4QK1lR68bfAq8NHIXZkU
         O0crYKFpMFLowrRCtIa0yS8HDDELM3jt5nn+zLNiKGRn4ZAz3bQq2gOGFdgTf0OdKvF7
         RxUDlSVMCx6JG0jhGv4rmbwq92CThtmmoA/pwVzsA3AReaFcdIJ3t+DO8iVHn8DFG/rl
         22rw==
X-Forwarded-Encrypted: i=1; AJvYcCUlsOZdf/S6D3YaAqTdRJSrwC3RdsKCItoZVRFXv0KECD4MRwLqbIrFc/loyPQNOlzNufUPbKYH0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvmIQbg8nRXLHMBVUDd+QVpzPj5KIuza87bkhXbZhf+1IaXQRs
	DdsfUMYhZFXbfvq9hbCa0qF8TWwIa1V+8vEyBFhXVfVDHBavrDT7ch9qzDoXpYQbXCw=
X-Gm-Gg: ATEYQzxm71E2+7x70ud/Pb7QjSY7jdTkPPGs8CaOlHKHTl5IkyIOGyYl7T7z6sdh/4L
	5kEt18IAl66s1IuB7nISU0zbSUHfO5u5x3W8+W5FQeWJ0ZMPrLVIfgbfDzbGocGT21fVn+s6wgB
	d1vykycVn/gQi21Vj7LxCP0lamelOUmwD4UO8sdw6HJmkAJNtd6toMvUKu/sY3XYsFCQBkeuCj7
	5uYNfLDwmTMzlWe+qVpOvytzIR2VYjokZ2IP09QE21j1PegIc8POom7S2rxUniCWyOFz05ll8m2
	vWPa1+tO6a+j4MjXnhvdWqSc582yDZDYYStX5AgHgeL85tI0TxUPpsYxJD7+ABAr6UEYdH/k17d
	70MgEolDyT46cdxW1GevIsGNiaTNyOUGVEX5/T74sU/Nlxb89OfJtuuPNTSMxqZXh+5I/8ka1m1
	PRzo+vLV3UzBGPqTTTq+lrnetSr74L
X-Received: by 2002:a05:6402:26c6:b0:666:d8bb:8607 with SMTP id 4fb4d7f45d1cf-666d8bb88bdmr3698291a12.0.1773758465367;
        Tue, 17 Mar 2026 07:41:05 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6634fdb6421sm6834806a12.8.2026.03.17.07.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:41:05 -0700 (PDT)
Date: Tue, 17 Mar 2026 17:41:02 +0300
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
Subject: [PATCH v4 7/7] gpio: add pinctrl based generic gpio driver
Message-ID: <e154f1573e82bb96085cf3a256456fddd3738ce7.1773757772.git.dan.carpenter@linaro.org>
References: <cover.1773757772.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1773757772.git.dan.carpenter@linaro.org>

From: AKASHI Takahiro <takahiro.akashi@linaro.org>

The ARM SCMI pinctrl protocol allows GPIO access.  Instead of creating
a new SCMI gpio driver, this driver is a generic GPIO driver that uses
standard pinctrl interfaces.

Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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
index 000000000000..51d99723d3ca
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

