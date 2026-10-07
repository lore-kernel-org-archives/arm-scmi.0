Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFA84968FC
	for <arm-scmi@vger.kernel.org>; Wed,  7 Oct 2026 10:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369177; cv=none; b=jbC06SNApuQB/T5oIpFD0fmMNY4CtE4PaZOiU9r0umgOL0lhbNceRMHg0338cecJ6ShIiaeoekJQRVfjXzPPaf7Lthe207DTbqSVV+LEVPc/nJwXhIRh5NSs2/Q+jsNOzXEFQDUT403zw8mXIB/mhbTePgPkY/hjQC3ov06rjB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369177; c=relaxed/simple;
	bh=9oVWb69ye6d2njaXoyoGmeFsDZ5OqzzUsKteeito8/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pkZ+GkJ6oueCRb4fwANKrD4JAMLpMm6Er5/ZkypNgu7K+MQHfY1FO4GZ2TcZQ0TLq/qO2A/vmXQWejBCMYe5Q6zzromra3YxdVmHJFfu0RgQBBTmLWOtYRQZa7L5GbvBPDMrD+z/cSpp46GX9caIdbdvNKB0cXSQXSzs5jxDgzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WwCE6VPT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WwCE6VPT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E2DF1F008A1
	for <arm-scmi@vger.kernel.org>; Wed,  7 Oct 2026 10:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791369147;
	bh=9oVWb69ye6d2njaXoyoGmeFsDZ5OqzzUsKteeito8/E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WwCE6VPTKmh0z2WYkF1ftc6xP/p3rFr1SOM2PLy8a6xNDq4CL5+oOOkQG4Nacii7H
	 Rbk8F7Ez7JCanSA9H4scO0nj4ImXe9mCKXGuMMuJyvtuIqocQlwz1NlUQP/L5CaJWI
	 o8b0Uq3sOpIalvmzPjqW7IM69I63OIemAp4nm00QZncxHnbfH4DKf//fHOVNV+yM4l
	 lbGxe0unfV3rUhMEmrNOjVoTLwewFKG1j0wo4Dokl/SnMvCgvyXKLdN59RP0YtS86d
	 T/kt5K4FuT6SCllY/GP8n1LCzw6tI0071ywEL0mR8aMb4jADCeEEnUi7VXNQ/sSCJp
	 bpSJXVpC24c4g==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bb7c6980f1so1365975e87.2
        for <arm-scmi@vger.kernel.org>; Wed, 07 Oct 2026 03:32:27 -0700 (PDT)
X-Gm-Message-State: AFq9FYLnU5KQgX0aiSPwqeYxg6wv/zYrFdkuxokLqB0uTEbt04cTnst/
	0+zK7ftoOZt4AYNilDQ6ppBE5gX1H5fWAoHweCAhLLPep10jCv35/3LZQMtIyphotmue4gPPTdr
	RK8OB117CsXXCmK7eTyhFyObPwwd4NAs=
X-Received: by 2002:a05:6512:3091:b0:5b8:c174:c98f with SMTP id
 2adb3069b0e04-5bcd072e011mr626080e87.47.1791369145191; Wed, 07 Oct 2026
 03:32:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002-scmi_bus_fixes-v1-0-8695cbab3fe7@kernel.org> <20261002-scmi_bus_fixes-v1-3-8695cbab3fe7@kernel.org>
In-Reply-To: <20261002-scmi_bus_fixes-v1-3-8695cbab3fe7@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 12:32:12 +0200
X-Gmail-Original-Message-ID: <CAD++jLmm2KrsuaCPznjY-_t577D-hWZqcaafHXSeTcugBsG-yQ@mail.gmail.com>
X-Gm-Features: AclHuK_OngjnXsvCqah6XeVHOfyhFcVTH5dTjPiY0oqEZpBecitNEwT07XJY1uA
Message-ID: <CAD++jLmm2KrsuaCPznjY-_t577D-hWZqcaafHXSeTcugBsG-yQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] pinctrl: imx: Match the standard SCMI pinctrl device
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: arm-scmi@vger.kernel.org, Peng Fan <peng.fan@oss.nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 11:37=E2=80=AFAM Sudeep Holla <sudeep.holla@kernel.o=
rg> wrote:

> Use the standard "pinctrl" SCMI device name instead of the i.MX-specific
> "pinctrl-imx" name. Standard devices no longer have exclusive request
> tracking, so the i.MX and generic pinctrl drivers can register for the
> same protocol/name pair. Their probe checks select the appropriate
> driver for the platform.
>
> This solves the issue that occurs when both "pinmux" and "pinmux-imx"
> devices that share the same fwnode as only the first device registered
> is assigned as the owner of the fwnode. If this owner device fails to
> probe (e.g., its driver is blocklisted or missing), it never reaches
> the driver_bound() stage and the system skips cleaning up its supplier
> links. Even if a alternative device binds successfully, the system
> still looks to the broken original owner. As a result, all dependent
> hardware components (I2C, SPI, UART, USB, MMC, PCIe) defer probing
> forever, halting the boot process.
>
> Note that the solution doesn't support same fwnode being shared by
> multiple devices and associated fw_devlink feature.
>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: NXP S32 Linux Team <s32@nxp.com>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: linux-gpio@vger.kernel.org
> Cc: imx@lists.linux.dev
> Reported-by: Peng Fan <peng.fan@oss.nxp.com>
> Closes: https://lore.kernel.org/all/20260928-driver-core-v1-1-0846bb8e0f3=
2@nxp.com
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>

Acked-by: Linus Walleij <linusw@kernel.org>

I guess it needs to go in with the rest of the patches to firmware?

Else tell me and I'll just apply it.

Yours,
Linus Walleij
