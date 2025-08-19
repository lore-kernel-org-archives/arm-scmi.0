Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C5926560A
	for <arm-scmi@vger.kernel.org>; Tue, 19 Aug 2025 09:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755596858; cv=none; b=gUmggkvSQdK4hJbDmpu2/diGguR0VBYlfm4t/aQVQUmEXFZJQNJkGTDszfjFkHYLMPzWoie05dys8FViy18JNoACtxwVS9jZhtaextfa+vIOZ7HcQrI22odf8GoOkk7lSVKA1DWQ7jJZHHOR5Uz2478HF2m3mt3F4SZuieX9ABA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755596858; c=relaxed/simple;
	bh=RdTVW2acL3x4TY+q3fiwzcKJmZ14PXDkj8EpJokxAbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r4rF7R+Md68rUo3AysoMvyhzAHmeieiEqa9BREK7SgHNBcZL29q8sIA2Es6W3RSuaLZ0OpmGA4HAFDHiVzpRnbPLHkTdNFpkYXJEB/45n670CvDnmrNwnQtR3D0f89uL3XRNzrIN78jjwLugU3S0JUdreT3CuOj01mtLkb6qCI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R7CjSAxR; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R7CjSAxR"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-333f91526bcso36960691fa.2
        for <arm-scmi@vger.kernel.org>; Tue, 19 Aug 2025 02:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755596853; x=1756201653; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdTVW2acL3x4TY+q3fiwzcKJmZ14PXDkj8EpJokxAbo=;
        b=R7CjSAxR0SKigMJF92+IG4arICNf+bYM3a0PT09TwwgVJ0fevbid0lUF4QIKu0/Q5P
         9AGRr/VuxpP6G32aKpi5VYR1rPmsiIMgJs0dR7kCQIBHGhnAx+TdNuH595f0SwLn5djq
         MtQnoZ6pYNnm/ZrC+uSGQKTaRRblyN9rrvOhIVSCBPRdEiBU9BGuSW/4B29ph7ZbBCOO
         1NejzfzXWfxmF5cHj+JBVt23PyBejugUsJUM2RQvXU8GQs1ms3DNgVxpaIHM/POISiNs
         DOfkqdTUMMwXzsG3IcNKjz6sCXRQwSbriB2JC8dRDOkzt0jqWQKnL0mbTZMoMCbTv+34
         t5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755596853; x=1756201653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RdTVW2acL3x4TY+q3fiwzcKJmZ14PXDkj8EpJokxAbo=;
        b=VIcumTf2CXHF98+wAU+dXblmZNanWuvUGi8Vl9f6dT0c6jbzp/5/JsmIEEQJZs3xJv
         B+ymEBPAhC8RXDZzYiS2tyFNSO9JQMVsuDINQyGqmQcuRf6adjPqF1IBDGJDzThKxv8w
         Yqjm6AFqwJ1Pbzro0MXPwaspPvguz5coGFU1iPK8nO/6I8soJ/CnUWoMmjp7XVMt4P2p
         ytJ1ZplChnPZKRDV5bR8hMpKYVOYm6w6TwD0dP+qqrYP+SLTSbQdj7K2HcBMmEplRsT/
         u6/y59fEaFp7R8J4eM2FKf4KYyB2bBD13T/ml4sA72CY2ndDbVpwkdftJcl/q7KVXhGA
         jzEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAvq6uD9YWureskrsX3QyQtEQiScnakbA0RWJa6/UhHz+xTtUslGlUkpP2MybJ4YTIatuTSOhzvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLKJLZ8aPbcPsrTLkaJSfM3QohRnsKEkK93F7B39E+poStvpNh
	9mzZOsqW7mPBsEtnJW/5j8FjRm8gEjDGToAvghkRsqIm9JqGJXz32dP+6zAJxKpjd5lcgj6yqp+
	B8ifWQZ7mStvBC28vf1gGpSdwWfs7nddtPBQE3hsbzQ==
X-Gm-Gg: ASbGnct2z69zZwJQhObC/xfNzDrHzFNHGA93iH91Lrsu/uvTJJha5eFmoDcqiBdSitw
	0coJOZxmU4uXLdDPEvAYBs/4GuhhQN+p1oF7Bu6iO8nEIPpfoZTzWPD26rh8YWSgoUyTyd/+1s/
	03pdhGU9DZ1TKvEkWuWGJxlK68aT2YRSEO0BaczBtKR45FF15js0L1AMNwUhFDvKhplMXr6N92l
	TM3RzFnAap9
X-Google-Smtp-Source: AGHT+IFaAkF1r4GWgj+j3Xeyk0sBgHgQuFXAyBRPToaJvqEtDi6Qt1cFt8RtILv6l5mltG8+0huqL2sCrZ81MI3EBAM=
X-Received: by 2002:a05:651c:b2c:b0:333:ad0c:a44e with SMTP id
 38308e7fff4ca-335305347dbmr5252501fa.7.1755596852940; Tue, 19 Aug 2025
 02:47:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com> <20250811-clk-for-stephen-round-rate-v1-105-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-105-b3bf97b038dc@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 11:47:21 +0200
X-Gm-Features: Ac12FXwQ8ZNlahHw5FRReJn3coSNBp0waFbtb0dR-jKWl_cQ9vhC2BCpFgBry0M
Message-ID: <CACRpkdZ3M65bKzaHcKPRhEFCy+TvHUq8bZ-8Zr_7HSRKsk_TWQ@mail.gmail.com>
Subject: Re: [PATCH 105/114] clk: ux500: prcmu: convert from round_rate() to determine_rate()
To: bmasney@redhat.com
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Paul Cercueil <paul@crapouillou.net>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Michal Simek <michal.simek@amd.com>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Daniel Palmer <daniel@thingy.jp>, 
	Romain Perier <romain.perier@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Andrea della Porta <andrea.porta@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Qin Jian <qinjian@cqplus1.com>, 
	Viresh Kumar <vireshk@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Alex Helms <alexander.helms.jy@renesas.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, sophgo@lists.linux.dev, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com, 
	linux-actions@lists.infradead.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 5:19=E2=80=AFPM Brian Masney via B4 Relay
<devnull+bmasney.redhat.com@kernel.org> wrote:

> From: Brian Masney <bmasney@redhat.com>
>
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
