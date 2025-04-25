Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB3B23F439
	for <arm-scmi@vger.kernel.org>; Fri, 25 Apr 2025 10:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745578139; cv=none; b=jyQQSojhZlzL0Y1ZavHcIBBSMWpvHVWt01+gOxUMFOPkUJ+F9Cz0hYCf0YYa1CILnL7+SwXwQJX3UfUZI2tCz0QZRWcX4JU6t59LMJrLKuLdeALxuD4q+Wvhn1kWS2VkxPC3yp7kT6HZpCoDiToP/2Gjt2mmUfe95acJi3NLKtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745578139; c=relaxed/simple;
	bh=2ku72ZwIqqVhrqSEgQwHrF/4cBdRERPhfKLEpXvD7pA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=plIeAHex2BN2eMbxu4DoBmBiY5saySZz66r2fCpHF/RGIba2rTHVC2pnzIGhHY9zqVdLcRqTMQlwPLvVH6DgFYsP0jbAZqAT4tHOcMBCNrO+wuvEJfqSWpH8VJKcEGpMLVNxOvM+5khrJEBzD3ut7Iy/NJswYS25HDhPYmr/qVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qxb/M5XS; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qxb/M5XS"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-70565ccf3bcso22892387b3.0
        for <arm-scmi@vger.kernel.org>; Fri, 25 Apr 2025 03:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745578136; x=1746182936; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bfSocEfyWblQPP/xzCkbUnaIRjF+zWCHDu1i0MW/Xm8=;
        b=qxb/M5XSpAIHYi59cJW/mLpVAcDCnnvYbq91I1pi7zYtmaFZAwcdR/xNDwmZ7I5SCO
         QTH7H9z1deZr0OqpOBbGHlKkWPO7G53LGX50a3SGcD+QI5URX1NPNeBBSdEMZX8LoHSW
         4EoGvWu0+CSWF2YLxqYrN6gSs1wMYQYia//saLc+Keyl1v3Q1aMqIg5J6lsBNCo+lleM
         pFf8nzfpN2ZpUY83/mTJ8vbLw4lbP7GznCFjtSmv7nQYdxEW7m4reENkuz82fe97jYb9
         /j6AP74Raos+At3eKSFjuNK9f9D0///G29djO6MQdwlMvIBQDDHOqc5zpjSwO/qjR5Zv
         cQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745578136; x=1746182936;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bfSocEfyWblQPP/xzCkbUnaIRjF+zWCHDu1i0MW/Xm8=;
        b=tNspm8qfUYmC3X+glQ8binj+LCd6Sxg+SocXCQpYaxYHM6yZZaaxKXTzJj04Wz7Bvg
         6l20undo4azi5VVhwLR27c2/lPTolxydyphCAFnZvGQtgOa/27fmcwgtDhRmGVRF+gMV
         XD1mELu92IixpxHBzbthqqnz7mOYF/RJ8zRjiVP9L7jyB0/qj+lRax5V08x7ZOBrDJ/w
         XP10+Sna4X/oXzwA+k6brt3hclCtONBBfw9BVsEeCB+tHIzp6LudJdHS8fuWtboXv6Fk
         BrRSyoEDe8dBR3oKHDSPddm7PrQ/UlcjigOL6FGBm4U252df7EznvmwPpTXoGSHj6hSw
         Gs/w==
X-Forwarded-Encrypted: i=1; AJvYcCVuxrEG7Tr2l12c+ziF4lbyoy2nCseV4CO5Gf+Ddt3KM81CriADf0cDbrV6Uh8GU/iK60vpbgrkIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyB6MsIsz004qSyoiicqcbYMY+WHxPyG4gPXwH6Ac1g3L57wgN/
	1IeKRI54CwmpXyh3PWmCuoUegFXNOFyIWxRPOydL9y3lwhQ2RH3HtIEUbyJZAZTj4TIlzqmHG+l
	kuuGyJcH3tS30eQsI4wx732xEStYTVeW4PTTjEA==
X-Gm-Gg: ASbGncsmk1OO1PZBRipxQVPhGqz1IbCqFRTwHTmWPwcULynhFxyEMBCMmUXjQ1v38C6
	yJWYDVOirwYqg+smyMGQ9KzegI90mTacPa2gJ44EjqHK88Y4BurAWYjTm1ZuqweB9Z+TAmWyuex
	TF0a+KVUnM6sjPBMdtNfdNpqICnQv9rs/Tgg==
X-Google-Smtp-Source: AGHT+IEh0l3QwEx8nV/nD4vopz+iQCNkFJtfQC71rtQ8RddeUHJi8VNkarpnUxaQ7POlBvQIKL1PD0fiPOEOu2Bn69k=
X-Received: by 2002:a05:690c:6d11:b0:705:5fde:1b82 with SMTP id
 00721157ae682-708540f824bmr22087717b3.13.1745578136439; Fri, 25 Apr 2025
 03:48:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7hecy3h7ky.fsf@baylibre.com> <CAPDyKFoLJ4zey6GNzCb9roAAJ5mS7B7exU1NEKtpLyyjD0aADA@mail.gmail.com>
 <7hikn5c5v8.fsf@baylibre.com> <CAPDyKFpuqk3jH91rkDDz_kejyJ5pFg5XH+=vdTA2aP8MJKUWrw@mail.gmail.com>
 <7h7c3kcbg2.fsf@baylibre.com> <7h1ptrdhxo.fsf@baylibre.com>
In-Reply-To: <7h1ptrdhxo.fsf@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 25 Apr 2025 12:48:19 +0200
X-Gm-Features: ATxdqUFFjiikf8JilKH662-5lTNHqUS5MfDDOT17jqQNL_TO9IDPn1uxAuCp5l8
Message-ID: <CAPDyKFrnEAQ-H3q05WHFK53wYu7dnzhcUNw+-31H4RvK2MPMig@mail.gmail.com>
Subject: Re: mixing SCMI and PSCI power domain hierarchy
To: Kevin Hilman <khilman@baylibre.com>
Cc: "cristian.marussi@arm.com" <cristian.marussi@arm.com>, 
	"souvik.chakravarty@arm.com" <souvik.chakravarty@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>, Dhruva Gole <d-gole@ti.com>, 
	Sebin Francis <sebin.francis@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Apr 2025 at 21:28, Kevin Hilman <khilman@baylibre.com> wrote:
>
> Kevin Hilman <khilman@baylibre.com> writes:
>
> > Ulf Hansson <ulf.hansson@linaro.org> writes:
>
> [...]
>
> >>
> >> Attaching a single PM domain is managed by bus-level code via
> >> dev_pm_domain_attach().
> >>
> >> If a device has multiple PM domains, the driver/bus for it needs to
> >> manage that specifically, typically by using
> >> dev_pm_domain_attach_list().
> >
> > OK, I see.  But in my quick experiment with this, I found that adding a
> > 2nd domain to a devices power-domain property, it disappeared from the
> > first domain also.  Any idea what is happening there?
>
> Just to answer my own question, I found that genpd_dev_pm_attach() has
> an explicit check for the number of PM domains a device has[1].  If it
> is not 1, the device is not attached to any domain.
>
> I had assumed that maybe the first domain would get attached and the
> others are ignored, but in fact all the domains are ignored.

Correct. It's because we need a different way to manage attaching of
multiple PM domains for a device.

[...]

Br
Uffe
