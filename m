Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A63378830
	for <arm-scmi@vger.kernel.org>; Mon,  2 Mar 2026 13:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772457927; cv=none; b=FDyR1bDTCz+KESMXwGoZwhmX1PVKG62disCLaoAfrPjY3INYsMxZo4YUCnqFVeYSXG11Heo6a2p/kizhbtvObdTYltJeR6y/9XhLl9w6SzZ3q4P4ZiE8RRIZ5aYzFF2y21FQMJyXNCCkTEhj/Dm1u1NuZWMF+MBlIF0ztFGWAbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772457927; c=relaxed/simple;
	bh=sgxnmhj2rQgljJRNTMAEIU71ZOKKmdvca0WN6HsSkl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pxs3bApYikVWRF4K3OaEB27unhW9cMGnlwu8Py4pyHQcTCR8VJEkiV92ileHCHNnAm2M6QbomIGPUIIdxuRZxs1YIPQaHTvmRvFKkKwjCSrWGZQ4gD6tQkjx+jQgtEY/cAVXHX8+b+PzWxfZnWlr/KzCk7lPeNhvvNBme0cWmGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5ff09bb668cso2960939137.0
        for <arm-scmi@vger.kernel.org>; Mon, 02 Mar 2026 05:25:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772457914; x=1773062714;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/KgeLtXmZOUh5kr82wm/EePACuyTgS6gfBGBNvywTM=;
        b=rvMemLoBFiOj4ipzQMkMYWIRK44RFRnB/tAHHU7NkMzT9/40qM8kC8iq5lWQ/1dwjl
         EpGG3Nf1oc5/bJT94rCTxA/G9twC6ezkxqwIWVeHhV+8EaS3EH+11zgha5ztn1YbICMt
         7scHGmIGchrYRiJkvXn7GfI/MM5cDo87vji2EwGsiSeVqSHaDauyCB4NLASULtaA/lTA
         5o1YOsBCKKWY93bEuJz3cnmdxvXJGcYRmCPJz2RR9SWm7nS+CvvX8ggSQs9yn5XQuTsW
         Gj5pUAt581NErttuzL87yXV9YViBBzVZKNyjL+39QTMUScZnRusNCtF9082Vl0I4jt7j
         2LyA==
X-Forwarded-Encrypted: i=1; AJvYcCU9B3676CFdIefGcvD7q80wqS3+qaOuKvC2dFXGfaeAoIO45zv8HKUEo96voQ0tQF1wGn1DCrwBKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfCNAcSxoqjlOg24vkG1Lop0+I4P5r3Mg1/uBzM/y20CE3IJbY
	ByOzYcWVf039bY4/fUYP4hTyJhTtBUbflutFd7W+T8iUNMKK9d93eSe95ubxPDPd
X-Gm-Gg: ATEYQzxhFG4M76HLZ14EtH1E0l+LbuqxZGh5wfX9u8BPcvjwfdW5FSBPJuHvDjR42Rm
	zPTOyFJ3rd+U1GaW9EXxOVmQVrlisG1u7PmHnQw1kTIE7vcxaKl5XktBmF289RfPWeJ7V8QsoSL
	h8C2zdwvUCP//cKXJi8cvENr6CDG3GgxreuFTKxcqztJzs3An+vkyovZMsFifGv88NRAr6KYD+F
	hgSgzxuNzf2i0QAykGQDS1hwoy/IppGu+RJWB313/RDSfBRuAa6T40sHp2n24lg1Y+rVaZ2z76Q
	b61AK/LyQ/uV1q8squqiYFFMtym8H+CMRItK+cuNB2sZgPFxeIEvm/SOYiWIZv9ZqR5XmzzGQXr
	adWpFqOMRGW09BKWpZmuEFvqmuwSz5o96oHtcgztd5yZ9xzBywmtvwQ/rvVsYjAcnIDmIG9to/8
	QSb/e/ghWM4kOJ8U/AwyzX1Cj0cq62dRZdxrO1p1joSzbxV8CaMzCUmTLrf0zw
X-Received: by 2002:a05:6102:e08:b0:5f5:320c:4d36 with SMTP id ada2fe7eead31-5ff325b7a61mr5680623137.40.1772457913758;
        Mon, 02 Mar 2026 05:25:13 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1e7af30asm13119172137.3.2026.03.02.05.25.12
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 05:25:12 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5ff1703cb93so2872566137.1
        for <arm-scmi@vger.kernel.org>; Mon, 02 Mar 2026 05:25:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVxiK97TPECQyfW1K4qV1a0g7Tvya/lk7hjgQDNC61wL+CJEtXzjQdToFR3HG6HWD5Z2vwZI6tHPQ==@vger.kernel.org
X-Received: by 2002:a05:6102:304c:b0:5ff:1d94:b746 with SMTP id
 ada2fe7eead31-5ff32519f2emr6218672137.27.1772457912000; Mon, 02 Mar 2026
 05:25:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
In-Reply-To: <20260227153225.2778358-1-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2026 14:25:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW9dtAnT2E103kp1zK=LJrER7k1ib8_WPk5aorPRw80uQ@mail.gmail.com>
X-Gm-Features: AaiRm50Tkxhc-oCHlHPyabn9QxR4wbHw_RTC9z1g5dQZe_w9JY9CV7dca6PXC-4
Message-ID: <CAMuHMdW9dtAnT2E103kp1zK=LJrER7k1ib8_WPk5aorPRw80uQ@mail.gmail.com>
Subject: Re: [PATCH 00/11] SCMI Clock rates discovery rework
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, dan.carpenter@linaro.org, 
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Cristian,

Thanks for your series!

On Fri, 27 Feb 2026 at 16:33, Cristian Marussi <cristian.marussi@arm.com> wrote:
> it was a known limitation, in the SCMI Clock protocol support, the lack of
> dynamic allocation around per-clock rates discovery: fixed size statically
> per-clock rates arrays did not scale and was increasingly a waste of memory
> (see [1]).
>
> This series aim at solving this in successive steps:
>
>  - simplify and reduce to the minimum possible the rates data info exposed
>    to the SCMI driver by scmi_clock_info
>  - move away from static fixed allocation of per-clock rates arrays in
>    favour of a completely dynamic runtime allocation: just allocate what
>    is needed based on the effectively discovered
>
> This is done in patches 1-6.
>
> A further bigger optimization suggested in a past series [1] by Etienne

s/[1]/[2]/

> would be, whenever allowed by the spec, to limit upfront the number of
> queries in order to simply retrieve min and max rate, that are indeed the
> only rates needed by the CLK SCMI driver.
>
> The approach proposed in [1] was open coding and duplicating some of the

What does [1] refer to?

> functionalities already provided by SCMI iterators, though.
>
> Patch 7-10 implement such optimization instead by:
>
>  - reworking core SCMI iterators to support bound enumerations
>  - use such new bound iterators to perform the minimum number of queries
>    in order to ony retrieve min an max rate
>
> As a final result now the rates enumeration triggered by the CLK SCMI
> driver, while still allocating for all the existent rates, miminize the
> number of SCMI CLK_DESCRIBE_RATE messages needed to obtain min and max.
>
> Finally, patch 11 introduces a new clock protocol operation to be able to
> trigger anytime on demand a full enumeration and obtain the full list of
> rates when needed, not only min/max: this latter method is really only used
> currently by some dowstream SCMI Test driver of mine.
>
> Based on v7.0-rc1.
>
> Tested on JUNO and an emulated environment.

Thank you, this removes the need for increasing SCMI_MAX_NUM_RATES on
R-Car X5H, while decreasing memory usage.
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

> [1]: https://lore.kernel.org/arm-scmi/aZsX-oplR6fiLBBN@pluto/T/#t
> [2]: https://lore.kernel.org/20241203173908.3148794-2-etienne.carriere@foss.st.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
