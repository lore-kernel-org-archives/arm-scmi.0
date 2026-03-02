Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CAE36E499
	for <arm-scmi@vger.kernel.org>; Mon,  2 Mar 2026 12:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772455035; cv=none; b=JccdmFQzcMAyddKF8iFzJoAbSxUOq+sIsE+Oy1gngRWQny1XbuWgx5h8GaVJkUrFdOsX33ECFcjpFgeX1+f1hCj2szTQA51VELfJh4pog1p1XBC1gpV3sT4n8JMgSJnAHyvATjgcvvlpdoR7Wvrfc0CB6+Fxecc6Q7hm9YQis84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772455035; c=relaxed/simple;
	bh=ieLd8uA33XYRvC/1/m1UwSIxYq2+WBaleB8sHCAJgK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d43hDm5/UBl4YpKVuEWBxP1jSHjYmINMvP0RF4PqOssuomaFm+ggdCGFOc4YUoQnIUmcPiPBpd/18yNvN1nkTLRg5AHO6Kk8kCk9MwQZGkVQOhNxIQ+K44F4DrRDkw4E7XqKDUtHff9KPoAkvZKnbqUtnBNOLKqoKg0cM8lWWEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56a8d7bb872so4274178e0c.1
        for <arm-scmi@vger.kernel.org>; Mon, 02 Mar 2026 04:37:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772455032; x=1773059832;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGJIr8wFv9hr5lqBHLuRLwT5yQ6DlyeOxeauruYedWE=;
        b=Fr6GEkmgBgIzqGdc6JFHT08X3d2JK9lkMO21b0J2jRt3BweEwPSuJuwL4bgFyvCU7g
         0KLY7XP6ifwKSEtMXM8iKNuhzY0Bg8csOXe0Lqa4GliHVELBwRiMA0R7RI9V3mJVsP1C
         rkrV/8IIRxyZ767zKSzc0Gmrt30qMnqF0MYzBHYYaeLiJLMGhBG3kJAZNdxkK2939kl0
         zjmPBg+FkUXM1ZxP4xMSl6yrs+a6D7erUv26NrMOuaiBFXYzl3QtR1NBeoQmRLt1+49F
         4AgBwCAZBuDUItmm61bn4C5vvHitduf7llRx/IoReCpk013qO5dgDwZj3vzp99Ydnc3A
         9r9g==
X-Forwarded-Encrypted: i=1; AJvYcCVkezaOh5DoRw+goaUcLZfKPxsy2lYwfVl0CyNjpPLcKmw0RvwCSMu9ajajh0sGG9eunS8oNmK2Gw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdtaGZAsws6hGz/ZvRyIcrLtCJUnJYKqcEO62R5+7hERAZLyOL
	mWnMPSF6u49MzzfQ5GpbFvbL/OONEkcej9e9gvw/WnvFS58iwpxspLGnx2RUFNY1
X-Gm-Gg: ATEYQzwHG6gaeJs+giGaQUfQshdwYMFlqDFReyO9NTH8VDCWTBdZvfyFw1EbsET+nSh
	ePG8dqeRgSqTpxkzL7lOaW6KqjsA01yYaCqeK6PkUTTYGJGPKEyvE8d2EujSPY7EF4/ZWe7OWhb
	dPkglQcczrGrsoUh1qhyjBq3tcJ8O9nCzSqIHuRF/nD0HVa73lyIyMUsR7XBGEklATUwyjMDvW3
	nTahAvBU42zgtZbSrWFRbJQw6LMgnxkhzvSg+Osqx/Cc+b4UqHcT9HLAQu7tEzaz97SfncWUEYN
	OzMWETmiAG2+BZj9bQghHR1uTsNZqHT1vo6hRCIFQEwgRVSdjtYYBvG4WccYzdgmbz4LB5gW6zg
	xp25nnbtFK7A/qDe0Axno9Q2uADFHCfqn+5zXTx2S4eLMT7vYwgibibXkWpoMKytUeg2ujbWNeY
	F9T+9tA6Lk02XtmdrfMX41MaXpFA2CxbN9DY6SGe9gyrY9c1ocaOGXkWFM1HTFloyCthAN9eE=
X-Received: by 2002:a05:6122:8c1c:b0:567:4576:534e with SMTP id 71dfb90a1353d-56aa09d3077mr5618374e0c.1.1772455032313;
        Mon, 02 Mar 2026 04:37:12 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a92175e87sm15111994e0c.15.2026.03.02.04.37.11
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 04:37:11 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-94de63dea9aso2979922241.3
        for <arm-scmi@vger.kernel.org>; Mon, 02 Mar 2026 04:37:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUf5O5rgYUGv9SqP/OFZ2b8TxaF+e270LVhjfJB1iwgYVeFUABxUQgvMGvGkdUVaAmuNwv/QQ8RdA==@vger.kernel.org
X-Received: by 2002:a05:6102:1629:b0:5f5:46f6:fb29 with SMTP id
 ada2fe7eead31-5ff324e81ffmr5803667137.26.1772455031730; Mon, 02 Mar 2026
 04:37:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227153225.2778358-1-cristian.marussi@arm.com> <20260227153225.2778358-2-cristian.marussi@arm.com>
In-Reply-To: <20260227153225.2778358-2-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2026 13:37:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUZjZvhifzh0W2wbMZf2DYgZjO=gXepsS2nQtSG0weCag@mail.gmail.com>
X-Gm-Features: AaiRm53-o6YuVgiLNI10tKCGvgnqzSehuU_fUzxc3DHRL4EGR1lrqXZ8SrXsMvo
Message-ID: <CAMuHMdUZjZvhifzh0W2wbMZf2DYgZjO=gXepsS2nQtSG0weCag@mail.gmail.com>
Subject: Re: [PATCH 01/11] firmware: arm_scmi: Add clock determine_rate operation
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

On Fri, 27 Feb 2026 at 16:33, Cristian Marussi <cristian.marussi@arm.com> wrote:
> Add a clock operation to help determining the effective rate, closest to
> the required one, that a specific clock can support.
>
> Calculation is currently performed kernel side and the logic is taken
> directly from the SCMI Clock driver: embedding the determinate rate logic
> in the protocol layer enables semplifications in the SCMI Clock protocol
> interface and  will more easily accommodate further evolutions where such
> determine_rate logic into is optionally delegated to the platform SCMI
> server.
>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks for your patch!

> --- a/drivers/firmware/arm_scmi/clock.c
> +++ b/drivers/firmware/arm_scmi/clock.c
> @@ -624,6 +625,46 @@ static int scmi_clock_rate_set(const struct scmi_protocol_handle *ph,
>         return ret;
>  }
>
> +static int scmi_clock_determine_rate(const struct scmi_protocol_handle *ph,
> +                                    u32 clk_id, unsigned long *rate)
> +{
> +       u64 fmin, fmax, ftmp;
> +       struct scmi_clock_info *clk;
> +       struct clock_info *ci = ph->get_priv(ph);
> +
> +       if (!rate)
> +               return -EINVAL;
> +
> +       clk = scmi_clock_domain_lookup(ci, clk_id);
> +       if (IS_ERR(clk))
> +               return PTR_ERR(clk);
> +
> +       /*
> +        * If we can't figure out what rate it will be, so just return the
> +        * rate back to the caller.
> +        */
> +       if (clk->rate_discrete)
> +               return 0;
> +
> +       fmin = clk->range.min_rate;
> +       fmax = clk->range.max_rate;
> +       if (*rate <= fmin) {
> +               *rate = fmin;
> +               return 0;
> +       } else if (*rate >= fmax) {
> +               *rate = fmax;
> +               return 0;
> +       }
> +
> +       ftmp = *rate - fmin;
> +       ftmp += clk->range.step_size - 1; /* to round up */
> +       do_div(ftmp, clk->range.step_size);

step_size is u64, while do_div() truncates it to 32-bit.

> +
> +       *rate = ftmp * clk->range.step_size + fmin;
> +
> +       return 0;
> +}
> +
>  static int
>  scmi_clock_config_set(const struct scmi_protocol_handle *ph, u32 clk_id,
>                       enum clk_state state,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
