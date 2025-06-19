Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915943085D8
	for <arm-scmi@vger.kernel.org>; Thu, 19 Jun 2025 10:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750327500; cv=none; b=mxRGQSTfUn/NepWLrOoYTbCCb5PJ8Jlt9K+vGE7lagJk6IzsycnW100U5Y/hpN8RFGFblejNObxQ9lnEAAYsHqQT8+G6l4+6H7iISb2HWdtrdN4fncmVZrZg+w1wBqOJ3X5KR3GzgUmqE6jjbo5fRjyUabsUlpxxG9VJ6XkoOqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750327500; c=relaxed/simple;
	bh=tdMAbhPQTcGXi1UssnQDHXNksrG7aVj8zIgB9nrU75Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IbkrONM+omonl8ZxTweLRmp6xAinF1Pt9Zrl/rica47glho2Z127+wsE3Gl/qG4gKmJ2f5tzx/v4dBskHwOtKPU36UBPPyNRGzHmLEiy5UZOT4Vh6cdmWXfCtQkoSI7dySje8WJ1b/84lglagInraIdvaQmIpPgvUdZTb1aEpl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fEIlanEa; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fEIlanEa"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e7db6aaef22so500716276.0
        for <arm-scmi@vger.kernel.org>; Thu, 19 Jun 2025 03:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750327497; x=1750932297; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ToWDKqwq6TQTFZawAem1IafhXbghUBTkYP+ofAOkPVs=;
        b=fEIlanEaDLR6d6pnv6YsfwYb6bV6AIyOSG7A9Mgeqs3NYR/jx2pOrOmt/YPZNBWXDS
         A19fbvwClucORunIeoYe5+82KQ296Y18g/ju4gl8r9em41esN5upiJRJYIjmivPa8D0V
         ZwhpgPLJVKFg6bX8pdjAgOXHfiWkUZdQ3DEtfij5IIKKET7d21NGdMJPc21Dgkg7ha2J
         8VuljJj13gtJ0fCnb0gGN0YCMZ24dp6ZHwe5jYuMHNoJY8Dy3rSqKOcDUsIseQIj0W9u
         /sjMlaIzI4IIDAiN2EVFfQpiSWvq8wkcl8C8PJR7eMKo6CeiZRmQ3W0/1YKchjA9dM0a
         8DaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750327497; x=1750932297;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ToWDKqwq6TQTFZawAem1IafhXbghUBTkYP+ofAOkPVs=;
        b=VrfkL+GgnBLgl1f0aE9Zz9O4/yPjYk2PUci1FT46+xxMY3g2yPGMsMrhQoj3gdHHHX
         +ApAaj8qOKPbyWWdvEDnPgg8k+3/oJb1fmJ/4wfo5WJ3l3wGaVi63/l0tRswh5T22b00
         xX6o02kA6cPlKrQ9skVm1x7oamJYdGMqhWCqF/ozbvVtNFjxaeKZS8P0i+9MV9IIxCXc
         LyCum2VysjZ/BXglwedGMR19SXT+pQVOMLDxHRKnrt2gB8QaNyKddl52QIpgj/ZDpSaJ
         fyZYtuIkKE4V0UV0UB937oH/nsgtWXDBAf4j/UfLFUZ5jYJ1gEqgpe8c9bpZx+/wfMgO
         9mbg==
X-Forwarded-Encrypted: i=1; AJvYcCWeoleQRL5GEwsTY3ctwHSUqmQYlpz4SQWglx+CZKF6LGHGhscw+7Vw88PDYgxTmneBoJhnuboMFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAQyMPcpfkRwUEWFiAa+KBjMOqdEW5B/cNFbr10NTVUUndxWXc
	Dyirqx1XEPoLSmB/v5xKd8Rzg18LWeuTw8WqXGt9NV9dUdoPvsT0k5ZJKluNNQCc/3etcWtr9Wa
	uyNldzaLrgYZL4jiC5JTlOAj2Fmr4BZvnscDFeM2v7g==
X-Gm-Gg: ASbGnct8USo+TQyp+/53n2FF/tGb61Of7tmZkSH1Z1a8QBHB9QIjp9sx0LHUrfPPObn
	74/4zsNx0r5ReB+Wiy4nZqq9aL405rh17qwPktOutc1Kb7yifQkwYHyO40K2wxARWBRxM40txxx
	atzbbSxTHX8wTxWrHEaPqR+kHfnzIzbTsk9o9JM+i9FMi+
X-Google-Smtp-Source: AGHT+IFwUmxXN660xH5otX87tgJPoeNzcFnCMd0GkgVnYsM17jUGSMmwnzIA5d4bv6WDms0UsjHHLVt0juG0jW9LH0w=
X-Received: by 2002:a05:6902:1501:b0:e84:13c9:67d7 with SMTP id
 3f1490d57ef6-e8413c968e3mr6203862276.20.1750327497509; Thu, 19 Jun 2025
 03:04:57 -0700 (PDT)
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
 <7hcyb1os9y.fsf@baylibre.com>
In-Reply-To: <7hcyb1os9y.fsf@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 19 Jun 2025 12:04:21 +0200
X-Gm-Features: Ac12FXxHRrinOtv1VrUOzNTwdoEGXvFLrTbL1eqHbd-28tCWSr1RQvsGmi2PaK0
Message-ID: <CAPDyKFpTgAmLBq2ZExPoxWM0wL756zH96vW7M6wHSA1MTTG1wA@mail.gmail.com>
Subject: Re: [PATCH RFC v3 2/2] pmdomain: core: add support for subdomains
 using power-domain-map
To: Kevin Hilman <khilman@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

[...]

> I've done an implementation with struct device_node *.  This works
> better (IMO) than struct of_phandle_args * because the caller (in my
> case scmi_pm_domain.c) already has device nodes, but not phandle args.
>
> The result will be that the pmdomain helper will call
> pm_genpd_add_subdomain() instead of of_genpd_add_subdomain().
>
> Below[1] is the current working version, which includes adding the
> helper to the PM domain core and showing the usage by the SCMI provider.
>
> How does this look?

It's a lot better in my opinion. Although, I have a few comments below.

>
> Note that doing this at provider creation time instead of
> <genpd>->attach_dev() time will require some changes to
> of_parse_phandle_with_args_map() because that function expects to be
> called for a device that has a `power-domains = <provider>` property,
> not for the provider itself.  But I have it working with some local
> changes to make that helper work if called for the provider directly.
> If you're OK with the PM domains approach, I'll post another rev of this
> series which includes the OF changes for review by DT maintainers.
>
> Kevin
>
> [1]
> ---
>  drivers/pmdomain/arm/scmi_pm_domain.c | 12 ++++++++--
>  drivers/pmdomain/core.c               | 34 +++++++++++++++++++++++++++
>  include/linux/pm_domain.h             | 11 ++++++++-
>  3 files changed, 54 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
> index a7784a8bb5db..8197447e9d17 100644
> --- a/drivers/pmdomain/arm/scmi_pm_domain.c
> +++ b/drivers/pmdomain/arm/scmi_pm_domain.c
> @@ -54,7 +54,7 @@ static int scmi_pd_power_off(struct generic_pm_domain *domain)
>
>  static int scmi_pm_domain_probe(struct scmi_device *sdev)
>  {
> -       int num_domains, i;
> +       int num_domains, i, ret;
>         struct device *dev = &sdev->dev;
>         struct device_node *np = dev->of_node;
>         struct scmi_pm_domain *scmi_pd;
> @@ -115,7 +115,15 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
>
>         dev_set_drvdata(dev, scmi_pd_data);
>
> -       return of_genpd_add_provider_onecell(np, scmi_pd_data);
> +       ret = of_genpd_add_provider_onecell(np, scmi_pd_data);
> +       if (ret)
> +               return ret;
> +
> +       /* check for (optional) subdomain mapping with power-domain-map */
> +       for (i = 0; i < num_domains; i++, scmi_pd++)
> +               of_genpd_add_subdomain_map(np, domains[i], i);
> +
> +       return ret;
>  }
>
>  static void scmi_pm_domain_remove(struct scmi_device *sdev)
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 88819659df83..3ede4baa4bee 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -3220,6 +3220,40 @@ int of_genpd_parse_idle_states(struct device_node *dn,
>  }
>  EXPORT_SYMBOL_GPL(of_genpd_parse_idle_states);
>
> +int of_genpd_add_subdomain_map(struct device_node *np,
> +                              struct generic_pm_domain *domain,
> +                              int index)

Providing the struct generic_pm_domain *domain as an in-parameter for
the child-domain seems unnecessary and limiting to me.

Instead I think we should parse the power-domain-map DT property at
'index', to find the corresponding child-domain's specifier/index and
its corresponding parent-domain.

In other words, we don't need the struct generic_pm_domain *domain as
an in-parameter, right?

> +{
> +       struct of_phandle_args parent_args;
> +       struct generic_pm_domain *parent_pd;
> +       struct device *dev = &domain->dev;
> +       int ret;
> +
> +       if (!domain)
> +               return -ENODEV;
> +
> +       /*
> +        * Check for power-domain-map, which implies the primary
> +        * power-doamin is a subdomain of the parent found in the map.
> +        */
> +       ret = of_parse_phandle_with_args_map(np, NULL, "power-domain",
> +                                            index, &parent_args);
> +       if (!ret && parent_args.np) {
> +               parent_pd = genpd_get_from_provider(&parent_args);
> +               of_node_put(parent_args.np);
> +
> +               if (IS_ERR(parent_pd))
> +                       return -EINVAL;
> +
> +               ret = pm_genpd_add_subdomain(parent_pd, domain);
> +               if (!ret)
> +                       dev_dbg(dev, "adding PM domain %s as subdomain of %s\n",
> +                               domain->name, parent_pd->name);
> +       }
> +
> +       return ret;
> +}
> +
>  static int __init genpd_bus_init(void)
>  {
>         return bus_register(&genpd_bus_type);
> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> index cf4b11be3709..65d459d703bb 100644
> --- a/include/linux/pm_domain.h
> +++ b/include/linux/pm_domain.h
> @@ -402,9 +402,11 @@ int of_genpd_add_subdomain(const struct of_phandle_args *parent_spec,
>  int of_genpd_remove_subdomain(const struct of_phandle_args *parent_spec,
>                               const struct of_phandle_args *subdomain_spec);
>  struct generic_pm_domain *of_genpd_remove_last(struct device_node *np);
> +int of_genpd_add_subdomain_map(struct device_node *np,
> +                              struct generic_pm_domain *genpd,
> +                              int index);
>  int of_genpd_parse_idle_states(struct device_node *dn,
>                                struct genpd_power_state **states, int *n);
> -
>  int genpd_dev_pm_attach(struct device *dev);
>  struct device *genpd_dev_pm_attach_by_id(struct device *dev,
>                                          unsigned int index);
> @@ -443,6 +445,13 @@ static inline int of_genpd_remove_subdomain(const struct of_phandle_args *parent
>         return -ENODEV;
>  }
>
> +static int of_genpd_add_subdomain_map(struct device_node *np,
> +                                     struct generic_pm_domain *genpd,
> +                                     int index)
> +{
> +       return -ENODEV;
> +}
> +
>  static inline int of_genpd_parse_idle_states(struct device_node *dn,
>                         struct genpd_power_state **states, int *n)
>  {
> --
> 2.49.0
>
>

Kind regards
Uffe
