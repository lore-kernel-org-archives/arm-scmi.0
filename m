Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1683E3F58FC
	for <arm-scmi@vger.kernel.org>; Fri, 15 May 2026 15:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778859964; cv=none; b=mtrvAoBNYfoxVluKpVnJLiXiSgGQJHRKniEmsW0AGid+mvElAWKkYO/K7AOGw6dmft+p/aO3EBPP2mbPOcnpVlJ/fTGBQLDU6O3iHtIDzhFEPITxOrSXTxEigMPi5rUOlR4swfpDoFOVcEfOavx0ZvR2Ll00zSPFtzqZdYfzFP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778859964; c=relaxed/simple;
	bh=nSQhZQ6tGlBOmtUdwr13VWi2FIFZQeS4gjHokci/kyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k5UJfxnwJHkPd8E8tOgGsyJhkt7ny1Qe6dioErHpGPLFSoc5oXTnDLlGOw7JEuRY73dWAmMXbpl4hxyMU35c1CtGoPzOtckZk0/mNC3nFGsqynEVmaPoTT83XT5XxPkaP/UhXTMITXNELe3LBwwShdv2GxDG6yOGJiZ9tGgX2qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a8891f0c51so9034364e87.1
        for <arm-scmi@vger.kernel.org>; Fri, 15 May 2026 08:46:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778859961; x=1779464761;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkAu8P10dwihkNM39UctSZpVluViyWa9thhV649dqfg=;
        b=q1E5Ff+JDEvmqvl2GkjKLBBPcKDkD40yhn7iz2B6U74/zbOGIZF9XbgRDrAEBBba5k
         CCPR8lCnqqqTuCoyrxb9JV1wNrkekf3cgugtqxgQo3QQxAQUmIZWF7RefK4phnx7t1G/
         7dtoF14WXRvfr82DKBWVWMyORPpmdV0qTxsS7Beb2v9QB+sYlSFzJwAqlXklwkGnJFwE
         4zz23PTkJJxXoqXPUwim/a7dDoKknyr6hqTKuuVsNo7bOBaV8V31jVGdACRikqNuQbJq
         +ofaClITqivaK98LUGQhRUDbSD5ZPz2gr+llW5RlB+q/N0jEQbjB4S5hjUUfhUb7nkSJ
         livw==
X-Forwarded-Encrypted: i=1; AFNElJ98BO7hv6dLJBP4mrU6Ls5AOCYRDDVolKl16HiPQT/LzNXPgyPeYXx8qFvqvgK5pq/qyfTzjTb/Jw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOjuXFJK1Z1BI/thffZ7LgkClsEHFYJQ5K5nMmRjC9XqsxV+vA
	cGalJYYeufRJZjSrqbK7FJyWFQgPxoAArJK658vx8NT6dx9bCnnGeWCZh/YaAy/KVJo=
X-Gm-Gg: Acq92OFqGKhWpZ4r/4kUV1cbDVAX5TvZ+IsObCjlw9GHQPgtldJbG5rJnurVXiKjOVg
	2DqMpj8InVd24y+1PhNjO+oSmihiebC/O5KbuN8iMnT3gRCZTS8Rn1kLPCM2Eg+HCyV9YUSbKBI
	gElFnX7mS0NgW0VSDVIlGu54Q7kXvsNEWMgGFXD2oqUqDQEJrpyxOG8TmS8YRh1jnmYjJwr2Y40
	f+F3WmkLAA54vKrLeoFCERLYvGtlI2QDzfuX0erD+q4Uj+Zp6wkhq0HoQfjny/mR3rQ4BCWOzK8
	RIZnRVSw9hsjAAB/E0taA/tvXUdWv2m6KIbrdlUl88iw8H+NEOnsgV8wA8dn6njFTiEkqhq7i4F
	ZUK1XOPbeWe8zfhi9JwGQnb5h2MZ4B/PUSy4d3fiTWyhNiKRZJhRcmowa916ODpjltJy1Snv/9X
	7hp8YMZwVMUqNPzTqQJFNMPpNoRFcl0huwug+sQqH2tCJC5I54ABDvqJLR+zpQ
X-Received: by 2002:ac2:528e:0:b0:5aa:126c:1c7 with SMTP id 2adb3069b0e04-5aa126c0442mr744995e87.4.1778859961210;
        Fri, 15 May 2026 08:46:01 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164cb606sm1407613e87.63.2026.05.15.08.46.00
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 08:46:00 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a62f43b76aso8451022e87.3
        for <arm-scmi@vger.kernel.org>; Fri, 15 May 2026 08:46:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/LDfLxhfEUJLIzJ0+27+6T/uGww+d3nTCEX+zU+BS+AmJQZLESfSXjNDFPWjY7uvg0ljknDzu29w==@vger.kernel.org
X-Received: by 2002:a05:6402:e0d:b0:684:44f:d859 with SMTP id
 4fb4d7f45d1cf-684044fdae7mr1374876a12.3.1778859601770; Fri, 15 May 2026
 08:40:01 -0700 (PDT)
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
Date: Fri, 15 May 2026 17:39:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8b9C3D8fV5th6GCgs6JAq7HZbF_SrOKz_gDy2H8ksow@mail.gmail.com>
X-Gm-Features: AVHnY4L73EskDuVnlvp0bKAJEo06GxthEmZ8mwHk1YJIsXaKqejpar7GeFZqJcE
Message-ID: <CAMuHMdX8b9C3D8fV5th6GCgs6JAq7HZbF_SrOKz_gDy2H8ksow@mail.gmail.com>
Subject: Re: [PATCH/RFC 05/14] firmware: arm_scmi: Add scmi_get_base_info()
To: Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Saravana Kannan <saravanak@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Christian,

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

[...]

> I watched a bit of the LPC discussions around this (from Marek I think)
> but sincerely most of those problems had one (not necessarily simple)
> solution: fix your firmwares AND/OR apply quirks in the meantime...

So let's forward to the future, where the firmware is fixed, is fully
compliant with the SCMI spec, and all IDs are stable, so no quirks are
needed.

Where do we specify the SCMI IDs to use?  Unless when using the
remapping driver proposed in this patch series, they must end up in the
DTB.  Existing upstream users put them either in the SoC-specific .dtsi,
or in board-specific .dts.

The SCMI server is supposed to expose to an agent (e.g. Linux) a
sequential and contiguous list of IDs that represent only resources that
the agent is allowed to use.
  - We cannot put the SCMI IDs in the SoC-specific .dtsi, as that
    describes all hardware in the SoC, which is typically much more than
    Linux can or even wants to use when running on a specific board.
  - You would think we could put the SCMI IDs in the board-specific
    .dts.  However, that would limit actual use cases later, which do
    not necessarily depend on the board solely.
      - E.g. when moving control of the CAN-FD controller from Linux to
        the Realtime OS, the CAN-FD node must be disabled in the DTB (by
        overriding status to "reserved", or by just deleting the CAN-FD
        node, both of which can be done by the boot loader). However,
        with SCMI, the IDs corresponding to CAN-FD resources must be
        removed from the ID space, causing a full renumbering. Who is
        supposed to update the IDs in the DTB?
      - E.g. when partitioning a single Linux system in multiple VMs,
        and distributing hardware across these VMs, all VMs need
        different DTBs, each describing a subset of the hardware.  With
        SCMI, each VM needs different SCMI ID spaces, causing not a
        simple partitioning of the devices in the DTB, but also a
        renumbering of all IDs.

Hence there are no stable SCMI IDs in DT, by design!
And what do we describe in the SoC-specific .dtsi?  E.g. U-Boot IPL
still needs real hardware description.

What is the stance on this from the DT maintainers?
Thanks a lot for your answers!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
