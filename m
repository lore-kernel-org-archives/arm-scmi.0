Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED222E7167
	for <arm-scmi@vger.kernel.org>; Tue, 17 Jun 2025 13:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750167703; cv=none; b=bAGr0TnF0mdSbixFp0J9J47imJthN6PsZh2hJ+3g7KCIolrmak/Gt4DSVT5qKPVoUFrIUT7VMYzK8qFT4QhMqaBqsDOepWUv8EUk7tdUg/ZMtTIZeptpRmb+AfJjOhYW9yWXgUE+kcwp4ypDQBmltZ5g9sB1xX0vowbIZ29zR4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750167703; c=relaxed/simple;
	bh=DIj2AAVzh6RaeVINK/st+G1b4AbHWzLgB0oXZPusTYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hrOPGbRfr7Vozhe1+kfDuM4WAnKz7qv1ImRBl7MzxrGH5adwf42v+vJaKAeV4Hko+vSsBrNC/Ig5s5n9Zfh9ijS/SDaD/LXYGXKwN+yzjIg8tGs7YbtG/dD3pWIQdj659/36HP92ehBGV4G3OtU1tlo6IpBhtn9NQutnX1RPcb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a06enZpK; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a06enZpK"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e7dc89108bfso4545817276.3
        for <arm-scmi@vger.kernel.org>; Tue, 17 Jun 2025 06:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750167700; x=1750772500; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xxcq6pPXEwCF0M4vqqWx/eKlyr9nt8+hn5/vEDrp5ZE=;
        b=a06enZpKrOmpMf6c01IqKZmE++CpytYFteq+FrYNKJxOM4hJGH4HfK9mmacIME27Gj
         qLV9tBaj8NReG7zBsmhhOfDRyIZFzCh3Y59l0dqEz1zL3VGdZftZxX4eeSfozJDuMGZj
         fd1FgpppgUAX1v/Any2tQh4ipUKJRFxDBvwuBefOFmjbYwR/b1a8U9tzBiB+M/hcp8Xp
         Lq0H4iN8GeGh7Gir1VE+PSUyrrJ0nJ478QT4EbC4VBI7eAxR/X5jVPOl4U3EE3oCFlNM
         cfgfEua+YN6fXZ/ROvuZ9iWFimU8trHKCkgEmprY8P8VSfM9xZuI/6ymW5/bYUAMbwQI
         6ckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750167700; x=1750772500;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xxcq6pPXEwCF0M4vqqWx/eKlyr9nt8+hn5/vEDrp5ZE=;
        b=Tni1o5j+vscOEXo+2HXJbuufvuZomYT0RPLVdrQpZaUxVW9J+KRoZVPHJZhMebA6gy
         eGVxQGeRazkaSQiP/gS+D+DqqOCFax/LUM+9kNrPrLPv2DE8qJPoDs/29Y3fLwz6o1+v
         6yRMWNiGit0csfZsVGiy5dKmXXF4KVCilWp0we36o+eP8618H3EX1oqUXPp97w41MIoV
         fK8C9iY0OMrVPnqIOVqawC313YG+H5dGzVvuFHwaeblAvrL7XC7JgtAFYTtbJuPgJBXG
         AmvxsBsFsUSgOULjJiQ1KWxKrE9C5f3KexjAa14vPLGvMu+s5gFN2SZCx7g/OH4VaRdt
         Q+tQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmv0w0z9OZ8g4XF4lmlN1gOV662/fT8HstD6iB1iNDWRrZqvWFBVvUKb0rJm2mLwD0+VM8THZzew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp5OUtRU/bWfBYJuiF/FseyKhCsf1DZMlx6L44zM4N+8ZfmJbz
	ZAlNxWDZx/r5o5Lup9AuWyM8dzLZt713cE7YxA3bq6nNgqOU953+Y/WK2IniQ1cwAOTEmBuAyQK
	CKECR8WerUpfslYG54u4ztlTjL68w0+XHbZnJbz5Fo5D6WwQ6JM7Vlp0=
X-Gm-Gg: ASbGnct2om+/U8k30CO2IQShUYe9YktdKaLnNxgmiQQNzVapnXg+ZbMGmCDxCm0ZTPf
	vgFM/U38VlZ6Jl/Izk7aVrjwqrgyMkeyiziNimp6WcNQz2BkXlrQP0SvMq9qcdM4zMOQj0XQ+NT
	gZOVV41BxleVUr2CZmB7doNdmxxKTEnT0dg0t9Y6hjhlIo
X-Google-Smtp-Source: AGHT+IFXNh3dt4XqMM5937nY2BjWuw0VFS4BzyKrSjRkgDANTu7g5lS3hr0/pxLXWwKfRV56n2YHg6bm2vUH93us37E=
X-Received: by 2002:a05:6902:2743:b0:e81:4e9d:9e79 with SMTP id
 3f1490d57ef6-e822aceb465mr17195548276.40.1750167700195; Tue, 17 Jun 2025
 06:41:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613-pmdomain-hierarchy-onecell-v3-0-5c770676fce7@baylibre.com>
 <20250613-pmdomain-hierarchy-onecell-v3-2-5c770676fce7@baylibre.com>
 <CAPDyKFrO9rb0eDb2qO+EGaVjOFG=7emgca8511XACDhWY=dt5g@mail.gmail.com> <7hsejzp4xg.fsf@baylibre.com>
In-Reply-To: <7hsejzp4xg.fsf@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 17 Jun 2025 15:41:04 +0200
X-Gm-Features: AX0GCFsc4IXNTkQXClE9iVnzm8TR1gvwHeQEjnwyXUG_JQBGZNwT5Ix8opwgWIs
Message-ID: <CAPDyKFo-iPBPgkM43q+5cGR2sptkLk4E6TAERCQbCu24o1RfFQ@mail.gmail.com>
Subject: Re: [PATCH RFC v3 2/2] pmdomain: core: add support for subdomains
 using power-domain-map
To: Kevin Hilman <khilman@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Jun 2025 at 02:50, Kevin Hilman <khilman@baylibre.com> wrote:
>
> Ulf Hansson <ulf.hansson@linaro.org> writes:
> --text follows this line--
> > On Sat, 14 Jun 2025 at 00:39, Kevin Hilman <khilman@baylibre.com> wrote:
> >>
> >> Currently, PM domains can only support hierarchy for simple
> >> providers (e.g. ones with #power-domain-cells = 0).
> >>
> >> Add more generic support for hierarchy by using nexus node
> >> maps (c.f. section 2.5.1 of the DT spec.)
> >>
> >> For example, we could describe SCMI PM domains with multiple parents
> >> domains (MAIN_PD and WKUP_PD) like this:
> >>
> >>     scmi_pds: protocol@11 {
> >>         reg = <0x11>;
> >>         #power-domain-cells = <1>;
> >>
> >>         power-domain-map = <15 &MAIN_PD>,
> >>                            <19 &WKUP_PD>;
> >>     };
> >>
> >> which should mean that <&scmi_pds 15> is a subdomain of MAIN_PD and
> >> <&scmi_pds 19> is a subdomain of WKUP_PD.
> >>
> >> IOW, given an SCMI device which uses SCMI PM domains:
> >>
> >>    main_timer0: timer@2400000 {
> >>       power-domains = <&scmi_pds 15>;
> >>    };
> >>
> >> it already implies that main_timer0 is PM domain <&scmi_pds 15>
> >>
> >> With the new map, this *also* now implies <&scmi_pds 15> is a
> >> subdomain of MAIN_PD.
> >>
> >> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> >> ---
> >>  drivers/pmdomain/core.c | 24 ++++++++++++++++++++++--
> >>  1 file changed, 22 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> >> index d6c1ddb807b2..adf022b45d95 100644
> >> --- a/drivers/pmdomain/core.c
> >> +++ b/drivers/pmdomain/core.c
> >> @@ -2998,8 +2998,8 @@ static int __genpd_dev_pm_attach(struct device *dev, struct device *base_dev,
> >>                                  unsigned int index, unsigned int num_domains,
> >>                                  bool power_on)
> >>  {
> >> -       struct of_phandle_args pd_args;
> >> -       struct generic_pm_domain *pd;
> >> +       struct of_phandle_args pd_args, parent_args;
> >> +       struct generic_pm_domain *pd, *parent_pd = NULL;
> >>         int ret;
> >>
> >>         ret = of_parse_phandle_with_args(dev->of_node, "power-domains",
> >> @@ -3039,6 +3039,22 @@ static int __genpd_dev_pm_attach(struct device *dev, struct device *base_dev,
> >>                         goto err;
> >>         }
> >>
> >> +       /*
> >> +        * Check for power-domain-map, which implies the primary
> >> +        * power-doamin is a subdomain of the parent found in the map.
> >> +        */
> >> +       ret = of_parse_phandle_with_args_map(dev->of_node, "power-domains",
> >> +                                            "power-domain", index, &parent_args);
> >> +       if (!ret && (pd_args.np != parent_args.np)) {
> >> +               parent_pd = genpd_get_from_provider(&parent_args);
> >> +               of_node_put(parent_args.np);
> >> +
> >> +               ret = pm_genpd_add_subdomain(parent_pd, pd);
> >> +               if (!ret)
> >> +                       dev_dbg(dev, "adding PM domain %s as subdomain of %s\n",
> >> +                               pd->name, parent_pd->name);
> >> +       }
> >
> > Please move the above new code to a separate shared genpd helper
> > function, that genpd providers can call build the topology. This, to
> > be consistent with the current way for how we usually add
> > parent/child-domains in genpd (see of_genpd_add_subdomain).
>
> Yeah, you had the same comment on v2, and I'm not ignoring you.  But I
> thought that moving this code to when devices are attatched to domains
> (instead of when providers are created) would solve that problem.  IOW,
> in this approach, `power-domain-map` is handled at the same time as a
> devices `power-domains = ` property.

Even if this may work for your particular use case, in general it does not.

We simply can't defer to build the topology (parent/child-domains)
until there is a device getting attached to some part of it.

>
> So, while I don't really understand the reason that every PM domain
> provider has to handle this individually, I've given that a try (see
> below.)
>

See above.

> > Moreover, we also need a corresponding "cleanup" helper function to
> > remove the child-domain (subdomain) correctly, similar to
> > of_genpd_remove_subdomain().
>
> Yes, I'll handle that better once I get through this RFC phase to make
> sure I'm on th right path.

Okay.

>
> OK, so below[1] is a shot at just adding helpers to the PM domain core.  I
> will then uses these from the SCMI PM domains ->attach_dev() and
> ->detatch_dev callbacks.

No, not during ->attach|detach_dev(), but during ->probe() of the SCMI
PM domain, immediately after the genpd OF providers has been added.

See more comments below.

>
> If you think this is better, I'll send a v4 tomorrow.
>
> Kevin
>
> [1] NOTE: this is based on v6.12 because that's where I have a functioning BSP
> for this SoC.  If you're OK with this, I'll rebase to v6.15 and submit upstream.
>
> From 12a3e5669dc18f4a9fdf9f25398cba4245135a43 Mon Sep 17 00:00:00 2001
> From: Kevin Hilman <khilman@baylibre.com>
> Date: Fri, 13 Jun 2025 13:49:45 -0700
> Subject: [PATCH 2/3] pmdomain: core: add support for subdomains via
>  power-domain-map
>
> ---
>  drivers/pmdomain/core.c   | 60 +++++++++++++++++++++++++++++++++++++++
>  include/linux/pm_domain.h | 11 +++++++
>  2 files changed, 71 insertions(+)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 88819659df83..a0dc60d4160d 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -3100,6 +3100,66 @@ struct device *genpd_dev_pm_attach_by_name(struct device *dev, const char *name)
>         return genpd_dev_pm_attach_by_id(dev, index);
>  }
>
> +/**
> + * genpd_dev_pm_attach_subdomain - Associate a PM domain with its parent domain
> + * @domain: The PM domain to lookup whether it has any parent
> + * @dev: The device being attached to the PM domain.
> + *
> + * Check if @domain has a power-domain-map.  If present, use that map
> + * to determine the parent PM domain, and attach @domain as a
> + * subdomain to the parent PM domain.
> + *
> + * Intended to called from a PM domain provider's ->attach_dev()
> + * callback, where &gpd_list_lock will already be held by the genpd
> + * add_device() path.
> + */
> +struct generic_pm_domain *
> +genpd_dev_pm_attach_subdomain(struct generic_pm_domain *domain,
> +                             struct device *dev)

A couple of comments below:

*) I think the function-name should have a prefix "of_genpd_*, to be
consistent with other names. Maye "of_genpd_add_subdomain_by_map"
would be a better name?

*) We need to decide if we want to add one child-domain (subdomain)
per function call - or whether we should walk the entire nexus-map and
hook up all child-domains to its parent in one go. I tend to like the
second one better, but I'm not really sure what would work best here.

No matter what, I think the in-parameters to the function should be of
type "struct of_phandle_args * or maybe struct device_node *", similar
to how of_genpd_add_subdomain() works.

> +{
> +       struct of_phandle_args parent_args;
> +       struct generic_pm_domain *parent_pd = NULL;
> +       int ret;
> +
> +       /*
> +        * Check for power-domain-map, which implies the primary
> +        * power-doamin is a subdomain of the parent found in the map.
> +        */
> +       ret = of_parse_phandle_with_args_map(dev->of_node, "power-domains",
> +                                            "power-domain", 0, &parent_args);
> +       if (!ret && parent_args.np) {
> +               parent_pd = genpd_get_from_provider(&parent_args);
> +               of_node_put(parent_args.np);
> +
> +               ret = genpd_add_subdomain(parent_pd, domain);
> +               if (!ret) {
> +                       dev_dbg(dev, "adding PM domain %s as subdomain of %s\n",
> +                               domain->name, parent_pd->name);
> +                       return parent_pd;
> +               }
> +       }
> +
> +       return NULL;
> +}
> +EXPORT_SYMBOL_GPL(genpd_dev_pm_attach_subdomain);
> +
> +/**
> + * genpd_dev_pm_detach_subdomain - Detatch a PM domain from its parent domain
> + * @domain: The PM subdomain to detach
> + * @parent: The parent PM domain
> + * @dev: The device being attached to the PM subdomain.
> + *
> + * Remove @domain from @parent.
> + * Intended to cleanup after genpd_dev_pm_attach_subdomain()
> + */
> +int genpd_dev_pm_detach_subdomain(struct generic_pm_domain *domain,
> +                                 struct generic_pm_domain *parent,
> +                                 struct device *dev)
> +{
> +       return pm_genpd_remove_subdomain(parent, domain);
> +}
> +EXPORT_SYMBOL_GPL(genpd_dev_pm_detach_subdomain);
> +
>  static const struct of_device_id idle_state_match[] = {
>         { .compatible = "domain-idle-state", },
>         { }
> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> index cf4b11be3709..5d7eb3ae59dd 100644
> --- a/include/linux/pm_domain.h
> +++ b/include/linux/pm_domain.h
> @@ -410,6 +410,11 @@ struct device *genpd_dev_pm_attach_by_id(struct device *dev,
>                                          unsigned int index);
>  struct device *genpd_dev_pm_attach_by_name(struct device *dev,
>                                            const char *name);
> +struct generic_pm_domain *genpd_dev_pm_attach_subdomain(struct generic_pm_domain *domain,
> +                                                       struct device *dev);
> +int genpd_dev_pm_detach_subdomain(struct generic_pm_domain *domain,
> +                                 struct generic_pm_domain *parent,
> +                                 struct device *dev);
>  #else /* !CONFIG_PM_GENERIC_DOMAINS_OF */
>  static inline int of_genpd_add_provider_simple(struct device_node *np,
>                                         struct generic_pm_domain *genpd)
> @@ -466,6 +471,12 @@ static inline struct device *genpd_dev_pm_attach_by_name(struct device *dev,
>         return NULL;
>  }
>
> +static inline
> +struct generic_pm_domain *genpd_dev_pm_attach_subdomain(struct generic_pm_domain *domain,
> +                                                       struct device *dev)
> +{
> +       return NULL;
> +}
>  static inline
>  struct generic_pm_domain *of_genpd_remove_last(struct device_node *np)
>  {
> --
> 2.49.0
>
>

Kind regards
Uffe
