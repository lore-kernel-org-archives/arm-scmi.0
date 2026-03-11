Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39442344DB5
	for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 19:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773257966; cv=none; b=fUnuiB4o7aGcFHR0Shddft8NlcPH2C7kHIS1aVSNs5vkzLFETOhgCh8FLmVbe/pcct+QZr3gdeY/4liNxdLSANa+knzTLAhvOZ2JZ+IIyvLk7G87a1wgKCf0RKAeFlm0rRKWneKT1XaZPntV1ZZwEARR95zrTSKde0bkHlXK3/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773257966; c=relaxed/simple;
	bh=qAqHd7WdBfIomObVD+/mACW3BUxf70VgmHF8fv4ZLTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N0TiYyTAEhUK/19IKYQKr4dqbo2fWTqAF+LNe0tgJmgOBm/3XfMHu3TIaU57pwYvfWMVhfGu3Fis+X1JqPgV2ZD1ee9zOe3NDkpjT8qxwB1Lhjn2AjqMdnZiaS5M1WNUmq5yAcoJvpWDLgOLWLtufvfTkpBp861mXE85nkb4XV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c6VBHg0u; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c6VBHg0u"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48538c5956bso2786535e9.0
        for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 12:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773257961; x=1773862761; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LQkJ7hYeM6FobCrRfQAAST7LKz9aCrMza/cHqRkkyPA=;
        b=c6VBHg0uC3FervAp/thCt94ZiABO4509ZbUT+P0OaFeaaJ3At28Gy735RRTMLxwZh0
         0Le6tyhrCkEhEMOAXmQyvzFGHfPbhsQIoT8GWsB5rbQILkjSi51lqeUQD20yFyI9y69g
         Dk6oYaVeSft7YXAUO6eTg8rvx3cb2XUpfLlmYnWHflwCIuEmIOmajBKJ2npjeEbwSLwK
         GHSlFwWuIdLJThYipmSD119GKvDE10wnOqZNU921skY0DQftDkSC2FKd+5oIOQ0dZYA1
         XWaiI7ZkRAF6PT6MaXvGOSO64Rz9oNS4+iDCuv2K5fL4YGajLVh+ZrMbV+bN17KzP5CQ
         T1hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257961; x=1773862761;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQkJ7hYeM6FobCrRfQAAST7LKz9aCrMza/cHqRkkyPA=;
        b=HEjqmo8RhpoMSfwNRO/ZtyMblmBVTJm5e8TDSBAb9VVpvk0zUpzyWEiyTtout5SRMN
         wqSn4GrEV/Fc2V1UwEbgjaBRYT1uUAAnAxuAefq0LqwBGauR3ZYVwqkkFBAoi/duJEFt
         grtTf07IN6TzsSYkJS/1rGx6cKFAeUO2RRKGuVy0wiRYejZCoGCZ8yj5BoDVJM4vaqmz
         7l979LwmgCSHjJfX1UZsmeI5pZvVH/WQ+TsJhPNRnxmAIp2X9ddSPNjEwxiUtdBVeZJA
         pUzBldHInq2TaBHM9iox/Ih7/h5dkDv92n2sqPBS80q7srBW8yFITEylSPc9kKfADq43
         beQw==
X-Forwarded-Encrypted: i=1; AJvYcCVE5dkq08sdrHxwjxS3XsWzbnuVs0Ws5RyWF3IsDncgnDi736sNPk4V2SlBvfleKsbQIvOsbc5AMw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw5zRbvShSJgZL/5Wh7HfFpLJJMSsUBb0l8RwoZQ/oIbJNbFjI
	MAiMat/FTnUyu6RCovM4epCB2MT+/NETV7qDc/wud+LGjanq7KIVdcwqYYyNvHSck4Q=
X-Gm-Gg: ATEYQzySRXTEcpTEtvIpzE+mnOmXRBCnBkC7386iogRN87S74dMgSFHanSf6Ln7qmSw
	Bl/jm4wOZfMc/lgOhR+TAaznfum4daOKyRPZwF+8/v8GHgpiFs6akgnEfhgxiJBG78H30P/673N
	iHkZfQjD4qR6tP9Bsk7bxIegFxCVNtrdLV4jE74EOU8NzWAXq7kKkPUds/3Yh9+I1lJjbN7Gghl
	eR7Wa0Jj5uuydDIOWw9AS2QwtF78BxFrP+O72c/4VTB6eAGdNvEnDA1ww5m1ZoE9GVmbuGGl0QQ
	ugPcrWGmTpHmXqMWqgI25t1QzdwJMMgg5vx5Tre43YaXNHnJbF6tlWlsK9xDW6XA1a0JmnUKrAP
	9YBvDmlpMd9B2MxC1qcsye95V8PI+h7MK6RqzklHPv7yNTjSk/1DZY9tZj7KFDndgt+R6xIWnxf
	VsbiLQx2LUUYCryEMMnsGUeHNm/qd7
X-Received: by 2002:a05:600c:46cd:b0:485:3294:fff0 with SMTP id 5b1f17b1804b1-4854f5a2b77mr13943105e9.17.1773257961415;
        Wed, 11 Mar 2026 12:39:21 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854a2d7de3sm27652245e9.3.2026.03.11.12.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:39:21 -0700 (PDT)
Date: Wed, 11 Mar 2026 22:39:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linusw@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.og>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	arm-scmi@vger.kernel.org
Subject: [PATCH v3 6/7] dt-bindings: gpio: Add bindings for pinctrl based
 generic gpio driver
Message-ID: <58446889d781435424c46bac563483e603d7c0e9.1773150895.git.dan.carpenter@linaro.org>
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

Add a dt binding for the gpio-by-pinctrl driver.  The driver is used
for doing GPIO over the SCMI pinctrl protocol.  There are a few
mandatory properties such as gpio-ranges and ngpios, but it's not
mandatory to specify the pin-mux.

Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 .../bindings/gpio/pin-control-gpio.yaml       | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml b/Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml
new file mode 100644
index 000000000000..81c68579df6e
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/pin-control-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Pin control based generic GPIO controller
+
+description:
+  The pin control-based GPIO will facilitate a pin controller's ability
+  to drive electric lines high/low and other generic properties of a
+  pin controller to perform general-purpose one-bit binary I/O.
+
+maintainers:
+  - Dan Carpenter <dan.carpenter@linaro.og>
+
+properties:
+  compatible:
+    const: scmi-pinctrl-gpio
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-ranges: true
+
+  ngpios: true
+
+patternProperties:
+  "^.+-hog(-[0-9]+)?$":
+    type: object
+
+    required:
+      - gpio-hog
+
+required:
+  - compatible
+  - gpio-controller
+  - "#gpio-cells"
+  - gpio-ranges
+  - ngpios
+
+additionalProperties: true
+
+examples:
+  - |
+    gpio1 {
+        compatible = "scmi-pinctrl-gpio";
+        gpio-controller;
+        #gpio-cells = <2>;
+        ngpios = <10>;
+        gpio-ranges = <&scmi_pinctrl 0 8 4>,
+                      <&scmi_pinctrl 4 12 1>,
+                      <&scmi_pinctrl 5 15 1>,
+                      <&scmi_pinctrl 6 17 4>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&i2c2_pins>;
+    };
+
+    gpio2 {
+        compatible = "scmi-pinctrl-gpio";
+        gpio-controller;
+        #gpio-cells = <2>;
+        ngpios = <3>;
+        gpio-line-names = "gpio_5_17", "gpio_5_20", "gpio_5_22", "gpio_2_1";
+        gpio-ranges = <&scmi_pinctrl 0 30 4>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&keys_pins>;
+    };
-- 
2.51.0

