Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E0A2EBB80
	for <arm-scmi@vger.kernel.org>; Wed, 18 Jun 2025 18:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750270598; cv=none; b=rWQVhBtM0T09oMGByFlizuQ2AULAIVTslp+nhztjkCkto0oU7QUA7UqRUmKBn9qiJGvd04ZpJIu2cpSmAHiyR5AS7Dwy0/BdGTbBndjIuWWQXvECAJkjEDI8+HkIGP6a8g2esbKx6zNw1bqErsQht3okJ0ADLr/sNp4WMS9yjQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750270598; c=relaxed/simple;
	bh=4Fd9qcUJXzQbN+9KTtCF1fqWdiXzbwzF6B966ci6XRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s8oUMyTPsefwUFKJHRw4bu4Ks3XU9iiVIWbUXMFMig3C1ggfGr82ONm10yPDHzvQSK+Q3gcpmoBeV1637fvKCOy3cR8RDpD1sROixvqFqrcdiiDIIOpNEFxXXaft6FFB7HknNbQexFKv8yAwduu/LymbpM9IgKXSn2jHFTymCRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wid0jK4Q; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wid0jK4Q"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-60bd30dd387so3662442eaf.3
        for <arm-scmi@vger.kernel.org>; Wed, 18 Jun 2025 11:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750270595; x=1750875395; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lQ6KRNqHtUH9Gf6fw/A7PLcOlEK5Gn0mWYnHJo+61Ac=;
        b=wid0jK4Q15Vl/kw4kZKo7qejb44EIxGfESRFu6tffrMzE2exUJ6vtd1TQjIN+a49HH
         FPWBBAUbGVT0/6aKrHPY68p/dajy468RNMNnCnE8qhmCjdvLcF1d+IdJO+y4NnN9kwE1
         3RO8N5hKPqhhuFbL7zyTtQ1WLKHnWE/nqIIGB4u6g5N7oVSBJSio4RUTWh4AL4rQncP+
         FuXNB71wtpDaMWMTAUy99HRxRrToWljSkN9MpXMTfZvvfgff8Ow1RAno42NJREY84zO+
         GCR7/L3aqB9qmH9rD+uSWHYo6xQvvjBTxwkD8EpFXrctx/nIiXv7x39wn5J64mdplqSB
         4Hew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750270595; x=1750875395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQ6KRNqHtUH9Gf6fw/A7PLcOlEK5Gn0mWYnHJo+61Ac=;
        b=Ex1/wPa2CdUitUcFpk2VFvc3sfyugbShg/e8ERIOz6zPBQ7NYnhsPKjch8QTAk7D4h
         TU1e9+OY7RYdXUj0yslvnV+TRy9+D0sqKmxkXm80agSHPmzQ/NcIYaxd+8aBN1y8lKcl
         EDgq+WOrdP/GVV+jJkIVs6uf64XcVKHeHfSgmlAZ0N79Ka+tsp62P/QEHAm3X+B8MvMQ
         gihvKz2EBOyRnCPdksXW9EtvnAiYEtHxGTqF0NXJhKWpV4S7AdlD4rmd6rhd1j5yPkj1
         RJrjwfjB9T20S9hSVaf0NDmlDpdBw5kG5EWb//5mDoVGiGQlF3RLrk/4FF654CibQiWa
         B32Q==
X-Forwarded-Encrypted: i=1; AJvYcCUWoDz9wNzVIs2XY1jETv10n1QTB5bXhr/9kT4/bJ0Xl6IL0IEnCitGmILSjX0btm0G43MqIW+OCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrU0lYp23PXn7/VOHecS5VUp9F94D1e0sCYM2OgGPxv7zrDAXY
	8ci4T/Aj+wbvGHWvjMnWBiHdfmDnBZa9CyCX1pQXE3QJBOOostwnPQguUOYb5eZ1PEA=
X-Gm-Gg: ASbGncsIgOLuZmSwjwiQFFttcOjrfAZt6kgNNUtC03VruxWfVjnt5FfL4jss7mEcObv
	50zs12chb6QxY6JmpdFEvjfNXJK4A7d9PrJQ4VkYU4GaSpWbViVIQvpKZrqsVNfdGc6pJrmDN03
	qFqU1NVVOprzikh8lWegxGHqQG9k/wUKOaIBdBFPDXCGBcFwjb3IEWZMR1A936geHHnxPRzSx03
	56w49wu+TbVOyDVRoF5jox8F/90w4X2O8QwUzKXNW8uNa0SeGHT4bmvp+/twu3Szkjo3PJopR0z
	3/h1bPo18vmy8YbBV53a+VnwusD0wWaeB0UiDJ22K4C5OkEyxJAkgbhthj1N9JzPHkG1FA==
X-Google-Smtp-Source: AGHT+IERtISn8EPb8IizUWIQkj9b9iJsEPiQd/pV7ijZ/mH9QjGYp3xZSAl/4Lp/uwu1uArVd8eRSg==
X-Received: by 2002:a05:6820:1c8e:b0:611:3eb5:7272 with SMTP id 006d021491bc7-6113eb58a0amr3281471eaf.0.1750270595379;
        Wed, 18 Jun 2025 11:16:35 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-61108f0b2fasm1471880eaf.30.2025.06.18.11.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 11:16:34 -0700 (PDT)
Date: Wed, 18 Jun 2025 21:16:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v3 2/2] pmdomain: core: add support for subdomains
 using power-domain-map
Message-ID: <e463a278-7e6e-4287-9093-42d0a0d365d2@suswa.mountain>
References: <20250613-pmdomain-hierarchy-onecell-v3-0-5c770676fce7@baylibre.com>
 <20250613-pmdomain-hierarchy-onecell-v3-2-5c770676fce7@baylibre.com>
 <CAPDyKFrO9rb0eDb2qO+EGaVjOFG=7emgca8511XACDhWY=dt5g@mail.gmail.com>
 <7hsejzp4xg.fsf@baylibre.com>
 <CAPDyKFo-iPBPgkM43q+5cGR2sptkLk4E6TAERCQbCu24o1RfFQ@mail.gmail.com>
 <7hcyb1os9y.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7hcyb1os9y.fsf@baylibre.com>

On Wed, Jun 18, 2025 at 10:48:09AM -0700, Kevin Hilman wrote:
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 88819659df83..3ede4baa4bee 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -3220,6 +3220,40 @@ int of_genpd_parse_idle_states(struct device_node *dn,
>  }
>  EXPORT_SYMBOL_GPL(of_genpd_parse_idle_states);
>  
> +int of_genpd_add_subdomain_map(struct device_node *np,
> +			       struct generic_pm_domain *domain,
> +			       int index)
> +{
> +	struct of_phandle_args parent_args;
> +	struct generic_pm_domain *parent_pd;
> +	struct device *dev = &domain->dev;
> +	int ret;
> +
> +	if (!domain)
> +		return -ENODEV;
> +
> +	/*
> +	 * Check for power-domain-map, which implies the primary
> +	 * power-doamin is a subdomain of the parent found in the map.
> +	 */
> +	ret = of_parse_phandle_with_args_map(np, NULL, "power-domain",
> +					     index, &parent_args);
> +	if (!ret && parent_args.np) {

Sorry for the pedanticry but could we flip this around?

	if (ret)
		return ret;

	if (!parent_args.np)
		return 0;

> +		parent_pd = genpd_get_from_provider(&parent_args);
> +		of_node_put(parent_args.np);
> +
> +		if (IS_ERR(parent_pd))
> +			return -EINVAL;

		return PTR_ERR(parent_pd);

> +
> +		ret = pm_genpd_add_subdomain(parent_pd, domain);
> +		if (!ret)

	if (ret)
		return ret;

	dev_dbg(dev, "adding PM domain %s as subdomain of %s\n",
		domain->name, parent_pd->name);

	return 0;

> +			dev_dbg(dev, "adding PM domain %s as subdomain of %s\n",
> +				domain->name, parent_pd->name);
> +	}
> +
> +	return ret;
> +}
> +

