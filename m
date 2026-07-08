Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F54373BFE
	for <arm-scmi@vger.kernel.org>; Wed,  8 Jul 2026 16:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783526688; cv=none; b=FveFdJ/VHl136Cyg6z/ton5wiifLcHSZlE2B6DcDKEiew8u5IqlE8vUWaUj0tPWMrUVuBfLTSMyMOHSL6m1ry0GvwiQTS8Lx5z6VXQJgELYfc4BJ4lN497y+NeM78JeMRaW0g5DyzhvGQpKbH3vZ5s6uHwoiBGP28zPKt5UMPzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783526688; c=relaxed/simple;
	bh=y8j2/FQNeXE1C/2iMG1jjFg6VhJGfmA3AX/0fZrBhX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fOy2OVRSx7ICHu4WvCCGyl3f69hKi43KLpV4Nr2i7vyJQs/UhBH8ckpgLrDcTAhgjfews7XrAGs6gZ7N6jnOkq+1UkXbbRXPvYEe5rtIEp5NWani+pheKoXTA0gt88yswDv2fLIvvd+s+EQUF6VohptvnJBht4uZq53Dt7t5dtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-69a50189d25so1605057a12.3
        for <arm-scmi@vger.kernel.org>; Wed, 08 Jul 2026 09:04:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783526685; x=1784131485;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hO17YRpuaXnOXgeP7ftbHwpUP+dSdnes8jnl1DmJr/I=;
        b=kj03w+iRmd2lC7Jg+UximvkM5CKxn9OM/Z1pWBO7V5rXUdbr5Ur/wobQ5GLlytko74
         k2u1qney3mp5lHIqvtbWW0XMgBDV7m1G+4GLmjfSAmfbuQcefifiPNckqW9INS75bROl
         eazWg+YHj4jI646YSDRGQ1Zp7BfXSkDpL3lowGAKRtTKp/kZxD606JAK9dUPCcQLfhRK
         YcEIl7Bf/LOe9TAJ1kHyAmD4z5PTW550kLO8fArKHsgOkckdwOiAdUv0vkAHGeqbUPDW
         owW3+y3RqH6Vn68QOOTFqxEAKKIfu5VXN+Oy0i8B6B3ot5MEsRQWsJXFgOeQkW/L3QYa
         x2xA==
X-Forwarded-Encrypted: i=1; AFNElJ9EImqVrShDB6hTtym0YX85EPWhXiF8OFMq5y0FDYKryQSa/tWW0B+mgKJoWX+iFK+AsUZLaIy5SQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf19RKcX5kQr9b1nBGolvib3LmcnYqf3KUkSQTmRr7RLgwJhkt
	Ym4ISHjUiE1vXJACpCgM5kEtidX9A7Ws/R1dhs3SvnJmm6ECABxrD6eW9dBo9scJ4ko=
X-Gm-Gg: AfdE7cnQWHPbsGUMn9fSYgePNX6zNWFzG99yZyVj3C0WkoyQS+txX9SU/5QHA7PYSle
	xypiPVmTd1fQ3kAcw8sJgi8L5LByM4WN2UI0uzyXsOmFzJfITrj52286WgVUsmBCLPeFGGptFoU
	2lmvkjzgvKHghOw2d/fZUtZZMEmGun7rzdLTnAhXUbLoPkiCtrkwVYarnNKf/nGcf131rsG0OQK
	lMMqWL0dhFIWRG9g5nirdAFKxj6eoyq66iL/hPMYl5acCiZYxLtsaTix6SvP2MPJIBhGzHSE4lE
	FRccCSEwa7I3teX+ZYJ5OX9RpHdZ1gX79bD8zwCTUIl86CQ5wxkLO1ltiBBg5hUItwsryeOvO13
	2ZaQQOKgtIPTA+Mp6+Nb0mrkUploXzIzRKxK0cWZesSkKkIofnWEMkKvwGWoTFmcnbHhDELvrVz
	ZXrK2E7IDyVJuRvOox7eCSjqNJpW9k0nmnAz/Y/A6zDLR/Hf2ZRw==
X-Received: by 2002:a17:907:d78b:b0:c12:6d25:2c7a with SMTP id a640c23a62f3a-c15cdeb229dmr146003166b.17.1783526684993;
        Wed, 08 Jul 2026 09:04:44 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ddb9e1d2sm40020166b.52.2026.07.08.09.04.41
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 09:04:42 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6989c0ec3c5so1577037a12.2
        for <arm-scmi@vger.kernel.org>; Wed, 08 Jul 2026 09:04:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrcOXyzuKwNW6MofqQDGtlj6YfinP/gjae6ZsMOzBMIHF62iF33QF2W4bMc2eFWRSv9Utczl6onJg==@vger.kernel.org
X-Received: by 2002:a05:6402:1475:b0:698:1973:1da9 with SMTP id
 4fb4d7f45d1cf-69ab44a2082mr1330602a12.19.1783526681164; Wed, 08 Jul 2026
 09:04:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505329.git.geert+renesas@glider.be> <3c76a2d4-a8b8-493a-9196-c5cc72958118@mailbox.org>
In-Reply-To: <3c76a2d4-a8b8-493a-9196-c5cc72958118@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Jul 2026 18:04:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUVUKYrrms0Vd4i3_nwq2LVjvnvFRWswi8UY3cA67u2-w@mail.gmail.com>
X-Gm-Features: AVVi8CdIlIxklIbGHNZaygjBAfJd_Dhsc8WBwlY036WlOLVf0uDAr_hqlDulMbU
Message-ID: <CAMuHMdUVUKYrrms0Vd4i3_nwq2LVjvnvFRWswi8UY3cA67u2-w@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] R-Car X5H Ironhide CPG/MDLC SCMI remapping support
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, 
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

Hi Marek,

On Wed, 8 Jul 2026 at 17:42, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 7/8/26 12:16 PM, Geert Uytterhoeven wrote:
> > Geert Uytterhoeven (10):
> >    firmware: arm_scmi: Add scmi_get_base_info()
> >    of: property: fw_devlink: Add support for firmware
> >    pmdomain: Make genpd_get_from_provider() public
> >    reset: Add reset_controller_get_provider()
> >    dt-bindings: clock: renesas,r8a78000-cpg: Add firmware property
> >    dt-bindings: power: renesas,r8a78000-mdlc: Add firmware property
> >    clk: renesas: r8a78000: Add SCMI remapping support
> >    pmdomain: renesas: r8a78000: Add SCMI remapping support
> >    arm64: dts: renesas: ironhide: Enable SCMI devpd, sys, clock, and
> >      reset
> >    arm64: dts: renesas: ironhide: Add CPG/MDLC firmware properties
>
> I think 10/10 did not make it either to my inbox or lore.k.o , but the
> remaining 9 patches look good. Thank you !

Thanks, I did something silly while sending.
Lore now has it, b4 still seems to miss it, unless I specify the
Message-ID of 10/10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
