Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D4D314B6A
	for <arm-scmi@vger.kernel.org>; Mon, 23 Mar 2026 19:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774292512; cv=none; b=XpZJw4iTm2nL/EfWykFRqZLOpp1pCIunOdG8DKaqvs5Am2hHuGuZdHEJUpEPnojRROzvk+p8e/Y+XcDa8k4xz5V/stWZIsUwC+8JFKn7ONW+FoNWHmxrFDMW/zBdvateADOMTOuPUsKeAR++s/mqopSVyoI6WuqjDILfesjT8KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774292512; c=relaxed/simple;
	bh=HwXxD/Mvckwc9RensaO5rKc7xsT38UOSxYK2/xxw7d4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dShR4oMrZIZkRfxEPilxajMGz9yR8CjOx7xmd9HlJk6OwNkbyZ5yW35L5LEEEDw0SdvS/Uu6vsVQiqTLNhXaThin37BMnUcwcFezudyhjV8Ewb1BPCAaBFfSfEh44nEjNrKNazcWk/HOyM7njyaXG/eLBXwA3laW5iYdAuhAmF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VCsTMxEC; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VCsTMxEC"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48702d51cd0so30827955e9.2
        for <arm-scmi@vger.kernel.org>; Mon, 23 Mar 2026 12:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774292506; x=1774897306; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NvES5asAEJe0f+U9lkKESn8eUh5IqEP6vkqyZhx4vo4=;
        b=VCsTMxECs1+Tf9bOrw+28UVAEhC2a6Go3DLk/9hBOjZNWCUP1fyFeoR57HVrZ3Pi4d
         LAmXtugh8WwFt3VK3Q2MZ/TOu/iZjNA5WosqvBJhHYA/9XssdfUKvaFJdMd+aIzeO00i
         XYUYAaTXYrfdll3cRlxd5jTug1IauGRmg6Hs4sp67pV5+CJwTxFun1sbS7IYeh1zBZxw
         1CimWpGUFdSXprFmb1XvdZrpTCLK2N+IUMS/61NgxTxCxuq75+g4s746y5fMxTqr8YoJ
         4l6Mvr+dE6yLpw9E5dfbL08O1UBtF+cHa51FuVC9T+GvAPbOaKHr3qSUCNeCxtl0c4GL
         PRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774292506; x=1774897306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NvES5asAEJe0f+U9lkKESn8eUh5IqEP6vkqyZhx4vo4=;
        b=qnmmLBZUDI39y3Tn7bAGYLWyg1BO0WexAoY8JfRTnq+HmER065gE2Dwh0m4qJWwOAQ
         bkds32wtzyLkdypt3uw0tl1uN7CycApLssLc+nuxUkV213MPMa8a88aq5QUVFFELdUXL
         xrFkiAmKfW6arCN8PMOYLCFvjPPRnvAuyo7uC+ltvAMYCHznb1zEoBeKKA6LNLRrRoZ0
         lvz0BO7I/wWxbqNahxtvROBkrBQ1tMMRwGkTwqIOyO/QaoFHuUDGdm2myMnTRt5u9E8C
         wGRqHLudhbbP0NAYOcj4J29BEgjfHB7rW7UUNq3rVRav6NdMqMlyRBAlECzEGqU5NTzp
         2ZoA==
X-Forwarded-Encrypted: i=1; AJvYcCVqetPwpOXsVV42QLc4+RwIKV+pgPadMFZ0tfWv+Acr1VWJIXwzvYUk25nLmK6+gYHW79UB152ljg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSU3voOHVrrhOjvmKPnssufXJkXvPzMIYSr/jefKmwNlTI26Id
	swtI+G22SrFF+lFarTsnj+nb3GmOigL4Ba0cca6GQyom0v9XyWPKrlukWLhU4n35jkk=
X-Gm-Gg: ATEYQzwwe3V1WlNWbjXns1OE2VhftWak3TuuCBPy8XZ3jldrzTsVnMzqx4VZYCzkcd2
	RT3mRqCkAaOn8VFfCdopdTZIarlEmHyN5VoV0j/we5uifbk6v7QFickDcUpPNaM43NKE+I0IsUy
	sSMmc7+lhiudE607MnLOLJBKflsqRz7FSsRxjF0xljr52deMqj3K+1txH8MYkk2+kMVOMNZo1H/
	a99hULNRGVDFkA0s8d9wq7vJNULVuGkJtex5dvaxn7FxLxKlCe6J+ruzooM9FVFbDG7vAcwNpDd
	c/DEJJzoBX2j3aqgy+0B/Jujgmhx9n3eoPl1ITqMtb6l4zafc6qmgMNZPG08UUb9seOtdX6gOMz
	Sp7bPjIFCqwmt/sqTP2upb5dXFIbYtrR1qDVl6ivHNITEdFYYaem7DotP7bxS0X62X2fd0SN0lM
	FpWhYk8Qbm5xyAdM8zZIHC8dX+uj3k
X-Received: by 2002:a05:6000:186c:b0:43b:42e2:f4fc with SMTP id ffacd0b85a97d-43b64263ff2mr21553564f8f.26.1774292505939;
        Mon, 23 Mar 2026 12:01:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64714decsm28606638f8f.31.2026.03.23.12.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:01:45 -0700 (PDT)
Date: Mon, 23 Mar 2026 22:01:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linusw@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	arm-scmi@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v6 6/7] gpio: dt-bindings: Add GPIO on top of generic pin
 control
Message-ID: <3ff8504571babfc0acaa74fccd1e12024d33dd11.1774283146.git.dan.carpenter@linaro.org>
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

Traditionally, firmware will provide a GPIO interface or a pin control
interface.  However, the SCMI protocol provides a generic pin control
interface and the GPIO support is built on top of that using the normal
pin control interfaces.  Potentially, other firmware will adopt a
similar generic approach in the future.

Document how to configure the GPIO device.

Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v6: Fix the subject.  Sorry!
    Fix typo in my email.
    Add Krzysztof's reviewed-by tag.
v5: Fix subsystem prefix
    Re-word the commit message
    I removed all references to the driver.  I also removed the
    reference to pin muxing because that's described in the pin control
    spec file.
    Fix 3 vs 4 typo in the example.
v4: Changed additionalProperties: true to false.
    Add gpio-line-names.
    Deleted one example.
    Add r-b tags
v3: Forward port and update

 .../bindings/gpio/pin-control-gpio.yaml       | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml b/Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml
new file mode 100644
index 000000000000..a05cd339253a
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml
@@ -0,0 +1,59 @@
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
+  - Dan Carpenter <dan.carpenter@linaro.org>
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
+  gpio-line-names: true
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
+additionalProperties: false
+
+examples:
+  - |
+    gpio {
+        compatible = "scmi-pinctrl-gpio";
+        gpio-controller;
+        #gpio-cells = <2>;
+        ngpios = <4>;
+        gpio-line-names = "gpio_5_17", "gpio_5_20", "gpio_5_22", "gpio_2_1";
+        gpio-ranges = <&scmi_pinctrl 0 30 4>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&keys_pins>;
+    };
-- 
2.53.0

