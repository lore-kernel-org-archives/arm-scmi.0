Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E76299922
	for <arm-scmi@vger.kernel.org>; Mon, 23 Feb 2026 14:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771857228; cv=none; b=mIEZKdj7DxfNFUfkI23Ipb8A0l8K02v3lTwQcnf/NZegm6Asw+p4TQVsIOsMOrhOsga8qikld6cnuTRdegHQKndL1Zl20+u9Gv/VJqvtvaSZMeDYUI3OAickLtyYkCYwXIclpmll1Shw1mDMubJa/MqTFcSNd/JgGG4/Ifxj5qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771857228; c=relaxed/simple;
	bh=tfe3m1Z3eCMIzKs2twoSkmpE1SNrdDnrE3i2YfeEk4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=STZ1LdMpJudjUL7HpgEbPyEmD/9VsWvZGQSsgAEZgBwSszbqV5o3die1n09Q5g/uKqM2TKnQhYUGEMR+UGnmelRA1JMeaKKojRTNDAwNLYsPapQ6zSkojwwrNnzBZKiRXoocH3toycZqbkhgtvga3j6TvxXUVgrw/LmTUp1D+qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n0pCUw/H; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n0pCUw/H"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43626796202so3785978f8f.3
        for <arm-scmi@vger.kernel.org>; Mon, 23 Feb 2026 06:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771857225; x=1772462025; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KgQvVJzmSPJV2NE1A0UzmUAeQyWm1PZVQqAj/lsi9Cg=;
        b=n0pCUw/HFGaaoURFht44YSDaNex3Gz7D7JolO4HnW5lvvJjxqER/Km9IpZVbLrF8aZ
         3+atBDfsG9X98ZeWLNLvYxnFGfxZ69c4TVWTvOoveJdEwpvAZdYMGwUsz561KUK90Y4X
         ifOT2I+OhFjreY0mh7FXq2royvSvoCGbaj0PWsLgjKFnA8oZRYo/bGYx1QbcxWEl+dyf
         WY6inySO+HX7/B/dUTKeqSnFakFwEW0Tq66523NpbPAz6Slm9Dn2gxcboKL5fxhbERn0
         LIxUSVKDbCq6W+IUPhFjeD5bf+y4kVqyjbRZrZZd+xAXqjXSXxphF1Qd/ExlIPQ2YA2e
         f/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771857225; x=1772462025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KgQvVJzmSPJV2NE1A0UzmUAeQyWm1PZVQqAj/lsi9Cg=;
        b=QS2XwMeTbfjt2O+6aqAd7Sc56HvCQ2kOhIg3HLbxqfGAzddwLTZEPOaVruD+vWO9YB
         Jfd3SM1wPQQU2+Ouf1tTogNFE8DQd2su2TxBRNNKvDk4H0GFLkwem2xReV2QWCqe+KdG
         arPEsxF8lBzwqiqnXXs/mcO4e1U40WfHWwhDEQ39QXf6P1PSL5XrCUIq5ArLoN7iPunM
         rbpJAFG0r5xvsY9bk4Sh8oRigN/I9PKrt5vehWhOufflIy4uN8zSx1qG1pw1yvPwXIME
         4cGjmIe/GWiiKAtMCk67RgzsglZXGyWrJ0+5jbuoJeQPAOJm9TyE5xGbTB1ebYha9522
         6e6w==
X-Forwarded-Encrypted: i=1; AJvYcCWifjQ4TUl7pqCTJtvxmlLmCOa68hTgz5aCmn64VU2H/Rb/asAEM3eYOgAlooV7kO++9ADPtSDY8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIpgDwBfQ/pkVb6Mezb9YmycL3YhYvNfxzQ73CC4vrjHJAS6vB
	FT5Lg/Rz99jCelZg4UDR8ohaILWCvIhkCEFl4PXrciUqhJ2AlXxee6kMxoxTl668/Xk=
X-Gm-Gg: ATEYQzyaGjpdbzz9nAdWwmkvlCzALBiPkdIGTYAnfyO4kuNd1Y3fvuYGtB37OPTf/ng
	ZKKhngrQh7k5hqInbUutsHTAKj0+ECfLGvLJLOrAzfdr9vDGb4dR4oFZT9lXfXsGtB/lZzL1VzR
	r1Sn2dCWEjK0bUVsgnUpF6oMgdnmrtepHueK2K5/AEfWQOB8apcrxFKSjS1ZziPsVBxq+Y+Q/d3
	7ycbI6ahGb747aQ2PxGcDWgIHLDj/+5/Cp8mwqkznWyLq1o8VcrC1Ys8hCugSjndJteUIBK4XYo
	11ZrylEn+o0XP++HUw11XZUL2c3amKN3efQAMC1sWAjFALf73+xeJhxyUW7Y+TcxVZVqvDeSwDW
	Evv2onCfXLXT9sUlMMY5EM+TQn60xF5xl+JO0lSoe+xRWbpxCPTg+XHZXVM29Gbw4NPgujpNrTB
	kqFymQJSaYFW4Xxo90HU8xZMH5yor+
X-Received: by 2002:a05:6000:178c:b0:436:3563:499b with SMTP id ffacd0b85a97d-4396f14ca64mr16768784f8f.2.1771857225010;
        Mon, 23 Feb 2026 06:33:45 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00768sm19469947f8f.10.2026.02.23.06.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 06:33:44 -0800 (PST)
Date: Mon, 23 Feb 2026 17:33:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tom Rini <trini@konsulko.com>
Cc: Peng Fan <peng.fan@nxp.com>, Utsav Agarwal <utsav.agarwal@analog.com>,
	Arturs Artamonovs <arturs.artamonovs@analog.com>,
	Greg Malysa <malysagreg@gmail.com>,
	Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
	Ian Roberts <ian.roberts@timesys.com>,
	Rasmus Villemoes <ravi@prevas.dk>,
	Philip Molloy <philip.molloy@analog.com>,
	Tanmay Kathpalia <tanmay.kathpalia@altera.com>,
	Oliver Gaskell <Oliver.Gaskell@analog.com>,
	Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Eoin Dickson <eoin.dickson@microchip.com>, u-boot@lists.denx.de,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>, arm-scmi@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH 4/4] gpio: scmi: Add gpio_scmi driver
Message-ID: <e3649db2cbde07a53c7139d72c2c597f9a6d8fbd.1771856828.git.dan.carpenter@linaro.org>
References: <cover.1771856828.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1771856828.git.dan.carpenter@linaro.org>

This provides gpio support over SCMI.  The device tree entry would look
like this:

                scmi_gpio1: gpio1 {
                        compatible = "scmi,gpio";
                        scmi,pinctrl = <&scmi_pinctrl 0 2>;
                        pinctrl-names = "default";
                        pinctrl-0 = <&pinmux1>;
                        gpio-controller;
                };

The scmi,pinctrl phandle points to the function and the index within that
function.  The pinctrl-0 phandle points to the initial pin configuration
if necessary.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpio/Kconfig     |   6 ++
 drivers/gpio/Makefile    |   1 +
 drivers/gpio/gpio_scmi.c | 221 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 228 insertions(+)
 create mode 100644 drivers/gpio/gpio_scmi.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 60c5c54688e6..7d22c1f792d1 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -723,6 +723,12 @@ config SLG7XL45106_I2C_GPO
 	   8-bit gpo expander, all gpo lines are controlled by writing
 	   value into data register.
 
+config GPIO_SCMI
+	bool "SCMI GPIO pinctrl driver"
+	depends on DM_GPIO && PINCTRL_SCMI
+	help
+	   Support pinctrl GPIO over the SCMI interface.
+
 config ADP5585_GPIO
 	bool "ADP5585 GPIO driver"
 	depends on DM_GPIO && DM_I2C
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 910478c0c7a9..0003ed74be67 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -77,6 +77,7 @@ obj-$(CONFIG_SL28CPLD_GPIO)	+= sl28cpld-gpio.o
 obj-$(CONFIG_ADP5588_GPIO)	+= adp5588_gpio.o
 obj-$(CONFIG_ZYNQMP_GPIO_MODEPIN)	+= zynqmp_gpio_modepin.o
 obj-$(CONFIG_SLG7XL45106_I2C_GPO)	+= gpio_slg7xl45106.o
+obj-$(CONFIG_GPIO_SCMI)		+= gpio_scmi.o
 obj-$(CONFIG_$(PHASE_)ADP5585_GPIO)	+= adp5585_gpio.o
 obj-$(CONFIG_RZG2L_GPIO)	+= rzg2l-gpio.o
 obj-$(CONFIG_MPFS_GPIO)	+= mpfs_gpio.o
diff --git a/drivers/gpio/gpio_scmi.c b/drivers/gpio/gpio_scmi.c
new file mode 100644
index 000000000000..a859ad610587
--- /dev/null
+++ b/drivers/gpio/gpio_scmi.c
@@ -0,0 +1,221 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2026 Linaro Ltd.
+ */
+
+#include <asm/gpio.h>
+#include <dm.h>
+#include <dm/device_compat.h>
+#include <scmi_protocols.h>
+
+struct scmi_gpio_priv {
+	struct udevice *pin_dev;
+	char *bank_name;
+	u32 num_pins;
+	u16 *pins;
+};
+
+static int scmi_gpio_request(struct udevice *dev, unsigned int offset, const char *label)
+{
+	struct scmi_gpio_priv *priv = dev_get_priv(dev);
+	int pin;
+	int ret;
+
+	if (offset >= priv->num_pins)
+		return -EINVAL;
+	pin = priv->pins[offset];
+
+	ret = scmi_pinctrl_request(priv->pin_dev, SCMI_PIN, pin);
+	if (ret == -EOPNOTSUPP)
+		ret = 0;
+	if (ret)
+		dev_err(dev, "%s(): request failed: %d\n", __func__, ret);
+	return ret;
+}
+
+static int scmi_gpio_rfree(struct udevice *dev, unsigned int offset)
+{
+	struct scmi_gpio_priv *priv = dev_get_priv(dev);
+	int pin;
+	int ret;
+
+	if (offset >= priv->num_pins)
+		return -EINVAL;
+	pin = priv->pins[offset];
+
+	ret = scmi_pinctrl_release(priv->pin_dev, SCMI_PIN, pin);
+	if (ret == -EOPNOTSUPP)
+		ret = 0;
+	if (ret)
+		dev_err(dev, "%s(): release failed: %d\n", __func__, ret);
+	return ret;
+}
+
+static int scmi_gpio_set_flags(struct udevice *dev, unsigned int offset, ulong flags)
+{
+	struct scmi_gpio_priv *priv = dev_get_priv(dev);
+	const int MAX_FLAGS = 10;
+	u32 configs[MAX_FLAGS * 2];
+	int cnt = 0;
+	u32 pin;
+
+	if (offset >= priv->num_pins)
+		return -EINVAL;
+	pin = priv->pins[offset];
+
+	if (flags & GPIOD_IS_OUT) {
+		configs[cnt++] = SCMI_PIN_OUTPUT_MODE;
+		configs[cnt++] = 1;
+		configs[cnt++] = SCMI_PIN_OUTPUT_VALUE;
+		if (flags & GPIOD_IS_OUT_ACTIVE)
+			configs[cnt++] = 1;
+		else
+			configs[cnt++] = 0;
+	}
+	if (flags & GPIOD_IS_IN) {
+		configs[cnt++] = SCMI_PIN_INPUT_MODE;
+		configs[cnt++] = 1;
+	}
+	if (flags & GPIOD_OPEN_DRAIN) {
+		configs[cnt++] = SCMI_PIN_DRIVE_OPEN_DRAIN;
+		configs[cnt++] = 1;
+	}
+	if (flags & GPIOD_OPEN_SOURCE) {
+		configs[cnt++] = SCMI_PIN_DRIVE_OPEN_SOURCE;
+		configs[cnt++] = 1;
+	}
+	if (flags & GPIOD_PULL_UP) {
+		configs[cnt++] = SCMI_PIN_BIAS_PULL_UP;
+		configs[cnt++] = 1;
+	}
+	if (flags & GPIOD_PULL_DOWN) {
+		configs[cnt++] = SCMI_PIN_BIAS_PULL_DOWN;
+		configs[cnt++] = 1;
+	}
+	/* TODO: handle GPIOD_ACTIVE_LOW and GPIOD_IS_AF flags */
+
+	return scmi_pinctrl_settings_configure(priv->pin_dev, SCMI_PIN, pin,
+					       cnt / 2, &configs[0]);
+}
+
+static int scmi_gpio_get_value(struct udevice *dev, unsigned int offset)
+{
+	struct scmi_gpio_priv *priv = dev_get_priv(dev);
+	u32 value;
+	int pin;
+	int ret;
+
+	if (offset >= priv->num_pins)
+		return -EINVAL;
+	pin = priv->pins[offset];
+
+	ret = scmi_pinctrl_settings_get_one(priv->pin_dev, SCMI_PIN, pin,
+					    SCMI_PIN_INPUT_VALUE, &value);
+	if (ret) {
+		dev_err(dev, "settings_get_one() failed: %d\n", ret);
+		return ret;
+	}
+
+	return value;
+}
+
+static int scmi_gpio_get_function(struct udevice *dev, unsigned int offset)
+{
+	struct scmi_gpio_priv *priv = dev_get_priv(dev);
+	u32 value;
+	int pin;
+	int ret;
+
+	if (offset >= priv->num_pins)
+		return -EINVAL;
+	pin = priv->pins[offset];
+
+	ret = scmi_pinctrl_settings_get_one(priv->pin_dev, SCMI_PIN, pin,
+					    SCMI_PIN_INPUT_MODE,
+					    &value);
+	if (ret) {
+		dev_err(dev, "settings_get() failed %d\n", ret);
+		return ret;
+	}
+
+	if (value)
+		return GPIOF_INPUT;
+	return GPIOF_OUTPUT;
+}
+
+static const struct dm_gpio_ops scmi_gpio_ops = {
+	.request	= scmi_gpio_request,
+	.rfree		= scmi_gpio_rfree,
+	.set_flags	= scmi_gpio_set_flags,
+	.get_value	= scmi_gpio_get_value,
+	.get_function	= scmi_gpio_get_function,
+};
+
+static int get_pins(struct udevice *dev, u32 function, u32 index, char **f_name,
+		    u16 **pins, u32 *npins)
+{
+	struct scmi_gpio_priv *priv = dev_get_priv(dev);
+	struct pinctrl_scmi_priv *pin_info = dev_get_priv(priv->pin_dev);
+	u32 group;
+
+	if (function >= pin_info->num_functions)
+		return -EINVAL;
+	if (index >= pin_info->function_info[function].num_groups)
+		return -EINVAL;
+	group = pin_info->function_info[function].groups[index];
+	if (group >= pin_info->num_groups)
+		return -EINVAL;
+
+	*f_name = pin_info->function_info[function].name;
+	*pins = pin_info->group_info[group].pins;
+	*npins = pin_info->group_info[group].num_pins;
+
+	return 0;
+}
+
+static int scmi_gpio_probe(struct udevice *dev)
+{
+	struct gpio_dev_priv *uc_priv = dev_get_uclass_priv(dev);
+	struct scmi_gpio_priv *priv = dev_get_priv(dev);
+	struct ofnode_phandle_args args;
+	int ret;
+
+	ret = dev_read_phandle_with_args(dev, "scmi,pinctrl", NULL, 2, 0, &args);
+	if (ret) {
+		dev_err(dev, "failed to read scmi,pinctrl phandle: %d\n", ret);
+		return ret;
+	}
+
+	ret = uclass_get_device_by_ofnode(UCLASS_PINCTRL, args.node, &priv->pin_dev);
+	if (ret) {
+		dev_err(dev, "failed to find pinctrl device: %d\n", ret);
+		return ret;
+	}
+
+	ret = get_pins(dev, args.args[0], args.args[1], &priv->bank_name,
+		       &priv->pins, &priv->num_pins);
+	if (ret) {
+		dev_err(dev, "failed to get pins for %u %u\n", args.args[0], args.args[1]);
+		return ret;
+	}
+
+	uc_priv->bank_name = priv->bank_name;
+	uc_priv->gpio_count = priv->num_pins;
+
+	return 0;
+}
+
+static const struct udevice_id scmi_gpio_match[] = {
+	{ .compatible = "scmi,gpio" },
+	{ }
+};
+
+U_BOOT_DRIVER(scmi_pinctrl_gpio) = {
+	.name	= "scmi_pinctrl_gpio",
+	.id	= UCLASS_GPIO,
+	.of_match = scmi_gpio_match,
+	.probe	= scmi_gpio_probe,
+	.priv_auto = sizeof(struct scmi_gpio_priv),
+	.ops	= &scmi_gpio_ops,
+};
+
-- 
2.51.0

