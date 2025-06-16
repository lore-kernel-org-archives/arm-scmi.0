Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89C7285C9F
	for <arm-scmi@vger.kernel.org>; Mon, 16 Jun 2025 13:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750081727; cv=none; b=Oxy36DBCQBid5V+NEbDQLnyVtxWbIQXqB3ipkG/Oa6VG8Zfhh02ZmbG4qj34iYulp/XOGqu9LrUyilugg6vgDGym2fhxdH87Dg3CJaZFwdD2hvVE5SMmCH3duVFEsPe0tV1qcNzvKn/IDFDPXMBSRDER5YRPVhOayTeiCjN8MnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750081727; c=relaxed/simple;
	bh=hORHC5srxkLYSdtcercNBIJfYGZMJfr+bVXBwlntJR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JVWRdnjjY0Wiw1289Pa9YmCasL2EjC7OcolwbM6Mfnnwelw6B3wIjpkK2DzUKT8+JXyNR896AZm3Sh5tiYSh1T7q+k9kE7km0VzyicHV7KEGLY8sXX/KyMgSCPgPgStAxWozktfvnq5eri0nVyCKDsu33CCrDsc+Uvqz6OpgdfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HC9caf5t; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HC9caf5t"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e7db6aaef22so3354779276.0
        for <arm-scmi@vger.kernel.org>; Mon, 16 Jun 2025 06:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750081725; x=1750686525; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uDEsIjpQxmad8FZLMr2zVoXrSneTIt+2z4fP3XcIK5Y=;
        b=HC9caf5t7Z3YV34hMVfY2iOyc8ceDK41ddWnZGKqTuEfRCkaUY3raiG3FlkrCFIjfD
         tPyRf2CTFWTmNqn1/fqrqeiU9uJtuN0/o6S2lRpPIvGheNVfGEWlXe0gKBMgT93uCWaV
         howKJOdXYFL5VBUyk2ABJnWG4of5g8jT5EQF3lfnh7+BPQPGs47ip1FBWZ/yH45SY+nE
         ITmfq9OEFvRdyraYRy2/XeNzHkPruJLRo4LNcIanLnMF1+j2wUFJAl4/IBSZ8nBmL7y3
         hnmmFLXuSOCnEaOhKiBMjLbpfE4uyCGHw7eLjaR81qvd/V7H6hVfgYy2IZI1q74yo9eT
         +LMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750081725; x=1750686525;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uDEsIjpQxmad8FZLMr2zVoXrSneTIt+2z4fP3XcIK5Y=;
        b=wuWSH+FRnWNTyfyYPg6LQzbd1RwG1AlvjBGb7wwHIzYmeYVfbLdjUg0mPqV0cP2FJV
         1uT16Br2CaOmO38z6K6Krfc23n6Jw/WwWJF7QPNETpexwzdxxhAEa0/Yw2fJel6Rc5LK
         WhIgcSB9nq5xf7nDota6j0lBSzjAvgkhpaf3sCCGfccImfFJ9ITIcusoQXVKhO46nrRa
         TQwz3lQSfQ16enNwkJlhLsmuPtM7PndIoKW2c/3IFP7AZmZoPdgTWEVptsTy5LuyV0cm
         ZNXd9vIXxGe/aT+pZZ4G2QOTEJy0IbfZSjW2+hUxA+cj6Ka0BN1uy/5vbknh5KkDjnfH
         6gSg==
X-Forwarded-Encrypted: i=1; AJvYcCUZaCUfQ4WmcmbXHkzwIkrl+J/shdR++PaNIjiSmw1OntH8d7Wya00Q5VEg/bRHEq701G2fV7xEJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtDKimB2x5kl2cQwhd0SDYBfLebCR7yky+OdruGsqFbyZjL7Cx
	SuKrFh72bIdej9BwdhxK0nLk6WlGEJ6LC7UinyK7WTgnZqADGcdqUvCe/oy8TDxdGSKd0/cOtx7
	CVwZbOsuq+uAw8aTCyWybmydSp52SDHv+rBIUThvl8g==
X-Gm-Gg: ASbGncu8Ipc2ifk+atAgE++TrDFdFOT1tQ9ydeMI/eJwAMqteQ1iinoUTrmDU9iuBpM
	lYntSgZET+bkcz8UyyajtgXkyiXJLhbX0TaMk6tSOTpuSvSzeI4OWDN1hj47Q2V076TCYGtI2zM
	HKSBo5Ckng75f7vqWy2PwOpo/00PpBVvGUt/PMDt7/2KVg
X-Google-Smtp-Source: AGHT+IHNxadKla4VrvH6YQyXKvJ7gWCdWq9mPlNx20rADiF787HEQItMLkqVHGwgE74xslQFsHpPtk0p6m7ForJ9ORA=
X-Received: by 2002:a05:6902:220e:b0:e81:9581:4caa with SMTP id
 3f1490d57ef6-e822ad8bc0fmr12562057276.34.1750081724654; Mon, 16 Jun 2025
 06:48:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613-pmdomain-hierarchy-onecell-v3-0-5c770676fce7@baylibre.com>
 <20250613-pmdomain-hierarchy-onecell-v3-2-5c770676fce7@baylibre.com>
In-Reply-To: <20250613-pmdomain-hierarchy-onecell-v3-2-5c770676fce7@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 16 Jun 2025 15:48:08 +0200
X-Gm-Features: AX0GCFvKDYfrBoGxWHbzdQisHdQSvIWu47gSqcVmiJT8KMDILVyrcsYNa9sTBzs
Message-ID: <CAPDyKFrO9rb0eDb2qO+EGaVjOFG=7emgca8511XACDhWY=dt5g@mail.gmail.com>
Subject: Re: [PATCH RFC v3 2/2] pmdomain: core: add support for subdomains
 using power-domain-map
To: Kevin Hilman <khilman@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 14 Jun 2025 at 00:39, Kevin Hilman <khilman@baylibre.com> wrote:
>
> Currently, PM domains can only support hierarchy for simple
> providers (e.g. ones with #power-domain-cells = 0).
>
> Add more generic support for hierarchy by using nexus node
> maps (c.f. section 2.5.1 of the DT spec.)
>
> For example, we could describe SCMI PM domains with multiple parents
> domains (MAIN_PD and WKUP_PD) like this:
>
>     scmi_pds: protocol@11 {
>         reg = <0x11>;
>         #power-domain-cells = <1>;
>
>         power-domain-map = <15 &MAIN_PD>,
>                            <19 &WKUP_PD>;
>     };
>
> which should mean that <&scmi_pds 15> is a subdomain of MAIN_PD and
> <&scmi_pds 19> is a subdomain of WKUP_PD.
>
> IOW, given an SCMI device which uses SCMI PM domains:
>
>    main_timer0: timer@2400000 {
>       power-domains = <&scmi_pds 15>;
>    };
>
> it already implies that main_timer0 is PM domain <&scmi_pds 15>
>
> With the new map, this *also* now implies <&scmi_pds 15> is a
> subdomain of MAIN_PD.
>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
>  drivers/pmdomain/core.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index d6c1ddb807b2..adf022b45d95 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -2998,8 +2998,8 @@ static int __genpd_dev_pm_attach(struct device *dev, struct device *base_dev,
>                                  unsigned int index, unsigned int num_domains,
>                                  bool power_on)
>  {
> -       struct of_phandle_args pd_args;
> -       struct generic_pm_domain *pd;
> +       struct of_phandle_args pd_args, parent_args;
> +       struct generic_pm_domain *pd, *parent_pd = NULL;
>         int ret;
>
>         ret = of_parse_phandle_with_args(dev->of_node, "power-domains",
> @@ -3039,6 +3039,22 @@ static int __genpd_dev_pm_attach(struct device *dev, struct device *base_dev,
>                         goto err;
>         }
>
> +       /*
> +        * Check for power-domain-map, which implies the primary
> +        * power-doamin is a subdomain of the parent found in the map.
> +        */
> +       ret = of_parse_phandle_with_args_map(dev->of_node, "power-domains",
> +                                            "power-domain", index, &parent_args);
> +       if (!ret && (pd_args.np != parent_args.np)) {
> +               parent_pd = genpd_get_from_provider(&parent_args);
> +               of_node_put(parent_args.np);
> +
> +               ret = pm_genpd_add_subdomain(parent_pd, pd);
> +               if (!ret)
> +                       dev_dbg(dev, "adding PM domain %s as subdomain of %s\n",
> +                               pd->name, parent_pd->name);
> +       }

Please move the above new code to a separate shared genpd helper
function, that genpd providers can call build the topology. This, to
be consistent with the current way for how we usually add
parent/child-domains in genpd (see of_genpd_add_subdomain).

Moreover, we also need a corresponding "cleanup" helper function to
remove the child-domain (subdomain) correctly, similar to
of_genpd_remove_subdomain().

> +
>         ret = genpd_set_required_opp(dev, index);
>         if (ret)
>                 goto err;
> @@ -3056,6 +3072,8 @@ static int __genpd_dev_pm_attach(struct device *dev, struct device *base_dev,
>                         dev_gpd_data(dev)->default_pstate = 0;
>                 }
>
> +               if (parent_pd)
> +                       pm_genpd_remove_subdomain(parent_pd, pd);
>                 genpd_remove_device(pd, dev);
>                 return -EPROBE_DEFER;
>         }
> @@ -3063,6 +3081,8 @@ static int __genpd_dev_pm_attach(struct device *dev, struct device *base_dev,
>         return 1;
>
>  err:
> +       if (parent_pd)
> +               pm_genpd_remove_subdomain(parent_pd, pd);
>         genpd_remove_device(pd, dev);
>         return ret;
>  }
>
> --
> 2.49.0
>

Kind regards
Uffe
