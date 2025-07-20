Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8050224256
	for <arm-scmi@vger.kernel.org>; Sun, 20 Jul 2025 19:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753040328; cv=none; b=iZ4QZDE6idjku8GIOEodGIZZpf2rkDSvoOE0kJdgXl9WiJWSwPH+5W1TDX/Lskt5R5ndMdOkkHoDNVceG1NHpu9kw61en6sbIHms12lsQgWCArKClkEPaMV6d6TO3oIenqJKVeANXI14qb/UzsOyV/9vu5YkMt9cwPFVY1b0i+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753040328; c=relaxed/simple;
	bh=65YRWaYQ/xNnHFyu5hWqKKOZEWxUH+v3jmAFlpWeXqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VpBoXLYIPtQE500GTXxNgOBwJv6aoCXY4SfFrrOK7RGF8mnFjgrTRAue4BpABR0C57ZqF6IrlN9tpPzNUO/esD89Us0J+ssn8oqGb5RXgOGsaZVgdaMFRaiD6DxhxLjamjclwCeTzFedn9S+nLvuSMelVc0p6IH34gqi28Li6SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GhgEKvBi; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GhgEKvBi"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-615df2e8c27so190063eaf.2
        for <arm-scmi@vger.kernel.org>; Sun, 20 Jul 2025 12:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753040326; x=1753645126; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sk/Cvjmn3F+MvNcu5ECj0qva2OjAj6ueLb9Dbmgomqw=;
        b=GhgEKvBiSXoS2jkpXTQ01Fz4368D5gxq5tfy8+lrw6IfQp1NMC1s1EAAkto3VIZi6W
         r3Sz2QJ9t6jpdCQeW+Znq5BimyDQBQ3Q25xepI6GzM18upKNAyM8SFSNlZLbkWpOyydn
         Pe9k098ivHjFugjLSG9t5CZ0lRhWiGACLnCcfogiMoOoJtYkjGjMSaN/Pjho/UYZ6CIl
         jl+1MX2PPqLxpj12HyXfGdKTdlQJ4YmDncD14/NoDEMm0gdSZf3HnYXPSKyxvrfru/lJ
         UKMcsKKfu5Cv/RxNm8MU/CeOHiWT7FHqyiWgJpG5s5wAHuBT/lX6smAQTpQjpMAdgybg
         7aYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753040326; x=1753645126;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sk/Cvjmn3F+MvNcu5ECj0qva2OjAj6ueLb9Dbmgomqw=;
        b=bjj1jCs6/Uo6heK6lzLPXt2g4bab+zk/IhtoOWWIQtmWNXcwUWxAJVtg7z6V1gnZe3
         l64P8TfK7sgqXrCVkv4aIRL//KG8Sueimrg8OurN0sFtVLdYo9RJ68XFi/+HJ2ZirJF4
         JcoIwVqFBbvZxM4ohF4gIYAbAVd27OZO5z+zrgRcPj5uWL1QzxbOCcnRr5D8NWwwRqS7
         lMwLkqlay8cLQU0iaqBBrSKa2hdKfUYy1ngzO6bBORtxRip9nMt0cW3EHsguHib9ZEhS
         rBas5OJEGrnbHuYKGS7yH3IHeeNU1/NKv+13AXeSdmmejHoHEpbjLdzG5nBr9bPNlrpL
         bEcw==
X-Forwarded-Encrypted: i=1; AJvYcCVja6g25MfFNc0Z9lLhAbcp8mmVgr3GgYe7zQUxDKRcMFWNTOBQw85JfrI4l5J5+Rhmn71R8FprMA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8pwohUzuqSphGsEuEXV6HTGQFlu595WeBF7koh0zQFUc1ezH3
	m7Ct+PqPdBtjaz4T1CqXEvCARTOUx/BzUiJ26mnqe0k2vQBd9KYSGHZ30VtWNRUVZjU=
X-Gm-Gg: ASbGncvF7x6DzlC87gtyoiu2TH0bWZPyuSftXSTRO38tzE+GW2ZGTHLiDcjsm0jif6H
	v50Ws0qTpwm5NjkCidIqDJtmue6MESKRgVP/KRQuz4N1DYvlH7undJF3VzMDEwfrcXXO+si3Yqh
	b4/UQnwnrm3hh5iLuH6WWTVLL/35IAwAurVoPWdZHWDJ0N8vAIexVTL7BCUJL6HhqxE11wcBHf9
	+QSbOlLr/NpNyZg0OzbbJIBM3znrbzyti2X6wadpD9w4yic9MStrerGvZadXB3Zply4A64blAno
	68Puc33wNedf+1fRoTvaQmPSxvqfiWOY2+xgk6OEwN+h4KnrhDRqViLQNPkaL0UG+92Wexh92QQ
	jwGYwPnyElGYdygTLCtt5ZA==
X-Google-Smtp-Source: AGHT+IHv3AJy6WvLlnGO2CccdtcgTjsbozHvajCI7dbyHtAdaolcMplcFhzuNXWcUN+G/rBrd/RjDA==
X-Received: by 2002:a05:6808:10d0:b0:406:2bb4:cd77 with SMTP id 5614622812f47-41d034f1585mr12534170b6e.5.1753040326039;
        Sun, 20 Jul 2025 12:38:46 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::1fec])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-41fd498d8d4sm2027882b6e.24.2025.07.20.12.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 12:38:44 -0700 (PDT)
Date: Sun, 20 Jul 2025 14:38:42 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Michal Simek <michal.simek@amd.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC v2 2/7] firmware: arm_scmi: add is_gpio() function
Message-ID: <fbcf6cca-784e-47bb-9b61-3028f59a92ba@sabinyo.mountain>
References: <cover.1753039612.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1753039612.git.dan.carpenter@linaro.org>

Parse the GPIO response in scmi_pinctrl_attributes(), set the gpio
flag, and create an is_gpio() function pointer so that it can be queried.

In SCMI only functions and pins have a GPIO flag so that's why groups are
not handled here.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/firmware/arm_scmi/pinctrl.c | 34 +++++++++++++++++++++++++----
 include/linux/scmi_protocol.h       |  2 ++
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index d18c2d248f04..10c92007bc1b 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -28,6 +28,7 @@
 
 #define EXT_NAME_FLAG(x)	le32_get_bits((x), BIT(31))
 #define NUM_ELEMS(x)		le32_get_bits((x), GENMASK(15, 0))
+#define GPIO_FUNC(x)		le32_get_bits((x), BIT(17))
 
 #define REMAINING(x)		le32_get_bits((x), GENMASK(31, 16))
 #define RETURNED(x)		le32_get_bits((x), GENMASK(11, 0))
@@ -107,6 +108,7 @@ struct scmi_group_info {
 struct scmi_function_info {
 	char name[SCMI_MAX_STR_SIZE];
 	bool present;
+	bool gpio;
 	u32 *groups;
 	u32 nr_groups;
 };
@@ -114,6 +116,7 @@ struct scmi_function_info {
 struct scmi_pin_info {
 	char name[SCMI_MAX_STR_SIZE];
 	bool present;
+	bool gpio;
 };
 
 struct scmi_pinctrl_info {
@@ -189,7 +192,7 @@ static int scmi_pinctrl_validate_id(const struct scmi_protocol_handle *ph,
 
 static int scmi_pinctrl_attributes(const struct scmi_protocol_handle *ph,
 				   enum scmi_pinctrl_selector_type type,
-				   u32 selector, char *name,
+				   u32 selector, char *name, bool *gpio,
 				   u32 *n_elems)
 {
 	int ret;
@@ -217,6 +220,8 @@ static int scmi_pinctrl_attributes(const struct scmi_protocol_handle *ph,
 
 	ret = ph->xops->do_xfer(ph, t);
 	if (!ret) {
+		if (gpio)
+			*gpio = GPIO_FUNC(rx->attributes);
 		if (n_elems)
 			*n_elems = NUM_ELEMS(rx->attributes);
 
@@ -610,7 +615,7 @@ static int scmi_pinctrl_get_group_info(const struct scmi_protocol_handle *ph,
 		return 0;
 
 	ret = scmi_pinctrl_attributes(ph, GROUP_TYPE, selector, group->name,
-				      &group->nr_pins);
+				      NULL, &group->nr_pins);
 	if (ret)
 		return ret;
 
@@ -689,7 +694,7 @@ static int scmi_pinctrl_get_function_info(const struct scmi_protocol_handle *ph,
 		return 0;
 
 	ret = scmi_pinctrl_attributes(ph, FUNCTION_TYPE, selector, func->name,
-				      &func->nr_groups);
+				      &func->gpio, &func->nr_groups);
 	if (ret)
 		return ret;
 
@@ -772,7 +777,8 @@ static int scmi_pinctrl_get_pin_info(const struct scmi_protocol_handle *ph,
 	if (pin->present)
 		return 0;
 
-	ret = scmi_pinctrl_attributes(ph, PIN_TYPE, selector, pin->name, NULL);
+	ret = scmi_pinctrl_attributes(ph, PIN_TYPE, selector, pin->name,
+				      &pin->gpio, NULL);
 	if (ret)
 		return ret;
 
@@ -815,9 +821,29 @@ static int scmi_pinctrl_name_get(const struct scmi_protocol_handle *ph,
 	}
 }
 
+static int scmi_pinctrl_is_gpio(const struct scmi_protocol_handle *ph,
+				u32 selector,
+				enum scmi_pinctrl_selector_type type)
+{
+	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+	int ret;
+
+	ret = scmi_pinctrl_get_pin_info(ph, selector);
+	if (ret)
+		return ret;
+
+	if (type == PIN_TYPE)
+		return pi->pins[selector].gpio;
+	if (type == FUNCTION_TYPE)
+		return pi->functions[selector].gpio;
+
+	return -EINVAL;
+}
+
 static const struct scmi_pinctrl_proto_ops pinctrl_proto_ops = {
 	.count_get = scmi_pinctrl_count_get,
 	.name_get = scmi_pinctrl_name_get,
+	.is_gpio = scmi_pinctrl_is_gpio,
 	.group_pins_get = scmi_pinctrl_group_pins_get,
 	.function_groups_get = scmi_pinctrl_function_groups_get,
 	.mux_set = scmi_pinctrl_mux_set,
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 688466a0e816..b4ad32067fc4 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -792,6 +792,8 @@ struct scmi_pinctrl_proto_ops {
 	int (*name_get)(const struct scmi_protocol_handle *ph, u32 selector,
 			enum scmi_pinctrl_selector_type type,
 			const char **name);
+	int (*is_gpio)(const struct scmi_protocol_handle *ph, u32 selector,
+		       enum scmi_pinctrl_selector_type type);
 	int (*group_pins_get)(const struct scmi_protocol_handle *ph,
 			      u32 selector, const unsigned int **pins,
 			      unsigned int *nr_pins);
-- 
2.47.2

