Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB603A1D07
	for <arm-scmi@vger.kernel.org>; Mon, 16 Mar 2026 16:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773678941; cv=none; b=kQrr6wvV+wPlzwwiqRBGHaVeh5BE4Vax/y/a4dnPYu5gOWVJMAHSCMXc5weT+L4AEXBeCqqlgma/VQFrwxNl+QeCrCn7tnolP9Dtde6GZOSOjEkyMyKMsX1vJGSLzkCgT4VNkc5EtL79wsbH4L6rnAmpU4s4BEEbM39k6BvtFJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773678941; c=relaxed/simple;
	bh=cQv0F14L7VZaOZP71JRDDpNLLzI0Tf+dEL8n5ccKZl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LgwMCuN1ANFagCoLnXHGI0P2TBF1rr0MzDGGwU8GsOeDnmE6xfHajVUY+zzf93Xi3mScjaVFfqfpWWZ/rNlOJIIlGeirjcnx2Q7GKm1oIT2q5i7FiEuQ3yqb7HiAHaGHjjO/n1reirXr/oADN/9BmEjJoLBEsguAr0Ap3XkBLgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-94ac5cb71feso1238260241.2
        for <arm-scmi@vger.kernel.org>; Mon, 16 Mar 2026 09:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773678939; x=1774283739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwkbFxjRydoL+3S1meFk7eWFdNhpUXApysI3YafwRzw=;
        b=N1pOoylPwDXyXFEhjQG3jHVhJ6/rggeCbFDW5VNjPfTFZ0CCJS4YBL7ipIyGmgX7jO
         zqyKNz6t3+CIXRQG5SFPyO/0gu4bdkS8sPPAYE/On/PrOKqCQJiQZuMozTHOJFipjjpJ
         wTzdKG+vS8fZBEREmI7Ox+PJIGfWWwdh4luhIBOAr1A7gO5Qg3RzdqFjw0ex0ByktU3X
         SdfUv6+4d3MbfacjgGxDLQUfJNG3/eP6+hCRRuyiLagQS72ycfDvUxbaV4YHGONyba7V
         p45mbjzB+NBaJs1so+C4zeues96Eqzm/NBfSLNPK/IibOxZ1ge7mtxI6JfFcNkB/VcUb
         +WzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWusTMrJH8aaippZQyIUNn8Sw1Saw1mYi+ocbI0KOChFJd3Xxol1uOVBSDzJj117ZRJjrQSWVV1gg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDbAm9tdtaytrQYlbybKBC1CTOjgw1r/RhLfWZu0meARY3wbGj
	l7tvzWbCleX/56UggTG3mHK5DPpKGMQtLoUFRgBLw9KzDxfLdxeoEf6PDDOu/m4K
X-Gm-Gg: ATEYQzxD8gXdKr4720uSRDV2uAVoCpgtlW3YtP4BDRLkAWtKu8m6ODOkmSWtjPjqnE3
	uLGzrAPb9dcoKe3nLsUffp6e6vKBJbvFlL9vnYcViOaC/dfRiomrOMRKxZHxXEDJrw1AiqKPDeb
	or7OX+ASZaSaVMk1d24wpMcVK12RP2WZsNrVQXA+yGTUOOqH7s7FXLga+VJoJRVHXOYdlpqh26k
	M0Zz+5gZ70nVoRT3SsUo4gyXZguKeUfxqnoE1+YPzFsMxvy1FYlzCe09MsRrk2cUEs1lEYogrol
	X21GFmwYeKV4A3dXg5RwCDXAa8iCOpUIYZIhTNpmZcZfSvbDbBOCuPxB//TxDYEtE2k8AmUA5iw
	bwM2kYHjy4wGwaeU5Zxmtc/BEiZ/p+SBX60nv9fnmwzw+zZupGOZ/Da+I/G74C7lOTb0pPOLIy8
	9Qe2y0mlJLcMJ8tTiX2JMr4TR0J0+y5MYOdVX+b/pE2zxa4N7u1vwIFOAH9zfrGGUY
X-Received: by 2002:a05:6102:2ad3:b0:5ff:bd9d:b1f8 with SMTP id ada2fe7eead31-6020e26a8dcmr5145550137.9.1773678939066;
        Mon, 16 Mar 2026 09:35:39 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-601dea9f6ecsm6795936137.10.2026.03.16.09.35.37
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 09:35:37 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5673804da95so1814171e0c.0
        for <arm-scmi@vger.kernel.org>; Mon, 16 Mar 2026 09:35:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGDcoRuMUdME6pG29iZr1hVK4GZqdJdrZh4qqKCNBSwNL/ndJ156h3PbbsS726AgrNA3DfJJLD0w==@vger.kernel.org
X-Received: by 2002:a05:6102:41a8:b0:5ff:f366:dbe1 with SMTP id
 ada2fe7eead31-6020e2ca6f9mr4658842137.15.1773678937299; Mon, 16 Mar 2026
 09:35:37 -0700 (PDT)
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
 <abgsW1yoGtMNE3c7@pluto>
In-Reply-To: <abgsW1yoGtMNE3c7@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Mar 2026 17:35:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU1Z9NiQOd10zsimMcOfSC=dVYbfjAKKT4aD3Zx9KttVQ@mail.gmail.com>
X-Gm-Features: AaiRm51lpyc-i3j3bxjBB2lDNXTNKjsxn3Z8MoQ6iXS2hbjQwIIJtMCDQtgnhDA
Message-ID: <CAMuHMdU1Z9NiQOd10zsimMcOfSC=dVYbfjAKKT4aD3Zx9KttVQ@mail.gmail.com>
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

On Mon, 16 Mar 2026 at 17:14, Cristian Marussi <cristian.marussi@arm.com> wrote:
> On Mon, Mar 16, 2026 at 04:50:17PM +0100, Geert Uytterhoeven wrote:
> > On Thu, 12 Mar 2026 at 17:36, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > On Thu, Mar 12, 2026 at 03:33:52PM +0000, Sudeep Holla wrote:
> > > > On Wed, Mar 11, 2026 at 06:45:41PM +0000, Cristian Marussi wrote:
> > > > > On Wed, Mar 11, 2026 at 05:59:43PM +0100, Geert Uytterhoeven wrote:
> > > > > > On Tue, 10 Mar 2026 at 19:56, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > > > > > Add proper error handling on failure to enumerate clocks features or
> > > > > > > rates.
> > > > > > >
> > > > > > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

> > > > > > > --- a/drivers/firmware/arm_scmi/clock.c
> > > > > > > +++ b/drivers/firmware/arm_scmi/clock.c
> > > > > >
> > > > > > > @@ -1143,8 +1149,12 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
> > > > > > >         for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
> > > > > > >                 cinfo->clkds[clkid].id = clkid;
> > > > > > >                 ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> > > > > > > -               if (!ret)
> > > > > > > -                       scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > > > > > > +               if (ret)
> > > > > > > +                       return ret;
> > > > > >
> > > > > > This change breaks R-Car X5H with SCP FW SDKv4.28.0, as some clocks
> > > > > > do not support the SCMI CLOCK_ATTRIBUTES command.
> >
> > Apparently it is not just CLOCK_ATTRIBUTES, but also
> > CLOCK_DESCRIBE_RATES.
>
> I was indeed suspicious that I could have opened a can of worms by
> more strictly enfrocing these...
>
> > > > > > Before, these clocks were still instantiated, but were further unusable.
> > > > > > After, the whole clock driver fails to initialize, and no SCMI clocks
> > > > > > are available at all.
> > > > >
> > > > > ...and this is exactly what I feared while doing this sort of hardening :P
> > > > >
> > > > > So there are a few possible solutions (beside reverting this straight away)
> > > > >
> > > > > The easy fix would be instead change the above in a
> > > > >
> > > > >     if (ret)
> > > > >             continue;
> > > > >
> > > > > ...with a bit of annoying accompanying FW_BUG logs, of course, to cause future
> > > > > FW releases to fix this :D
> > > > >
> > > > > Another option could be leave it as it is, since indeed it is the correct enforced
> > > > > behaviour, being CLOCK_ATTRIBUTES a mandatory command, BUT add on top an ad-hoc SCMI
> > > > > quirk targeting the affected FW releases...
> > > > >
> > > > > This latter option, though, while enforcing the correct behaviour AND
> > > > > fixing your R-Car issue, leaves open the door for a number of possible
> > > > > failures of other unknowingly buggy Vendors similarly deployed firmwares...
> > > > >
> > > > > ...that could be solved with more quirks of course...but...worth it ?
> > > > >
> > > > > Thoughts ?
> > > > >
> > > > > Let's see also what @Sudeep thinks about this...
> > > >
> > > > I prefer to fix it as a quirk to prevent similar issues on newer platforms if
> > > > the firmware baselines are derived from it. In the worst case, we can relax
> > > > the hardening until we figure out a proper quirk-based solution.
> > >
> > > Ok, I can post a V3 with a dummy quirk 'template' RFC to be filled by
> > > Geert with proper versioning....so I can check that there are no
> > > surprises round the (quirked) corner...
> >
> > Unfortunately you cannot "continue" from a quirk, without resorting
> > to a goto, so I sent a fix: "[PATCH] firmware: arm_scmi: Support loop
> > control in quirk code snippets"[1].
>
> Yes ... just realized that this afternoon when trying to draft a
> quirk... (see other thread)
>
> > Then I came up with the following preliminary (have to check more
> > firmware versions) quirk (Gmail whitespace-damaged):
> >
> > diff --git a/drivers/firmware/arm_scmi/clock.c
> > b/drivers/firmware/arm_scmi/clock.c
> > index f62f9492bd42afbc..6f2af6e9084836c6 100644
> > --- a/drivers/firmware/arm_scmi/clock.c
> > +++ b/drivers/firmware/arm_scmi/clock.c
> > @@ -1230,6 +1230,18 @@ static const struct scmi_protocol_events
> > clk_protocol_events = {
> >         .num_events = ARRAY_SIZE(clk_events),
> >  };
> >
> > +#define QUIRK_RCAR_X5H_NO_ATTRIBUTES                                   \
> > +       ({                                                              \
> > +               if (ret == -EREMOTEIO || ret == -EOPNOTSUPP)            \
> > +                       continue;                                       \
> > +       })
> > +
> > +#define QUIRK_RCAR_X5H_NO_RATES
> >          \
> > +       ({                                                              \
> > +               if (ret == -EOPNOTSUPP)                                 \
> > +                       ret = 0;                                        \
> > +       })
> > +
> >  static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
> >  {
> >         int clkid, ret;
> > @@ -1254,10 +1266,12 @@ static int scmi_clock_protocol_init(const
> > struct scmi_protocol_handle *ph)
> >         for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
> >                 cinfo->clkds[clkid].id = clkid;
> >                 ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> > +               SCMI_QUIRK(clock_rcar_x5h_no_attributes,
> > QUIRK_RCAR_X5H_NO_ATTRIBUTES);
> >                 if (ret)
> >                         return ret;
> >
> >                 ret = scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > +               SCMI_QUIRK(clock_rcar_x5h_no_attributes,
> > QUIRK_RCAR_X5H_NO_RATES);
> >                 if (ret)
> >                         return ret;
> >         }

> > Does that look like what you have in mind?
> > Thanks!
>
> Yes in quirk I was only addressing NOT_ATTRIBUTES and mimicing the old
> behaviour with continue, BUT if the set of clocks not supporting attributes
> and the set of clocks not suppporting rates is disjoint, I feel we need your
> double quirks :P

I could have used

    SCMI_QUIRK(clock_rcar_x5h_no_attributes, QUIRK_RCAR_X5H_NO_ATTRIBUTES);

after both scmi_clock_attributes_get() and
scmi_clock_describe_rates_get(), but I wanted to keep the check as
strict as possible: the former returns two error codes to ignore,
the latter only one.

> If you are still finding out the exact FW versions that are failing maybe
> it is better if you carry on and test the quirk-framework fix above together
> with your quirks and we can make sure to pick all up together...

It is not urgent, as R-Car X5H SCMI support is not yet upstream.

> ...OR maybe better I can also drop for now my offending patch that breaks
> your FW from my V3 series and you can pick it up and post it later with
> your quirks and the Quirk framework fix you propsoed so that we are sure
> that we dont break anything while fixing all of this...

While there is indeed a chance that this hardening regresses on
platforms that are already upstream...

> Also because we are already in V4 and I dont want to risk to post the
> breaking fix (that was at the end broke since forever) BUT not the quirks...

s/in V4/at rc4/?

> Let's see what @Sudeep thinks

OK.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
