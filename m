Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF1D311942
	for <arm-scmi@vger.kernel.org>; Mon,  8 Dec 2025 13:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765200295; cv=none; b=jGAWrzAjHlsHgelTGRHjDU8j3AFQURQC4O61QCs9DlEdDauowJeaaxhxghE7X7qmRV1jBlKIxpD/BJpBmhwryAy4tIGrEp69Peat4uzTLY6Y3ZJ2knPJ0jEFD7/LX8uDiNvkLAjDFZj4kegfifQPKunq6KR+uUfx70g5CB1qteg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765200295; c=relaxed/simple;
	bh=N/vD9NIMBdx0UGaCEYgwqH36OYsS96bKye28iDSL2l8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ryDj7AS0Z7ko8THdscothvHuwMPsxv0LygQf6m1LhL0Ov84dp0NUNtUCsQW4lnPjFqenb8pWPK/m8LhQnNLKPdgoq2O15greQzlpvf42xWCDhEWwUAC+dlqEqd1tdt7BEjuGpHJfYK8B4J6zdkaVjgyCHV+3D0/2QaCSwPVKR+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=udcYsB6K; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="udcYsB6K"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-786a822e73aso42418217b3.3
        for <arm-scmi@vger.kernel.org>; Mon, 08 Dec 2025 05:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765200293; x=1765805093; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mpu/cs/5xHVC6KpSzx7cFK/d7AzU0ZQ/t0FxG+WvyB0=;
        b=udcYsB6Kt0ZSGCbE/dnm6wSEYnjJT3BM7E/Mum+Tb5gCQfhLNIbJkSwJpoyrZKA/+b
         04YtkOPe0Mmi230gyIjaATyHEjyetNhCtt9Wi1+7X80L+Tfi6ZKbb1xOnrW4doNFjuj4
         u/YZ8X4w3byevPJM5kCE71kMZ47kz3wUL/+PyD9m3NILQzHZBO0tqzKlARH73KkRyacY
         Q9zbwumWgVpgPePA7edVJkfixioOKbm4k5Q+zYeHL+guwTa499aPbuhJEAJlnuxaSDEg
         mY154hcvdb+ZbH8Fd+mQ2J+cdFj3UpbqI3j3J7ywmUDmbhMEhzVTgNtiK/lNN+trTxLo
         tlbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765200293; x=1765805093;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mpu/cs/5xHVC6KpSzx7cFK/d7AzU0ZQ/t0FxG+WvyB0=;
        b=Nd4FUhUePigln6O66mt83J/KOEgq1z4TK7lub5iizn8JveVJzuvmyR1K1j4sfXC/rC
         XX+kYlNz1Be9ol2LptusemYNucPr8S/Misd30rQghQNbbD/3ZfN5GYk/OFj/rn6c2Bl+
         lt8NnNFrBxXkd4FNUBtLDk/RfIiAVOxlWAHg6KpVX93TQZRpaYHImIVZSKctOoBssXcY
         IQsdHZHQmsvlyCSRM1vcnSKOhCguhvzgRwK7ZDCUu5I/wSCffni3Np0jmW38b7E7K+Nx
         blDc9whziiKKRhsd04kJY6YPPQjTQlke0rAKlF3xtLSo6n1/6ZR/aQngp4SiOGXIwQcX
         cYsA==
X-Forwarded-Encrypted: i=1; AJvYcCXJTctL3t7qxpLVkI65/NaczvhzXrSn7szHTmiPhLuw+HS1de6eTOB0vP4BBh+3Qwya/MAnpo5NVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxDd02eac+97RKYG+IMkpKzMjyCcbxEGE6sPlepjsKFCXnPO8d
	wrCjxCNwGhwAwiB5WdlZEaC2SsOV4YekqUHAe/7zi0DVmSAh1pZAJQbxFfX9dl26vDUXD+/jALm
	vmYl9Is6JMCnGCZK7rHPQOtf1Jg3MPC6h6t6OARHcbA==
X-Gm-Gg: ASbGncse0npwx4LfGLVy+WGs6vR8k6tZ+qdSSxkZzQIhvk1QK1AVTfeHsZDAn2YZLi3
	iyWa6pHwvblykWbjDh9Yb1jSJ1PAJZ38wKJn3VOnwjhgRLMPQDgYyfQLbTQE4sQm222vj+peuSV
	wHdGRT7OJ9ciDpOlFb8wzA9hhOk3aD3NUkjWtv+3kq2pF/WVCZR9nBVXUrONxbpy3Y73iVG3CSb
	nwYBsn9YEgFjFVIaXcl2lIDJyww7E9qwUNZgbKtdwwbFrD/dHUL4anJysXASYiTitOJV6rP
X-Google-Smtp-Source: AGHT+IE0AuRxNzvS5+Z+cFGpwMA1CWuN4MV7VcMxk53grVuq/mo6go4caopmooiga3p9pToHn9RL/9AL66V4VXW+Eyo=
X-Received: by 2002:a05:690c:6307:b0:78c:672:9b40 with SMTP id
 00721157ae682-78c33c64ccfmr69913917b3.55.1765200292824; Mon, 08 Dec 2025
 05:24:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119-pmdomain-hierarchy-onecell-v4-0-f25a1d5022f8@baylibre.com>
 <20251119-pmdomain-hierarchy-onecell-v4-2-f25a1d5022f8@baylibre.com>
In-Reply-To: <20251119-pmdomain-hierarchy-onecell-v4-2-f25a1d5022f8@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 8 Dec 2025 14:24:16 +0100
X-Gm-Features: AQt7F2o5oTlgmjrE1oNxDidWCM19vZY0IV7rfLV5Fo8hM3AHBEnUaqgxQkEhKFU
Message-ID: <CAPDyKFq-aGXVTHCqPVQHkVRTffUS+BdK68h2zWDrBpnQGUC6mw@mail.gmail.com>
Subject: Re: [PATCH RFC v4 2/2] pmdomain: arm_scmi: add support for domain hierarchies
To: "Kevin Hilman (TI.com)" <khilman@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Nov 2025 at 01:58, Kevin Hilman (TI.com)
<khilman@baylibre.com> wrote:
>
> After primary SCMI pmdomain is created, use new of_genpd helper to
> check subdomain mappings, and create domain hierarchy.
>
> Signed-off-by: Kevin Hilman (TI.com) <khilman@baylibre.com>
> ---
>  drivers/pmdomain/arm/scmi_pm_domain.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
> index 8fe1c0a501c9..a36bb50c7cf6 100644
> --- a/drivers/pmdomain/arm/scmi_pm_domain.c
> +++ b/drivers/pmdomain/arm/scmi_pm_domain.c
> @@ -41,7 +41,7 @@ static int scmi_pd_power_off(struct generic_pm_domain *domain)
>
>  static int scmi_pm_domain_probe(struct scmi_device *sdev)
>  {
> -       int num_domains, i;
> +       int num_domains, i, ret;
>         struct device *dev = &sdev->dev;
>         struct device_node *np = dev->of_node;
>         struct scmi_pm_domain *scmi_pd;
> @@ -110,7 +110,14 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
>
>         dev_set_drvdata(dev, scmi_pd_data);
>
> -       return of_genpd_add_provider_onecell(np, scmi_pd_data);
> +       ret = of_genpd_add_provider_onecell(np, scmi_pd_data);
> +       if (ret)
> +               return ret;
> +
> +       /* check for (optional) subdomain mapping with power-domain-map */
> +       of_genpd_add_subdomain_map(np, scmi_pd_data);

I think we need to take better care of dealing with errors here.
Typically a negative return value should be treated as an error, while
0 should be fine, right?

> +
> +       return ret;
>  }
>
>  static void scmi_pm_domain_remove(struct scmi_device *sdev)
>
> --
> 2.51.0
>

Moreover, I wonder if we need to update the scmi-DT doc [1] too?

Kind regards
Uffe

[1]
Documentation/devicetree/bindings/firmware/arm,scmi.yaml
