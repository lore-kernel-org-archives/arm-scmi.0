Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D803FCB3C
	for <arm-scmi@vger.kernel.org>; Tue, 24 Mar 2026 13:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774359835; cv=none; b=NoZvdYxqeDLkEz4XFie3xhxl1TVw/zAWDw1yN0LlK/kZUZbCqPixYfLAkG4hXSgJey/9ILWCtBZ2ztfCzWF/Bjv34T7UU3wYtbo1X/mhJFwQhc/qvhZaN37aHYXsfss1BstTNeqa4FnjZQG+jq5D7WHvJvTL/NzEi5z9DCeSuSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774359835; c=relaxed/simple;
	bh=v0TQlWPzu8GTPZY9FpXVbuwaCxkxoZDN7EjwI6xWIr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lH5wQ9ZhEJohC/bqWudwVZhoPoh5WZbR3xjPnzuiadRDWjoNZ2B24zCSV180/xfWsCrWPZSCSwB9jKF0ZIiApocMy3mUqxEG6/8IUzj7iio3UVotbZg77bkVJGBe+BXb0sZBMKaGgx7/YyzGddd7oVkePHXKuUOhQJqA63CeiHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5ffe9a5b128so1412644137.2
        for <arm-scmi@vger.kernel.org>; Tue, 24 Mar 2026 06:43:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774359834; x=1774964634;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3UNdFM/2oVC0aBHnMmb6liNAkmGmbywgRrpmh1ChmU=;
        b=bZTyR4KrYlN2QiZU0GWI6ZNfMBHYmLEjOy/7K1uRz+LwgNq11SHyUPQMSCNsMYi4uu
         dmzS2klSiFPgoIGof3axdxdxK2rtZ0eqVtrRezoHxBF6hy0BrPbgxv3J7Fv1Hc1S0MyE
         wQxBuaOIwJ0tCBvavMtUPUi5iEaVKvLeY8ANt3h68JnP3MaCt0pja2Xtk2dP3bySBZhc
         NwK+DT41VDcT7ImWoZLzEyTLLajwxd+qiftsAejvE1e844d4+RjjKMlrIHMYB4CBooFM
         VBSQakiObuuks2FGbZxCuI0DL2Ymh6u7gNgJY+soJyyRTLI1u0btnBtbAjc88y7hzzbQ
         ZzJw==
X-Forwarded-Encrypted: i=1; AJvYcCV0hgU07S7zqhSHKrS+CTbvZYTeb6kGwQXMZQJu42o1BOEjRfyq8HUhf5GGX4AfwtbgPI/6f2qGUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfBM8IGRPnF3FHa7p6lsoKQoStO5CHWXTw3TyxP+I302sBPrN4
	Fou566V4Dzh3pAXZA5Cn6Dl6vMGpN8TQ/bAZ0ydH/RQnMZA7+27sQzPlaG4nHLKI06s=
X-Gm-Gg: ATEYQzz9HrG9K1f2P+JsBNfkdFDuU1Jb4l2716W82YgtlcIv7AmanUqkXXy+iVJsS3e
	mtAyXk9IcjPAWdJ+FxsZ/7lhrxayaP3hsW/E9z42UBJuQzcLtZeM/BKZ0hPMB3c+FG16AlbE08o
	7sjOdqxeo3tWppiflie1DQexpCsuzTct7zaEgEdVzWsVBH3SzBGyMJax0b5PeSK2IUbkVnyRRM7
	W+8dIZbDWgC1SU5+24ZGaIqtZJ0lZ/wxa1EU8DimvRZ17O6YSuopeSr+D42jYONxYTXVqT78zyd
	5MgoXzbGQ3ibtZ7kNQPTYSpOAnTeY0Env7Lw4OP8TWM2vjVhitgkxXdgwdj7/tsY7ZcnKrmDAWW
	nZFXcpjnJzPEsByptkA5QIIR/+BrOe5bL2b1yVWj39jwXTEWJiVTHIOIDDtA3Co1lKKlNrb61mU
	nsXulsI0wbiY+VrhPMWuv6KKoRSRfesY2+kWt9Nw1Ex/cXcUITrPRPxPmMuRurfMlWPnFsvNI=
X-Received: by 2002:a05:6102:6b01:b0:602:86a6:986a with SMTP id ada2fe7eead31-602aed277a0mr7885005137.27.1774359833549;
        Tue, 24 Mar 2026 06:43:53 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-602af8ae780sm10787944137.4.2026.03.24.06.43.52
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 06:43:52 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-950d235b500so1450501241.0
        for <arm-scmi@vger.kernel.org>; Tue, 24 Mar 2026 06:43:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWMqmtkxC5FvwH8y0iQ7vVZn+YeI9vhHNIFXRVifjdGAK4zrBMVh0d5m1U/jacsBWvGF0YR1NFhBw==@vger.kernel.org
X-Received: by 2002:a05:6102:5812:b0:602:71a7:63c2 with SMTP id
 ada2fe7eead31-602aecd0de0mr7186355137.23.1774359832015; Tue, 24 Mar 2026
 06:43:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-9-cristian.marussi@arm.com> <CAMuHMdUdqrA9kYeDpjwj-y6-4aALkAi2g2Od81Kxh-EVW2e2Nw@mail.gmail.com>
 <abG4VfyB2C-gBa5Q@pluto> <20260312-classy-misty-platypus-5baea1@sudeepholla>
 <abLrm7x8ggzAhYOg@pluto> <CAMuHMdVWL4rVTPnsMofPKFKCozjCPqF0K95ZFmrdrBD8EUt22A@mail.gmail.com>
 <abgsW1yoGtMNE3c7@pluto> <CAMuHMdU1Z9NiQOd10zsimMcOfSC=dVYbfjAKKT4aD3Zx9KttVQ@mail.gmail.com>
In-Reply-To: <CAMuHMdU1Z9NiQOd10zsimMcOfSC=dVYbfjAKKT4aD3Zx9KttVQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Mar 2026 14:43:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWm9X5TLaAHgCsMqjFZLvUsDjrf4CqzNiO-Hsr4X9bDtw@mail.gmail.com>
X-Gm-Features: AQROBzDvNZgLoQvhVJc-PSdP06Iq5zvkWOybQz-6zVMkfKMPvuuu_fBc0vUNAPY
Message-ID: <CAMuHMdWm9X5TLaAHgCsMqjFZLvUsDjrf4CqzNiO-Hsr4X9bDtw@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] firmware: arm_scmi: Harden clock protocol initialization
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, dan.carpenter@linaro.org, 
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com, 
	marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Cristian,

On Mon, 16 Mar 2026 at 17:35, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, 16 Mar 2026 at 17:14, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > On Mon, Mar 16, 2026 at 04:50:17PM +0100, Geert Uytterhoeven wrote:
> > > Then I came up with the following preliminary (have to check more
> > > firmware versions) quirk (Gmail whitespace-damaged):
> > >
> > > diff --git a/drivers/firmware/arm_scmi/clock.c
> > > b/drivers/firmware/arm_scmi/clock.c
> > > index f62f9492bd42afbc..6f2af6e9084836c6 100644
> > > --- a/drivers/firmware/arm_scmi/clock.c
> > > +++ b/drivers/firmware/arm_scmi/clock.c
> > > @@ -1230,6 +1230,18 @@ static const struct scmi_protocol_events
> > > clk_protocol_events = {
> > >         .num_events = ARRAY_SIZE(clk_events),
> > >  };
> > >
> > > +#define QUIRK_RCAR_X5H_NO_ATTRIBUTES                                   \
> > > +       ({                                                              \
> > > +               if (ret == -EREMOTEIO || ret == -EOPNOTSUPP)            \
> > > +                       continue;                                       \
> > > +       })
> > > +
> > > +#define QUIRK_RCAR_X5H_NO_RATES
> > >          \
> > > +       ({                                                              \
> > > +               if (ret == -EOPNOTSUPP)                                 \
> > > +                       ret = 0;                                        \
> > > +       })
> > > +
> > >  static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
> > >  {
> > >         int clkid, ret;
> > > @@ -1254,10 +1266,12 @@ static int scmi_clock_protocol_init(const
> > > struct scmi_protocol_handle *ph)
> > >         for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
> > >                 cinfo->clkds[clkid].id = clkid;
> > >                 ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> > > +               SCMI_QUIRK(clock_rcar_x5h_no_attributes,
> > > QUIRK_RCAR_X5H_NO_ATTRIBUTES);
> > >                 if (ret)
> > >                         return ret;
> > >
> > >                 ret = scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > > +               SCMI_QUIRK(clock_rcar_x5h_no_attributes,
> > > QUIRK_RCAR_X5H_NO_RATES);
> > >                 if (ret)
> > >                         return ret;
> > >         }
>
> > > Does that look like what you have in mind?
> > > Thanks!
> >
> > Yes in quirk I was only addressing NOT_ATTRIBUTES and mimicing the old
> > behaviour with continue, BUT if the set of clocks not supporting attributes
> > and the set of clocks not suppporting rates is disjoint, I feel we need your
> > double quirks :P
>
> I could have used
>
>     SCMI_QUIRK(clock_rcar_x5h_no_attributes, QUIRK_RCAR_X5H_NO_ATTRIBUTES);
>
> after both scmi_clock_attributes_get() and
> scmi_clock_describe_rates_get(), but I wanted to keep the check as
> strict as possible: the former returns two error codes to ignore,
> the latter only one.

So these are two mitigations:

    #define QUIRK_RCAR_X5H_NO_ATTRIBUTES    ({ ... })
    SCMI_QUIRK(clock_rcar_x5h_no_attributes, QUIRK_RCAR_X5H_NO_ATTRIBUTES);

and

    #define QUIRK_RCAR_X5H_NO_RATES         ({ ... })
    SCMI_QUIRK(clock_rcar_x5h_no_attributes, QUIRK_RCAR_X5H_NO_RATES);

gated by a single quirk entry clock_rcar_x5h_no_attributes:

    DECLARE_SCMI_QUIRK(clock_rcar_x5h_no_attributes);
    DEFINE_SCMI_QUIRK(clock_rcar_x5h_no_attributes, "Renesas", NULL,
                      "0x10a0000", "renesas,r8a78000");
    __DECLARE_SCMI_QUIRK_ENTRY(clock_rcar_x5h_no_attributes),

In general, when a specific SCMI implementation has multiple quirks
and needs multiple mitigations, do you prefer to have individual
entries for each quirk plus mitigation, or just a single entry with
multiple mitigations (which may not be limited to a single protocol,
unlike my example above)?

Thanks!


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
