Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567971;
	b=cO36mgw3WtqUAEyyGdrPdcCDv7Dp9R08iqQWipD2FjHuM0IAAbhzp4To5LopzkhPLM8w
	 rAMlkJ7s08j7Cbt0WEUOchl/mMjrxeqUqfrpEXS4GNpibgLO5zSX4ZsVvqZCndHmCMRS5
	 wMQ1yHhsUrYiKwDlbB0BDNxjtvgdeJpYgUckpQPkMoQ/7LovURJ54DWMSKcchsnmhSQUx
	 Nn4hYpFIHBsP6+x27ugCxbPSaxgPjk5OrLLM/GyXfZ5bm+yNK4oHpisxngI7oeJQbFqkY
	 k7OyEsyyCx4dhhS+cNwzH8/+5lQb02ItMv0X2T6RGa3q8JvY9vB7mYtTo+ikIHKRSNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=pCZoU/KULySiNKg5bHmPXpUGGQnjpXel7S5fY/ZzmBY=;
	b=s2w2lM5+NOCepgSxAteRtHFoDRnCoiLwccxdw1iV8EqCz3WSFgG6C655kfyw9FzQ1pX3
	 1p0URv8UVYt2oEG3W+rGvzyC6aPQPbY3bvT1yaC3uvKWa/fYhh+G+81p3xxoL5eHm+eca
	 /Pr0oQUgeW47ltQAFBNC3yqS8fsE3Arcj8KBW5k52XGMLfNrJrv9sOaRGGlyH3OU/UK8j
	 cdoEDnRcfbFGE+UIBSVGD9+/7JC5/f+BUtfOPONoQtMzxD62B2s1ijkBA9SA+DOhyptaV
	 SoduLnnq/w1toC6cPUILS6/I3m+wJhyBLqzNsLx+jKACX0ROywkDDQgmRabRI7iKeUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=AMsiVTy5;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19854606A88C
	for <arm-scmi@vger.kernel.org>; Fri, 13 Nov 2026 11:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19854606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=AMsiVTy5
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso5186375e9.0
        for <arm-scmi@vger.kernel.org>; Fri, 13 Nov 2026 03:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567969; x=1795172769; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pCZoU/KULySiNKg5bHmPXpUGGQnjpXel7S5fY/ZzmBY=;
        b=AMsiVTy5KpPzmyePVeQ3DrHegJI/2oG4Ui27vx2Zf7JcNOKQnap1YxvM3EoBL38FN1
         zzwccYQdfEc7bp+7vSy47jlAh1AMscPmC6zkymQU26dY3nRyg6JsUscxy6vxwS1OfWR+
         4LsD7BYuZq1GXCDw2EWcHcPC82EKXUnS0LZsnU+K8fNHMSaLmS/njCYZsxR+2qcUYcn3
         MxquBUG1gJ9PEZRHxeCcDUE57NzldDSURyPNlFtEMt5TjFzJ350LC3e9hmDGBpMlzyQ9
         crew0pt0skUclzEUdtNv55AyMj3MrSXltwhVGdqeBFWA0HWOsC4K+UloxBsYvkjXOhSW
         QHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567969; x=1795172769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pCZoU/KULySiNKg5bHmPXpUGGQnjpXel7S5fY/ZzmBY=;
        b=X+d8U1ixmlrlsdnCqEYs7Ccvr5WELkouEGd+rBjBTU803YASK2viBTzhPOD5o1SWKm
         E7eRyqAE6ut89rDZoI6YtzvqI9fnXHmifvTX/7boYc59iHkxSdK3QUDQhqv/ew2ch6bh
         5KxjVZgFRLO77hL01b1H/TOjb5kqEYqZnGE4oh20fpxX3dxQKkGOeVTSs+A+RZcGoe8i
         whkayHMLCf2IEjs+3Sup2APfdX1osgS5Muo2SRlV/XcQepFREUVSuncrlXiAW1m3KoCP
         eEN6XDyLl/PKctHdwNj+CMhcl9ZMo/NZ/mPpPrdj2dtHolCeDYRYlm/SL4pyRJq87iv9
         86JQ==
X-Gm-Message-State: APuU4Z+oul1ggCdtidCJ8cC6QyHqX16KAyu0NrSwnhjbawthZoY7j+vq
	Jzttu52bLuHaKJh8Umm45t3R/HY979GS2RldkSTg1E0bgUzvgEg0FT2qiSX9VPjQhIw=
X-Gm-Gg: AYBFou07Xh+d05YIGLtq12iYtk2YSgEVdQh9xodHA1Ox0aLAnP4pxUBkks+A+rE3hwd
	mEC70OHn9R5w1KuTTgv7V5SEcYJnFF4JZW5ZGEJqMHiY9JrS0YoBcfHLtaICwA2dOYktHmAOF7G
	mZkJXMJ6/2cvw7c+cM85kWCMejT0FjQbq4s0t384sk39shfkhPIuTvk6jmSkcPTug1K/Ofp1ifI
	7wOckQVjzwYmzJ30fr0thZXZSF4QRVU4clL2YffeCBrqadGfo/i0wiGGVrewSZURtvgFZG/LTFD
	hLaStp0MVzbGUFV43wtlj6dJzB4y3Y67clAcMRK4Td2hoVp2b9m1FenR34TQI8vXIFPx73Jzw96
	TNVbAkFfVLN+qbssgryaBBR51CZPgt7J0MPZNqmRkrmE4hY8hl68e4JEdjiA5IP+u1Qdh3uTThi
	9M6Tq32aotirC4K4TR90JsKpW/UJoEdMmlF2kP0V68GzgnoD2eKCxtL6uVbFrLBTA/cjM+58I0b
	5z/q0NGvuhWa4B3FajTlyZXAx/nf21z9GUEURsFmMwOrj4K3SfFT6JLPNDDFv9OmawJik3vbTFJ
	Kx6v3X6o4y4q4D4wlv4TU4plNooA9jdcwkfAFVwE1ApWj1UefyE=
X-Received: by 2002:a05:600c:1913:b0:4a1:fbd2:f689 with SMTP id 5b1f17b1804b1-4bb55a44c62mr47473995e9.7.1794567969426;
        Fri, 13 Nov 2026 03:06:09 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55a68c65sm55915505e9.2.2026.11.13.03.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:06:08 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 13 Nov 2026 12:05:34 +0100
Subject: [PATCH v2 08/11] pinctrl: scmi: mark the GPIO functions
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
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-8-faccb4685d88@baylibre.com>
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
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

Register the functions flagged as GPIO with PINFUNCTION_FLAG_GPIO.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index af9c9575d4f0..43b9d67eb9e5 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -438,6 +438,7 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 {
 	unsigned int nr_funcs, nr_groups, i, j;
 	const unsigned int *group_ids;
+	struct pinfunction func;
 	bool pin_only, gpio;
 	const char *fname;
 	const char **gnames;
@@ -479,8 +480,12 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
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
2.56.1

