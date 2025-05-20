Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B434F25E821
	for <arm-scmi@vger.kernel.org>; Tue, 20 May 2025 21:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747777898; cv=none; b=WF5PVBp8wb3MzM0mBLgyMZOxl2cd3bIJjgpfxgzp2ajEgicQGAXCuH45u0xM+ImlhzE/j8Pz7tg4VLi/Dy5XY5M3tkhuqZBdoApwTEzgZEKnkGXJ7Ndq5lWl+nwn1MZ6pEloEqaUgOq+lqnbKD7TDmtYq6GoQ1iVKPy7dHiu320=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747777898; c=relaxed/simple;
	bh=+YcxJa4AFvNZkS0xWAAHV4pBceL+Aa87KE1RhOakO3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JOfoEtjE8yI1dD/dTXCCRX15IoMKfSQX3m1NZj/QSUCdssPEs4s0DkXRyqdDW+b68RZtKazwzLs+7i0cAjP0IN/+B7ZxR8Jylw40zxlCMSSv3rT2J3/8mYDFQh73htgvcs9GCPhk8tX45bN7JRXuX7dlxCOO6mkWxVd3drzQ3go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FXw/Yf72; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FXw/Yf72"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55168f56120so5123123e87.2
        for <arm-scmi@vger.kernel.org>; Tue, 20 May 2025 14:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747777895; x=1748382695; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+YcxJa4AFvNZkS0xWAAHV4pBceL+Aa87KE1RhOakO3I=;
        b=FXw/Yf72g7a74IPmLa1HqP5jfDCwtqWp0soi1BrQ3jMWWddiV7RBpz2SuJ3xbyxluo
         KVx4/EqWCHGmwVRUhBve/ImRB5kuDgZfGZTnMe8wjphzs8kfcbJQDlDyFnZ4HbvM3ufb
         TSjOqF2g1XyVvkRoZbFVXLIxZyfK5EMJZTTqgdlduW2PjbMOYKqAGvq880h3gTMXD4XV
         sCuqNU7DSnhXqAae8pau/YESqQ8ZvzZODuECyf3nuab3+g5RuE83v1vkkDTQ7OZpMiTV
         OabPszn3pY0UzpivCSWzfrzIxqfffoOC7OiVsP0HN3b49Gu7GEePsMIXMVIIaE5ZpVyF
         y1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747777895; x=1748382695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+YcxJa4AFvNZkS0xWAAHV4pBceL+Aa87KE1RhOakO3I=;
        b=PBVKo7Qnl5RCSohTAlu/DoO08ul9dWPfjfBISDkGGeQ7RVgsntsvlDZiW3MAY65OED
         9aopMl+ZjBkSSOrtv51nYAOCh98rVL0+SMXlu8R0kGTdFqT8qSC6PJPggpB2gDRtrHdO
         mcq+JWts3ykgnw8UnKNBSH5ozuTdNFSJW3evglhrLkYSix4XRNGHj2q2BXaYaFm54f6f
         E3jN2OgAt2rQ7KgWTLAnPl3wDNtxU1Ut/1i15V//XNxB1Kl1EbfTXiGi34tZgJj/1yw/
         wE0TEgaYQOB+dxr6MTgiVmA2Tph8akAvDque3QL7TNryerFFdbAcsV9CkS+ZykA6NCto
         vR9g==
X-Forwarded-Encrypted: i=1; AJvYcCVH7PSGAfkgDVzQMB1/cOlQUe2bq7GPr1YdIv05WALgaEIQdxdsZjaFKSPs6PFvtvCnweoMlc0S6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpNiMGqe2oiGJ3Lcvo2/hrzksGrdtknrrtwQMz7rUw2DAMs4mN
	WJ30Hv9ZXc0M41Vx8eyAHdIK8BwFkd8T6CONKf7+ReYUURPHJLl3Jp3K8emCzfmjpo6vBV79C/M
	La6Qylv4OaSZq9fWtGaQf1FilkAd6T8+MXOh+qzS76A==
X-Gm-Gg: ASbGncv3gsqq6Hcm1r6AGjApsX5VMz5Y+LcajrGo3dk9UoG5h/o1OVnd5ERd6mclKvx
	Jvpa8pS/tsAMk8GkJRVv48iZBm7VgWHlK5V5+jYBGnKmg0maH3vXYbthldo2BDDj4ylxWXnHDNQ
	DEdnIVkabN0CaSA8pAu1n7K+Z6G2wsel6J
X-Google-Smtp-Source: AGHT+IFVkq4h2CinjfVO4g88kIBTXBbAWFl5Mto0qgQ5kuq3Zs33wt1FkBPYSfQEYVpZKmi9mKF3laDdRT+6Oo5QVNI=
X-Received: by 2002:a05:6512:6081:b0:550:e648:182a with SMTP id
 2adb3069b0e04-550e7248117mr5466218e87.55.1747777894769; Tue, 20 May 2025
 14:51:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516100423.1685732-1-ping.bai@nxp.com>
In-Reply-To: <20250516100423.1685732-1-ping.bai@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 20 May 2025 23:51:23 +0200
X-Gm-Features: AX0GCFstJNfbhxP8OvAOpZb2VTNEUaus21faETIiRrX0PcV1DOJb07Ynai4P9Vs
Message-ID: <CACRpkdbXfNs8a+YEwsxROpUT16S9m7NxYXnTsOJNpi3ds0wKDg@mail.gmail.com>
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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I would merge it... but you also need a patch adding fsl,imx94 to
Documentation/devicetree/bindings/arm/fsl.yaml
do you not?

Yours,
Linus Walleij
