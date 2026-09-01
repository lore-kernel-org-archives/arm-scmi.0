Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4933137A829
	for <arm-scmi@vger.kernel.org>; Tue,  1 Sep 2026 07:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247224; cv=none; b=OitFhnKYI27q11mmo1Sz/pn2APlIViDC7HqZIXXtrbcJ1t4hN7MJvesXRQf7ZfIgfv6hzwl+e/FabQYQKaJDJxiv6qID4pOzJSECLzKcLStxSsnKhIQpY0pbILkI0VuHb4o4HDSVUf9u0tXvbb9jjZRh65qayh3jG2cHVGcopcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247224; c=relaxed/simple;
	bh=TJW+ZiT5oYVtElCrK2VJYF5Z8RxcnedgcUFRUh6BMIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dPLySkiELGg9A8No4uXNfe88cm0RvPTu7CB/lIC1MS+vi0oHhjCLBRrtxk00FdyvRihkDu8FQn+Zb/+hf+gVMIy00+Ol1ePsP+yLxLG6fAiESV+dY4dAtiBL+Il5goVktyi92GvekGOTevRxH64i70fYUbu7i0x1vXgiCC4/wtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-90cc372d6b2so40752996d6.3
        for <arm-scmi@vger.kernel.org>; Tue, 01 Sep 2026 00:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247222; x=1788852022;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jx+XoqcBBsA+m2qrM8HxfQHaaz8x8crvSJWq14ITrJ0=;
        b=YaHhpG3NAUi49f2GQQ0M8tT1NTvDwzt0rPm4b1IaaHb0gtvl9RDyburriH3elkIJWd
         M8O6XGPh7ltsF4tJ28U2XBxGDUXnIV9ZEHnkr8drMfR9pXS6pq/rfsvqJveOaGC0tX2h
         KZr5s38LdMCjwSYldWRdRBLQqtDyZFUf6Ut4yav+4m+hOywZnLYdoYGKLTY6+Rn3pWaH
         uiWKHCkDG25fOvC+MnBhX8BkULh8vBz6CXXNaaiLbc0UHMoBny2PPGY0df6rV+O+PxXc
         25vjMJZPwHpHZnjOdzLf9NLNzqkpIr7BJ04mtlUck2HWEgOWIiRRzbjxGbYmdCcjLZiK
         Ft2g==
X-Forwarded-Encrypted: i=1; AKwUvBz8vu2591u27PxqZk+WchF2bX2dRMMKpXYhO4W4Plizpq3lmSqRGOLg5Y+bCt6oD/ruKVwb8g2HZg==@vger.kernel.org
X-Gm-Message-State: AFuF++nilAOdlur7Yt2umZSTWUkFHYbmyf6pEsLRgTENDBU3a+ec0vLe
	w5kg/QmqOOR7sd6LxuOVd67DWywocs5uYBktG63gG4nLapEN/Cms0l3EuMLzDBHv
X-Gm-Gg: AYBFou3uOTkzGK3mgbLP5a7JFJcUX5Gmt/L0PgYith3tEz4JMC2W/ONFv/jTm720rL+
	ANCaPoPcAapkDc3v85PQoak+AcfNjQ0/guF+IoKwwpoO5GoZ9oPU4Vz0X+PIRjYB5Zh5csCeCDa
	YAZkvv+4A5eFsBDFPbtFMpZ85S+iRPtmOzj25Vwv39PM9fAErVUU2yzGPlcEFAYPaa4WkOIiQW8
	yXVK5NIEPdj4ZDfXFWv2gMoBXE4jT69QjR0iT9oBrTlbKpgmi5PO/5/iV3/TUu28W8hbOe/fxVi
	bwxMZ3xUwXN5/drhuT+c2Yp5KYw5HlELykIzWZgAcIRS+4d2EsMFlVxUodMy3nxtCts2tWEJq3y
	YD8Oh6CCkclwUZwg7gzHWJowQyNYLcRONKpVR6MRnVLgS2ygWPV7/u7sUPoj+x+bPxXfNmDhPxX
	C5JefyirCr6GpcnsCDnmk/XV88d9rxt9I/7KwsDE3upJm9vtrrQQc8lNOPy//NAa08HOZQ1KaiJ
	gJFByjL7bxMpQB1VG+7IHPR9g==
X-Received: by 2002:a05:6214:460a:b0:907:bfc0:781e with SMTP id 6a1803df08f44-90ce0f1c9b3mr458340246d6.30.1788247221996;
        Tue, 01 Sep 2026 00:20:21 -0700 (PDT)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com. [209.85.219.46])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce444dae0sm103326716d6.4.2026.09.01.00.20.21
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 00:20:21 -0700 (PDT)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-90ce08834feso60983556d6.0
        for <arm-scmi@vger.kernel.org>; Tue, 01 Sep 2026 00:20:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByNVWW3NVWPrPBjnbAGouPm24trH3u1jEDp3ojOIte7Ov5MUyZepnMBGH/RfYwDoAFIxnIFtAtscg==@vger.kernel.org
X-Received: by 2002:a05:6102:a50:b0:77e:6f90:4aad with SMTP id
 ada2fe7eead31-785962b2f0fmr9912673137.2.1788246874251; Tue, 01 Sep 2026
 00:14:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787239813.git.geert+renesas@glider.be> <apWfW5ahiYagw0OR@redhat.com>
In-Reply-To: <apWfW5ahiYagw0OR@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Sep 2026 09:14:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8YidsoHudY54RQW4J=G446WNgRG6Q-P5f1YEHd3sHkg@mail.gmail.com>
X-Gm-Features: AcwNN1V5M0ZQ_v_xaH6RI1jedVGh-HNyKWbpGWR_Rc-YS9IPBF0NOfuHqPh0NM0
Message-ID: <CAMuHMdX8YidsoHudY54RQW4J=G446WNgRG6Q-P5f1YEHd3sHkg@mail.gmail.com>
Subject: Re: [PATCH 00/45] clk: Make sure clk_init_data is fully initialized
 (part two)
To: Brian Masney <bmasney@redhat.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Linus Walleij <linusw@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, David Lechner <david@lechnology.com>, 
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Viresh Kumar <vireshk@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	=?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	arm-scmi@vger.kernel.org, imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

On Mon, 31 Aug 2026 at 17:36, Brian Masney <bmasney@redhat.com> wrote:
> On Fri, Aug 21, 2026 at 10:53:10AM +0200, Geert Uytterhoeven wrote:
> > The clk_init_data structure contains several mutually-exclusive members
> > for different methods to specify the possible parents of a clock,
> > prompting drivers to initialize only the members they need.  However,
> > not initializing all members may cause subtle issues, which are only
> > exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> > enabled.
> >
> > Hence this series aims to make sure all members are fully initialized,
> > to avoid such bugs, and to prevent future breakage when converting
> > drivers to a different method for specifying the parents.
> >
> > Part One[1] fixed all cases that I identified to be real bugs, in
> > response to a crash I saw on BeagleBone Black.
> >
> > This series is the clock subpart of Part Two, which fixes remaining
> > cases that are currently harmless.  These are still fragile, and may
> > cause future breakage when converting drivers to a different method for
> > specifying the parents.

[...]

> 44 / 45 patches have been added to clk-next. I took it all for simplicity
> rather than everyone trying to cherry pick just their parts.

Thanks!

> Geert: The only patch that didn't apply was:
>
>   [PATCH 27/45] clk: renesas: Make sure clk_init_data is fully initialized
>
> I didn't look into it too much.

No worries, I have queued it in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
