Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447300;
	b=sVbsEYbgBh4Ig8BinQlvzlp4iw1arV/Du+nxFFaFjOH0QGX1sTFZKAiGeFjtr+eOP3hU
	 hNbxhOwkPo+Hj1afneLXexqZh8nWSJAhjL4w4MODKJeKWEH/QZv8nEfR3HRqhdHm5Xg5y
	 IQd3oXsc1X6FyPqXQGc+XhedG8JkC0J3vaOdhcT797N6cBi84xnm+oFY2HgojUprQzugr
	 E7DjdA7NHCQNKUmF6HF3HCdAsVbZHTkrUva+cbms26nto2o+crdGy3ieczjg8NjlY5iy8
	 CXvSg76EhfQFLvyJh7cI0m3bROj/9nLPwsP4n8Eq2/yFJxaX/5kKeHQV3pTHGfAJIqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=sXcv808duzGd4FV90CzaztYzyLP3Z0BMAbpChwP6x5Y=;
	b=vNxStuyIWRNXy+JwLmxHBYR0leszsGRbzxxKyJf/Rj7B08F8l9rS3eHJv5zCcyAwhg+t
	 NIIqR8DwQRjlgUuRWUgRN4he3qU77Hte+r/W7A7pztn7Ji8lQzw97+44oPIVF2KSn6tX9
	 0AdldQsyJaGieb+fN19pxQu3bCO21lz4t+cbQ1vmTDDR0uNVi8jBzFx6hC0DPSmS+nRSD
	 YShlb0abgzfVlMBWGbiLdWqBxumTG1vMxYW2zmXkolBsBFGdBYAiuLcSbiWlLZRrmkx5F
	 dYHCeNSMEV6wAr4R/h49E1psHf647mbZktU2yLjTQStP4OEoRqTUm4FwtloZOoZZcRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fM2K8COJ;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4F260A2611
	for <arm-scmi@vger.kernel.org>; Mon, 23 Nov 2026 15:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB4F260A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fM2K8COJ
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso18738925e9.0
        for <arm-scmi@vger.kernel.org>; Mon, 23 Nov 2026 07:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447298; x=1796052098; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sXcv808duzGd4FV90CzaztYzyLP3Z0BMAbpChwP6x5Y=;
        b=fM2K8COJrhrSTLYmm5PH5oE747bBUhT6wEfrGZC0UsIuA8zrm3Qyf3yuPowhjkyLh2
         9Ce2xQivNEDPt5oQa37fnFZPFLVPOrs7+ba+ltWUC7SsC4hOlUB/UT56Bbe3ne87HCV3
         2MulpLiOU3CEgEHOb6vJ/GwFKCgQAcn0bAxbcqKnINpZvD2gVcT9CWUIeSFBJSDVfMNs
         RrSElVBPOjGzfTD+bqfgpryGq6iGhO7VYmDpuMkVu0RGnPBnfxvYRoQigOyM9+lCt2f+
         /6PuZxc5tGD/IMmTHi8nRuP9tYY6wAf4qQjVjGf0uaiMAu4yQHuO9hFq321lY45b32h9
         yXkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447298; x=1796052098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sXcv808duzGd4FV90CzaztYzyLP3Z0BMAbpChwP6x5Y=;
        b=GM92Jghs+lkNxVTJ/Gq4arsCTodTIvhFcWzIJ6VjTwkbLb0B5BvpYiCUxyW4kOIULp
         59lxGi9yKCsjYjDdCFdnWMb0r+OPIBnb/Cklxn3OFluu31ogwp7OvMhbym4h+pCrnu2N
         hF3r8uZtPfpCioTtK/9Vs4zTmiGn9VMZFFxIVVaZ8Cu5d8NupVRgitNgZ5b+QbGTCMus
         QrJi6nzZnAWUva1l9kUU7f+K22YvKuypdqSKPEYBNEtMBztHgDDanvfsOILS7F3XsPkg
         kz05XuVDx4KEPATMpkLHpdAfRksubBUhqbwQP1zyRYZR7DwiXC58KgGkX4pn6fnybmR1
         KG1w==
X-Gm-Message-State: APuU4Z+n2xHDfm70H4bfFKdsaYBz0FB51PhlbJqBeWyBxSMpvRwi6a7t
	iQCO/MuZICRdDIORwX9Cl44fNTduT43SiUOFn2wpG6rEQFkOlcw1N0mgiNlhm738dro=
X-Gm-Gg: AZFdTZdVhmVL/Rjp7lYF7CA2p6qGwCYEyWDoHxQDp6GVzujSpr3mR5AmPHK6uf2tNP/
	pPq/QtaJhSG93G3YC164+euI1HyPElC7r51EM5BnZKXUH1IZLju4rvUCLU4EOLNt+0oqmJtDqUt
	pMU1KqnR53bXEM0wglPGo4LXei5Q+U4OpG5r1RaJ2GoCIWZOBq7LOqzmtyMDHee9gCZ8ZM47zF4
	Qa8zhWpPtAyV8bIPzMUZLmm+Fp+g0PaZTSukdckFPVi5jolS1zoZPorgdPuWRGjWvNA2ssh77cQ
	LHRGaHSB1MQbla9ne8VpVylaYbSx6kweqQ4UguyKL9cRNsKygewaSiJaX0UOxJZHUZHyUMKzySv
	UTrj53Pmq6OrDB0/gXbY8FKRUvTXkuerHJ2+UudWhKKiuK8hFJcqTo+uWkAQv/uEGG/iK5srZlt
	bXpYg/Z/JR2evL3T3Armb6ca8jCYn/0v7Mm79eyEypMbRsusTPhaY4/Ib6Gx+XrBMBFcBodS6WZ
	EEPJMxrhoHQo9ZsPvnjgLovT7jCVh0Tf0eG6rCUa3PinQvxMQ35E29N/o59rKKuXLkwg5FCizRq
	bMy4wRC4aPSJcMIUHMWkqtJLAMhymoQ1tR49QS3Z3uWn5KFXJCo=
X-Received: by 2002:a05:600c:4755:b0:4bb:7033:de79 with SMTP id 5b1f17b1804b1-4bb8881dd02mr249201805e9.35.1795447298146;
        Mon, 23 Nov 2026 07:21:38 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm513780865e9.11.2026.11.23.07.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:37 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 23 Nov 2026 16:21:30 +0100
Subject: [PATCH v3 08/10] pinctrl: scmi: report whether a function is GPIO
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
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-8-d61f039be008@baylibre.com>
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
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev

Use pinmux_generic_function_is_gpio() for the function_is_gpio
operation.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 3965f920851b..ed563514898a 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -81,6 +81,7 @@ static const struct pinmux_ops pinctrl_scmi_pinmux_ops = {
 	.get_functions_count = pinmux_generic_get_function_count,
 	.get_function_name = pinmux_generic_get_function_name,
 	.get_function_groups = pinmux_generic_get_function_groups,
+	.function_is_gpio = pinmux_generic_function_is_gpio,
 	.set_mux = pinctrl_scmi_func_set_mux,
 };
 

-- 
2.56.1

