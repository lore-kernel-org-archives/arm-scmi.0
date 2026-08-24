Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2D742378D
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 13:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787577409; cv=none; b=tbg1Mgy2UkJT2MBYznuGNvwWkzq6Qj7N+GpRmoM5LV6q/mM9nD299+mZ7Xr9hkFwxpJkFSRxTx2dNEEj9r8ZFVHO0vf1OowRiByeULdtNnBSOCdvFiKn9XwQP8fdrLtaD0qIPImpQspNWPncH71x+1/dOjiJl8+zgSaTukBTK2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787577409; c=relaxed/simple;
	bh=u69iDQDh65gTSQHaopk712AakCgClJSI2Zoo/JrTLeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=NDaPfzf5VWzzN9F37wZ3NIdOXxOm0I2OSPGEJ22XdXJn66XzfoQL89UfcPCb+QSk7xOjH4TXHewNno4w2awl9YUdMFq3RhsdN9e67KG9GI6jOOmWqCgoJ4jtOf30CG1uMn63JU2p/nNSdi/yyfXSv28+yh3U+Pcy8olYTFAYbAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f9i6g8WY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f9i6g8WY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787577407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a5uoZNVB2XRKnrTBdvCmJrG8M4XSoSEJo8KaXU4b4e8=;
	b=f9i6g8WYKFlUJLESA7Ct2vPrwX534hsFqsSBjvPPxcuB7DDlvnlwzK9lle6Fu0E8t2vDX+
	wtwYCioYofana1LZCBhahff5vfVt0uo/kNMDUO6yD66sbnFUIF40RuNY34sR5K5nKHYhd4
	9rQGOLnQlXRWth7paertuCsmzIOI2xE=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-IjGfquDlMMKV9Yf7q1tZEA-1; Mon, 24 Aug 2026 09:16:43 -0400
X-MC-Unique: IjGfquDlMMKV9Yf7q1tZEA-1
X-Mimecast-MFC-AGG-ID: IjGfquDlMMKV9Yf7q1tZEA_1787577403
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7f5b54da461so58802937b3.3
        for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 06:16:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787577403; x=1788182203;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a5uoZNVB2XRKnrTBdvCmJrG8M4XSoSEJo8KaXU4b4e8=;
        b=dV6k4mzsA9JxCx5ZfBa8MtnD0YCFZMfit+D+kPKaUUxy7/BbZcclkr8GIfa3IewY/T
         baQy0P+6CHlXcJWTODNXu6tlEehzX+sLV8GpLzFvpkRoDFDbdUyE/7L41elgRXbmh5Eb
         xPjybPsxArrrOS3ocNm+FuZ3kU1/jGtrSHH59PGXMR/UjlyT1YU4pHij1Gs0OgygFWMM
         uNxZEaKyA8S+e/BzdYr0snyeUxbxeBbdKdAjtRGRONDcqXgtS/4lcxxwcoUSfZwtnedG
         FbwmS3KEYZL6L6E1UeQ8lQeWUZsRN+248EOyvLqsOEt4VYbCoU/1WJI0DNivND51S9Tf
         Z8vg==
X-Forwarded-Encrypted: i=1; AHgh+RqiV1gCUj+ndX6lcjby3uTU+tcI77dQbm4XHQVLC0+g0ePUhavC+Z5I0gJOGVZCPBC3nX7Qp1vG8w==@vger.kernel.org
X-Gm-Message-State: AFuF++m5+yx1eaHFqZIOKDE/qyUAddpQh4hs3yaIfk4HYq3Yfe7M4Aqn
	HQnlI9KBQbUu6cIY5D1d1nU5DXXRLjWuosBszASrSQFP2j6gsc4cXRaR8U+IZPvym943CXfSaT6
	9BmMkjeGfBAGhPb5K7/1JIQQ//3p4b7lDqoA6VNPoiB5E9llhJAvn54AlZ5oZ
X-Gm-Gg: AR+sD11ZLlCn6ib8pDCW4SEuHXyZ7B+yLIMBY2zgykTghQ7nFvg7RIJRozQ122G3HNm
	rlFkMlqIsY3mgaU4g3Hr2ew+ypCOoRpxhKjUJlNecPHt0HWZS+SI1tyzlbp/2ELMwIRK7JhjIvl
	tb2eOFQuRvESUIg5RrUczI6fLCWiWeCChcc/kMmxkRpqii/fMY9sx9gDt7pzWMn60A+jRkCo/fz
	HfCtVdRyIxAyUCphcXQ+Cb4ra+N/UOAfTX6s9xDpr0m6VgQyJtUfv1NTXGfTISS8XD8ujMzLOTm
	ZB8J/+tTF9K2fc58xGUMyLgZ283w9Qa15db9PolVmk1//5BjdUKZNe5Uf7RoH/qQECmP4g0+tzf
	NFFf4WhGU3dN79xCXfz4+EScFA2DVBOjYJuk=
X-Received: by 2002:a05:690c:e0c1:10b0:81e:a4cf:131b with SMTP id 00721157ae682-849f4a7cc91mr76172937b3.22.1787577403107;
        Mon, 24 Aug 2026 06:16:43 -0700 (PDT)
X-Received: by 2002:a05:690c:e0c1:10b0:81e:a4cf:131b with SMTP id 00721157ae682-849f4a7cc91mr76172227b3.22.1787577402495;
        Mon, 24 Aug 2026 06:16:42 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-84ca5d254adsm33243617b3.16.2026.08.24.06.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:16:41 -0700 (PDT)
Date: Mon, 24 Aug 2026 09:16:34 -0400
From: Brian Masney <bmasney@redhat.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Linus Walleij <linusw@kernel.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	David Lechner <david@lechnology.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>, Heiko Stuebner <heiko@sntech.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 29/45] clk: samsung: Make sure clk_init_data is fully
 initialized
Message-ID: <aoxEMm6FGf_onEBf@redhat.com>
References: <cover.1787239813.git.geert+renesas@glider.be>
 <87b3e83137e1a987f3c69d214706e93ef3898cab.1787239813.git.geert+renesas@glider.be>
 <60a8d05a-76fa-43c3-a0f7-fb26a3b659b8@kernel.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <60a8d05a-76fa-43c3-a0f7-fb26a3b659b8@kernel.org>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: quN1CWdv80vE4AFAC8yo609eoasvNL8bnj7JEbht0co_1787577403
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Krzysztof,

On Fri, Aug 21, 2026 at 01:04:01PM +0200, Krzysztof Kozlowski wrote:
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
> > ---
> > Compile-tested only.
> > ---
> >  drivers/clk/samsung/clk-cpu.c | 2 +-
> >  drivers/clk/samsung/clk-pll.c | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Let me know if I should take it via Samsung SoC clock tree. I assume by
> default this will go directly via clock tree.

Please take it through your Samsung tree to avoid merge conflicts if
there are other changes to these files during this development cycle.

Brian

