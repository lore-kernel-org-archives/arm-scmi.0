Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230B01DC1AB
	for <arm-scmi@vger.kernel.org>; Fri, 10 Apr 2026 08:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775811485; cv=pass; b=nZgrJo4TpaaFufHDjxtsRohw5lFfJgTSVo8v3OlRijb8OxMwZyg+4uoojHbNuZ74T/TaYL0uh6T02twYTXRnn+cycLv8yNTAV851/JQe9jnpr/aMzgWYZsK+4sdwixlNI/B0/C5YvdPv8akKIQBg+ZoeFsilgrNgi21QFgDvIqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775811485; c=relaxed/simple;
	bh=iaYKT1sl2Tr/cLZwPA0Zvqg9ubw9wCPbruk9AwA0cek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OKcwVIDYzmA0l1D77ATgDnyx5Z3hUrKQEFe2lYhhlXNvedtFd0tMTzwFLFBmhd6sAw8HNMpW29g9v29yDLzFVGEBugqNhV9hoVt3XhO0meWeH+fdWn8lmVKIVFIjq+9V+FrCymmnSxWq36uksyscdmNUF/2MPpwr/TtDXL5wMGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qW/kT/NF; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qW/kT/NF"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38cbb1ad0b6so16169011fa.2
        for <arm-scmi@vger.kernel.org>; Fri, 10 Apr 2026 01:58:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775811482; cv=none;
        d=google.com; s=arc-20240605;
        b=jZFVphiOnDOqgF+uHMW69nQ8iQWnBb2awcwQfF/6cHSLqnZiyduRqEv5OanFloSSw2
         vY3JK2t4pfBEh/P3tqlx26LoVjqVEQVIRX4ynaO5GPSauvLai5TR9dmFtVBiDSf0yUvK
         zGnXGRVkw+VnsRPtjJDdNhCsZxHJWedgEx98ABeirC9SMPQv5WpJ6uTUn3bozrjzoL7k
         /nr7sYpEDhRB0wL6TEgmlhbg8GNMlpMFODum06RcuxcDRP+B9hA3Z+9kMiKRuJhshGC1
         Ja9pVD8ALKlJBB6ti9aqZU/vvQfCBYhM0zvTPd678E4frzlyJVVuJwUh8Na/+v9fvOZO
         iZSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Z1vmmkZcYrQbBuSPIBwVZCij2+2X5p9lbMUk5Tsb6wM=;
        fh=QLyB9ZO7b7sA+X/UUiSfLWphnud698f/1Yl2WGCWUgk=;
        b=DJeQYqYO1liACfr0O18HTt05nulcVRAxCudJbEbKFUZij9tb9pqK7OSXJtYZx+lF3p
         HZzMPP63sPW2I6/t4a40QT/OndI53tnjlZAyTRr9H0gtbW93NKjSj6IZK7BdDWHJi5a5
         AlA/Akg5R4G7Ehxrq9AkX9f6wnDMnvxwekXZzmAaBS5lJEKsmmjc+M0Fqb9lLZa9ndKL
         /XIYZjQn7r6izm0VR+Fkt9T41R5h1W+zHXSiP8bsS43AN11KNx1awZYwlZah5vLITNSO
         a1kvVxqpT/20xGmVi5Ah3ko5cNfJ8tDVVkuar7pR4eciYbryU2K0aCVMU6eMppAXNLzT
         A73A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775811482; x=1776416282; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1vmmkZcYrQbBuSPIBwVZCij2+2X5p9lbMUk5Tsb6wM=;
        b=qW/kT/NFo+XhkEqKBwLgGwFMLH+rH4rsWbCuYQHqlqBoIVsGX3AFU8FsJ5LyrqMCgG
         u92Rw8ZKiwWCdVr5TrFD6S2Q3lVNWvAwtBiazEHryzoWM68NyEO3tEZnsuMlG94qPAaS
         REZjxiVsOILaxQzEsmhRI72TSVZia7M8617I8HHJmiQwAUwYsfJjHTHu+GiehjhH9V+x
         CcjNZzJGVadFLKT4V9EPy5EPxtzSba0ZySbSZ2s2xXc3ELq7zTclCF7ufUKFEeoUvt26
         gCsJlqO6pG2y6xGY5DqKd4T8xd847j+lbuibBPZ9HLAFJl2NsXEWieUjMOSmtuJVGnaa
         rAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775811482; x=1776416282;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z1vmmkZcYrQbBuSPIBwVZCij2+2X5p9lbMUk5Tsb6wM=;
        b=iFCmJoxGI8IjeHjK2sP6p7Naia10yLPpYdRwZNUVgVfZd32OAyyKz2ehypdEgek/9b
         WgsI8/BDEc7IZDANNiH8IgpI4fZxUocsb57tpfXjlESh1vDhstQuTfyJF9DypZi9Fo4S
         zLxZG+ATDXBRAIHoXpvBs6s3sd30AqUHnxvhNSuIbS/Zv0aIPkmOG3KJkGGZyiBy2RiN
         +AWM+bhot28YdYagTDWU5SUnFryWf9jLOpCVnpdlGdQDZdYGRJUNiff2D++0rdvHtTJU
         35t+qkjnTjsFEs7QrTrqwFB3CvEXIUNBuKweNDFH4U7kngKs5iJDfHD7GHpMvBg833tn
         bJ1w==
X-Forwarded-Encrypted: i=1; AJvYcCWmCWZxEiqGT4MLln/YaAb6LMGh7L/Ag8VO9A2MB2KSv+5gL8n25Y8fuQNJFeq4YkZdFGge74R1xA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7GpGpWFLlNF0litj9HSbBoILPzKX7saJGunvATd0K0/H79Z25
	y3XcVAbaSF5equfcqi6evplp8SJgcmuYEA/dTLqhPqmVwGVPQkyzGCafXMIvjWIMOqpF6wcf8bd
	BrkHplqgTUUKvX4825bz1mdhqITny86Odc5YNYQCzEg==
X-Gm-Gg: AeBDieuDsPVgQexD/wIRiFYFc8mPF04XsBx8TrXZkA7R/jsruEBCKAwtGSBJevlVz7h
	ZEEgGXfF40Co4K6Qa+EL3/VYwqbHOTa4Gd0nnKkBgStDejGHgJvhugZ9SeNPlf48grBJ+WILXZQ
	LQ6/lgFJNXlIh6sWb+6WdR1d9oHiU+Vr3m31/NgRCAm85QZ3KDUsEAVDRNb9wdorMgnZv9STWDD
	fQ8UkrVQ6cyPPUIOX9ABx31sTGghUQ/lT1siC65aMYiWbLw7N1LeNLOSoybCqvbhxeKVBxg7SDH
	ZPizInQW
X-Received: by 2002:a05:6512:1396:b0:5a2:c8d9:ec4a with SMTP id
 2adb3069b0e04-5a3ef9127demr836109e87.19.1775811482189; Fri, 10 Apr 2026
 01:58:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-topic-lpm-pmdomain-child-ids-v1-0-5361687a18ff@baylibre.com>
 <20260310-topic-lpm-pmdomain-child-ids-v1-2-5361687a18ff@baylibre.com>
 <CAPDyKFquJ7K4NcWuKMr1sjrnFVVPGAeLCiSF_FhvJf9Frbn1uA@mail.gmail.com> <7h4iljskvz.fsf@baylibre.com>
In-Reply-To: <7h4iljskvz.fsf@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 10 Apr 2026 10:57:24 +0200
X-Gm-Features: AQROBzDhT0oW3z8LEIG1Euo0M3-dmugaTMajHzsT9TLnPM4O-8m4J3dOe0QMXE4
Message-ID: <CAPDyKFrR2zyMFXTAkKs1XRgB-u5jSP256g730s=7SLuOZKsKVg@mail.gmail.com>
Subject: Re: [PATCH 2/3] pmdomain: core: add support for power-domains-child-ids
To: Kevin Hilman <khilman@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Apr 2026 at 02:45, Kevin Hilman <khilman@baylibre.com> wrote:
>
> Ulf Hansson <ulf.hansson@linaro.org> writes:
>
> > On Wed, 11 Mar 2026 at 01:19, Kevin Hilman (TI) <khilman@baylibre.com> wrote:
> >>
> >> Currently, PM domains can only support hierarchy for simple
> >> providers (e.g. ones with #power-domain-cells = 0).
> >>
> >> Add support for oncell providers as well by adding a new property
> >> `power-domains-child-ids` to describe the parent/child relationship.
> >>
> >> For example, an SCMI PM domain provider has multiple domains, each of
> >> which might be a child of diffeent parent domains. In this example,
> >> the parent domains are MAIN_PD and WKUP_PD:
> >>
> >>     scmi_pds: protocol@11 {
> >>         reg = <0x11>;
> >>         #power-domain-cells = <1>;
> >>         power-domains = <&MAIN_PD>, <&WKUP_PD>;
> >>         power-domains-child-ids = <15>, <19>;
> >>     };
> >>
> >> With this example using the new property, SCMI PM domain 15 becomes a
> >> child domain of MAIN_PD, and SCMI domain 19 becomes a child domain of
> >> WKUP_PD.
> >>
> >> To support this feature, add two new core functions
> >>
> >> - of_genpd_add_child_ids()
> >> - of_genpd_remove_child_ids()
> >>
> >> which can be called by pmdomain providers to add/remove child domains
> >> if they support the new property power-domains-child-ids.
> >>
> >> Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
> >
> > Thanks for working on this! It certainly is a missing feature!
>
> You're welcome, thanks for the detailed review.
>
> >> ---
> >>  drivers/pmdomain/core.c   | 169 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >>  include/linux/pm_domain.h |  16 ++++++++++++++++
> >>  2 files changed, 185 insertions(+)
> >>
> >> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> >> index 61c2277c9ce3..acb45dd540b7 100644
> >> --- a/drivers/pmdomain/core.c
> >> +++ b/drivers/pmdomain/core.c
> >> @@ -2909,6 +2909,175 @@ static struct generic_pm_domain *genpd_get_from_provider(
> >>         return genpd;
> >>  }
> >>
> >> +/**
> >> + * of_genpd_add_child_ids() - Parse power-domains-child-ids property
> >> + * @np: Device node pointer associated with the PM domain provider.
> >> + * @data: Pointer to the onecell data associated with the PM domain provider.
> >> + *
> >> + * Parse the power-domains and power-domains-child-ids properties to establish
> >> + * parent-child relationships for PM domains. The power-domains property lists
> >> + * parent domains, and power-domains-child-ids lists which child domain IDs
> >> + * should be associated with each parent.
> >> + *
> >> + * Returns 0 on success, -ENOENT if properties don't exist, or negative error code.
> >
> > I think we should avoid returning specific error codes for specific
> > errors, simply because it usually becomes messy.
> >
> > If I understand correctly the intent here is to allow the caller to
> > check for -ENOENT and potentially avoid bailing out as it may not
> > really be an error, right?
>
> Right, -ENOENT is not an error of parsing, it's to indicate that there
> are no child-ids to be parsed.
>
> > Perhaps a better option is to return the number of children for whom
> > we successfully assigned parents. Hence 0 or a positive value allows
> > the caller to understand what happened. More importantly, a negative
> > error code then really becomes an error for the caller to consider.
>
> I explored this a bit, but it gets messy quick.  It means we have to
> track cases where only some of the children were added as well as when
> all children were added.   Personally, I think this should be an "all or
> nothing" thing.  If all the children cannot be parsed/added, then none
> of them should be added.
>
> This also allows the remove to not have to care about how many were
> added, and just remove them all, with the additional benefit of not
> having to track the state of how many children were successfully added.
>

I fully agree, it should be all or nothing. Failing with one
child/parent should end up with an error code being returned.

That said, it still seems to make perfect sense to return the number
of children for whom we assigned parents for, no?

[...]

> >> +int of_genpd_remove_child_ids(struct device_node *np,
> >> +                          struct genpd_onecell_data *data)
> >> +{
> >> +       struct of_phandle_args parent_args;
> >> +       struct generic_pm_domain *parent_genpd, *child_genpd;
> >> +       struct of_phandle_iterator it;
> >> +       const struct property *prop;
> >> +       const __be32 *item;
> >> +       u32 child_id;
> >> +       int ret;
> >> +
> >> +       /* Check if both properties exist */
> >> +       if (of_count_phandle_with_args(np, "power-domains", "#power-domain-cells") <= 0)
> >> +               return -ENOENT;
> >> +
> >> +       prop = of_find_property(np, "power-domains-child-ids", NULL);
> >> +       if (!prop)
> >> +               return -ENOENT;
> >> +
> >> +       item = of_prop_next_u32(prop, NULL, &child_id);
> >
> > Similar comments as for of_genpd_add_child_ids().
> >
> > Moreover, I think we should remove the children in the reverse order
> > of how we added them.
>
> I'm curious why does the order matter?  The children are all siblings
> (no hierarchy), so why would the order be important?

It might not be that important, but generally, it seems like a good
idea to me to reverse the order when undoing things.

>
> I'm not ware of a phandle iterator/helper to parse in the reverse, so
> that would mean iterating once to create a list, and then walking it in
> reverse.  Seems unnecessary.

Sure, I leave the call to you, to see what fits best.

Kind regards
Uffe
