Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3233451BF
	for <arm-scmi@vger.kernel.org>; Thu, 11 Sep 2025 14:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757601970; cv=none; b=bJbPjMmnLOBizd0f2VlgULJCosxR2/Cl9umgu11LSs/A3dOu/wZAbzMEFDgfZJA014yvtGydKSTTHxiS3ZEYbThKbUcEhBhcS4B9FQ4QG/9yc8CzuMpQ7i6JwJ/iLn2jpsi/dP2Enag9PAm3YWopjT7FbUkAMMZs62nnR7qqFPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757601970; c=relaxed/simple;
	bh=VKSX47Aju/DzSJYwp5bYidhSzFn8zeiXLyG/eQpEZMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pQfFLt3VkufDjvb0K7nW85ZQfCT5GehxlPXkIPpDWy2AWK6ZXXnZPJD2kHAIq8TtaGrSKTPfU+OrrpE6WnGsvgZS1Td/fYKmQRqq9s6RrFmHUH/PjskU54I7zs29VPdI8CCgttCfCbtBwIFM5pfYR3t+nYlVvC3Jf27D+To3sUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=So7B1T1C; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="So7B1T1C"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e951dfcbc5bso684770276.3
        for <arm-scmi@vger.kernel.org>; Thu, 11 Sep 2025 07:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757601968; x=1758206768; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HG5KODUu0GjbUdNiiv9Xwk+9exlrDUpck0LIesxLbE4=;
        b=So7B1T1CKaqLnhHiPP/+1FWFEu/6R4m7Mbj5/xzn1SE6S1xslf7Jhr9oBemetkknbf
         mUV3o0erG1SIkW5Y/MHYT37UHVGW3TE8CRVYfHVeXOwP7SUKwqDjqaF1dYNVNvSWf/UK
         nOtD5PhR0U4xC4G9+92USMeC3V1YD4gVCmT607p+HM1gVGaVv8wXB1lXiJtpLF/8CfrP
         Pu6Ppe0MHyPMWyzVa42Wq2h31rTVK8pl4mAtAiBNaHZ7BGqo3YE54ygZOfTRArfKMoXS
         bKZhZWJqVKRFIpJG4wYe0kGjldN4WcENcRo+No/axwP/KWnYRLnZAC1J/7GbpdJWi7MG
         znvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757601968; x=1758206768;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HG5KODUu0GjbUdNiiv9Xwk+9exlrDUpck0LIesxLbE4=;
        b=dmnJ93ZHhWJelNw76SaDvSRgf4PYmSxYy15xl0F1MGInBEd1tgBbb5eVFpWHnVuQIH
         mmS5XWF5PKGG7579Sb93MsPKSdF3uglwYTxcfdBa7/LPxLi0YSgITAFqAHQzjMtlr9Ml
         mtssmqcDk2JTm6QKRXCBPaaFtzOLgl7PB4WL7bKOxvRK26Z0B60FMzJEiaF4dgEenFAH
         1LM6HUEqxjTs1cqJRkealEN/lm9IqGpayhMP01vK6bIMQwnC/mlr8+eksLU0X6NpamoL
         3kiUHanbPlT+BW/AThDNCMbmw0Y2WeLk+xDvTdF6f6jOxGB87KzQh5mg7BYxBaGGgtJW
         tmmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWswkOXy3K2skyW/4nZUxjnEPtGNa2BopAvq4jksLJGGgkM+7uKmQBZXRb7SYFhqX4huFuC+LkGsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqE8Rjm3bh6XPenE67P0DcUMzxkmrDmkOLaTKlYg/Odi0E6oK5
	0D2gRCjFtOSYS9n3SA4q8WjBc+zm9/1h6VSqZUR3FlEGvXVnZsl/swNzziuRWLa7ilgphERmksK
	9e7nqT3yCqerIgBf+wyznPd6ymrHSCglvVDesZptAlw==
X-Gm-Gg: ASbGncvlI4GFnvjUUpIbRcUUkWV2snUZbzJAYeb3xxw8fnSgqXtKZxKOxzgzudqluZd
	srwyJGle+KQGSAZJG11iFKCmoltge9SFDNLoef6AnVkKdiLNcYVhmlKrjADa505Up2VxMVQORNX
	bi0/3ry+BMlhyd3m++BTeI0a0f/3DSPYwFTjtGeUyRy5Pj5zCVdJ3uC/OouSHvVEKsF19bPbgdJ
	6b3thSNZJ+ptuzauO2xmdkbj7OiHg==
X-Google-Smtp-Source: AGHT+IGA14KLSVMCK2zV6p8As0+Jn95rbWVq+KPV+CqkNJxyiiFOFLcSxRvo/0exdQaaGDHMXMlIe6ixp4mKa1e9IQY=
X-Received: by 2002:a05:6902:1892:b0:ea3:d40a:2563 with SMTP id
 3f1490d57ef6-ea3d40a2737mr1177746276.41.1757601967783; Thu, 11 Sep 2025
 07:46:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902-pm-v3-0-ffadbb454cdc@nxp.com>
In-Reply-To: <20250902-pm-v3-0-ffadbb454cdc@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 11 Sep 2025 16:45:31 +0200
X-Gm-Features: Ac12FXy4zlU7KeT4OFE-vyI1bqh6ZB1528BpXJl_SwXQzUbCOw7DO0NcEvUZLJA
Message-ID: <CAPDyKFqBJQ92HH1tSq1rfbXV1OwbyvgChyHfv7ykJqf2A6qYpw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] pmdomain: core: Introduce device_set/get_out_band_wakeup
 and use it in usb
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
> This is pick up of [1] which does not have response in about 5 months.

Sorry, I have planned to have a look at this, but just never got to it.

> This V2 patchset
> - includes usb driver changes(patch 2,3) to give people a full picture on how it is used.
> - Rebased next-20250729 to resolve conflicts
>
> To i.MX95, USB2 and USB3 are in HSIOMIX, but there is always on logic
> to make USB2 and USB3 has wakeup capability when HSIOMIX power domain
> is in off state. Otherwise the HSIOMIX will be kept on when
> USB2 and USB3 are configured to be wakeup source and Linux suspended.
> With this patchset, HSIOMIX could be powered off and Linux could still
> be woke up by USB hotplug event.
>
> Patch 1 introduces device_set/get_out_band_wakeup
> Patch 2 and 3 are drivers changes to use device_set_out_band_wakeup
>
> [1]https://lore.kernel.org/linux-pm/20250311083239.3336439-1-peng.fan@oss.nxp.com/
>
> More old discussions:
> https://lore.kernel.org/linux-pm/20250311083239.3336439-1-peng.fan@oss.nxp.com/
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Overall I think the series looks nice, but I will make some more
thinking of this in the next few days and come back with some proper
comments, at latest in the middle of next week.

Kind regards
Uffe

> ---
> Changes in v3:
> - Add a new patch from Xu Yang to detach power domain for ci hdrc
> - Add A-b for patch 4
> - Link to v2: https://lore.kernel.org/r/20250801-pm-v2-0-97c8fb2a433c@nxp.com
>
> ---
> Peng Fan (3):
>       pmdomain: core: Introduce device_set/get_out_band_wakeup()
>       usb: chipidea: ci_hdrc_imx: Set out of band wakeup for i.MX95
>       usb: dwc3: imx8mp: Set out of band wakeup for i.MX95
>
> Xu Yang (1):
>       usb: chipidea: core: detach power domain for ci_hdrc platform device
>
>  drivers/pmdomain/core.c            |  6 ++++--
>  drivers/usb/chipidea/ci_hdrc_imx.c |  8 ++++++++
>  drivers/usb/chipidea/core.c        |  3 +++
>  drivers/usb/dwc3/dwc3-imx8mp.c     |  4 ++++
>  include/linux/pm.h                 |  1 +
>  include/linux/pm_wakeup.h          | 17 +++++++++++++++++
>  include/linux/usb/chipidea.h       |  1 +
>  7 files changed, 38 insertions(+), 2 deletions(-)
> ---
> base-commit: 1b09efec32046a9c78cfecc46a26b1b139a3e8a8
> change-id: 20250729-pm-243ff7097e44
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>
