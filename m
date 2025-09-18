Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5389C30215F
	for <arm-scmi@vger.kernel.org>; Thu, 18 Sep 2025 15:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758208573; cv=none; b=EDhYj+JCx6g2nPuXtR7H8BQbhuO7Nx1jZg8ZtUL8Vju9VWxdoCQrzth1uwKmRoeAOK7U4EGr13ZNkwpNG4UtgMmDk/0woNDX+Rm++Q1lEQCmUM9WNONOXp4eEO/gZab/82nwiiKfWSoNR+EQ+N1kCXWaXskTs7OWzkcHbvEPzXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758208573; c=relaxed/simple;
	bh=XpqlDA/hyMutqOXOtcHoeGa/ryYYMOPnkl081l9Xc5A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ps7OWBRf/wO0L2NhObdB6oWGqJRAXp4PJQgD1x1Ih322AC+CJo+Yl99H16dXFcF4BM3N97UKgnYkTFvQVi57g3fPOSx3GJwdCZYEnm7DRpTt+/DofwqkfvoScuz+alTtcniljJr3CgS1/xvzQ6Wx/U/hgd2Qdry7m4Dl9SUL5Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WyvCZiG+; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WyvCZiG+"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-71d71bcab69so8332317b3.0
        for <arm-scmi@vger.kernel.org>; Thu, 18 Sep 2025 08:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758208570; x=1758813370; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xxqmW3n9Sw4jw325VsVgJ6XHMVW6nHnWRwX1gianPwM=;
        b=WyvCZiG+tMHNFlwu37e/r3icUHyWHScp19n4RT99Js6INaBe/jcEf7b9D0Ju1teEAg
         VDJQi/ME7eUnexMaqoYy6XQdxjr7+k3/5y+vK7MhXEr6wGFQBjeseS8Fxn/oeQJzUU9W
         RHASCbgtelhqIpJpYLYQOFRuSeFjrcC9bbkrtfiUL6G1uYXsHV64DCkTAf/UL38GDF3j
         N/z2HWfEbgPKTmsPYOlWkForNlsLdX63w5Odxw6L28IUK5NFmO4I5cSj2H95Q0z5ipKa
         GB8xIBimCf9NdQn+TwXBEzu7w0pB/QalOZTSShFIuHWCT/LCUOUYQohkLT7oKM2Hs8p4
         SQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758208570; x=1758813370;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xxqmW3n9Sw4jw325VsVgJ6XHMVW6nHnWRwX1gianPwM=;
        b=BBOFOvizj8UiTqgVUoN+12UTiW8bI8iLyVLYFtjsHZ6ygrYnRNZ1zlbTwCsS2s/F/9
         chKGsgwiSjeMDV9qfgY42lNGoPuiLhMrDd0zuRxrjE2qwi8Dd14J0TIYzZxpI6TVtNgH
         8wdYY0y3/YlRqzTwePikmfTY5Nzf0kyOi4WM5riJ48ovXN/HpbGuYbsQtt3owcxFHtyF
         pqpkukxkBIWO6lLftsa2oZpHZFG4B5luEVzmq5qbPkzUuNsDHlaBrOoFM8KOiAzu8ITt
         RpYSRdH/IxntLnACMVP4w3I+bhvYLKSlIwSIZ+5HNIcqtyi+1vYdrnJlouRDrvVoI9gO
         UDtg==
X-Forwarded-Encrypted: i=1; AJvYcCVLrXHyNkUwbHXTMfPNNNW6XJnb2bmMsgpkKNdiT/52uAHWc184IYzajKHT8Cznahf3+6+znQQqOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc+ft0Q57W2c+XjSKUlsjYdTfq4X55v+iYKqp5HPEmNpa47uIg
	U52dF/61UF1V8KN26eioBrfXHr+gCAZZJMowASJ0Mlgovg/KBt63TV/VSyhPWStenh2HyuT5K/R
	EHtOBq6hbSxAdseUuU8u9ZERRTfKq8Nk2On5z0HfCSg==
X-Gm-Gg: ASbGncujy+AGc2hxvD4S9kKMgjMEv29zZ62GHUSW22ZLPelIzz8yQe22Roh6ZtDfNan
	JLimv/tJOk45iAAv3faJ4RutFjiFN0j9OWkw0knerp13kPthzQB9ae4VKlYCs9RO814kTLNuaN8
	ig9WuOVZ+3cX9Ktg7ooMImcGGRalBd/j0eK/wSbltF7BbRg68puc3023NwM597452n2uQubWqiU
	23p00gu3g48g7fSiDEMFBk=
X-Google-Smtp-Source: AGHT+IGhhJ7Bv3R+nZnqBzlYOnhgsyWlmTzS9C8s6bR8WkgRrUao/WcQHEslpUiS5E5xsVP21eeJhMPtVBvj4DhTSeo=
X-Received: by 2002:a05:690c:7108:b0:720:d27:5d0 with SMTP id
 00721157ae682-7388e0ff14fmr49402547b3.0.1758208569760; Thu, 18 Sep 2025
 08:16:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902-pm-v3-0-ffadbb454cdc@nxp.com> <20250902-pm-v3-4-ffadbb454cdc@nxp.com>
In-Reply-To: <20250902-pm-v3-4-ffadbb454cdc@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 18 Sep 2025 17:15:32 +0200
X-Gm-Features: AS18NWCz7mrWAc40Ox1MHdxef1Mp2CL_HkIidm9lOboNSf8e8s0UW_BDcKfNYeU
Message-ID: <CAPDyKFrMPz8X23WAoj_8A3-SsdpbZZ5Ss9MbLK0yy6FLRytTVA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] usb: dwc3: imx8mp: Set out of band wakeup for i.MX95
To: Peng Fan <peng.fan@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Peter Chen <peter.chen@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Xu Yang <xu.yang_2@nxp.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Sept 2025 at 05:33, Peng Fan <peng.fan@nxp.com> wrote:
>
> i.MX95 DWC3 inside HSIOMIX could still wakeup Linux, even if HSIOMIX
> power domain(Digital logic) is off. There is still always on logic
> have the wakeup capability which is out band wakeup capbility.
>
> So use device_set_out_band_wakeup for i.MX95 to make sure DWC3 could
> wakeup system even if HSIOMIX power domain is in off state.
>
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/usb/dwc3/dwc3-imx8mp.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
> index bce6af82f54c24423c1e1fcc46913c8456b6f035..fde158d1f6e3d89d261ed3689a17d703878c7e37 100644
> --- a/drivers/usb/dwc3/dwc3-imx8mp.c
> +++ b/drivers/usb/dwc3/dwc3-imx8mp.c
> @@ -248,6 +248,10 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
>         }
>
>         device_set_wakeup_capable(dev, true);
> +
> +       if (device_is_compatible(dev, "fsl,imx95-dwc3"))
> +               device_set_out_band_wakeup(dev, true);
> +

Similar comment as for patch3, please set this from system suspend
callback instead.

>         pm_runtime_put(dev);
>
>         return 0;
>
> --
> 2.37.1
>

Kind regards
Uffe
