Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F87C332ED0
	for <arm-scmi@vger.kernel.org>; Fri,  8 May 2026 17:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778261165; cv=none; b=GPykJr/fSRjCc/QnO1sm8EVcuSos6KaNASR7ksrXWIpdaIfUOtwDLzUNj6LI+sPRcda4w6X9tw2Y7wPEfWiouTejM1Dls2lDekD46jYXxQgWVxUw+RGHMGZK90kZosywHe0H7Iad2oN3kGgHT9fPgrzMBrdAT6m5uDe1UFhAJLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778261165; c=relaxed/simple;
	bh=d3tqz39L8iL5cu1eneVe/IK3XxjBUmhnX0iGHJqd3Ns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p1xobHHK6Sf0MDYYUWcL0YOxWFHj0gNmqVquIda0/TWKUjvdOESSwIqH/U61+O21ploF3eGrDK2sp3C4QqrzVgCbayX1oC5KBanUuXQjFz46Lz3O2iOhg/KZsvEY2DUspLvKy+9eUT2ZBgDvVF6LvGxFS3I9qmkg86wNq/7P8U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9568bae58f7so1369609241.3
        for <arm-scmi@vger.kernel.org>; Fri, 08 May 2026 10:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778261162; x=1778865962;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1gOD0ZM4cLpgZVKDB7ZJDmU99nqHZQBEOc0xVeQoZU=;
        b=Cha5vQHwKJOVNsXMTGF/w5gUgrrrSJGr0FPSjEUL3Zh4XYQf5ViAbZ+KPTGh80RCF2
         zpwH7H+3gmcVKs7NKfbtxSAcSEffs0IPj6wvbW5/XSMV59mPba+0W8OJT04EQNt4Cbc0
         ySZXuEL4EOETAoXY4lJ56OrCsK0PllocdzPM26lZaIwSXaaovrpkbAq0+jH6EZztCuf4
         y+GqkuwlRRZE2ELlfswL+aCZGD9nmab1cGkY41d8Whc/diRqI2udsX/wYMrs+pLTar4K
         8M1Xlfocz8kpLiIpDtilzEJXZtho4G/bJL8GK1eSEWCyavavIh6dVuM7896XB7z8GPFI
         2N1w==
X-Forwarded-Encrypted: i=1; AFNElJ8OpPneWF3/t4Az1rYK3mWADJwlu6MAnSctzvwF2AMp/EaHT9PbgXIF8ujI7kSIktKyeAwHS2Pyeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQt2G1Tmc+SyaCoWv2eo5B1TaJbwstn9Pimgbgt/B3XDX7+mqZ
	xMLrtx4O1lMVfohF4jf2X2E2YxVziBQxez/iiMizK2qYJe0/NLYXXU4Gll+CM0Nq
X-Gm-Gg: Acq92OGpjuf9ilqPYYuClwQMSbIgz/RZ+bBNcHzHc+dXiXpfXBgiq10GLim9tPzjREF
	9Pt2L30Rb6Dyl9oG+qAzxg+Dg5gcjNu3JkvdwG3skr+MV8Om32mdo0Szf/GYi+IS3MYDNnkAM+s
	pA16Wa8WrywWxI7n5bZXkFA1U/isxvqNKXG+kWlGcQ2qvGuSgmF7IZfrqqEuPbGqgrG382kN7s0
	XEcvgsLrnBlTqy40LDx3a+XeH5ajz+m3i0bS69AAvOm8XbL4aWYkkgwDwkvyQl14t4enZHsAR5W
	9Ro9iKqzC7BG0aToN4H5e8gS7gh45jUzPcJSWyBfw8bRv6lR4016JERZK/s97uCX8Ust38amngY
	yFwqRAJr7lX+5Y4hR5Hhfh7KyFw+KFrfhPctX0GBDrLzwhaM6XQJFmV+TjLVolYsdXQaIg6eHWX
	dd3UTyrE39VotA/Ydq6RCAgv3uZsUqrh5Z2ATRfe4Db36O2gNTRHyxl7uISIl3
X-Received: by 2002:a05:6102:f8a:b0:5ff:c64d:2283 with SMTP id ada2fe7eead31-630f90f76b0mr8528947137.30.1778261162527;
        Fri, 08 May 2026 10:26:02 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-631402487f3sm1292634137.10.2026.05.08.10.26.01
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 10:26:02 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9568bae58f7so1369601241.3
        for <arm-scmi@vger.kernel.org>; Fri, 08 May 2026 10:26:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8fEmaZmbNTjogTq88uKnlOESthehPiH6bLRv2fYIbigl31p8TxMcIHjAxLsN2G187hKOtDcUPKJw==@vger.kernel.org
X-Received: by 2002:a05:6102:8496:10b0:631:37cb:1e64 with SMTP id
 ada2fe7eead31-63137cb2003mr2206554137.4.1778261161532; Fri, 08 May 2026
 10:26:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508153300.2224715-1-cristian.marussi@arm.com>
In-Reply-To: <20260508153300.2224715-1-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 May 2026 19:25:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXyJcmL1k+odRC3ej1fx2oH_Li3RjniXuqXyJUMpBo7CA@mail.gmail.com>
X-Gm-Features: AVHnY4ImO3mUPR5n2IoskKjzHgmLGVKQHLOrOGove6CxmDdyTEnlUGm3u2KWMbE
Message-ID: <CAMuHMdXyJcmL1k+odRC3ej1fx2oH_Li3RjniXuqXyJUMpBo7CA@mail.gmail.com>
Subject: Re: [PATCH v4 00/15] SCMI Clock rates discovery rework
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, geert+renesas@glider.be, 
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Cristian,

On Fri, 8 May 2026 at 17:33, Cristian Marussi <cristian.marussi@arm.com> wrote:
> it was a known limitation, in the SCMI Clock protocol support, the lack of
> dynamic allocation around per-clock rates discovery: fixed size statically
> per-clock rates arrays did not scale and was increasingly a waste of memory
> (see [1]).

[...]

> v3 -->v4
>  - Rebased on v7.1-rc2
>  - Removed unused info.rate_discrete [Geert]
>  - Made dev_dbg() more meaningful by printing tot_rates [Geert]
>  - Fixed build bisectability by renaming properly to iter_response_bound_cleanup()

Thanks for the update!

I believe you still have a possible runtime bisectability issue
between "[PATCH v4 04/15] firmware: arm_scmi: Simplify clock
rates exposed interface" and "[PATCH v4 05/15] clk: scmi: Use new
simplified per-clock rate properties": 04/15 removes the last setter
of scmi_clock_info.rate_discrete, before 05/15 removes the last getter.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
