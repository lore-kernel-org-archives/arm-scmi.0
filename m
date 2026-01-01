Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96DE1C3F36
	for <arm-scmi@vger.kernel.org>; Thu,  1 Jan 2026 14:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767278371; cv=none; b=ZsQNETWp9cvn5NLV5qJlKvCMNZx2F+rpRvxpdHRcDGfycPM04LKabzn1YTeeu8hXL9ikZaQlXDqJXCHP2AQ+ETE+s0V9bVCSoeamyAdc5SQreYQ69PqCDwj49TzmTyW45kOJzlN5wSvTHU/N6rtnEW6goWtR//pkhWOkmZR9trA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767278371; c=relaxed/simple;
	bh=G22NoFIfnxEZGwQ6tAtIuLaQkO46dzLxaedEFtwTcC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vFJiTApfvGX2524d9d+n5+J3gjnMSAeylPyorUo86KL5R/1FaOlxVAQXSGchClaf1eWxzwQecVaS7i8d3jBjgaLPAIm7dL3moFAOwpz9PROxjyXImEl/PSGePtKF4RB0YhAez+frSHP67OGB0Nv6HaOBaR31rsoe6inWmoBRrVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DwWngGvH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DwWngGvH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA593C4CEF7
	for <arm-scmi@vger.kernel.org>; Thu,  1 Jan 2026 14:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767278371;
	bh=G22NoFIfnxEZGwQ6tAtIuLaQkO46dzLxaedEFtwTcC4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DwWngGvHdL4LRVL+W3/zGNJVIi2ueYKzZWqO6oar/5xbgPkJ7V02ldgGoGjP9LrU+
	 kEgcarLWZ6OlQgiF31k2CPqoxT2hzGVpAWagn38SfQt5FNCA5zV7Cp0hXh6NLEDfDT
	 twGhjSBiQNDUBCfwfSvq+Om0OQNBBb/QKqoncYeQlgziB21Zs+29HzP7/HIHWenuXN
	 xXKbULKBTwvLefsCKlYiz5KJ1LovChIXPAuDigDwJciutML/KS0OZGaUl9h5N65+m8
	 ePrCctS7UbkhWF9QBHdzFG8ABtFEhDqK6eCr3O+BEGqPzcH4BuOdzJI8oxz0RpDFNC
	 K+YiBbuzeBs6A==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-787da30c53dso108586807b3.0
        for <arm-scmi@vger.kernel.org>; Thu, 01 Jan 2026 06:39:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXYxzYhJ8YJLp74MP6L33MGieZie5ubr3YZhZaYxE5RjHo5Fbl+AXTxpcOhiTva9fK5wL1fO5g4MA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhCptWn/GjvK1dfQUccvRCdn1bOZ7ESUjYvB8KS8JPRTKAg5uz
	t+qXSyEjc9avdu6DweGW0IZ3Uauspug+KSvncIZd4NOkMnDYtgq7Wog0TXXodh7OKrL5bAzGZOK
	yeuzj00DSQP1HluXGAkbb8fNOdRg1uQ0=
X-Google-Smtp-Source: AGHT+IEchp04KmAZ5T+gOBq+28XFhaa1bKaz5ZkO9N8HZ8/JFUpg+aWJY2a+WRe3EbLOGL4KfdGvOZjgCZzWV1MbKJI=
X-Received: by 2002:a05:690c:4443:b0:787:f793:b573 with SMTP id
 00721157ae682-78fb4091502mr326959257b3.29.1767278370986; Thu, 01 Jan 2026
 06:39:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251217-imx952-pin-v1-0-2747f09144dd@nxp.com> <20251217-imx952-pin-v1-2-2747f09144dd@nxp.com>
In-Reply-To: <20251217-imx952-pin-v1-2-2747f09144dd@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Jan 2026 15:39:20 +0100
X-Gmail-Original-Message-ID: <CAD++jL=6bMXHp4KuVN7xxSidZDhuxLkuiJRnjybJxk4pVeeEFg@mail.gmail.com>
X-Gm-Features: AQt7F2rvyquc560DHr734TPz3A-2hmEAxTBsn2s_Ehck2JwoUtyVn6mnDzTXWW8
Message-ID: <CAD++jL=6bMXHp4KuVN7xxSidZDhuxLkuiJRnjybJxk4pVeeEFg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: imx: Add support for NXP i.MX952
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 3:41=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

>  static const char * const scmi_pinctrl_imx_allowlist[] =3D {
> -       "fsl,imx95",
>         "fsl,imx94",
> +       "fsl,imx95",
> +       "fsl,imx952",

Where is the binding for fsl,imx952 merged?

$ git grep fsl,imx952

on v6.19-rc1 yields nothing.

Yours,
Linus Walleij
