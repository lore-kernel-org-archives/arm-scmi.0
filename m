Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC2F279795
	for <arm-scmi@vger.kernel.org>; Tue, 15 Apr 2025 07:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744703628; cv=none; b=SgK7eM9SFSvz9C5Hr3QwvsMMfG5MwYMESqPLcbgi/ehc/QwxZs/XOrkJxUIaENLiIvKU1GUnYywM/qfOleMeNQdD/Mo+EBc5UxGzlNOSmaCHvcIKjvz/n9DcdswOkovRvB4wCUrUhcnNMXGn6H30rfT5cql6kDGpstw930FBtFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744703628; c=relaxed/simple;
	bh=D8NpYL/6xc4mr7rrNU+oPdbCsWAv+ESU6uE3kXfaDzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=us64hk5kDjGp9dnSvmVLS8wmLBC8t4sV5mPiPiE+wlVghWrXt0sLyOZVCLczDtRcNXGjl37Emz9375YulbWYQym3OHY2BrPVlUJOVvbNx9YX0ic7F7pkKq1LWTsdsz1og22QXjDjiOHdpUwi/b1y2MaflyTa3l+rJ3Hw0+21flM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dChm3LZt; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dChm3LZt"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54954fa61c9so6406115e87.1
        for <arm-scmi@vger.kernel.org>; Tue, 15 Apr 2025 00:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744703623; x=1745308423; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=STeju+4F1b95dfzySAiJo7cZAG36EwjiVO/ehg7xZ2s=;
        b=dChm3LZtMY/5rCSraiXcD52sLsrjf6PMWauL0YKQIz7B91TLRzWYg9rOUl1iN8scxy
         j0mNrOWInzR6IvGGxTIls5S/0jYFwihPAi7y6/FssajqdyaBl4C02nCddg6efR4JG/7O
         pyUwXBi95e9LR6xPryrePCaahxIRGFFGBupfQ0d8e9VNZX2szxAG5ephPs10dAHnUQP9
         FOR1/fJD7BwpLDJjEgHsJ5KVT83qRA6h2bHgr4JRkoE6ck/NSF/01TTOuIpAHg/UBO6N
         PW875WwUG89gSNQXV/uXI0RlGxQXYCXFGGT9Nf2ds0688HYulpD1LFH7iD41rOzlKn3A
         PcHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744703623; x=1745308423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=STeju+4F1b95dfzySAiJo7cZAG36EwjiVO/ehg7xZ2s=;
        b=p5EEV2FqouPDFLKzHQEpo+OuQF9ygIbrOfAuFjtnV4wPgZqODhIOaGX0Z4RfMuctvM
         lZUGbio8oqpwj//H68UEqsLeSIX8gx67+9NTah0I1rfKbZkrbhbrIK+gZcbMRbwI+cS0
         nR1OjT/WW9x4KZ17P823pIm0j+cRLeUnHo5Pnl5NIEDofp7m2HFq+8CiMddbEk4U1DW4
         NsrVIVc7JAt7bzUxR9cezlqyZZ52vGxRYgQaxlYET2OJv/ZzA2m6OeUld3FYeOa0rTv1
         0VYpFLYpWnug7CfJxYL/yEmd6ErOh6UdipgoPlo89sGluXOo20gmBzLYJe+Hzs7dZmJA
         QiKg==
X-Forwarded-Encrypted: i=1; AJvYcCXPNXGMOFFJD5aE9co4R8FvsWxLPKuSd2XIZtSvWOuSYuuFBwPbTUY+RiKkyuOH5Sb0h+vC86W6XA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yww1JK5rHxx3cxa6zoVM9zBT/5RVatN1Zow5uGsl5MxbBhRM96z
	GdvOzcRGjetvrel1SwdMtJh1dGGt9/3hbGfabhb9FZYD6E5cD+YutngDRwBraegc8vLDj48O10B
	DOeW8N560tcy1EBr8HWeg93GyWhXeKDsGk33KAA==
X-Gm-Gg: ASbGncvqYGZuq3rWnCrrZBeNB8vNQMRt8fJ4nWx2wx/mjp/OZchksdu4uvn/hwSCNkd
	zqr0ReUYpTAg4FEgp6aADYQIKgozb7o9VEiioBP8fL4qwKAj73Fezs1KOR5ogu5dy7Mm31zdrdK
	syo1bWLEpRCUE7Ej451FK4aA==
X-Google-Smtp-Source: AGHT+IFJ5QnEuy843kC3TQMpuk9QiZ+X6rbvXcL4GPOFqhedgkU8pg1nIDK1g44GiFTp9uNBiCz3X/eFYBa7DllDIzw=
X-Received: by 2002:a2e:bccc:0:b0:308:e54d:61b1 with SMTP id
 38308e7fff4ca-31049aadff2mr53751861fa.34.1744703623274; Tue, 15 Apr 2025
 00:53:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401072725.1141083-1-ping.bai@nxp.com>
In-Reply-To: <20250401072725.1141083-1-ping.bai@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:53:31 +0200
X-Gm-Features: ATxdqUF6WJDaLjHdYSkCvv_YDIUzSOmPWDnDqBmf7i0pLM0MKIXzIz4bzkS8nS4
Message-ID: <CACRpkdY5XdzVxbNhw-nv5EL00NNqrJLiwc0B4O6somUo1gjNxA@mail.gmail.com>
Subject: Re: [PATCH RFC] pinctrl: freescale: Add support for imx943 pinctrl
To: Jacky Bai <ping.bai@nxp.com>
Cc: sudeep.holla@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	cristian.marussi@arm.com, aisheng.dong@nxp.com, festevam@gmail.com, 
	kernel@pengutronix.de, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jacky,

On Tue, Apr 1, 2025 at 9:25=E2=80=AFAM Jacky Bai <ping.bai@nxp.com> wrote:

> Add support for i.MX943 pinctrl.
>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
(...)
>  static const char * const scmi_pinctrl_imx_allowlist[] =3D {
>         "fsl,imx95",
> +       "fsl,imx94",

This binding is missing upstream, can you send a patch to
add this compatible to the right yaml file as well?

Yours,
Linus Walleij
