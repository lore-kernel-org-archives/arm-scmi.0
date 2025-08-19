Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E17931AF39
	for <arm-scmi@vger.kernel.org>; Tue, 19 Aug 2025 09:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755596888; cv=none; b=BWpAK8Qe19VIAQAZH061y9aYMy6QDSwnb6fAuNNCAvk2Nyi+3O6pd1ARQTmLcuWX1FqpYCfvRF8six+yR5XDv7UAx0f6oVtmJnnP6Gxef4GTBfdu7W9YLIq+O0lIo7HLrMYkzSEkx5/tBSl59/D+XZMfG/6KPes/HatmNeQkmhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755596888; c=relaxed/simple;
	bh=RdTVW2acL3x4TY+q3fiwzcKJmZ14PXDkj8EpJokxAbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ArR3wawcCHd7uHd20srCFBDz++QO8L1KpstL1sp0HzoeliWKqEom8h03KuVCaCT79gQkNkYm0b5K72rI0hA1rOeg2q3va4JHviSTYoezh3een924Ri0ad4hhdK6HzTf1zstggNYR3/IpMGhswkdUYgVTh0q3UZZRHffpxneR8T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hhkLWNTF; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hhkLWNTF"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-333f8d3be05so35095781fa.0
        for <arm-scmi@vger.kernel.org>; Tue, 19 Aug 2025 02:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755596882; x=1756201682; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdTVW2acL3x4TY+q3fiwzcKJmZ14PXDkj8EpJokxAbo=;
        b=hhkLWNTFdjEbwwjL7FisLg0gDUyRvtp1bby7rXiuQN0gvj0aaLdVZMtTr/HCqvMmNu
         dZi+AZ7MTnqjD1WLb2L6JDfpWWGXvFySZY0ijl9rz9QoZ6YKnwXctP99sx4jaSNN7oPB
         /z8kv9fHoRaD2YOJL9ZtRpf0EcbAlVrVjALcgolPMd36S4sJIMjeA6lrh5sPpmT6ouAm
         VW3QM+8pFZJFnDDCFjO8MFS6LYOOfL1Vz5NFwiveiFoYNMjRyxTJsiU9SOz4OnZUG+lp
         2uUgQvw9xUEHz7lQjrxS44fHV0beDHUvIgV7HScOJgTfLehm42PHpxStRXEv3lHs7Ecv
         ucTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755596882; x=1756201682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RdTVW2acL3x4TY+q3fiwzcKJmZ14PXDkj8EpJokxAbo=;
        b=ez71xSsCggSln9DrhzOwDAgc8bTYd/+9vPmF2i4AfBo5MS3lfry7PtOqbkc3JQeJZr
         zcTmDjP5yimXPFZI3Bqwm6gqqNA3DJlx5xGm9fnMW6WFTrV+aSuwrSQhkgdSBoXUz7v3
         N5JiZAtmWXBZr/uKQaR31LpCpVQdzjIRhCMC2ul9tWtOWLmFF2oqvlaOsJAAAPem63GO
         SBT+Q+TuNNEKCv9RgKULE6sekhxHvEJ6YocZusu1mElkhL8rAJrgS3OJAHG2WniRFFX2
         gfD8Q9uqexzrt7fEwpFSdofI0U95eYABefjuhrjeh7GJMT8G4AU5bu6f94vsh+/mmJNG
         klFA==
X-Forwarded-Encrypted: i=1; AJvYcCWINXTLQvYkByUnNPQ75890Z7ZkoVXQqfcq3+frwlmRbI9oI0JHqG/ChVjWtWM1l2ehHTjCt1HG7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2xvD9XT0xEfUeqB2G54CxT9aN9tXhpRK7t97qRL7ROh4+jDMy
	oeW5fyiq/rGlwuHRWqFFpiJVpNGyilu8fcOB1WsWpEG3PSKdEcRrlBolg+glVbqSUyrdUgKFSZM
	iupND0rnllgRIw1iwxN5sHItRLkw6OCaQUeJ99kQy1g==
X-Gm-Gg: ASbGncsXRvOPsNUVEhw9CZxnfnRFeoyAMa2qgMrEdMLLW6xCpAdsOdbVWX4Aa5kucMj
	79iNUllfi1pXAxVYHWm0STLmTSLLqRFXVWrEzVRoE1BAwnQb8IsOIBn0/4Wd29YmUi0W5dtMPUl
	AP/ZQTLAU09KcDAnFb1DPzFbxPFwOl/1+ztr2CA/YUBCaBwUoJhzBfXCQm6NdPdxOsCk0rLEkE6
	OlXftM=
X-Google-Smtp-Source: AGHT+IEolFO6aeJABYr1hNPxQasixpAjIgJqFl/o9dwJCRxvFjpbc3xagoFqiJPlswYsIWJYgR30Ss513xxDR9NTkTU=
X-Received: by 2002:a2e:b8c1:0:b0:332:45b5:d68a with SMTP id
 38308e7fff4ca-335305347e8mr6104861fa.5.1755596882380; Tue, 19 Aug 2025
 02:48:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com> <20250811-clk-for-stephen-round-rate-v1-108-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-108-b3bf97b038dc@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 11:47:51 +0200
X-Gm-Features: Ac12FXyAMutAnmM6yYaTGFkQgGmOcrXudlcTGzS_av87nGHcGPs7Xb4FZygWAbE
Message-ID: <CACRpkdZonmP8rSQS-rwzthNPv_MyddMReZQaD13b1qkRexxWyA@mail.gmail.com>
Subject: Re: [PATCH 108/114] clk: versatile: icst: convert from round_rate()
 to determine_rate()
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
