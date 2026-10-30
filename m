Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375920;
	b=GFlWJqyvKYY0lnxgFcowdNHMPxD0XtsH/mwFZoqVX/Y9eEXwegnQezZrvVmp0rpu977V
	 ye6C6kodo+/GygIS8tDVtY8Dn8/C1XTHDgfH6pWCjOwyaQx8Vn/hIV6CMjBqq3e/BkfzS
	 /Oq9j2axzkXDzHTJtXPUMTehYG9eejr9PL29X2XtF4ziIRLcqObpNryFpwCuG2vUgNUm8
	 twj0HnLB9n0Iv0kYYNkenaWwMA3VSLi/qIsrcMh42QbUJQ3CzLVZv7q3Jcm0Bk1MBBP6p
	 1S15Azxp+YtXkqUTmK3rpHo3awBDSa/U2tUlSdWxVdW74GXjP3xzexLaEsbDoMHooPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=TbaN4D4zPrCE0j2WU/cjpZg5LgYUpD3eA+3kZLrtZK0=;
	b=qMYwcB8urU2Unq73BJKg2sJINsfAMKwXs/Q8jhA0tySdy6cAMAyzya2PrJbtAN/NW75B
	 JyA/d8xYg8bYjbl5P5sLvSsU8+/GjGOxWwD1W3LpxQJUp5MX/yFzmtKVbYeo9oS9pgFyA
	 p9nU2pw4w2CN0CE7hrMIGI5UylOXrhuxbEXSyybt8pUEaWzcHXtEGc7OwwfJnLpIQ9fXi
	 PH0rQREG4kJBQuR9ejTDeF+CWKFUuTdvCrZtwSiSzpdTR270DXsAgiXkXdIh2CPo1sLfq
	 g7I6yBNJceL7McDipfbca2AXj5W5mt/facvuKNeickM0gBlCStsERaJRa41X8RV3fqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QcX7czRU;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1372606A332
	for <arm-scmi@vger.kernel.org>; Fri, 30 Oct 2026 15:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1372606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QcX7czRU
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a210470b49so6811645e9.2
        for <arm-scmi@vger.kernel.org>; Fri, 30 Oct 2026 08:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375918; x=1793980718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TbaN4D4zPrCE0j2WU/cjpZg5LgYUpD3eA+3kZLrtZK0=;
        b=QcX7czRU7i5SmOrIAuO82prn6x/lb2cIaIcvGWBYQmSqy07CTmQsdM0bqqZLopTxWT
         ERLJIt1gU9Gary3puHOeypsrLaZAg1D/yFoBPGHc0WKV9aMFTq8nhxFcgX2y2Vd08ILK
         vTSnUnh+ORhxTQ9jJKOP7JzpfZCYXdsn8Hyd4Hr5mCAfyIrhXx/ZmEw3WPJOZ4eAv4cT
         /seqlTf9QpAVI53Hxlo7OepHfycULrHKt09H5BUFu5ymcI6esSPpyKveUFp26jHJJNyK
         8v2Tmwy0Tl2l2vDSwC5UZHJdQsl6UpbPtorWUl5H0rUhy+FjptNgrw0wlqg8MSXwnUT1
         ud5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375918; x=1793980718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TbaN4D4zPrCE0j2WU/cjpZg5LgYUpD3eA+3kZLrtZK0=;
        b=wFjWFZFVH5WZ/ZAMW+iDk22vtQoO7zilBbqsn1mqfnrWYNtBa2fCiJTb70fwA2L/pY
         Qlr2ZjT8TCBr8uhCMGpkdS6MvjE2VheadN0vCx943jDiqc+b0MWHwYcQxV1qCLtm28OG
         OfecE6VtfIuyxWfScvL5LiXrejH5r/mQxFwii5v/aXwXAah9VI650kgDaLHIzNAyN86x
         BykUbNng1bS2h4DWZcY5PunVTBlMj66cAmb6ZzOZrdxRPg5lvo+Y99zi8cXMq9CbM1uU
         TDtb8gJjw9SJWvSr3ph+ciJ8DtC3Q8uni/qZjLzjpVwbxvs7pPfsUAS+u1EEhLTDeVWS
         U/5g==
X-Gm-Message-State: AFq9FYIk2sFybB/1ZtQCMbhE2wCN2esC/+xWXMcfq3ocPbmbfpBepN6k
	SJeOkwtvUP+1N7VRqiFLcO9KKV3LzbSJpYk03glRIfJ9qoNlYjIbqW+9ZnUOo/9JflY=
X-Gm-Gg: AYBFou0oXkkzkdYC2R6wQ97bKnzvokZpi27uGw2JnX/lUI8b2033mLyF5EKHGjSdJYv
	FcA5Fw6THVclSwH98EdUDrFpDQIr0nXt9S0Yw/zJBa0EfvGoHysLMa0BM4kESNhJS1My91jVOxg
	wmhiTxWJyP18qbMy6uwzFmu+mOQAAM3uSeyPhHdTa+lGJMBNJMwWG78R5fYxWM5zsi3nexze4z6
	IuZpoos+kN8O++JlDh6zskebB+4lo0mYDSqba6VvDOMVb9HxcIhhJCeKfolQst1Mg+oCoI8SDkp
	Twds+24AJyOLPD7FRsiIMbENt+7mdtE585q0HdE9OkNj1YFoxpUcAU1yHdDN4xVog/XQ/QvGkqP
	sFY94+RFzySmKG69CBDAkcgOAcUrDlnZSAPRgauCObnW418xKuJ1I10VwmtF8WdriPv/UVVih8t
	kF5RS4P2vTbvaIhU1I0DLST9F+FHAv99PnUIhQ8NcPbYp+KjcAeNcVcY8a+qgDMI35tPUvRerXp
	/k6LSxseQ0iDZLDdaxHfFeqfwoWLtMXLZuq9VWKGRzzFMizhVbuhtGUuiJ9PVGJinHTSRW/FeEf
	gPhKy0NBVMSTOgBLX1X8grx1sZNOgrgVY3tu56qeeSUV1RBXjp8=
X-Received: by 2002:a05:600c:818e:b0:49f:fd40:80fa with SMTP id 5b1f17b1804b1-4ac1932aa2amr62355485e9.34.1793375918383;
        Fri, 30 Oct 2026 08:58:38 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac08b72578sm27102895e9.2.2026.10.30.08.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:38 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:34 +0100
Subject: [PATCH 03/11] pinctrl: scmi: send the settings without argument as
 enabled
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-3-52d92843ad97@baylibre.com>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

bias-bus-hold, bias-disable, bias-high-impedance, drive-open-drain,
drive-open-source and drive-push-pull take no argument in Linux, so
they were sent with the value 0, which the protocol reads as disabled.
Send 1.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 5de47e060e8c..f74ef0952ba9 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -173,6 +173,21 @@ static int pinctrl_scmi_map_pinconf_type_get(enum pin_config_param param,
 	return pinctrl_scmi_map_pinconf_type(param, type);
 }
 
+static bool pinctrl_scmi_pinconf_arg_ignored(enum pin_config_param param)
+{
+	switch (param) {
+	case PIN_CONFIG_BIAS_BUS_HOLD:
+	case PIN_CONFIG_BIAS_DISABLE:
+	case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+	case PIN_CONFIG_DRIVE_OPEN_SOURCE:
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static int pinctrl_scmi_map_pinconf_type_set(enum pin_config_param param,
 					     enum scmi_pinctrl_conf_type *type,
 					     u32 *arg)
@@ -182,6 +197,9 @@ static int pinctrl_scmi_map_pinconf_type_set(enum pin_config_param param,
 		return 0;
 	}
 
+	if (pinctrl_scmi_pinconf_arg_ignored(param))
+		*arg = 1;
+
 	if (param == PIN_CONFIG_DRIVE_STRENGTH)
 		*arg *= MILLI;
 

-- 
2.56.0

