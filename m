Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447302;
	b=SOQfWPREEEgnyNARO+lR0eTtTX5OqnMI+qbzCjWQNfWMnJPMRe3AAGEfanZAEyfVPoBH
	 wHCBRXk6O4I1B/NGf+joKvhc3fF0Tvunp+RnjrUsaPnYp8IrX6viPPHIH1U6C7qAoNc8C
	 tY99DnjxBEl2+/vSkYNL3Kn6NrY6RI5MTmw7jGLTvR33Cxg+vuUqShHTOsufvzcmp/Kue
	 SrRYlrWFd0OH5se117o+gLXrZ09x9MUKHnPfnIfZksnShFTwwjxoldgAC/Dwi9I26291M
	 LNJlo4xsCPk8VHEZEZxCNV9dk+gygSor1yhDHdFrUsJ1r6EgYYyeVXphiUC/mIyQc8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=dVpb/d0NeS6UYqYxsqJ8S4KQXTpwpYznEVjfCaru5aE=;
	b=GoZt1G0ARHnsGjYY2FOjRLo4eXf4BB98OCyB1mnO3lyn2JMGDkKu9OXh04n9h0G1oDh9
	 giS3kbT2sJNffXuLnl0bxgVI/7FF5nJQGCL9c2aXnVr0AFfa6iNcukWQ6sIWclz0aJ3Z+
	 w8L1sERazWW4eQs5RwgbKaDocAggsEm+ih1OZlte/n1skMTKyFotrYYKe6DHVyg5gYsFG
	 uwjJ7M5WMKXxxRoQZ8SO/WuhXFnoszdPTIXx/Z5jIJQlF3oUF75nO9QMN9PIH8UKk/RkI
	 +9F5VQ/kV3FBeesh/pxRxlOjz7PKT3n/HO5RvJCReJ+GrNKj2Ug6QrgLPt7iMbnok+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cUKLxk2K;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD16606A687
	for <arm-scmi@vger.kernel.org>; Mon, 23 Nov 2026 15:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FD16606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cUKLxk2K
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso26998895e9.0
        for <arm-scmi@vger.kernel.org>; Mon, 23 Nov 2026 07:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447297; x=1796052097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dVpb/d0NeS6UYqYxsqJ8S4KQXTpwpYznEVjfCaru5aE=;
        b=cUKLxk2KwQ1CFNjJAH55dYSowalnoMS30KlFmfFb8/N+MJ3exeJfkl4VS1J7+/m0z4
         CD41NjZuAo0C0xg2DSfSQIcCFX39/3Pafl9W0i/Mxu+b6Aj4sB8y61qqcpCBtXbu0l50
         WR9q/4ckU1UDOVB7OvM7kUJS35kUzB3EvX0Zf3tXfkqo8q1Dv/kJFm0qcxhxmOvyFt++
         JwjWYXgwt3eiohWqgRaUlDUiXq6i2Doh8KfmqKS3G12hVppqV2c5ztjV1z2h8bQGMQRb
         QhNW6EtHJZFV9i0GJ0pwBOHzqz9vYFH3ZDtfZkWmplZ3miZrgLNDKiMqtib1kaZDW+GA
         1NGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447297; x=1796052097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dVpb/d0NeS6UYqYxsqJ8S4KQXTpwpYznEVjfCaru5aE=;
        b=xDDnEWUDnNGXptoIwpJLLYqUU8reNPig6m3iiGkAeIyvRCY4UQbAnnjqeV/3kmlBSI
         Qc0IhQpigyU4MDril4b4i/Vy9JOmDCn3wXOTSA5qUrwkmOGlcKmhI40YkOHCS2n1/wDq
         IE7zIFviU7Wpsq+3WX6HIwnV5QgOPOrkBPgWfO+jLdSFlNMADlg6tOym4C7WFxIr+VkV
         3k+a05QdWJ/x7YWP//nAGHB22tj9QCfzMDiA7sb0pqgjUbjGcUCYspouxNP4R7LdoTGq
         1PAd+uPYkBnFLy4kMQyWNqTi4wru+NQOQIADkMcMAprj9Qz/Br4l4pLSxbZGoUD38oGi
         gOrA==
X-Gm-Message-State: APuU4Z+/xTw3vdw2K59uRLKHXEmh2wNg6GE29EyTz0JkUFKQMWjD1O0x
	M9MvmscGgwcAsyez0NOkv+oBPBwjAbTc6fxyZOhHG+Jj4OldKlhRKkQqDtC2Nl9DCcs=
X-Gm-Gg: AZFdTZfMe6eJGzJx+bTilNh03/XHlapJbk3PyMPOzbHnfX4UW53DS5kOgAQvxEZkJ38
	y6ynM+4pzcmYtTBkrr+oyx4LiKDGNOTJfvEvpnPwtvoVuM2cHDNChN9nptMx8u0+8kGQdq0chS/
	9QBUfjxVhR2V1uoBVwxiEbcCjMUXVDyzVKo5Sw+zMlh3EX7+jYxeKCa38QCSp9hU6QMAq1DFFfl
	Fal3tTQWrY5ldJPrb7QSsGWsL6ZmW2juFqrG6B+d5us2yiaM/rrLiJdG4X8AJ1F6v32riJd5b3E
	XpXa+ygh8G1PQCi6DS+h1hTa5KAIbe+4+5ixOx1OrWbprso6GwDhEgESeN88oE8BnKThOzzIeDx
	a1Iepr5MNfMAn7+1IXRJ5cLHj6TNGFn2pEBJ+c7aE7nD7Et3qZbgj1zZuUXF5HljuLf7tSKo6BA
	jt61BdKdTHkL/VW9fc3vQbismeD2AmEaiZMSVeCyEXtjxT0J+aYWb2ZomsBsnIukyItHBo/8brQ
	sMyhuyeN1bCZ+xpJNJXWdtQdfJ2KSN8qt2chaNdLql9u9shdEQ+YGva3NAHHwtW2xQAh0DK5/Ot
	/3eWLAl3n/dlvpnjlihW4F4clMkagYO5PjfLCd7NARIDDIIlRyA=
X-Received: by 2002:a05:600d:6510:10b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4bb8881de57mr163432115e9.26.1795447296665;
        Mon, 23 Nov 2026 07:21:36 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm313174005e9.4.2026.11.23.07.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:36 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 23 Nov 2026 16:21:28 +0100
Subject: [PATCH v3 06/10] pinctrl: scmi: convert the drive strength with
 MICRO / MILLI
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
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-6-d61f039be008@baylibre.com>
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
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailer: b4 0.17-dev

MILLI has the right value but not the meaning of microamperes per
milliampere, and <linux/units.h> has no current conversion constant.
Use MICRO / MILLI instead.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 80c6e83a3a2a..dc3282126d54 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -181,9 +181,9 @@ static int pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param, u32 *va
 		return -EINVAL;
 
 	if (param == PIN_CONFIG_DRIVE_STRENGTH) {
-		if (*value % MILLI)
+		if (*value % (MICRO / MILLI))
 			return -EINVAL;
-		*value /= MILLI;
+		*value /= (MICRO / MILLI);
 	}
 
 	return 0;
@@ -228,7 +228,7 @@ static int pinctrl_scmi_map_pinconf_type_set(enum pin_config_param param,
 		*arg = 1;
 
 	if (param == PIN_CONFIG_DRIVE_STRENGTH) {
-		if (check_mul_overflow(*arg, MILLI, arg))
+		if (check_mul_overflow(*arg, MICRO / MILLI, arg))
 			return -EINVAL;
 	}
 

-- 
2.56.1

