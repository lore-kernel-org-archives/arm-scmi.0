Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0233366564
	for <arm-scmi@vger.kernel.org>; Mon,  2 Mar 2026 12:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772455696; cv=none; b=ULtNqp5o1lJZkI+4yhspzKSFlWwMXGemKS2qeUKHwFckrpVwiymWDozk7bPAW0l+1jGkKxTbzqoLwB9bB0C5450WuqP/eBlbADpy1RotDHmrXwA7sJKviFLcCzXYuVTKGYDprEdxmMZ1WdYsOewE+BinSpxHwzwAPFIHQUVIQFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772455696; c=relaxed/simple;
	bh=5HFzGr832crqv2W64pTYS8wggyt85EHspGHJD1BYhVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GJH+dUvU2vEdu+BI1oxUIZBg19+c8vaJXQafLij0QXl1meTO+TStP0kVpx8r1+s1vsZyNfPCzuO7KDOH03OyDfpQwwz54rI0DP+ZPmRWZQF2OFSqRBlMPgHDm7b5gMD5k8C1wppjaEMcRiSSAd1QZTtWTPhHdHOq4YJx1SpvuLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56a91a5e64eso1652610e0c.3
        for <arm-scmi@vger.kernel.org>; Mon, 02 Mar 2026 04:48:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772455692; x=1773060492;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UPZaguxK4uAclO1GJ8sZm5gYxF5BgvNNNwtD4mqwBno=;
        b=UGfgBQmlZ5V7lhwMYfu6fyjeD21knxIoc/v8fV47IiE6ercgVYLT0CstDW70knGAJj
         28gKMS3hnXHLAtHgUgu8AlMyuclwsRkdYkvGMecH5a1OpDkmFY3dXjc0z5COMwZoHV8o
         mnqOP2dQpiywusDtWAKNEh651cjTLac0jVTRCfW46SHHqlPD72MG93MRmKlnyMPv/ku3
         vaa8oGv6XmYmxCVaATte5OIsIuC/K5a/M9VOmwy/SVJxrc2CP93vyRRCjUxJSOm8LYT6
         nVYn3M6O9t4YcuZMRHn1etCtQpVcpJmkP9QAyUrOpjVJ/Z2p84w0ZFBIyWQymlKUCX97
         MFUg==
X-Forwarded-Encrypted: i=1; AJvYcCU1u6TGfxdiiw6E5/3SRZMtPDAqRcKm4eW6GGAXtmYyFF4/jF4dGpCvAFW8NIEysjn0gVLanawPoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq0LGZNtzCnYR/WQMDeKTczcS1TkBn1BjJLTRbzwUdR6pjjbNm
	9KaK6+C8aOHxUSD/dntY6E8KrJQ1VxR+fFkAicXdAO5H4hdkdN60JmaA3v83+sDI
X-Gm-Gg: ATEYQzz8Hk5utKSSBsMLadENXpv2hqvpZVsTh71qgfc82vTR7U1QEdv4VbaHKeu/EHQ
	ik8iWyqJ4i+KsmkGsvIMmSduLSBYNiXmGGTHoEw63R24q3cb03PDQ+jvq6Fku3RcOIRpLY+fhPX
	nx7besJHl5IJDamwY5iB1hAO1M9bR4pvQtG3oTW6GRM95t8nYc6Wu20IOShe5FM+AC5SCN5+WP3
	xcQtyuJWghjR0WAyhibnJnwOjnBvY3xv07B0N2bM/le/DsC0UH2GsxSHKqBOGmV198gaAfSt27I
	MtVIhMYc6+iP+qgC6olpNwnBRuyDymnyboj5AVy53tSZby3JzdIJ/FAPx7gIQDfffyNpvm7YjFl
	nMMvNDnNcaSfBLqocAgxL6vs63g1HMFZf7/PdrdYvXjmjExmJ4xqGG2boNB9Vvo36Zkv23fxeFL
	W5fyAu13APQbYSgMM/ikmk7mOM5JaY1YL/5ZbQsFZ63bU2+1+6Ax56Vpna0CmC
X-Received: by 2002:a05:6122:1682:b0:56a:9435:d865 with SMTP id 71dfb90a1353d-56aa0a9ca87mr4689535e0c.14.1772455692598;
        Mon, 02 Mar 2026 04:48:12 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91bd2291sm15363670e0c.9.2026.03.02.04.48.11
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 04:48:12 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5ff093cf15eso1007765137.0
        for <arm-scmi@vger.kernel.org>; Mon, 02 Mar 2026 04:48:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW2nxAmLZHZjtP1thspwygv/dhii2C69PnAek9CTgQn5lCnICdu+y9mtb1qXWKwPu+f3z5wTI94sw==@vger.kernel.org
X-Received: by 2002:a05:6102:b0f:b0:5ef:24aa:986f with SMTP id
 ada2fe7eead31-5ff32280163mr4813153137.2.1772455690946; Mon, 02 Mar 2026
 04:48:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227153225.2778358-1-cristian.marussi@arm.com> <20260227153225.2778358-4-cristian.marussi@arm.com>
In-Reply-To: <20260227153225.2778358-4-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2026 13:48:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW7e45rc5VmHQV5GxzMvJ3r6=04sWOoFsu4JJPAqDUiJA@mail.gmail.com>
X-Gm-Features: AaiRm50BStTuBuZFtFkMptJqRSM8Fy1hreKbQGIVp2iYFH2DYfQrEyfTQ_vqsrc
Message-ID: <CAMuHMdW7e45rc5VmHQV5GxzMvJ3r6=04sWOoFsu4JJPAqDUiJA@mail.gmail.com>
Subject: Re: [PATCH 03/11] firmware: arm_scmi: Simplify clock rates exposed interface
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, dan.carpenter@linaro.org, 
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com, 
	marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Cristian,

Thanks for your patch!

On Fri, 27 Feb 2026 at 16:33, Cristian Marussi <cristian.marussi@arm.com> wrote:
> Move needlessly exposed fields away from scmi_clock_info into the new
> internal struct scmi_clock_desc while keeping exposed only the two new
> min_rate and max_rate fields for each clock.
>
> No functional change.
>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

> --- a/drivers/firmware/arm_scmi/clock.c
> +++ b/drivers/firmware/arm_scmi/clock.c
> @@ -157,13 +157,27 @@ struct scmi_clock_rate_notify_payld {
>         __le32 rate_high;
>  };
>
> +struct scmi_clock_desc {
> +       u32 id;
> +       bool rate_discrete;
> +       unsigned int num_rates;
> +       u64 rates[SCMI_MAX_NUM_RATES];
> +#define        RATE_MIN        0
> +#define        RATE_MAX        1
> +#define        RATE_STEP       2

Any specific reason you are not using a union here, like in
scmi_clock_info?

> +       struct scmi_clock_info info;
> +};

> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -51,6 +51,8 @@ struct scmi_clock_info {
>         bool rate_ctrl_forbidden;
>         bool parent_ctrl_forbidden;
>         bool extended_config;
> +       u64 min_rate;
> +       u64 max_rate;
>         union {
>                 struct {
>                         int num_rates;

You patch description read like the actual rates would be moved
from scmi_clock_info to scmi_clock_desc, i.e. _removed_ here?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
