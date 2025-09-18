Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEF11C3314
	for <arm-scmi@vger.kernel.org>; Thu, 18 Sep 2025 15:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758208343; cv=none; b=Rb+tDyXju/nr1nuls2/cQhcU2JUeqZAOL9sCXYSxnfsQPEctBwDg2REKu3dQjEmbu3lMzwjrynEOPaLv+CF2OQVspKbw3tVVUlVyA72TjJpkDtfOJcxomfYOxTtRbSLb4Di7LhjJZ70oReBmCtMNeWb/LZ30uqpB83yKckSL4YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758208343; c=relaxed/simple;
	bh=JKfm6NN2B2hHRdonJoxuB513WOjuDHT7I18uTla7p1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oAZGwwJnfQU75eFbHiiW6cTP4/we7vOkhxEJ+7qnCUc4VMSngQh3CLy7RoJHGy9I+Hx2Ul8wK/L2JWpJoaAEzeOHKpXPJRMRORxUbckG2ZTywKlotirP5NTHd8x7vuN8eAtnRcVUVv+0lnXbbdrJ28yQxh2XhX0Jzv1IBZZojQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G0Pvj4mc; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G0Pvj4mc"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-ea7cdf867cbso293578276.1
        for <arm-scmi@vger.kernel.org>; Thu, 18 Sep 2025 08:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758208340; x=1758813140; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jzEB3oyqwg8o4qvK1OgqXlnhNgSoMuFMpP/k/75t3xc=;
        b=G0Pvj4mccHzwuYV+T73SVAtcgCz2GmGWizbF97pCuU6JO7qTtllZs5hFpr1+X1yTzH
         Yt6DXgCI0Z9dYdmyfFJwQcxOj9PotF1kn+mpe2jEoV6N8APfa8t1MXOuaIVl021FunhM
         711fdERrvAoBAeUEiHngD/DzM2cLihvIeqzBKYD4N4n/t+AUIQ2yvYBPh0B9+0Tw1dwM
         cWUTUZ0lsh7GLE9D1gC2MZxdxvGMObNv7aLfBQIf0R/5D+/1MYQ1BlQ7cEQBwyo+qVcI
         jThbei/hAPMFHmsUa5xVPdf6PTdtLMtiveq0k7RwX9gssqwi0cr9IBiRy0oYKsqdhmDW
         /UIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758208340; x=1758813140;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jzEB3oyqwg8o4qvK1OgqXlnhNgSoMuFMpP/k/75t3xc=;
        b=udMdIJqc2lM1O3T8ShczXfRBOc06nBR6mvSOycr0SnzDnIUIKdD+OVVpsw9zq//P4X
         QojYxWEn/nlV78pWaf2dXMxczwwkwkDEPKu+B/STVIWEWGkqM+V3bFGHFrBRFDxsOuck
         BCTxQ7eaIQLsO5esKl6Z37Oookpopfr6bCd96aQJRk3J063J56Gz/lAnUWygfxXeQ9S1
         tK9aeeko+txKPvowistQrTTl20YcWpwb0C74t8Yo2Wy9Cbg258ILGPMNLFyuj5k+bmFD
         6KsFA4ym5XFzsosaif9fVP3HiLTJchn/rIrc6yAKfe67s4tA50FGHl7cJG4R5HzVkb+l
         AY6w==
X-Forwarded-Encrypted: i=1; AJvYcCV7+UwuPRA2gD9cdcR9clA1pUmgnkeQ1z63ve5I6nuwx9DwP9z90pekGFQiLUo6qnDT+h+uGwBqEw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd5FqQl2YVlSCnqol1ebrAqEEbh2/C7t6ufPJI9jJpFeIuWqyU
	z/Xs2EqpjeAN8ZJ0XJBsKFM8kIkKREUIiW5mGSZgxvNXYJFu4+UkutPqsJIxJMls2+fs0pjl7fL
	hGhdFeiGlrk6BXsF/X0u+7zJ7eoXpyS8kRxwCmGL5hw==
X-Gm-Gg: ASbGncsvI9sHd5ndktZJaZ/cicEptfSq12tDrHpWZ7rvxIufcB2TsuskDrBdgFcSPKs
	9/fDYZlaCWO3OqpSPFT44WXM3q5dJ2mUqH5FCQlAy+VqJ83MwmN19/y/45yzdYJBsaaoCG2iFVC
	1WrDnJsmgNiTp2jle/tfy7f9sgAiSVz6eK1ZvsiAWvmOhHGfiZEU4JvmruJux3gAcuYgUEW0ROW
	qld01GQDazwLIJCWZn/+T5HfEuxBnqlCapjgA==
X-Google-Smtp-Source: AGHT+IFOOt5NOlhICVzaBKD3GERcW4IuNpGDCitHn0o/LFtu2/I5P/MFLfzOEfmO/oH8TvqHphqHmXeYL1qjVazMwlA=
X-Received: by 2002:a05:690e:4287:10b0:633:b6b5:ef2c with SMTP id
 956f58d0204a3-633b6b5f5bbmr4133202d50.27.1758208340325; Thu, 18 Sep 2025
 08:12:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902-pm-v3-0-ffadbb454cdc@nxp.com> <20250902-pm-v3-2-ffadbb454cdc@nxp.com>
In-Reply-To: <20250902-pm-v3-2-ffadbb454cdc@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 18 Sep 2025 17:11:44 +0200
X-Gm-Features: AS18NWAvbbmow72oBLB0fop6cXMFfTOtiltZJomLBqlvFFcV_ry6i4BBGlzd4Ow
Message-ID: <CAPDyKFqyLV7UF0E4WxYQrqv3HNuSZCet=F62Lvt7nBYJMOZQeg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] usb: chipidea: core: detach power domain for
 ci_hdrc platform device
To: Peng Fan <peng.fan@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Peter Chen <peter.chen@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Xu Yang <xu.yang_2@nxp.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Sept 2025 at 05:33, Peng Fan <peng.fan@nxp.com> wrote:
>
> From: Xu Yang <xu.yang_2@nxp.com>
>
> When add a platform device by calling ci_hdrc_add_device(), this device
> will reuse OF node of its parent device. If power-domains property is
> provided in the OF node, both two platform devices will be attached to
> the same power domain. This should be unnecessary and may bring other
> inconsistent behavior. For example, to support wakeup capability, these
> two platform device need different power domain state. The parent device
> need NOT power domain on for out-band interrupt, but the ci_hdrc device
> need power domain on for in-band interrupt. The i.MX95 Soc support
> out-band wakeup interrupt, the user need to enable wakeup for the parent
> device, but if the user also enable wakeup for ci_hdrc device, the power
> domain will keep at on state finally. To exclude such inconsistent
> behavior and simplify the power management, detach power domain for ci_hdrc
> platform device.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Seems reasonable to me!

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/usb/chipidea/core.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index 694b4a8e4e1d8583dcbf4a42f8c2dfd785d5745c..70597f40b9997a9766934c67bbbed38e96c210f8 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -27,6 +27,7 @@
>  #include <linux/kernel.h>
>  #include <linux/slab.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/pm_domain.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/usb/ch9.h>
>  #include <linux/usb/gadget.h>
> @@ -915,6 +916,8 @@ struct platform_device *ci_hdrc_add_device(struct device *dev,
>         if (ret)
>                 goto err;
>
> +       dev_pm_domain_detach(&pdev->dev, false);
> +
>         return pdev;
>
>  err:
>
> --
> 2.37.1
>
