Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C713631F987
	for <arm-scmi@vger.kernel.org>; Mon, 23 Mar 2026 19:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774292513; cv=none; b=fz7eXaRLk5lTXzDNVxj9WXl/dOkxwVp8n0soLVmE3+9kAookDJ+YkggHiQ8wMqMbOs/lmXBFvoGdxJSSP/oQs+UO41tuULw7udj3/NQeqMqRkHnIJP7KhVi2Iuh6p3WkSt5OmRwiDO+ndcvq4eA9pXd8yIrHoQwHiBD0f9R8Fjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774292513; c=relaxed/simple;
	bh=78h6zo0OmGYwoE9jXpMgQ5eL1Q+6zRrrpxk2B2OYgvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZAQN1C7CsbniCJioFxLEJGAsVNA2SHAVi5wWMfahJ9eg7MjoDMOjVsQ7enzs2NHzm85cA+Gsz+5JNiOWg3/npi03J2XEu/p4LhtVgghcitXJdo8QW6qPpQPuDFr8NwCOuQcU6QwV7AZ/IH0sYGJCa6UCy57Ctz3AcBNGpv+aGAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fV+Y5bfb; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fV+Y5bfb"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43b7ffed973so278327f8f.2
        for <arm-scmi@vger.kernel.org>; Mon, 23 Mar 2026 12:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774292510; x=1774897310; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YC5M6Gei+tjtXgncpnAEt2N0RrhP9pRpNjEcwCa4CLI=;
        b=fV+Y5bfblPjFkJ961WGi0rUyIyBKwC4HabC7T8ODnCTisgWLZKLfIEcuhxk9PP2iD4
         E0Nbm1ZHzp0x2k4iTapeaSq1EBriOO3szTVBDTVUR6VGWR9MSBnz6717zcg6JkaT4frF
         Qrr7/r59jZyiVtT4bwlzMtkGGy7LuA/hcvvLJw6WbcZ18x3H6Xi9ZILPb85HBoo24VCb
         NC2M1Ms3INzq7HOyWWWN0CwrnjwpmYFwY5ZIyZbP7TmrjGSaM6BhXa+IW+ZQ//Ib/ND9
         HO0FjoZqRaFPDGnNXljzh879UgJQAHKLTq/kMR2ert05tD1AT1w0GCrGioMb9/CNVlye
         aFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774292510; x=1774897310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YC5M6Gei+tjtXgncpnAEt2N0RrhP9pRpNjEcwCa4CLI=;
        b=g/RcQGVUeWpHhnXupqoyPBbVLwm9Ld02RZa2gl0JM/xkGAJgUlbs3sk2xYWni8AQUF
         s+Ui5R/TZ3V3ccUowspdia7Ojq1IoQ3OT4Shj6q76Qm+YIWjeVmqGvU8syywF/Ywg1nx
         CBIqGvUTC+QKqkAB6ai2hzQeuBDCV9LDbKGq6slBjkXmB7ruuGv0W4oSCx3gMZ1AG1Xz
         ETf6zF60QbcXSV32R1j0mlzzlXtIi47QuYw78dmpH+p2C0Ia9u+6oGv+jvt1ECP0SDU6
         2iQxswTroUoXARDu7phm/vSSvUzXe1L5gIOfaAo9h1cZOhnhuQIWw0Ug5/LwRQA47VsB
         rqFQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8N3XidkZD943Gcla/1EVSoiVROkkkK11j0HXzg9UVHNp5zn71jVYgFmv6SV6hPbgmEtPmSE9yrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzomojQb7jFhO/BQiPn2LtANZk5kZezlLbEXdsJy19bXaOFr0AE
	59Tp8vSX4KVTK6ia1/72R/qmxpJqhcy3BZzuHpypcNYIcJLyYWGiEmXSkVdhZG1hOos=
X-Gm-Gg: ATEYQzw5rF0ImT6QGj1BEIRgiTeXkxNVNS+jvRD+pZVhk/QM2HgGDNadmYM+pPavhLX
	/7bkIWFiiSvqY3X2JaGcgqNmR5wOI5xHzC8wVXUlAZdRUOr61nkWoqQjUbp5//mYDYBEYe/ogAs
	31F40kW9oZtMfWbN8V+9L2Xv19a+dARg53XCi6oyMkWmdJELy4VvSaLtyvLZLU1JqSJ454PTiX+
	KRRF0PpnolbS2/CBwWunfOzX65wjNR+j8H2wZyFzZYcXNkKu0fjTww2tbkA6JZDRYB38RRN3+s/
	iAbDH7z8Ate9nxZLfFBQF+ZONm9IHJNHTYiZbpTQINx5MSUC+U6A+3Jua6hQwvKLCUdqqNcEPta
	yrOoQFsYo6fKnWsp7nIu+byVSrBvrpGhqh2qBFPIdtbhdQpfcul//2Q6jPks/jMcPHTQyEEffPO
	IKBlcLjibWrxGxRFUrVFsRImnTG28j
X-Received: by 2002:a05:6000:2486:b0:43b:4951:6479 with SMTP id ffacd0b85a97d-43b642800a7mr20717468f8f.37.1774292510222;
        Mon, 23 Mar 2026 12:01:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bdaf8sm36940550f8f.13.2026.03.23.12.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:01:49 -0700 (PDT)
Date: Mon, 23 Mar 2026 22:01:47 +0300
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
Subject: [PATCH v6 7/7] gpio: gpio-by-pinctrl: add pinctrl based generic GPIO
 driver
Message-ID: <edd789f8fc87f294211adf84b09c2af9f4aa6a6f.1774283146.git.dan.carpenter@linaro.org>
References: <cover.1774283146.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1774283146.git.dan.carpenter@linaro.org>

From: AKASHI Takahiro <takahiro.akashi@linaro.org>

The ARM SCMI pinctrl protocol allows GPIO access.  Instead of creating
a new SCMI GPIO driver, this driver is a generic GPIO driver that uses
standard pinctrl interfaces.

Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
v6: Use pinconf_to_config_packed() instead of PIN_CONF_PACKED()
v5: Clean up based on Andy's feedback:
    Update Kconfig entry
    Update Copyright date
    Fix includes
    Get rid of unused private data
    Simplify pin_control_gpio_get_direction()
v4: Add r-b tags
v3: Forward port and update
---
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
index 000000000000..ddfdc479d38a
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
+	config = pinconf_to_config_packed(PIN_CONFIG_LEVEL, val);
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
2.53.0

