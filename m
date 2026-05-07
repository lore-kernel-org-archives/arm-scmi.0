Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A5B33A9CB
	for <arm-scmi@vger.kernel.org>; Thu,  7 May 2026 07:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778139472; cv=none; b=b1sMC4TCfP00tHHTFTlewgbsdviImxtupP9cMvoiYH/YpLUrIMWtRED6T6VaGvf2yKeCINU+oMi37JRGRBzqwPWGsNAf/6sBRJgHcdobI+Lzo2J2kadyj7HUw2JNzPdkL38rkpIHpEcq3pGNESQa8ahvOix5GLyHKsGe0BqXi4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778139472; c=relaxed/simple;
	bh=BCBnzIbovSj6nZkSdLu43I/N8uho8yIG58ObXHwQhSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b1XrTwI91GYYHDnC3ltKE9gUnodLt+dzq4siFju6ZMVwfNTyns+cy8iQgqbGTTBrKDSIzQrWg5fI5n5SIWYNydXxdcejQGQX7PVpjZ4T0ix1xmuNSK9KCn5gR3EH+tBZWiJeNJTUWN8Y6vVZ7A1aHtMnpMiOC4y90RXzRi/X5S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-610e2e8f57dso175002137.0
        for <arm-scmi@vger.kernel.org>; Thu, 07 May 2026 00:37:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778139469; x=1778744269;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Egy2nC9k2RFpcPzSIv9jZ/VwU1PCVKckuVqW7m7bXrc=;
        b=Te34+IbOyuypiwo+H5D4nP2abp7zXMo3mTaFWJhwlUrqfAC3JgFY43tCwRmDgJIV9+
         HtM/BhtNnRUDc662AqSMJXonmFRHkoxsGel2co0jOYRlodNJXe6lqovEy6Un0FKukD06
         EX4zvGu/OQmejnHX/Y+znPHEVQyLbs98Vyowp7dwo/cKm+lQLJCnahALmImJ+MJeqkit
         UW6clY+0DygoXmBE35I4GwS98RwwgLXFDgGJKEFkWzcK6we+qwGYKnJNTuCfI12Y6NyS
         k566cCTOJ3GggyZJa88sQKHvoAOrfi+DU+YktlBgsg3bMJAL5jDBILaJeNtK2rIX1sap
         HKtw==
X-Forwarded-Encrypted: i=1; AFNElJ+9fMPYcattiXeW0Cx/QXFxej0XT8J6r0H51s6YXlQLkLhBK0BsuhqwzWFypkPZNoSjgdbdi+619g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqCLg58oHYrALqonN5T2Y37jQCDW8UycTCRb3crKY09ULp0A1H
	nuYZtBkKsWwbtlzZ5PKRsQ9WolXcOYqfEWMPMEoViBCQxzPyU2CR6EuoHylrkeC4gJI=
X-Gm-Gg: AeBDievVDHpm+kcRgXTismxVDpZzhkeKkM6GHTvLS5/K3z43uGYX4mdJRhxhlzTBSS6
	v1iTSqx0UqamtUcShyGRItAeJesMGgYjTb8Gox4WqOxin4HC1VF9OK9ViBC9xBMAQQ2hUrSi7Wr
	yYohZF2qcoEjFu97Ti6OTTWQ3q4R37htKzuf3X+9/a7tFXAvoTJF7RgREH12c80W3WYTmYLkw8M
	LJi5KStVppVMqMHXkTao2DOYE+seWiKUat3qPOb8znrj0OsXN8aGScERe4G6f8fnx7OKqwzZb64
	iCTlBj1cNRQ4mp8kHwccliBy5fY6b091xXJUhMIHMxDuGqnDnDnR05J07Xei3zHRUcy2laIuBGk
	Py58HNkSGwuVqaIly5wBq/2iGMrqKqcRpNi6gi68ecE0043pEVGZFCek7OEtQQ5Fn+gdTG/OU09
	xV3LlTFOvoDpZI/x8WbRpbaYaBmHg9Ibv047KeMRgY9ye9R2D1Ihlxy9ixNlpFBej1zePdi6SWs
	z85oZSNYA==
X-Received: by 2002:a05:6102:3e1c:b0:62f:4553:7a28 with SMTP id ada2fe7eead31-630f9023219mr2854535137.21.1778139469324;
        Thu, 07 May 2026 00:37:49 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-62dca273b0esm8752739137.9.2026.05.07.00.37.47
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 00:37:48 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-95d0476490fso164532241.1
        for <arm-scmi@vger.kernel.org>; Thu, 07 May 2026 00:37:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/4rvC9NSqopSTlrOce3SR8iSuWETFBq1V/3fmAPv5+zeICkZh1O3AUFy2npgmTgan3GP7qUYd6Uw==@vger.kernel.org
X-Received: by 2002:a05:6102:38d3:b0:5f5:4055:4556 with SMTP id
 ada2fe7eead31-630f8e752e6mr3312584137.4.1778139466906; Thu, 07 May 2026
 00:37:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <053c312d07445517d8f9c84bfe3cc8fb72d4cd9a.1776793163.git.geert+renesas@glider.be>
 <bf83a028-3ef3-482a-9ce3-8aec16f6ebed@mailbox.org>
In-Reply-To: <bf83a028-3ef3-482a-9ce3-8aec16f6ebed@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 09:37:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWN2zaZrY2jKKXpNqrP8xSqc-uJTr-siTBgaA=-EY_4BQ@mail.gmail.com>
X-Gm-Features: AVHnY4KGlUYo0uuTDH3tynnil_8H5d8OEIYrlJIco2kr0W3O9LQYd8HP5vniIEg
Message-ID: <CAMuHMdWN2zaZrY2jKKXpNqrP8xSqc-uJTr-siTBgaA=-EY_4BQ@mail.gmail.com>
Subject: Re: [PATCH/RFC 10/14] dt-bindings: power: Document Renesas R-Car X5H
 Module Controller
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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

Hi Marek,

On Thu, 7 May 2026 at 00:58, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 4/21/26 8:11 PM, Geert Uytterhoeven wrote:
> > +  '#power-domain-cells':
> > +    description: |
> > +      - The first power domain specifier cell must be either the Module
> > +        Power Domain Gating (MPDG) register index (0x00-0x3f) from the
> > +        datasheet,
>
> I agree with this part.
>
> > or a Power Domain number, as defined in
> > +        <dt-bindings/power/renesas,r8a78000-mdlc.h>,
>
> I do not understand this part, please see end of this email ...
>
> > +      - The second power domain specifier cell must be the module number
> > +        (0x00-0xff), composed of the Module System Reset (MSRES) register index
> > +        in the high nibble, and the Module Reset Destination bitfield index in
> > +        the low nibble.
> > +    const: 2
>
> I am unsure about this part.
>
> There are multiple MDLC blocks, AON, SCP, HSCN, and so on. Each MDLC
> block contains multiple Module Power Domain Gating registers (MPDGn) and
> multiple Module System RESet register (MSRES) .
>
> I do understand and agree that the first power-domains-cells cell must
> be the identifier of power domain within the MDLC block.
>
> However, I do not understand the second cell. The MDLC bindings already
> contain reset-cells, which should be used to refer to a reset within the
> MDLC block. Resets within the MDLC block are operated using the MSRES
> registers. Why are resets conflated into power-domain-cells ?

The Module Reset Destination bitfields in the MSRES registers are
2-bit wide, and control both Reset and Module Standby.  Hence the
same register bitfields are referred to in the power-domains and
resets properties, through the module number.

Module Standby controls the clock(s) going into the module,
and is modelled as an SCMI clock (SCP_CLOCK_ID_MDLC_*) by the SCP
firmware. This is very similar to how MSTP (Module Stop) clocks are
handled on earlier R-Car SoCs (except that the SCP_CLOCK_ID_MDLC_*
clocks have a zero rate :-(.

Summarized, the first cell is the power domain part, and the second
cell is the clock domain part.

So perhaps I will clarify like this:

      - The first power domain specifier cell is the power domain part, and
        must be either the Module Power Domain Gating (MPDG) register index
        (0x00-0x3f) from the datasheet, or a Power Domain number, as defined in
        <dt-bindings/power/renesas,r8a78000-mdlc.h>,
      - The second power domain specifier cell is the clock domain part, and
        must be the module number (0x00-0xff), composed of the Module System
        Reset (MSRES) register index in the high nibble, and the Module Reset
        Destination bitfield index in the low nibble.

> > +  '#reset-cells':
> > +    description:
> > +      The single reset specifier cell must be the module number (0x00-0xff).
> > +    const: 1
>
> [...]
>
> > +#ifndef __DT_BINDINGS_POWER_RENESAS_R8A78000_MDLC_H__
> > +#define __DT_BINDINGS_POWER_RENESAS_R8A78000_MDLC_H__
> > +
> > +/* R-Car X5H MDLC Power Domains */
> > +
> > +#define R8A78000_MDLC_PD_AON                 0x40
> > +#define R8A78000_MDLC_PD_SCP                 0x41
> > +#define R8A78000_MDLC_PD_APL                 0x42
> > +#define R8A78000_MDLC_PD_CMN                 0x43
> > +#define R8A78000_MDLC_PD_ACL                 0x44
> ... what do these numbers represent ? Shouldn't those be register
> offsets from MDLC MPDG00 according to power-domain-cells ?

These are Power Domains that are not backed by any of the 64 Module
Power Domain Gating (MPDG) registers in MDLC blocks.
It is not clear to me if they can be controlled manually, probably
they are just always sequenced automatically on power-up.  As the
documentation does treat them as separate domains (see e.g. Table 14.1
Power Supply Voltage Monitor Functions), I figured they would better be
exposed as separate domains, instead of as a single always-on domain,
like on earlier R-Car SoCs (cfr. R8A779*_PD_ALWAYS_ON domains number
32 or 64).

See also the X5H_Power_domain_structure.xlsx attachment in the R-Car
X5H documentation.

> If those are power domain IDs, then I am unsure why e.g. for SCIF the
> domain ID is R8A78000_MDLC_PD_APL in [PATCH/RFC 13/14] arm64: dts:
> renesas: r8a78000: Add CPG/MDLC nodes . Could you please expand on that ?

See the "Module Standby" attachment X5H_MS.xlsx in the R-Car X5H
documentation. The "PERW" tab shows that all PERW devices are located
in the PD_APL power domain, which is always-on.
This is different from e.g. the UFS controllers: they are located in
their own PD_UFS0 and PD_UFS1 power domains, which are controlled
through the Module Power Domain Gating registers (MPDGn) (cfr. the
"PERE" tab).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
