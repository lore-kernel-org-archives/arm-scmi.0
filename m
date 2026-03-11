Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F3D3112C1
	for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 11:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773228979; cv=none; b=ZDc3TQFSxG1tlmZ8rqcEjWUwwchEX5BLrZAFopQvguvhhtL7Tidv69NzqhVIwFF3wloCRTyahBefuRpr58IGNvy8EvDrz0ND3PKc6BkEG8Klcqps+GK73w+jPYwk4pYY2WLBO/Yl2JfVoPkB8Jt28+Zk/szcUWaRd28pp1hg6hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773228979; c=relaxed/simple;
	bh=+3Q5cvF0zoX3Fs6Oo+yHNZCoRTKFJVHEonlQPpaB+j8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ua45VYaiX+DLu4KujiUzKb5jBVRxouVE1xhxC22wchB2neLByIMUdyaWINhKAVdR2k5Upfr9f9Ro027dH4RzeleDueitClX2HYYo0B3K9NgGSnevBzxnAa44cTzdFkNJYY+R3QNF0MhbENfjfWAvbnKtyXl81yzTnFXmo4sbIao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7d74c1157a4so2901558a34.1
        for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 04:36:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773228977; x=1773833777;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFUwPWUa2C8RyPEgXtS/bViQ1F3uFE3QYAtTuWHnxcc=;
        b=SeDvVsGV62axda1iFreoDB7jKkMABiMd4q6tnputwpuI4UcTOlEDgMR649cOV75bep
         gn1A6KXiytOC4lTPDL3J3SQeCtjz5kzQ3x0AyBX3FNLz9I4mehS7ykv1/6pspHKV0oXS
         ZCC+ZHoBddPXPTMUJvNs89dG/bw/Pb3bTuRvhQs3+A64GQSkQ7aY51yY14q7Qmk0x8jy
         C8bcfG14J60FUxxA323S9zuW3UsExGJ17/liKkWZWcYzOROLW1EFS7FU6nWU/YHwYaEB
         SXyL6WqP1KPMkD9rZV9+MGV/ic/xYXNGj8d16NXKHt51q6Fth9WvXBnoMTRichaKTAMM
         Gn/w==
X-Forwarded-Encrypted: i=1; AJvYcCVSoK+kXfb/QIQaSfiJfQfwK3Pd92qxXOonQPY6WwaacHIDe/qUHK/OMqYux2ubBvPyLrtzRlamMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwF8Mr1AbbYP+8HoMPgcvKIMnsO7Hm9fkMFXLuIheZqjxc27VJt
	2UijU31yFqMh2D43sEeu21tfNKKqIuNjrSuXk61jatfdENISh/IcI+RiXJRuZgqm
X-Gm-Gg: ATEYQzwinAtPMZi2+Dj1+OBAImxv/skeJm1c+VDEQhCRFlxIg710uJipxQK7LIERdz+
	GW9k6s5ZJvkXcrA/SdB5yXZIgT/mSVeN7Iv0sKRFUeFXEW6VdZHpAAfr1rsFZDvasPOmWkD6A12
	hbVvFYcuRIwa1VjIo8BTVsGYzlFy5MZ9b41mc1QdmqsQtuDPg13QNGyZd3fcKYKz785RW/3wv9o
	UARpBVLwKS+ma7ZYt7rYxi7yp58/2Ru3NV2VFmdsVteZEG1oN+fjCcHYvOI/e4giQisfGRf8ToC
	4jCDYgm30i2w4EiP5Vdz2pC9FSdw2bVrW/6oYpdBI/h/+4iirkk//Ixk8gEDTTBgNn2Y6jhs0nd
	duWfBpB5u6St7CQJP8kd3AFKoKap7tHsMWDUaqbJ3bHCaaPn7u71lQZRTtn24CnW09nD/+Hd7dN
	H3ZDjqt2UETDTvpsJJ5vVy5t+SVZQCq9jBXpxwbQved54bfYyfIT7B35zPRNpNzXYO
X-Received: by 2002:a05:6830:63ca:b0:7d7:5bb2:568d with SMTP id 46e09a7af769-7d76a7dbfd1mr1515448a34.28.1773228977125;
        Wed, 11 Mar 2026 04:36:17 -0700 (PDT)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com. [209.85.167.172])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d76aedae57sm1720555a34.28.2026.03.11.04.36.16
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 04:36:16 -0700 (PDT)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-464bba3a9easo9331128b6e.0
        for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 04:36:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXGEBjtA/bUWkUVIBohcS2rX85lCuXIjtTVMz5Qx7IjRMkmS5Uk5Eh9mCJEFyNeFkrCQ2JCxzi9Fg==@vger.kernel.org
X-Received: by 2002:a05:6122:4b14:b0:566:2711:d8ab with SMTP id
 71dfb90a1353d-56b47474538mr661085e0c.6.1773228645230; Wed, 11 Mar 2026
 04:30:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310184030.3669330-1-cristian.marussi@arm.com> <20260310184030.3669330-2-cristian.marussi@arm.com>
In-Reply-To: <20260310184030.3669330-2-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 12:30:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX5T-7ERcjEK_=z7joEftC2cMLqDkyy8iO65U21S-umng@mail.gmail.com>
X-Gm-Features: AaiRm531V7pPeKFeCYpwBljOpOuuWMHfwPn8-oVZZtZhYt-YNy5G1WfiCBuIrko
Message-ID: <CAMuHMdX5T-7ERcjEK_=z7joEftC2cMLqDkyy8iO65U21S-umng@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] clk: scmi: Fix clock rate rounding
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, dan.carpenter@linaro.org, 
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com, 
	marek.vasut+renesas@gmail.com, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Cristian,

On Tue, 10 Mar 2026 at 19:40, Cristian Marussi <cristian.marussi@arm.com> wrote:
> While the do_div() helper used for rounding expects its divisor argument
> to be a 32bits quantity, the currently provided divisor parameter is a
> 64bit value that, as a consequence, is silently truncated and a possible
> source of bugs.
>
> Fix by using the proper div64_ul helper.
>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Fixes: 7a8655e19bdb ("clk: scmi: Fix the rounding of clock rate")
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks for your patch!

> --- a/drivers/clk/clk-scmi.c
> +++ b/drivers/clk/clk-scmi.c

> @@ -83,7 +83,7 @@ static int scmi_clk_determine_rate(struct clk_hw *hw,
>
>         ftmp = req->rate - fmin;
>         ftmp += clk->info->range.step_size - 1; /* to round up */
> -       do_div(ftmp, clk->info->range.step_size);
> +       ftmp = div64_ul(ftmp, clk->info->range.step_size);

include/linux/math64.h has:

    #if BITS_PER_LONG == 64
    #define div64_ul(x, y)   div64_u64((x), (y))
    #elif BITS_PER_LONG == 32
    #define div64_ul(x, y)   div_u64((x), (y))
    #endif

I.e. div64_ul() is meant for the case where the divisor is unsigned
long.  Hence div64_ul() may still truncate step_size on 32-bit
platforms, and thus should use div64_u64() unconditionally.

I am aware clock rates are "unsigned long" on 32-bit platforms, and
thus cannot support rates that do not fit in a 32-bit value.
If that is the reason you are using div64_ul(), it should be documented
properly.  And probably the SCMI core code should reject any rate values
(incl. min, max, step) that do not fit in unsigned long, as such clocks
cannot be used on 32-bit platforms.

>
>         req->rate = ftmp * clk->info->range.step_size + fmin;
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
