Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CF134B68F
	for <arm-scmi@vger.kernel.org>; Tue, 24 Feb 2026 23:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771974688; cv=none; b=Ni4Usq0G2VfNBijMB6Sf+TpzTCZJkC7JMy8QrqqBYytnpu6VdwMsosIwotzePbrjuNztRswALl8sGVDcBw9HJyf0/BenA/wqMqYvy9qk6QfFkec86lrUKzSN16ZIPI/kfEOALuftqhb1PO+bh7haKkjPkO/hWc3vw+MxNcofk98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771974688; c=relaxed/simple;
	bh=C6dKs709R8QkP96qnTwbzemrD3f3toqG3vduzVJ7m7w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=O9J2HHEsBI9lAX6DeDEelaxMzlX0eqb2nIexfCpz/Ec7PDdnLphKqiDcuA+6Cm1gWlAFLjTazSkXMWLABi7PFMWt8GpkswegAhXIoQd4cAHqzg2lo9hCFO605uXI5THe62UPFMTuRTGu5O5dzJq1WR7YBWSZVK++nlnreG88Uv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=a7zt2RPp; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="a7zt2RPp"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8231061d234so4790024b3a.1
        for <arm-scmi@vger.kernel.org>; Tue, 24 Feb 2026 15:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771974686; x=1772579486; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aaFTBYE7pFhQ5Wo9wLOr+Dlo/OUF/sPft+MdYSKIvhA=;
        b=a7zt2RPpITAfVZkvqDHokn1wHTT8CPiw5kOdeYnN5nZn01FPOnSKhNk9mlqRrPoSqD
         O2H7fXkGSV07sE6nJ9et9bAy8R0Y6lEBvcZgXO3i+a87B2rSKA4E1Xvfzv9ayrnc9LrY
         w96Y67rEnY/ZviPJPy2Ez7VhsxVRXjM2sxeN85fZqbkiUlnGEDb4/6u0vLZTEqXPwU9/
         gPJ+x3IxXCdA3WKrtt+TTeUr4hVMr+pTreZ43tcjelplhRzqqdKn9iOaosF0HYP0QsxO
         WTHmcpkZ4lzFfaM6qd/YM05+geAUfmHxqHKb/zUYUN2o/Jh7A7FSdsgKZayPgUFX83Bu
         4qRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771974686; x=1772579486;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aaFTBYE7pFhQ5Wo9wLOr+Dlo/OUF/sPft+MdYSKIvhA=;
        b=d2Khnq4Ac11XF3E9drUTp1n+CxWPzMVbE5IYwBzQhnsr/2LLyr6NW0iG20B11gMOFy
         mprrm7eSGdevmm4qLuLTgk8Xh9dDqoyNxmwxlAaSZLB3UCuXr1JBT0tSA/1JTA4uuCYV
         Xd287NwdQx4VPDwdysmeDAlI0kFp6m1t1s9kGvggUVwmhnYlVASotCZmH0sQ60tm2Lpw
         1jSMMPHrRDfIozgCIlJZNo/pHD0OXBOGwBZUMQyBEfI2zW8UD97ll0myXu5qA2ozcpK2
         eMZ40ToIZcVgoARZQ9cRm1+ntkwsq7dgmfTROCnmycN/tjtMnzB2HoOeYrzzMtJJN0Am
         8MUw==
X-Forwarded-Encrypted: i=1; AJvYcCVUl/XO2Byb5IqKByu0m3oyHar+y4dOaMDrtpLzsjVsXFf/jtVVpPmF4kz9d7ipZ01ghWyeuRRVLg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs7q0I7i/8ZQIOpIi2ZKB5Oyyr0IGoh5AwcwjL7ZultELTyePO
	A6SULaQ6t0egGjkePgWPPBpVkGw8uprB+bxYt1DdmDoog3fXLh//N6JbQydLWGFS8R4=
X-Gm-Gg: ATEYQzw1gj2b+23evyZ/4WrF1Mq6Bi3ojAfSrO/l0bIcwpqsKtbpfxY/fajJBe3IG/S
	og32BSpyCbYoUTWP6M8IQIK2KX6yLe8uq/6eZWuEz885cGD2zODx9mK4MOvVB9iWoAY/iZirok2
	mDpz2CPbuLs4AIx8OrkwxLqHtJoFcCl49E5AYuoo6fQmuyN7Bq55Ps9TVVGh2v7U3HIKuYXUOyg
	1aJvXcpOqKyankvBYfQrmbyDtmgtAh2Qrsl1fYyqnT8KsiaRuZf+ZJxi8kI8lDpWp+gcqznTQtp
	VHRcIJqXSEoK7Lk5I8D9bPVJXuaAVQAtDfcdvk07otTEYttjvzucZyesgMZJ9zSPEgiUkiGWwy1
	GP69LXhZee0yuAhfRDdTox4Sjbmn8Pi/r4l6yITXs5fal2eDaLZEs9SOJ9NtTV+vFqHOjv1YOMM
	7FH5agS4TdLzkL1iCRF/8q
X-Received: by 2002:a05:6a00:1746:b0:81f:b1d4:b486 with SMTP id d2e1a72fcca58-826da8bf4a2mr12692323b3a.8.1771974686262;
        Tue, 24 Feb 2026 15:11:26 -0800 (PST)
Received: from localhost ([71.212.200.220])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd63f1b3sm11486793b3a.3.2026.02.24.15.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 15:11:25 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Sudeep Holla
 <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v5 1/2] pmdomain: core: support domain hierarchy via
 power-domain-map
In-Reply-To: <CAMuHMdURxN=kBQHJKnsTVEQPeuB41r5kZy4sgFNqg=U2ynuZMw@mail.gmail.com>
References: <20260122-pmdomain-hierarchy-onecell-v5-0-76855ec856bd@baylibre.com>
 <20260122-pmdomain-hierarchy-onecell-v5-1-76855ec856bd@baylibre.com>
 <20260127151735.GA1699112-robh@kernel.org> <7hjywtzaiy.fsf@baylibre.com>
 <CAMuHMdURxN=kBQHJKnsTVEQPeuB41r5kZy4sgFNqg=U2ynuZMw@mail.gmail.com>
Date: Tue, 24 Feb 2026 15:11:25 -0800
Message-ID: <7hv7flrb36.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Hi Kevin,
>
> Thanks for your series! I became aware of it only recently, and read
> it and its history with great interest...
>
> On Wed, 4 Feb 2026 at 00:13, Kevin Hilman <khilman@baylibre.com> wrote:
>> Rob Herring <robh@kernel.org> writes:
>> > On Thu, Jan 22, 2026 at 05:14:00PM -0800, Kevin Hilman (TI) wrote:
>> >> Add of_genpd_[add|remove]_subdomain_map() helper functions to support
>> >> hierarchical PM domains defined by using power-domains-map
>> >
>> > power-domain-map. No 's'.
>> >
>> >> property (c.f. nexus node maps in DT spec, section 2.5.1).
>> >>
>> >> This enables PM domain providers with #power-domain-cells > 0 to
>> >> establish subdomain relationships via the power-domain-map property,
>> >> which was not previously possible.
>> >>
>> >> These new helper functions:
>> >> - uses an OF helper to iterate to over entries in power-domain-map
>> >> - For each mapped entry: extracts child specifier, resolves parent phandle,
>> >>   extracts parent specifier args, and establishes subdomain relationship
>> >> - Calls genpd_[add|remove]_subdomain() with proper gpd_list_lock mutex protection
>> >>
>> >> Example from k3-am62l.dtsi:
>> >>
>> >>   scmi_pds: protocol@11 {
>> >>       #power-domain-cells = <1>;
>> >>       power-domain-map = <15 &MAIN_PD>,  /* TIMER0 */
>> >>                          <19 &WKUP_PD>;  /* WKUP_TIMER0 */
>> >>   };
>> >>
>> >>   MAIN_PD: power-controller-main {
>> >>       #power-domain-cells = <0>;
>> >>   };
>> >>
>> >>   WKUP_PD: power-controller-main {
>> >>       #power-domain-cells = <0>;
>> >>   };
>> >>
>> >> This allows SCMI power domain 15 to become a subdomain of MAIN_PD, and
>> >> domain 19 to become a subdomain of WKUP_PD.
>> >
>> > One concern I have here is generally *-map is transparent meaning when
>> > you lookup <&scmi_pds 15>, &MAIN_PD is returned as the provider. It's
>> > also possible to have a map point to another map until you get to the
>> > final provider. The only way we have to support both behaviors is the
>> > consumer has to specify (i.e. with of_parse_phandle_with_args_map() vs.
>> > of_parse_phandle_with_args()), but the consumer shouldn't really know
>> > this detail.
>
> This is also the first thing I was worried about, when I noticed you are
> not doing transparent mapping, but add an explicit hierarchy instead,
> based on the map.

Yeah, the map wasn't my original idea, and TBH, I had never really even
heard of nexus node maps before it was suggested by Rob[1] that I could
use it to describe hierarchy.

But... I'm gathering from Rob's and your recent feedback that my current
approach to using a map is an abuse/misuse of the map because it's just
being used to describe hierarchy, and because it's not transparent.

I'm still waiting to hear from Rob to see if I understood that right,
but your feedback is making me think that's the case.

If so, I'm honestly not sure where to go next.

>> > Maybe a transparent map of power-domains would never make sense. IDK. If
>> > so, then there's not really any issue since the pmdomain core handles
>> > everyone the same way.
>
> AFAIUI, SCMI is not limited to the SoC, but may be used for the whole
> hardware platform, so it could control power to external devices, too.
> Once we need to map a power domain through a connector, we need
> support for transparent mapping through a nexus node.
>
>> I don't really know enough about potential usage of maps to know if
>> there's ever a usecase for transparent maps.  However, the problem I'm
>> trying to solve is less about transparent maps, and more about
>> describing hierarchy in a situation where "leaf" domains of the same
>> type (e.g. SCMI) can have different parent domains.
>
> Hierarchy is indeed something that cannot be described with the current
> SCMI power domain management protocol.  This includes external hierarchy
> (your use case), and internal hierarchy: AFAIK, Linux cannot be made
> aware of the hierarchical relationship among the different power
> domains controlled through SCMI either.

Yes, the limitations of SCMI (both the protocol, and the Linux
implementation) are the root cause here.  In case you didn't see it,
before I posted the original version of this series, I started a thread
on the arm-scmi list to discuss implementation options[2]

So since this is primarily and SCMI limitation, maybe I should just go
back to the original proposal of using power-domains-child-ids[3]?

I'm definitely open to suggestions here as I'm a bit out of my depth
here.

Kevin

[1] https://lore.kernel.org/r/20250528203532.GA704342-robh@kernel.org
[2] https://lore.kernel.org/arm-scmi/7hecy3h7ky.fsf@baylibre.com/
[3] https://lore.kernel.org/all/20250528-pmdomain-hierarchy-onecell-v1-1-851780700c68@baylibre.com/
