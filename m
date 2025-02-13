Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3657220AF82
	for <arm-scmi@vger.kernel.org>; Thu, 13 Feb 2025 08:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739434433; cv=none; b=H8FlUydo9MVdqKPQrr5eywmTZuVmsUQEZ0UZ8OM+54h/vWEg+Fi33xgZEGTDqMqr2kad9BEWvj92ULOvWJ/XG2tx/7Ewxl/M1q/af2Hr+5DYzzpNVjbSUiYmIkxB7HDey5JrqC2V+PiVgvEKdOsufOhSEHjvT7MwyNSScKjZo80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739434433; c=relaxed/simple;
	bh=5vZT6XRac5Sw20P5sZfV62hmlC+ZCKjlScO/x0rmuYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y7L9udmLMlg0WYaURRdINr3ElaRwJ7qVAP+elAWzWeOI6bKlXRJVBQAwRsUQnZcpEksydOMoL5RhoquzYIY/NneO+Iz8zky5EO6fOGUbGU/sKaK3nLxVQSBq8PvUzKzZ8cvH8lZUxY+ZPQaGNItPNwing1DtWs3hWL5jrdqewiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MuPfC2eB; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MuPfC2eB"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5450475df04so557704e87.0
        for <arm-scmi@vger.kernel.org>; Thu, 13 Feb 2025 00:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739434430; x=1740039230; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OmuftgvnuZZgHkOz1gVQFljvkOd+vXnZycbJ9gQVvqU=;
        b=MuPfC2eBtclF0qE37TC0SpGor6eDz2lSUe8rO0GVTTfYif83qkpx6GrhETOgzLSxQi
         7mic9a/GLNqxjkNe2mO37hv+8xEpFxeqpL9vCnlHAJ1cZjMfOXDNSaK+WAngWmPAOkd8
         72sT3ZY2S67U5S3fmV4w6EaTs3tBYzcQWePUwbSDYfPmda5Cmd2K0+VkTaH7D+m+vYVk
         YsBTZJWKbUMh9O9oxKMJsfVZOZzr5lwGQsPLpIjk8yu8omv6OAm93yiKDOrQkOvftj1W
         pyl+/iCX4vJxJE7FOCIk3aJVU5Vk7u8wN+RpNlp7Q1HNig7PbE56M7kGkogI4QauqqKT
         tMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739434430; x=1740039230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OmuftgvnuZZgHkOz1gVQFljvkOd+vXnZycbJ9gQVvqU=;
        b=P7fm99sjjPOG8sym1/I+s52RFCAKqMZ3NpEYN8nRKJAMWwaV7XEN6PEsW1kweUEpFJ
         dFqlFwXk2a0LY9ZrmtEfVDgeGBvHKqfT7SoJY9HXoV8AA6TfdA746mIG3BVGGSMHIX+s
         1LulSkGC1pgGTKNJkz4B/SEeshYCJm2//CL78wYXQn510MCdNW6uYJyPmrX4J1Ou6Upv
         6bm2GrGgayBGJfwEw7djqnDmUT0hJ7b5NPTegJaNW8pUnocwosaKmz5xg/2ki/T5ZgzA
         UB6sq+hXM1eo+zS03hQWM4R+IFhRZ7a1tA3Ia/keg/fJw97Rn6X09MavAeZ3IZbxhd8z
         Lt7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVt+8AJIp5Br4RgCFQ64tVZMWvv3t3t0wFPopxDtacWYvplW9K0FkATlpPgSRJsIsHL9VFnFv5Q/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaKhjJzv7nyTx4JOlOo4kg0eDfXnMI05Z66uAeEZJECTPMfJ3o
	F2fNNMAMbtnT7Kalf0QBfAiSZIiaaD6JdaTi+7ofvdX5/l4tiIVCefdvakgvMXUiu/dfaBGfoqo
	mVuQKrhwu06O9RUbJf9PPTGfensS7+u0mv96Z
X-Gm-Gg: ASbGncuH1meUj2Z7UYkVV1vBIwbPcGwDx0X2nvbRLdpUHGuq5qQai8w4AueNpScMOT+
	uY3sQ74FqB++Q5br15fl7Q3njk0iesRPi/bEZn3qk/IBwaVSvFJchQgxd/6nYas/Y3BSFhPk=
X-Google-Smtp-Source: AGHT+IHxDaK7ENYXtLhPy5Kf93LWj2N5S6iojG3fU8e+7THrJ3l9WM1h9CK9jmfpQxgM8xkKRYjCh9V5QtuuPWJHPGk=
X-Received: by 2002:a05:6512:ac7:b0:545:646:7519 with SMTP id
 2adb3069b0e04-54517f86d1fmr2003992e87.0.1739434430158; Thu, 13 Feb 2025
 00:13:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com> <20250120-scmi-fwdevlink-v2-3-3af2fa37dbac@nxp.com>
In-Reply-To: <20250120-scmi-fwdevlink-v2-3-3af2fa37dbac@nxp.com>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 13 Feb 2025 00:13:13 -0800
X-Gm-Features: AWEUYZns82i0k5Ijag1LujAqT5WjKXUA5FWo3NR6_9wBOcWaDsE90ePdb8ZFdME
Message-ID: <CAGETcx9+BzSoHj54koiGniUOUPfY9yZ9cAedbb2A-hb+2D1sGw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] pinctrl: freescale: scmi: Switch to use machine_allowlist
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 19, 2025 at 11:14=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.c=
om> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> With machine_allowlist, only allowed machines have pinctrl imx scmi
> devices created. The fw_devlink will link consumer and supplier
> correctly.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/pinctrl/freescale/pinctrl-imx-scmi.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c b/drivers/pinct=
rl/freescale/pinctrl-imx-scmi.c
> index 8f15c4c4dc4412dddb40505699fc3f459fdc0adc..058b4f0477039d57ddae06f38=
5ad809cbb4784d6 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
> @@ -287,11 +287,6 @@ scmi_pinctrl_imx_get_pins(struct scmi_pinctrl_imx *p=
mx, struct pinctrl_desc *des
>         return 0;
>  }
>
> -static const char * const scmi_pinctrl_imx_allowlist[] =3D {
> -       "fsl,imx95",
> -       NULL
> -};
> -
>  static int scmi_pinctrl_imx_probe(struct scmi_device *sdev)
>  {
>         struct device *dev =3D &sdev->dev;
> @@ -304,9 +299,6 @@ static int scmi_pinctrl_imx_probe(struct scmi_device =
*sdev)
>         if (!handle)
>                 return -EINVAL;
>
> -       if (!of_machine_compatible_match(scmi_pinctrl_imx_allowlist))
> -               return -ENODEV;
> -
>         pinctrl_ops =3D handle->devm_protocol_get(sdev, SCMI_PROTOCOL_PIN=
CTRL, &ph);
>         if (IS_ERR(pinctrl_ops))
>                 return PTR_ERR(pinctrl_ops);
> @@ -339,8 +331,13 @@ static int scmi_pinctrl_imx_probe(struct scmi_device=
 *sdev)
>         return pinctrl_enable(pmx->pctldev);
>  }
>
> +static const char * const scmi_pinctrl_imx_allowlist[] =3D {
> +       "fsl,imx95",
> +       NULL
> +};
> +
>  static const struct scmi_device_id scmi_id_table[] =3D {
> -       { SCMI_PROTOCOL_PINCTRL, "pinctrl-imx" },
> +       { SCMI_PROTOCOL_PINCTRL, "pinctrl-imx", NULL, scmi_pinctrl_imx_al=
lowlist },
>         { }
>  };
>  MODULE_DEVICE_TABLE(scmi, scmi_id_table);
>

Definite NACK to this. Please don't depend on indirect
conditions/flags. There's no guarantee that this check will hold true
in the future.

-Saravana
