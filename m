Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A7423507F
	for <arm-scmi@vger.kernel.org>; Wed, 21 May 2025 08:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747815181; cv=none; b=OC1afISbBWtmN6KVrbHiAjn/szhnTyNJFrRB4rIJGjtt03MO5CCvvjN2MzpMOKXUXtvLYhi6Fw8/lksJutm1A/6pVtEUQqVOAcltHdNMhA0VPZ97yvHgiQD1urbUbeKwIYHHf4oTklDD3zYGFbM9m9Q4Wu+Ef3sArAEBZavX2wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747815181; c=relaxed/simple;
	bh=pwr4z+M06i1mMSwv0rCr5dUsFp06XkoBxQnrw1/GtgI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l8Xe+YFrpBikQv0iTy1wUB+oKvuUriZQ0/raSytcOfA+GWPrpug89HbdaJFc5qIPdNKj6FiVR4erzVfOBtgMMhMY7L/bxQKP/2binUOo9VmwxXjjJ4NiRfYa8U2z0xRlcptP2zPPEp4CEGr1r8o1I/JBfYlNZDxrmOagS8EK8L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kwl9jdI4; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kwl9jdI4"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54d6f93316dso7694038e87.2
        for <arm-scmi@vger.kernel.org>; Wed, 21 May 2025 01:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747815177; x=1748419977; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwr4z+M06i1mMSwv0rCr5dUsFp06XkoBxQnrw1/GtgI=;
        b=kwl9jdI4gepQiNSB1P4yfQ2Tw2FZBKrS1N6pu6ERnUuZisi1vQtgc4xCAdka00OUKu
         GEr2Oz5ejOiCMrmmzTin27fQplCOCv9rGTAH/jhf9F0r5uArShzuJmeWWxfW8qxLRgaZ
         yH3SxL1XQWHbeLBDSIV2fRvIqPUDuZBPgJFIzWzJ6WoNpMuMcJZUDYgSTsUMqZj9E0Qq
         hyBckkk6OJ37sCUm38EMxXQEIpyAsaDPAVgTVVSbMKlbp2dqyMTLINHVm/pCB0Goi+mB
         O7YKEo/erjZhn4gV8Duztm+l+s2lj+w8IRNUfE0xFkZR+lyfdKiSHPD3NXr5m7tyYK+d
         v4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747815177; x=1748419977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pwr4z+M06i1mMSwv0rCr5dUsFp06XkoBxQnrw1/GtgI=;
        b=OzhB0zS12zAzFjOeb0AJ7nG3KEbka3yVju+9uBZRzHzF4SAdvbQoGXnU1JLackA73p
         mmutrCjgtd5afaoDcG4Bd7qqkXSrDjOmphpOeEAFgbw6CDSR+fLCrW+wKVrgTYCMDTIq
         1HBFKSzjUzRylmunHpVS/J+7FdDQFViqN2Zu8aL/B5wPrsbl2Lwkn8fXFfvi4R0Ths44
         rdP64NkR18E9kaUjQlWUeSUy4CV6fVg4wcf7pgqm3dxltDgdqr7IQWc3f6lgEaWBZoIF
         SEeRBESG3emQhffdqf+aOfoiRqLQF6gnJaxqEIZ2MSIln+hh7RhO0DJUHoNVSC6GpiI7
         uV6g==
X-Forwarded-Encrypted: i=1; AJvYcCUsl/TenSiq72VM0cM2cUJwD3Av4HYvoQc5K1vug43eQ4ecXQ2BsX4s3vJZGbl9NJhfFsXsMRKlAw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8CqTrf32Rd500XB2ikJT2dvknpSn0SOIx3jE/Lyw6G4Qw6Si8
	HE9XUKyEWhwwQnBoiy3zDbOAZ4ze2Fd0qP8wMzTxtsYPS461zE5cfeD2Selo0q8D8IhyUX8s8UP
	wSKN+mNWCJSOYNFn/+yIsvPOQyq/NOdvyjd+xgVgSsw==
X-Gm-Gg: ASbGncvefaGZXx24WPw7CM+2sV0Kpa6pzbdT81HfJsqG3/N5qDNGyKNY1cGvdo0ExO3
	7/xLIhvgGczCp0z+NUTimhC9TcR870LsxMCN9qTlT4PRugBXWX1W2bn9EQnU9G0rBMVJNS1WKHt
	nuOLHk+uGy45Hs4sgNaONBqavEFQLfSlRvbARhaYATs6I=
X-Google-Smtp-Source: AGHT+IHypaEtLgbAx0hI1pwfX+02JjmtIZJY41Yl+79R8Nfu0dbAldHSIKhHCLmxFeUhAu+kg3UiZtw/f5zBM85OvXE=
X-Received: by 2002:a05:6512:6805:b0:54d:663b:bda9 with SMTP id
 2adb3069b0e04-550e726811emr5586519e87.51.1747815177553; Wed, 21 May 2025
 01:12:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516100423.1685732-1-ping.bai@nxp.com>
In-Reply-To: <20250516100423.1685732-1-ping.bai@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 May 2025 10:12:46 +0200
X-Gm-Features: AX0GCFtWAB87B9iw-eCTV-w3vbrXw3ATM0xxduBEOTn9gKp9rC41cR3ebYjTvJQ
Message-ID: <CACRpkdZ7iymSvvst8Gi3EaeG--2icRgkoKEiJxxjLgC2LCDW_A@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: freescale: Add support for imx943 pinctrl
To: Jacky Bai <ping.bai@nxp.com>
Cc: sudeep.holla@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	cristian.marussi@arm.com, aisheng.dong@nxp.com, festevam@gmail.com, 
	kernel@pengutronix.de, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 12:02=E2=80=AFPM Jacky Bai <ping.bai@nxp.com> wrote=
:

> The i.MX943 System Manager (SM) firmware supports the System Control
> Management Interface (SCMI) pinctrl protocol, similar to the i.MX95 SM.
> The base offset for the i.MX943 IOMUXC Daisy input register differs from
> that of the i.MX95. Update the pinctrl-imx-scmi driver to add support for
> i.MX943.
>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Patch applied, expecting the compatible string to come in from
another tree!

Yours,
Linus Walleij
