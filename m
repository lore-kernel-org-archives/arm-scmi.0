Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43143DF016
	for <arm-scmi@vger.kernel.org>; Fri, 10 Apr 2026 22:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775859936; cv=none; b=CtElQqTkA7bjdDCIG7QAGi/nK7NJRrhsSv/mvPDzcTNocC+VgzhK+R6qZaTaZzlthP4R3o13l09JSJlWx4aQjQgLbFiD+kxd1bmtvQnMcBRXoB5pOlZ45h4JfxRTWnsaPlmlWUopjCT9MFLLOoh3f28fhDm2juuVK3GRlSuE4fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775859936; c=relaxed/simple;
	bh=VyA6DGW+xjcM8w3yvxfoOhS0/P19nFSdUahGjkQPHuM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=L90vcgKmjM6SdyClz3MJKM/6lkpJ0SrdnfSqgbwL6XunqRyUGbxt0yVZDEArAZgE+CvDpuz98IcykZhFO51Vi0io6E5AGvvBuHAg7sfKgYboONaa0zjEeR7LnMQPF0lfCIm7vxMB4Vy99TB4SdSGulU1TOOcUlcsxMfkaeJ42IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=tZZhSJ/4; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="tZZhSJ/4"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35d9749c26dso2357121a91.2
        for <arm-scmi@vger.kernel.org>; Fri, 10 Apr 2026 15:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775859933; x=1776464733; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=oO2Iz58ZlsFu3Y4x3hOSK/rbD3OpjMOM0bJqqqYROA0=;
        b=tZZhSJ/4R+5CHY/dqaR4l61LKPlkhiburEkOpWmYMbSbcG5G5DR7bmKuNGByjHhMH/
         HzzhjqhHEi4UDQCncvZT4McmyY8emB7Qn6NLjsAydOXljf8NNXy81l0QTVrys9ZkdIg4
         cALelPen9QiqeDPBciHIwry2XjM2yu7+u+HptSyxz+FG0NFvFYbvQdZPPbzuGwqzuL8k
         GLJ8C33l49DMucA7PINJSdNso+w8JFitA4aHwkmGoqqCWmBWQuziakltLfdPD45yXDVL
         rOn4H3xSmORXu2j0vKpRYs1BKFL2hulDWy312xmoApa+QlYS9eRJ85ZCGF1IZ1gxjosh
         Earw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775859933; x=1776464733;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oO2Iz58ZlsFu3Y4x3hOSK/rbD3OpjMOM0bJqqqYROA0=;
        b=qmIirft2rQWcXbO31hZByi3Q7DgoZqhxPCEaCdnY0BXD962FYdfYUN3A2Pm7F7/xeG
         xhEliCzDcMaCOGdIZKN5EVXyv64PcBFK8lh1nZCu9Sj0Vf2WE2JI4hB/f09gFIiyK4aQ
         llYRDPoq+uKGxI+xtTRZN4irfdQw6vpjiPc0L0GXljEYQPtNCCD6jFwwO1sRD4XSIXJy
         Z9xzCW4/++SLcY1mIt7jdL5+OlMDcbI2yRYtICohox3MIleSXRPKcIwgmTyiggO7S62M
         hKqm99adP+wCGZ7VgytYY5d+aknIZCGFiu63xzdmaJU6npg3iwjc0Y/C/qqdfvZyCAPa
         hvqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsZaViYTMirknp1OoqI86P2P0JobRm8m9yW3080b9HQOJV4/R4GLPx+zLlXze3drJ0AySKJPsRXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFgTmv5iPOd6jw3k5mHC8qkm2G/z9q+MDKad8wZFMENmfDWXaT
	Ny5pP5BVL5DgVS+ioWIRlTHcCbr6oBR+Lri4+QIDN+gpvqSnI5huZ6QqUyVtvIAuw6A=
X-Gm-Gg: AeBDietnsT2UwayNibnIzBgNTzaiPWRBJ9wjCkwH3FIUaf95ybqcP3azU4YskuDQOGY
	baGMsub6WVw7w9nNSJLwjmLK1KuzBYI9/yMb1Jk3K9tjnMNH/xBZrJhqZYR5vWQqQaJZUDUXN+I
	2G2rRYXoJpMzn5jM5DXITppduqjgEC6EZ4qcQ+TP4aFYs4Iv+rodRCEESp+gRgToIO98VUDruvh
	Pf+66E+7d16nwD0l86Nh5V/CpK8/OI8nY3fBxbmohVUyg5SGlWJB9ZkHrRkOMNWWqqKJieumahh
	fLGBQqS88L7ld1N0FWzwxTGXPZlOqK9jK5tkr96dj4dr5Kz/kYtbc2jrkk91U+Q+3vRhI1WFqbY
	/owYr0o2kmhjBUz/7RGIHN9qSm79roRIlUZxcrV2ZUylGbwaCCUggo1RWsWNX2Wu2expRKl//Zo
	jmcKXsw0t4fL9Q6l+1VsM=
X-Received: by 2002:a17:90b:35cd:b0:359:1130:1047 with SMTP id 98e67ed59e1d1-35e428524cbmr5346124a91.17.1775859933169;
        Fri, 10 Apr 2026 15:25:33 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e41336a20sm6073059a91.14.2026.04.10.15.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 15:25:32 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] pmdomain: core: add support for
 power-domains-child-ids
In-Reply-To: <CAPDyKFrR2zyMFXTAkKs1XRgB-u5jSP256g730s=7SLuOZKsKVg@mail.gmail.com>
References: <20260310-topic-lpm-pmdomain-child-ids-v1-0-5361687a18ff@baylibre.com>
 <20260310-topic-lpm-pmdomain-child-ids-v1-2-5361687a18ff@baylibre.com>
 <CAPDyKFquJ7K4NcWuKMr1sjrnFVVPGAeLCiSF_FhvJf9Frbn1uA@mail.gmail.com>
 <7h4iljskvz.fsf@baylibre.com>
 <CAPDyKFrR2zyMFXTAkKs1XRgB-u5jSP256g730s=7SLuOZKsKVg@mail.gmail.com>
Date: Fri, 10 Apr 2026 15:25:32 -0700
Message-ID: <7hqzomqwpv.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ulf Hansson <ulf.hansson@linaro.org> writes:

> On Fri, 10 Apr 2026 at 02:45, Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> Ulf Hansson <ulf.hansson@linaro.org> writes:
>>
>> > On Wed, 11 Mar 2026 at 01:19, Kevin Hilman (TI) <khilman@baylibre.com> wrote:
>> >>
>> >> Currently, PM domains can only support hierarchy for simple
>> >> providers (e.g. ones with #power-domain-cells = 0).
>> >>
>> >> Add support for oncell providers as well by adding a new property
>> >> `power-domains-child-ids` to describe the parent/child relationship.
>> >>
>> >> For example, an SCMI PM domain provider has multiple domains, each of
>> >> which might be a child of diffeent parent domains. In this example,
>> >> the parent domains are MAIN_PD and WKUP_PD:
>> >>
>> >>     scmi_pds: protocol@11 {
>> >>         reg = <0x11>;
>> >>         #power-domain-cells = <1>;
>> >>         power-domains = <&MAIN_PD>, <&WKUP_PD>;
>> >>         power-domains-child-ids = <15>, <19>;
>> >>     };
>> >>
>> >> With this example using the new property, SCMI PM domain 15 becomes a
>> >> child domain of MAIN_PD, and SCMI domain 19 becomes a child domain of
>> >> WKUP_PD.
>> >>
>> >> To support this feature, add two new core functions
>> >>
>> >> - of_genpd_add_child_ids()
>> >> - of_genpd_remove_child_ids()
>> >>
>> >> which can be called by pmdomain providers to add/remove child domains
>> >> if they support the new property power-domains-child-ids.
>> >>
>> >> Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
>> >
>> > Thanks for working on this! It certainly is a missing feature!
>>
>> You're welcome, thanks for the detailed review.
>>
>> >> ---
>> >>  drivers/pmdomain/core.c   | 169 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>> >>  include/linux/pm_domain.h |  16 ++++++++++++++++
>> >>  2 files changed, 185 insertions(+)
>> >>
>> >> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
>> >> index 61c2277c9ce3..acb45dd540b7 100644
>> >> --- a/drivers/pmdomain/core.c
>> >> +++ b/drivers/pmdomain/core.c
>> >> @@ -2909,6 +2909,175 @@ static struct generic_pm_domain *genpd_get_from_provider(
>> >>         return genpd;
>> >>  }
>> >>
>> >> +/**
>> >> + * of_genpd_add_child_ids() - Parse power-domains-child-ids property
>> >> + * @np: Device node pointer associated with the PM domain provider.
>> >> + * @data: Pointer to the onecell data associated with the PM domain provider.
>> >> + *
>> >> + * Parse the power-domains and power-domains-child-ids properties to establish
>> >> + * parent-child relationships for PM domains. The power-domains property lists
>> >> + * parent domains, and power-domains-child-ids lists which child domain IDs
>> >> + * should be associated with each parent.
>> >> + *
>> >> + * Returns 0 on success, -ENOENT if properties don't exist, or negative error code.
>> >
>> > I think we should avoid returning specific error codes for specific
>> > errors, simply because it usually becomes messy.
>> >
>> > If I understand correctly the intent here is to allow the caller to
>> > check for -ENOENT and potentially avoid bailing out as it may not
>> > really be an error, right?
>>
>> Right, -ENOENT is not an error of parsing, it's to indicate that there
>> are no child-ids to be parsed.
>>
>> > Perhaps a better option is to return the number of children for whom
>> > we successfully assigned parents. Hence 0 or a positive value allows
>> > the caller to understand what happened. More importantly, a negative
>> > error code then really becomes an error for the caller to consider.
>>
>> I explored this a bit, but it gets messy quick.  It means we have to
>> track cases where only some of the children were added as well as when
>> all children were added.   Personally, I think this should be an "all or
>> nothing" thing.  If all the children cannot be parsed/added, then none
>> of them should be added.
>>
>> This also allows the remove to not have to care about how many were
>> added, and just remove them all, with the additional benefit of not
>> having to track the state of how many children were successfully added.
>>
>
> I fully agree, it should be all or nothing. Failing with one
> child/parent should end up with an error code being returned.
>
> That said, it still seems to make perfect sense to return the number
> of children for whom we assigned parents for, no?

No, because what will the caller use that number for?  If we are
assuming "all or nothing", what would we use it for (other than a debug print?)

It also makes it a bit confusing what a zero return value means.  Does
that mean success?  Or that zero children were added (which would be
fail.)

I prefer to keep it as is.

Kevin
