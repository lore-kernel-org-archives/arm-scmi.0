Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EA540B108
	for <arm-scmi@vger.kernel.org>; Wed, 12 Aug 2026 11:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786533727; cv=none; b=Psph3RB4jeXFOPFV/JJLXU4Btm9nKLk2KCQefeDirXgWCOAVqm68nsKISwhLu8rMPFxO8gH9f7bFJ+z8JDLzf8wc9vJpeOsPD3w2C0aE4JcvCgq94DgW7wZ6S1Rz2Y6CmeLDYVTRdgZtxm9wTO9h6horpvHiyymty+HJWniCQL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786533727; c=relaxed/simple;
	bh=ZDQ5pPWDKwycT4E4mNOoJZ2LV+cHXkkjmMM1uiBduVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tur+e2y4iJZdLLmPkq5y+NPj42s8c6bPkdBaNWxFVQpupQCSwUuXEL0BYpEZK4voZ5meTZZXQ04alu1iAtOHiXkbSb83xCDCOgkEtQxazRKk6Tp2cQ9p3lIh8UUU1exvAUKKLVB//GLW+t3Tm/wFvc8ddgcIdQdzGm5CU7hM1uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-381b831d535so1410295a91.0
        for <arm-scmi@vger.kernel.org>; Wed, 12 Aug 2026 04:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786533725; x=1787138525;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DCCZvy6wBuqHUxauMraEzIMerW1TTEAMcJhR4qIYKD4=;
        b=SVh8tcmy0dbzTx8l/Ul3XdSKgxZThIG2xWQSd7Nul5WYhd0sT9qMTMiadSEHYB9is8
         2MrsQ5LrVfyKUb2bJwQRcagnC3xQEO2THEg3LPwUEOZmwlAtdKvrPKNdoBlxHe4uWQpH
         3MXkTM5l8Rhkg372JNBTStXU6S1aijPEESn4lFhYS8/NIPGi/0Lpt686s9VtU7pEnww0
         I+JDwMqZVBjIXd5XTNnPmXERfa53v37cyF9IvJM7jUdQdsnXFOEoN6cfEgeZZKIcAxtJ
         wJREB3bR/ya8o0zE/KkYUtUBj9oAx601nvimk65q8uSsJ/l6Gp0zv50C9+CtpD+4LJAV
         UzMA==
X-Forwarded-Encrypted: i=1; AHgh+RokyxpfdRe+46eyNnDFaTz9cJab/7ToCYOVGOSADChtt/i4OwZAcwkMdpgk5hL5GB6CGybdAHgWwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhuVyVsUL8UgzqtAWNmgQACkvWAA51IW7Opc/fFs6eFGHqCMpC
	di79sbrWH4YL07xcea9cmiJmMOLZIsSj59g2+xrW1fDmSKE8UnidPlyFgyzhWKI3
X-Gm-Gg: AR+sD11mvOlVQMdP5QLjEoAWN9WdGZo3T+llbB3osK6MxpE+gFEJm2K2pj3+ncxpSbR
	Bg9ERs0G1b/Vmoqaf4ZE5hDdo8ImNjCYlvpjIRPRnDK2xn+9jiWqUU6IRJu4locde8TGj08Xkp0
	RGSHeZEovHCf0wEeXMx6uwlBEVG0ESyZ6gqxn6tpLjKv4S0E2cwRTkt9qmOuhedZPBQrpd17xLq
	xDs+0aERhfbidGp7lZJbqOhQB4N1DdQyArhBoCiO8a3VFHxXqU7zdO6fe3o2WiwOpHaIXxQHJyq
	QpUWf8OeFfqElws0jHTlaEDRwVR0Twu0O427wqkzmmcBWF0hvxkdpzovDLG6Vuj2N0VUyT4L8Yv
	VyZBPuqVp32zaFnIdaMAN5nACH2UUzCdU70ggg4apX4kUO79HxPAL/0Qq0VLXfhK7262K4PZbk3
	lJboiIXdf7FJmvguUO0VvZiYa34hQYGp5lYVRLzum91WzZdaYu17ldaPvEyBTagbpkSS2VDB6Rp
	a4+PvVDhBIv2Nso9tNfzqCft/bCCA==
X-Received: by 2002:a17:90b:5805:b0:38e:655c:6516 with SMTP id 98e67ed59e1d1-39300fd1767mr5227416a91.0.1786533725134;
        Wed, 12 Aug 2026 04:22:05 -0700 (PDT)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com. [209.85.210.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f94ad854sm3213706a91.10.2026.08.12.04.22.04
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 04:22:04 -0700 (PDT)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8487214ad2bso1290955b3a.1
        for <arm-scmi@vger.kernel.org>; Wed, 12 Aug 2026 04:22:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrhORvLfarfDaSDw+kH+J/IQrV9NZetSxCTKjD44+3v8V6sCqkf5yrL0ci3DCHploi+DEy+hv9gsA==@vger.kernel.org
X-Received: by 2002:a05:6102:5692:b0:740:177:f357 with SMTP id
 ada2fe7eead31-76c8d1f94a9mr774665137.6.1786533275732; Wed, 12 Aug 2026
 04:14:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505329.git.geert+renesas@glider.be> <49726acff0fee1c3606e83c4f242ef6aad25b4b8.1783505329.git.geert+renesas@glider.be>
 <20260710-adventurous-burgundy-chimera-b2fff9@quoll> <CAMuHMdV=ckONBbTYELPJU8YWoNzdu3PJ95VR8cz+f_7dUeiPUw@mail.gmail.com>
 <20260716214924.GA1477674-robh@kernel.org> <CAMuHMdU0ss6wUEdjC+OYa3iQS439aJ8b_d9M2ws7Ayn4_kOyMQ@mail.gmail.com>
 <20260811163334.GA2354701-robh@kernel.org> <CAMuHMdWbzg-QpFBzzDa2hC3HzAmWUkerESC5O-cSVxmWX3_PkQ@mail.gmail.com>
 <45dfd858-9d59-47e6-91e0-ef9e6e909af6@kernel.org> <CAMuHMdXJFdJQP1GVXrOWRuYO8Si_WF5X+vpzmAgTZY+tQstR1A@mail.gmail.com>
 <7b066c1f-20b7-407f-9268-e9dbeafab004@kernel.org>
In-Reply-To: <7b066c1f-20b7-407f-9268-e9dbeafab004@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Aug 2026 13:14:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVXgNcxDJf8XsSjXhC5+Pq6+Z+mcn6Hn50u8KwimKt9RA@mail.gmail.com>
X-Gm-Features: AUfX_myBSrf5rDcsVRuaQc_or0Um_HrH3WBYGhc9bJh3otQ1_zgZw-LE1s1AUdw
Message-ID: <CAMuHMdVXgNcxDJf8XsSjXhC5+Pq6+Z+mcn6Hn50u8KwimKt9RA@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] dt-bindings: clock: renesas,r8a78000-cpg: Add
 firmware property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Wed, 12 Aug 2026 at 12:38, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 12/08/2026 12:02, Geert Uytterhoeven wrote:
> > On Wed, 12 Aug 2026 at 11:51, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >> On 12/08/2026 11:47, Geert Uytterhoeven wrote:
> >>>>>>>>> +  firmware:
> >>>>>>>>
> >>>>>>>> RPi is doing similar, but I have doubts. It looks way too close to
> >>>>>>>> generic "syscon" which is disallowed.
> >>>>>>>>
> >>>>>>>> I think this should be vendor+purpose specific, e.g.:
> >>>>>>>> "renesas,scmi-transport" or "renesas,scmi-firmware"
> >>>>>>
> >>>>>> If you can tell me the resource that a 'firmware' provider provides then
> >>>>>> it is fine, but you can't.
> >>>>>
> >>>>> It provides a firmware API, which is not available until the firmware
> >>>>> provider is initialized.
> >>>>
> >>>> I don't know what "a firmware API" is. What does it provide? I know what
> >>>
> >>> It can provide lots of things (everything we are no longer allowed to
> >>> touch directly from Linux ;-)
> >>>
> >>>> a clock, GPIO, reset, interrupt, etc. provider is.
> >>>
> >>> A clock is an object you can access through the clock API.
> >>> (s/clock/.../ for the other cases).
> >>> Firmware is a service (virtual object) you can access through a
> >>> firmware API.
> >>>
> >>> In all cases, the consumer of the object or service needs to know
> >>> which object or service to use (there can be multiple).
> >>>
> >>> In all cases you cannot access the object or service until it is
> >>> available (initialized and registered), for which we have -EPROBE_DEFER,
> >>> and/or "[PATCH v2 02/10] of: property: fw_devlink: Add support for
> >>> firmware".
> >>>
> >>> Thanks for your understanding ;-)
> >>
> >> I think that's the difference here. Clock is not an object, but a signal
> >> on a wire or within IC coming from one device (provider) to another
> >> (consumer). Firmware is not a signal, not a wire, not anything which can
> >> be provided from one to another.
> >
> > Oh yes, it is a service provided by the secure world or a different
> > CPU core to the application core running Linux.
>
> Service is still not a resource. Not mentioning it is way too generic,
> because anything can be a service. We have entire services-based economies.

Do you have a suggestion?
This is just a phandle linking a firmware consumer to a(n optional)
firmware
provider.

What do you suggest?
Perhaps "scmi-parent" (cfr. "interrupt-parent", which also does
not point to the resources consumed, but to the provider of these
resources)?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
