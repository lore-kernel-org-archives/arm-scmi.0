Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447299;
	b=1PC3kP9Tom32JlNyP+RtVkwaZgDuXaRMkE0tcFCLNcJqGmlRTPam5PmMzR5kBr5dxmc2
	 InPmmZRM6eJkOLbxeOaPQ68fEl8y3qPQdvpVTJjvf4l2Wfz+3ZZNxcQeJC2AcPZMczcUb
	 rjNZs8ublqC2aVfdTlisDu6RiTJ6bGwBl8E8UhxjuHaqX8Co5B4nkooj0NsPNmyb1Xbrh
	 3uKCTZfgQTHhasqd3/tEtY9hMfFkDpu74VVvU6hKEmNAhfAoHJecNyHWWT0m+Y7QMo4SD
	 lj2aPpgs2LVL55mvm+iQT1Z7U06PqHh3IAfqMTfwu2HBq6Mr/JXfazReFEv3lCH+RpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=kJxGN8j5p+C8+Eg72heXebT/KYzEG6NwxGdULWQFRpM=;
	b=ekN+LGNz45dJftLWVGPFJFR0gJFtBnZ2mfboX0fFWM7p4KziccRmObdz186iHQ8ITchD
	 o38ZKmSCnWKpjjolJMfrVoqkCEX8+4wiLL1Y5JQt+UKBNcSbSu6J01ABzfMZ0Dk/RgTaq
	 Xx0G47rwb6DqeIm96fWPWs/BokRoaAd43KdR812ccYDHaFF76zTpiRvj4mxqcZnroepJM
	 1yJ6VyikYLjRB2fc751pvh37i1CgLY0I+pPNC/ymX5+AYobQ7Lnq8Pui2s80faSZM8QUz
	 6uO4JtnueEXqvOW+dvkW79YaTRcLlhPKSYeNYTw2sbcqld6IA/ge63Zr8CIyqsH+pYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CS02sU2T;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E476606A33F
	for <arm-scmi@vger.kernel.org>; Mon, 23 Nov 2026 15:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E476606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CS02sU2T
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so23275555e9.0
        for <arm-scmi@vger.kernel.org>; Mon, 23 Nov 2026 07:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447297; x=1796052097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kJxGN8j5p+C8+Eg72heXebT/KYzEG6NwxGdULWQFRpM=;
        b=CS02sU2T48ouIFEjHaR+piUhoPocCqtgzhnP7+Rn3Zeis3+2Np/FzAal1oPnvHoL/I
         /2rloZ/C9sR2G8k8tpRsjryOimYjiD48RS9InlSalSYXwoEkj7Zhq2giNRs05gX7e+U7
         +4oerdbLK1kgpv63JcaPwUFvYGPD0lvy8/HQ6ikdvcwdYqaFmhdBtTkyVWk0JY811gkz
         Nm/VsM0GxnqJkl2ywyXoZJJu4dh9ERVTZo/f/KCxZ6DeoY8ZkLKYuze2GDrPT6r5n4Yu
         ezJs/B8S1TeMj0xJ9taRfOA727n4fkw5NiKi90ZaySsTdAHZ6yXiBwdsPicqhmnhnQNe
         a4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447297; x=1796052097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kJxGN8j5p+C8+Eg72heXebT/KYzEG6NwxGdULWQFRpM=;
        b=gMxyW6aym8Q7PXAHLsTIAB0HaEumpaAmbrIW/INzDsG5rEQdna12SdM6lgaU3r+rBh
         3ZV5BY2yDA4PwcTHy8bVUrKzkgEmnGZaiTcKGueI6W6Yl5xMK1+ZOe4jC4XvPEHEpE2/
         Cn8OgelNBQkVrwLjfildOS4MBhpdpgr/sSvBtoyC35hXRn8tjCbyrmNt/QzgaWBXV0/0
         Pc6CqC3mHs3l+P7o4EGlhCED/MUb2yF68TX4ZEZafphfRW8zJ/QiUQkrf8wAjeDpLT4a
         N5SuBBt5DN4h6b17hv+gn159a5FDJWncL/3qXP6imXVt0IRL44seZ/mNwGn+fO4nBZO+
         df3w==
X-Gm-Message-State: APuU4Z/13pS+AV+bZusfEfEe61akUW4oQK2rpFd+r5izZotjmNYZ7jDz
	xNKtg7rZWmJJDVEGsHdb1YnPv23BPzD//SqX+ubNVT5NG2oaFR4k8g8khH5efjJuhTg=
X-Gm-Gg: AZFdTZfUqVXY4Olf6lmB/aZ9ReGrG2hTCa63k6PCPpeCtv+UJIzyLuNi+ZmPZEW0fuv
	sBtUPBKDnT91tX4w1hY9VZh4P68wSuKAiWr0aa1DNt2vrPoLbF795eO51B7gMTj1CXMywu6/gjS
	ONor4iWXh+ZVvQfpRVKXPTNWEZHHHbde/Fs5jXG6nG96r6jSTw058iKhfsIy/B0gw8yhuVUzKlU
	SNaHq6f2JoJaXi76QWq8p0tPPM0d7zdp/NU0F6eD2phIlRmvUbDSiR+2mNbouN+fMDDdlarz9sT
	ToImBOkN+tQnBcMwD1zUVWn5XW1h92+yFjLddy3ojgd22o29gwCbwz13EJss5Y/PN1VHKESBQ4d
	GmFLxDxVZZ/Jm2yABZ3lIJsQRi4/xQIY3jYP+NXW3QptB2XO9z7fTiZgmgzZDG5/9MZOiF43JLR
	t+mgaguKMhdq1ftCbafXqYZtcKiXiyUC5Dj7H8vYVRNAG7sHFLnHPweIXWaDW4A6GUdNINeJpyd
	COwl2RNE83iappRNd7keV/n/mih2BOawrNg+ehV4MDCTPLY10E/2trihKJXv49ByEc6BkackEg/
	/1ksFxQEdVPbW/cy0RwDC4vcd6n8AjejJPSyJeHSb5nNlOInYOA=
X-Received: by 2002:a05:600c:6749:b0:4bb:8508:7fb3 with SMTP id 5b1f17b1804b1-4bb8881c3b3mr226405515e9.11.1795447297388;
        Mon, 23 Nov 2026 07:21:37 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm666128495e9.4.2026.11.23.07.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:37 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 23 Nov 2026 16:21:29 +0100
Subject: [PATCH v3 07/10] pinctrl: scmi: mark the GPIO functions
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
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-7-d61f039be008@baylibre.com>
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

Register the functions flagged as GPIO with PINFUNCTION_FLAG_GPIO.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index dc3282126d54..3965f920851b 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -444,6 +444,7 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 {
 	unsigned int nr_funcs, nr_groups, i, j;
 	const unsigned int *group_ids;
+	struct pinfunction func;
 	bool pin_only, gpio;
 	const char *fname;
 	const char **gnames;
@@ -485,8 +486,12 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
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

