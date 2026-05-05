Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468C02EDD58
	for <arm-scmi@vger.kernel.org>; Tue,  5 May 2026 10:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777975215; cv=none; b=uXTkFuX3/NUBHqzClUHa3eFy5lSme0Dnp+2QlMAWtSTLbijUO1XiBlvHTs77Zd8jZIvL0d6OeIoyifk9h1Gx8PzNGJSZliRsz7pO7vOrAUNKbsUbZgAVNvreAvLGDMItSrtpDAgWmOO1ysaNIMEvFDFduSfxhe9DpeaV55/0fTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777975215; c=relaxed/simple;
	bh=Iqxgz7zIZ5MLQToUPdhTKIGhc6pvVg0Zo/Agn5ekWxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DKjyTYtLEw++iKvmio3qzQ91gWiJoF8ZivklRsZPOUKfQtUWXnFacnexr1cPmq3+gGFoN6/DjCMVMv1Q0dWKr5Q2VsBSDRPScmY8Bti4+JcMQ58JiVHj036wzfNII20MLz/NcLe7g2cbHJ+37VDFvaG9HlQjB/UOu2GCa9Un83s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-57513ac61f0so798201e0c.3
        for <arm-scmi@vger.kernel.org>; Tue, 05 May 2026 03:00:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777975212; x=1778580012;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wuHpybwjKLKCiao/+mTwUndwe61THQbcI6j1mq+muAs=;
        b=VqwQY+13oY9d+z0x/h1w8LWuuU9Cg2/clO7lzd7cCmTEBpBxDSPyAqOCbAWZfzg62V
         +k65CXcrDp+3ibstQcqysP2su/MquOHyqRNhaOiBm7yRGCWMPvYIlgKsO94Pu/SVYJGc
         FWsdmCPCjXNLpF5M0wovfMaiIcvU/Qo6aAT0j5nu7HR1oqhft+W6pi8nDbJnJVsVjIL+
         eNDctQVgvOvc3fC17yUKpulpSWE+dExqv5WafrUQV7RRkzSB5WrUD2EXymQIwyU3u9ZT
         W2RgDz3XTwdIv0y/988hmU7GJznq+hPuQUFyjPlzlXYJh/whHQKtLha62e0lf5+xppqz
         mcxQ==
X-Forwarded-Encrypted: i=1; AFNElJ87PAdnhCijaPq03pCYyj6k9C9HZruF916BI4IgvpAbXSLF8vo1JTniQJ8Ypvs7igB++k9HKrtZAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyA1urNgkMxhJYgZsdfhKr9wiJz8z3ZHyRn6L4Pdk9TpaFsry9T
	D+bKAV8+IpZcSnnO3H2MzihNSLRU1eXRDkdRbetyeT5OhuCDArN0kmDlAI3hRv6X
X-Gm-Gg: AeBDiesUHNw8IEvBK9UYTGvQXil9htmnJQmOSwRaX0lTGOkBbCz6etzExxPFy+9RP+7
	jEBOMIa6NCqqeteiXa17M86oU1u+OLDc9L+N6kLtNMws2uNMQQtyBlLYFXQo94gYBBpxgubDF4G
	KqsQEON0HA+K0XVBE9kh4ev6yxu3hEyRxFfyg+KNneaoXh13JKK1zL4FCHVTYYfviY/TBgekFDT
	gbCsCU2DcYugZk3jsPCIUmR7VXDz2BMZP1MCRpWkZf0kqrVbFHm5q31mdpE42nxfGhe1EGeLoV/
	uRtvuTZmnJG9VP3xU2334lBRTuT5j6zVAf7dTW14bKPQ5yx2PRk0pWFvwiIYHuM0IZWwplb9880
	tk97A/fDV9nxJGaaHf/Rqt2vGLP9HSIpLutP8bA8esyIe87XizkPYYa3U9SASriEB8CdwMTNcFI
	sP+ZNV4XIUaiQyc7Mxr1YsGQRHl8FFfgYRt0TnFF9bcEoSeyFX1PshiK8lidKRbmw2NybTRjgTD
	/Og4sNzlA==
X-Received: by 2002:a05:6122:488a:b0:56c:ce8a:b07a with SMTP id 71dfb90a1353d-5750c77b748mr5665176e0c.7.1777975212091;
        Tue, 05 May 2026 03:00:12 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-574a6ee0b24sm8019899e0c.16.2026.05.05.03.00.11
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 03:00:11 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-612d8a59cc0so1711735137.3
        for <arm-scmi@vger.kernel.org>; Tue, 05 May 2026 03:00:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+89uyuJE4FVFHCcd2Eq0QKs1pyx11r6styBHz5IcnkD89U/DR3ujDTuNdXympc1diFI2+dtnGcAA==@vger.kernel.org
X-Received: by 2002:a05:6102:50a3:b0:5f5:4055:4556 with SMTP id
 ada2fe7eead31-62d84f62cfcmr5756702137.4.1777975211494; Tue, 05 May 2026
 03:00:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428201522.903875-1-cristian.marussi@arm.com> <20260428201522.903875-14-cristian.marussi@arm.com>
In-Reply-To: <20260428201522.903875-14-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 May 2026 11:59:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtH=4J7bDGAk8xoxNDYRsHSRDReVNU_PpUnUDfU=afpw@mail.gmail.com>
X-Gm-Features: AVHnY4JmctwdZMNWtvo6vN96jl6lMZtYIshncwB9zfTSrryPHUlTFUdh6bCKhZs
Message-ID: <CAMuHMdXtH=4J7bDGAk8xoxNDYRsHSRDReVNU_PpUnUDfU=afpw@mail.gmail.com>
Subject: Re: [PATCH v3 13/15] firmware: arm_scmi: Use bound iterators to
 minimize discovered rates
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, kuninori.morimoto.gx@renesas.com, 
	marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Cristian,

On Tue, 28 Apr 2026 at 22:17, Cristian Marussi <cristian.marussi@arm.com> wrote:
> Clock rates are guaranteed to be returned in ascending order for SCMI clock
> protocol versions greater than 1.0: in such a case, use bounded iterators
> to minimize the number of message exchanges needed to discover min and max
> rate.
>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks for your patch!

> +static int
> +scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph,
> +                             u32 clk_id, struct clock_info *cinfo)
> +{
> +       struct scmi_clock_desc *clkd = &cinfo->clkds[clk_id];
> +       int ret;
> +
> +       /*
> +        * Since only after SCMI Clock v1.0 the returned rates are guaranteed to
> +        * be discovered in ascending order, lazy enumeration cannot be use for
> +        * SCMI Clock v1.0 protocol.
> +        */
> +       if (PROTOCOL_REV_MAJOR(ph->version) > 0x1)
> +               ret = scmi_clock_describe_rates_get_lazy(ph, clkd);
> +       else
> +               ret = scmi_clock_describe_rates_get_full(ph, clkd);
> +
> +       if (ret)
> +               return ret;
> +
> +       clkd->info.min_rate = clkd->rates[RATE_MIN];
>         if (!clkd->rate_discrete) {
>                 clkd->info.max_rate = clkd->rates[RATE_MAX];
>                 dev_dbg(ph->dev, "Min %llu Max %llu Step %llu Hz\n",
>                         clkd->rates[RATE_MIN], clkd->rates[RATE_MAX],
>                         clkd->rates[RATE_STEP]);
>         } else {
> -               sort(clkd->rates, clkd->num_rates,
> -                    sizeof(clkd->rates[0]), rate_cmp_func, NULL);
>                 clkd->info.max_rate = clkd->rates[clkd->num_rates - 1];
> +               dev_dbg(ph->dev, "Clock:%s DISCRETE:%d -> Min %llu Max %llu\n",
> +                       clkd->info.name, clkd->rate_discrete,
> +                       clkd->info.min_rate, clkd->info.max_rate);

Printing clkd->rate_discrete is futile, as it is always 1.
It would be more useful to print clkd->r.num_rates instead, although
that may still be lower than the actual value, due to lazy handling.

>         }
> -       clkd->info.min_rate = clkd->rates[RATE_MIN];
>
>         return 0;
>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
