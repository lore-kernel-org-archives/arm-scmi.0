Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADEC22A7E0
	for <arm-scmi@vger.kernel.org>; Thu, 18 Sep 2025 15:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758208507; cv=none; b=CFbandQj2l0vs3yQPXmiK5FV+BL4C+zoKd+vjj3Xv300fzi1jLwTmvYKneOmUKgN93CrcsDl9bJ6hIwLda6oh1UMmLy+uWcQN9nQ++LhZwp/WQ4P/OR5pFiWjdPVs9QvMGZtXnAz0ifv8+VWXVy8NiPMzPfNeR/pFfgmO93L1B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758208507; c=relaxed/simple;
	bh=W5nTjMEiqZnba5g8e3Gi7lUj7gQH38jU4DdLi32iJEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sw7Hw6mw353pE3ytAwA/6HIL+16SCjiDl6olU5bG+aLX7PTyKDiu/d5Ujfjn8nHRJ27qLJQ/8wlhW7yxceTyBd9nSDRXXugqBftT/7evfgSaNmdfH6CSBwauXeVgHx9CHYLc7op9t/ZdI9GwNgZJ8NoPz/OwWh4PPAYjPi6mw78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zp/SOqSq; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zp/SOqSq"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-723ad237d1eso10826117b3.1
        for <arm-scmi@vger.kernel.org>; Thu, 18 Sep 2025 08:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758208504; x=1758813304; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OFt6YzhskfMz4G5ASFBcNJdSZpqtygY9kyuCw6Wbqgk=;
        b=zp/SOqSqSMI5TW4vac7YZCkoM9yhF0pMqb0QTI0ezQjs1cYd0yO6U+s5kfa6TAT35K
         EuEhHFpdmfWDaWGY/EQkP/ejyIhf+H8vvhUMfYXBq/x0xjBcU+Bllk6lXsr2eccMd528
         4P8EpBsktYPSTCPwv3th5y8rtpFaUwFMwSoiRSGleDnx/TXO5dJE1t0VXgLBnE8L+02i
         gUChk7v08DwLvgwe0mwyPBWDCSFgqvUwk4fN5kwbX4ZaknTZmMS5Qo4UFxrqcm+KagT2
         Unnl6S72aYIYHH5+vX0CFZ6YeXuRLd+WSz1LsN310YMoO608Hk4933mL1tRto5OOVAyC
         KuDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758208504; x=1758813304;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OFt6YzhskfMz4G5ASFBcNJdSZpqtygY9kyuCw6Wbqgk=;
        b=o6cQaCzRGBkh1f2Hm3j9pqUO7Vf87o437qRXsMnBMaVG1i38popEP61VBEfW1X7yMk
         rEM+sqMVZ3K4jRz08S+hfJ11vzOnefmZoD2UhnLivcIRmFwS9PA4/Ag/9xwPA+1FZbNR
         PeVn92pE9p8pkVSlrKCUYeEo+edYhz/SKq6Dx9YjauK4JoMqVuCFpCZ4GD9PqLg8OcVM
         Pw9A+KILKVR8nZpPYD2zdqz/mhV+BLf61gQ14VwgosYF4AAoqEbTDQS0c+JNco6mmtsM
         RZi0CZJcwWaPhSvqgiZ/41GPxpB+4gFH3rTGoyDyfsypKs6VsxRwsE8cehaTYnG1lGfd
         JckQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5ZFfXFJzdUU8gSk1bWOHJHjzc/HlDQYJOfkzhhBV0E+q4R85qBLOrHne7isbms/VSeax+8aBwJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHhqrNvCIifubgcoSUhqNxsDKgjkQOsrbBmhzmEjOpkUnsS4QN
	RyoLxoaewOh5Ku3os/o0R4AjAFNDs/1lBC/Adsn4UumGOv5ZHwqlYcGNAtQUGJ98Bxggykm+Pga
	2NMzncvOEdF7/ZPFsLZy0dQ1Qcoiw8HGuIWAdExmb/Q==
X-Gm-Gg: ASbGncvt2giG7mpuX0HTtNaoEDQq94bO0fiOSU8fhiWl5plTBsFV5D8o7QB6KIXCKBm
	Sre6t3h//ASnVM6Kz8q4jp4x0dfx/VuqXlLfLJN6YZTH0XS0JJjaap7axTvR2nIAdf5bpboTlpe
	kchmVPM6RJirjE4Jejg7SeMelfu6fjSWr1tgzlyqHnkiSRM4qHe6o2FuLAJTfMfazIEzy9bx9t5
	S3F+LDAU+PWQzKebMk1GeVXmEo=
X-Google-Smtp-Source: AGHT+IFWx6n1PzkYYp5utqUHYs3cajDfg2GyxSlUHuEjN16hnOdbRT6rrrmIdLRynF4h/+ErT5T1ASVcKks2d63Qrt8=
X-Received: by 2002:a05:690c:7281:b0:731:6570:132 with SMTP id
 00721157ae682-73891b87069mr62837047b3.35.1758208503588; Thu, 18 Sep 2025
 08:15:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902-pm-v3-0-ffadbb454cdc@nxp.com> <20250902-pm-v3-3-ffadbb454cdc@nxp.com>
In-Reply-To: <20250902-pm-v3-3-ffadbb454cdc@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 18 Sep 2025 17:14:27 +0200
X-Gm-Features: AS18NWCdTZsclOkAHpdSQCQjKeMfCrt_EDcLieD3X8xYbm6A6ARROAgFxf2mSRY
Message-ID: <CAPDyKFq1Coz4rbdam01s3pOCDa=Et2ePmf7niLSgOdjCbnEANg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] usb: chipidea: ci_hdrc_imx: Set out of band wakeup
 for i.MX95
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
> i.MX95 USB2 inside HSIOMIX could still wakeup Linux, even if HSIOMIX
> power domain(Digital logic) is off. There is still always on logic
> have the wakeup capability which is out band wakeup capbility.
>
> So use device_set_out_band_wakeup for i.MX95 to make sure usb2 could
> wakeup system even if HSIOMIX power domain is in off state.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c | 8 ++++++++
>  include/linux/usb/chipidea.h       | 1 +
>  2 files changed, 9 insertions(+)
>
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index d7c2a1a3c2715967203b98c819fa864e06a00a32..a2b3f673dfc1183a02783bf6ef92f8570c6042cf 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -79,6 +79,10 @@ static const struct ci_hdrc_imx_platform_flag imx8ulp_usb_data = {
>                 CI_HDRC_HAS_PORTSC_PEC_MISSED,
>  };
>
> +static const struct ci_hdrc_imx_platform_flag imx95_usb_data = {
> +       .flags = CI_HDRC_SUPPORTS_RUNTIME_PM | CI_HDRC_OUT_BAND_WAKEUP,
> +};
> +
>  static const struct ci_hdrc_imx_platform_flag s32g_usb_data = {
>         .flags = CI_HDRC_DISABLE_HOST_STREAMING,
>  };
> @@ -94,6 +98,7 @@ static const struct of_device_id ci_hdrc_imx_dt_ids[] = {
>         { .compatible = "fsl,imx7d-usb", .data = &imx7d_usb_data},
>         { .compatible = "fsl,imx7ulp-usb", .data = &imx7ulp_usb_data},
>         { .compatible = "fsl,imx8ulp-usb", .data = &imx8ulp_usb_data},
> +       { .compatible = "fsl,imx95-usb", .data = &imx95_usb_data},
>         { .compatible = "nxp,s32g2-usb", .data = &s32g_usb_data},
>         { /* sentinel */ }
>  };
> @@ -570,6 +575,9 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>
>         device_set_wakeup_capable(dev, true);
>
> +       if (pdata.flags & CI_HDRC_OUT_BAND_WAKEUP)
> +               device_set_out_band_wakeup(dev, true);
> +

Based on my comment in patch1, I think we should set this flag from
within a system suspend callback for the device in question.

[...]

Kind regards
Uffe
