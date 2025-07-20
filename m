Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57572253F2
	for <arm-scmi@vger.kernel.org>; Sun, 20 Jul 2025 19:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753040351; cv=none; b=IPvHQKzTuguIeFtLvOEjWpi1L8ExukGTmPQ8tSljk4tIwyFrPAQF0tYUB2xzI9TIRAJUoenOGS8dtk6T6XjQJKIiGWf0a4G2qLd20yuvJMFrDTFuDGau/lUWoXngv/u7sL12OLHgq1QY2/PrxXG2qF6A2PcZnxl0RhVKLKclq7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753040351; c=relaxed/simple;
	bh=iDtvHuWeWWAvaDrc1D90AZ0sVF5gJEyOSaBvzWOZYBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TDd+lvSdCNv01E/feUhNTywA8RCO+f4KllgeAyQb8U8k6duUcAVFWNvAtkK4XcwEdZXw4iKvzLaTkv/y/j3qPjNTGAYu3o3c3jXYyhsWfvtgbTpOG4Krpz2Wrgfu1CVcemfXVPiwZBHh8CtvdtnmWjRPmd3wvllTubSopf8Gc5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ct66e4xf; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ct66e4xf"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-41b357ba04fso1629644b6e.2
        for <arm-scmi@vger.kernel.org>; Sun, 20 Jul 2025 12:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753040348; x=1753645148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TzWMDQiQhqKDucj4xDCvdrZWSeCpiJ1tZaaA5u2Est8=;
        b=ct66e4xfWyBumlCu9mdkTKmo7lpkX7txgrmlVNZocTJPFVh1tbH2hrQ3S/PXrb7DwT
         QGyA0vqLPgWwF4RnWlo3sqZQy5/bVeuuOKFFiMc/atQk3ceL8V3fvuBkMhJVTPZAhRCe
         AGt6WU6GLn8m2MjevlH931ZIwKjIVEF7bsXFkxR4i/NjAcCXSqHVBDZiQ/LbDR3Vh6PR
         8Bt+9Ip0ENszW2iSzjkr7ssszsixlbxdSOu8TZpWTAbbD9o32EGg5wVdF0N3zBzLJCHT
         DAMTTkHaiKUNHnOZocAULkPweHjDu0oy717DVCPYceU6FViqGgffPzWwKzyNMtf3f+3q
         95aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753040348; x=1753645148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzWMDQiQhqKDucj4xDCvdrZWSeCpiJ1tZaaA5u2Est8=;
        b=iTSzwhnlK0cNhiQBO3+U6Tmxv9eQ/a8ClpfuVyV3AG6pfqd5iUmSS3Q/ulkb3ZUW7D
         4JJbUssGn2yw0okVy5z9Bud/iMA/qtsCw9k5LYmC+T1EwXNi4zX1eReEUHSHRYIVCqsc
         lgeDKis36/r1nIXwScRy5/p1w24qqW6baNnzMjmAiO3/cko858O5ZxPpt9cUz4AvhBzr
         IIDr8W/8lnBBstdhuYOfPWI8crttC/w7VAn5Eb2fYRVQx/PfS+p7CrBkC+CphlzSlgN3
         S2zxdQQ4oYswW+0l6gX6CS+YIIpq3JI13Z7pRuD4kFHQg+O7OzCQa6iQaXyXgrcxPZeR
         LyxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoP5FZAliurTXSJjeIGjVKR1swx73m/9FY/LXOgK16MclJsPS00MQKtwaH8SunVFE7WPhIQr163A==@vger.kernel.org
X-Gm-Message-State: AOJu0YytVnrK8LBVt4NDZ/J7rIcytGm8I92kDikaSKg7IGu9CJ8pFpDe
	xqQZHs+J8Z20BqQvCToYv/VjHNIWfiUqiDpJAcbS/xMRCQUbj4oL3xTHjY3dHd5fI6Q=
X-Gm-Gg: ASbGncs9MSOT2wcD4ARzYDAwuy2t5QJmwHsvs5RweX2veAZMI0yCMiQB24wqZzwE5I4
	gNtFhs/vKmvZY3JH8jLRBXL0A6huZ/iZscoTUPGZXmnFgl0cDMTS4PyBqNQQDtjoIZnLFQpyGxB
	ZH34MKmqz8RDYg5aeagoCFNhJdO6fBLErkO25oDdOe85LckrsuMfPNVleTICbe0kgFhSiC5Q/Tq
	seiocpHuQQgC/v2wUBOLcJFMZHejpPWOXaB0qmBYjbVVralNlCJvhv3iMjCUqjLMKTuiFf5lmRj
	IWB89n0w8wvjVjfqQi/TcbkOiO/JiTZs32AXpTfhk6OLh9p7eUXHFiz2l9LGKILZZasToU/XLNg
	90BNmwC9Mfqs=
X-Google-Smtp-Source: AGHT+IHG0eQajqarHbENrvaixxkoziriMrVyGz1oaBStUnyceEv9srArOzG9hJaXtUODGRIJ4Pm6Aw==
X-Received: by 2002:a05:6808:3a15:b0:40a:533c:c9cb with SMTP id 5614622812f47-41d05654bcdmr12175951b6e.38.1753040347679;
        Sun, 20 Jul 2025 12:39:07 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::1fec])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-41fd498c1cbsm1799638b6e.27.2025.07.20.12.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 12:39:06 -0700 (PDT)
Date: Sun, 20 Jul 2025 14:39:04 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH RFC v2 6/7] pinctrl-scmi: Add GPIO support
Message-ID: <bd79aa90-73f7-4d7b-a340-539b52a73bcf@sabinyo.mountain>
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

This adds GPIO support to the SCMI pin controller driver.  It's an RFC
patch because I'm not really sure how these are used and so I don't
know how they should be configured via devicetree.  I've labeled the
places where I think devicetree configuration would go with a FIXME.

This driver was based on work from Takahiro AKASHI.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/core.c         |   8 +-
 drivers/pinctrl/pinctrl-scmi.c | 206 ++++++++++++++++++++++++++++++++-
 2 files changed, 207 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index bbcc6881b119..91882c68bcd5 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -947,7 +947,6 @@ EXPORT_SYMBOL_GPL(pinctrl_gpio_set_config);
 int pinctrl_gpio_get_config(struct gpio_chip *gc, unsigned int offset, unsigned long *config)
 {
 	struct pinctrl_gpio_range *range;
-	const struct pinconf_ops *ops;
 	struct pinctrl_dev *pctldev;
 	int ret, pin;
 
@@ -955,19 +954,16 @@ int pinctrl_gpio_get_config(struct gpio_chip *gc, unsigned int offset, unsigned
 	if (ret)
 		return ret;
 
-	ops = pctldev->desc->confops;
-	if (!ops || !ops->pin_config_get)
-		return -EINVAL;
-
 	mutex_lock(&pctldev->mutex);
 	pin = gpio_to_pin(range, gc, offset);
-	ret = ops->pin_config_get(pctldev, pin, config);
+	ret = pin_config_get_for_pin(pctldev, pin, config);
 	mutex_unlock(&pctldev->mutex);
 
 	if (ret)
 		return ret;
 
 	*config = pinconf_to_config_argument(*config);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(pinctrl_gpio_get_config);
diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index fba0a3a2fc10..9a947ced0df7 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -6,6 +6,7 @@
  * Copyright 2024 NXP
  */
 
+#include <linux/bitmap.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/errno.h>
@@ -16,6 +17,9 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
+#include <linux/gpio/driver.h>
+
+#include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/machine.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinconf-generic.h>
@@ -42,6 +46,7 @@ struct scmi_pinctrl {
 	unsigned int nr_functions;
 	struct pinctrl_pin_desc *pins;
 	unsigned int nr_pins;
+	struct gpio_chip *gc;
 };
 
 static int pinctrl_scmi_get_groups_count(struct pinctrl_dev *pctldev)
@@ -505,6 +510,197 @@ static int pinctrl_scmi_get_pins(struct scmi_pinctrl *pmx,
 	return 0;
 }
 
+static int pinctrl_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
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
+static int pinctrl_gpio_direction_output_wrapper(struct gpio_chip *gc,
+						 unsigned int offset, int val)
+{
+	return pinctrl_gpio_direction_output(gc, offset);
+}
+
+static int pinctrl_gpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	unsigned long config;
+	int ret;
+
+	config = PIN_CONFIG_INPUT_VALUE;
+	ret = pinctrl_gpio_get_config(gc, offset, &config);
+	if (ret)
+		return ret;
+
+	return config;
+}
+
+static void pinctrl_gpio_set(struct gpio_chip *gc, unsigned int offset, int val)
+{
+	unsigned long config;
+
+	config = PIN_CONF_PACKED(PIN_CONFIG_OUTPUT, val);
+	pinctrl_gpio_set_config(gc, offset, config);
+}
+
+static int pinctrl_gc_to_func(struct gpio_chip *gc)
+{
+	struct scmi_pinctrl *pmx = gpiochip_get_data(gc);
+
+	return (gc - pmx->gc);
+}
+
+static int gpio_add_pin_ranges(struct gpio_chip *gc)
+{
+	struct scmi_pinctrl *pmx = gpiochip_get_data(gc);
+	const char * const *p_groups;
+	unsigned int n_groups;
+	int func = pinctrl_gc_to_func(gc);
+	const unsigned int *pins;
+	unsigned int n_pins;
+	int offset = 0;
+	int group;
+	int ret;
+
+	ret = pmx->pctl_desc.pmxops->get_function_groups(pmx->pctldev, func, &p_groups, &n_groups);
+	if (ret)
+		return ret;
+
+	// FIXME: fix the correct group from the device tree
+	for (group = 0; group < n_groups; group++) {
+		ret = pinctrl_get_group_pins(pmx->pctldev, p_groups[group], &pins, &n_pins);
+		if (ret)
+			return ret;
+
+		ret = gpiochip_add_pingroup_range(gc, pmx->pctldev, offset, p_groups[group]);
+		if (ret)
+			return ret;
+
+		offset += n_pins;
+	}
+
+	return 0;
+}
+
+static int get_nr_pins_in_function(struct scmi_pinctrl *pmx, int func)
+{
+	const char * const *pin_groups;
+	unsigned int n_groups;
+	const unsigned int *pins;
+	unsigned int n_pins;
+	int total = 0;
+	int i, ret;
+
+	// FIXME: get the correct number of gc.ngpio
+	// Find the right group from the device tree
+	ret = pmx->pctl_desc.pmxops->get_function_groups(pmx->pctldev, func, &pin_groups, &n_groups);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < n_groups; i++) {
+		ret = pinctrl_get_group_pins(pmx->pctldev, pin_groups[i], &pins, &n_pins);
+		if (ret)
+			return ret;
+		total += n_pins;
+	}
+
+	return total;
+}
+
+static int register_scmi_pinctrl_gpio_handler(struct device *dev, struct scmi_pinctrl *pmx)
+{
+	struct fwnode_handle *gpio = NULL;
+	int ret, i;
+
+	gpio = fwnode_get_named_child_node(dev->fwnode, "gpio");
+	if (!gpio)
+		return 0;
+
+	pmx->gc = devm_kcalloc(dev, pmx->nr_functions, sizeof(*pmx->gc), GFP_KERNEL);
+	if (!pmx->gc)
+		return -ENOMEM;
+
+	for (i = 0; i < pmx->nr_functions; i++) {
+		const char *fn_name;
+
+		ret = pinctrl_ops->is_gpio(pmx->ph, i, FUNCTION_TYPE);
+		if (ret < 0)
+			return ret;
+		if (ret == false)
+			continue;
+
+		ret = pinctrl_ops->name_get(pmx->ph, i, FUNCTION_TYPE, &fn_name);
+		if (ret)
+			return ret;
+
+		pmx->gc[i].label = devm_kasprintf(dev, GFP_KERNEL, "%s", fn_name);
+		if (!pmx->gc[i].label)
+			return -ENOMEM;
+
+		pmx->gc[i].owner = THIS_MODULE;
+		pmx->gc[i].get = pinctrl_gpio_get;
+		pmx->gc[i].set = pinctrl_gpio_set;
+		pmx->gc[i].get_direction = pinctrl_gpio_get_direction;
+		pmx->gc[i].direction_input = pinctrl_gpio_direction_input;
+		pmx->gc[i].direction_output = pinctrl_gpio_direction_output_wrapper;
+		pmx->gc[i].add_pin_ranges = gpio_add_pin_ranges;
+
+		// FIXME: verify that this is correct
+		pmx->gc[i].can_sleep = true;
+
+		ret = get_nr_pins_in_function(pmx, i);
+		if (ret < 0)
+			return ret;
+		pmx->gc[i].ngpio = ret;
+
+		pmx->gc[i].parent = dev;
+		pmx->gc[i].base = -1;
+	}
+
+	return 0;
+}
+
+static int scmi_gpiochip_add_data(struct device *dev, struct scmi_pinctrl *pmx)
+{
+	int ret;
+	int i;
+
+	for (i = 0; i < pmx->nr_functions; i++) {
+		ret = pinctrl_ops->is_gpio(pmx->ph, i, FUNCTION_TYPE);
+		if (ret < 0)
+			return ret;
+		if (ret == false)
+			continue;
+
+		ret = devm_gpiochip_add_data(dev, &pmx->gc[i], pmx);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static const char * const scmi_pinctrl_blocklist[] = {
 	"fsl,imx95",
 	"fsl,imx94",
@@ -559,7 +755,15 @@ static int scmi_pinctrl_probe(struct scmi_device *sdev)
 	if (!pmx->functions)
 		return -ENOMEM;
 
-	return pinctrl_enable(pmx->pctldev);
+	ret = register_scmi_pinctrl_gpio_handler(dev, pmx);
+	if (ret)
+		return ret;
+
+	ret = pinctrl_enable(pmx->pctldev);
+	if (ret)
+		return ret;
+
+	return scmi_gpiochip_add_data(dev, pmx);
 }
 
 static const struct scmi_device_id scmi_id_table[] = {
-- 
2.47.2

