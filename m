Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B10A317173
	for <arm-scmi@vger.kernel.org>; Thu, 26 Mar 2026 12:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774526913; cv=none; b=s1ATlTQ3s3exNhWHCRfD8wfPDewo0clsP9SOvR5uKfrYLJtZoVxj9mcX6qwE0lkICDDRfBB+OIyCDI1oOdy0nrxRodVzgiNohNVCptx9lJCXAPaPzscVfeEdE65UyFNJ16+yY5tKATFqj/Myt03L394Rjs9/TLusvUpET+z79eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774526913; c=relaxed/simple;
	bh=vXzGRf7flpCi/ARQlkQqT4mm42OKj4OL6jLzS/H6W7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FODYfK8/NFJxXNmzDcqhSFE5CpqnArhqE8XNAVr8hV/bmz1IhLGhLv1l0UjaQAC2uBqmRzZaNBU6ganpePe0d/K5euiw47TXDvZcS5XOpbpKDU3KivlERpY7DJlfC+NoghSQSJjDXxbseVqN/06tp6fXjyf1hwUtSQxghzyUIBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a18rBeqr; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a18rBeqr"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-483487335c2so10221965e9.2
        for <arm-scmi@vger.kernel.org>; Thu, 26 Mar 2026 05:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774526909; x=1775131709; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G/PAU7Ix1+nnfYVd+6n5LSymV23ji6LbgTx1i6i6WXQ=;
        b=a18rBeqriPrbwwozPfZGQ+/vbfA7SLvsMmU5UE2sSLUGUZxp/bwLmxgIlaguc3BXhf
         z5yn14t4LWrESeGcEGkUor7T5PfOfQSWGXBGs9JOn4Ut4cP2cY8f3IPd3yU/gdq4qniH
         Qyls7B5AyTTmGNRYCKfSezizBSuLbs0ur28l6vvf8uZ77CYLPRl5FM8IhG+8FFPuMChA
         DjCUJjrkSFNgFHRhPjh21TtDmvnQo224KIzSexu7Rks8Y/cNc1DfZLuW80sH/kuOnQD6
         653p7J33FOBIby+K6Av/tJrC78cOZQIJx/FqTanrQUdHavWVlmGoDg9qtby838k4XN09
         TwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774526909; x=1775131709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G/PAU7Ix1+nnfYVd+6n5LSymV23ji6LbgTx1i6i6WXQ=;
        b=GJpP806DYxawyz571HV4XwbSAJchi1RJZz02P1JfTzLc6RDB9ihRNo92lOdltcti4I
         XFiZzVxPVaCcgVoF0C+CXoYNot6MUPdXsEds6hVZudf8lJqs9/WD1+pbGHjbo1UXge9P
         qp67l25blHvbtd7oYiJUcUUPqBC9s2j1P54YYqCh+vMvUDarePFfSG4a9jhNcpzJYS2i
         PIfhs64ctnO3C3un7F5tzuikFBqIeNj/6KlY4zCs5nOAy/JTLtmUA2iaxMk4BJ8Vl4R8
         vwXvJf3H40tQKyk4tYxp8jIgxu1nMr3udBnVUZEASNSm9yCtcB1YGxI5SmBJHsqovnb5
         2o0g==
X-Forwarded-Encrypted: i=1; AJvYcCWsIvcvAeCudLVqJGxuy1xm/2ExKtKClsmXmYii/oyDJByHKji/sD9qxM4PhHHR64mn7ya9AEn2xQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpspyK6KK49PzOsUbLHXudzakXMuLAZZ/xAb5Ebj2j7/PejnRx
	A0JPINDkcG9Of+I19CkRkffYfUMYzCFFzv3zixL4mbaD9uqASyFVuIBR/DT265kWVyw=
X-Gm-Gg: ATEYQzzPpckCW5Rbq5B5rkSbjI1owjaYlkMsn6WnbQzSBXIqwuR34VjwDp8my8QWnI7
	++Dd/qMtZCkD0Lz4Hkn4OlyPzqgZCRFKMKOiWqFZTNwO3h9xs92bapriMpei0YcQElpCMSCGZLR
	UVJqSuDpDFIN4B6eNeyOxnUK6BeFqdQ7v6T46LsYDprpwgXYgNrortNnrM4hgma4wDGxxtGf0wg
	uHxsShdBF/nCCogc/qJAKJyMDGmLcXl3SfesQeWnJhzjLhiEhuTW4v54ZSlPBjFxNErCHv36Ofb
	C5JqyNw/FKzhaWCl8ppbORxStJcfNlW8ZwDMXyfAVbsWLn0DjT0+aNkIKUspmx6POIEheU77qqL
	kqlFZdXY6+nO8RVJMembLve7FhwiUTmU+llmu46Mdsf6paK1fDAzwpeIkMMDhxbVZL6Y7kKESHP
	dW4TuEDDoOVmNS+VD+HJN/OgpS+g1B
X-Received: by 2002:a05:600c:3b12:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-48715fc3677mr108318935e9.5.1774526908928;
        Thu, 26 Mar 2026 05:08:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722ca344dsm22710405e9.12.2026.03.26.05.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 05:08:28 -0700 (PDT)
Date: Thu, 26 Mar 2026 15:08:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Michal Simek <michal.simek@amd.com>, arm-scmi@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH 2/2] pinctrl: scmi: Use standard device tree pin muxing format
Message-ID: <46f9b46210436e73d17a866424a00529439ce1ba.1774526652.git.dan.carpenter@linaro.org>
References: <cover.1774526652.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1774526652.git.dan.carpenter@linaro.org>

In the original code, I wrote a custom pin muxing parser but the
upstream device trees wouldn't accept something like that so it would
have complicated mergine the device tree files.

Use the standard device tree format with function and groups:

	pinmux1: pinmux1 {
		function = "f_gpio1";
		groups = "grp_1", "grp_3";
	};

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/pinctrl-scmi.c | 151 ++++++++++++---------------------
 1 file changed, 54 insertions(+), 97 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 63d4f8ffeb54..fa31b573f31e 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -33,20 +33,6 @@ static const struct pinconf_param pinctrl_scmi_conf_params[] = {
 	/* The SCMI spec also include "default", "pull-mode" and "input-value */
 };
 
-static bool valid_selector(struct udevice *dev, enum select_type select_type, u32 selector)
-{
-	struct pinctrl_scmi_priv *priv = dev_get_priv(dev);
-
-	if (select_type == SCMI_PIN)
-		return selector < priv->num_pins;
-	if (select_type == SCMI_GROUP)
-		return selector < priv->num_groups;
-	if (select_type == SCMI_FUNCTION)
-		return selector < priv->num_functions;
-
-	return false;
-}
-
 static int pinctrl_scmi_get_pins_count(struct udevice *dev)
 {
 	struct pinctrl_scmi_priv *priv = dev_get_priv(dev);
@@ -98,6 +84,38 @@ static const char *pinctrl_scmi_get_function_name(struct udevice *dev, unsigned
 	return (const char *)priv->function_info[selector].name;
 }
 
+static int pinctrl_scmi_get_function_id(struct udevice *dev, const char *function)
+{
+	struct pinctrl_scmi_priv *priv = dev_get_priv(dev);
+	int i;
+
+	if (!function)
+		return -EINVAL;
+
+	for (i = 0; i < priv->num_functions; i++) {
+		if (strcmp(priv->function_info[i].name, function) == 0)
+			return i;
+	}
+
+	return -EINVAL;
+}
+
+static int pinctrl_scmi_get_group_id(struct udevice *dev, const char *group)
+{
+	struct pinctrl_scmi_priv *priv = dev_get_priv(dev);
+	int i;
+
+	if (!group)
+		return -EINVAL;
+
+	for (i = 0; i < priv->num_groups; i++) {
+		if (strcmp(priv->group_info[i].name, group) == 0)
+			return i;
+	}
+
+	return -EINVAL;
+}
+
 static int pinctrl_scmi_pinmux_set(struct udevice *dev, u32 pin, u32 function)
 {
 	struct pinctrl_scmi_priv *priv = dev_get_priv(dev);
@@ -120,96 +138,35 @@ static int pinctrl_scmi_pinmux_group_set(struct udevice *dev, u32 group, u32 fun
 
 static int pinctrl_scmi_set_state(struct udevice *dev, struct udevice *config)
 {
-	struct pinctrl_scmi_priv *priv = dev_get_priv(dev);
-	/* batch the setup into 20 lines at a go (there are 5 u32s in a config) */
-	const int batch_count = 20 * 5;
-	u32 prev_type = -1u;
-	u32 prev_selector;
-	u32 *configs;
-	const u32 *prop;
-	int offset, cnt, len;
-	int ret = 0;
-
-	prop = dev_read_prop(config, "pinmux", &len);
-	if (!prop)
-		return 0;
-
-	if (len % sizeof(u32) * 5) {
-		dev_err(dev, "invalid pin configuration: len=%d\n", len);
-		return -FDT_ERR_BADSTRUCTURE;
-	}
-
-	configs = kcalloc(batch_count, sizeof(u32), GFP_KERNEL);
-	if (!configs)
-		return -ENOMEM;
-
-	offset = 0;
-	cnt = 0;
-	while (offset + 4 < len / sizeof(u32)) {
-		u32 select_type  = fdt32_to_cpu(prop[offset]);
-		u32 selector     = fdt32_to_cpu(prop[offset + 1]);
-		u32 function     = fdt32_to_cpu(prop[offset + 2]);
-		u32 config_type  = fdt32_to_cpu(prop[offset + 3]);
-		u32 config_value = fdt32_to_cpu(prop[offset + 4]);
-
-		if (select_type > SCMI_GROUP ||
-		    !valid_selector(dev, select_type, selector) ||
-		    (function != SCMI_PINCTRL_FUNCTION_NONE &&
-		     function > priv->num_functions)) {
-			dev_err(dev, "invalid pinctrl data (%u %u %u %u %u)\n",
-				select_type, selector, function, config_type,
-				config_value);
-			ret = -EINVAL;
-			goto free;
-		}
+	int function_id, group_id;
+	const char *function;
+	const char **groups;
+	int group_count;
+	int ret;
+	int i;
 
-		if (function != SCMI_PINCTRL_FUNCTION_NONE) {
-			if (cnt) {
-				ret = scmi_pinctrl_settings_configure(dev,
-								      prev_type,
-								      prev_selector,
-								      cnt / 2, configs);
-				if (ret)
-					goto free;
-				prev_type = -1u;
-				cnt = 0;
-			}
-			scmi_pinctrl_set_function(dev, select_type, selector, function);
-			offset += 5;
-			continue;
-		}
+	ret = dev_read_string_index(config, "function", 0, &function);
+	if (ret)
+		return ret;
 
-		if (cnt == batch_count)
-			goto set;
+	function_id = pinctrl_scmi_get_function_id(dev, function);
+	if (function_id < 0)
+		return function_id;
 
-		if (prev_type == -1u)
-			goto store;
+	group_count = dev_read_string_list(config, "groups", &groups);
+	if (group_count < 0)
+		return group_count;
 
-		if (select_type == prev_type && selector == prev_selector)
-			goto store;
-set:
-		ret = scmi_pinctrl_settings_configure(dev, prev_type, prev_selector,
-						      cnt / 2, configs);
+	for (i = 0; i < group_count; i++) {
+		group_id = pinctrl_scmi_get_group_id(dev, groups[i]);
+		if (group_id < 0)
+			return group_id;
+		ret = pinctrl_scmi_pinmux_group_set(dev, group_id, function_id);
 		if (ret)
-			goto free;
-		cnt = 0;
-store:
-		prev_type = select_type;
-		prev_selector = selector;
-		configs[cnt++] = config_type;
-		configs[cnt++] = config_value;
-		offset += 5;
+			return ret;
 	}
 
-	if (cnt)
-		ret = scmi_pinctrl_settings_configure(dev, prev_type, prev_selector,
-						      cnt / 2, configs);
-free:
-	kfree(configs);
-	if (ret)
-		dev_err(dev, "set_state() failed: %d\n", ret);
-
-	return ret;
+	return 0;
 }
 
 static int get_pin_muxing(struct udevice *dev, unsigned int selector,
-- 
2.53.0

