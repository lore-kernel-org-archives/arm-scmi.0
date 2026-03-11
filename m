Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FE926A08A
	for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 16:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773248397; cv=none; b=Q/wbAmViPHwHcCJ615sbW/qgG4KOeYb7NtAs3Bfu9lq5t+KEv2sCCcbtyEoX0W3TBqaeAIZBUP/R5n9fpY/sSRndw/7ILx1S+5zYijT3NMuSaDXEkBzuxRQ4ijedPP5zOjO6x3098yU4nMdx+2zaA95B4y4yKP4cdEPtIB65E1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773248397; c=relaxed/simple;
	bh=3dMJxR9TjCJ9S3Lg7LcRJbtat+eyZPt3SNqC/m6FxkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iV8/mCswmx0+3WIj3c7Bd7Zy/7ctQCMV5w2ME21ECfhtIQDqr/pfuWN3CVL2bZBHVkIreBx1GTcPMwtsLiaZeMp1Mfb7n1skN2Pm8F+LV1fBLXgIfT/hKF0BYu8VmacCkO5iun5cr6DczCjkmq7g38jZsMjjh7jW8slMjdyrqcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-94ddba39060so13670241.1
        for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 09:59:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773248395; x=1773853195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHqYyMyxNQscHKqebkYfjh9WcEHBmwP9uSBnn8fEJDk=;
        b=QfuJFdfhVuAdv7H7cU9FuQWtdWXHMgl1ylN98JDDUTmbVZTI3b818BGMiN3eV+Tb26
         /zfOUBftAzy3hQVMIypuFZe/7IVUcf2FaI29jkb7tanWtyTQn6lraa5LgocZame68svh
         HYfRSLQTr1TZ18RuwblnTEyPLYB2aQBeV8a18TPNY8si4TSqAKkEqZiryRGVqQ+0V8Ki
         Jl6oeyCgtou/MQ++Wcio2DPBfkzt6/+ZF7WvnJ1FcF3cN4ZSOb7lVOCVpXOGGL5KGJqm
         WrU5KMsXwl19HtyumGeMShCTBnGDiXp3aCgw73enBh37Cu/mbbeFvI2ulkb4sApo0FK6
         VrLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBjWTnQqeUYeVFX6Y+6EOiBtSP+mSINOPRWyHv7CTC9rxmgYuuCh73llc2dhOfLmciMg37CuTrIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOaK5ot3hPH4lIlL0aBMWvGaWgSKV8DywzD2x+GEQsrq3/ti4Y
	xCGTU4G87LdX2y3KNO6ION7QrHdgYNJWOGlznvb5o8/Owoy9+apSByBf1OSkGais72k=
X-Gm-Gg: ATEYQzw18hh8GClReFAl5UPZDLWe1OuB3B93TVSHYwF63u+obq4oJ1KmigXSrIRXcPX
	SktPA4ipcN7bvwi+dAuuLi3/Fn59ZAVo6mXqINZzsdgCVqEI1Q16pPtYeZlD9YuvGhHQn6DBIUi
	aOAtA3ZfpLOZdtZa74Hv5boqDYUFzEzAjj6ofKn9e1zG2AUnyputkshjUjsM3uNP5vW222GSGf+
	zSpgL3Oew5sZC7XDN97c4XVraLx0L2RoScPWog1c3d1dsnuYOCF45jivBtmVtoKUhCy7k49XUnI
	zyMHxn7C+KBt+HBMVYkRtKJB+sP28hYXFv7vNwMWF6QnvxWY3M05Cf2P0VJ3njGTxxXbwEWEy+M
	23qAOSk2/Z0fPUXFsGB+qoVNHABBFK9mhzUfWsp5a91ZJ35blJyYPr8yu2KXKoHsJDmqQUCm9JU
	olN+GMwQpIOzUYspM3xMVonS6RJ4/JVCCMs/Sm9Ri7kuttp77MRJxJsTgR5tpLAagR
X-Received: by 2002:a05:6102:1606:b0:5ff:a4e0:193d with SMTP id ada2fe7eead31-601deaefeb8mr1110858137.2.1773248395004;
        Wed, 11 Mar 2026 09:59:55 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94ecfc9cb40sm784296241.5.2026.03.11.09.59.54
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 09:59:54 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56afbcd8adbso67171e0c.2
        for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 09:59:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUx39WEtsILb3WjvXRmlRpT5c2W+1n1oHTonrdSWk8Ux0pllgLXVoTeidDxLuWLSRSqLM+vU82ceg==@vger.kernel.org
X-Received: by 2002:a05:6102:e0c:b0:5ff:a16b:93f8 with SMTP id
 ada2fe7eead31-601deaf0a5cmr1083265137.6.1773248394584; Wed, 11 Mar 2026
 09:59:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310184030.3669330-1-cristian.marussi@arm.com> <20260310184030.3669330-9-cristian.marussi@arm.com>
In-Reply-To: <20260310184030.3669330-9-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 17:59:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUdqrA9kYeDpjwj-y6-4aALkAi2g2Od81Kxh-EVW2e2Nw@mail.gmail.com>
X-Gm-Features: AaiRm52tcdDuztFkx9k48Wz50kutFch70oo-cU-eA7FFMTwppL_ACNeUC0TZgzs
Message-ID: <CAMuHMdUdqrA9kYeDpjwj-y6-4aALkAi2g2Od81Kxh-EVW2e2Nw@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] firmware: arm_scmi: Harden clock protocol initialization
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

On Tue, 10 Mar 2026 at 19:56, Cristian Marussi <cristian.marussi@arm.com> wrote:
> Add proper error handling on failure to enumerate clocks features or
> rates.
>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks for your patch!

> --- a/drivers/firmware/arm_scmi/clock.c
> +++ b/drivers/firmware/arm_scmi/clock.c

> @@ -1143,8 +1149,12 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
>         for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
>                 cinfo->clkds[clkid].id = clkid;
>                 ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> -               if (!ret)
> -                       scmi_clock_describe_rates_get(ph, clkid, cinfo);
> +               if (ret)
> +                       return ret;

This change breaks R-Car X5H with SCP FW SDKv4.28.0, as some clocks
do not support the SCMI CLOCK_ATTRIBUTES command.
Before, these clocks were still instantiated, but were further unusable.
After, the whole clock driver fails to initialize, and no SCMI clocks
are available at all.

> +
> +               ret = scmi_clock_describe_rates_get(ph, clkid, cinfo);
> +               if (ret)
> +                       return ret;
>         }
>
>         if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
