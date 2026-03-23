Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772BE314A83
	for <arm-scmi@vger.kernel.org>; Mon, 23 Mar 2026 19:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774292478; cv=none; b=u9+tts4hbUaMj9SPNq2irxPgrUhMQdDCAZuPyci8hsWip4o9umqA1RbWa1KrsmXtlBTibz2Hvr0aTEpOohxLnPNSKaqMdjK3XL8yDYB5N32uEPS7Kc0XJIbbfnmPxIuF0LUQ/fXrF685e2Q3luyMvmg+W5BphW/jGwzKoNflHN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774292478; c=relaxed/simple;
	bh=6Ah0GZtHWlJhWUz0Crf58vbcXv+9COZbbw5o4RQlGLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LgpvuvJatqhsQtOh4xIRZD0srJh8pnTCZr91QaxHUHnYX4PJRafKk2m29k8Ijszp9nh5QSu4g4zVBVXgivMSstkz0vKBpIufvePe+kEsbF7o/5b0ysDiBHD/G33LF1cWx/CSdwiCizaoLraaFWIzPT/SuJgHdHyaPg9GPatw7Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pQvrTfQo; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pQvrTfQo"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so27598715e9.0
        for <arm-scmi@vger.kernel.org>; Mon, 23 Mar 2026 12:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774292474; x=1774897274; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dY0rDhZYHoT7nVKeHkYiyNCYW9aaueyrXJ7hodb5Gwo=;
        b=pQvrTfQoDiEqCCfLKfBdnARANq+47Xlx4PQ+DdIvXgz6/nugbiYqaJyuMuoEWN49bo
         g1IH21IsjBUrLmE3FoyC1XX/MUMGYZFkKUpkrWLEdBnh+KsAnVHx8gClFxok8B0qAtwh
         KxrTim92YmrzL21jlC/JXyfTw4cMGa4gBETQROt05pmkUOPKFo0Pc30yREiSVHTgOXPR
         lgtgbxgfcLp7rs+Z9Famwo3HWEkJBIGyK33oYQcSZgb85Zpjg1/Qt4QeJ9Yo3Nbsxjaz
         9sMYs1m+KCqHwWnZccoJQQaXHsLc+jqncMJsiqt85+daZR6RI9XdLgkyNKUZzhOttjzn
         rMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774292474; x=1774897274;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dY0rDhZYHoT7nVKeHkYiyNCYW9aaueyrXJ7hodb5Gwo=;
        b=njrv495rPHGU/cveVHpeX4Cy2ZK6Mv3+OvLQE2IhNPSkMUeb4STUegUoBl1dwVXpnu
         nGv4ijQdKXegGk5A7yhQLPYrELaAUMPJ6l9EGtCeHL+/hOL3v5gCN1CiToDdP0iPptPL
         MlT1I9oS7+IKGOyeyIJZ0BCqOg3T2XkhZzDCxmUDv/GudgLfWZsgSHY86xZdY8nj4rGk
         bSIT0CHBLcAf3JDVAl/Yq2AkNsUSL9heDEp+DlChKpZb0bqssAfkpfvLt6i2LtVYnRaW
         jlwwOVFAqk+61NTI+1Gt+9gFjdf4zt9k7J0xThesGehS2iG6MdmVEKMZP2LSFlublo9x
         d6HQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRM1mkbS8kiTAWIzH+0iWpwr22L3D/dFTAoisnT1mIkiNmVxMCd8ROuGVTmeBwiI4weulEI0YhZw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz511ot3v0QP4rFcHsX23lD2fxtkKnf3odLPCwi6jnKmI/a5bv5
	SylE0XChHARKEqqgQb5PLgxEAbuib+CcYwIBcyKMjoWq8eAT0zbSJ/MwRMIWwKKLejk=
X-Gm-Gg: ATEYQzzcIqX1bHFEojE6068sTOga6ufvi+5zFFYDpB4PaUp9NmSoqUVG8vP/jWORqah
	J3LwCuBMxqZsPlz5YYcesPzjd2i5t+Yx9EQBkqQhxqS+vapBVazE4OQOcn4/VKxC2ms9XqsV3bi
	lzEV/OPeBXq7TGwF4xnjsjRQatIgaRr29n+wyviehv94JzJY8mkL+JRII6KvloJYdflYZggYzwn
	MXgsK+3OD1e8b8RgKH0dmmGD+Awmvn3r1tif1kFM1VKLhVtm8883rMbXJjesyam1I+jeRU2Lrqy
	nJZrMo35XukDUwS+99nvmsq0+ApTgyV8RyaphsdCaWJI8ti6H/ZVrXoUm5Pnh0tm+llQbBDdtIK
	A0z98JJ923+USh5yTjsJyNjmCWrODt4rFDOHgiUhQvAiRhYcSwtwzTLAnIv6Pxd7FV8qYa6NNgz
	nTsPkdh4uA1fYIsTYfRmoGLlbf207UM+r+X0tU5O8=
X-Received: by 2002:a05:600c:3554:b0:486:fc4a:2951 with SMTP id 5b1f17b1804b1-486ff01d7f3mr173323405e9.28.1774292473972;
        Mon, 23 Mar 2026 12:01:13 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f83c84fsm999765e9.10.2026.03.23.12.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:01:13 -0700 (PDT)
Date: Mon, 23 Mar 2026 22:01:10 +0300
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
Subject: [PATCH v6 1/7] pinctrl: introduce pinctrl_gpio_get_config()
Message-ID: <b39885d11c6833e3524a19350f8e69cc43a9e975.1774283146.git.dan.carpenter@linaro.org>
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

This is a counterpart of pinctrl_gpio_set_config(), which will be used
to implement the ->get() interface in a GPIO driver for SCMI.

This also requires that we create a stub so pin_config_get_for_pin()
can build when CONFIG_PINCONF is disabled.

Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
v6: Fix build breakage with !CONFIG_PINCONF
v5: No change
v4: Fix kernel-doc (Andy).  Add r-b tags
v3: Forward port

 drivers/pinctrl/core.c           | 31 +++++++++++++++++++++++++++++++
 drivers/pinctrl/pinconf.h        |  6 ++++++
 include/linux/pinctrl/consumer.h |  9 +++++++++
 3 files changed, 46 insertions(+)

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
diff --git a/drivers/pinctrl/pinconf.h b/drivers/pinctrl/pinconf.h
index 2880adef476e..659a781e2091 100644
--- a/drivers/pinctrl/pinconf.h
+++ b/drivers/pinctrl/pinconf.h
@@ -74,6 +74,12 @@ static inline int pinconf_set_config(struct pinctrl_dev *pctldev, unsigned int p
 	return -ENOTSUPP;
 }
 
+static inline int pin_config_get_for_pin(struct pinctrl_dev *pctldev, unsigned int pin,
+			   unsigned long *config)
+{
+	return -ENOTSUPP;
+}
+
 #endif
 
 #if defined(CONFIG_PINCONF) && defined(CONFIG_DEBUG_FS)
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
2.53.0

