Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601663876AC
	for <arm-scmi@vger.kernel.org>; Mon,  2 Mar 2026 12:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772455208; cv=none; b=mS73/wttCS79Zzmh3jU8uYvTp15PE5o7QmRBDkBSnkqzfb0zoqcX6oJXwzXcFPwn0tTsm/cTxfV3GBFs2Hm5J6u3NreCFUFGSjENr24goowkuH9Njn/1Vi+tP4K1svZ98DHUGVUwPd326XcwYL/0GEOZM3PV0NiipmgfgdWk+rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772455208; c=relaxed/simple;
	bh=bbZA1NIjrsyDbwc/owDhNs6Y6gSNpyIeUkxNy0yJ1ss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UbGC/z397Jx8qYFYqecI2AtVatHi0VvZYkTJwEcyG57t86ragmcNpfmhmAxd39l5GK7hYH2Wcxggs76ouk7SC8FbwZLjTwU6uNkFvwq7c6I+HuSvkllcZ37JuwCbz4DHhlLC2FyxETeMTnCyF8h5ggKLu+gucVYyv5yR0O87Qmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56a87098868so1543197e0c.1
        for <arm-scmi@vger.kernel.org>; Mon, 02 Mar 2026 04:40:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772455205; x=1773060005;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHdX83DJ8NzB0+Dg2GzVMundpvvc3+ChCaV5hT6gxKs=;
        b=iKJpa2ybx/koqfKoD373wdEnFVNJ04qtmXDlloCnQ5mrTzH+GVfYY8bHIbXtZSFM96
         3wYjytJMB9Bg4NiG2A5hyuwj/tQz1GSC7wbrMMU7q4YF/1jCTmZY24e+zTdzE3Nng2Xa
         U7/Fj37u3NDP0U7GunUhruAgCExntB+tyqVslxAFdYUrxlzbBIdwBMxTmNz+Fngg3T1O
         jSy5aB5BV1bDtlp9+fV6w5jFiUp3p9MBhqZ35rWLvp6aFNldKgV8pYs0hxwfWgp3lsDB
         4B9kv0wlZK1Ma7cYEXkxJfRNkHAgBPQ6I0e4SCLhq/HKiLvhL2GErmuKMxk+Rfq03xHy
         3dPw==
X-Forwarded-Encrypted: i=1; AJvYcCVuRCwGefOvqkHeB9OQ5Y4HosmDANzeiIxxlNIBRDofhthhCsBmZIzu3Gk1edmiHKTzdvQmfECphQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAtYU7YSitPu3l+4OXWqrFW/A46nwB/H7/iTY+TyTKIIUhvxot
	y2R4fXQ/4YqLMP17ZKPd2nP4+CfCncnUIIuVxEdIXCl+p4M8eKw8W2BOluCvX46u
X-Gm-Gg: ATEYQzxaCuP4WjUrVZURU1r1mAZkBugYWl9vZ0jgabcpJpIk+SPXbXTcoRvU4g90w9M
	NNMAhViZjQ2pW7wioLlb4KnNoyJr3+jhSyuOqOVLafvonpaLmU3ip/teuT36XrqXcuD+c7fCs7+
	pOMrVBSqXeujM6yb+cYKDk4xfK4D1GV7mSw7Ug68vTeq5z7RKj93BDNWjYpCrbc5Avhj97NqAzS
	/+H+OCBZjoosUbqlxIIlP4KFFrWfGu9MCOti7PU6qSoplDIIzvNeNxPT6Ny/Ap5jRrMFxfQcw9w
	7APx+Fh4StuA+2W1+rKG0yTvr0q4T+vdzB1JIZLqaKDfPELENOfkz8i9bApifNlC2hBe8I3eh4u
	TzVWQroUk9dvac4KNtLyhGAdvAxe0b7v9PVN6iIq0hK2r9aHE12IYhU4GxPDBAeQsgtSLc+57Zh
	MYMY6vKoqXV/o+ANXodwnod2+u25//QQ0GNTzp/fSD6Qb9aJnQMsclwyG9DFvn
X-Received: by 2002:a05:6122:8c1c:b0:566:21af:5d78 with SMTP id 71dfb90a1353d-56aa0aadf97mr4547306e0c.10.1772455205034;
        Mon, 02 Mar 2026 04:40:05 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56ab07e6b62sm7626768e0c.14.2026.03.02.04.40.02
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 04:40:04 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-94dda16ff9fso1296467241.1
        for <arm-scmi@vger.kernel.org>; Mon, 02 Mar 2026 04:40:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXgitNzSaUSCecWrS0jvVDi6ys8/1xcJSrdRfssbJcmkaXg45ctlKbO5JQnPiQaaDj3wY3pFZPpPA==@vger.kernel.org
X-Received: by 2002:a05:6102:b0f:b0:5ff:3159:303f with SMTP id
 ada2fe7eead31-5ff3228629emr4217443137.7.1772455202516; Mon, 02 Mar 2026
 04:40:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227153225.2778358-1-cristian.marussi@arm.com> <20260227153225.2778358-3-cristian.marussi@arm.com>
In-Reply-To: <20260227153225.2778358-3-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2026 13:39:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVCgq4Wbm8g_O9e1sPhJ4PyY-nWTt9RW1f3=G3a0PvdKA@mail.gmail.com>
X-Gm-Features: AaiRm53Myvi_2ZqSj1TUDPoKLpT_7oeJnXIYfnZdksVjKBsJ5C9Q8S7vMIJT-rk
Message-ID: <CAMuHMdVCgq4Wbm8g_O9e1sPhJ4PyY-nWTt9RW1f3=G3a0PvdKA@mail.gmail.com>
Subject: Re: [PATCH 02/11] clk: scmi: Use new determine_rate clock operation
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, dan.carpenter@linaro.org, 
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com, 
	marek.vasut+renesas@gmail.com, Brian Masney <bmasney@redhat.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Cristian,

On Fri, 27 Feb 2026 at 16:33, Cristian Marussi <cristian.marussi@arm.com> wrote:
> Use the Clock protocol layer determine_rate logic to calculate the closest
> rate that can be supported by a specific clock.
>
> No functional change.
>
> Cc: Brian Masney <bmasney@redhat.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

> --- a/drivers/clk/clk-scmi.c
> +++ b/drivers/clk/clk-scmi.c
> @@ -57,35 +56,17 @@ static unsigned long scmi_clk_recalc_rate(struct clk_hw *hw,
>  static int scmi_clk_determine_rate(struct clk_hw *hw,
>                                    struct clk_rate_request *req)
>  {
> -       u64 fmin, fmax, ftmp;
> +       int ret;
>         struct scmi_clk *clk = to_scmi_clk(hw);
>
>         /*
> -        * We can't figure out what rate it will be, so just return the
> -        * rate back to the caller. scmi_clk_recalc_rate() will be called
> -        * after the rate is set and we'll know what rate the clock is
> +        * If we could not get a better rate scmi_clk_recalc_rate() will be
> +        * called after the rate is set and we'll know what rate the clock is
>          * running at then.
>          */
> -       if (clk->info->rate_discrete)
> -               return 0;
> -
> -       fmin = clk->info->range.min_rate;
> -       fmax = clk->info->range.max_rate;
> -       if (req->rate <= fmin) {
> -               req->rate = fmin;
> -
> -               return 0;
> -       } else if (req->rate >= fmax) {
> -               req->rate = fmax;
> -
> -               return 0;
> -       }
> -
> -       ftmp = req->rate - fmin;
> -       ftmp += clk->info->range.step_size - 1; /* to round up */
> -       do_div(ftmp, clk->info->range.step_size);

Oh, so the truncation bug exists in the original code, too.

> -
> -       req->rate = ftmp * clk->info->range.step_size + fmin;
> +       ret = scmi_proto_clk_ops->determine_rate(clk->ph, clk->id, &req->rate);
> +       if (ret)
> +               return ret;
>
>         return 0;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
