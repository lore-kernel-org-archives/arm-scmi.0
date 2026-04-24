Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE9D36215C
	for <arm-scmi@vger.kernel.org>; Fri, 24 Apr 2026 12:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777032561; cv=none; b=EzZODak2j86wKZ85HKYhBVtwo9aXcFrZhtB7XxIzepSqdmapcCEjYPOa6pZV30il0uG9vWEycmud6WCKTmdnYEDbwxd0rxM2xVBMCyEX9DF6C8dFGkbObIpJkPIzzwE3v2F+2pKBwIQY6TC8WTa2AbzUr7WCF2Cg2bq5To/VoUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777032561; c=relaxed/simple;
	bh=6x8AaL0soP/QvCrhUlcKrRT+37cNHuikR53lCEKEpMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aS/U1NJnu8DZ7rwrHEMFozxgPGEfnD6bAuiDjMlqGD9y5gnlsfLyatwt2FMBAoYFXHCmBZQaihv5BOcC3NK/aaGPsbS5bDuMBV6PD2lc9wWWH9z2b8YSimQLgDK5iHcM6WiEutsDTDbVVPvCz5lJLTyUdFLdY2R0j4CiP3c9+O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9358dd7f79so263313366b.1
        for <arm-scmi@vger.kernel.org>; Fri, 24 Apr 2026 05:09:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777032559; x=1777637359;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DlPOzsbSlIKF8HuNfduxYXPi56LqB7rH+tGNemLx+GY=;
        b=Cy7Oh6Rk5oKceVT4FO4aabu78+wKS4dF/mGMn+O+TuhQWs4jf5J0b6iqSQtOToskTa
         xPl1euqJ4zUl+9fMajhwSdyHhycTxU5z6EJArxSuuZNm7N1/tI/n99HMBRugZJh7j4kU
         rV+Obkp5CRGAJR3ewcbJaMJ6qWxgJuYd+jXXFP1tIDLh/0YnT5gfAtZuHxbystG+dxkC
         a7xwM8R/rb+bqTZpuXREASyr+gtLZjPEvGwG1vfy8Iu84++6jtiWUBl1Ula8DunG4ES1
         xLOHg8czHasOdy5CdKTzKZFCU6M8KM/FxmYLowjWqpKpITcIjo8hvDbAzNIJqLMo8XGR
         WKhg==
X-Forwarded-Encrypted: i=1; AFNElJ81FsZh5jzzrgyU6c+1Cls3jT1RlJQqt0RB7TjfsrQXLgFXc5XvZpqvi3RtzJcvZsYF0VXq1VGpdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzA4AVYXq0P8mTBY35iA5S30Uh+h4m1d6TpfrHn/a9TCl/2u0Ks
	DSqd8YD8MJ/FLlPkhVyXjU9tKjF6+QP4CFfAi0CbfRNf52VAR0sI9aVvH88Wmq52n+8=
X-Gm-Gg: AeBDiesn4OoWAZZ54ooO1/vkY808Bj3dX4yT8r+mbZ6y+bGljEBUHjBWsgj4xHizqKz
	Tr80/VXhmHS+wAgC+EI5HVLRB5Fqws4FIB4jJNrrQzVc2jyf8RdK4T+BKjcl9RNdAttXc1JQx4X
	6O7BE4ZC18Tm5k/OQtuQrfTsoOQ612yDEpUvqGXGCYcbBbkWyZG+4ZhUJDWfvKL6ucS44uQ7iKJ
	Nv/WfcpOyScSTjHTLJYMqgh80MyI0tLFFUl1UQKguFEG/WNCqpooGSEj0y3UFk/Wqll+Me22HZn
	4BmxGRriyxtbehbBD69flfsw/yaduYOEvHiZrXAISpC8ASpyH9lWOwLUet7olFzTt/BOrQfpVcu
	v9VnjA60PT9a6xoT5YqDk4a9kMYSLuj6vX/0+4Q239R3+6oTJ8ygIwVhVZYanivQP9WYo2vjM47
	HF0Ts5ccVpIOrK8G4iHkZkizfnhYYgwEd+cd59j90SLfB6OAYV0W74ioYD99DtCwE2bFmLsYE=
X-Received: by 2002:a17:906:9f85:b0:ba8:be0f:2163 with SMTP id a640c23a62f3a-ba8be0f8f2bmr936973566b.46.1777032558444;
        Fri, 24 Apr 2026 05:09:18 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451cdfd27sm766692166b.26.2026.04.24.05.09.11
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 05:09:13 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b9358dd7f79so263295166b.1
        for <arm-scmi@vger.kernel.org>; Fri, 24 Apr 2026 05:09:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Ky9ymmMwEAzRuQoxrRuECZb48K5XcSpcSbedxYj0S6mxa4Bt5Oh3Sjnv5KYFS+jM9cisurTErgA==@vger.kernel.org
X-Received: by 2002:a17:907:3da4:b0:bac:1263:2562 with SMTP id
 a640c23a62f3a-bac12632637mr434030666b.24.1777032550820; Fri, 24 Apr 2026
 05:09:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
 <aekXUvIPb8nkhdKu@pluto>
In-Reply-To: <aekXUvIPb8nkhdKu@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 14:08:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJvMH+a1RqozbaCxxH_8M569JcruTFa8PW+87FysnjHw@mail.gmail.com>
X-Gm-Features: AQROBzCeAVXP6DoeEYDD8I1FaXSTP-ZpY0v2OnIf6zjZFA9mNfY85ZLl0E87BuA
Message-ID: <CAMuHMdWJvMH+a1RqozbaCxxH_8M569JcruTFa8PW+87FysnjHw@mail.gmail.com>
Subject: Re: [PATCH/RFC 05/14] firmware: arm_scmi: Add scmi_get_base_info()
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cristian,

On Wed, 22 Apr 2026 at 20:45, Cristian Marussi <cristian.marussi@arm.com> wrote:
> On Tue, Apr 21, 2026 at 08:11:38PM +0200, Geert Uytterhoeven wrote:
> > Currently non-SCMI drivers cannot find out what the specific versions of
> > each SCMI provider implementation on the running system are.
>
> Thanks for your patches....this is not a proper full review of the series,
> BUT this patch catched my eye..
>
> Indeed, yes, it is deliberate that the SCMI version information is NOT
> exposed out of the SCMI world, since being the SCMI an attempt to
> standardize a common FW interface (as in [1] of course), you should not
> know what runs inside the black-box, it should be irrelevant...
>
> ...indeed the versioning is used inside the SCMI stack to deal properly
> with different protocol versions implemented by the server OR to apply
> proper quirks when needed, but all the rest should be standard....
>
> ...you should NOT really behave differently based on the underneath
> protocol or firmare implementation version...it is the SCMI stack that
> should behave properly, transparently...

Oh well...

> Having said that...I understand that at least it could be useful to be able
> to query the SCMI stack to know, even from non-SCMI drivers, WHICH quirks
> have been applied/activated at run time...but anything more than that it

I see no need for that, but we can discover which quirks have been
applied from the kernel log ;-)

> seems to me dangerous and prone to a number of abuses of the SCMI stack
> itself...
>
> (Also...exposing the versions itself means also tracking that bit of info
> in more than one place: the quirk framework and your drivers.)

I'll see if I can get everything handled as quirks instead...

> > However, different versions may use different ABIs (e.g. different clock
> > IDs), or behave different, requiring remapping or workarounds in other
> > drivers.
>
> ...abuse like this indeed :P ... the SCMI server is supposed to be that
> one entity remapping the IDs in the background if the same IDs happen to
> be representing different physical resources across a number of distinct
> platforms all supported by the same firmware blob...so as to present
> a consistent set of contiguos IDs...

In our case it is just a single platform, with different ID number
spaces for different firmware versions.

> Also because this should be one of the selling point of the SCMI stack
> in a virtualized environment: you can ship the same kernel drivers with
> the same DT and you know that ID=<N> will always identify the specific
> resource that is needed by your driver without worrying about the fact
> that in reality in the backstage the effectively managed physical resource
> could be different across different platforms, because that does not matter

This sounds strange to me, do I understand it correctly?
So the ID should (1) be tied to the use-case, and not to the underlying
hardware, and (2) be the same for different platforms?

For (1): Then we must not put these IDs in DT at all, as DT is supposed
    to describe the hardware (and firmware IDs in DT were IMHO already
    a stretch before).
For (2): How can there be a contiguous list of IDs, as not all platforms
    may have the same underlying hardware?

> if the SCMI platform server had properly remapped (at build time/run-time ?)
> the resources to your expected ID...alternatively of course you can ship
> with different DTs to describe different hardware...BUT remmapping stuff

That is a different issue: as SCMI covers the full platform, not just
the SoC, the IDs can be board-specific, and thus should be specified
in the board .dts, not in the SoC .dtsi?
Then the SoC .dtsi should describe the hardware, and we end up with
things like arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts?

> in the drivers themselves guessing on the vendor/subvendor/impl_vers
> seems a dangerous abuse...

There is no guessing.

> I watched a bit of the LPC discussions around this (from Marek I think)
> but sincerely most of those problems had one (not necessarily simple)
> solution: fix your firmwares AND/OR apply quirks in the meantime...

Unfortunately (at this point) we have to work with the firmware that exists.

From that LPC discussion, we learned that we are actually the lucky
guys: some other vendors tend to change the IDs and/or behavior without
bumping the version, so Linux cannot even act upon that...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
