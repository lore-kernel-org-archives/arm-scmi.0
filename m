Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FE62E972A
	for <arm-scmi@vger.kernel.org>; Tue, 12 Aug 2025 10:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754995194; cv=none; b=VnyZzAHxw58hUJkdxESIhHVq28cJHS24PdXA7DIu5tLZ3sy27Yx1EZJ1aHYQQ6REZ4VGmBJC6xChMAnm2n0lOR2k1juas7ArJZyjjDQqgIWwO1vta7ChSSqXzR8beRZq/p+S3u/FBDEKqRcebmRjiSLPfEYp5mvYATtPr+FydP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754995194; c=relaxed/simple;
	bh=aKQ469kMuJqyRpyBBj4VAGrI2TpqLDn80ts4I+YLbE4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=p2NXUiz/UMhtn+oXcs04OLhsoLf7FSzkcgBqBYt/AQ4jWnM1ia3ZsdhZNQ0BAasuPG+1/ovMLcJN7tCH4G8Ck1lJ2hdfqyDRwHLF4EFJhNSk6N/+D/CXUGlMm+S7UKGBl2ty5aRyME3EUR6sDUPxB19EpKlPY+W1F6NhQejR170=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S/w4E4vh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S/w4E4vh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754995191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZNmGluZMVEODqqLey7tscfNEcE8jZgnd0oIotEJMQE8=;
	b=S/w4E4vhnIv9g5/m9EpOWKn80bn4jOLxEYmhjX2Zk5jVtdrmkheWJ3H5FTJz+lA4GV7cpg
	0HdTqXuvrzYOKAK1KSgY9ClDl19f1K7v1Dh2PBKtF4pjpzlLSn3qdkp0A7yJsCCYKnMm92
	1h0YWugJgjLnJlwBhuZZdczNBgjsnjM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-qcCTYZwtOHKumESAgXrkog-1; Tue, 12 Aug 2025 06:39:50 -0400
X-MC-Unique: qcCTYZwtOHKumESAgXrkog-1
X-Mimecast-MFC-AGG-ID: qcCTYZwtOHKumESAgXrkog_1754995190
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e348600cadso1256032985a.3
        for <arm-scmi@vger.kernel.org>; Tue, 12 Aug 2025 03:39:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754995190; x=1755599990;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNmGluZMVEODqqLey7tscfNEcE8jZgnd0oIotEJMQE8=;
        b=s5tZS6+riErcmf55JdL3/Txmzt+gR4q56gBFhUUPO5ry83vvmNFOgKeh8Sq4+GUPW7
         9teNMlYxbibSUnnvdDLND9T6bDc0jBaoySP7TTn+CBEE823pgu5eWOZPAnAsx4CMcw7Z
         zG4LfXhruWhESCA+zgcHhxO6E+EG/3hWRkF4XDVvzHYRafVUeS5mvnZKmJmjg8O/LbYY
         kOcLkIraDUuWoWeXbNFu6BucH/SZCZYirIwz+6y7RKL80afcCFZwg33Iofdt2D0eRmPI
         tu7BijomWH0jAZDZ6gqnzMsZWspxrqwug88WzYnE8FfxBkoLZ1XYCovEGPxiYVE+Pfgo
         h7ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCR7xnsdcpHDgTv5j+BcwTczRu3kaSuW5CO8S5OP9w5nuYovInD/iPN4ada7Xv58uWc/jug9R3yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCDszM5nybYI/ZHBOEHMTLgG86qibB9MTl3jMMPV4Hrv6R6viE
	UZFgb3i+oB2oMsGxW5f9mXV1ELzXwoqUi5V5jvx6ZaoWvY2lS25RyaIlbdlGHjOoxUuAU01HxT7
	BnFq0aYFBtaAyBn9+nmvEWNTYYZte6Dj11+4ozRVSrwgN6y3B9/AwulWECu99
X-Gm-Gg: ASbGncu657wApzAgpz369aNf8lqsXFLUHEZA/M+WNjH9T95radpKS1ROjQg2FEo1qnW
	Ranvp6Udngdqe13iPj09dztj67dARqr1ZOyo9zYaUMIw1H5xdbZREu7vi6tGNl9xhtey8MfcX63
	gL3JwJu9pos1PpARSITUDZmpgR/NbhT/rKM8oToDABhG1a7ytYVzrTm05VOLPwUtLG5Dri40lJ4
	T4BAh4xwuAb48wK3pBJbnqut9qZsNYkW2tTr30yddxeGFTyaNg15G4Q9//yUW+lKYPmQiV+H2af
	UEkrGauSKwfhxWCDGJUK9g2AnTXhB38viL2LRWQVr6dVkAlJXQrm3pfKppg7lDU=
X-Received: by 2002:a05:620a:126c:b0:7e8:15ce:bf9f with SMTP id af79cd13be357-7e8588b064emr355634685a.33.1754995189652;
        Tue, 12 Aug 2025 03:39:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnBK/VwO9xaDEZqPIr5Ki0EDBjQlgku4qoR/ofUy7muXwNiOHVcU/4sdcTQibJSWhG5zm1ew==
X-Received: by 2002:a05:620a:126c:b0:7e8:15ce:bf9f with SMTP id af79cd13be357-7e8588b064emr355631785a.33.1754995188996;
        Tue, 12 Aug 2025 03:39:48 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e67f73101asm1727614485a.68.2025.08.12.03.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 03:39:47 -0700 (PDT)
Date: Tue, 12 Aug 2025 06:39:41 -0400
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Paul Cercueil <paul@crapouillou.net>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Yixun Lan <dlan@gentoo.org>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Michal Simek <michal.simek@amd.com>,
	Maxime Ripard <mripard@kernel.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Qin Jian <qinjian@cqplus1.com>, Viresh Kumar <vireshk@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Alex Helms <alexander.helms.jy@renesas.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	sophgo@lists.linux.dev, linux-mips@vger.kernel.org,
	imx@lists.linux.dev, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
	patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
	asahi@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Subject: Re: [PATCH 000/114] clk: convert drivers from deprecated
 round_rate() to determine_rate()
Message-ID: <aJsZ7bs0OMXcrStU@x1>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tPYD6WwnSebE_JqUSsgqieLq8zLtuFPnd6FPUgcTr6A_1754995190
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 11, 2025 at 11:17:52AM -0400, Brian Masney via B4 Relay wrote:
> Once all of my conversion patches across the various trees in the kernel
> have been merged, I will post a small series that removes the
> round_rate() op from the clk core and the documentation. Here's the
> other patch series that are currently in flight that need to be merged
> before we can remove round_rate() from the core.
> 
> - arm32 (3): https://lore.kernel.org/linux-clk/20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com/T/
> - clk/tegra (6): https://lore.kernel.org/linux-clk/20250710-clk-tegra-round-rate-v1-0-e48ac3df4279@redhat.com/T/
> - clk/ti (7): https://lore.kernel.org/linux-clk/20250811-b4-clk-ti-round-rate-v1-0-cc0840594a49@redhat.com/T/
> - clocksource (1): https://lore.kernel.org/linux-clk/20250810-clocksource-round-rate-v1-1-486ef53e45eb@redhat.com/T/
> - drm (9): https://lore.kernel.org/linux-clk/20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com/T/
> - drm/msm (7): https://lore.kernel.org/linux-clk/20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com/T/
> - i2c (1): https://lore.kernel.org/linux-clk/20250810-i2c-round-rate-v1-1-9488b57153e7@redhat.com/T/
> - media (4): https://lore.kernel.org/linux-clk/20250710-media-clk-round-rate-v1-0-a9617b061741@redhat.com/T/
> - mips (1): https://lore.kernel.org/linux-clk/20250810-mips-round-rate-v1-1-54e424c520dd@redhat.com/T/
> - net (1): https://lore.kernel.org/linux-clk/20250810-net-round-rate-v1-1-dbb237c9fe5c@redhat.com/T/
> - peci (1): https://lore.kernel.org/linux-clk/20250810-peci-round-rate-v1-1-ec96d216a455@redhat.com/T/
> - phy (9): https://lore.kernel.org/linux-phy/20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com/T/
> - pmdomain (1): https://lore.kernel.org/linux-clk/20250810-pmdomain-round-rate-v1-1-1a90dbacdeb6@redhat.com/T/
> - tty (1): https://lore.kernel.org/linux-clk/20250810-tty-round-rate-v1-1-849009f3bdfd@redhat.com/T/

Konrad noticed on patch 90 the space after the cast. I thought I fixed
all of those by hand, but apparently not. I looked through this series
(and the others above) with `grep "u64) "` and `grep "long) "`, and found
4 other cases.

Patch 38: clk: nxp: lpc32xx: convert from round_rate() to determine_rate()
Patch 64: clk: x86: cgu: convert from round_rate() to determine_rate()
Patch 68: clk: zynqmp: divider: convert from round_rate() to determine_rate()
Patch 95: clk: rockchip: half-divider: convert from round_rate() to determine_rate()

Brian

