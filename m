Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B6D39B4A2
	for <arm-scmi@vger.kernel.org>; Tue, 17 Mar 2026 08:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773736111; cv=none; b=c88+swhVzIXyWuzK6EdgtDm6nKdNASEaqw6Y4UBOXsyJmsc76nIpog+iUOns0KGDqVcgsSsCkgOwPZlT8JeVj6zV1uR1BHQ4G+uq/qAg/CK9Vss7OdZdNmMsdm8IPOmDUuTM+sLTeiGLBjkBDE04icPMKYNtGbjHDPd9bcS5dvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773736111; c=relaxed/simple;
	bh=DAXjupgOdwZoikKs5JyJB8iXIyxbkLJF1f1ATpyhV6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZX1AirG78LtweiLwvonqBm0KISdlExtoAP8p9rWGPEYwsgbTCpkDKFtLhogdSfNHTIJxK4Mao8O4GsYOsKmR8fi4IMPF6yycM4vCWGjhKSYzrs/jDk8JLr3Lw4JEja1KlAIf0DwdsQ7E/BvAEqYhZl5YWBHZtyQyvI2gv+qwbBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7d556c1a79eso6009897a34.3
        for <arm-scmi@vger.kernel.org>; Tue, 17 Mar 2026 01:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773736107; x=1774340907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3MZrBOzWKX3a3J3HCcGoedqBZCxLLoAjByNA5cYsB/Y=;
        b=edXhOtAITXr5KXn+XVQSDaEWWCVAAJ09/ePffwKP6lO37VTx5B84k5O72FeV57uGHm
         DrxsE7cLBEORGPEMWLp0MHXCA3qU9nu60+ICI9p0WxgMznX+X2m+Ys1ZTHJ9sS0L/tlx
         qjIoiu+yEgu0h//VZRHdWUTDYGGuHUmU8FYVxy24sx7qRGn0PumuSb2qJNnt62DuqM6B
         Daw6i307vj/jGxfY7a7rT1uhxbo6RECQkKKhn6AOMrGHVyiAIRMpu1ctGkGmAiX0NEaN
         xfFiekrLZeC8fjpfJN1UlFCGPI3pogQO9cggDKnw87oX7k//a10/xGTcbyQi9jaFjItq
         EBHA==
X-Forwarded-Encrypted: i=1; AJvYcCVdx4iCWH6Y5a1U9TRXBSouFO3G0nzwXoxZ44DIPg0ewdWpjSsdLgnRkXhv2OVxd4dAF+XEq3jwlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoU8mjWBb5PrgWYAzwbKFiU4NN3YLbOzDKdPUaA+K3DmrOjnlb
	3hFkEQrf1v/+C35qO2NuPS3i4GPFK9iVUD29Tb3VAgjTIAhhqgGwaZPAPVRGRxcj
X-Gm-Gg: ATEYQzwOBIrI7qP0GTRfGmkEr01mdtBHfwcPfBLHfptNkRr6GvXH+1L+kE/lcH/kl2A
	Us8hr3SzMNKTH7MU0UU/xV/8BOb9/otZ2BOGuj69/zIX4654peXm4QkWH7IsSQRTM16eEpQQfwv
	7lppOaQdIKcoMAygj+z9xXCWI9na14QvM0H0Xf8XpL94BXJZys98KpvbZ06FJgEYDEMh2GO9/Wz
	n6a9rME4TkFD35bpuNlHPkfJXGWRYJuVsO14UcKWjQn3xDamMBBq0hipCPSOb91AYecksWN5N6E
	clpB3lwtSgEegZkaDv7jNOQ5tqeg+z7Sb4LWe/AqxkRPF6n11ES/of88H8/xNweaL+PyK2DXHPq
	hS1abfi2XkcBnpW+weDA36ksUgC6Oe4KYiw0m2WNzJcAtPw+r+Crc9sldF7vJzuYqxl3UJ3E/pj
	8aI7Gnki0zZlljj65F5C/DNqXSY0ya7S4P5FtlTwwYyaPVuIsOaLeWWMVZRL/4Yy00xI98Dhk=
X-Received: by 2002:a05:6830:3142:b0:7d7:b89d:30be with SMTP id 46e09a7af769-7d7b89d317fmr2605460a34.33.1773736107128;
        Tue, 17 Mar 2026 01:28:27 -0700 (PDT)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com. [209.85.210.48])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d76ae6a361sm13999219a34.20.2026.03.17.01.28.26
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 01:28:26 -0700 (PDT)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7d556c1a79eso6009887a34.3
        for <arm-scmi@vger.kernel.org>; Tue, 17 Mar 2026 01:28:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWfW59Xmi2hRIxncpdqqbKUuZ/gzSRxKadB8QAHC1mVJ1Q9LjJ6CUXNz/nvUa/79GE7hwSVBtUKdQ==@vger.kernel.org
X-Received: by 2002:a05:6102:442b:b0:5ff:cc82:744b with SMTP id
 ada2fe7eead31-6020e4b8061mr7168193137.19.1773735619991; Tue, 17 Mar 2026
 01:20:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
In-Reply-To: <20260310184030.3669330-1-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Mar 2026 09:20:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXMdn4Uu+bLunb0g68rmV=AT523C1=sMdNFK47ZADU09g@mail.gmail.com>
X-Gm-Features: AaiRm51yyOA7w0a8XkB8aVbP3N6VXftKc6GGkOKP6ReYYiu4pm3s3wiL1ZOxXBM
Message-ID: <CAMuHMdXMdn4Uu+bLunb0g68rmV=AT523C1=sMdNFK47ZADU09g@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] SCMI Clock rates discovery rework
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, dan.carpenter@linaro.org, 
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com, 
	marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Cristian,

On Tue, 10 Mar 2026 at 19:40, Cristian Marussi <cristian.marussi@arm.com> wrote:
> it was a known limitation, in the SCMI Clock protocol support, the lack of
> dynamic allocation around per-clock rates discovery: fixed size statically
> per-clock rates arrays did not scale and was increasingly a waste of memory
> (see [1]).
>
> This series aim at solving this in successive steps:
>
>  - simplify and reduce to the minimum possible the rates data info exposed
>    to the SCMI driver by scmi_clock_info
>  - move away from static fixed allocation of per-clock rates arrays in
>    favour of a completely dynamic runtime allocation: just allocate what
>    is needed based on the effectively discovered
>
> This is done in patches 2-6.
>
> A further bigger optimization suggested in a past series [2] by Etienne
> would be, whenever allowed by the spec, to limit upfront the number of
> queries in order to simply retrieve min and max rate, that are indeed the
> only rates needed by the CLK SCMI driver.
>
> The approach proposed in [1] was open coding and duplicating some of the
> functionalities already provided by SCMI iterators, though.
>
> Patch 7-12 implement such optimization instead by:
>
>  - reworking core SCMI iterators to support bound enumerations
>  - use such new bound iterators to perform the minimum number of queries
>    in order to only retrieve min an max rate
>
> As a final result now the rates enumeration triggered by the CLK SCMI
> driver, while still allocating for all the existent rates, miminize the
> number of SCMI CLK_DESCRIBE_RATE messages needed to obtain min and max.
>
> Finally, patch 13 introduces a new clock protocol operation to be able to
> trigger anytime on demand a full enumeration and obtain the full list of
> rates when needed, not only min/max: this latter method is really only used
> currently by some dowstream SCMI Test driver of mine.
>
> Based on v7.0-rc3.
> Tested on JUNO and an emulated environment.
>
> Beside addressing a few review comments, in V2:
>
>  - patch [1/13] introduces a fix for the pre-existing rounding algorithm,
>    before relocating the algorithm logic as alreday done in V1.
>  - patch [8/13] hardens clock protocol initialization by adding some
>    missing retval checks

Thank you, this removes the need for increasing SCMI_MAX_NUM_RATES on
R-Car X5H, while decreasing memory usage.

As upstream does not support SCMI on R-Car X5H yet, I am ignoring
the hardening for now (it may be fixed by a quirk), so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
