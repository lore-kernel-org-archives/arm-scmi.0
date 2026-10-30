Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375920;
	b=Xg5k8BVhspGkUiHk+6vQFHJK1NdfhmUIQ/J/ZWu5JlCvquNOSyE9ZG1wOTLUd7mUnI4K
	 a6k9sCeb2vNGD0sAWLRiNZgoecYwlKh0RyISdPNbHil3fcKQ4tV+QsnxaP8n6yx37Y+ds
	 yifcyG0kUy/xWdP1TbxvXbOaDAaaz6ZPvD0WAFUqmBFyfRxiv//IpEd+Sz57NcfI2WJPK
	 VzmsYBfFb6tlBRnyXTngd8teJRYBgd+sZ+whTO6pL4t4uX9+wbpAxlR5HCTyS9bVNIBE1
	 tjhmnPYqLN51qByTukDHa+YLCwYlIxTtMp2XvEC1Snlw+xd6HYqnFQSq2yOghY2dE1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=v+BZy4a1iXe5tg87aPX5GiRafzkK009ivcKtPmGh6AA=;
	b=yK47t1MwHqcNyXVgWf0y3occYXrUVxak49RJxt1zJmHht2Ru/zFPARxB67uHe6G+sQqU
	 AnsVXkd4TQX0x5mRgjYnDxTe/YJGzqgNg/qVZUkhQ4IISt26mzFkV5Gg3K1r10vhHx8hR
	 Cu9OzVebk9kuBDhk+PfbqZXoEjDUjnRNscovyEeoZ+HMspRd0YqCfgNiVhpLu+iU+ZCYD
	 ZR26QVi818LycebcdpvWINdqrqNSsjvIJgg6LzBXcGcsXTbjNqDnVEhUSPh5IGvy8fs/T
	 TDEFINalnNFzwCKdUWyY7i+Ld4pzMi8zg42n/0G/gS4f+kovlKWr0cUoP221g3WCx7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jHKc6JGE;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C0F606A325
	for <arm-scmi@vger.kernel.org>; Fri, 30 Oct 2026 15:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21C0F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jHKc6JGE
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so5352715e9.0
        for <arm-scmi@vger.kernel.org>; Fri, 30 Oct 2026 08:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375917; x=1793980717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v+BZy4a1iXe5tg87aPX5GiRafzkK009ivcKtPmGh6AA=;
        b=jHKc6JGEZVWZTPtTYYYbeWeH2YF1NuhdK4SJtLGDhA3i7MhWpq/5IDywla/yY/QQz7
         6jdVRkfBC7JjD7XbtNTHO/JTeElQjtOl4wdxSBFr4BWzeua+R8VoxnvAadd+FdVKLOC/
         kKGoQpuWkOP9UgDLhwnXfMl5omPFkIBb4NaxBIQcdMUU+0HOszP5sm9ve6dgoj54ESkr
         z3JLgB/DRvf9cVQjWY7PheQsKoMEzk7MMxx+l3jNFuN7lDOj7lxq9pRbPmfdJor11ZZh
         EtnXnEbXUs5lD+Icn/rZpel19qqba8ZSpr+ruhBpi+E9HYMWZgxAsKBdOYBMG2lGDgl/
         Q0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375917; x=1793980717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v+BZy4a1iXe5tg87aPX5GiRafzkK009ivcKtPmGh6AA=;
        b=f3eCTNvElvtIXolUWTVQ8LUK7g88jk4sT2kftFnIsGHNhmq0R9okbGefuKiatCN40S
         xmHR+JZa0BXkStztQffNkSNuG8ORlFna4skATa7gWDU/fkatCBInKD2O3Es86HXlEzzM
         iaYxiDDM9WvLTiR8i5W1hyLJ9cxkiIM6zvMbbvdyKxEilemTNoWteXvgSftXFY1/oRCT
         jW/Cj6MAmz/nufUrXecFRjN/SAUY3Uu12FQWk9Q3A+RYO8392InaDdDu2cWKRYy3iNpj
         XkXlYIZ8qPomU4vyOlrwHFlebvlG6FKJBYR3PFI6aTbFNX7kuZ9LbL6TXGdHTKdCNlod
         PUGQ==
X-Gm-Message-State: AFq9FYJ3bbirf6Upi80pb5VmVkvn5XBCiUQtswBiKxIqiGEgsAA5eKJm
	YXT2hrfyUxFi0++bWg7zFEZySpxDaM3KLmo/7fCVKNskUjAomiD4B2fK5EEr8gCSAB0=
X-Gm-Gg: AYBFou0VCCZiTeigFXaxlJ2v06TSSiiYiSP1hcYd5tps1B66vh4W8TKZdmi85wowzV1
	Z1OBo4typDQqxniA70ZPDw0YW+9odcxDgVZ6TVmdHM8Li6LKLaoCleVw1R88pU7mLBkqkb+KKgi
	tWcBWAWH5jjWpfP20MWheMS8dPMzlyGRvEKt+W+4d7+pP3h2DPawFq0lNdmPmR42WJfTEN1YbAg
	JDJBcd7kvjTrsU548XNI+K2Sdm8vwDSFfsH8KCLRMS6a4UTrgabISlWtvkNmRGAi4kM/jBAzrsV
	rrj0iYBLYzguFwq2QpXW6IZlyv5g0FrAHnyYXf8tBxyxg4fiXqf22skh+o3fyVnRFeabQJM/Xxy
	UzmuiHcD/S+K+E9UIm+JXE0lBNFuTcup70LVqd4B6uU0eSTW1UAFa+e+ZDh6Y0rpgpaWTQ7mXOK
	Tt09fqLNRARYKXH506pt9suWQRTboe852ejYreiWWwYOLU9x1QYQhtfSQDkyYMrV+USxDI7gmhl
	rdFXS5SB8fAbCn8ur6z5xTSlBEDHFB+PGHPjj/bmB+/jftup0P0SWt6CZ6C9h4OqREoWGDXZN4p
	gBw0VLyhkxpeWDKdPjoE0ETvFE9xqw+svcHO/e9uRw3xISxp5V3jkFDZopZFIJwdoOd17D9K
X-Received: by 2002:a05:600c:e543:b0:4ac:ab43:b50b with SMTP id 5b1f17b1804b1-4acab43b5f3mr32931495e9.26.1793375917487;
        Fri, 30 Oct 2026 08:58:37 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac09fadb75sm40803375e9.3.2026.10.30.08.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:37 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:33 +0100
Subject: [PATCH 02/11] pinctrl: scmi: map the schmitt trigger enable to its
 SCMI type
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
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-2-52d92843ad97@baylibre.com>
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

PIN_CONFIG_INPUT_SCHMITT_ENABLE was sent as INPUT_MODE, which drives
the input buffer, and PIN_CONFIG_INPUT_SCHMITT, a threshold, as
INPUT_SCHMITT, which only takes 0 or 1. Send the enable as
INPUT_SCHMITT and refuse the threshold, the protocol has no type for
it.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 6bc94c68e89a..5de47e060e8c 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -128,11 +128,8 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	case PIN_CONFIG_INPUT_ENABLE:
 		*type = SCMI_PIN_INPUT_MODE;
 		break;
-	case PIN_CONFIG_INPUT_SCHMITT:
-		*type = SCMI_PIN_INPUT_SCHMITT;
-		break;
 	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
-		*type = SCMI_PIN_INPUT_MODE;
+		*type = SCMI_PIN_INPUT_SCHMITT;
 		break;
 	case PIN_CONFIG_MODE_LOW_POWER:
 		*type = SCMI_PIN_LOW_POWER_MODE;

-- 
2.56.0

