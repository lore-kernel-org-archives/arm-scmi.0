Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E334C3E7157
	for <arm-scmi@vger.kernel.org>; Tue, 14 Apr 2026 14:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776175438; cv=pass; b=ZItPVHT0XaYG8BEbtTwT1eIOodyEPXS5QKhDbNHwSNUps9PH1uCSlxMbgcn6+Jbu0uh4h6PUmDpmrghQoic46rMsldy+GAjs5BZ9QYKTVkJ0PTHJwsIs3ybrNS5zQrr/yllHwsoWcygW5VlGAyLNpLzMFspObU8AuSayZ0eJ2rU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776175438; c=relaxed/simple;
	bh=Fveyq6Me/SSUIiNKykDc2O0ENPgqNAoNXbo41+6mBwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EEtOVdd4eXO7cla7BkeSxu6KaHV0MTVyfNl8EkjFMVl79IfTFihaNuda3cLcyGfkZtqBDyXidtciOVlCbNZY5IB4ReeoX3YEo8yN018fde2zK/y3gykErhSjx8cafgFt3UJu5ZsmAZ3MoRusrNhmsbD5meZQpPLKm4867yma++U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c0eSv/HU; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c0eSv/HU"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a3d1561e38so4088865e87.0
        for <arm-scmi@vger.kernel.org>; Tue, 14 Apr 2026 07:03:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776175433; cv=none;
        d=google.com; s=arc-20240605;
        b=OSWkis4+hT2AIG0i1Nrd8W146ezMH0+gSKzpW23ou6jAE7SYU9wlGZ9nFM5RRXBvRx
         vGGRgRfxLieVLBBvbTOmrJ+faJXUW55qZz1xuTklEJKJ7lA32CuErrxngDGhtNA0JTSZ
         wAKHGoElSeRcYHcBHItMTeV9yM68xe256/O7/89QqZQqD4KDiiAG6MCTXZq3i7iqQdCC
         4bNLA8/PDmAJ6QR0OZib/tMJ8dWl75PjrczOOFfx9ZKnuADsZGf22tdj4emTXJ8Zguc4
         ekxsZ8ySt03KMw2KBMS82R052El1v2hmy6sycC2NJH5sDxgmUhvMyRiSrMNhTgm2lPom
         y+Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gPnoP/VtWVc+m+Hy+JavXf/s8kHjIuaUNf4svkasJrs=;
        fh=VIaQubUws+kM/nyPQVjEpVS2v0rN4oBmK+HmkYqHtbU=;
        b=Eb0fBsHjygqT+lNTZSoo6kjEE59jxq29oVVdM5pCxznQonbc1mGMNyhbUX4bd8BSBS
         jp9566x2O1tAvIkadMllo7JLvukO+N/+Ddopgabktihe22SbLVMNviA8XowGmdEUmzc2
         zuuK+j70MqRzRe8eMuR8RuVo6Qnv1a1QxKEmrV6RuLO8HbV+XIayd1GOyPPyFaCeM7nI
         NxBx6kmsHPiNt7P9lm2kZf6/wg/Wy8MEAWQ5wiCHsYPfji+WLrF3y9CD+ZOLisxa3MHQ
         OW+SUj7vKMP35N96s/7p4lZOBb3qIK8+oP37vSyxVsRWffu9QqGnCRVY9JAKXjSOXWn3
         4Ijg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776175433; x=1776780233; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gPnoP/VtWVc+m+Hy+JavXf/s8kHjIuaUNf4svkasJrs=;
        b=c0eSv/HUNydIqufr5n9DteyuW4GmKCnOQRoW97DkDGqQmS3ZddYlaXbhmF8NnD2xwl
         dKE2dLURXQ9bPcYoLS3FQ5MVipAsHogn6RNtFZ/sswvyfCMuGVZVXXnKS1lxB0jspcj1
         7XMIkbe5HLeixUch1T54JSbHB/aty3QRUyiwHF8z2QeEwhMwuGgAuQ4F5uya4s12noIF
         nFzBTU3sDeCjBLZDNrJTV7a8YQJ+0xSXkuiFej71dOeYaJ3RU415Qu5xXQV2DeilJbzG
         EfWDV6ByTWppMUBmI3LxvHdiAak24UeLw4KLbjmLgOLEXIbmhkuciWKWcFRVTfPZrmya
         +Jgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776175433; x=1776780233;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gPnoP/VtWVc+m+Hy+JavXf/s8kHjIuaUNf4svkasJrs=;
        b=Odg6MayrEs0SmeRFor8ym++y2mMJhnw2k3HtY4DKm1Pf1BcbYHjQtrsD5o+j4abamu
         zYWOwr8SrJq5kt+GQYPFRgska/Pr+XlCzTNbYAxZk8RM2ayYW7q/F2ieJaSgUth9Rge3
         EYnHQn7JPHtqh05S2/76cLjnBzaLdTP5a685bs59+KmCQM+J0OTwFWMSsmEvWDq333jz
         R4ldQFnQ1oNjV0E6IiT5dK4bkOf4apBorYLusx0cfSLQmaZyv3QrYL+E4kpEA4gJgPe3
         F/TBkvoCe/bjhLuAJPLF/EnsNOSXnJDnInTsBLgApCB3ZNUZnww7B/uEAF5ZzwINoBRi
         zHLQ==
X-Forwarded-Encrypted: i=1; AFNElJ8oALgilwV4oJHMhp18mbiEaXIyRPwTxzljC1v7AxmI8U6FQeLnDXEavJFORGJWb1f+4JwI4G36QA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLzOcc0mxzariuVtMnaIkermBPYgACXoub7V5Y2Z6vEVNyor4H
	tuYEQsO/iUyqshLkrz8zFxwvuXEJAOuYg70BJ+ZXF+/DnNfq4QyEDsMr6tD2Sq3SE/ZvgTD99EG
	C13SqYjBe6FTh3ISjxhfgcfkYMr5KJ+BsrqXeYKTxnQ==
X-Gm-Gg: AeBDieuuwXni9a9Tu/gB1/uWQTQ/5a/dmIxVbs0Kd6bVumX7A/roQaolgTw0voTIFVu
	6ro/3VR8z9PDZTEqKnD7l09PXceWAphrlYK6MF3Q/RyzvbY6KuU4HiBf4aclGA7INClXepCXlVf
	MdtjbpYjxH37vzkCzmptCd+pckXlPcDwbWAQnsmJr/auMsizhoqEhJnRK60Lpp8eimte20Aqazh
	VYajpHGovPFxx7t8jEOcaKngc1DXCKdm0DY2esfzgi19sMHffLHdIU8P8IqR4tzoYSI8jDHZFjx
	JSr08zc42JpWKGeQv3o=
X-Received: by 2002:ac2:4bc4:0:b0:5a3:fcba:559d with SMTP id
 2adb3069b0e04-5a3fcba55f9mr2772672e87.20.1776175432630; Tue, 14 Apr 2026
 07:03:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410-topic-lpm-pmdomain-child-ids-v2-0-83396e4b5f8b@baylibre.com>
 <20260410-topic-lpm-pmdomain-child-ids-v2-2-83396e4b5f8b@baylibre.com>
In-Reply-To: <20260410-topic-lpm-pmdomain-child-ids-v2-2-83396e4b5f8b@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 14 Apr 2026 16:03:16 +0200
X-Gm-Features: AQROBzC039XjBS1eS-X-kRqOO7vWEj2nJaYb7iw3kPhkkHtYapY69V2VqSFFETc
Message-ID: <CAPDyKFrbk8SZs+-WMkbKnh12+OTBtoZ2bwtuASGvAsZwJEd4vQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] pmdomain: core: add support for power-domains-child-ids
To: "Kevin Hilman (TI)" <khilman@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 11 Apr 2026 at 01:44, Kevin Hilman (TI) <khilman@baylibre.com> wrote:
>
> Currently, PM domains can only support hierarchy for simple
> providers (e.g. ones with #power-domain-cells = 0).
>
> Add support for oncell providers as well by adding a new property
> `power-domains-child-ids` to describe the parent/child relationship.
>
> For example, an SCMI PM domain provider has multiple domains, each of
> which might be a child of diffeent parent domains. In this example,
> the parent domains are MAIN_PD and WKUP_PD:
>
>     scmi_pds: protocol@11 {
>         reg = <0x11>;
>         #power-domain-cells = <1>;
>         power-domains = <&MAIN_PD>, <&WKUP_PD>;
>         power-domains-child-ids = <15>, <19>;
>     };
>
> With this example using the new property, SCMI PM domain 15 becomes a
> child domain of MAIN_PD, and SCMI domain 19 becomes a child domain of
> WKUP_PD.
>
> To support this feature, add two new core functions
>
> - of_genpd_add_child_ids()
> - of_genpd_remove_child_ids()
>
> which can be called by pmdomain providers to add/remove child domains
> if they support the new property power-domains-child-ids.
>
> The add function is "all or nothing".  If it cannot add all of the
> child domains in the list, it will unwind any additions already made
> and report a failure.
>
> Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
> ---
>  drivers/pmdomain/core.c   | 166 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/pm_domain.h |  16 ++++++++++++++++
>  2 files changed, 182 insertions(+)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 61c2277c9ce3..f978477dd546 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -2909,6 +2909,172 @@ static struct generic_pm_domain *genpd_get_from_provider(
>         return genpd;
>  }
>
> +/**
> + * of_genpd_add_child_ids() - Parse power-domains-child-ids property
> + * @np: Device node pointer associated with the PM domain provider.
> + * @data: Pointer to the onecell data associated with the PM domain provider.
> + *
> + * Parse the power-domains and power-domains-child-ids properties to establish
> + * parent-child relationships for PM domains. The power-domains property lists
> + * parent domains, and power-domains-child-ids lists which child domain IDs
> + * should be associated with each parent.
> + *
> + * Uses "all or nothing" semantics: either all relationships are established
> + * successfully, or none are (any partially-added relationships are unwound
> + * on error).
> + *
> + * Returns 0 on success, -ENOENT if properties don't exist, or negative error code.
> + */

As I mentioned in my earlier reply for the previous version, returning
a specific error code when the property doesn't exist will complicate
handling for the caller. Moreover, we also need to make sure we don't
returning the same error code (-ENOENT) for a different error further
down the execution path in of_genpd_add_child_ids(). Otherwise it
would the caller treat the error code in the wrong way.

To me, there are two better ways to address this. For both options,
of_genpd_add_child_ids() should return 0 when
"power-domains-child-ids" is missing.

1) Add another helper function that checks if
"power-domains-child-ids" exists. The caller can then use this to
pre-parse the property and decide whether to treat it as an error.

2) As I suggested earlier, let of_genpd_add_child_ids() return the
number of assigned parents/children, while still using the all or
nothing approach, of course.

Kind regards
Uffe

> +int of_genpd_add_child_ids(struct device_node *np,
> +                          struct genpd_onecell_data *data)
> +{
> +       struct of_phandle_args parent_args;
> +       struct generic_pm_domain *parent_genpd, *child_genpd;
> +       struct generic_pm_domain **pairs; /* pairs[2*i]=parent, pairs[2*i+1]=child */
> +       u32 child_id;
> +       int i, ret, count, child_count, added = 0;
> +
> +       /* Check if both properties exist */
> +       count = of_count_phandle_with_args(np, "power-domains", "#power-domain-cells");
> +       if (count <= 0)
> +               return -ENOENT;
> +
> +       child_count = of_property_count_u32_elems(np, "power-domains-child-ids");
> +       if (child_count < 0)
> +               return -ENOENT;
> +       if (child_count != count)
> +               return -EINVAL;
> +
> +       /* Allocate tracking array for error unwind (parent/child pairs) */
> +       pairs = kmalloc_array(count * 2, sizeof(*pairs), GFP_KERNEL);
> +       if (!pairs)
> +               return -ENOMEM;
> +
> +       for (i = 0; i < count; i++) {
> +               ret = of_property_read_u32_index(np, "power-domains-child-ids",
> +                                                i, &child_id);
> +               if (ret)
> +                       goto err_unwind;
> +
> +               /* Validate child ID is within bounds */
> +               if (child_id >= data->num_domains) {
> +                       pr_err("Child ID %u out of bounds (max %u) for %pOF\n",
> +                              child_id, data->num_domains - 1, np);
> +                       ret = -EINVAL;
> +                       goto err_unwind;
> +               }
> +
> +               /* Get the child domain */
> +               child_genpd = data->domains[child_id];
> +               if (!child_genpd) {
> +                       pr_err("Child domain %u is NULL for %pOF\n", child_id, np);
> +                       ret = -EINVAL;
> +                       goto err_unwind;
> +               }
> +
> +               ret = of_parse_phandle_with_args(np, "power-domains",
> +                                                "#power-domain-cells", i,
> +                                                &parent_args);
> +               if (ret)
> +                       goto err_unwind;
> +
> +               /* Get the parent domain */
> +               parent_genpd = genpd_get_from_provider(&parent_args);
> +               of_node_put(parent_args.np);
> +               if (IS_ERR(parent_genpd)) {
> +                       pr_err("Failed to get parent domain for %pOF: %ld\n",
> +                              np, PTR_ERR(parent_genpd));
> +                       ret = PTR_ERR(parent_genpd);
> +                       goto err_unwind;
> +               }
> +
> +               /* Establish parent-child relationship */
> +               ret = pm_genpd_add_subdomain(parent_genpd, child_genpd);
> +               if (ret) {
> +                       pr_err("Failed to add child domain %u to parent in %pOF: %d\n",
> +                              child_id, np, ret);
> +                       goto err_unwind;
> +               }
> +
> +               /* Track for potential unwind */
> +               pairs[2 * added] = parent_genpd;
> +               pairs[2 * added + 1] = child_genpd;
> +               added++;
> +
> +               pr_debug("Added child domain %u (%s) to parent %s for %pOF\n",
> +                        child_id, child_genpd->name, parent_genpd->name, np);
> +       }
> +
> +       kfree(pairs);
> +       return 0;
> +
> +err_unwind:
> +       /* Reverse all previously established relationships */
> +       while (added-- > 0)
> +               pm_genpd_remove_subdomain(pairs[2 * added], pairs[2 * added + 1]);
> +       kfree(pairs);
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(of_genpd_add_child_ids);
> +
> +/**
> + * of_genpd_remove_child_ids() - Remove parent-child PM domain relationships
> + * @np: Device node pointer associated with the PM domain provider.
> + * @data: Pointer to the onecell data associated with the PM domain provider.
> + *
> + * Reverses the effect of of_genpd_add_child_ids() by parsing the same
> + * power-domains and power-domains-child-ids properties and calling
> + * pm_genpd_remove_subdomain() for each established relationship.
> + *
> + * Returns 0 on success, -ENOENT if properties don't exist, or negative error
> + * code on failure.
> + */
> +int of_genpd_remove_child_ids(struct device_node *np,
> +                          struct genpd_onecell_data *data)
> +{
> +       struct of_phandle_args parent_args;
> +       struct generic_pm_domain *parent_genpd, *child_genpd;
> +       u32 child_id;
> +       int i, ret, count, child_count;
> +
> +       /* Check if both properties exist */
> +       count = of_count_phandle_with_args(np, "power-domains", "#power-domain-cells");
> +       if (count <= 0)
> +               return -ENOENT;
> +
> +       child_count = of_property_count_u32_elems(np, "power-domains-child-ids");
> +       if (child_count < 0)
> +               return -ENOENT;
> +       if (child_count != count)
> +               return -EINVAL;
> +
> +       for (i = 0; i < count; i++) {
> +               if (of_property_read_u32_index(np, "power-domains-child-ids",
> +                                              i, &child_id))
> +                       continue;
> +
> +               if (child_id >= data->num_domains || !data->domains[child_id])
> +                       continue;
> +
> +               ret = of_parse_phandle_with_args(np, "power-domains",
> +                                                "#power-domain-cells", i,
> +                                                &parent_args);
> +               if (ret)
> +                       continue;
> +
> +               parent_genpd = genpd_get_from_provider(&parent_args);
> +               of_node_put(parent_args.np);
> +               if (IS_ERR(parent_genpd))
> +                       continue;
> +
> +               child_genpd = data->domains[child_id];
> +               pm_genpd_remove_subdomain(parent_genpd, child_genpd);
> +       }
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(of_genpd_remove_child_ids);
> +
>  /**
>   * of_genpd_add_device() - Add a device to an I/O PM domain
>   * @genpdspec: OF phandle args to use for look-up PM domain
> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> index f67a2cb7d781..b44615d79af6 100644
> --- a/include/linux/pm_domain.h
> +++ b/include/linux/pm_domain.h
> @@ -465,6 +465,10 @@ struct generic_pm_domain *of_genpd_remove_last(struct device_node *np);
>  int of_genpd_parse_idle_states(struct device_node *dn,
>                                struct genpd_power_state **states, int *n);
>  void of_genpd_sync_state(struct device_node *np);
> +int of_genpd_add_child_ids(struct device_node *np,
> +                          struct genpd_onecell_data *data);
> +int of_genpd_remove_child_ids(struct device_node *np,
> +                             struct genpd_onecell_data *data);
>
>  int genpd_dev_pm_attach(struct device *dev);
>  struct device *genpd_dev_pm_attach_by_id(struct device *dev,
> @@ -534,6 +538,18 @@ struct generic_pm_domain *of_genpd_remove_last(struct device_node *np)
>  {
>         return ERR_PTR(-EOPNOTSUPP);
>  }
> +
> +static inline int of_genpd_add_child_ids(struct device_node *np,
> +                                        struct genpd_onecell_data *data)
> +{
> +       return -EOPNOTSUPP;
> +}
> +
> +static inline int of_genpd_remove_child_ids(struct device_node *np,
> +                                           struct genpd_onecell_data *data)
> +{
> +       return -EOPNOTSUPP;
> +}
>  #endif /* CONFIG_PM_GENERIC_DOMAINS_OF */
>
>  #ifdef CONFIG_PM
>
> --
> 2.51.0
>
