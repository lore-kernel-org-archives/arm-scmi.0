Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375925;
	b=YTXHCceS26GAOV1wdTZsk54TjFCQnB6Q16ao8qwtTmM7/CZJVgTvDbTm5Dkylqbhh958
	 kFt2cKVdBPG3/hDlCs2RPiv2n6zGIzrCxtC9x0Llood/Jl0LbPiRNBZKDG939aDd0Tp6q
	 d4l2lTx+OvEn/lmqQDyrr6yCg5XTwqajjGvxJy2Zla75keVg4p4ey92aHS69tKlQyEZJ9
	 O1mbmJCFWTzTN/GXHnEpRCMzbwHjBjnXce50hlinbKIk4w2VRvtHXI3OuRvX7sYP1HE8F
	 dePDPUqzQLTyWx4pdO26Fv5yWz62K2Uf1wyztX+YEk+qohZKaSMGU2GOUBmQoCKWb+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=UIe/8YDKLEO9EseYJZxm8uj28aQkdc5JjmQoelCGsvE=;
	b=MTvYDM8lFI0Ox4vtrHvOHPlXLoHgmG5lUzJMtKLg4gk1cxkKkcm8/lpIeB7BBnbaTpcz
	 duXwlpSCpwqIzxu5FlzCXKsLHzYVz5Ro/zAEUCgebNaTbv3vDgbzvMrou7Yp5LInFgqE+
	 gwd70RRSdmWswSwHU7IAl41ZqP8iud0BLSWHg/zol4Mc8qU4vVjIzxJkW5quIwEDp/jUM
	 RHcZmYWlZbzcXc7HQ2SZXXgvMel6+8rzAe7OmE1TeFGbF+LMjZJPm5Laeh5jUHa2TSl5Q
	 2tpKeCB8sKMh+lB7NZLnXLAOYVujDj/5ufMoaAiy/fSk+EPRfscBV0lS1rtaY1VnyHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mOqzz12U;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC672606A31C
	for <arm-scmi@vger.kernel.org>; Fri, 30 Oct 2026 15:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC672606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mOqzz12U
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso10384115e9.1
        for <arm-scmi@vger.kernel.org>; Fri, 30 Oct 2026 08:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375923; x=1793980723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UIe/8YDKLEO9EseYJZxm8uj28aQkdc5JjmQoelCGsvE=;
        b=mOqzz12U/LFejC9+hW3SXq2Xej3agCQm8atGTBh16WSKclb7U72U8hodJfoBqBGdFo
         9t+prirfP8gXE7eqlpgNzjZ1lAbH7EKzgyO8BcV8m6x4gi7fd+FN6qBdE6iQvi+wbmZj
         G+/UZIjskHILp08+se9pzO3urcTa+IRRYsiYAy9s0KFimuC7X2VvqkAbjqy00Yx8lcPH
         Icwdd9Ih152ah6l1NoDDx/zPl4JuFjwWfnHOjDtcUUZtVY2LahVxN97BdW+4TxzSOgsJ
         moHb08oLZSPklqUdIWrpBKz/fak6/y1M6Y+0AQXd0baWCglAweH9y45zOzfXlppg7I/O
         ullg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375923; x=1793980723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UIe/8YDKLEO9EseYJZxm8uj28aQkdc5JjmQoelCGsvE=;
        b=BHfKUWF/P0DzZCpJu8F/eqK/fCZGTmNH7Gs1+iM8DEPYlXFZgGW6yCxHlfzz8jnX2o
         b0Z8+62642iGL6Awwm5naGlCaamvUC4TavvNCzqCcTYDBRPXFvwfOd9b4DZ9u8PfVYoI
         NVML6p/hSQmj/jH210L+i4F2crhatJzrIOCm5FGk266FsJw89LLYHYu4F3Mt24iH05IS
         3GC9FocG1glexkAZ6mfeLqOzyo69kTJVGQn5Q9kryYwQKwvsg/D9s4emJgboE8EHdEbR
         varK8e8zFYf2EZEOYde7jWJOHknnz/M2ABpwYCfsoVt/ipCfFI/y66vGmIamCuUD5gUD
         KxJQ==
X-Gm-Message-State: AFq9FYIKUReNgZ+lNbxpN+0CsdlkclZG7oGlvLfM5A6cOa3Gz+44xBC1
	VI1vHABfUfxlhW4QgMcurKUQTY2AEtuh5k4oA3cc7p7qBxwOtPomtsQutA0TVH23fFE=
X-Gm-Gg: AYBFou0n+ermI9tbixjDRDmtVTLvIvX5/ZcK+rPK5AivxP90qiIeIwGoE4Ar26SOtjR
	zbADj97KPzfmw75Rh5JB2uFRUDizlVZW0MYawwNE4BLnr46IBnzeC0RS4hSZzj6nGWmZ4+AQHUz
	ednaiHmEnRXBEwAoOOJ18Pfu9PMJ88ciT+/qZCA8owp9v9N+/4DxyZGRj3aNmG2bBv5UQ3z013z
	rMPUUJLBFEnN8NejHApIfEuNq6W6ySZZyNLtwXtmLcwuy/bCTsjEYuxwgKQh+7kfCeny+A3AS2U
	bJ16IOO0cmDvTQJCEtcFx90Jc1zwp1PRLoxHf0yUmEUHsQU8YMy8oYhzHyY2v2PDSYICAdCV+7y
	OIPTQ3SLYFYJfM/7gV1tIqS9yWkLmnLuVEo4vGQn+q7YT989iIbyBzh5S91IIWmaTEX6A0h66QU
	BtF0pVI2FiGkhht/jH0Hdn5Esfe80eRXu84LRTI7vhdHRFrIV+cywqVaFTpsDrzaM6TASDoy5PK
	BWh10e/7f5A1VYdG7Eyrbt25cVcJt4VDeE6+Okg9ab/dhQUdiYNx4HktQKhD2L+XJc6ndjSsivz
	o0l4MU6eus8lE1MhW/eu70hRJM0VCN7SlwkVTP3eEvZkVLd5Txs=
X-Received: by 2002:a05:600c:a45:b0:4a1:da58:1ee with SMTP id 5b1f17b1804b1-4ac1932b43amr63299065e9.31.1793375923405;
        Fri, 30 Oct 2026 08:58:43 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf396dfdbsm71893855e9.1.2026.10.30.08.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:42 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:40 +0100
Subject: [PATCH 09/11] pinctrl: scmi: report whether a function is GPIO
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
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-9-52d92843ad97@baylibre.com>
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

Use pinmux_generic_function_is_gpio() for the function_is_gpio
operation.

Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 24e02de543ca..6f44e8c0fee6 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -80,6 +80,7 @@ static const struct pinmux_ops pinctrl_scmi_pinmux_ops = {
 	.get_functions_count = pinmux_generic_get_function_count,
 	.get_function_name = pinmux_generic_get_function_name,
 	.get_function_groups = pinmux_generic_get_function_groups,
+	.function_is_gpio = pinmux_generic_function_is_gpio,
 	.set_mux = pinctrl_scmi_func_set_mux,
 };
 

-- 
2.56.0

