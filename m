Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249F2272E7F
	for <arm-scmi@vger.kernel.org>; Wed,  2 Jul 2025 12:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751458379; cv=none; b=PjL9c1rK0niSdl355hXcaHvS3GB6pkrBKhgqEdXMGrIp55ZxRcCSYLkySyq2aFUjdjgSfmgK2Tr8HZHAmNgdUvescMo4EKtjjV+hBw1nRdHA+VbBtQ7Ua/XAlSLg6jckcZS/EWpheBxy88MrSOyPU/yMKPqbYRV67nv3Lkqualg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751458379; c=relaxed/simple;
	bh=oClDJcT0mTELwPMf1uIqlxpRObpfhkuJDcTpu4d7ylI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n5ZWvopDXl+AcFSytOJHd9VFfZ7ucnsNp+vx+SDxPXSIiM8L9tcLDNt9cn8AQ/H+9J1qig1bA28LcbwoOUwv2bZZuPmz7x02Z/MKShS9z7lENu0NkpDOW7fGpPEGdQ3F75SgNMjIdB4W3eyTfU2Y+qmmgcDo/yn45e3TvaxgIHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZU28WMT7; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZU28WMT7"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-713fba639f3so66492197b3.1
        for <arm-scmi@vger.kernel.org>; Wed, 02 Jul 2025 05:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751458377; x=1752063177; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9gk4s+SONPpEB34QsQQb13XEXrE5uFgXKOQWW3pBsTo=;
        b=ZU28WMT7BcvN/b+AqfWX8nv6lqhMzC6PC4DdDm2j5uJVs79wLIa8LdUIviL6C7YjL1
         GMcdbXoY3xo7hW5zBHIE7xHjDNz9r4ZaFjXE1bzPil/JUC9UhKGyVUsfzZOZ8inqN62J
         Plfj2RXo6eL4sNHPV3cRUhwPnOZwi/6vgEOm71FPCvOVNe04b20L9eUMFXx/E8l4Wdrf
         qIPn+QAgvh8pxl252LaP3bHn8u+W2uqnpIdTf9lQE1vZhAf15zV6jipEMgbUJ86xWPJu
         rwUOYzW9qguirxoq7aqMyOfL+8vxyxu+V+dddJOj13U55QcP4o79Zjdwi97WpQfRUy+Z
         1rZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751458377; x=1752063177;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9gk4s+SONPpEB34QsQQb13XEXrE5uFgXKOQWW3pBsTo=;
        b=rA1jTTcki0GZnw4wYCBQwh7rkcxOE+HnNj8X0EakGyy4LWLA8x7dtH1qCL326qbNWY
         dblp12wyBJC6dJPRchM2fTrHwimRs0e2RvjsXwWS3kWEhrHQPuQ0hWf1tYYBl0PWDdQf
         hlGM7S4eI9XiPKsf5/qMDfVy76VGDtwCAp52r/UtjirVBWCkvrYvxhA07NbjFDiuvBka
         CCICoEoaFz8sw1F3EoiIjyoNvKWXnFMrbeH7ttH7SC/hzKucBDAqO9+o+2ljPNeZr6Ih
         4kb0/hMnsBPWSURZeXpPFj9e0JK1XQCz9qlKBXG5msPPGS7i94T2TcXnfCqwzkTbZ1SD
         8Xcw==
X-Forwarded-Encrypted: i=1; AJvYcCWO2cBwBJ/zeiPMuvfPSMilcOB/fzBt9fdArUfSOJS8huI3hGWq8Q+3RBU8xCXEBT8FX/e8b8Halg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRVfhLkuPDBtRtO34/2BqWOgMdVGLmzK1zpqQ5ni6Cb8Qk1uhn
	sIikV2MPDMG6sAiya4wD5IRSCmULF4jAZsSDEL9qLr+rzuERGAdyxjS1RHQb3jxAcVhiT+wUNc+
	7VGUcdbNKJAgh4VLMgVsL9Mw9CQg5VZQlNj+Dffj/q1P4BTkxmnGShvs=
X-Gm-Gg: ASbGnctTju43kX6j1L8g43S62tq53GrtOQajJJNzHmPWXZRWIJgyMfoPV/k1j0qG5E6
	J529PmqqCxc3kwRJ+5MXPoCbr0WKOOR9Hq8xIUVhgsS+M0VTRwxj1Fz7xKqArge4RyTo39as4sq
	8TWAVnZk6VA7ohivBCJa7pCpLr+baz42n8y6gTDEk0cT0ysrt4qt4jGFA=
X-Google-Smtp-Source: AGHT+IG3NWai+ZP/un1xZG3CzZCkLzSMLJaFL3JR+EQ/9jK23FydSpvbz+8ZOtgLz/en/MyFioW+0zHkRi1p3FqLmno=
X-Received: by 2002:a05:690c:4a0b:b0:6fb:a696:b23b with SMTP id
 00721157ae682-7164d571f91mr35480447b3.33.1751458376965; Wed, 02 Jul 2025
 05:12:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613-pmdomain-hierarchy-onecell-v3-0-5c770676fce7@baylibre.com>
 <20250613-pmdomain-hierarchy-onecell-v3-2-5c770676fce7@baylibre.com>
 <CAPDyKFrO9rb0eDb2qO+EGaVjOFG=7emgca8511XACDhWY=dt5g@mail.gmail.com>
 <7hsejzp4xg.fsf@baylibre.com> <CAPDyKFo-iPBPgkM43q+5cGR2sptkLk4E6TAERCQbCu24o1RfFQ@mail.gmail.com>
 <7hcyb1os9y.fsf@baylibre.com> <CAPDyKFpTgAmLBq2ZExPoxWM0wL756zH96vW7M6wHSA1MTTG1wA@mail.gmail.com>
 <7hjz4tnlg6.fsf@baylibre.com>
In-Reply-To: <7hjz4tnlg6.fsf@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 2 Jul 2025 14:12:20 +0200
X-Gm-Features: Ac12FXx099YexnSX3D-jd8HuUZnwt5D-jZ9PNizBBy6pBlCC473WjWV1dygsTok
Message-ID: <CAPDyKFrY2kNaP=Hk-81B4WEGxyKUTYqBWJHQKtHnyTPWTFUOEQ@mail.gmail.com>
Subject: Re: [PATCH RFC v3 2/2] pmdomain: core: add support for subdomains
 using power-domain-map
To: Kevin Hilman <khilman@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 30 Jun 2025 at 20:17, Kevin Hilman <khilman@baylibre.com> wrote:
>
> Ulf Hansson <ulf.hansson@linaro.org> writes:
>
> > [...]
> >
> >> I've done an implementation with struct device_node *.  This works
> >> better (IMO) than struct of_phandle_args * because the caller (in my
> >> case scmi_pm_domain.c) already has device nodes, but not phandle args.
> >>
> >> The result will be that the pmdomain helper will call
> >> pm_genpd_add_subdomain() instead of of_genpd_add_subdomain().
> >>
> >> Below[1] is the current working version, which includes adding the
> >> helper to the PM domain core and showing the usage by the SCMI provider.
> >>
> >> How does this look?
> >
> > It's a lot better in my opinion. Although, I have a few comments below.
> >
> >>
> >> Note that doing this at provider creation time instead of
> >> <genpd>->attach_dev() time will require some changes to
> >> of_parse_phandle_with_args_map() because that function expects to be
> >> called for a device that has a `power-domains = <provider>` property,
> >> not for the provider itself.  But I have it working with some local
> >> changes to make that helper work if called for the provider directly.
> >> If you're OK with the PM domains approach, I'll post another rev of this
> >> series which includes the OF changes for review by DT maintainers.
> >>
> >> Kevin
> >>
> >> [1]
> >> ---
> >>  drivers/pmdomain/arm/scmi_pm_domain.c | 12 ++++++++--
> >>  drivers/pmdomain/core.c               | 34 +++++++++++++++++++++++++++
> >>  include/linux/pm_domain.h             | 11 ++++++++-
> >>  3 files changed, 54 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
> >> index a7784a8bb5db..8197447e9d17 100644
> >> --- a/drivers/pmdomain/arm/scmi_pm_domain.c
> >> +++ b/drivers/pmdomain/arm/scmi_pm_domain.c
> >> @@ -54,7 +54,7 @@ static int scmi_pd_power_off(struct generic_pm_domain *domain)
> >>
> >>  static int scmi_pm_domain_probe(struct scmi_device *sdev)
> >>  {
> >> -       int num_domains, i;
> >> +       int num_domains, i, ret;
> >>         struct device *dev = &sdev->dev;
> >>         struct device_node *np = dev->of_node;
> >>         struct scmi_pm_domain *scmi_pd;
> >> @@ -115,7 +115,15 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
> >>
> >>         dev_set_drvdata(dev, scmi_pd_data);
> >>
> >> -       return of_genpd_add_provider_onecell(np, scmi_pd_data);
> >> +       ret = of_genpd_add_provider_onecell(np, scmi_pd_data);
> >> +       if (ret)
> >> +               return ret;
> >> +
> >> +       /* check for (optional) subdomain mapping with power-domain-map */
> >> +       for (i = 0; i < num_domains; i++, scmi_pd++)
> >> +               of_genpd_add_subdomain_map(np, domains[i], i);
> >> +
> >> +       return ret;
> >>  }
> >>
> >>  static void scmi_pm_domain_remove(struct scmi_device *sdev)
> >> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> >> index 88819659df83..3ede4baa4bee 100644
> >> --- a/drivers/pmdomain/core.c
> >> +++ b/drivers/pmdomain/core.c
> >> @@ -3220,6 +3220,40 @@ int of_genpd_parse_idle_states(struct device_node *dn,
> >>  }
> >>  EXPORT_SYMBOL_GPL(of_genpd_parse_idle_states);
> >>
> >> +int of_genpd_add_subdomain_map(struct device_node *np,
> >> +                              struct generic_pm_domain *domain,
> >> +                              int index)
> >
> > Providing the struct generic_pm_domain *domain as an in-parameter for
> > the child-domain seems unnecessary and limiting to me.
> >
> > Instead I think we should parse the power-domain-map DT property at
> > 'index', to find the corresponding child-domain's specifier/index and
> > its corresponding parent-domain.
> >
> > In other words, we don't need the struct generic_pm_domain *domain as
> > an in-parameter, right?
>
> I'm not sure I follow.  The `struct generic pm_domain *domain` is the
> SCMI child domain.  From the map, we use the index to find the parent
> domain.  And then we add the child as a subdomain of the parent.
>
> Are you suggesting that I (re)parse the DT for to find the child domain
> also?

Correct!

The DT property ("power-domains-map") that you added in patch1/2,
contains all the information so let's just parse it and assign
child/parent domains based on it.

Kind regards
Uffe
