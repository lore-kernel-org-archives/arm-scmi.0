Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0EA38E5F2
	for <arm-scmi@vger.kernel.org>; Mon,  9 Mar 2026 22:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773095065; cv=none; b=JlRJAMz8A6PFmRr/SLUdQNi6RIXWRi58rDjHs2Xe6/a/MwDsEcUex3/8mx1PWBVV+uNl1iy07Ru0YoxwwCWn0bdp9P1e2j99ePY8lTbA2wVECF4eP4IuyxWs3N3CagXt1hsqsBchSqKJOXxJtan/aJjEZKRSldV30PWPbr7FbXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773095065; c=relaxed/simple;
	bh=Cko55lCeKXrZHbjiIu641PYW/o6VsGwurcqaGD8aeKU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kfj2Ny2Ea15MZX4QLriLrvEUkUS7/LCUFpqqVhtebpuMySQ8K6ZZJjrQnfru4P90Z02Rx2DVgERWkfTWuOaiwKufOhlw5hbYQ8ygd2nmeBnmoCsTaEQ/+mxQnX0ZKBdyrcLxHvAJNfzYfyGj89yUuCeXVQB/d7OiF3nhFcECiyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=jVF5okI6; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jVF5okI6"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ae43042ea7so98519885ad.0
        for <arm-scmi@vger.kernel.org>; Mon, 09 Mar 2026 15:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773095063; x=1773699863; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hrSbyZBA5Px2iidq6W57qtYbXFOmMx8uhJF7gt5CJ8A=;
        b=jVF5okI6grO3WmYQmX7ieTSbpXd7nFlp0AdRF12AxZtiXqh5Gd9Y915QWbCXNM9YgS
         y71SjSgVb7qQPJJwOgIzm+mTk0TvDUEuzWPdCR0KLzQ1+OMfJB0qLlGT+SpKjTJKKGpN
         XhZpG3UwwoJR6nvdyufAcfNWZo8TCb2GY2t2cbhSZNMdZPWWlQt1FUMKgQhzhIP/GmYV
         /PhwLjSgCbFzWQDL3rstliKTJRC8Nr5GIYmwI6taLvhTJ5jXQMrX97lHYGvrcVKvw5Mh
         WwtxPRoTpvWwHA02z4F1zhd8tjNoy8Bs9IRKfZxwy06WZQec7hsufnL8xiG3qP3V2YjR
         YZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773095063; x=1773699863;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hrSbyZBA5Px2iidq6W57qtYbXFOmMx8uhJF7gt5CJ8A=;
        b=M6wNQ9Gba8Zb6k8tqvfZ5i1EzusCSs4jBCAIXdjygdF/XxGbWX0xmqzNBEOyKKXIW3
         BwglOm2oMjVxijUXWHM6gJ28iB6ld8abuyXZ0iF7H9JSQ7KkEJVbWPDp3Kc1ARfXW33V
         gTemWHhBqmUy6d2Q3Ul7Mis3/QXO82Xt/YNalawjSOoD3RhXWRyLg49DywGz7qfh8DRl
         M+a8VUm2+z9jyNppxQuWK2GiumXtF3b19JdxObgD8mmntKdoTSm/s9pQ3ttWB4UOrCtN
         oLhEO2a9gFl4DFuLnYCKMIJZNvDfxuNJCT8+YhvUhwSsKqrhdJXNOvyfoIaSG/EEUTlW
         tryw==
X-Forwarded-Encrypted: i=1; AJvYcCX93RJCvKyOj+BVITHXK7bIA+2pqY+NcEWn0GE0RkQ5lWVby3tzKvfuNy6AIIIuSm2h8cit6KkO7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9yk8va9i0qb4LOcrVQqbOJS4vYUtvIJQGk0BQkl7tPgpATC29
	ClI4Bgvy2uPl60ZbBXhaY7pddvNgC5ouCsi4O5DsTn76Xg1m0k/fpftVwrpRE7C5KRY=
X-Gm-Gg: ATEYQzwJHVQBMJoY5fHcANcttaMSA19tP9NE/rJfgPYaDRqLlCYZRW31vcVodvJDbWy
	W5Hpasd1hObszdAlFf9gmUSjDHU7KTnGjZrOU8uT4lENdE8gUkIKUmtsfi/csE2FnbZv37AvHQf
	MJPIRqD3KD1n9SaK5QkL/afPpVW2LYDiLLIX0qYGSJKi0NZOOagRJ7GRozzPRYro3nxqbII2Ltr
	qp8N1AgQiIFgiDR+8ncWGIiYQ2N8/+ZeakM3WlMI1uGuSbrt/bUcbklVLOSQWohkW1GwI0YSQGU
	Cd+YKe9APPdOhs6mcttVOjI5PVDqYzptHVY5FObBSRy8eN+OFWlJJ4QR4cEm3git04tbzZeFLHa
	LxJq6+S8DAdCkEFA1Nkg9H3AOVZjkTNCvm4oC0gpnZrD3MycT1vW3seopzx+whiE+yE7S1F+BJT
	ETa4QhLEaIwq9VmFYbSYZi
X-Received: by 2002:a17:902:f78b:b0:2ae:55c1:ba8a with SMTP id d9443c01a7336-2ae823851bamr116227635ad.14.1773095062734;
        Mon, 09 Mar 2026 15:24:22 -0700 (PDT)
Received: from localhost ([71.212.200.220])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83fa2fa5sm130946135ad.70.2026.03.09.15.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 15:24:22 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring
 <robh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Sudeep Holla
 <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v5 1/2] pmdomain: core: support domain hierarchy via
 power-domain-map
In-Reply-To: <CAPDyKFq0JAKc693d+RrPEBCAH--r+gobf822dQ5Ao6f2gnjRrw@mail.gmail.com>
References: <20260122-pmdomain-hierarchy-onecell-v5-0-76855ec856bd@baylibre.com>
 <20260122-pmdomain-hierarchy-onecell-v5-1-76855ec856bd@baylibre.com>
 <20260127151735.GA1699112-robh@kernel.org> <7hjywtzaiy.fsf@baylibre.com>
 <CAMuHMdURxN=kBQHJKnsTVEQPeuB41r5kZy4sgFNqg=U2ynuZMw@mail.gmail.com>
 <7hv7flrb36.fsf@baylibre.com>
 <CAPDyKFq0JAKc693d+RrPEBCAH--r+gobf822dQ5Ao6f2gnjRrw@mail.gmail.com>
Date: Mon, 09 Mar 2026 15:24:21 -0700
Message-ID: <7hqzpszlnu.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ulf Hansson <ulf.hansson@linaro.org> writes:

> On Wed, 25 Feb 2026 at 00:11, Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>>
>> > Hi Kevin,
>> >
>> > Thanks for your series! I became aware of it only recently, and read
>> > it and its history with great interest...
>> >
>> > On Wed, 4 Feb 2026 at 00:13, Kevin Hilman <khilman@baylibre.com> wrote:
>> >> Rob Herring <robh@kernel.org> writes:
>> >> > On Thu, Jan 22, 2026 at 05:14:00PM -0800, Kevin Hilman (TI) wrote:
>> >> >> Add of_genpd_[add|remove]_subdomain_map() helper functions to support
>> >> >> hierarchical PM domains defined by using power-domains-map
>> >> >
>> >> > power-domain-map. No 's'.
>> >> >
>> >> >> property (c.f. nexus node maps in DT spec, section 2.5.1).
>> >> >>
>> >> >> This enables PM domain providers with #power-domain-cells > 0 to
>> >> >> establish subdomain relationships via the power-domain-map property,
>> >> >> which was not previously possible.
>> >> >>
>> >> >> These new helper functions:
>> >> >> - uses an OF helper to iterate to over entries in power-domain-map
>> >> >> - For each mapped entry: extracts child specifier, resolves parent phandle,
>> >> >>   extracts parent specifier args, and establishes subdomain relationship
>> >> >> - Calls genpd_[add|remove]_subdomain() with proper gpd_list_lock mutex protection
>> >> >>
>> >> >> Example from k3-am62l.dtsi:
>> >> >>
>> >> >>   scmi_pds: protocol@11 {
>> >> >>       #power-domain-cells = <1>;
>> >> >>       power-domain-map = <15 &MAIN_PD>,  /* TIMER0 */
>> >> >>                          <19 &WKUP_PD>;  /* WKUP_TIMER0 */
>> >> >>   };
>> >> >>
>> >> >>   MAIN_PD: power-controller-main {
>> >> >>       #power-domain-cells = <0>;
>> >> >>   };
>> >> >>
>> >> >>   WKUP_PD: power-controller-main {
>> >> >>       #power-domain-cells = <0>;
>> >> >>   };
>> >> >>
>> >> >> This allows SCMI power domain 15 to become a subdomain of MAIN_PD, and
>> >> >> domain 19 to become a subdomain of WKUP_PD.
>> >> >
>> >> > One concern I have here is generally *-map is transparent meaning when
>> >> > you lookup <&scmi_pds 15>, &MAIN_PD is returned as the provider. It's
>> >> > also possible to have a map point to another map until you get to the
>> >> > final provider. The only way we have to support both behaviors is the
>> >> > consumer has to specify (i.e. with of_parse_phandle_with_args_map() vs.
>> >> > of_parse_phandle_with_args()), but the consumer shouldn't really know
>> >> > this detail.
>> >
>> > This is also the first thing I was worried about, when I noticed you are
>> > not doing transparent mapping, but add an explicit hierarchy instead,
>> > based on the map.
>>
>> Yeah, the map wasn't my original idea, and TBH, I had never really even
>> heard of nexus node maps before it was suggested by Rob[1] that I could
>> use it to describe hierarchy.
>>
>> But... I'm gathering from Rob's and your recent feedback that my current
>> approach to using a map is an abuse/misuse of the map because it's just
>> being used to describe hierarchy, and because it's not transparent.
>>
>> I'm still waiting to hear from Rob to see if I understood that right,
>> but your feedback is making me think that's the case.
>>
>> If so, I'm honestly not sure where to go next.
>>
>> >> > Maybe a transparent map of power-domains would never make sense. IDK. If
>> >> > so, then there's not really any issue since the pmdomain core handles
>> >> > everyone the same way.
>> >
>> > AFAIUI, SCMI is not limited to the SoC, but may be used for the whole
>> > hardware platform, so it could control power to external devices, too.
>> > Once we need to map a power domain through a connector, we need
>> > support for transparent mapping through a nexus node.
>> >
>> >> I don't really know enough about potential usage of maps to know if
>> >> there's ever a usecase for transparent maps.  However, the problem I'm
>> >> trying to solve is less about transparent maps, and more about
>> >> describing hierarchy in a situation where "leaf" domains of the same
>> >> type (e.g. SCMI) can have different parent domains.
>> >
>> > Hierarchy is indeed something that cannot be described with the current
>> > SCMI power domain management protocol.  This includes external hierarchy
>> > (your use case), and internal hierarchy: AFAIK, Linux cannot be made
>> > aware of the hierarchical relationship among the different power
>> > domains controlled through SCMI either.
>>
>> Yes, the limitations of SCMI (both the protocol, and the Linux
>> implementation) are the root cause here.  In case you didn't see it,
>> before I posted the original version of this series, I started a thread
>> on the arm-scmi list to discuss implementation options[2]
>>
>> So since this is primarily and SCMI limitation, maybe I should just go
>> back to the original proposal of using power-domains-child-ids[3]?
>>
>> I'm definitely open to suggestions here as I'm a bit out of my depth
>> here.
>
> FWIW, I favor re-trying the "power-domains-child-ids" [3] approach.
>
> The main reason is that we already have the "power-domains" property,
> which allows us to describe parents using a list of phandles.
>
> To me, it seems more sensible to extend this with a new
> "power-domains-child-ids" property, which can be used when needed,
> rather than inventing an entirely new property, that would replace the
> existing one.

OK, in the absence of any feedback from the DT maintainers, I'll go back
to the original approach of using `power-domain-child-ids`.

Kevin


