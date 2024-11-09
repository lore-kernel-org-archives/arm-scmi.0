Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10F323A9
	for <arm-scmi@vger.kernel.org>; Sat,  9 Nov 2024 00:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731110701; cv=none; b=ohe+yQjRGv6sfYTyLP8Z5cxuAIT3lyPL67rZSTAAjmr6Q1i04M4ekrapLAQysIeA9JgjwE5xT21yyFhDR+PTNB3rl5ZTHsqQfqX+MRIHE0sXeK8DanwaORgHfFD+yHBsjz7r+E9m7N7Nk5NzyE6mM+UZypo90quuHg3oa8uhiNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731110701; c=relaxed/simple;
	bh=M316E82Sl4S86b6qlEWBAWKUyt3a38oyo+IQt3556+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=grYMEUWim0WAXbE3I6Ilqg12BXLJbP8Le6UvWOc9ZKX//kqwdeb+byvag1Nb8nqLMqHaReQmm7IeHnq+QsqrC5usO9reEGmr+DFk/vNuqSu+KzjzMM0z3Lon+iQlnQQj/sB/1H/mEAjMcCN4jnqzl1OuPs5cpXmcnlzS7K0pf+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FBI+Tioz; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FBI+Tioz"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb4fa17044so26694891fa.3
        for <arm-scmi@vger.kernel.org>; Fri, 08 Nov 2024 16:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731110698; x=1731715498; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=apce7z+9/HqI56HYo2yGxuMN1Jmh3xMOBMuUWKs05Ek=;
        b=FBI+TiozkXsfEXh3m6a0tnXXjIeHoT3tudPxolX/8ZNdKzCwXyaCW32Bklhi0/FPJQ
         g8Z2fYbZEzYEWjQO4tjlO0y8BJvfN6CYwRR4aqbpPw4OshrsP8P84shZ1GxVXBOmjKwJ
         bpW3fq900QSqatcRvvIj1RPQZCPTVOeu8FtwNxWunMx1BEDXG5TEtbO9IqTSOMmc1W3r
         edX7TRcFmsCxorqcakPbBQ7RNz2MnwWTO302dkXNU3SkjrxBK3u4vN8C3kAV2m70e8fm
         XQEhhrCoWDlT3RpaMAmjCQei0X9cWcNVKA6KF9bBudmZwbx0XQQxeayPg4reaQnOU997
         AEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731110698; x=1731715498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=apce7z+9/HqI56HYo2yGxuMN1Jmh3xMOBMuUWKs05Ek=;
        b=tBW8nVhRmAAuGxNbNw3PNUkWxNXLvJDuFIXduOnbn1abRWuR6ffSCH5AG5TefVP89n
         AXz7WkxwZmvxlSPH3U+v9YMCVpXxb6v6vwcWxwP1WgkhZMMC6XXlHd8swDfNwMlvooA7
         bArwXXCtKr8SqbQCKhr/oi6njDf3IBsqxndTfvXuKGswWZ1uJ6h7djeVtlnhh8qc+w5S
         5KUGNgeQ2Y3WHUr2oUspgDiPVzZONWLIOdlWrfNmeyA1gldWTFGvLkq5OfdkHZ+2t10A
         a6fYtTeQRQfZUBvk9gO8SYaafO5zKg+7YlPntslvqKKO0KrE0YsMQH41KpvcksEe3QJg
         yebQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9VvD8jLSwcBvDgW6WHCm7oYK0eT0R8GFrJaT7JyCo1pGwKc+Fwhs4qo9tu6RGkvUfyS9jSgK2fg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJRQc2Zmvbl5Get+uuc+QfjCMNnq9VdHqwodwTwnWRjcMc8KTc
	MH6gi+Na4Ul2rulawdUySp3dRVz/wzuqpzJkKxTN2611c9/hLR1ZdvseW/vq+mpkgUcaipkokdH
	tpa2XCVEvQ34AEn9M4Whatbp+mIu3zHqrjFmOfZGOSWWDWUINwpk=
X-Google-Smtp-Source: AGHT+IFrw1EFKqbo5aJq9uhof44iVrZvIooJWRjeaVMEY05USiYKqGbPyqPFtl3UNMjuANsgdlutxlq+SDaLQHlCofg=
X-Received: by 2002:a05:651c:2204:b0:2fb:8df2:13e6 with SMTP id
 38308e7fff4ca-2ff2028aae7mr23640861fa.26.1731110697946; Fri, 08 Nov 2024
 16:04:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c5fdc171-0dc7-4c38-88e7-fcf9de7cbec2@stanley.mountain>
 <ZyCuAKfqRnuFdAwC@pluto> <f305d661-71e8-48c0-a6a5-4271c0436bc1@stanley.mountain>
 <8ff3c048-f1f8-4ec6-9f7d-5b3982dd45fe@arm.com> <2f80b972-ca70-4c87-b5e8-147505b2a90d@stanley.mountain>
In-Reply-To: <2f80b972-ca70-4c87-b5e8-147505b2a90d@stanley.mountain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 9 Nov 2024 01:04:46 +0100
Message-ID: <CACRpkdZeMtKsGVRW9Ju+d6RHPKkyvCK7jMhZpyw_Fw3RjgTk9A@mail.gmail.com>
Subject: Re: Question about identifiers
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Souvik Chakravarty <souvik.chakravarty@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	girish.pathak@arm.com, arm-scmi@vger.kernel.org, vincent.guittot@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 5:08=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:

> In 4.11.2.6 PINCTRL_LIST_ASSOCIATIONS it returns:
>
> uint16 array[N]
> Array of group or pin identifiers listed in numerically
> ascending order.
>
> In the linux kernel, a function can only have group identifiers.  If you =
wanted
> to have a pin which provides a function, then you'd create a group with j=
ust one
> pin.

Since this is what e.g. Qualcomm, Apple and many other platforms do,
I think it has been assumed that "everyone" does this.

However in that case, in the device trees we have often used the
property "pins" instead of "groups".

See for example arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts:

        /* eMMC pins, all 8 data lines connected */
        dragon_sdcc1_pins: sdcc1-state {
                clk-pins {
                        pins =3D "gpio167"; /* SDC1 CLK */
                        function =3D "sdc1";
                        drive-strength =3D <16>;
                        bias-disable;
                };
                cmd-pins {
                        pins =3D "gpio168"; /* SDC1 CMD */
                        function =3D "sdc1";
                        drive-strength =3D <10>;
                        bias-pull-up;
                };
                data-pins {
                        /* SDC1 D0 to D7 */
                        pins =3D "gpio159", "gpio160", "gpio161", "gpio162"=
,
                             "gpio163", "gpio164", "gpio165", "gpio166";
                        function =3D "sdc1";
                        drive-strength =3D <10>;
                        bias-pull-up;
                };
        };

All pins have string IDs "gpionn" because they can all be used for
GPIO. The name means nothing however because here they are
used with function "sdc1" which means they are used for MMC/SD
signals, but:

        /* Interrupt line for the KXSD9 accelerometer */
        dragon_kxsd9_gpios: kxsd9-state {
                pins =3D "gpio57"; /* IRQ line */
                function =3D "gpio";
                bias-pull-up;
        };

Here the pin "gpio57" (which can do other stuff) is assigned the function
"gpio" and thus turned into GPIO mode.

Allwiner and Renesas does this too but has a shortcut inside the
driver to put requested
GPIOs into GPIO mode directly so the GPIO function never appears in
the device trees.

Yours,
Linus Walleij
