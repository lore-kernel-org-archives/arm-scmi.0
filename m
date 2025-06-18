Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D252E2EF2
	for <arm-scmi@vger.kernel.org>; Wed, 18 Jun 2025 12:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750251434; cv=none; b=EOem94X1HQWc/DsBBXchTKvjjpNIMUFXZjOQ+rNKTFCIewlGMSfMLI9q8MciVy4Ahsb0t8fz9L++Za8s03M8V4CevhRghVNBgudFq8w87/YnIT63EsJRJDBA5BPZvPD55i7c2s/lTdfb0apIIZ5JB4Qo+UYQVMolYfk7PIsCiLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750251434; c=relaxed/simple;
	bh=3FYqq38fif/LxKqKHUHq3crgrlGF8y09qgJq5ooSqws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cs77EJlTcHtJkL/iWr7nrNzmWIxTAKJ9o4gz1tE33M5IrIltE1r4DX2SslpYd5R1Ak5y1wHZBZp3qYjs7j74Jdt96nHMQIAdHP57OS+vekBWrWoYjBI4a2kSY8DESyQvrpDPOs0tsPWbfW/2tNVKK7nLunVCqqn1C+AngFtrG1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b7H9MyIT; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b7H9MyIT"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e731a56e111so6289208276.1
        for <arm-scmi@vger.kernel.org>; Wed, 18 Jun 2025 05:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750251431; x=1750856231; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ImV2tWTmsy2q/yEr+1DaD06Foo/cyEMhoVGfzs5E01c=;
        b=b7H9MyITUwy7yCriEiLoOO2l5RI7y6VMfnXqPYBZAxRaJfkOCg2GY//y9VFsQB0V6O
         0vPcYb5Jy3ALKPNu9iPhZMPrv601Hd0//ZVH/TkU4GKxhPymQyTOFLagRCw1w6XlWSop
         Y0S8b3dtAo9uMx9P4mn/uMWWNrF+/7CCocwr/UOY8ozpqBwnDusriN/rZIexYv8bZtWF
         /kKRk3kcxJq9rkaiV/9s6W2ZyIxDeU3vjSk2H0L78iJnjDIXplks6z5ISWxqsW+IevC0
         qTaE6AdQGpPMVxVmumNTkz3DBjPdV4XZaQWbyhDT62+zUdceA4MiTgcxaHWjUbTvpSpg
         sq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251431; x=1750856231;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ImV2tWTmsy2q/yEr+1DaD06Foo/cyEMhoVGfzs5E01c=;
        b=p7iDf3yc4AFHEgddVKYeDK7cRT/twfgCyvTu1ORNKVo3KePSfIVNe168nk4G2NhQRq
         /3M1fATZKUvQOJZNNr37AFRVikpY4x6SQ6g8p6kjHrNQxQaiZJ5LWgKrAQlOB9zQDT4i
         mSH+epGvzAE6y4CczAYMPeWjnoWjCxGqn1L/2rREw8sYh//GZxblLCJqX+H3WOXr9q7k
         STCiIqnbePJB20u0tqXzhEIwnwOrK7T08ynw2IHnHU2QkMPd/Vwryyf62+Ka55QC7Nrt
         vpkb7niX5rpj/iKuXcF2kjWiSFDfVBaAUOXpkpRqwpm9N7GnGjqJdNdKHaVFPMJNFhC6
         54ug==
X-Forwarded-Encrypted: i=1; AJvYcCVVLVuf2GDcyYGDUlEm7BqzHVURe3Hwg0KlzxM5W1An5BwCrH1PcQwfYgsYYtc7FzOuJagfHwhi1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoFwdyTdhBT4NDD63PmJfLN9QETr600SxFKnkY9kHQAFFeBYVK
	OImIpWmxOWOuTgEKuEugzu3S5QuNKl64Ez05jahdTC3Z2Y3H22+hPpCG2RW8j+uiSUpFb/FoXpi
	kcjcjKV+19KSJB4m18kaKX6BMYJhMRWTuDeroLdItHQ==
X-Gm-Gg: ASbGnctR2kMwngX8/+71e05Va9hLWo2wO2GOquOseG+XQPK/rbfadU0dp/GQ+tBqjyx
	j6b6gB99yck5qsM643Jh5487vUcUmyv9240hQ6TRyAWvNUyv81sN55jR9yP6xTRXEPU+r+ANKoJ
	LoIvk9fclPKTeViVfpAgPaSmxJFZXZE3CIpNVoH1ygbsunN+jEDhQKVw==
X-Google-Smtp-Source: AGHT+IEyQuheTBiE1KNn6YZq2gnYBnep5nmoSzdbAY5+FjuWnU41fcajc0wk6HzHKqHouIVNOHfqKE34E1wAn8AbOSo=
X-Received: by 2002:a05:6902:108e:b0:e75:c2d7:53d6 with SMTP id
 3f1490d57ef6-e822ac5c6e6mr24203748276.13.1750251431566; Wed, 18 Jun 2025
 05:57:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606090802.597504-1-lukas.bulwahn@redhat.com>
In-Reply-To: <20250606090802.597504-1-lukas.bulwahn@redhat.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 18 Jun 2025 14:56:34 +0200
X-Gm-Features: AX0GCFtmn4waDQnDGcBuyuBWKSA5kWVg6aNQw87L31M-o6t6ciEMxOkcF-FE8sw
Message-ID: <CAPDyKFoPdqfz-3+XAMpg23VzaLUZ6xXJvmknQH7pjNZLPq6eAg@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: arm: scmi_pm_domain: remove code clutter
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Jun 2025 at 11:08, Lukas Bulwahn <lbulwahn@redhat.com> wrote:
>
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>
> There is no need to introduce the boolean power_on to select the constant
> value for state. Simply pass the value for state as argument. Just remove
> this code clutter.
>
> No functional change.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/arm/scmi_pm_domain.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
> index 2a213c218126..8fe1c0a501c9 100644
> --- a/drivers/pmdomain/arm/scmi_pm_domain.c
> +++ b/drivers/pmdomain/arm/scmi_pm_domain.c
> @@ -22,27 +22,21 @@ struct scmi_pm_domain {
>
>  #define to_scmi_pd(gpd) container_of(gpd, struct scmi_pm_domain, genpd)
>
> -static int scmi_pd_power(struct generic_pm_domain *domain, bool power_on)
> +static int scmi_pd_power(struct generic_pm_domain *domain, u32 state)
>  {
> -       u32 state;
>         struct scmi_pm_domain *pd = to_scmi_pd(domain);
>
> -       if (power_on)
> -               state = SCMI_POWER_STATE_GENERIC_ON;
> -       else
> -               state = SCMI_POWER_STATE_GENERIC_OFF;
> -
>         return power_ops->state_set(pd->ph, pd->domain, state);
>  }
>
>  static int scmi_pd_power_on(struct generic_pm_domain *domain)
>  {
> -       return scmi_pd_power(domain, true);
> +       return scmi_pd_power(domain, SCMI_POWER_STATE_GENERIC_ON);
>  }
>
>  static int scmi_pd_power_off(struct generic_pm_domain *domain)
>  {
> -       return scmi_pd_power(domain, false);
> +       return scmi_pd_power(domain, SCMI_POWER_STATE_GENERIC_OFF);
>  }
>
>  static int scmi_pm_domain_probe(struct scmi_device *sdev)
> --
> 2.49.0
>
