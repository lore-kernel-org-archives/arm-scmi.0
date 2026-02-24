Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492D92D876B
	for <arm-scmi@vger.kernel.org>; Tue, 24 Feb 2026 09:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771925633; cv=none; b=UENukghcO970/xatkzxVpHucDQ0TF16uYKbqmkxD2MEmirstZkixn/9vtkybs5KsPgMNadbkcXTD7yBPuv4Y+0qAPqjS8blwjyKAqMmg+ZMkdkUPCtzzfkwf28x+rwvNVr51Dr3E+mEKczQReCm3D4hO1XWd6KePzifHQu8GYI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771925633; c=relaxed/simple;
	bh=SuL6pth4ioT31DfBcqxAotMpYtbob7ZaDZ5zIZ4ZVZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aEpPPA53K8/2PmNSHf+17erSBkdTRepbkLlhcZ4dgaugo8+tcUeATElqR70tGVBSZXIHjVIwsW4o+vyychrgSVE4SzNCsIiTU0gqsZV+2gO+vle45n3TReFErjPIL3msNLV93fFrrHyPYPQWHoMFA38nrlNyscvUnQTiX73cO0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B+F/rSlR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B+F/rSlR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7CB6C2BCB4
	for <arm-scmi@vger.kernel.org>; Tue, 24 Feb 2026 09:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771925632;
	bh=SuL6pth4ioT31DfBcqxAotMpYtbob7ZaDZ5zIZ4ZVZY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=B+F/rSlROH8cfmbnAj6tWp/pcTqbqtdihhbBqJ52cnrMsAUQTicWWgNsW4LwaIRgR
	 MmuZWJTn5bKa2KmjQlUyJ2pal094QRCnH4Ig5vR0433FqZbUllkYnMfqOGVJoChfZU
	 ctBtsnGflnqALQ+NwBZQBgyYxbjjrWJUhD1WH7mmghhTfQDw2NLkOSDCEF25jJN+qt
	 CAecSxoU6QHojGPJNDPNTVeHLYBEtOSxSbWgFQ5XIezTG5uDApmaVm5pHXlmNn+xAI
	 kZcXPP11qZXYBfqgG7vdx83Zp60RVtWBnJsv1yYYxAssbDWEtpQRY2qPiP0qbQX3MN
	 K+7Sc9MvkbiDw==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-797d6f934e2so51621747b3.0
        for <arm-scmi@vger.kernel.org>; Tue, 24 Feb 2026 01:33:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWcwS3Wdep9X4sgHB3cmkpisoYhMRVkz+3bDQtHIVIWACZzJDaFJNlK6jrmXVnrEBXcz2f/VU87IA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKqGxhYb2CyVgKf523Rdu1BFTAiuAdm5/HV02yPIIa7m/j39m/
	yqxqs2H/NX9g7lAaL2DhJMblOlMScYSrkAqdk9nqKQnrqxvCAGzNxPA8kEpXfcccpCmD3yEDJRR
	/py0AF3AhbLjR4Rhd9E/rUsap5OBC+AY=
X-Received: by 2002:a05:690c:e:b0:794:ff4d:9233 with SMTP id
 00721157ae682-79829174e81mr116805647b3.59.1771925632028; Tue, 24 Feb 2026
 01:33:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1771856828.git.dan.carpenter@linaro.org>
In-Reply-To: <cover.1771856828.git.dan.carpenter@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Feb 2026 10:33:41 +0100
X-Gmail-Original-Message-ID: <CAD++jLkWsgENcCxqnYmkP3kgdWJFKJ72_aZX1r_Qjjc+_q5qGw@mail.gmail.com>
X-Gm-Features: AaiRm53mXlP6ro7ZopYdVjuysdkzv8vVDtuaFLVGv5D--fvV3r8CikAJanK8DVo
Message-ID: <CAD++jLkWsgENcCxqnYmkP3kgdWJFKJ72_aZX1r_Qjjc+_q5qGw@mail.gmail.com>
Subject: Re: [PATCH 0/4] u-boot: add SCMI GPIO/Pinctrl support
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>, Alice Guo <alice.guo@nxp.com>, 
	Anis Chali <chalianis1@gmail.com>, Arturs Artamonovs <arturs.artamonovs@analog.com>, 
	Eoin Dickson <eoin.dickson@microchip.com>, Greg Malysa <malysagreg@gmail.com>, 
	Ian Roberts <ian.roberts@timesys.com>, Jacky Bai <ping.bai@nxp.com>, 
	Leo Yu-Chi Liang <ycliang@andestech.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Marek Vasut <marex@denx.de>, Nathan Barrett-Morrison <nathan.morrison@timesys.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Oliver Gaskell <Oliver.Gaskell@analog.com>, 
	Philip Molloy <philip.molloy@analog.com>, Rasmus Villemoes <ravi@prevas.dk>, 
	Tanmay Kathpalia <tanmay.kathpalia@altera.com>, Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de, 
	Utsav Agarwal <utsav.agarwal@analog.com>, Valentin Caron <valentin.caron@foss.st.com>, 
	Vasileios Bimpikas <vasileios.bimpikas@analog.com>, Vinh Nguyen <vinh.nguyen.xz@renesas.com>, 
	Yao Zi <me@ziyao.cc>, Ye Li <ye.li@nxp.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>, 
	Michal Simek <michal.simek@amd.com>, arm-scmi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 3:33=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> There is an existing SCMI pinctrl driver in drivers/pinctrl/nxp/ which
> lets you configure the initial state of the pins via device tree.  This
> patchset is a more generic version which provides GPIO as well.
>
> I wrote two small cleanup patches to the NXP driver, one which renamed
> an enum and another which made some white space changes.
>
> The next patch adds an pinctrl driver which lets you configure the
> initial state for the pins.  But the main thing is that we need one
> driver to handle the SCMI pinctrl protocol so the pinctrl driver does
> this.
>
> The last patch adds GPIO support over SCMI.
>
> I tested this code using the SCP SCMI server on OP-TEE over Qemu.  I
> created a custom mock pinctrl device in SCP.
>
> Dan Carpenter (4):
>   scmi: pinctrl: add pinctrl message IDs
>   scmi: update comments for scmi_pinctrl_config_set_in()
>   scmi: pinctrl: add pinctrl driver for SCMI
>   gpio: scmi: Add gpio_scmi driver

Looks good to me!

Believe it or not but I have not even the shallowest knowledge of the
pin control implementation in U-Boot. But for advancing this I can
at least provide an ACK:
Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
