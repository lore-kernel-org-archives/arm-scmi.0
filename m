Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567975;
	b=ETb7ReH8BKnUIpJAeWsB1ra2Kb5+aWLkBel4XQlKWx78vcDqfykXkSjJGaB/K/jSovoe
	 KRUemnjUAQ5ZERIE52Tsxpx92m/PAcXuwYmdeilQ+yRaehnXw3AIXT5fmttuYevQYopOM
	 Uqq+qFm/HDUG0HTqa0Luu/jyjcTng4LKukj/T9dv95s8qJDPIQkLAG8KCUhkEGXR8xiQX
	 A7JPBuygLViF8ROdby88N0EIghKrDZ8w8xm6GgLEOspyYsqfzNiM/hPN0FezaFbWcnfLs
	 oNM60qMjLDmkEjuZjkyVlDknEU+avnJ4mBq7LFRJtKSDieP0sA3i7p292UyAeI80hvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=/KjHy3hpqhFDwucISqBEqrVFtd2/HO1l3B5+bpONlqw=;
	b=wyHmApHNiCmDeow/verKoKWQctwEohFLBsbG3KCfqvhqABwoqxK453XgzMNy/NYlFNsW
	 0gV5OAxen5WhbRmyHQRAXzuHqpD63Mw4zWWEMSbr5UPTomA5VLpc3mKzmDjWa9+flTvds
	 E66A260F5sK+javwN3Ad0nwpFxV9BYMuME/InNdSB/75zMomSGv/4urxtcU3/yOXwHT/9
	 etnxXuQoEbfX+KrZ41fWZCceo5HtG0R5jivqASbK0Zj4dOiZED62tqLXY6FszZH5QsC5h
	 8xm4fbMDsqTp0TIURfZtLKK5Lme9CwZMWQK/xfG1jLHQDiN0/lJdKmBhPEpcwhFfrWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UGvaPVFX;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B88A606B58E
	for <arm-scmi@vger.kernel.org>; Fri, 13 Nov 2026 11:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B88A606B58E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UGvaPVFX
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b704171bc9so1337562a12.0
        for <arm-scmi@vger.kernel.org>; Fri, 13 Nov 2026 03:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567974; x=1795172774; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/KjHy3hpqhFDwucISqBEqrVFtd2/HO1l3B5+bpONlqw=;
        b=UGvaPVFXaCC0ucte248TizcD7W7yw/pHeHhjTJobe6gikfzhHMz2YCyodT1C7Vkbqn
         qcfAKlYUAhMERplEVIHH1b5qvgkPL5HMZbqXJTt4K+cekrobY3z2PNVGONyOL03/R435
         27kYrIZa5/ZB5AP91k2ugv4MkoUFXC0+vT3g9HRRau9qbtVIsU3h3bj4VE316N4xFPba
         ubgCWdld6znEW+8dDtq44hjusbxqGQqYXnN4uZ/IOAyw74TKbPvOmGwGoE8AcHg0n+Lj
         cCqA0jZ11Ibuqc5y80ec28iLLpE8fsiNzLZUT9r+5oNJoaQL8AaCxkxU91vRNRcg/aU2
         5cQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567974; x=1795172774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/KjHy3hpqhFDwucISqBEqrVFtd2/HO1l3B5+bpONlqw=;
        b=edLQbHJwhSyDHPHrRGYmV3IOqHn4L5D1COc7DXgbBqJfXMnxwG3lXzYyw2iXgUFGz4
         DbK2ACGkGBd7v2bTMnPhoTI7TQCwa1Z2OBvxGA+8voyH0vik0+o84GxzqzbwBjZVf6pN
         5F/OH8Ztjll5XmUVt03PNC8zKO1Q8E/0PvH6KEhqWubnJeP/chJMQ/yKhxWWxOLYikfM
         iyoSnMJO0MUQFwkWfuAGgS6squjFTS4fW+Rpp6peIlxJX/8K7Mp0OInTastk/NWHw9co
         5obOpz/TE8P4JZjy37hrFxvZYY2fmUBFrdK3i5tElyzrN8Wf92hsb+KCYXGMra1cxFKW
         X8aA==
X-Gm-Message-State: APuU4Z9vaneHmLDQSkurVc0XNsmd5S1gwWzhsU/mYaallcJXBO1K4lnN
	KHsXu2xkuTDJ0df5sl6DWJ1z1ERGH31kEYgGmupC8muD6GDry+SVf9s5n+NC5w3j59U=
X-Gm-Gg: AYBFou2aye761p23dmn1stvZyDc7SrmcX1Nghw35toWeAmHTEpqogL7FszK8rhNEmN2
	M7bPPphnRBLW9hM4WkJSLBLosoJyrw8klJpDUKhyFZWTJpJmgsfGFkSIlF9FrCaz6gQLDS2HaOK
	AT8A2nFOPnfxfB6FGhTPs2XIuB/dNWVFZqb3VUbu4fXCzYrJfsgijYpr+SLMdAH5gWuEGPrsTJl
	w+JolSNzt/+NRUURE/n54V0EwnJjI34x78u+f/3BEGbbJZ+dBxuPfpVYkbC+1M+CNOHcu/jDSPr
	FyR4O+Dv4ZtunhaU2tmCyiDKkkOHrKxfXEnqBBQqQjNZ9/kJkjOF5uJacjt+e2ekJoeBMB/pIKp
	HD72ajZMmBXAQbfr79d/6JZa2HVK+tVZoBnOXQxNdCiP4kQoqUeth8mB7hAPQXw1O/d69sPEMK+
	n4X5igt4o/QL64/oJLwlZXCYYaNTzHkMMuZ+nd1Aj7S86J/0ciCHkwSo0XPLLKrmr3NEO8p6NtL
	5aHCRCisAFbvQ3eFxf6wEtTX5O1dEXDq0jQf9JkXcqSzmsW2RkzN9NxcBzS+x8PUa4PEUcWw8gG
	UlyvFVCo5PB0y2l0zd8tLeCYRhGTFIVfocRboqEO2ezcrNV1t0XM
X-Received: by 2002:a05:6402:1e94:b0:6b4:201f:17b6 with SMTP id 4fb4d7f45d1cf-6b7c088fdedmr1865175a12.6.1794567973645;
        Fri, 13 Nov 2026 03:06:13 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608c5debsm4495767f8f.42.2026.11.13.03.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:06:13 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 13 Nov 2026 12:05:37 +0100
Subject: [PATCH v2 11/11] pinctrl: scmi: select the GPIO function on GPIO
 requests
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
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-11-faccb4685d88@baylibre.com>
References: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
In-Reply-To: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
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

On a GPIO request, select the GPIO function of the pin, on the pin for a
pin-only function or on its single-pin group. Without a GPIO function the
mux is left as it is.

Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 61 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 6d51025013ec..89be533354c0 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -74,6 +74,66 @@ static int pinctrl_scmi_free(struct pinctrl_dev *pctldev, unsigned int offset)
 	return pinctrl_ops->pin_free(pmx->ph, offset);
 }
 
+static int pinctrl_scmi_gpio_mux_set(struct scmi_pinctrl *pmx, unsigned int pin)
+{
+	unsigned int nr_functions, nr_elems, nr_pins;
+	const unsigned int *elems, *pins;
+	bool pin_only, gpio;
+	int ret;
+
+	nr_functions = pinctrl_ops->count_get(pmx->ph, FUNCTION_TYPE);
+	for (unsigned int func = 0; func < nr_functions; func++) {
+		ret = pinctrl_ops->function_flags_get(pmx->ph, func, &pin_only, &gpio);
+		if (ret)
+			return ret;
+
+		if (!gpio)
+			continue;
+
+		ret = pinctrl_ops->function_groups_get(pmx->ph, func, &nr_elems, &elems);
+		if (ret)
+			return ret;
+
+		for (unsigned int i = 0; i < nr_elems; i++) {
+			if (pin_only) {
+				if (elems[i] != pin)
+					continue;
+
+				return pinctrl_ops->pin_mux_set(pmx->ph, func, pin);
+			}
+
+			ret = pinctrl_ops->group_pins_get(pmx->ph, elems[i], &pins, &nr_pins);
+			if (ret)
+				return ret;
+
+			if (nr_pins == 1 && pins[0] == pin)
+				return pinctrl_ops->mux_set(pmx->ph, func, elems[i]);
+		}
+	}
+
+	dev_dbg(pmx->dev, "No GPIO function for pin %u, mux left unchanged\n", pin);
+
+	return 0;
+}
+
+static int pinctrl_scmi_gpio_request_enable(struct pinctrl_dev *pctldev,
+					    struct pinctrl_gpio_range *range,
+					    unsigned int offset)
+{
+	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
+	int ret;
+
+	ret = pinctrl_ops->pin_request(pmx->ph, offset);
+	if (ret)
+		return ret;
+
+	ret = pinctrl_scmi_gpio_mux_set(pmx, offset);
+	if (ret)
+		pinctrl_ops->pin_free(pmx->ph, offset);
+
+	return ret;
+}
+
 static const struct pinmux_ops pinctrl_scmi_pinmux_ops = {
 	.request = pinctrl_scmi_request,
 	.free = pinctrl_scmi_free,
@@ -82,6 +142,7 @@ static const struct pinmux_ops pinctrl_scmi_pinmux_ops = {
 	.get_function_groups = pinmux_generic_get_function_groups,
 	.function_is_gpio = pinmux_generic_function_is_gpio,
 	.set_mux = pinctrl_scmi_func_set_mux,
+	.gpio_request_enable = pinctrl_scmi_gpio_request_enable,
 };
 
 static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,

-- 
2.56.1

