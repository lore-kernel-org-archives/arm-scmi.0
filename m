Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8753859C8
	for <arm-scmi@vger.kernel.org>; Fri, 27 Feb 2026 08:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772180232; cv=none; b=IcAHZnA6WW7YgkwnvyOE33FlEJxf43KOi8bmqQfebVbhhvhDAHU8bxeD/OfynRRnBUK2Wtr9ULO4PCKEu5iFzrJI6kOF4tw0Xcrw+PO7CjTEsa4RsLqOg4y1hhuWaaPKj2KHOp7T0LPLwvASpODUd1KC7FwQ7+B/2KC2OcqA4tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772180232; c=relaxed/simple;
	bh=m1v1NON76PMqrwAK+QogHbEEQapfrZUSwmgoYwLysaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LVknN60dnCbLy6FkmjSK+wxFHfYwPXMMlOMJ19JT8q2XInUHNvAjNSDleD/8+sMfVqzAgL2SFCVgR5c6C3JE2dIcqKXBUJH9IwZXB3iQvveD1rEOiXvzHflDZDYGWXyc8qugSKa60S0a1pXtiKUlx/KaOqWU55MJ6w2urikGx10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56a86f0a23bso1559079e0c.0
        for <arm-scmi@vger.kernel.org>; Fri, 27 Feb 2026 00:17:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772180230; x=1772785030;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BRbyV6rB0ACPTuZRlxL65vpkYib9H0d5lAlAjAED1c4=;
        b=kIM5pwwXH3UiDrR0SQoPkVEE+PZob5ZMNykIEz3VEOm4PXGTcAzVJS0F6q7Vrak7qy
         lBvE7bKV3q/6lsIlCony6u4yTMLmQTn795mAsT/15+C7AgfWunHc06DBDBFfZUr7vKEG
         cYdvpVPfu5a9+d1gO4vGSkRFxfyLjwkBsczcOew7BeB7e3NH2au8hACyiMRBeDjhUcXM
         ok5yXClIfbLA5N8u+DeF5ERNbpgs9NVgaq2GaJpEw/cVL6mZYMbAA0EVC6bLdH3gwkfc
         TNKib+N7CGPQZoz87dTod72aKSEof7d3fm1Hnacl8ceP3Z32FUEuC0QRGLMiZi0RsNDS
         cn9g==
X-Forwarded-Encrypted: i=1; AJvYcCVVGYp0346FQQVmnur/XCraqSlTT3g6eyj1OJMG/Fc07tpgzFP2SCTND+EhybdeMPgCUeBGYMvKGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwImi55m/NSbPqkJtEGjq5gAxxC8yL+dfgmOwGLDUlKVX7X7Qh
	u0q/pR9r/tLqfy5o1K3KDJFQLbW6RgiTWPnCfFJz9PiSasacc9pE1ZeJoCShMKCMsl0=
X-Gm-Gg: ATEYQzxr6hpyWDXkqYnjsi7KYZ4ILF7e1CqxPQttqSBocjd4XJYoHXBfjxS92wRGrMi
	pY3TScto3uDRY4QjTmHZU/0Os/c+eh/LQFoh/r1PeU+b1SHKDdUmnRTZ38MWwX3hZ/ZzJVVTUZa
	8iy23U9+e5xPcvjCdbZBNDTWJ20DkIyn8oGBR8Q+D0UV9a60c/ceWl1RibVZ4XArY9KrFciwYB3
	NdIpZEAqAUefW1lSpn47ahIzHXhfMmHLLFHiQpScEGyLRHchtzAWB9O5SXn18F55LwRFg50XJB9
	Xkh0UYXMf3qT7yetPNmploE9MgHPUB5ZLziUD3oNoT6L3DenC4yj20nRElHkhFimGJyEkXSKBVj
	v+95dJ5Yc5gXTZuvUq/LewsyAfz7A8lYX1TWaZF0wExgISii46//znjTmlOoNkLVRb8xzlQCTqx
	Ootzov57kTvY5FAR7iO030aONUy6Xr60nQNL9kxXF0iRnpaSUGKUIHSk2merJONTsNHTl4wO0=
X-Received: by 2002:a05:6122:c90:b0:563:71ef:67e8 with SMTP id 71dfb90a1353d-56aa09ff779mr1242730e0c.8.1772180229784;
        Fri, 27 Feb 2026 00:17:09 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a9204b91esm5318871e0c.11.2026.02.27.00.17.08
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 00:17:09 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5fded42aa7cso1170235137.0
        for <arm-scmi@vger.kernel.org>; Fri, 27 Feb 2026 00:17:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVqURaeUhnQsJWyWYmLqs3UiWJ8CziEzQBivxRBdC0Awb9EuR9tPrlnSSzU2KNERTDtxkibK6yGiQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3747:b0:5f5:3619:8bd1 with SMTP id
 ada2fe7eead31-5ff32494193mr1107329137.25.1772180228608; Fri, 27 Feb 2026
 00:17:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com> <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Feb 2026 09:16:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXfPPs26ZUnWd+_+xUU0DJ44ewTMrtbzco3J2Bs165+Xw@mail.gmail.com>
X-Gm-Features: AaiRm52todzA8Sr5byokA4vkDZ2E-x17wtaWy3OW25tgrEahH799QvmVZU00ayM
Message-ID: <CAMuHMdXfPPs26ZUnWd+_+xUU0DJ44ewTMrtbzco3J2Bs165+Xw@mail.gmail.com>
Subject: Re: [PATCH 01/13] clk: add new flag CLK_ROUNDING_FW_MANAGED
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>, 
	Andrea della Porta <andrea.porta@suse.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Bjorn Andersson <andersson@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Frank Li <Frank.Li@nxp.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

Thanks for your patch!

On Thu, 26 Feb 2026 at 19:17, Brian Masney <bmasney@redhat.com> wrote:
> There are some clocks where the rounding is managed by the hardware, and

s/hardware/firmware/

You got me totally confused, also/especially in the cover letter! ;-)

> the determine_rate() clk ops is just a noop that simply returns 0. Add a
> new flag for these type of clocks, and update the clk core so that the
> determine_rate() clk op is not required when this flag is set.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
