Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792427873;
	b=kPz5EC/eWs1ZdYPfSWaAzHiqj1Ss3XCLc2zCSK85Lz6uSPdtvXgYOrV9gJI6k0LOng0+
	 CHTsJc3jPpFM1TXet2Ry9VNrgkmHTMjyREw/wbQfhCeUwKZJ91BfO2lyhlFRxog9tj7XA
	 HXZTOpw7dxh1qsMGd8Dlq7fdmHanTYZtnY4jxUsb+u5TajJR0V9oF3VRTLvIDH47hbNBl
	 2hH95wnSRcHs1wGGmB0Ey4FMF+zRDYA7YvVufAfUuqy0+g1pAay6/IMz772nYQaCgYoMy
	 BC6N40We0CfGMvHOhN3HuOAfBxgbH7tiybRS54G6eTwJTOtjDyeyUtbAne49WetxEhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792427873;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=PmiGcIdjfKIGHCu1gzOSxutdw7IHUOocB921VJoVgxA=;
	b=w7zrPl2Afrs856AZWbBra8Y7Wtoo7EHHuqqc7dUR3utfVybWfejiQfauqU30LJOHAwsp
	 fB0Y6nHNwwWlXBpXBgRlnAhmhHI9hfb5ETJxAasXd0Q/jE+djacKlp81KX0B1txdGC/tX
	 XSA51HAdj6ndUGAGpq0BGrPALVCQhZCI7wHHdG8RpRf7hrjrEalo0sC/KfZkaajPoyHWK
	 g/u/2WIavR4ozCA017sMr6tAEeRcbUXiBR/y5PF1kgKtIQHyJvPxByCr8/UDQcq3JIcye
	 yMGld/+/W974+PtSYIfDxmi5ajQK9rUlZNNF4+KXmSULHhyJBuq1FRYVvVT/sB7VtWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FB3606A31A
	for <arm-scmi@vger.kernel.org>; Mon, 19 Oct 2026 16:37:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76FB3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so263567266b.3
        for <arm-scmi@vger.kernel.org>; Mon, 19 Oct 2026 09:37:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792427872; x=1793032672;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PmiGcIdjfKIGHCu1gzOSxutdw7IHUOocB921VJoVgxA=;
        b=QhsPp8fShF/LiY3WL0Hkn/SSMunbpH5+B+Av7h7f+n5bVs7SVF4FuEI9BCL6mPTfK2
         qsSyOpjzxub/qwl03hPGKNWNR+AlO4/9OfvCCJ94aX0Hnym1qP4CUqqlwNIwQVEhf8/X
         2GLR7U46i5WqhlNha1zMyw4P6LNOCwyADWEEkrgvfFV68C7vbgtP5lprB8FGI7NZqKRh
         WfGFPuySV7h1giuerq3fxQnNrBZWqx8kaaIyqWH6ec4TNcSoGrVEljm9gZvK4bPwhgMO
         lx6splySKkJADPnp6fehj1cCN/3MYLpOylP/Qu0peXeiDjKZsKYj2HPJDCq9fmvkuNJi
         flWg==
X-Forwarded-Encrypted: i=1; AKwUvByffPE6mytkNGn/0n29cfjwbm3UOjmJvvAGOQ3NRUsk9Th/M0U51bBH7IKpFTTd0TMBFR8s44W2Xw==@vger.kernel.org
X-Gm-Message-State: AFq9FYK2/nePsPPVWZH1myZN7s2OZuDWXM1Qu6pqjsfM4Ut30FsuK2pD
	VW1fAazrpDQEtI/FJDd+DWPxdqb5BIq6CaUexx5yeSZwwSYlG3aYx6kq7ED8XCk1/r4=
X-Gm-Gg: AYBFou2B4lvqmZIyCB6DslCV4Mbhp7sR5uLQ+uRcZERVWTkkUiYYVz9GXFgH3nKzvTE
	o8bEHk0yp3XVnOg+TiTzZNPyL4jnJ4q516+Jk5xQoRsXRcFWqfFfwIW6icDiT20LxFqCtPd+F91
	eLOOr4VlTZMXdNSQ2qlWt+jFxNL1iEf04rRL0NckxuBkNt2GuGyv7YCJaZbhrwEFFmE2cqN1AeZ
	y0YET2FXln0pSL9AxydBnxmsswdSW3o3+s9aBnuXCeR/u4OowwX+QX71I7cMB7XB0EEwPPupX9t
	u0fO3AUk1I81GOo7FhpkCLcmOxRkGKYKMxrORSYi+L2qRFi54MMQldXqxJ2DqktJSac5t9HPNGj
	molFJCS2+NbrymI10zCafU0xHd5NPxja0gF58XhUVDO+5SFWFxOWajrpkKdxL5Wtt8Iq63DmLOQ
	5vkaoHNf7hFhNSdkzhS91gPGpdciKkwUYOk45pOiUUMP5xPRitn2mVO/rArgcRd5zR6qvNVKNO2
	JE0hXZb2mt5/fJzR2cuyXDrdAKc8cwmn7hw
X-Received: by 2002:a17:907:1ca3:b0:c2e:4292:d268 with SMTP id a640c23a62f3a-c419e039005mr605449066b.16.1792427871718;
        Mon, 19 Oct 2026 09:37:51 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf35asm380593366b.19.2026.10.19.09.37.50
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 09:37:50 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c43fbcb4393so170995866b.0
        for <arm-scmi@vger.kernel.org>; Mon, 19 Oct 2026 09:37:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzW21jigZ6WKLCfCrJLz28xVNLqaLpS56zLWAuv3R9woW9zUHBHruR0MxQULFgk4mBqKqzRBykFzA==@vger.kernel.org
X-Received: by 2002:a17:907:9605:b0:c3e:ee86:d2c with SMTP id
 a640c23a62f3a-c419f31c8bamr564444366b.27.1792427870527; Mon, 19 Oct 2026
 09:37:50 -0700 (PDT)
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <1d7da50cfb58232c6dd4c4afefb938fd7e62fdcd.1792163045.git.geert+renesas@glider.be>
 <20261019144256.GC763679@killaraus.ideasonboard.com> <CAMuHMdWkAvkxHkzRVviF_NkZHP7UeCBjebxciE6jFN_8ViM=aQ@mail.gmail.com>
 <20261019152203.GA5830@killaraus.ideasonboard.com> <20261019161436.GD3705@killaraus.ideasonboard.com>
In-Reply-To: <20261019161436.GD3705@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 18:37:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVRvguzV+3CpOfkR+b-a0p5TrmUUF1fV0kdafXuNLV1oA@mail.gmail.com>
X-Gm-Features: AclHuK-8scCJz9rF32kL_0712rSWvXw0tvi_Wr1HURn1pKiiIZROkb3-2ONTagY
Message-ID: <CAMuHMdVRvguzV+3CpOfkR+b-a0p5TrmUUF1fV0kdafXuNLV1oA@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] clk: renesas: r8a78000: Add clk_hw to clk_map
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Mon, 19 Oct 2026 at 18:14, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Oct 19, 2026 at 06:22:04PM +0300, Laurent Pinchart wrote:
> > On Mon, Oct 19, 2026 at 04:56:28PM +0200, Geert Uytterhoeven wrote:
> > > On Mon, 19 Oct 2026 at 16:42, Laurent Pinchart wrote:
> > > > On Fri, Oct 16, 2026 at 05:55:40PM +0200, Geert Uytterhoeven wrote:
> > > > > Prepare for mapping to other than fixed-rate clocks by adding a clk_hw
> > > > > pointer to the clk_map structure, and populating it up-front.
> > > > >
> > > > > Move r8a78000_cpg_priv.fixed_hws into fill_clk_map(), as it is no longer
> > > > > needed afterwards, and drop NUM_FIXED_CLKS.
> > > > >
> > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > > > --- a/drivers/clk/renesas/r8a78000-cpg.c
> > > > > +++ b/drivers/clk/renesas/r8a78000-cpg.c
> > > > > @@ -16,19 +16,24 @@
> > > > >
> > > > >  #include <dt-bindings/clock/renesas,r8a78000-cpg.h>
> > > > >
> > > > > +struct clk_map_in {
> > > >
> > > > The "_in" suffix isn't very explicit.
> > >
> > > I can add a comment...
> >
> > How about calling it clk_id_map ?
> >
> > > > > +     int dt_id;              /* DT binding clock ID or -1 sentinel */
> > > > > +     u32 fw_id;              /* FIXED_CLK() ID */
> > > > > +};
> > > > > +
> > > > >  struct clk_map {
> > > > >       int dt_id;              /* DT binding clock ID or -1 sentinel */
> > > > >       u32 fw_id;              /* FIXED_CLK() ID */
> > >
> > > BTW, do you think it would be worthwhile to reuse clk_map_in here?
> >
> > Possibly. I was about to recommend just using a single structure and
> > leaving the clk_hw pointer NULL and unused in .rodata, but the memory
> > waste isn't very nice, especially if we end up with many entries :-(
>
> Actually, you could even turns clk_map into
>
> struct clk_map {
>         const struct clk_id_map *map;
>         struct clk_hw *hw;
> };
>
> It should consume the same amount of space on 64-bit platforms. Doing
> the same in the MDLC driver would save space.
>
> Or, if you want to save more memory, you could drop clk_map and store
> the clk_hw in a separate array in r8a78000_cpg_priv, using the same
> indices as clk_map_id.
>
> struct r8a78000_cpg_priv {
>         struct device *dev;
>
>         const struct clk_id_map *map;
>         unsigned int num_map_entries;
>         struct clk_hw **clks;
>
>         struct clk_hw *fixed_hws[NUM_FIXED_CLKS];
> };
>
> where clks is a dynamically-allocated array fo struct clk_hw pointers,
> having the same size as the map array.

IIRC, I considered that option, but rejected it, as I still hoped to
put the (at that time multiple, per version) tables in __initconst,
so they had to be allocated and copied anyway...

> Too many options.

Hehe...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
