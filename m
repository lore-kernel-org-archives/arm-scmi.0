Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0C6322753
	for <arm-scmi@vger.kernel.org>; Thu, 19 Feb 2026 10:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771496979; cv=none; b=Ad1B7MjghfC2tlTcm2+8/4IRLsn1d5Zhp4l0c/WzJrVy2TTB6mFaospZ19j24qg73/DUavNvWbRDmV8WBR6aZRvEpAdNtuK9nyFAkEJM01OREjMPJ8GOW33NMimftRHzCa5gugCNcrS2Jmc/wsYg0H7GHexRaCl+TDBE74UE2Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771496979; c=relaxed/simple;
	bh=2wVcxigiWF7bmx5zDNOy2YgF6Z3jZwMF/ktrBkzISyk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RaPtRubVJXfB96m7pyQj79jAQ5ug9LXFQr2BxwR/8Dv+D3+j/0WElV8j1w6sVxam1+S/sVgZW+Fx2Ij6u4usqOTKWzOMTNNKrxSz2LZi8uxJcvxlYCFNqZMOBllSqE26FuhzJ+mgJ2NKKZXmzF7MfKMCp9MOnTGQsZOew7D0HD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-567606e16e7so770584e0c.3
        for <arm-scmi@vger.kernel.org>; Thu, 19 Feb 2026 02:29:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771496977; x=1772101777;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/iP8fek36cTZj7uGuQwlk+a5PJBqWvYn07ZjqPzOHk=;
        b=baYelJ7iRhW7t0qtpn6bYGO9ld3Lis0qvmWZOSnCwMd4BmpYpQqlYQEZL+pI2rRgGp
         rJlwX8DimpVwRubenHWVlfBHGUG8UFv+UKXuMUapXlz6bnfJw2W09NBPPhmRKGkuv/gW
         2pHBv5bwEpcnqHsn7HMeII+aR9nkqBc6iOspxbALxkZ26rx6cVS0x3C+scdji4NGQ7Ng
         dyIonbzvQymq97aZCMm3jITSgiY0dhFVcaFSLHQ7CpsurnwnDfQusOlY62peufCqu+A9
         /tO5Yk7RY+DG4iryLv6k1YqEQwjHFUki5rDISLfiugTNXS9W0zBJ/UgRN5o3N6PapjdR
         Wvbg==
X-Forwarded-Encrypted: i=1; AJvYcCWzYdzARvQrSkhZlnTzUzn8JJzhWtBpC7x4Z7SfTaDmS+mt1T7dOdaCs05CBiy8CYvt0p0hpPoXbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUETOOvNxeXk74czttZR7t8TZyQpA9uPpAThckFo5PlQ9Ew7SL
	W/ZG2L5C9ci693YFg/L0TP1e1IkscUuQTvia/bQH5moKBL6/VOT5eONDA8kyzj+a
X-Gm-Gg: AZuq6aL8qPQMFaeF+XYgrPsImEEKHqFw69ERzbdQJyJixbbgKtR9C6ryXGa+wfB13Gw
	CrEnkXqb3PwazikifMmOu5Ln0blarut5JvvW3QuobtTaoUkjSmbilpOFW4tTAA3w2L0wBogHyyb
	df5q9xa4yuv2cLLDG+6BFC5GQf2kCM/9t3pwrSp0WdvUXkJxOKoHvAgl19UdFVytjt0stV1qG51
	SE2/lTokV/5+Q5a+LjXrvpm/kxvgVTvJ+5jGAENMp7jDZX35yAJcOQJ3fD5xm9lE4SL6RORA1Ld
	+20+EGR/KJWLYVXXENQkuqYTodXMs7Rrt/sZeceL4J2QjDAYgFNz+4RAlmwqyeon7dVDQ2X3ZCW
	F9JqwQpWhV4euKsiFJ4c3DIjrdfOspt9LBlW8MgwWnY7E5aeRMBLgAN0dif8fvVatN2pWDBNYzt
	2b1CIKNeocxeM2IOniYu8CF+7In0fD6z06Jjw/CSkZ71WRCIYiLMfLiniIpgZ8DBOi
X-Received: by 2002:a05:6122:31a8:b0:566:4689:46eb with SMTP id 71dfb90a1353d-568bf3ef1a1mr2294954e0c.0.1771496976786;
        Thu, 19 Feb 2026 02:29:36 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5674bff0922sm13408235e0c.6.2026.02.19.02.29.36
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 02:29:36 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-567606e16e7so770570e0c.3
        for <arm-scmi@vger.kernel.org>; Thu, 19 Feb 2026 02:29:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXoCnQ65YwWjKTuYwfBms+bhwfDKzsLacDQgAQTo1xbgYz4hdHBWdUVJwt9ujq64iB4t6ffBcOS1w==@vger.kernel.org
X-Received: by 2002:a05:6122:2494:b0:567:2b94:2e6c with SMTP id
 71dfb90a1353d-568bf59a621mr2370313e0c.11.1771496976112; Thu, 19 Feb 2026
 02:29:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122-pmdomain-hierarchy-onecell-v5-0-76855ec856bd@baylibre.com>
 <20260122-pmdomain-hierarchy-onecell-v5-1-76855ec856bd@baylibre.com>
 <20260127151735.GA1699112-robh@kernel.org> <7hjywtzaiy.fsf@baylibre.com>
In-Reply-To: <7hjywtzaiy.fsf@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Feb 2026 11:29:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdURxN=kBQHJKnsTVEQPeuB41r5kZy4sgFNqg=U2ynuZMw@mail.gmail.com>
X-Gm-Features: AaiRm519SaRshXGNVfvg14cRnmfkYROkGvJOkhQFEH8pcasVxqZP2kH1_tN-rv8
Message-ID: <CAMuHMdURxN=kBQHJKnsTVEQPeuB41r5kZy4sgFNqg=U2ynuZMw@mail.gmail.com>
Subject: Re: [PATCH RFC v5 1/2] pmdomain: core: support domain hierarchy via power-domain-map
To: Kevin Hilman <khilman@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Kevin,

Thanks for your series! I became aware of it only recently, and read
it and its history with great interest...

On Wed, 4 Feb 2026 at 00:13, Kevin Hilman <khilman@baylibre.com> wrote:
> Rob Herring <robh@kernel.org> writes:
> > On Thu, Jan 22, 2026 at 05:14:00PM -0800, Kevin Hilman (TI) wrote:
> >> Add of_genpd_[add|remove]_subdomain_map() helper functions to support
> >> hierarchical PM domains defined by using power-domains-map
> >
> > power-domain-map. No 's'.
> >
> >> property (c.f. nexus node maps in DT spec, section 2.5.1).
> >>
> >> This enables PM domain providers with #power-domain-cells > 0 to
> >> establish subdomain relationships via the power-domain-map property,
> >> which was not previously possible.
> >>
> >> These new helper functions:
> >> - uses an OF helper to iterate to over entries in power-domain-map
> >> - For each mapped entry: extracts child specifier, resolves parent phandle,
> >>   extracts parent specifier args, and establishes subdomain relationship
> >> - Calls genpd_[add|remove]_subdomain() with proper gpd_list_lock mutex protection
> >>
> >> Example from k3-am62l.dtsi:
> >>
> >>   scmi_pds: protocol@11 {
> >>       #power-domain-cells = <1>;
> >>       power-domain-map = <15 &MAIN_PD>,  /* TIMER0 */
> >>                          <19 &WKUP_PD>;  /* WKUP_TIMER0 */
> >>   };
> >>
> >>   MAIN_PD: power-controller-main {
> >>       #power-domain-cells = <0>;
> >>   };
> >>
> >>   WKUP_PD: power-controller-main {
> >>       #power-domain-cells = <0>;
> >>   };
> >>
> >> This allows SCMI power domain 15 to become a subdomain of MAIN_PD, and
> >> domain 19 to become a subdomain of WKUP_PD.
> >
> > One concern I have here is generally *-map is transparent meaning when
> > you lookup <&scmi_pds 15>, &MAIN_PD is returned as the provider. It's
> > also possible to have a map point to another map until you get to the
> > final provider. The only way we have to support both behaviors is the
> > consumer has to specify (i.e. with of_parse_phandle_with_args_map() vs.
> > of_parse_phandle_with_args()), but the consumer shouldn't really know
> > this detail.

This is also the first thing I was worried about, when I noticed you are
not doing transparent mapping, but add an explicit hierarchy instead,
based on the map.

> > Maybe a transparent map of power-domains would never make sense. IDK. If
> > so, then there's not really any issue since the pmdomain core handles
> > everyone the same way.

AFAIUI, SCMI is not limited to the SoC, but may be used for the whole
hardware platform, so it could control power to external devices, too.
Once we need to map a power domain through a connector, we need
support for transparent mapping through a nexus node.

> I don't really know enough about potential usage of maps to know if
> there's ever a usecase for transparent maps.  However, the problem I'm
> trying to solve is less about transparent maps, and more about
> describing hierarchy in a situation where "leaf" domains of the same
> type (e.g. SCMI) can have different parent domains.

Hierarchy is indeed something that cannot be described with the current
SCMI power domain management protocol.  This includes external hierarchy
(your use case), and internal hierarchy: AFAIK, Linux cannot be made
aware of the hierarchical relationship among the different power
domains controlled through SCMI either.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
