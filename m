Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421803;
	b=iP2wCVv/7JmV4RmCNe6JKbBwgO4+mqGFxD0UcLMknkAi72jD3dwV7zLIfk83hYykpR3f
	 hKajvLBD4vi5po4yNRzdPB650jKFP55Xzla3+b4CENzayWKAAK6RZncK3O0BjWV8ocx1i
	 7wn6XhH7/pz6720GTMST4JoEG1hBERWDFy1xS0iM4qSxvztroukESgWb4waqNxzRlafI1
	 nqBtYlsWOQXrKFRMzktXze9+xstV72yIiMhcq6MIqJ7Ke7zvcDHlqbnSWu/0s8thp6OUw
	 BKRl01KnpuX7VslqNIp1+e6QzdOOGrjM9X2RpdXZt5p3NxD0p9qVxFtMxs6fXPDABUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421803;
	h=Received:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Yo6/2OGJfxhXILo4QGIB9gHfvFskGfKjbh+hNyiFvf8=;
	b=rRCuWqP4LivBn9K2PBxpqat88VhK6p26rv8qz26K9sm+vOl3u6XGwJQSREgmsXv6Vj9n
	 48Mo3nNy1a11L+5b0AGzNKZMmSFYyt9dYq9PJMEoTASbZQulO23QwecFaS6fKrrMQ/3Hx
	 u/2hdplQ83l7VNe0uZo+rHubg3qRbEXPPzqSQ5oOm9PSaTrSRC7VyJct+Aqy8f0IAMApF
	 PzhYc99WbLq3sD5xGiW4jxhK04V9PEwvgwbgBNNhDGdOJmeF3Rx5S+kLFlSMzNJeQwx5x
	 PRzvxuY6svJVW4QIXv8OA4G4LFKFAwRsJouw1r2lA4tVPXjvJaGu3bWTQH9bpWei0lA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21AC160724AE
	for <arm-scmi.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:56:43 +0000 (UTC)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76603033E1
	for <arm-scmi@vger.kernel.org>; Mon, 19 Oct 2026 14:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421803; cv=none; b=LmMZdem/NDMzhBtXiB6RP3/5/keE7vXLBDovA2VX9rju8mgTTomZmtc6l5FIXn7O0SBK/a0pRL5kr8zvQ9yWqItBhyZAXoVFsQAlV1EM56OwRFUH5BxfrppksCm58FvoOQgCFbRqAygl3flrkPjsfYjdAPaiAJYTutc13+aRZ+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421803; c=relaxed/simple;
	bh=+5tzO8aCL83c5Kk9ARXsVnhNDY1XZ/tMHseqvaZ/klI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o5n1HNDxeQYseAxNdqh1KsGgJ+Ion2qDueB+AMFYb7l+8Nhzi62yC3AvtlaZfN6BD5ZT4RmcTYYuZwhW8L96P46LuIL8BLN5yE80RJQj5VsFBeFSpnW2Ed7FtX7LBSYrwL+deBndi9ER6VTswZu5w155UcAEMBieq0yLBwblF+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5ead4026fe6so247564e0c.2
        for <arm-scmi@vger.kernel.org>; Mon, 19 Oct 2026 07:56:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421800; x=1793026600;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Yo6/2OGJfxhXILo4QGIB9gHfvFskGfKjbh+hNyiFvf8=;
        b=cspApnZk5H0mZDP6qwlU8HwFKmRKUHvYfN/MNH7t4g4IL4EMKTCmhpdSkI8Oh6ZqIx
         7D69FT5AllHvZ6Q222cjP+r4ueeUntpkMU2ZHszId3YBF8Ijmc1Q1nZ/lzBVa8u3fyri
         z0SHM5N/Hyx3mJVIUkJndXXCT9vQFspIbp2fur88BNEoedSmP3pfuA5kHOYiDfyCqItI
         t3+8rgKJegycKYG6aIycScP5SqWPqrryDAPYfn1aSXXVMAGEBv98jyptQTG+l6IN1pwu
         jpegXvuenelJGLVQZYNgjrkJOBY8ZSz1wD4T3NHwrNj/QjTo64v1hBwMOA19oOyHaYln
         THwg==
X-Forwarded-Encrypted: i=1; AKwUvBxCd7QFN10m3k2I1MPnG9U7embsZbDXB6WJ0k8bTWk6jMjek/3lAAMjAmQ1ZIMhvis0W+KTNVOMCQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIfRsbqVrFhnoKK9hRpRpFi4eeFpRxgtkUyKrTtGHNV+BfQ29LL
	LAuWrzk9xTL4CsIKQMZ58/6tS5vOc1599OkbS0CYH4ru/oF3LlCbIMSiuDAvU+s3QEc=
X-Gm-Gg: AYBFou0DWA/MRTwW70gWLoBNINn/tU8wekUzK72w/B0zl6MHKQ3aSqtkeNLBBL+xasJ
	sCBCN3B6W9siE1gh6kjjHR7rDDvR6dsFQpI6pZc4mXMdb6STB5A70ouPXqTTWacZo0WK3xoAMsy
	Bxrnub7Rj3qfpGh6/1nv5xrtIZXuixBCw+XJOf73PYYwKJ+N3ebRs4XWiKAeR6GUTXzkQCfr+mL
	3e/J5d5Jq6z+PplkCH9du2i3/Z+ubuH/lBwBW77a4cReReR0/P3BtcymOT733RsFao9JdGh3671
	+QrVeZb7R0v5bb2pMWkwdmZTAdv7s4keFRZCUWlHD5oCUPFtGkFFDKNS9H95RQ/InHKfYJpHRGA
	YyF24qregTW4K2hECbxl9cBj9Su6WHJxZkEZyDZ4oEOzdA4Jt/8IEeA2VLNsF2EBKZx+Yrto7YF
	ce/c/s0eFI6X/8ibnbfKHWqor5XUl3G1H3bpHZKCRcqGZLZEkoM0WcOoANMfR2j1zw7EUb9x5Ed
	oQ4Kr14Sd46pJJM0gLwW8UW4/oP+3BhkdaKrUP+W1vj9U0=
X-Received: by 2002:a05:6122:46aa:b0:5ea:d296:f867 with SMTP id 71dfb90a1353d-5ead2970496mr496576e0c.22.1792421800493;
        Mon, 19 Oct 2026 07:56:40 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ead0d98376sm2079710e0c.1.2026.10.19.07.56.39
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:56:39 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9905d61449cso530290241.0
        for <arm-scmi@vger.kernel.org>; Mon, 19 Oct 2026 07:56:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxue8+PvmePM2jdQINzypD/42VGOAEnY9mVEe4M7hbTHqviTsz6qVTl9WIc1jKuNGnfAIRa4PI1+Q==@vger.kernel.org
X-Received: by 2002:a05:6102:f86:b0:7cb:288a:b66d with SMTP id
 ada2fe7eead31-7cc369ac7b5mr1684195137.20.1792421799154; Mon, 19 Oct 2026
 07:56:39 -0700 (PDT)
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
 <20261019144256.GC763679@killaraus.ideasonboard.com>
In-Reply-To: <20261019144256.GC763679@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 16:56:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWkAvkxHkzRVviF_NkZHP7UeCBjebxciE6jFN_8ViM=aQ@mail.gmail.com>
X-Gm-Features: AclHuK9UZUEUyPMO3TO_vFhUiV57c9SStFUdXlV8TRdwkOQjKO9ySUhEkuMfo5c
Message-ID: <CAMuHMdWkAvkxHkzRVviF_NkZHP7UeCBjebxciE6jFN_8ViM=aQ@mail.gmail.com>
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

On Mon, 19 Oct 2026 at 16:42, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Oct 16, 2026 at 05:55:40PM +0200, Geert Uytterhoeven wrote:
> > Prepare for mapping to other than fixed-rate clocks by adding a clk_hw
> > pointer to the clk_map structure, and populating it up-front.
> >
> > Move r8a78000_cpg_priv.fixed_hws into fill_clk_map(), as it is no longer
> > needed afterwards, and drop NUM_FIXED_CLKS.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/clk/renesas/r8a78000-cpg.c
> > +++ b/drivers/clk/renesas/r8a78000-cpg.c
> > @@ -16,19 +16,24 @@
> >
> >  #include <dt-bindings/clock/renesas,r8a78000-cpg.h>
> >
> > +struct clk_map_in {
>
> The "_in" suffix isn't very explicit.

I can add a comment...

> > +     int dt_id;              /* DT binding clock ID or -1 sentinel */
> > +     u32 fw_id;              /* FIXED_CLK() ID */
> > +};
> > +
> >  struct clk_map {
> >       int dt_id;              /* DT binding clock ID or -1 sentinel */
> >       u32 fw_id;              /* FIXED_CLK() ID */

BTW, do you think it would be worthwhile to reuse clk_map_in here?

> > +     struct clk_hw *hw;
> >  };

> > @@ -92,35 +94,69 @@ static struct clk_hw *r8a78000_clk_get(struct of_phandle_args *spec,
> >       return hw;
> >  }
> >
> > -static int register_fixed_clks(struct r8a78000_cpg_priv *priv)
> > +static struct clk_hw **register_fixed_clks(struct device *dev)
> >  {
> > -     struct device *dev = priv->dev;
> > +     unsigned int n = ARRAY_SIZE(fixed_clk_rates);
> > +     struct clk_hw **hws, *hw;
> >       unsigned long rate;
> > -     struct clk_hw *hw;
> >       const char *name;
> >
> > -     for (unsigned int i = 0; i < ARRAY_SIZE(fixed_clk_rates); i++) {
> > +     hws = devm_kcalloc(dev, n, sizeof(*hws), GFP_KERNEL);
> > +     if (!hws)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     for (unsigned int i = 0; i < n; i++) {
> >               rate = fixed_clk_rates[i];
> >               name = devm_kasprintf(dev, GFP_KERNEL, "cpg-%lu", rate);
> >               if (!name)
> > -                     return -ENOMEM;
> > +                     return ERR_PTR(-ENOMEM);
> >
> >               hw = devm_clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
> >               if (IS_ERR(hw))
> > -                     return PTR_ERR(hw);
> > +                     return ERR_CAST(hw);
> >
> > -             priv->fixed_hws[i] = hw;
> > +             hws[i] = hw;
> >       }
> >
> > -     return 0;
> > +     return hws;
> > +}
> > +
> > +static const struct clk_map *fill_clk_map(struct r8a78000_cpg_priv *priv,
> > +                                       const struct clk_map_in *map_in)
> > +{
> > +     struct device *dev = priv->dev;
> > +     struct clk_hw **fixed_hws;
> > +     struct clk_map *map;
> > +     unsigned int i;
> > +
> > +     fixed_hws = register_fixed_clks(dev);
> > +     if (IS_ERR(fixed_hws))
> > +             return ERR_CAST(fixed_hws);
> > +
> > +     for (i = 0; map_in[i].dt_id >= 0; i++) { }
>
> This is avoidable by passing { map, ARRAY_SIZE(map) } as match data
> instead of just the map.

True, and I did consider this.
The same mechanism is used in the MDLC driver, where using ARRAY_SIZE()
would quickly became a bigger burden due to the presence of many
more maps.  So for consistency, I kept it the same in both drivers.
An initialization macro might make it more manageable, though.

> > +
> > +     map = devm_kcalloc(dev, i + 1, sizeof(*map), GFP_KERNEL);
> > +     if (!map)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     for (i = 0; ; i++) {
> > +             map[i].dt_id = map_in[i].dt_id;
> > +             if (map[i].dt_id < 0)
> > +                     break;
> > +
> > +             map[i].fw_id = map_in[i].fw_id;
> > +             map[i].hw = fixed_hws[map[i].fw_id];
> > +     }
> > +
> > +     devm_kfree(dev, fixed_hws);
>
> Why not plain kcalloc/kfree ?

To avoid having to free it manually at multiple (three) locations,
both in the error paths and the success path?

>
> > +     return map;
> >  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
