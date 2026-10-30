Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375924;
	b=BeW6yFzRcigmeji1lPRuJyz9oR5rDbK1Ew6+/jxUghRtt2VzGeaOUGctk0dmgJSLynVk
	 cyCOYalfJaHYQGD64a1UFmcCECgpYNmb8Jw30bAowq8q07AQIbQJaqWnivgSo5d9o4eUh
	 04sD4aeaXoSeBgj4ZylwucLAM1Xp1NzJxDzsVBiCUpeWSQ7iUVU7TFxmADgSsKi/MBwP5
	 KuH+IEhsttfebQx+logZzuD2ITnJE2HBnVrjzpIe1fiGX3/rKnVe/2WnVAWqAlAqX5RcZ
	 vz0tnSktgURv/z+Z5lopJh3G8icDh+L4QNz/Lpn0Ib+gnnCQx9I0ZVcwD4y0iGwQj9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=D9EgsHJBSN0ffaKVUHnt8yIvPrx8yzIST2CQLH5g6Wc=;
	b=4NqD34+LD80tqz97M6Cwe+gZXZ33WoYEd7B3kfeXKapqqOCeRNNEYGaB1AV1pnwffLym
	 lHq6BX+qb+b/2HN/wzV3uvLEdl0p+MM0c6hyVfldA3h4Of6S1wjiJSk5ptnNCnfTxy9Z5
	 4njDY4WP3YoCIifGOB1J8nEWZH7vGNuai8yaKpnY0WC6UGb3MwpVv1aT3mlc4cZVumps1
	 bl1/oMIWQvS4Dtju1y4PwhUYwccOdTsi8yTQBoRrwT5kZsbWD7vzo4IJgRFyTUGkYsk/h
	 hhtiCnJxxfcy2W/zr3nxxcAxokqr/gciEyh9pLiCmaaygxdMGGl77V0ARqOWjNdOXtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=k6O1SYsD;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14430606A33C
	for <arm-scmi@vger.kernel.org>; Fri, 30 Oct 2026 15:58:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14430606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=k6O1SYsD
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so6478875e9.0
        for <arm-scmi@vger.kernel.org>; Fri, 30 Oct 2026 08:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375922; x=1793980722; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D9EgsHJBSN0ffaKVUHnt8yIvPrx8yzIST2CQLH5g6Wc=;
        b=k6O1SYsDSVANxNNncBHsTL2zKt4/f8ljHmJ7SYl3TJrL3w3FUhVt5OsfZch+sG8vyz
         XKU0m9LGvta8AsVbxbCSGkGhBGYADZE3EsfvCoGIMqEuAopf9e4EB5fG5KuGMW6Wlkh+
         rS8D8ftTYLpVKV5iKTfQIYd0v9E2zjTBTfPHtk1T+p3QNUnzBZnt/DyKLFRpdJQ7h5jD
         sex6DHDEoLQOUpB4+gUo4MsUcdnH1sI2os8UJkidevVErmtKVvJTbVyuc1zDYBXLUyBD
         /z8EOA6UGtubC6HBeWh29Av1KRvL1xYqRvTxwbGj4/jPFuA6Q2b6qlhpRRiLIafJylol
         mQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375922; x=1793980722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D9EgsHJBSN0ffaKVUHnt8yIvPrx8yzIST2CQLH5g6Wc=;
        b=Nc0wsXfBMlJg7gUbsRLfLdOIngvkYWaUuUMvLVgxVLwYxPCCfZX7YPH21aTgUtLCLM
         cPYoJ3ex8k8mifXsLOjNCXanVpeW/B3rFFLJmt8wIu3nMzmriaQZB3dloE1qRqPNX+M9
         h6GfcLO6BqWu9FVG7oVuNquvOex1INISRppiMu8GFS49uVTDj+xb+1zDgVSK38DYgq/G
         Or5h8qNPXUVXWOWucqGq3iEayEyONW+D6i2wlJNt8aZBH9ppytvMSTQJdCrwiUwK6jGi
         TBWgrojM/mubdgjI6yhPolCBAB49/2oRFHFo63dPLfVLwXNyLRSv8+Fa9qPk+zIWpEqc
         3oIw==
X-Gm-Message-State: AFq9FYKv9xl/UTzZ/bGOJFh2a1Q4rdY1xZwI0VJu5F79pNEYMFrOAKpP
	2dKmlG/isdoip2ukjgJDClKgc07iUGNA8n9fEQpgCAkr8Y8UmU4ytB18OmsepwMpVJU=
X-Gm-Gg: AYBFou2OPZeT6dSoCaP6f3VzI6KPi0+wSOF04fVLsbM2DaLxS8694iGrfI6vymA20xF
	hYILl/BRdUyZjpp3rqAY7Uik51X1RkeKCVlxznxdwXcHCyVPYyPiJDz6CImYN5soMItZRz4/dmE
	3eiuHIbaDOu3ygHoLb3RwZpHGzRTBTrPwqUYdnb9o8ppGW2wq/oBFZTYisuf4Lgq4qws9Foz6Hb
	12Z3xgtGRN50lBOPbC/kzxsrEkAmT4uAYUBxsYFPfuO1a2jZaUgIG5vjRZ34Ptm7tv0iArRn6Gk
	hHaBaAqjEWf+ddyulX3GFlPhgEH9bhLBHG9NatECd6TbbsslUCipshTX7+te3FSGvMhj+WLhsHS
	kTtqZSf9QPxolChLAfTPJhR4ZynwcW0j4V3i6WdhvxcpF93mMr/TLqltUIx2wRXCUbsvj2zEN58
	BogYgMHbA8zhbmXGB7WAP7wtHohNa9j5av1aHp8Bg6GZVbHwTSsIDID2wcURDAMmfTadv0RhLw7
	Hk+BNGs0NbMnbbg2I4PYs6thdn3RZO15079BkrRMgeyIWoOVF3OWTDHuWFx/uYdrC4kBcR5rm6u
	tY4M5mnoV0Lx+GpCVrSzkr6v9x2xc4HaCblNbyD92c0Fe/GCLR8=
X-Received: by 2002:a05:600c:8116:b0:4a1:ddaa:571e with SMTP id 5b1f17b1804b1-4ac182dc29cmr57138645e9.15.1793375922493;
        Fri, 30 Oct 2026 08:58:42 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe885d91esm50402805e9.0.2026.10.30.08.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:42 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:39 +0100
Subject: [PATCH 08/11] pinctrl: scmi: mark the GPIO functions
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
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-8-52d92843ad97@baylibre.com>
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

Register the functions flagged as GPIO with PINFUNCTION_FLAG_GPIO.

Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 1a14e254f011..24e02de543ca 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -443,6 +443,7 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 {
 	unsigned int nr_funcs, nr_groups, i, j;
 	const unsigned int *group_ids;
+	struct pinfunction func;
 	bool pin_only, gpio;
 	const char *fname;
 	const char **gnames;
@@ -486,8 +487,12 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 				return ret;
 		}
 
-		ret = pinmux_generic_add_function(pmx->pctldev, fname, gnames,
-				  nr_groups, NULL);
+		if (gpio)
+			func = PINCTRL_GPIO_PINFUNCTION(fname, gnames, nr_groups);
+		else
+			func = PINCTRL_PINFUNCTION(fname, gnames, nr_groups);
+
+		ret = pinmux_generic_add_pinfunction(pmx->pctldev, &func, NULL);
 		if (ret < 0)
 			return ret;
 		if (ret != i) {

-- 
2.56.0

