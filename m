Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21F7EED6
	for <arm-scmi@vger.kernel.org>; Mon, 17 Mar 2025 10:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742208692; cv=none; b=lBeudy9AgipPO5Oxdnd+z1oVw4moDDgckseEX//1hMqbDRNcK5mTx5j7RtrX4h5vQ0GvzhX0rzmKvgHeKlJmYQo4EX70K0QGd5aXnhgmJXKif6BWZ4Zcqd3/zffzNYITN5528VPAYcmGQNnT6VFL/nyLq+LEqNjLL7W4TAezZqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742208692; c=relaxed/simple;
	bh=sHAOrNAdc7cHSKBLIXrku3gX9BKF70mjya/yJWNqFBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=esZdifmcNK91rNImu6K12vrOalG1gL6mAvallvFdzV0vi7SzGAJ86a1qMYw3FNpHeAe1+Uyh1S2Jk4Y/zJSIeVSPZ5Y7+jw5yWyFj5SEY+tIoExC/4k+3VeoULTcUfd8yLTGoNjH9gf8wlKyeavuA0YxO5vZZ1L7rCJol5bg5xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C1yzDE2t; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C1yzDE2t"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6f6ae4846c7so41803197b3.1
        for <arm-scmi@vger.kernel.org>; Mon, 17 Mar 2025 03:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742208690; x=1742813490; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3DL02opBJ2GOeQ6pVsKBzjcKKbv+jea7dqaSnTubtI4=;
        b=C1yzDE2tDhMxxE8RXBDFWu8xkiUX43JsGPLdcGDunE2jMGeJGJpmwR65hphBOhlOvR
         Jvbtvm7eVafYH7v1/khw8pdMRWAgFdbNJBrW3UrlUig27WHjOiTBM+3pSMrXOJpGY/6Q
         Ff5lJriYZAGSpFt71/praDE7ZLaCQUugyXQ4daLDcfd7j4r1MMbpyDYC+Gtww4u8PuEN
         Xx/ZLhd+b902zpK7CwtB/b4fKbw4/Zvl6o2C/Jn3ARxI8WQYzahLFz6Kq28nzlxqUkqD
         Qy5MXyUmCCvExzw7BcZV5QuhNTfF/ROV6OM+JEHfKf80xcMqCvDo2IYsAAZOXglcV+4l
         X8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742208690; x=1742813490;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3DL02opBJ2GOeQ6pVsKBzjcKKbv+jea7dqaSnTubtI4=;
        b=MeE1/2mC9pMfw5IxiXxIm8qWn+gVPf1oFTM2nnilQ5AP4JnWXs3vj8C8n2Z764gA4g
         TwBmy8iFamVZfXyHDMhtdYqKATjgSjndCCeC31mwBL/lfEo/G3FUoAvhUt49DG7vLyCi
         s/W5CZbDtGppxMunzffDPGukG3a7qOXgnBBIteUAStiN9uyEOh3oCBFT1abnIpz4nwCp
         snEEQ+83uFF7ltvwrNvhYbhLtRz9wcgV+PwjCvha95sUJuzegHaZmqGznq3nzm/8A++z
         Pw0a+iASbRHaCSfRiHx29GYkg700zs+JrqwpgtxpBxYKtGsPrbeASsIdQ82ut7Nfl2Z4
         TYkQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0K6wRWgeGLFhwnnx7s+jJ3XyxyfU15Yzhy8mPenBOe9AKT2IbrA63WPi2y/DWLZ6+54B+z5mpHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoU7jSj09lamEaproQ+P/Jf1MzMmqRZWZTRIQtgom6MjtcyOy2
	3A8ocgAOLS47EmSkKhhsQdhxjGPB1ZxVXceBC9Wfw1s/AU+PTNpl7ktr8+yMb2jymjTP0gtiskD
	+vBhR3wVivrphhsDGkLND4wH6pEOKI4Br5JdW/A==
X-Gm-Gg: ASbGnctOdv4vRxFUBF651VZ+igtRMdVKk9vcsZdOXTvm/L/HVQQAY4MLFvjfQ+y0M0F
	82u/HvBdb+3CHmgbhExK06p4ZWCviZmZiEg36OiztRQsdg/+wl41elLkT+S90ZMhdbAwRQ5iwfY
	P4CXXlmqiuvxnLe2YjnoopYuxhf2Q=
X-Google-Smtp-Source: AGHT+IG8URJqqSBqONhuu8sYybucoSHmc+ZFyad25qn1SExsn3bIptprwg9F2pyuFSIv1SCLh33c21bFXaSGx6o+e0U=
X-Received: by 2002:a05:690c:7003:b0:6ff:1f58:7ce2 with SMTP id
 00721157ae682-6ff45f43340mr166246127b3.12.1742208689959; Mon, 17 Mar 2025
 03:51:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250314095851.443979-1-sudeep.holla@arm.com>
In-Reply-To: <20250314095851.443979-1-sudeep.holla@arm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 17 Mar 2025 11:50:54 +0100
X-Gm-Features: AQ5f1Joaio6_TwbptUke6Aww5lNg-_7Fjau5OFgPk2QOhZDZNiKgiWIAn887rF4
Message-ID: <CAPDyKFqhvJnth4ASfnfj5xTkM625m-rAidZ3zdy01CzkB7e1Ng@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: arm: scmi_pm_domain: Remove redundant state verification
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-pm@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, 
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Mar 2025 at 10:58, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> Currently, scmi_pd_power() explicitly verifies whether the requested
> power state was applied by calling state_get(). While this check could
> detect failures where the state was not properly updated, ensuring
> correctness is the responsibility of the SCMI firmware.
>
> Removing this redundant state_get() call eliminates an unnecessary
> round-trip to the firmware, improving efficiency. Any mismatches
> between the requested and actual states should be handled by the SCMI
> firmware, which must return a failure if state_set() is unsuccessful.
>
> Additionally, in some cases, checking the state after powering off a
> domain may be unreliable or unsafe, depending on the firmware
> implementation.
>
> This patch removes the redundant verification, simplifying the function
> without compromising correctness.
>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Cristian Marussi <cristian.marussi@arm.com>
> Reported-and-tested-by: Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/arm/scmi_pm_domain.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
> index 86b531e15b85..2a213c218126 100644
> --- a/drivers/pmdomain/arm/scmi_pm_domain.c
> +++ b/drivers/pmdomain/arm/scmi_pm_domain.c
> @@ -24,8 +24,7 @@ struct scmi_pm_domain {
>
>  static int scmi_pd_power(struct generic_pm_domain *domain, bool power_on)
>  {
> -       int ret;
> -       u32 state, ret_state;
> +       u32 state;
>         struct scmi_pm_domain *pd = to_scmi_pd(domain);
>
>         if (power_on)
> @@ -33,13 +32,7 @@ static int scmi_pd_power(struct generic_pm_domain *domain, bool power_on)
>         else
>                 state = SCMI_POWER_STATE_GENERIC_OFF;
>
> -       ret = power_ops->state_set(pd->ph, pd->domain, state);
> -       if (!ret)
> -               ret = power_ops->state_get(pd->ph, pd->domain, &ret_state);
> -       if (!ret && state != ret_state)
> -               return -EIO;
> -
> -       return ret;
> +       return power_ops->state_set(pd->ph, pd->domain, state);
>  }
>
>  static int scmi_pd_power_on(struct generic_pm_domain *domain)
> --
> 2.34.1
>
