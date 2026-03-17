Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C5F3E9280
	for <arm-scmi@vger.kernel.org>; Tue, 17 Mar 2026 14:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758426; cv=none; b=lpQ6/vrZu4INy6fOsESLnlrne3vFBMb8cLHb4oN0qAmIZHxTvtF+Tzptjz80/EqnD6rO8TneD9XtjHPG355EwE2j5tqoGEspBvyj0OnKUu1wZ6MM5QuLJQl7yojLNa43ShzNsJXbgP3/i/KP8uVNHMCgTrW/nNZgzYULKJVSJf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758426; c=relaxed/simple;
	bh=sAqcKE1H4LvY4c7Uzu1qPTby3TB7ONcDP1VFe170Rx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f9X4ERoSaejJEZB2Lij73wICiUv9zG1PHZz2FzUT/EMmaxo/5HFgteXEi3e+oJ+OM9bIp9fDStou3QJ9REhc6pUejMGNWDeemAnCitnkmT40ssph4+VoXyVlqUGZRWUo3VI/KhgUszfAPWtCxcD1dNGw3V6KT4PZGcgKVCj4Y+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XNqqASlm; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XNqqASlm"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-666f646f5cfso1431342a12.1
        for <arm-scmi@vger.kernel.org>; Tue, 17 Mar 2026 07:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773758424; x=1774363224; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2+fQoQ+vF5CdSNMBB1zSa6qM/etn5/C5493AMpwpaSI=;
        b=XNqqASlmc4xPyRE1WFKOLhXiEJylXnAmZV3q3uKo2j8Gh7hVOq/LVgVydN/Af5Odjf
         cknoi79zCQ1ACetpaCPho2IngGwLVgas3WJ1zH8IcSvQfVK0x3Ye0fsn+Aw9O9ipDu52
         zaroZ/w4+aRibU0gCulLN5R8WzQ5+Xj5tBKmSNJHHc6vgimv7wQf2Xe2RbfWdQOmfBV4
         MsmPXjm3tmNOM+kMxkhhZ6lMZZQnxgOU8+5YTd8rFgzJR0ihSYH0ZuiPV96PyFYN70Uh
         la8UR0oFSppdrHKlatwYt0GBIrThm+O18+v7d4oEW7hvzAf9a6NrnIhj5gC8/rpegpGD
         WoAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773758424; x=1774363224;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+fQoQ+vF5CdSNMBB1zSa6qM/etn5/C5493AMpwpaSI=;
        b=ZYaI+V0+08/MLy9mR71taiPylGZT7FDwbeQGl5n3ZOj/Wyjx2LNLH3l2bJO4knNlWd
         SusACxkSSifFnFNrEAZzKR1Rm3RKdy6ExnWTXV/Pms6CPSoDiJL0UndSRvTpJmJ1xTLY
         9qD3YazaIFvOlT8h6og+MdkYN1xKghvwwNpi+CEJum6Jjbzhj0uFW3fhpfvCBGLAScav
         npkv91dWPTEdSOyq1PIOsHSllXugHwcQkvYWixNQjUWoMU0bG3rrpdmnUXYVF81SC2C1
         bE5knPKzbC/Ra8NI+XpYwIzjWWh+JLLA9aDoLzbOZ8lRqkPQ2vPs12NdDWAR07upOg3+
         yfaA==
X-Forwarded-Encrypted: i=1; AJvYcCV51RXfF6yJ0p3gZJ0iggF7wUeim3pXWYUoNxIgl5SVNZl4e5aXkArnCeGj0HHyxIILQy2FJKSukg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFYg5EyfESmCquxdtvKTQdTRpr+00blYCgQ7WNQn8ADgSaCP5q
	WLNQAKhbYPBuB0nAXSYijKEkVpxm8Zv1XJIgNDEPzQN+DPgaZia1f3qhd9s089UoQJo=
X-Gm-Gg: ATEYQzwwUaMEnHjj8kixC8j3sZtEkUWH5DbvWIKlzF/DXmoLvnvqaMyk9jeyrdp8d/f
	yAONQ8ZkJvn9QdYE0QRZ2Kf6AE+19/Pn02W7ACKw06I2sSEHtOmMy9OmzH8Hy5C1WktBL0jzcSv
	bCY5k3nS43kU9whjjEEnYrI407eGjP6/MLg5wn8kXWY0VPAVlthVdDo1DmW8Syg6ZDusZ4X0NGK
	bprkUgDsqyk4K4Ao+VEQpA6+rqzTf7kGirdw1qEpwnfJgJ60wfuxMy82g5VJS38QsZtko9inozk
	pcwQiVlJiueQUyWgZp/uTysTAVPZc8hVr85M0ymom4/uCJMFNgYUe8r8gFn0GzAfDELATNx26QL
	JOK7f+cUlAmw0f5rtbhqVZd9hPvWPoQ+WNXl3E6MrK7Nvr1B429yT41l6AN8/UuyEZIQ4B1dESU
	Cip14TdXu8gjFibzdz8Z15cZhZwMqo
X-Received: by 2002:a17:907:3d8e:b0:b87:6bb4:9eaa with SMTP id a640c23a62f3a-b97d6c3a76bmr249151566b.8.1773758423336;
        Tue, 17 Mar 2026 07:40:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97c635dce8sm325172466b.44.2026.03.17.07.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:40:23 -0700 (PDT)
Date: Tue, 17 Mar 2026 17:40:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linusw@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	arm-scmi@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v4 1/7] pinctrl: introduce pinctrl_gpio_get_config()
Message-ID: <22af6c960a7d20eb09e57e91821abe7ffbc52b9c.1773757772.git.dan.carpenter@linaro.org>
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

This is a counterpart of pinctrl_gpio_set_config(), which will be used
to implement the ->get() interface in a GPIO driver for SCMI.

Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
v4: Fix kernel-doc (Andy)

 drivers/pinctrl/core.c           | 31 +++++++++++++++++++++++++++++++
 include/linux/pinctrl/consumer.h |  9 +++++++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 2edc9bdad183..c471f3fbd035 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -30,6 +30,7 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/devinfo.h>
 #include <linux/pinctrl/machine.h>
+#include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinctrl.h>
 
 #include "core.h"
@@ -938,6 +939,36 @@ int pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 }
 EXPORT_SYMBOL_GPL(pinctrl_gpio_set_config);
 
+/**
+ * pinctrl_gpio_get_config() - Get the config for a given GPIO pin
+ * @gc: GPIO chip structure from the GPIO subsystem
+ * @offset: hardware offset of the GPIO relative to the controller
+ * @config: the configuration to query.  On success it holds the result
+ * Return: 0 on success, negative errno otherwise
+ */
+int pinctrl_gpio_get_config(struct gpio_chip *gc, unsigned int offset, unsigned long *config)
+{
+	struct pinctrl_gpio_range *range;
+	struct pinctrl_dev *pctldev;
+	int ret, pin;
+
+	ret = pinctrl_get_device_gpio_range(gc, offset, &pctldev, &range);
+	if (ret)
+		return ret;
+
+	mutex_lock(&pctldev->mutex);
+	pin = gpio_to_pin(range, gc, offset);
+	ret = pin_config_get_for_pin(pctldev, pin, config);
+	mutex_unlock(&pctldev->mutex);
+
+	if (ret)
+		return ret;
+
+	*config = pinconf_to_config_argument(*config);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pinctrl_gpio_get_config);
+
 static struct pinctrl_state *find_state(struct pinctrl *p,
 					const char *name)
 {
diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
index 63ce16191eb9..11b8f0b8da0c 100644
--- a/include/linux/pinctrl/consumer.h
+++ b/include/linux/pinctrl/consumer.h
@@ -35,6 +35,8 @@ int pinctrl_gpio_direction_output(struct gpio_chip *gc,
 				  unsigned int offset);
 int pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 				unsigned long config);
+int pinctrl_gpio_get_config(struct gpio_chip *gc, unsigned int offset,
+			    unsigned long *config);
 
 struct pinctrl * __must_check pinctrl_get(struct device *dev);
 void pinctrl_put(struct pinctrl *p);
@@ -101,6 +103,13 @@ pinctrl_gpio_direction_output(struct gpio_chip *gc, unsigned int offset)
 	return 0;
 }
 
+static inline int
+pinctrl_gpio_get_config(struct gpio_chip *gc, unsigned int offset,
+			unsigned long *config)
+{
+	return 0;
+}
+
 static inline int
 pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 			    unsigned long config)
-- 
2.51.0

