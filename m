Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632627;
	b=YDkI54c0Ou90GgjT4te/ZiMUXxXhzOS03p8Hl7aUVtdYaobWgrkNMsLM5atZZxDh8d1E
	 lrzcAlWpc9bqHMe/KjBPYgDkHzRWz8/bLldrvI4X3PjyZthgpYjZwCTm2NPcHnto/t3hc
	 v9L6Ze6B9Yg925xsFkrcAgz2wZ7D3cm2fk0TMi1Gi42NswIrmbaGDPuZO6DYnDfFPIqiD
	 ruHZNYMJkWBP9XTNCfJ5ahSTKHKyXSDa7fe50rjRenIg6VTjGtKUZSxFE4PFJVmTOBQ1s
	 OpuscCSOHzL1FRcGuZKJNPtlnCkf2Ek4LzWVpReixEsfjU6k++HhYE7Q4yDZRPEjRGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632627;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=U0l7WVFvXpjEU0OpudERY8yo7FO9CgUbNGWQ7+crlsQ=;
	b=jEKZTa9GM7aOlt2K9qXHVVRq0+pa+Nda7W31AUZhav8Dgf4CCpgY1PVCXuZprQhcwN4l
	 umtgrkE0k8bA8XBTJmDOGGNI6WhWStPgIQ/leCw0TNf6v6Kg1OXdJjqWDv1Uz98bDyuFW
	 HoSwaZ675wtVJVGN3m7P+cFyBUFTua8K0xpwP286feuD7OAjd4NK8JHWr4opb5AEpcR0h
	 zDbMSdlaxhOfoZxnJRC2fc/AEk5oqlWFzVkGshSmrLRVOUNQhy9Uc73/wlq6Wo42JPgzJ
	 8PcswForldUiud5eW4XJ6gvSl2UdvhpJ5xqrZSZexQmlTOguMsCth3UOx+nxPnxoaOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fKzucNgX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39A4606A326
	for <arm-scmi@vger.kernel.org>; Wed, 25 Nov 2026 18:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fKzucNgX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A6061F000C0
	for <arm-scmi@vger.kernel.org>; Wed, 25 Nov 2026 18:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795632626;
	bh=U0l7WVFvXpjEU0OpudERY8yo7FO9CgUbNGWQ7+crlsQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fKzucNgXaXd8pxmoDRYhybOX+fEH1GF5f16zWQ58OdJkXSw+f0xwRkZGh+h106zTn
	 lsyZdUpz8dqMpKxOiGkEey4VZaFgJARpIWPbueRLHDPMwiCymoeY9B2+ccd6gX0VLH
	 icAZQKiMZtWhtRsNtR1WFh56VfWn71ZHSo8kIwzBxzmY1C/ocC4dPjeHm3EVxLmMhr
	 G6czeuieY9ZIV+q3ms9S+aBWGbsjjs6bz0hgyGnDKUKhDbvg+V22DtOuRL8lLn/uuV
	 vPNjF0gbAxJOMXykbHM2BQUhTOidMTLvDH8SUTZKKaSE+3D9EhYI30WqH/sAwrTX39
	 LzmGbaEDccRWg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be3cff0f6cso4041176e87.0
        for <arm-scmi@vger.kernel.org>; Wed, 25 Nov 2026 10:50:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGOQi21pIl+fa3Uu61loe5tDw38bEZ+95E5e2RKiRZgMkf6MyOnUrJMdbiZnOl8h5vUA8UoWbIlGQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9ixVtP3yTjbQV13RtPRVGLTZNckg0mosqTvbm2oiJtiVD6kTqw
	jl+1o1z+6ssBgRa1VQPYzRg8Sw4k+wjuqUgta4T18luR2rwDOrryUUWmODbKico6TSlhpyp6MjE
	2Nps6bIKLJY4lW41fh+f+KbXjAOye1rA=
X-Received: by 2002:a05:6512:1322:b0:5c1:4974:c156 with SMTP id
 2adb3069b0e04-5c1bc802cd2mr6359763e87.40.1795632625298; Wed, 25 Nov 2026
 10:50:25 -0800 (PST)
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
 <20261123-clegoffic-pinctrl-scmi-gpio-v3-1-d61f039be008@baylibre.com>
In-Reply-To: <20261123-clegoffic-pinctrl-scmi-gpio-v3-1-d61f039be008@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:50:12 +0100
X-Gmail-Original-Message-ID: <CAD++jL=V8J8VJ8zYeu5f5zB8mqM1ZoOoodbW-zmP1quNXz=znQ@mail.gmail.com>
X-Gm-Features: Aa3M54pDxjkO5lpUY9qHeq4Q4S0VXapxN7M0DHf5GY2RQ8jSNk-Y0rUOtTnHVUA
Message-ID: <CAD++jL=V8J8VJ8zYeu5f5zB8mqM1ZoOoodbW-zmP1quNXz=znQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] pinctrl: scmi: report an off setting as not set
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Peng Fan <peng.fan@nxp.com>, Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 4:21=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clegoffic@baylibre.com> wrote:

> A get of a setting that is on or off, the flags and the pulls, returned
> 0 as a value, so every one of them showed as set on every pin. Return
> -EINVAL when the platform answers 0, which is how pinconf reports a
> setting that is not active.
> The input, output and schmitt enables keep their value: 0 means disabled
> for them, and the pinctrl based GPIO driver reads the output enable to
> tell the direction of a line.
>
> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl=
 driver")
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> Signed-off-by: Cl=C3=A9ment Le Goffic <clegoffic@baylibre.com>

Patch applied for fixes.

Yours,
Linus Walleij
