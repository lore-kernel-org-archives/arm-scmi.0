Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7A639A078
	for <arm-scmi@vger.kernel.org>; Tue,  7 Apr 2026 10:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557316; cv=none; b=kEuAvn4MoRi7d8TetYpXuoEy254a3W6kqVX6bXmiwMMUqrp28orXtTkMvqVatva5IffEUdAV5CH4LYOxXZcOVbtQL9sPdljMXDtrU0UmgPooIm90UJ+4e9tznRETDz41PAd7WPkN+OUVyUK0D9vBrZ+22Evw6UsgNihwGvIRi0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557316; c=relaxed/simple;
	bh=tktu9XsoG2RfvvZNNs1LDTN6klQpEatUvU8LT9mGrbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bRHo1ZeobJF2U8vKzJydwWl9GwMYFXY3EGAYGPfmDvoTdXCnsAya4v4fZkn7Ad3gbd9EFJ289sIFs4XTBRqHgZynX3cjbHHcZw+j9kBGgikFk5H6k0BjHza0wYpT8TEkWgIuv0J07D34kTm0ZDK0lU13V7HQtEV9sLbLlIWnth8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-94e2ad66abcso1405363241.1
        for <arm-scmi@vger.kernel.org>; Tue, 07 Apr 2026 03:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775557313; x=1776162113;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gMnqiwkd26gjhp+7IbyHb9ESCX/5jdc78bBmqANU+lE=;
        b=YTVKlL9vxgvZYYffcLPKx6rMBc/NgZQ9JEegV5aw6YZ1OSiXb0QO4+QsuHKpyC/QyA
         W+9k7/FhCOqsFB9KKpTTwJQrfzzIJN47C5Cl2ZkJd6r2MWL8I2lIWrbRkVO7i2oeIByC
         vMj7tVKWHJdxncu6dXVeg+Lj9BtqYY1qiDBl2iFYW2jRyvzmilAnAKNyrxvqPZuwdvxQ
         sxTARX0YtrZz0Xoc1e0ZLVFGgLWq1W/51HO3EccHCqoP4P6y/hIdrbHhyyfSOjDe+7lw
         8ETOLpaeR25jAydxdalih/IMupLY3PF8G/NWwnJ9M2GBefq1R7qyovGfFJfNF0KJ7KQq
         vQrw==
X-Forwarded-Encrypted: i=1; AJvYcCWD4pWRVZb6Rz7hIOhfwCKQDZePvSN37yrxS+0S+t8sMYoU/lHjTrXx6jljMCvyOX/fq0YsuqywLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKQlGOoGWEB8vPiiwFV+f7RZv/c+phDJYFL6X0bLKNK8DG8kNF
	q8yLlNlQfc0bNIk10xDdoBshC53yYZD9U5rnoCEWEeH26uUzKwGNolPrFiZKg7QH
X-Gm-Gg: AeBDievJ9E/QM0k4lFBJCClnNXdQ1IcAO7IUP5DTD57nXRN6f9CVCICKENm+Vna5Mw2
	p7zCY1nHuRfiBqNeM04XE23cgdXqpV14HCt7Ln17ftPAG/Dc5ZiC6arTbAlwoPtdAGNjRxuETQ9
	CWJb1mRcqnnexyPLGFaTiybrcWtd5EdlIjAjRM/Z9GatrNeu63thk9JzMSvOOfdcPkYcNBqNBFH
	N9cg1yrtGsVVBbNpeKh0NfUus6LLs32Wloc1IgJE+M0nzea63sKFeG+Y5eOB7GDbcWN8xDSPzmZ
	6CSsJen2eXKDSvtRdDk07hrltSCRokmwjy3swQv0zR4aqyiEVLEKYJIoMv5ge2BBid7ihp6LDIl
	4egNBwj3VRSK8ACe8q0bYBguHr8tEoPwNmzARFZqIg82LnBFKA6LKz75++WOesRStjjiTIfWYAN
	ux3AsC75pLhuFzFb6xjluMjeIKwlt3j4uVtyoCdnZMUWIsSEhwAf9yMHmjUVYjzxiiHqf6FyA=
X-Received: by 2002:a05:6102:5692:b0:602:b345:6cdd with SMTP id ada2fe7eead31-605a4e4aa2bmr5043025137.8.1775557313540;
        Tue, 07 Apr 2026 03:21:53 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-954206339b0sm9550041241.1.2026.04.07.03.21.52
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:21:52 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-94e2ad66abcso1405360241.1
        for <arm-scmi@vger.kernel.org>; Tue, 07 Apr 2026 03:21:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWnPfT9jSMa2nqNQxR+8LwzB6gRcgnVGEQQK6eqd21icna+ku+ZJmTqCvBmvXrkcoOpsFMC2Ju/rA==@vger.kernel.org
X-Received: by 2002:a05:6102:f13:b0:604:e063:4fa8 with SMTP id
 ada2fe7eead31-605a510033bmr4709992137.26.1775557312414; Tue, 07 Apr 2026
 03:21:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1774283146.git.dan.carpenter@linaro.org> <edd789f8fc87f294211adf84b09c2af9f4aa6a6f.1774283146.git.dan.carpenter@linaro.org>
In-Reply-To: <edd789f8fc87f294211adf84b09c2af9f4aa6a6f.1774283146.git.dan.carpenter@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Apr 2026 12:21:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWRgkAE-eSzRif6DSqRgOySiN48vcogESN1s2gs2k7bJQ@mail.gmail.com>
X-Gm-Features: AQROBzAIjWX-ymyQ91Ydg4QhzkmLosdw5bqMGDf5_aVfbRMiqgAMy27BrJESM2U
Message-ID: <CAMuHMdWRgkAE-eSzRif6DSqRgOySiN48vcogESN1s2gs2k7bJQ@mail.gmail.com>
Subject: Re: [PATCH v6 7/7] gpio: gpio-by-pinctrl: add pinctrl based generic
 GPIO driver
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Linus Walleij <linusw@kernel.org>, AKASHI Takahiro <akashi.tkhro@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, arm-scmi@vger.kernel.org, 
	Vincent Guittot <vincent.guittot@linaro.org>, Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>, 
	Michal Simek <michal.simek@amd.com>
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

On Mon, 23 Mar 2026 at 20:04, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> From: AKASHI Takahiro <takahiro.akashi@linaro.org>
>
> The ARM SCMI pinctrl protocol allows GPIO access.  Instead of creating
> a new SCMI GPIO driver, this driver is a generic GPIO driver that uses
> standard pinctrl interfaces.
>
> Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks for your patch, which is now commit 7671f4949a6c9111
("gpio: gpio-by-pinctrl: add pinctrl based generic GPIO driver")
in gpio/for-next.

> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -246,6 +246,19 @@ config GPIO_BRCMSTB
>         help
>           Say yes here to enable GPIO support for Broadcom STB (BCM7XXX) SoCs.
>
> +config GPIO_BY_PINCTRL
> +       tristate "GPIO support based on a pure pin control backend"
> +       depends on GPIOLIB

Should this depend on ARM_SCMI *|| COMPILE_TEST)?  The driver only
matches against the "scmi-pinctrl-gpio" compatible value.
Or do you envision a use case without SCMI?

> +       help
> +         Support for generic GPIO handling based on top of pin control.
> +         Traditionally, firmware creates a GPIO interface or a pin
> +         controller interface and we have a driver to support it.  But
> +         in SCMI, the pin control interface is generic and we can
> +         create a simple GPIO device based on the pin control interface
> +         without doing anything custom.
> +
> +         This driver used to do GPIO over the ARM SCMI protocol.
                        ^
I have sent a patch to add the missing "is".
https://lore.kernel.org/b1ecb31a37f8e35447122554a38985cb6240eb11.1775556619.git.geert+renesas@glider.be

> +
>  config GPIO_CADENCE
>         tristate "Cadence GPIO support"
>         depends on OF_GPIO

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
