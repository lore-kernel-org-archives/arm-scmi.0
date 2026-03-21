Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8845130DD2F
	for <arm-scmi@vger.kernel.org>; Sat, 21 Mar 2026 10:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774088009; cv=none; b=KU5yXiULRD0lbu6/Sg5pDRNlrICMiESnKEuXRQh9hyNfrcBzmdHgJ+LAeIqRX81f/b5rWg4p7kPxyU7DIbxfKKTHK1bBOoxgRJq64cmE8KCDPd5P9JPu0o01ov0tSE92G/iONP9sPUAwzIfqZq3xvR4cpgfaVpPcKW97QILyx+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774088009; c=relaxed/simple;
	bh=blBgOkHUL9k48ZZpbciZVcEdUpyrvvGFO5J2mFS0q94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BxKGCnEzU6ClHMyxRDgzKNyw6nUxkwtb1+zacK4PYibGLdEIZQ49jumNUeGdOM3u31NDuY97IcqwRmbTBORxOoznnM0U6yTZYtWywoDQYnVl2v9ybLAGvuc7Bjdp/RJdROuyJ7BTYRRJlmHrlQOZ3g6oeQ8LeY7oPNUY8PA0PN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mDddJuj5; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mDddJuj5"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486fda2a389so10840455e9.1
        for <arm-scmi@vger.kernel.org>; Sat, 21 Mar 2026 03:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774088006; x=1774692806; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z23TFsp1titUKTemBieWM6vBHqTe1wrTtIq9tf05puI=;
        b=mDddJuj5Rqjnk+4PiSRcwtD93OY7+LFUy9+kkV6Y6Lny6MzUS6F1JEVuUrHsXIPm+S
         Xx85M4iacozyYagQz7j3SQDrTYm0a43AUc1Qs4flkHIhaJv5VLXJi6ciSdfdjrHcTKeK
         Akixu0BPS5NEAnP2bfHk3ctVPR8xT2RiLPIz7pDAbadNmRsX4JwE0hXENbc9gf21lE1N
         2mmTKzyOFpGAv0w2DI1UGW3vJ+b8i6PgX0V5TMz+KvaHNGqdwARBv87PUHeB098EGOfu
         4ajv/y5Ff0KdKhoMc1WXr6YzB0mvpdmIQaPnwlCL4nus2hbSokSGHc+Jzluk29A7ZCgi
         J2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774088006; x=1774692806;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z23TFsp1titUKTemBieWM6vBHqTe1wrTtIq9tf05puI=;
        b=eLTHTiumWPsSIWBlH0IXi+HzS5bwsi724rjdTI8Qf1WQeowFTILZT9JrgavHikvG2j
         UHdMF/PJxzObL6PhBu/xGnbi7784ryPiEzMtKGE5DbX80tlCIwkfFJwSZ6UvnaALOiRx
         g9jDzIijbyzaUd1osIzei5lZM9hSFrar0B8LJb0XAlWbxy6KzC9cREYK2I3BCZyYA/8W
         p84gkS0xRLVcMNZb+lJXEyjWqeDoDiHz5fRHy3c8lxFCoKfdTZQA9xoUZdK9Irt2zA/B
         ucoYh/qZLRkXv0tpvjo5pgSMb4zb5aZEP3a0Ej21Z64pwAimUjX3h7xatfmu13RTGinu
         t9cg==
X-Forwarded-Encrypted: i=1; AJvYcCVtm++fZjvZQ72dw14S8Fa6bVBu76fcWCfGCiax9WImtsYMt461k3QZdv4STmB0PmwKMk78F4MJdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFB1eeyH+UUjdW9ayFEL5JdYKogXQI+F5VCTgroMVNxwzJ/wMB
	+YKGgKdp938fqWuuwfkTB0lu6u/srry7k0mpCFrdG9JpO8XfC0Y9GGmhqLx78FZgi1M=
X-Gm-Gg: ATEYQzzsIHe16/qVToIJNWe3isL3vi8oeHs2yi5cYZKQxSYNgUwjIfuMp3OBKKt9Bbe
	ACJtc2SUURUBBwptS+to4/28KjaXaP+wdvq5BSszQeoT9rgzIFoR4nky9Wcn+rE79jnDh9QwXwh
	EMaqeCVew6WpX2BOVBlPBgtY6Gm2hNsS1RpcP6q90WEGfJxUMl2L2oBPyU1JBXk2sKWDqN1OQux
	fyDdGuccQfGjSYvtK5UXgjcUy0ReBEs2gmVJFVsFeDnmp9HwbSQsPeNbFzWtBN3nnH7qeHPts3u
	WansMdKFZ79jPwOu9sbkgMbMH6JTJ3iS+x8bpbDOPp1LMHExoXBXrdqp6J9cjVlGZCPyIyNAVMP
	/4x9yl/g5SE7Z2kmCD8/rcpv5z39eXTAJLal/bHWWKznKSIpWzfPQPOcjfDvo3b/cpRO+45T62V
	UI7KEkH6+aCKce4kgOmp0djjffUudJ
X-Received: by 2002:a05:600c:4fc9:b0:485:2ce2:4c8a with SMTP id 5b1f17b1804b1-486fede737dmr87229225e9.1.1774088005338;
        Sat, 21 Mar 2026 03:13:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48705135631sm31669695e9.15.2026.03.21.03.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 03:13:24 -0700 (PDT)
Date: Sat, 21 Mar 2026 13:13:22 +0300
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
Subject: [PATCH v5 1/7] pinctrl: introduce pinctrl_gpio_get_config()
Message-ID: <f7a41ed017fba4a0986ffe72e06933cc1bba2406.1774087290.git.dan.carpenter@linaro.org>
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

This is a counterpart of pinctrl_gpio_set_config(), which will be used
to implement the ->get() interface in a GPIO driver for SCMI.

Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
v5: No change
v4: Fix kernel-doc (Andy).  Add r-b tags
v3: Forward port

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

