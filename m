Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447302;
	b=wf4fe+4WashFSeiRMXV2DmwuFC+v0uTze6KhjpMr+HtGJdA3UYHjOj9SQqoDqOdIO4sB
	 R3KmAe7yewcPWkI6CuBB9Ca2IO5iBKlDUUzb6ghKWrHDRe16YR7Vksa94nKtJ0wtCmHzZ
	 jHapAh2sGkYu5puQKPGjR8yvfOO77IR4c8KuN9s9MTEO+3sI6Dqqodxzfs5m+Av/Yz/DI
	 yQPwjgDr6M5oGp7gd3mbAsVQ8JUNxzVQLt1JDjppQSgd6wCNdM/YUEOvA/BLHNSphavXr
	 WUVgwNAR6wJY/uPItwbL5/KYz7ZKyUNosRUA7g1Y5k6L3pevgL0ggJ8iGRKVPUMlCMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=i9NMjvAfw7eusmnV0AZKfdwsVuRZv9qemPp30arLmJE=;
	b=DoT2HtfcHE4j458E6AUHlOZUHLamNIMI83vHlH4JRsnDaSLSDvP3f8eHtVoiu4NFE0V3
	 5pb33In6SwwNbgXnAb2+2dOJb/wMtCFo/eAS/RN1qzCN0A+Rs6ZYcn4Qyt2V7zTna7mXd
	 5dJ8i4F2e/qNQZ/lhA14igANFJsNjwScrsoje/rxhgYeVdOvJ9N2jFXeuSwzy1veetdE4
	 BwDXr7P/tB9pphaV6SD9Qy7iGHjOOA2SLn85+TjTjvAOIa2l3VKwFtJcHnzf3L3aMPhfE
	 s7qrEPl3G7cHM5G/VT4RlrDjKdgYWQO4ww3ydXRs6DMzKTzwi3nNMVD9pLeRjVjuEeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=p0n77Wx4;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7278660A2620
	for <arm-scmi@vger.kernel.org>; Mon, 23 Nov 2026 15:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7278660A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=p0n77Wx4
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b7ddb99db4so4448394a12.0
        for <arm-scmi@vger.kernel.org>; Mon, 23 Nov 2026 07:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447299; x=1796052099; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i9NMjvAfw7eusmnV0AZKfdwsVuRZv9qemPp30arLmJE=;
        b=p0n77Wx4SqlI35wj3vSW5/a4xAdd4wNUNkh6YbMnzBVQ54OiVYdXwuDS9gjnUHkZJO
         113Ix9RduNcBVNZhUsvmmaAQszrFfW10LvTEOpHUVO68WLndMwTMBR8QxmKc1q9/4HXl
         TYgwU3FMu2fAABoP7Ggd9CHuD3hEOlsymAC0F8NBRefLojQKEJqNrBa2etf2kwTwisFz
         042NXBX18mrhZ6KVHLQQTEKrIiFws5bdZrfumK2QmX5qqN3O+VHtMQW7uRaJ8QGZqb9B
         Sss/h2R8j1cWU9e0qjKAJoAIn7t1nww74JCdAIdkMTzlzZE/l6j4r8U61jNwpUWqsH6L
         dG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447299; x=1796052099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i9NMjvAfw7eusmnV0AZKfdwsVuRZv9qemPp30arLmJE=;
        b=j6+T7Hf3Go0RqutjMGTWtYhht22NeyaZHkl0r/dGZ4Eqv8GFtTEadDXENwv/CctDuZ
         7yvnhw6dkvbX05vYHL/FRthyqones+U8pox5T7ftxphkorRu7MZ8IiwOxpe/RissZ49X
         zba7whPIiCcSyoFAdehE42+RDTNy3VAUrdMCMlp+a1wytXVPKEa2vGz7P1K3oEWzYtme
         WlDXrJfaqJqLF2Y0IAWnWWuNsVzw5Qa16W/xWWFVhaUZUeSI0XePOadnsZyrUoJYvJ3p
         FG9tbJwjVtTlPXHXJDn6UcmCmEy7Eyflr/4sEFbEVqhhiSsjc3EzTqAC4/uzK9p2euJi
         waXg==
X-Gm-Message-State: APuU4Z8Kb/aMwlG7q11skmobPuhrh+Rv5Iwjg0huhWyM1r1y6G4AwpIe
	modVE9A5pG2+UaJ7R8JZptVA8HLlXRKcGpIyyjULmPiGiWHFel5EABTXisdwJGfz3ng=
X-Gm-Gg: AZFdTZdhfWp3gAk5+HSOIjEAmjfIZOcg224gJfFmh3P8AbgqeO1dV3b0ox5pARsw2Cx
	Tt9SnOoxk2gBSngOOjvBBXHKAZ0ySoQOnBP2Cs00RSlindSKB6Q71nCKluzHO/VMcWpF+3HJEPz
	GwE6DTtJi2/RpaPlSYBO8YvHoXHdO7ftFFfgYRWZcogFJQqj7a5rP5kbkCLmWOnJgvBdHkQH1Ey
	2xfaCjAHzJFXT0Y+RoqOwOhHJdcKBb1PvA4Afl+H5jfo0S4Po7Iezd2QHdrG94/CVllNGMl3/ly
	aw5s4Zy12Vnw3bP9ccZyuhfnUIR8jP3fnEvzqukv+N4Y1jCpZAPsaN9KS2XR3/5b49Jq3n7v3oe
	gHms+6TV16Y/QsRoNvlYrPHlBZy0kEfZVbMAefJw71PUvQmBZvGfw9/nXLhK5iKUUjfBYrt/C7b
	msgXgkNSzC+8XV/hkFz0K89zzu1SD2yWOslgyQiNiJ55yYKZIjKtBlJAr3+0zO9sfgkmb0qQ3ih
	e3Z6xX8c7wMARwA0Wn078SR7rnnPm9JnhWRlyxfYhJ+AXjMxBBvN55BjMabZXj1rRLD8heDw35/
	rSByjHum4nNZ+KdmQ1UNDFtpwGr+Ed96ZEJOdE8RUSkjVO/RCmQ=
X-Received: by 2002:a05:6402:4004:b0:6b5:8719:6d51 with SMTP id 4fb4d7f45d1cf-6ba37e6f76amr9086912a12.32.1795447298876;
        Mon, 23 Nov 2026 07:21:38 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm22884229f8f.50.2026.11.23.07.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:38 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 23 Nov 2026 16:21:31 +0100
Subject: [PATCH v3 09/10] firmware: arm_scmi: add an operation to set the
 function of a single pin
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
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-9-d61f039be008@baylibre.com>
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

Add pin_mux_set, which selects a function on a single pin. mux_set only
works on groups.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/firmware/arm_scmi/pinctrl.c | 6 ++++++
 include/linux/scmi_protocol.h       | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index 1bc4bca4c48f..4e3968fbc5ec 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -790,6 +790,11 @@ static int scmi_pinctrl_mux_set(const struct scmi_protocol_handle *ph,
 	return scmi_pinctrl_function_select(ph, group, GROUP_TYPE, selector);
 }
 
+static int scmi_pinctrl_pin_mux_set(const struct scmi_protocol_handle *ph, u32 selector, u32 pin)
+{
+	return scmi_pinctrl_function_select(ph, pin, PIN_TYPE, selector);
+}
+
 static int scmi_pinctrl_get_pin_info(const struct scmi_protocol_handle *ph,
 				     u32 selector)
 {
@@ -854,6 +859,7 @@ static const struct scmi_pinctrl_proto_ops pinctrl_proto_ops = {
 	.function_groups_get = scmi_pinctrl_function_groups_get,
 	.function_flags_get = scmi_pinctrl_function_flags_get,
 	.mux_set = scmi_pinctrl_mux_set,
+	.pin_mux_set = scmi_pinctrl_pin_mux_set,
 	.settings_get_one = scmi_pinctrl_settings_get_one,
 	.settings_get_all = scmi_pinctrl_settings_get_all,
 	.settings_conf = scmi_pinctrl_settings_conf,
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 072190e89064..5cea4ee14a3e 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -789,6 +789,7 @@ enum scmi_pinctrl_conf_type {
  * @function_flags_get: tells whether the specified function is pin-only and
  *	whether it is a GPIO function
  * @mux_set: set muxing function for groups of pins
+ * @pin_mux_set: set muxing function for a single pin
  * @settings_get_one: returns one configuration parameter for pin or group
  *	specified by config_type
  * @settings_get_all: returns all configuration parameters for pin or group
@@ -812,6 +813,7 @@ struct scmi_pinctrl_proto_ops {
 				  u32 selector, bool *pin_only, bool *gpio);
 	int (*mux_set)(const struct scmi_protocol_handle *ph, u32 selector,
 		       u32 group);
+	int (*pin_mux_set)(const struct scmi_protocol_handle *ph, u32 selector, u32 pin);
 	int (*settings_get_one)(const struct scmi_protocol_handle *ph,
 				u32 selector,
 				enum scmi_pinctrl_selector_type type,

-- 
2.56.1

