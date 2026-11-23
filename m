Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447298;
	b=5T2HdPPpkD2rkjb8mZx4Szv4ybi6QASJu/yhujZFhVVFsx+nvqpjZkQfIITV7gZKLSv0
	 SYoLzv8hSgWoXE077Js/isxHcXIOqXaAFEIx8wKHQoxRyRetATZeYb575FvDLv6pBsObK
	 1QzSJjiFvOk1CU0UYnHVGdsc3bbhAADxHFiwwIOENgdEUvhWEXJcEVeDuT5sac2v2uP89
	 l2kUSdG/Wm0be4ltOi7OHMBmFEdHRVQzOsRK9orAt+UshhtkQYQTtyExc5qYm3x3drFld
	 8HH/IisQ3AzFzQMhvAMTi5AHqispFeHaewv5pEzw44LoraqhjgGZMB+hviTqwhe9b2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=M/NBo049vkahD6DDx4SDzPe/iIjbhwkc74fZEa7Rvok=;
	b=zflO//KDN5/9C0ga6f0fdiA/EWYbDkgetNJXsetpDUqK1L4vJhOvly9bJ1dJ+A6wJBbb
	 uLlUgvoAlzd2RqQfJtHZy+bPqz6hwIviGaym5OU7nHr9MaKTwjyVMht8j6YW564+w0Kyj
	 nCFgLWC9DaoGE4aiOD1kaFZ53fKOjpQ+tAcBznYtMaS92iOallex6sMFyU3QOSkVuWPW3
	 syFdG4TQy7peYI4/18ydgGiAVE/jAhh04VscMavOqirlQniY3cVxhr2uaIc9j3mDOkS59
	 AxpIOan3vD1IZK+ccPXEBHTJRAgiCAV7ca90CRp3cwABcGySHOOCbG3DSpIci5hzt3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TzjlnWQg;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00080606A6BB
	for <arm-scmi@vger.kernel.org>; Mon, 23 Nov 2026 15:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00080606A6BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TzjlnWQg
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb9d8e8e90so5292745e9.3
        for <arm-scmi@vger.kernel.org>; Mon, 23 Nov 2026 07:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447295; x=1796052095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M/NBo049vkahD6DDx4SDzPe/iIjbhwkc74fZEa7Rvok=;
        b=TzjlnWQg/9m4i46gpOgroSxKPT3OPfsYuFv2HIWxH//jRQgC1d+4f3sVv6eRk1yCJi
         oK8tKqe9nt9Z/wCbJ/OAszCXrmudQ7XEHujtCiY0PwxbrMzB/TO28QWzjFN74iLVUZqp
         wOBZcVC8VR4G2dm9zrNfl6Lre74ublHG/IBbfCSt36l6B6FTQbndFhb0TI1sUWgu8PmC
         pn197lgwk+NWzYF6XfLfCBqn0Pj9U09qsCRtH1J0PN4XfojKBYkXO7+S7Wl2jgsu+Gzz
         Y2NzUJbvdlaE2Jvz0EiuJm3WMIIlYv6hx4BDIiFEnXFLFRakt6r/QczBG+5eLnmq+UHT
         sTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447295; x=1796052095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M/NBo049vkahD6DDx4SDzPe/iIjbhwkc74fZEa7Rvok=;
        b=Svp5MGkST8ecVuLXMvX2gKZ0oAH0ZSdUvnBP95xSS8Gy8UIxr96b4eqijKmTqHqVFb
         xfUF9Ae/UE6zvNT+09+4XAUO6KXwhbI7T/vq1SClN6WQBzqTmBoqBufWCE6Yqsh3yd8A
         llUsHcj4QwGvHxW9g1YaZRk2pXygNrl/sgGWkb6kUIENUNGUUwjbKeHGK2ZQJ/pKBUAy
         xmGQ6KP2YB6gW6mi5XQ0QDKGgoo3IY4XyuGj0FaS1m/EPTsETF3wEe4Z5JJT+Fl25Ki8
         gLPQpnbHTgV45z7kEmeJKPA3+sqRvikdHIUtKdymXThlbnvAQnTg4MdKsODLpsO26SOZ
         0htQ==
X-Gm-Message-State: APuU4Z8b/XHeSj4aySPyByogDUFx/1LlabuZAmIzYKGUZ4IRwmtoWodU
	0cnhe2FmDBkaqaIA3wzfyeKLCsq4T42OQf8GFhYQByjZjABULmtIu/dEDRtWKIfnIes=
X-Gm-Gg: AZFdTZep3JLXwto5DvCrK9IScX15VrAxQmzZ3AvQImKBzpbo62lUVyXigcegmwYcvxX
	I4mBDSOnlQoqfsFV4hNQVbT9ebJVJyaVQiJ/fBYXY1rYFqqPPg2zViIY1jtsEp5yByBYb+Lx2ZT
	Qz8zs/8GPzmK99NDgmXsqG2dY3SEUhkkEwxjVbnuUUwbyFMJGrDV7jucSJlNyEGgMiv540ZWted
	riIr/BnjO1xd1RWJk2br0ewjlPP0LKV/wF/QzH7sgHrmY6wNHxPm4tOdUdn1BL1EHzFpaQWH9IR
	n7jYjhplFi3mcvgvy+JsYtFj0hEi0gSbXyBvM0DlYPoxFZVyzChFdOyIqzOZyFTTsgu6mt9AfY0
	Jau1Wp0khg77kjdtTgHs1QJsdbMCHRjbHB+3W0NyqRfBIFMmTLk0luUvVRfaM7MgCEi9dc6hlXx
	783JIahpA17SPOt7k9fg7bhqeoI6FpM2wCS4eKDgVtmQaZ8CCE972BqEiDlDyjrKQDZ772aKA2q
	xfnhQBAADI3EgOJoIMyHddCLE7meAEFfiWl4+6IHkhagdkQjLnz7tTjQVC4UXOps2r1R0oUhRuK
	dSnRmQ/rbCrw6atRu/OO6CWHXrPW5p38XxoZY2Z8rAdufW9Nxp8=
X-Received: by 2002:a05:600c:848d:b0:4bb:6687:5386 with SMTP id 5b1f17b1804b1-4bb8880c7f1mr260733355e9.19.1795447295376;
        Mon, 23 Nov 2026 07:21:35 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm22128006f8f.56.2026.11.23.07.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:35 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 23 Nov 2026 16:21:27 +0100
Subject: [PATCH v3 05/10] pinctrl: scmi: give no groups to pin-only
 functions
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
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-5-d61f039be008@baylibre.com>
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

For a pin-only function PINCTRL_LIST_ASSOCIATIONS returns pins, but the
driver registered them as groups. Register pin-only functions without
groups.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 23287c3add35..80c6e83a3a2a 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -444,6 +444,7 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 {
 	unsigned int nr_funcs, nr_groups, i, j;
 	const unsigned int *group_ids;
+	bool pin_only, gpio;
 	const char *fname;
 	const char **gnames;
 	int ret;
@@ -456,13 +457,19 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 		if (ret)
 			return ret;
 
+		ret = pinctrl_ops->function_flags_get(pmx->ph, i, &pin_only, &gpio);
+		if (ret)
+			return ret;
+
 		ret = pinctrl_ops->function_groups_get(pmx->ph, i,
 						       &nr_groups,
 						       &group_ids);
 		if (ret)
 			return ret;
 
-		if (!nr_groups)
+		if (pin_only)
+			nr_groups = 0;
+		else if (!nr_groups)
 			dev_warn(pmx->dev,
 				 "Function %s contains no groups\n",
 				 fname);

-- 
2.56.1

