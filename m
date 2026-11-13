Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567970;
	b=0vH1KkGqXQ50CGgxCS38l7m20YO//bUFHioixD6h8VnPG2W0H+pvtu2qMkHDhERwmckU
	 Xs/VwyZuNnmkNStxzySrgKxqA2b2yt2tDDl5h01wCa944GkDBb1u0UvBQ1wDqisKDbTw7
	 AsVIlU6ho0K6UKBR2/W5fvLBIC8aU/DVwaCvlt41jGedZyOmvOwZW7K7WX5ZV0ltwmrpU
	 ZmyyQL5JQAkkuBtf0jQimu2KK6oAT+SRUItiyt/8dt8LBBVAxBPGoSaXcIA/wp8/Xp053
	 973H3hkAvSjZnYHYqfU9/xOJ5/xT0ZEveJQ3Rzna9iX8w4f5k1Xe+lCZzAOv77cnN5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=teRGzhM28TxtybZMIK8blfwTtPC/WbwQiaC+ARqgiLw=;
	b=d9s6HAx43C/8K/mbjBfoTzgqt+KOdjLG1OUwJ3b+rLRvh2nBBDv3oo5BPtUaNmIH1wpU
	 EWJcfmyeXhUoizDESYPMsLRxi4du4wCo64l2NJWjW416dQ4LmgGs2Xuh4LGazY48r2gGF
	 DLm8vSx/ODt6OIlKbtT/5TGCbcMyYyfb6/1vaBONHleJ74BYd5Q2LDuo5Z2F4UhPgb32t
	 /ZJCz9VaqliQuS240fPKO9vKuipu3f9TxZBYrv3z0p6T5FtlYR4bC/PwYM3x2nHomamPQ
	 4gAmZ74THqvxXkpo7go909sv+NUTqL6Kd8RyzNCoGmBLxfWoHEAD2MTzelLpXYzJ7tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=K2jjVEB1;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED41560A6F70
	for <arm-scmi@vger.kernel.org>; Fri, 13 Nov 2026 11:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED41560A6F70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=K2jjVEB1
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so3121025e9.0
        for <arm-scmi@vger.kernel.org>; Fri, 13 Nov 2026 03:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567968; x=1795172768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=teRGzhM28TxtybZMIK8blfwTtPC/WbwQiaC+ARqgiLw=;
        b=K2jjVEB1mLJWjhTJpRB9psU19OPXBvnrKk5tE2lHWk07SqGFTGSWLuQDjNHgFC2o4H
         MSCmk2xHHOTTNcoXvRE8ji59y0bIPLjAR4m+woKr0THxz/JPrlxNgM3IRepJ4P904xCX
         9GdQT/Abq6hm1DkZc6VlrWXJYxQ3bnm6en2Gr5lQSi9j6s0K1Wbj2/B55OMWhs6MNKoV
         ZQy2M2mn83GnUjPD0TE7iBP1wQ1mnoLWlS78X2JU1CFTWQOwu3kN5FChNzifj3g7M+DB
         /sRLN1LU80u682yDaomImL82RdSPepEHe0Jwcm5glOp8PvmdehDBYBmHOn4If9troQfZ
         oRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567968; x=1795172768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=teRGzhM28TxtybZMIK8blfwTtPC/WbwQiaC+ARqgiLw=;
        b=on32YdS9wRrEAO7SA0ehK0rver8qY66pcM7+nA+6Ms/ePuienUukREmblJlzNgg5wF
         Cx4oKWg9MCFOAOYPSD5AFF6lp1e9448hHfcBc4BLPIMuJYP8PUI1SohCFyVrGtmr3YUm
         4k3CCcsY9ckxI2rpYrcSRko0J6dqKM3Q6+8q2xcf9GjkEz7mxBsEmHf8b9x3gp0IKmuH
         DdT/xwfXazWYaseOwfHIP9+jotSF2/3ZOwNtIW68Ued5VwiEcDa6lnbI7j7rqg/57uec
         5oGGSC0nHWe0ts52qbv20KKHkez9+FFSJEKtsqftKv1+x9X1vtL8vYpy2BsTlzcvoXRe
         5luA==
X-Gm-Message-State: APuU4Z+zhRotv9eG3ZFuFAW8NdMAbUg8w6SUPshCesswRnkT5bFDDRiY
	Bn+ge4/PcraHkaNhWAfoPiZo1fy7kudeyNeseQea+88Eak6d7YYAXccKiC5c3FkdV8M=
X-Gm-Gg: AYBFou1bpvgd42I8TZUh6PcECjCYuK7VlPixkxAdjAwwLNTND0VsPvX6+f2o5EoQzEV
	9jSr0/q7e9AaMOYDap08Dopne7fZXs1epPz6zUfSk9ngSPMED2rvU5wfcipOisXtWJlKjs25XgI
	Tx861dbredwevhfCfOAT7/MsoDDALwLRTlMnkz51xV6fnr103mI9bDr1iH7i1KVQfkHNsr8AVFA
	G9aO3JUFWBoVAUOladh4WL2bMIBjXzRV5HnOMdZQfjaMk1UdACs8qRvlFe6ljQiCQ+V2BZNbqk2
	SbDD6QTQnmb3UpKZEVGkuWY9M7p87O6myJmXmZpvuzF62sJUskrxr5f8VURXYkuL/WxhRszpoCr
	9PEWrndd17bIVGSbuzBpXRYpXdpaqSyM+3xYV06AtXng+tL+qgzRhJCbFX14JECQNkQneRyy7wq
	UrTCeQWHMDR9XSgI/ti/5QvemGOnZva3+76oCdqxCiYGX5ZfDDtopAVClabnsczpk1PA9Nmi7cN
	XuKJM4cp9XYNSTmujgEY5gYpjbOllcQzQGVXDz1b+wiqVGmtRDa+ZPeOgpOcl2swjAKh0W9QwJc
	vHSS8Y5nYUw65x9zPIzRMu8bqZIP2ZChN53cmpnyuleAtxs/9vWr
X-Received: by 2002:a05:600c:8b16:b0:4bb:5d38:259f with SMTP id 5b1f17b1804b1-4bb5d382639mr6172105e9.12.1794567968130;
        Fri, 13 Nov 2026 03:06:08 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb56fa1062sm29897185e9.5.2026.11.13.03.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:06:07 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 13 Nov 2026 12:05:33 +0100
Subject: [PATCH v2 07/11] pinctrl: scmi: give no groups to pin-only
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
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-7-faccb4685d88@baylibre.com>
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
index b088a24e4ec0..af9c9575d4f0 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -438,6 +438,7 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 {
 	unsigned int nr_funcs, nr_groups, i, j;
 	const unsigned int *group_ids;
+	bool pin_only, gpio;
 	const char *fname;
 	const char **gnames;
 	int ret;
@@ -450,13 +451,19 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
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

