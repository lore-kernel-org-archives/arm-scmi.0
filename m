Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DC33F7A9D
	for <arm-scmi@vger.kernel.org>; Thu, 26 Mar 2026 12:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774527535; cv=none; b=Dr4YxoLhvgWWAWXptltllZnG4ELEZme5X5SkLF2+PozG0+u7mRQEx7JNMF2YgvuQOBEFIceqo4Yv2Dh73WrrvAnmexSS7rJGCIThrLNWAdLL7X1VMu8XqGAFkwJLmPyf5Ir3PJBg7uMD6REgPv+0k5QFz/7pMK1MDMpP7GpMtSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774527535; c=relaxed/simple;
	bh=HIUrLQKuXUz87aJ2RCdAPwzeOral2MaX3sd6kq80VeU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cDMqAZeK+Tonm2cMkFiohf6Ee3+FJmYnQTiYovbtxsogRV5iKs4GmFEWYtK4XjOXy31khfO3D/D7Fky/9mSXG1OjVwoRWCT/R0zZsXgtMBrOfwHzkWhLGTjKaF6ejRLXh9ivnutybMdUsXQ6lnPV/FHMBsQv3m8N5AGtUb2iUZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TtZ8swj8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TtZ8swj8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F18C2BC87
	for <arm-scmi@vger.kernel.org>; Thu, 26 Mar 2026 12:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774527535;
	bh=HIUrLQKuXUz87aJ2RCdAPwzeOral2MaX3sd6kq80VeU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TtZ8swj8CDGI4c9WClKIkiBGLcmfqItkpcRX9gpGj4nlzRXb37emwzteEtz8Pb9zG
	 zYz2xDGsyW66fYc9T0QEzaDRhKG3vPz7YaF4DL87uqNNhgnSGjQ+vxF8wDLbz6PwmA
	 K6q1q+fVbACoqm1JtYC7UlJPUUR0/5+ueEslofJ30BiidzqlQuRzi/7lNvwltd7BsP
	 DmWge/rauvNuLm38Qju32mFW854k2NvqLv3UC1CHh24TswHNcRp9EU7u+X0Az39UrY
	 MXLOJmul8IBHPShNfWLZhXVbe03bmWVnqLFydZww3cjHHEeOXQhPL4lULGRNW76Yo1
	 2Yg4a3NV9xaDw==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79a8e873ca1so24718247b3.1
        for <arm-scmi@vger.kernel.org>; Thu, 26 Mar 2026 05:18:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXbsWlss8fnyHFBWgItH4SCIfmlRQ6Bagvm3gYHxriW0QkOU+cs7XueRaC37sUJOEoFm6n6QrnEIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg4OcdlUgKth2hm7VHmj3Z7lL5EKxQ4/BwSlqUD1qtByhHLkUb
	XvVKyVuFQdL9h2EFcFXtDhksVHSKsPzHiLR3q4KZFmHbw/PJwddkhDmQtwkBcwCa4YRZ6bWvcO3
	EHIArXCbaO+qkrYrK4KjxsEeb6VCL4Wg=
X-Received: by 2002:a05:690c:260e:b0:79a:3470:3151 with SMTP id
 00721157ae682-79bd0276576mr10940717b3.31.1774527534682; Thu, 26 Mar 2026
 05:18:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1774526652.git.dan.carpenter@linaro.org> <46f9b46210436e73d17a866424a00529439ce1ba.1774526652.git.dan.carpenter@linaro.org>
In-Reply-To: <46f9b46210436e73d17a866424a00529439ce1ba.1774526652.git.dan.carpenter@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Mar 2026 13:18:43 +0100
X-Gmail-Original-Message-ID: <CAD++jLmxKJ+nfOaPk-n0_9Hi82Hf6LpTAgzq+1MUN8V2or7pDg@mail.gmail.com>
X-Gm-Features: AQROBzC4CW51JFqSXDuCGtrxpNW6oAzclgU63UsS9ybuC13rPB4E9MTO2i3LDSU
Message-ID: <CAD++jLmxKJ+nfOaPk-n0_9Hi82Hf6LpTAgzq+1MUN8V2or7pDg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: scmi: Use standard device tree pin muxing format
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>, Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de, 
	Vincent Guittot <vincent.guittot@linaro.org>, Michal Simek <michal.simek@amd.com>, 
	arm-scmi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 1:08=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> In the original code, I wrote a custom pin muxing parser but the
> upstream device trees wouldn't accept something like that so it would
> have complicated mergine the device tree files.
>
> Use the standard device tree format with function and groups:
>
>         pinmux1: pinmux1 {
>                 function =3D "f_gpio1";
>                 groups =3D "grp_1", "grp_3";
>         };
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

I can't verify the code but the change I want is exactly this so:
Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
