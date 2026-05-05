Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D447A39022E
	for <arm-scmi@vger.kernel.org>; Tue,  5 May 2026 11:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777982241; cv=none; b=i5n70HB97pmZgLp2qEZXq4QTlFRxEkV08dYjYRx6jtG1Oash7x9ofjp9Sg8LpNFo6FL9I0i7VjM9k4QpgNEuJzrbew6rPcuTOSs+k5gKx0CNlIjbwtjyD9m9XuwFpyKm9aO/x4eQiSwaZnOqDgnfxteStaV1iXljaQ9yjGJDDoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777982241; c=relaxed/simple;
	bh=6qmJB7Ugs0YgAfkUvBE9SVyIpJgfeZTTcqGmgTZ2Vr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OtESH0mOjRo5NP44GyQrwredOD0qm6vJXIflo0vcSbD5z7n/bhujbhsqhqH28RsZF5/uYnjevTsJLEmHdtfJ2GBwOf5blmwHymSpm+Za7Ml6VJTIeK4JJRS5oh6HTkL8D0IUEZwfThG5ow4t0Wzb4e1BS0GLmPwQrsQJQZVfOU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5751136c561so2108836e0c.1
        for <arm-scmi@vger.kernel.org>; Tue, 05 May 2026 04:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777982239; x=1778587039;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WSn3Gp8++tbsczQV3o+avsi3Hm1AnDhWAFzNoHqmYE=;
        b=AnXYOcCatybwa8A+oZNH78nVr0N7lWeZw8NBOOWfN6GI7GSpk6ym5htPO+VXnJNLYZ
         uphjDomRP+ZsJNRIhCrQL5vamugcr3I2xAuie62gAbnzqll34u+AbW4+dRqkX5V+FfXC
         vTlc/0V0vAGQtvI3LKoahVax6uvIOmyOzoEKLS8wtb8sKALyU0XqqdbDTd4JhKyLJB33
         aZEKLvML2pUW/136zfe2ZP/mwkCPbmWzunPe+dGvZDQI9JGXFxa6bSbl/9N81FXKqg11
         CTHgl5B/otjpSnl2xvQ1iikhO7wRsp82ifo/SBlUUTDpFTCSX1cPdUTlQuhPg21pJrA+
         5N5A==
X-Forwarded-Encrypted: i=1; AFNElJ+aH+/AnvJ4C6pbHZmhgv+j4MlpH/9sJUhaX+CBvLChlnXM/0RntXLp368lXJaUjixE/wf2j6VqDA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwa83cJWJzPw7vEwCsus1+GoMugxfljTrIr6vqmNBEPegjSjrG
	1BHgN+aTS+3uhBLo2mt7OcoaVAgHsZIVEvryZmWo/C8F/xKRyh0nicl2Zt/WLiyd
X-Gm-Gg: AeBDieuLqeC8936SQWJZqnQ9vszs4/lG3UarTkW0ONTQGUyf2mdHvqQAOxDB/QHfTBf
	iBy/oNgb2Dzoifbabn8lCv43+Bj9PBSRM06WCefJ4XTo1E4/WtCMbiBRE496eiio5nezEmO4WUq
	QBC/fYB+fVmjR7jfw0SLex91cBhDlCgomeBv2UJmDU4lmHpZZvUcgihw4RhWaAE0ynO+91jj/T0
	9P5SWu0gJaLm85MELBdv/HUqWGc22kZhDO0Zjcyn3pqPtt4zXL4+YqwRkmogBo6Eu80wcieO5ot
	9Pln6h9IuqgekHF+H5PklWZYOjxhGbYYsnn8S0uJuG/dGxcXtFb8Q/alNaEKFIXLVT6sIS6jFEU
	AQlVczzabYDx016eT1J1JI+5KuIXnKz89ldP+PgtyyqlPKJvbFnhrxSJPtrAGZ/irxUXMn7KrBv
	PxnfUMP5fbVeAYQZFOQikAxsTek8Dsa85F0LWdTnrHoB7gie5sMYCHC5F2qsLpJczPJK3VcCc=
X-Received: by 2002:a05:6123:23:b0:573:acba:5a06 with SMTP id 71dfb90a1353d-575447813bfmr923417e0c.6.1777982238786;
        Tue, 05 May 2026 04:57:18 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ce0af68c7sm6901058241.9.2026.05.05.04.57.16
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 04:57:17 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-62e7d2633e9so1849902137.0
        for <arm-scmi@vger.kernel.org>; Tue, 05 May 2026 04:57:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+/heg7RoOYKpFBm7Xu9iWcMeFS8+b1ftLJBuZCr0motgWcPjycoaSwdepCg8OVIme7hs1zfKWGbQ==@vger.kernel.org
X-Received: by 2002:a05:6102:d8a:b0:607:d68f:d0f6 with SMTP id
 ada2fe7eead31-62f55a492fdmr1354982137.20.1777982236245; Tue, 05 May 2026
 04:57:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428201522.903875-1-cristian.marussi@arm.com>
 <20260428201522.903875-14-cristian.marussi@arm.com> <CAMuHMdXtH=4J7bDGAk8xoxNDYRsHSRDReVNU_PpUnUDfU=afpw@mail.gmail.com>
In-Reply-To: <CAMuHMdXtH=4J7bDGAk8xoxNDYRsHSRDReVNU_PpUnUDfU=afpw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 May 2026 13:57:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUG9cTH+WFAHymHeBrPK1vsE5XCJeWOxqF22efc_omMhw@mail.gmail.com>
X-Gm-Features: AVHnY4Lq3Zggrs4Qv91iMEofghVqKQUPPKW-R1C9WbhWCH-RGMfKoh_-yjYR4Ms
Message-ID: <CAMuHMdUG9cTH+WFAHymHeBrPK1vsE5XCJeWOxqF22efc_omMhw@mail.gmail.com>
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

On Tue, 5 May 2026 at 11:59, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, 28 Apr 2026 at 22:17, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > Clock rates are guaranteed to be returned in ascending order for SCMI clock
> > protocol versions greater than 1.0: in such a case, use bounded iterators
> > to minimize the number of message exchanges needed to discover min and max
> > rate.
> >
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
>
> Thanks for your patch!
>
> > +static int
> > +scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph,
> > +                             u32 clk_id, struct clock_info *cinfo)
> > +{
> > +       struct scmi_clock_desc *clkd = &cinfo->clkds[clk_id];
> > +       int ret;
> > +
> > +       /*
> > +        * Since only after SCMI Clock v1.0 the returned rates are guaranteed to
> > +        * be discovered in ascending order, lazy enumeration cannot be use for
> > +        * SCMI Clock v1.0 protocol.
> > +        */
> > +       if (PROTOCOL_REV_MAJOR(ph->version) > 0x1)
> > +               ret = scmi_clock_describe_rates_get_lazy(ph, clkd);
> > +       else
> > +               ret = scmi_clock_describe_rates_get_full(ph, clkd);
> > +
> > +       if (ret)
> > +               return ret;
> > +
> > +       clkd->info.min_rate = clkd->rates[RATE_MIN];
> >         if (!clkd->rate_discrete) {
> >                 clkd->info.max_rate = clkd->rates[RATE_MAX];
> >                 dev_dbg(ph->dev, "Min %llu Max %llu Step %llu Hz\n",
> >                         clkd->rates[RATE_MIN], clkd->rates[RATE_MAX],
> >                         clkd->rates[RATE_STEP]);
> >         } else {
> > -               sort(clkd->rates, clkd->num_rates,
> > -                    sizeof(clkd->rates[0]), rate_cmp_func, NULL);
> >                 clkd->info.max_rate = clkd->rates[clkd->num_rates - 1];
> > +               dev_dbg(ph->dev, "Clock:%s DISCRETE:%d -> Min %llu Max %llu\n",
> > +                       clkd->info.name, clkd->rate_discrete,
> > +                       clkd->info.min_rate, clkd->info.max_rate);
>
> Printing clkd->rate_discrete is futile, as it is always 1.
> It would be more useful to print clkd->r.num_rates instead, although

clkd->tot_rates (sorry, my local tree still had your v2)

> that may still be lower than the actual value, due to lazy handling.

clkd->tot_rates is the actual value, so there is no such issue.

>
> >         }
> > -       clkd->info.min_rate = clkd->rates[RATE_MIN];
> >
> >         return 0;
> >  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
