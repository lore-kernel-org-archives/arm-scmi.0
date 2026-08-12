Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32E84195A0
	for <arm-scmi@vger.kernel.org>; Wed, 12 Aug 2026 09:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786528065; cv=none; b=G22ON8KgPrRlSSraY7APbE3XON7lG5flJnwlGvEiQ85aWlz4wrfK+dJU3lOBr6N9q74zmHkBWe9TFsKrtgCIBCO8fRVuvLQKubwQQerp75CG29n3ktkvL7BaavCh37USNiPoPD5SKab5l+dF97Y+tfDSSpC5tlYGqgrZDvnhAWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786528065; c=relaxed/simple;
	bh=bWURXCZrQDZ0x80rfdOSm1jqz2Xjezk3ZnaVSR44ifs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UXkPn43DH3tNskO/PBq1nUhixNnY3gPGVjRhAcR+LQeZf6mNjrmTTRxXtDqNAIfiahPBWIu+kdTWHGAtWKjG9wbeFlimo1J+6THkdgg4fsaHD3xNYQTlk66e9hez5WIOsYvmz7m8BFBU/rB4GD6CFwn2JWSGOubBJ/YHFOyJZxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5c2c46a428eso475217e0c.2
        for <arm-scmi@vger.kernel.org>; Wed, 12 Aug 2026 02:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786528063; x=1787132863;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/axx2TQndZ7l7LrHHfpxsCFqNyyCWsv8j2VxY85Jrxc=;
        b=E4e1R4ROEO9uepbmvp4XWr03RA0QJeJxUxYFpqAuzQjICGZ40XDzY90iiybQ759VW9
         4YRDCVD4oJS1FmEN2jBfAuk1e21tYKLPqIU/yhEVV56Ay3UoStDSEWWYRK1Ihyb9Ypcg
         ScFrPy6b+i+Q9dPRZf1Uj2LaL/KJq7vcU/0HC9t/ObOAxhC8PkRpsSd3aSwY60mBbBCy
         dho7/RZZAjsHKjop5dB5YdoQ7lSYe3RRKyU9M/QFATiKmuxv3mJPv3kL7icGR6EWhAoX
         S0nYza3Uu9sc0WubeswZzfX3pJ8VHb39wnj6k5cuZAUaIHM3dy0OPCGeoY/P4kpn4Naw
         GNAw==
X-Forwarded-Encrypted: i=1; AHgh+RoA4+50Ymnpukn96wWbV1AU5h8jBKiLzhCFti7KjqrVU+hO01GoSCwSoEVb/1EyC2oaltfVHXIeLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7+4lfID0YR/vkrkiCBHqvOfa3TOfNATDU4/QI8Cpo0vBcMOIt
	R53qI9bnI0pXCd2ciookAijfLy0Sk3e/B6k3lYxZjgUsjBowHxVBSbco6xFTb544
X-Gm-Gg: AR+sD132qN61osVqe4rWSfNIpMD6uIGawcMtFyDY4QjC+vsbQjGvljNkvzLJ6grN2T/
	rnsXqJqv7NZwlxMfjOVQX7kRUlLqwL0AhHVx1qi84qIs6UfKuJZmXGcMKheJw/4SCwa3zImAfUt
	FrxCi1wQCHIFX4h2mBEjcpJEno8p/GX6HsWtO7Mq27X1pRRUmKuAVZilxMuFX3Yic0yJTwSXfA3
	zbSPmcki0CnxjULhi9K4h0AUplOWieaUQX/0/Zl3e4JU6DSXXGWK8SgROz0H/chsBA8LE4eLZyk
	0oNQ4r10m6v7VbvC5GO3npLw23ToCi2975ETZ0hOF08bCrFAd0aumd0JAS+eTUJQkQkTpblWC5K
	d2yRKjbBP60BDMkh827g1VzUKUB/VLKjcX27Dis+2jxZP7NCwIKeLgcoMm6lRckCF16V5/4kZNh
	XjRcib2leaHL3rCiw5AF9Pv73BhqcOKtkouryXYSedUhU/d9CLsDIzqjMGKm3ZEgv1njZMc8LmC
	O8TKAjqX4qXL/aqC2oPqLO77A==
X-Received: by 2002:a05:6122:2982:b0:5c2:cffc:2c55 with SMTP id 71dfb90a1353d-5c4f1bca9a6mr477970e0c.0.1786528062767;
        Wed, 12 Aug 2026 02:47:42 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c45b516918sm1012472e0c.8.2026.08.12.02.47.41
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 02:47:41 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-754acc61e10so307340137.2
        for <arm-scmi@vger.kernel.org>; Wed, 12 Aug 2026 02:47:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoQNml0j+HoPchpJaTXCox8yd2zQW//d/Vw5Ki9bR0xDcvz2+gZdtvspMDl8KMu/rUcXKOLOxLIjg==@vger.kernel.org
X-Received: by 2002:a05:6102:8020:b0:74c:7fd8:73eb with SMTP id
 ada2fe7eead31-76c87d7044amr1040741137.1.1786528061345; Wed, 12 Aug 2026
 02:47:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505329.git.geert+renesas@glider.be> <49726acff0fee1c3606e83c4f242ef6aad25b4b8.1783505329.git.geert+renesas@glider.be>
 <20260710-adventurous-burgundy-chimera-b2fff9@quoll> <CAMuHMdV=ckONBbTYELPJU8YWoNzdu3PJ95VR8cz+f_7dUeiPUw@mail.gmail.com>
 <20260716214924.GA1477674-robh@kernel.org> <CAMuHMdU0ss6wUEdjC+OYa3iQS439aJ8b_d9M2ws7Ayn4_kOyMQ@mail.gmail.com>
 <20260811163334.GA2354701-robh@kernel.org>
In-Reply-To: <20260811163334.GA2354701-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Aug 2026 11:47:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWbzg-QpFBzzDa2hC3HzAmWUkerESC5O-cSVxmWX3_PkQ@mail.gmail.com>
X-Gm-Features: AUfX_mxykVa-_GVxsMsY5j-WoXLeEw0hqTlxX_hGEjk_L8dF08TYL9-2xHiMqsc
Message-ID: <CAMuHMdWbzg-QpFBzzDa2hC3HzAmWUkerESC5O-cSVxmWX3_PkQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] dt-bindings: clock: renesas,r8a78000-cpg: Add
 firmware property
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
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

Hi Rob,

On Tue, 11 Aug 2026 at 18:33, Rob Herring <robh@kernel.org> wrote:
> On Mon, Aug 03, 2026 at 02:01:18PM +0200, Geert Uytterhoeven wrote:
> > On Thu, 16 Jul 2026 at 23:49, Rob Herring <robh@kernel.org> wrote:
> > > On Fri, Jul 10, 2026 at 01:02:39PM +0200, Geert Uytterhoeven wrote:
> > > > On Fri, 10 Jul 2026 at 12:21, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > > > On Wed, Jul 08, 2026 at 12:16:23PM +0200, Geert Uytterhoeven wrote:
> > > > > > Add a firmware property, for systems where SCMI must be used instead of
> > > > > > direct hardware access.
> > > > > >
> > > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > > ---
> > > > > > v2:
> > > > > >   - Spin off from "dt-bindings: clock: Document Renesas R-Car X5H Clock
> > > > > >     Pulse Generator".
> > > > > > ---
> > > > > >  .../devicetree/bindings/clock/renesas,r8a78000-cpg.yaml    | 7 +++++++
> > > > > >  1 file changed, 7 insertions(+)
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > > > > > index 4e23bba334382346..fc499e7cf52e4f0c 100644
> > > > > > --- a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > > > > > @@ -35,6 +35,12 @@ properties:
> > > > > >        <dt-bindings/clock/renesas,r8a78000-cpg.h>.
> > > > > >      const: 1
> > > > > >
> > > > > > +  firmware:
> > > > >
> > > > > RPi is doing similar, but I have doubts. It looks way too close to
> > > > > generic "syscon" which is disallowed.
> > > > >
> > > > > I think this should be vendor+purpose specific, e.g.:
> > > > > "renesas,scmi-transport" or "renesas,scmi-firmware"
> > >
> > > If you can tell me the resource that a 'firmware' provider provides then
> > > it is fine, but you can't.
> >
> > It provides a firmware API, which is not available until the firmware
> > provider is initialized.
>
> I don't know what "a firmware API" is. What does it provide? I know what

It can provide lots of things (everything we are no longer allowed to
touch directly from Linux ;-)

> a clock, GPIO, reset, interrupt, etc. provider is.

A clock is an object you can access through the clock API.
(s/clock/.../ for the other cases).
Firmware is a service (virtual object) you can access through a
firmware API.

In all cases, the consumer of the object or service needs to know
which object or service to use (there can be multiple).

In all cases you cannot access the object or service until it is
available (initialized and registered), for which we have -EPROBE_DEFER,
and/or "[PATCH v2 02/10] of: property: fw_devlink: Add support for
firmware".

Thanks for your understanding ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
