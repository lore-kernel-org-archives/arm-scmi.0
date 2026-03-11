Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4146335A3A9
	for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 19:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773258103; cv=none; b=iCpBELzxvDtrUFGIUFo/3rKKog8MzD+D3vz09P3wRkENVXNfErETE4Kw4f19aYuz3aC+Tp78164Ec61ySbslH06ZrtqFUBPi2nHBcj3HbVJ8Yf9FbNUYZIcvYLvEwtZkGZL8mBsCxYfxA2nOilcv2EU/YED1/z7Nm6nsUHPHL8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773258103; c=relaxed/simple;
	bh=eeRCCCi+ebr6WcayuC8+lldOtzFi0bxi71gQGKY7YGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FpvRXxZqUii2CSEDeAun/aBZposOZXioF8faaofTQbyd6SAMY3hog0R32KFO9BoeMLpXA89CE/Uwyztlw70btjPdLmj0spe3e5s6IGzt3syTjgBWHkOjzbyYLMd5WwODtKLauio160yeVhZUpLaKwXnwH5LkTkxqOlsll7Wg6sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GPSSc0fi; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GPSSc0fi"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b942424d231so25279666b.0
        for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 12:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773258101; x=1773862901; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p/9LE68KxkYABzINZTuDX5Gb1CyZEZsghTg0XZsMkrU=;
        b=GPSSc0fijkvPREByibqvwUp45Oq3noXPV2B+NccSlcjaWgSbvnWtUziuPZo4hzXS2Z
         ozb/vdmzdF9RqAGRnWKoYMiqF/EfpBovcAI/SXCK9KZxMmDcqFb+H9FO5+4krt1IC6EX
         z7mB1ExQ9ga69JRvEFKuqAIN/MxosudH8odzYjuT0wDyymR+UhzIQpNeNDIgFeKFyYdc
         uQr11L1xvtoti1LObyYqLHMYNPuqi/ExZI+2+c+Yo/S4fjaJAM/67zYeADIrMbSTc/Wi
         hnt7kKDsCGxakem/6r5meSmw+B8RxPIdOuAp3+Lj8FhVMJ3r1R99m6j0Y7bAJHz206Pt
         j6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773258101; x=1773862901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/9LE68KxkYABzINZTuDX5Gb1CyZEZsghTg0XZsMkrU=;
        b=ZrEPiHNJYJWvixBMbEI7LkOvyoPOWWXWGSXe70ucqkvKlhUMX5ngh93LyjlaqJ3tmf
         tLdl0agxZglbe6QIGeeLNenz7vz/AcdXjlvhdKJo7AmU8gYnBbxNgR16+bIe01odZZsr
         xuACPrtzDsPQxDB/wj6s8rKrAY5wkRm4/pcDyXJ/SwvuSKqVmJdal8sqSl+0WUL1IpjT
         VjoY623tTOK2U3d4t2GxSsJj/XujfpX72M42g5DpqxUiRuCW/oMrwd0d/WoBLEcIU6wI
         oEffve5NWuso4nBp2/DaNUQb+6AeAOOQgzZWb0fLcMJZ/+cStNI3Ph2eseyk/fB48xxV
         khfw==
X-Forwarded-Encrypted: i=1; AJvYcCVYmT4N9vDNQm8PGWjzcQXenuNVu6UCIjontHC6/Y0/TACilctQcXTIk1cJT/czhOIWWHG/zb8Ktg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh3mSTy1EexBD3DSnqnDIMP3ITwC5s9l5Z/JZ4C/3Ao+2LFZFp
	/J393R0w/BnVJLrSC1S7q+IapL5yDL+dCDMqqxuicwYOFcFdhwrIKKzo/ByoXLME/pA=
X-Gm-Gg: ATEYQzx+C7VqC6sq60Dx8m4jiVMmOQrot3LmNtXKcuCuS+bV7zC+bjQ0GdZOImFA2Dj
	UIbLE/OMJw/yO2lplSrpD7Qu/S4c7MuChOJrpdWLPA7oAqAuoTIFVgFL0ysol0k41JVTdzsE2VJ
	T5GbYclYCjqD0YY4v/5C3l5pXx+0Q6HgMhpljHzCfALtl5MpWS58rhXPSoacjBqz9FECbCBSPF2
	VnSSL6hq01VKnm8G9d2CFcpA7fU0bFPBGjXAu/FYHA+6il/z0otVm4ro1X7DJMyIlaYhJUYDhEL
	tu8vsnWNHqHwAMo7ec+KsvQy56ovHDgu4/dh9befHAzy0a/s3gO/l/MYHISJGeerbz6YZ8nu+vl
	ADH1cTD+BtQoMlqjyRz+JeBJw4u7pl2Oj0Qo6F/b/JKCWyGXrDTqzmv16Y/+J42Nz4I89Hwsase
	Sa+CRdgAtwmwMAZrrmgm3NT0JC+dp2e0P5VwA0jKM=
X-Received: by 2002:a17:907:1c88:b0:b8f:a0e6:b261 with SMTP id a640c23a62f3a-b972e5a7ea1mr225237966b.39.1773258100523;
        Wed, 11 Mar 2026 12:41:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972e185290sm76354966b.49.2026.03.11.12.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:41:39 -0700 (PDT)
Date: Wed, 11 Mar 2026 22:41:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tom Rini <trini@konsulko.com>, AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Peng Fan <peng.fan@nxp.com>, Greg Malysa <malysagreg@gmail.com>,
	Utsav Agarwal <utsav.agarwal@analog.com>,
	Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
	Ian Roberts <ian.roberts@timesys.com>,
	Oliver Gaskell <Oliver.Gaskell@analog.com>,
	Yegor Yefremov <yegorslists@googlemail.com>,
	Philip Molloy <philip.molloy@analog.com>,
	Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
	Eoin Dickson <eoin.dickson@microchip.com>,
	Arturs Artamonovs <arturs.artamonovs@analog.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tanmay Kathpalia <tanmay.kathpalia@altera.com>,
	u-boot@lists.denx.de, Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	arm-scmi@vger.kernel.org, linux-gpio@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v2 4/4] gpio: scmi: Add gpio_scmi driver
Message-ID: <f8e1dcb617917dfe69efce0b3407f8786e4c971d.1773256350.git.dan.carpenter@linaro.org>
References: <cover.1773256350.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1773256350.git.dan.carpenter@linaro.org>

This provides GPIO support over SCMI.  It is built on top of the
pinctrl-scmi driver.  The device tree entry would work the same as
in linux.  Perhaps something like this.

        gpio1 {
            compatible = "scmi-pinctrl-gpio";
            gpio-controller;
            #gpio-cells = <2>;
            ngpios = <10>;
            gpio-ranges = <&scmi_pinctrl 0 8 4>,
                          <&scmi_pinctrl 4 12 1>,
                          <&scmi_pinctrl 5 15 1>,
                          <&scmi_pinctrl 6 17 4>;
            pinctrl-names = "default";
            pinctrl-0 = <&i2c2_pins>;
        };

The &i2c2_pins phandle from the pinctrl section does pin muxing
and the gpio-ranges property describes the pins.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: In the device tree, it should use gpio-ranges to configure the
    GPIOs.  I invented something non-standard in v1.  Fixed now.

 drivers/gpio/Kconfig     |   6 +
 drivers/gpio/Makefile    |   1 +
 drivers/gpio/gpio_scmi.c | 248 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 255 insertions(+)
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
index 000000000000..63842756c9a3
--- /dev/null
+++ b/drivers/gpio/gpio_scmi.c
@@ -0,0 +1,248 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2026 Linaro Ltd.
+ */
+
+#include <asm/gpio.h>
+#include <dm.h>
+#include <dm/device_compat.h>
+#include <dm/devres.h>
+#include <linux/list.h>
+#include <scmi_protocols.h>
+
+struct scmi_gpio_range {
+	u32 base;
+	u32 offset;
+	u32 npins;
+	struct list_head list;
+};
+
+static int bank_cnt;
+
+struct scmi_gpio_priv {
+	struct udevice *pin_dev;
+	struct list_head gpio_ranges;
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
+static int scmi_gpio_probe(struct udevice *dev)
+{
+	struct gpio_dev_priv *uc_priv = dev_get_uclass_priv(dev);
+	struct scmi_gpio_priv *priv = dev_get_priv(dev);
+	struct ofnode_phandle_args args;
+	struct scmi_gpio_range *range;
+	int index = 0;
+	int ret, i;
+
+	INIT_LIST_HEAD(&priv->gpio_ranges);
+
+	for (;; index++) {
+		ret = dev_read_phandle_with_args(dev, "gpio-ranges",
+						 NULL, 3, index, &args);
+		if (ret)
+			break;
+
+		if (index == 0) {
+			ret = uclass_get_device_by_ofnode(UCLASS_PINCTRL,
+							  args.node,
+							  &priv->pin_dev);
+			if (ret) {
+				dev_err(dev, "failed to find pinctrl device: %d\n", ret);
+				return ret;
+			}
+		}
+
+		range = devm_kmalloc(dev, sizeof(*range), GFP_KERNEL);
+		if (!range)
+			return -ENOMEM;
+
+		range->base = args.args[0];
+		if (range->base != priv->num_pins) {
+			dev_err(dev, "no gaps allowed in between pins %d vs %d\n",
+				priv->num_pins, range->base);
+			return -EINVAL;
+		}
+		range->offset = args.args[1];
+		range->npins = args.args[2];
+		priv->num_pins += args.args[2];
+		list_add_tail(&range->list, &priv->gpio_ranges);
+	}
+
+	if (priv->num_pins == 0) {
+		dev_err(dev, "failed to registier pin-groups\n");
+		return -EINVAL;
+	}
+
+	priv->pins = devm_kzalloc(dev, priv->num_pins * sizeof(u16), GFP_KERNEL);
+	if (!priv->pins)
+		return -ENOMEM;
+
+	list_for_each_entry(range, &priv->gpio_ranges, list) {
+		for (i = 0; i < range->npins; i++)
+			priv->pins[range->base + i] = range->offset + i;
+	}
+
+	ret = snprintf(NULL, 0, "gpio_scmi%d_", bank_cnt);
+	uc_priv->bank_name = devm_kzalloc(dev, ret + 1, GFP_KERNEL);
+	if (!uc_priv->bank_name)
+		return -ENOMEM;
+	snprintf(uc_priv->bank_name, ret + 1, "gpio_scmi%d_", bank_cnt);
+	bank_cnt++;
+
+	uc_priv->gpio_count = priv->num_pins;
+
+	return 0;
+}
+
+static const struct udevice_id scmi_gpio_match[] = {
+	{ .compatible = "scmi-pinctrl-gpio" },
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

