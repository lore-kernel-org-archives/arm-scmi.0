Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447297;
	b=bRrqnFOJzmIQiUjyeqt3+CRC8aoTVGDWUvPG4pW3d/WVQpP4JAtcPiVa5kHkfXJEBbV1
	 DLr/4rbGgmaV7a5o9ozZ5iJro7l4bMuWjDKneYD1hdrfSm3a5v99ERaXZaJ5718aHwI/m
	 9yVDOTmLJYAcn48LXtit4bYtTeyNJUYpmb4mQC4bEYldrUgN+cD5dpl7deTnf7H4KnIGr
	 5ENe5Tg3Cveti063YEx6IBPdkdTXMzTnQxh9mnoz41jTdFGPb8PolxIDTS3xdwkMPJ/0b
	 Jdpa14YQZoroanG2RehdMuHuuD5ekbfedU1P/lrmC/OeyQEoqStjtZ9IYcbmiqPKogA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=19wtD7ctexcupGN1rAHyajgeUpgLFt6VgBl9fWgXjN8=;
	b=roG2nMPq1v6NJZTsmHLv6IN17Ssywt9FvbuaZS9MLF9XHgt/4TsHzeHpvr7tLMVyMm6n
	 z6yq8ncKID+1TNaJ3cZf9uiIlHFAe0d009qTU30CR6ZxCFEifq8EFvuUv/LciFl1Z1+as
	 TWEnjZDHQ/4ppzFQ5dS8Znv1SUxABb3yYNbce9mx1SnQkxklcpA46lG0nWxt6qMEq0lIt
	 IZpSpLalS4xOLQc+zl3oi4v/+y61aAIb2ZgQ2RK8kFHQmy6Fge0dItUto0O9ZtbyOaUIO
	 5EvnGVfitau7VVUDvwaDngv2oU8QXG9EUUamw73qAbyJ+qV0kAFdJeX/LcWcGZn8izw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MaZi7CmT;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7C5606A6AF
	for <arm-scmi@vger.kernel.org>; Mon, 23 Nov 2026 15:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B7C5606A6AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MaZi7CmT
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so30096415e9.0
        for <arm-scmi@vger.kernel.org>; Mon, 23 Nov 2026 07:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447294; x=1796052094; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=19wtD7ctexcupGN1rAHyajgeUpgLFt6VgBl9fWgXjN8=;
        b=MaZi7CmTAvz5jvCoW/2LqujGaVlkK/ho53r4KJmPkYOBQvqOWQR793J4rzW+E6GpfU
         SoPesaayq8f8Hj0W/aUOilS8O83Ui9hZ72F4VNAP3slPOmkroXFB92GR8u/icdi0iWnZ
         i7sDT/CI9pEyn8EakiDCImc0jYixycjVt7VOT3OoXMcquWQaCDgXy6QAGE8DxqMLCnV1
         JO22HGL4yDIFB1r5Rf8YhueROhChV7yaKapldMWLdFmL0nQ6OhLn+BPmHCQRvA0og3LW
         5lsjxTpFYUp3dV4p05blvT12WrQ7DfOTOW4QfMwq9ZOE0w4VGfr8cgwaOdWpKBJMmqHZ
         Eo7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447294; x=1796052094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=19wtD7ctexcupGN1rAHyajgeUpgLFt6VgBl9fWgXjN8=;
        b=izY5YXq/p+CACzIhApxX9s66anNUW0vwduYyCODU++XGMDZbixqNwmMSc5U16I+NBo
         dKbsrHXInBwDlbg1pyReVAOnnVX6QAZmLjhMZ0ehqWc/NEZkUIXqNdUpWv0XFtprI2Wk
         fvAem1eKgFr74lXFS/MdIMQSuOpamBmJrTOLfSGVoO9pjtwpJZyO7/wBuYFWtG/Uzuhd
         dkEbWpbMiMn+YvMUCuUjoikElvFMoh6W/k0VDr1FO7+i22amBcmay5/Do8BwyUSXih0B
         E7qzrspYRGYwnp4+V63h+SgJDeggmDur8OK2wHkeRgBo/Dwuiu7TBJy3OX7S2lHgjy0l
         AJ5g==
X-Gm-Message-State: APuU4Z/2x97Lt5irSto89Eb5sGs4oL6MPzMsWrW+1JlTCbpLRYIkGN1H
	wBc1d7o61V5nxmW6riE7uS/a7wyaZ5n+iocfnz4Wlk38Um85aA1E6jIMghXJhQ/1wq0=
X-Gm-Gg: AZFdTZckCmnCdNs3JlS01TcMKbVYm5Fkf9NUjUdDIJWcK62Y2y9GYee+XHubQfZDltI
	zXABxR3BqGcjQ0i5spyLCe1jZMmwUXOaedYwOJpZJE8kMDfAZTBffXEA/je9cexc02gXSb1zkbS
	rxTGvg396wYuwNCzfrPWgVLaH91jggdizyjJj95pUdWzvyOYU9Hvb8jHhSzwokN/K+2/crInD+c
	tTAt5A5H9wa26LnS/IzaWPpevbCy7d7rS2ko/Fk+2Au2r5KwJUz2477lb93CEDMnYEGuFtgMkEW
	RBC2+6UIJC17LjXQKiq7ugdwHFFuq0hZlLNt23VeTrMThJ0aclhTSSDxAFxu/Lpo73e/9fcwNJj
	QMFgJytejb0ya6bSEdL0swH/Mq5XptFsyLExto7hLBYsLLlymjEN3EM/p5dHKM/mp88OfOeey3/
	1liBkhfzYP6gzKXr9RrEx7WONVrux2Fy7M7+Jq65bbIw2oz9gdX8Pgn8U5cIPXUiz9j5S7hj8P9
	UUYGzWq/adFswao4aaQwm+1kg0YsdCkXU4mYRkAxBn1zgKfNYGB/uvvTKFtXGtPv/3QexbKS13y
	7tiqh4667dOKtrH+lOjb5AujpUJjvf5/WZb212hoML1QtgQelLc=
X-Received: by 2002:a05:600c:5303:b0:4ba:495c:2f5d with SMTP id 5b1f17b1804b1-4bb8880767amr217009255e9.9.1795447294554;
        Mon, 23 Nov 2026 07:21:34 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm133041265e9.3.2026.11.23.07.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:34 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 23 Nov 2026 16:21:26 +0100
Subject: [PATCH v3 04/10] firmware: arm_scmi: report the pin-only and GPIO
 flags of functions
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
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-4-d61f039be008@baylibre.com>
References: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
In-Reply-To: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev

PINCTRL_ATTRIBUTES flags a function as pin-only when its associations are
pins, but the flag was dropped and callers took them for groups. Keep the
pin-only and GPIO flags of functions, and add a function_flags_get
operation to read them.

Fixes: 2145af01b9cb ("firmware: arm_scmi: Add basic support for SCMI v3.2 pincontrol protocol")
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/firmware/arm_scmi/pinctrl.c | 42 ++++++++++++++++++++++++++++++++-----
 include/linux/scmi_protocol.h       |  6 +++++-
 2 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index b071d31b5c33..1bc4bca4c48f 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -27,6 +27,8 @@
 #define GET_FUNCTIONS_NR(x)	le32_get_bits((x), GENMASK(15, 0))
 
 #define EXT_NAME_FLAG(x)	le32_get_bits((x), BIT(31))
+#define GPIO_FUNC(x)		le32_get_bits((x), BIT(17))
+#define PIN_ONLY_FUNC(x)	le32_get_bits((x), BIT(16))
 #define NUM_ELEMS(x)		le32_get_bits((x), GENMASK(15, 0))
 
 #define REMAINING(x)		le32_get_bits((x), GENMASK(31, 16))
@@ -107,6 +109,8 @@ struct scmi_group_info {
 struct scmi_function_info {
 	char name[SCMI_MAX_STR_SIZE];
 	bool present;
+	bool pin_only;
+	bool gpio;
 	u32 *groups;
 	u32 nr_groups;
 };
@@ -188,8 +192,8 @@ static int scmi_pinctrl_validate_id(const struct scmi_protocol_handle *ph,
 
 static int scmi_pinctrl_attributes(const struct scmi_protocol_handle *ph,
 				   enum scmi_pinctrl_selector_type type,
-				   u32 selector, char *name,
-				   u32 *n_elems)
+				   u32 selector, char *name, u32 *n_elems,
+				   bool *pin_only, bool *gpio)
 {
 	int ret;
 	struct scmi_xfer *t;
@@ -219,6 +223,12 @@ static int scmi_pinctrl_attributes(const struct scmi_protocol_handle *ph,
 		if (n_elems)
 			*n_elems = NUM_ELEMS(rx->attributes);
 
+		if (pin_only)
+			*pin_only = PIN_ONLY_FUNC(rx->attributes);
+
+		if (gpio)
+			*gpio = GPIO_FUNC(rx->attributes);
+
 		strscpy(name, rx->name, SCMI_SHORT_NAME_MAX_SIZE);
 
 		ext_name_flag = !!EXT_NAME_FLAG(rx->attributes);
@@ -614,7 +624,7 @@ static int scmi_pinctrl_get_group_info(const struct scmi_protocol_handle *ph,
 		return 0;
 
 	ret = scmi_pinctrl_attributes(ph, GROUP_TYPE, selector, group->name,
-				      &group->nr_pins);
+				      &group->nr_pins, NULL, NULL);
 	if (ret)
 		return ret;
 
@@ -691,7 +701,8 @@ static int scmi_pinctrl_get_function_info(const struct scmi_protocol_handle *ph,
 		return 0;
 
 	ret = scmi_pinctrl_attributes(ph, FUNCTION_TYPE, selector, func->name,
-				      &func->nr_groups);
+				      &func->nr_groups, &func->pin_only,
+				      &func->gpio);
 	if (ret)
 		return ret;
 
@@ -753,6 +764,26 @@ scmi_pinctrl_function_groups_get(const struct scmi_protocol_handle *ph,
 	return 0;
 }
 
+static int
+scmi_pinctrl_function_flags_get(const struct scmi_protocol_handle *ph,
+				u32 selector, bool *pin_only, bool *gpio)
+{
+	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+	int ret;
+
+	if (!pin_only || !gpio)
+		return -EINVAL;
+
+	ret = scmi_pinctrl_get_function_info(ph, selector);
+	if (ret)
+		return ret;
+
+	*pin_only = pi->functions[selector].pin_only;
+	*gpio = pi->functions[selector].gpio;
+
+	return 0;
+}
+
 static int scmi_pinctrl_mux_set(const struct scmi_protocol_handle *ph,
 				u32 selector, u32 group)
 {
@@ -773,7 +804,7 @@ static int scmi_pinctrl_get_pin_info(const struct scmi_protocol_handle *ph,
 	if (pin->present)
 		return 0;
 
-	ret = scmi_pinctrl_attributes(ph, PIN_TYPE, selector, pin->name, NULL);
+	ret = scmi_pinctrl_attributes(ph, PIN_TYPE, selector, pin->name, NULL, NULL, NULL);
 	if (ret)
 		return ret;
 
@@ -821,6 +852,7 @@ static const struct scmi_pinctrl_proto_ops pinctrl_proto_ops = {
 	.name_get = scmi_pinctrl_name_get,
 	.group_pins_get = scmi_pinctrl_group_pins_get,
 	.function_groups_get = scmi_pinctrl_function_groups_get,
+	.function_flags_get = scmi_pinctrl_function_flags_get,
 	.mux_set = scmi_pinctrl_mux_set,
 	.settings_get_one = scmi_pinctrl_settings_get_one,
 	.settings_get_all = scmi_pinctrl_settings_get_all,
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 3f7cc35eb861..072190e89064 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -785,7 +785,9 @@ enum scmi_pinctrl_conf_type {
  * @name_get: returns name by index of given type
  * @group_pins_get: returns the set of pins, assigned to the specified group
  * @function_groups_get: returns the set of groups, assigned to the specified
- *	function
+ *	function, or the set of pins for a pin-only function
+ * @function_flags_get: tells whether the specified function is pin-only and
+ *	whether it is a GPIO function
  * @mux_set: set muxing function for groups of pins
  * @settings_get_one: returns one configuration parameter for pin or group
  *	specified by config_type
@@ -806,6 +808,8 @@ struct scmi_pinctrl_proto_ops {
 	int (*function_groups_get)(const struct scmi_protocol_handle *ph,
 				   u32 selector, unsigned int *nr_groups,
 				   const unsigned int **groups);
+	int (*function_flags_get)(const struct scmi_protocol_handle *ph,
+				  u32 selector, bool *pin_only, bool *gpio);
 	int (*mux_set)(const struct scmi_protocol_handle *ph, u32 selector,
 		       u32 group);
 	int (*settings_get_one)(const struct scmi_protocol_handle *ph,

-- 
2.56.1

