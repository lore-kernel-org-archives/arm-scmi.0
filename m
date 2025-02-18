Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EA122AE4E
	for <arm-scmi@vger.kernel.org>; Tue, 18 Feb 2025 15:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739891018; cv=none; b=IGMPoHoAbf+173CNjJjT92J5deuXa3CEAvauD2xpK9Y9RwZbEOSbN0NW7RCh+bYBI3n/rWX8H2WZOKEzjZ7q3KQbQTq3e9HD1iDoYmuf5nbPhZ2ASFrL5QPwsMHu93bNsm/VwWzOjWi52OlmNLg9PY+0ms1L9HNHvJlN3ft1MpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739891018; c=relaxed/simple;
	bh=cxeHLsc1RQzdsCdp029DBmRLuVif7i7QtRMc4VeUETA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jYSOWDzx9b7smirPYJQllEJ+EyTgcIDocTDybfFDPjiMEVZ+4nbA5yeFIetyacGl+w9pglxERnogdnaVzCvlEtzhE8rykGXUpQ4M2sRlKfXCU4sl3G2UcdUBR/DfBENoFtu+liWVEWTfmI05TG3enARJQ5o9GNhIP4uybkp1Yyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aiRAKbul; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aiRAKbul"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e589c258663so5976359276.1
        for <arm-scmi@vger.kernel.org>; Tue, 18 Feb 2025 07:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739891015; x=1740495815; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J069jQzQg8mpC0mAz7tc7bH0Rxj/phW2wgnEiWpEMf0=;
        b=aiRAKbulPHSSnqXkQ33NpmKaieus672+r4N8kfdTN/MP3hXyEeWQWBP8z8/j5I0ZoW
         cKC57ebPPJRnK7cuPms1QIuLfd+Fh/V5bPbRJB8WLfKI6CL8C4NyWrvsmL7D/H9gBz5f
         uqU9AsMuQHNuQMFrg0Jbb+o1jXR0b1REsEsvrE2Yo2iCzSBYFdexRXLs+9wdE97n7QeQ
         K83meDEofgbjLm3sAvPjXKBgqfh+/+p8VwdHRO9L+N85z9jKaJFIT9jNIBSJmmj0YNO6
         yiADCfpXhzG/BNXjDHGDbK5ivISsGjuJ6bWQ0XRlEHlu2q7n7k2d9ljs65gpAktllIEi
         r0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739891015; x=1740495815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J069jQzQg8mpC0mAz7tc7bH0Rxj/phW2wgnEiWpEMf0=;
        b=LjqSyE9tKUWA4kEl6pRFtVReNfkBWbQnFePTHd5mklWgxktp8tZXN1qd7drIyRuMZr
         HnM9FOHy8apRRrrb7EX9Q7dFcT0Q7GfF2aJzetjzcHAbAjEn2gCGuNdovn+bxEseoQkV
         0qrq1q0tS1unAjR1ramTy4QxE1R7hLbP+3Uo6ChMUtKqeptj+vwsyDSrtcVFCFI0vnSf
         R2sCAzODFoVj5w2obngARILl/P71i6VtI6dVU+xdjdXUb0xUFh2NC9HoqSI+gHP3pkt8
         N6JunNTEW5tXzrnQZ9JnAKnIf/iI02K2+W1U2U7QYcP9wRWyFsQJPRrmKoBEf1wHlvtp
         XIMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTqj5mGA9BGuQmltvUWHJuuA+RxneAd9Uxs16cg4/Z5+wf0MTSzzo24SewZEWF8hZbP8fg0tgFLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAm/VYEFyyz3WSDD8l6uRypXZKr+Xy2VFk1AClHkNg+Vx5BB14
	vY6EQ0Q0hhPaJ5NyBrSNR+v/XKr1ZIyxT9IqIVYaOOe/eZ4K8RV842SALce3sWDcTiJ0MKFiOw0
	s0IKxYny2/2MbUanXb3zKQNY9bmB+UanGmfNzkw==
X-Gm-Gg: ASbGnctA9V+bPoOW43N1fbF7gSyxFAjYvzroOp8g+LFA4UkmQ7kCAXx34VGXb7AzPjj
	4szNtvsngPCkHjdl7A39cNH+glubI7UeIJ60wrCgejuoG6zeWFDIOUAasFCIOjqI+/Mx3iEbZ7w
	==
X-Google-Smtp-Source: AGHT+IGK6U94arL5KLXk3o/6wb9atp6lI8vH591NeTaLHmAxJAfWr7bGQc0nQkm6Th/hivI9GXD3JTxaQ2hz+sTMNws=
X-Received: by 2002:a05:690c:7449:b0:6e9:e097:718c with SMTP id
 00721157ae682-6fb58272760mr130055087b3.6.1739891015494; Tue, 18 Feb 2025
 07:03:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <PAXPR04MB8459E8D1A82DE43C08B6C26788FE2@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z7Rjyy7_Jg66vqCf@bogus> <20250218130823.GA17099@nxa18884-linux> <CAKfTPtBd14wM2st62m3tnkQOZgBTUmxpjZXghMVff-Yg7wCVDg@mail.gmail.com>
In-Reply-To: <CAKfTPtBd14wM2st62m3tnkQOZgBTUmxpjZXghMVff-Yg7wCVDg@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 18 Feb 2025 16:02:58 +0100
X-Gm-Features: AWEUYZnkBWG_ueFG2eypf_tLlCNTG4trTv6wjPuNziCwEuF9NrqbKXpZ6fvmkQI
Message-ID: <CAPDyKFq9QHw==2WqcThC5mjMy8ALqmZ_hKxt2QsZJ1q-qixLfA@mail.gmail.com>
Subject: Re: POWER_DOMAIN_ATTRIBUTES in SCMI
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Peng Fan <peng.fan@nxp.com>, "cristian.marussi@arm.com" <cristian.marussi@arm.com>, 
	"souvik.chakravarty@arm.com" <souvik.chakravarty@arm.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>, Chuck Cannon <chuck.cannon@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 18 Feb 2025 at 14:57, Vincent Guittot
<vincent.guittot@linaro.org> wrote:
>
> On Tue, 18 Feb 2025 at 13:03, Peng Fan <peng.fan@oss.nxp.com> wrote:
> >
> > On Tue, Feb 18, 2025 at 10:41:15AM +0000, Sudeep Holla wrote:
> > >On Fri, Feb 14, 2025 at 09:20:27AM +0000, Peng Fan wrote:
> > >> All,
> > >>
> > >> Previously I posted a patch to linux to set all power domains
> > >> with "GENPD_FLAG_ACTIVE_WAKEUP" set in
> > >> drivers/pmdomain/arm/scmi_pm_domain.c
> > >
> > >Yes, I remember ACK-ing that and now I am thinking why =F0=9F=98=84.
> > >The description of the flag GENPD_FLAG_ACTIVE_WAKEUP says:
> > >"Instructs genpd to keep the PM domain powered on, in case any of its
> > >attached devices is used in the wakeup path to serve system wakeups."
> > >
> > >Does that mean all the SCMI power domains remain powered on with this
> > >flag ? If so, that sounds wrong to me. I hope it is not the case and i=
t
> > >is effective only if the device attached is wakeup source.
> >
> > Only when the device is setup wakeup source, the genpd framework
> > will take this flag as keeping power domain on.
> >
> > Without this flag, even if the device setup as wakeup source, the
> > device's power domain will still be powered off.
> >
> > >
> > >> But in the end we find that some power domains
> > >> could be in off state while it still could wakeup
> > >> the system. And we have a downstream patch
> > >> +               if (!strcmp(scmi_pd->name, "hsio_top"))
> > >> +                       scmi_pd->genpd.flags =3D 0;
> > >>
> > >
> > >There you go, so you simply rushed some solution upstream to carry les=
s
> > >patches downstream but this time you got bitten again. Sorry, but I am
> > >seeing a pattern from you here and I don't really like that.
> >
> > I not wanna to argue here.
> > I DO care reputation. If I do something wrong, I will improve.
> >
> > >
> > >> So I am wondering to extend the attributes of SCMI spec,
> > >> Saying In SCMI spec(DEN0056E)
> > >> 4.3.2.5 POWER_DOMAIN_ATTRIBUTES
> > >> Page 44 of 210:
> > >>
> > >> Bit[26]: If set to 1, the power domain could
> > >> wakeup the system with power state
> > >> set as off.
> > >>
> > >
> > >This is not what the above flag is all about. It just instructs genpd
> > >to keep the power domain ON as the device attached to it could be a wa=
keup
> > >source. They are not one and the same. If the device is marked wakeup =
in
> > >the DT and it is both wakeup capable and is enabled, it shouldn't requ=
est
> > >the power domain to be powered off when suspending. Why is that not
> > >sufficient here ? What am I missing ? I am interested in knowing it as
> > >it is important to fix the issue you are trying to address here.
> >
> > The flag must be set if the power domain needs to keep power on to have
> > the wakeup capability.
> >
> > But in some case, a power domain no need to keep power on and it still
> > have wakeup capability from hardware perspective.
> >
> > For example usb phy in i.MX95, its power domain is off, but it could st=
ill
> > wakeup the SoC. But with the GENPD_FLAG_ACTIVE_WAKEUP set, the power do=
main
> > will not be powered off, so more power consumption in suspended state.
>
> This probably means that the wakeup mechanism is not in the same power
> domain but in another one that is kept on while the device is
> suspended and the main power domain is off. Do you have more details
> about this wakeup source that works with powerdomain being off ?
> I vaguely remember some old discussions about inband/outband wakeup
> source settings for devices which enable drivers to specify if the
> wakeup source is in or out of the power domain and if we should keep
> it on or not. But I can't remember the details; Ulf should have more
> details

Vincent, you have a great memory! :-)

Indeed I tried to post a series (I can dig it up, if you want?) that
allowed the driver to instruct upper layers, such as buses and PM
domains whether the wakeup is managed in-band or out-band.

An example could be an SDIO irq, being re-routed from a regular DATA
line that is managed by the SDIO/MMC controller to a GPIO pin during
system suspend. Another similar use-case with a potential similar
wake-up configuration, is waking up from a UART console.

My point is, the SDIO/MMC controller could be configured as a wakeup
source, while it's actually the GPIO pin that is managing the wakeup.
In this case, typically the GPIO irq can be managed from an always-on
logic/PMIC, which means there is no reason to keep the PM domain
powered-on for the SDIO/MMC controller during system suspend.

At the moment we don't have any way to express this kind of
configuration, I think.

>
> >
> > So I am requesting extending spec to give agents the information whethe=
r
> > the power domain could wakeup HW system in powered off state.
>
> I tend to agree with Sudeep that it doesn't make sense to say that a
> power domain can be off but the powered devices can still wakeup the
> system. It usually means that the wakeup is not powered by the main
> power domain

I tend to agree. In general, I think we should always use
GENPD_FLAG_ACTIVE_WAKEUP, but we are lacking a way to inform genpd
(and other upper layers) that the wakeup-irq is managed out-band,
which means genpd can still be powered-off.

>
> >
> > >
> > >> This is just an idea in my mind, I not
> > >> write code to verify, just wanna to see
> > >> any comments from your side.
> > >>
> > >
> > >I wonder if we need to revert GENPD_FLAG_ACTIVE_WAKEUP flag enabling o=
n
> > >all SCMI power domains if that is not solving the problem you thought =
it
> > >would.
> >
> > Revert the flag will cause a power domain not able to wakeup SoC if the
> > power domain needs power state on to have wakeup capability.
> >
> > I am not sure other vendor's SoC design. To i.MX95, without this flag s=
et,
> > the NETC will lose wakeup on LAN capability.
> >
> > Regards,
> > Peng.
> >
> > >
> > >--
> > >Regards,
> > >Sudeep
> > >
> >

Kind regards
Uffe
