Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4340D2C0285
	for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 19:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773257893; cv=none; b=KxsvQLtd6uI/9nGjz/3V1HN/sc/F6MeXU108WlY7VbNBJamqcdndPPnPUwwh6OE9ue6gMxvRanvFaJBGyJtViRY8JsPwbhjuWhSUWeVMbBfTRuBW8Lkg4Boehn6r9wxGsz0a6Xd6X6RQwHtr34xTq/R/bX+wiJYJngqI0/z8vo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773257893; c=relaxed/simple;
	bh=qub0cc9B89QJXNhuj7o8afjimwUoYhU3mwesp3uHexI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DqwA/Pvg/OlgFEc+bk0x9w5nbhSv0IFCYGkPPCfz7d/Ed1VKUoBA/RnYELiRyQiEhn5DRlNPqsCmhCIdDOCS5EZZmMelWx8y8vjXBBsnJfOVnkipSk9bPvFJEIKOpLVHOwrmSFdoWPrNxPrPdbkeB937lr/kOtrM2qcLQqE1toE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Acp+cQtW; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Acp+cQtW"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439b790af67so1149975f8f.0
        for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 12:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773257891; x=1773862691; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UVoIoUgEnohfcDrGeS0vAZ3ak+mSxJEtVllXouTurmg=;
        b=Acp+cQtWY0DIRn+cy1y3ejBUa1Ap7tCi7dC0zkGibobglFeT+dsUh+3OvstUoJR6tP
         tkBv7/j9EZDobUhgEpusPAss0XkNTCBCHfEh3fsaIbAZzgCz8TK9/lfQ4xOEy4NfZuVU
         jitzDSWmtemJ/5BVQtFpZH1ot3v1FjQBoN8OeFeJjDmZ8jbshbz6KYbL2d9tztB0q9IX
         sqf6Z7UcSqlA9R5I7jIXNDCf8l5Qc5/GNpK5wEtc/0uq3406OlntM9vfNb0aWd5hnL5j
         Vp71aamtGg5Gg7hk57psMksLkrt/xo2Zp6ykL6PblfHob37FyIf09jeXp5NNywf9YQQx
         KSTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257891; x=1773862691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UVoIoUgEnohfcDrGeS0vAZ3ak+mSxJEtVllXouTurmg=;
        b=dyJpKEiu5dAsU/Tv7eVyv8TkOWV5h4ungx+HkGOgvzd4KRnVQ0xki2eF9Pz8mjO9Y4
         pGRef+qCeo05V3apm9zrZNOrUJ3AUTIIOgeRRKL1VZ/3tV+FW/a7nuSe+AKx3MFA4guX
         F0CIIa19Awof/FaBBtGotGECfl8Us3FJN7c5irmJOzIPO3p0AaK6iopZZiBv4lzZgVhY
         vWWG872kPhPuMutO1EmtY457yIxB4ig0Wuj7hXlBmmc/HM3vVkpwIIJ/d2LTyKUyVqJ7
         g2S2ST0/m8ZAmVJv6UYusK22kDAg+5lrLNxiHZwPwUaU5WQJdC17zImtN1f7mukn6xos
         DzvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPEf+wMqreMsbOF6qHnHVHjS8keaUOlbskkrivv5UITuRSoeFMn7GbomHATAWt4U7ivA00LiIyuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzeP3I/XhiN0k0NWhdgA26IMwivw16art2hTyGQMQs9bbcPREd
	ZatiHieSIpKUNZibe6ISPw8ISvqz28WNc2fxTkprDQ7KHqa2hDEzU38YeoewOiQyTIs=
X-Gm-Gg: ATEYQzxAwD0fbpsAjii09bdzZi5LbBX0n1cEn7gBTNwz0da1zufisEgwLVPIE1svTOD
	YfZlmUYLV/nh2V1+NIr5tHndguTnu7EdlcpBRJh/GAvFuzFvYujiize1exGza3MFNWdE9EhxJtH
	sPTIdRWsOqf1WRWDqnzIqWxEK+d9+8VlknnftTeFxPNE5oRwoifFI7KMTLDROqoCYQthVxK4+EX
	sn39jDWlaAtElPV/ypb0WALGXY9Pev2LbyV0xUB3egGd/OnJqXgdRrrhKF+bKW2IQ9LRmcHiLsU
	OCWlgxfeMEm1iWXEjWjkbGPpj+AwvlDcdZmOr6rsgqB1kFbnWe2dJo9EirIB9xGMUPIxTInFALV
	suDpDMms4LOVbRyFE32p8fYooBJDfAXn4e91uFH/sJYqs1J8MP7daBXflssxa3Xzy69ZceFH+I5
	5XbOTLMiXjDJi5C2XCuxBPqXYzSxdd
X-Received: by 2002:a05:6000:24c2:b0:439:bb46:7457 with SMTP id ffacd0b85a97d-439fe192ab8mr1738510f8f.16.1773257890603;
        Wed, 11 Mar 2026 12:38:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe219c41sm1408413f8f.29.2026.03.11.12.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:38:10 -0700 (PDT)
Date: Wed, 11 Mar 2026 22:38:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linusw@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	arm-scmi@vger.kernel.org
Subject: [PATCH v3 1/7] pinctrl: introduce pinctrl_gpio_get_config()
Message-ID: <350d922ad791ac72756caa91e1551e16d7f511eb.1773150895.git.dan.carpenter@linaro.org>
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

This is a counterpart of pinctrl_gpio_set_config(), which will be used
to implement the ->get() interface in a GPIO driver for SCMI.

Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/core.c           | 30 ++++++++++++++++++++++++++++++
 include/linux/pinctrl/consumer.h |  9 +++++++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index b5e97689589f..732ca6785c67 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -30,6 +30,7 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/devinfo.h>
 #include <linux/pinctrl/machine.h>
+#include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinctrl.h>
 
 #include "core.h"
@@ -938,6 +939,35 @@ int pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 }
 EXPORT_SYMBOL_GPL(pinctrl_gpio_set_config);
 
+/**
+ * pinctrl_gpio_get_config() - Get the config for a given GPIO pin
+ * @gc: GPIO chip structure from the GPIO subsystem
+ * @offset: hardware offset of the GPIO relative to the controller
+ * @config: the configuration to query.  On success it holds the result
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

