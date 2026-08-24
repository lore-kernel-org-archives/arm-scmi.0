Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73288363C60
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 12:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787575738; cv=none; b=Bv6Q5D/iTdWOeo4PvxbQiXHAlOwLIoG3KviWp3/K+e4UNqBPq9dYczs9hQBE/I2QmZty0shJ1zFCDi49vGsr6VjdnOW7fdAglVJX3e/j0WDZrdlVlS/xTNL6euNs4WxO7SgupkZ7oV6+Nd5idtcqtFzSUqtEp+L+YWb/26qwTHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787575738; c=relaxed/simple;
	bh=lI76YK88ZltuQHg9+zsDOjRNQgdjPki/p5J+GduZo2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=opOmWV1vptVTt2OJvBR4meTkZSXc88qt6MlN165dMdLfXOn+5f/Qr0JFPicVWrRNxz7RZPOoy1SA+aGGZpaFEFVmYi8/joDJTH2b+aE4WoKdfEp5MnDxs8CWiemTyVWCmTR9pnWdzdEIjbJAWzC+WJwslNKUqps6NWeU87rYbeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66c71239c48so4733273d50.2
        for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 05:48:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787575736; x=1788180536;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9ghuoduRfOzi+AYpDw8t1/oQryAhFbodaTAoc1849Hg=;
        b=NkjJc65uXQmOEGTSySxXxK6Gt9/Dx/BC/55Wqdk88ZhN6awLnI5vgN4XmdK4gin9Py
         0g02eEfratHlMnJCrBx4KzyqZ8eBY/iJl2N1m4vdOB2la/vXNOBODjkzcwfxrwxidvSJ
         6CwLglnPauAEsP9rlByFEnETRKOg1mpXORuDAYvLAP4VATkrwYuwz03c1n1wMbcIaj+r
         91jcMIk7XPLjkTmKx+bfjhPza/c36L6XwyiPsiIceB1J4lp3KFNR3HEfolJXlxECpy/E
         8wy5AIYR2WD39sxnKDRiBF1FR7x2WZ7fPcvIAxEcjLx0trKIj9YcXANmTj/zRcSurKm/
         moJg==
X-Forwarded-Encrypted: i=1; AHgh+Rqn7deoKjQOlRTxQ/UT8LNZZZEHXP8UvaXlkK6ned6twZWxtVbBDwTcRl7DsqSJMez1QMFDiHavVw==@vger.kernel.org
X-Gm-Message-State: AFuF++mpcmVF/A/BeugwFaGgfLPJti4et0I4vjbVpDQ8VOQnPDnOAFX1
	A5f8k3gYsMKMXZR0mTKdKW/OA7LZgQWwyQ7AmWqyV9ogE6A13Oehf5a+FnXjS6rQ
X-Gm-Gg: AR+sD11O3IZqpSp4jZ10JVKhKNRS9oUscfOr4NBl+vUIG96YHyvpKlH1wMe+EhYV0Vq
	LszZcjXPtIPMl1avSp7JDXXepWsY2bnNuv4mbCeb1nbwNvOFzbiu9QINKh3SpR2g3JgLcqUvBLP
	ToURJdI7XZBaHyajZr2zQM0HEjEBXry0Uc7XDLLLZRnHBzg01uWorXVqq9aHOtQhxdUCYFqJLD/
	YIgLK/zeTLC1dkG125Jb4LbseW8WcCMVUPazh9Cg4sRGbo6w/4u8Ywck3gQcPmoD1kyrqhsJA9e
	q/DgXO3WCDMBpRuVPLdL7CG3sIeEz1dsa4PaikMRFDDpZNFhbjQLgE37z+ZWWLc3zLHaBznzxge
	72DcmbzuGTXb868Y+XlE2ThlHEJSZw86aSMdcxodwVstgIBDyuaMCjQp4JeJ8HYSphskBZtuKza
	4882CuZDbHNyKg8rkNlTOn/2oDAqiURjt2hjo8C9az1w06YwFzKMePNPmGw7ZCzcP0FYKZmzD/+
	oVe0p40RxYyjz/KWyV9NfAcSVRBdw==
X-Received: by 2002:a05:690e:43db:b0:66c:51c5:61df with SMTP id 956f58d0204a3-66d11ea3720mr35560d50.44.1787575736363;
        Mon, 24 Aug 2026 05:48:56 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66cf4a2c3c2sm3609421d50.17.2026.08.24.05.48.55
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 05:48:55 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-836cbcd0a48so43743887b3.1
        for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 05:48:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpLe8LNLSQPuX5fdabkhZX0PaxPUJncSHmyocNzRt3rWS9euIoPfNGfhX65O++/OWo3gHqg9AudtQ==@vger.kernel.org
X-Received: by 2002:a05:6102:26c5:b0:772:5acc:b848 with SMTP id
 ada2fe7eead31-77a62c46273mr7826182137.6.1787575289120; Mon, 24 Aug 2026
 05:41:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787239813.git.geert+renesas@glider.be> <87b3e83137e1a987f3c69d214706e93ef3898cab.1787239813.git.geert+renesas@glider.be>
 <60a8d05a-76fa-43c3-a0f7-fb26a3b659b8@kernel.org>
In-Reply-To: <60a8d05a-76fa-43c3-a0f7-fb26a3b659b8@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Aug 2026 14:41:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWnXTAVZ_eBfoWNe-sy6BC1X+5EHkDw9R0TAA65Opzi_Q@mail.gmail.com>
X-Gm-Features: AcwNN1UOdKQEkPlARJoVF2UurscVPaHj9T1_AXs-3b7YtVRMAHuDfcVjJgM-XPk
Message-ID: <CAMuHMdWnXTAVZ_eBfoWNe-sy6BC1X+5EHkDw9R0TAA65Opzi_Q@mail.gmail.com>
Subject: Re: [PATCH 29/45] clk: samsung: Make sure clk_init_data is fully initialized
To: Krzysztof Kozlowski <krzk@kernel.org>
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
	Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
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

Hi Krzysztof,

On Fri, 21 Aug 2026 at 13:04, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 21/08/2026 10:53, Geert Uytterhoeven wrote:
> > The clk_init_data structure contains several mutually-exclusive members
> > for different methods to specify the possible parents of a clock,
> > prompting drivers to initialize only the members they need.  However,
> > not initializing all members may cause subtle issues, which are only
> > exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> > enabled.
> >
> > Make sure all members are fully initialized, to avoid such bugs, and to
> > prevent future breakage when converting drivers to a different method
> > for specifying the parents.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thank you!

> Let me know if I should take it via Samsung SoC clock tree. I assume by
> default this will go directly via clock tree.

In that case, please provide your Acked-by, so the clock maintainers
don't have to parse your English response to find out ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
