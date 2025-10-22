Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5D23446B0
	for <arm-scmi@vger.kernel.org>; Wed, 22 Oct 2025 14:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142726; cv=none; b=XnEnXOQqzYadsGDrLsM626UIOD4VrjM0G7Aix6UDKbqaOhDtrKzQWlAPPtFcYbfJOHALjHxERpnVvNV5Lv0GUPQ3/q42d0FTWWERvJlQVXdw1S/YoSLaJYx0UCLNOoZKCxz4tirKjIzIsDZS0Zy0iiHpClxpFJJztrnwcKGbXWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142726; c=relaxed/simple;
	bh=yFqLAyLjbFLbjiI9/lWWW5KPIq1NaOml8cf5H5nQ/5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mjeXX/JQqXbnQxRyQXIQrOsSB/8tTaOM6ErGBzKj/dfYzCK90nd7MzuhoRmsoCxpe5qxmn+kltgds8oJMd6KLeN+BhJOOTNLKy050sZWLtDfTO+EOfBEE6kz2sJp5ka2ZiUMOUt5GOlnJI7ts1hiUtf8CbOZ5csemnFjSRyLVvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G5X/PHHT; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G5X/PHHT"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-63e393c49f1so3811122d50.0
        for <arm-scmi@vger.kernel.org>; Wed, 22 Oct 2025 07:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761142724; x=1761747524; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uw6/hzM0Va4fKQxWOcWodfV3dKIrVId8Rctb0V+ktgM=;
        b=G5X/PHHT1Dn887NjTLGylR+04t1CoFc9fqqImwjSlB+48oKgslZUcvN6WQjoBtgG7H
         4Wgqw8sqKWAS/C9eW/iriKVRMqUkxhsNFqb9NGkuuepx4RRMZ7dzjWfdn0p3rZIM2ycO
         0MuQNIvXSCMXoCe4y9JoVJ8v+bA95sr3K1H7ueAzwFtfgvOgY0xaf7wfVcAn6ZNGQSxL
         ULFmUaf/xdDrDNDh5YiARke7rbatetL1JpYYbaG48B+YE/qHpkH+y4sLO6JSFjZvtdbM
         1heEnWdmeRsIbjp18f9A0QYcZv7vwM0kFFaUa/86U7phDZfYIhgk2fQhGVBsMqkjk9LK
         m6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142724; x=1761747524;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uw6/hzM0Va4fKQxWOcWodfV3dKIrVId8Rctb0V+ktgM=;
        b=UcHR3vJBbyG0F/uB7skK1Kvfquns3MeDHQh/hGKZwtnYDs609j9XXdJDdRw0rhSWwx
         7DnsCWj8F/FJmcyYspvOEsvbdx5n6q7RbZV6JHJNLROwdlvZximpxsyT9HMlEO1Ih0RA
         bDQmv5aCnq7RyxdP57mQy/gqrDbS9oOb4pg04ouqmHPs6TuagnZl9ecm0ryCqmcb77DP
         jg0IadRSArU0mdR4PP1m6Eh/5UHInspXM2hQ7i3Y8tHdxdWyL9sEu1ZA4ENuq6bhOiRe
         9bIf6aTeoNrg2Bn21ba/RKbBmHNXel/7k6FQm3SF3VF2Cj2P9gkRYxarF16VxyxYhz1Y
         3lyw==
X-Forwarded-Encrypted: i=1; AJvYcCU1KTxSBrlkUbV4AwIUCyzwTk7z7r7e3v71tEO7DS+nGLd9GbY2+W1bX+gU/A6l64jv+4sN/7y9NA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyjufrS5L0JY6DZZlhhkoXgmEqavojRkQ/4KNf+Jhyskv3ZEKT
	+oHxaIR5GD4nx3fP85HzND/yJvsvfCK8GtqSdZTYAHsNIujUWgS3R/lJh9d/4OQRSYpGS/vE+EN
	yT9FVCnvatjcIRzBw6DQQCJ7ZWxasI7CAKh2wln/gEB//a4YgL30C
X-Gm-Gg: ASbGncvmIXoIoeUvN58btgT2wy6aoCunbMAAZwlC/gzu4hJ3fsrU49SohuWindkXyNm
	wEnxVCVBAXqM5iwhMiBDuyP2UuE0x65LordDFIlJ/7NR8hga0Yrg0/bHqxbIqb8XcTG/Rs5YyAM
	af1fJ2TxtRi/RxoCqVfd96pE+yr5cHqOL0lKhv9EUppmKrZhmulIUqqIwtgXVqHtuUnIqUQROBZ
	dmJP9tTKht/oFMDhgTdVq0CPEYkPBy4NEiFhIORn2I21rR+y40nWhMQDJqOMn2Xa09s2S3WmK3b
	2GDdvQg=
X-Google-Smtp-Source: AGHT+IE/ssjKsgNbWyRTD56nEBKJW2asWvaLPOCHb8EEj54O1bJSDo+k8w+24YvVr2gUStMBX/PvLBOUj2GgxSU7iC4=
X-Received: by 2002:a53:4c0c:0:b0:63e:15e1:9fd7 with SMTP id
 956f58d0204a3-63e161f67e4mr12769934d50.61.1761142723672; Wed, 22 Oct 2025
 07:18:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251017110320.1186555-1-sudeep.holla@arm.com>
In-Reply-To: <20251017110320.1186555-1-sudeep.holla@arm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 22 Oct 2025 16:18:07 +0200
X-Gm-Features: AS18NWDV7BIC157b-gQVcJT7XzXiV0BN9XKqDRJKl4NksXyQ22QZCyn3B_TBLZQ
Message-ID: <CAPDyKFq0FvfX3GcVTP3ZwTLT=9DVKwpLuWq-gm=_aFZd6jKLeA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: arm: scmi: Fix genpd leak on provider
 registration failure
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org, 
	Cristian Marussi <cristian.marussi@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Oct 2025 at 13:03, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> If of_genpd_add_provider_onecell() fails during probe, the previously
> created generic power domains are not removed, leading to a memory leak
> and potential kernel crash later in genpd_debug_add().
>
> Add proper error handling to unwind the initialized domains before
> returning from probe to ensure all resources are correctly released on
> failure.
>
> Example crash trace observed without this fix:
>
>   | Unable to handle kernel paging request at virtual address fffffffffffffc70
>   | CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.18.0-rc1 #405 PREEMPT
>   | Hardware name: ARM LTD ARM Juno Development Platform/ARM Juno Development Platform
>   | pstate: 00000005 (nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>   | pc : genpd_debug_add+0x2c/0x160
>   | lr : genpd_debug_init+0x74/0x98
>   | Call trace:
>   |  genpd_debug_add+0x2c/0x160 (P)
>   |  genpd_debug_init+0x74/0x98
>   |  do_one_initcall+0xd0/0x2d8
>   |  do_initcall_level+0xa0/0x140
>   |  do_initcalls+0x60/0xa8
>   |  do_basic_setup+0x28/0x40
>   |  kernel_init_freeable+0xe8/0x170
>   |  kernel_init+0x2c/0x140
>   |  ret_from_fork+0x10/0x20
>
> Fixes: 898216c97ed2 ("firmware: arm_scmi: add device power domain support using genpd")
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe

> ---
>  drivers/pmdomain/arm/scmi_pm_domain.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
> index 8fe1c0a501c9..b5e2ffd5ea64 100644
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
> @@ -108,9 +108,18 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
>         scmi_pd_data->domains = domains;
>         scmi_pd_data->num_domains = num_domains;
>
> +       ret = of_genpd_add_provider_onecell(np, scmi_pd_data);
> +       if (ret)
> +               goto err_rm_genpds;
> +
>         dev_set_drvdata(dev, scmi_pd_data);
>
> -       return of_genpd_add_provider_onecell(np, scmi_pd_data);
> +       return 0;
> +err_rm_genpds:
> +       for (i = num_domains - 1; i >= 0; i--)
> +               pm_genpd_remove(domains[i]);
> +
> +       return ret;
>  }
>
>  static void scmi_pm_domain_remove(struct scmi_device *sdev)
> --
> 2.34.1
>
