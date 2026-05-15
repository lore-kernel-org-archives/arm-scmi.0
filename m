Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149E447F2EB
	for <arm-scmi@vger.kernel.org>; Fri, 15 May 2026 12:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778846441; cv=none; b=PYTiXCvn8LlAmxC9M9PE5Cxpuvrs2RYK7UcE4oT8G/3GJ/O6Pvn3o2y9jPiu00vLyg24qAAEFdzgzuAfwaXIhKoKTUwdTG0pKVncTIEYX8ZmpKOQOv07pxS36rsuPkubLn8vrRTFCY0ABMEGlYyLa46jtA0H0BXEL4TLIaIRcIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778846441; c=relaxed/simple;
	bh=X9fTQABNwTvMa0RxcaX3nuN2SeZovYr4xCXjp1SUWOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sbZ6LJ2nD+OR6ZZoqdfe74cuL5U95uDuvirBVWSRr+dDejwysP8hPx10Thr5Wuz4ncNpWQnvOW2APJEZ5RD4kreARdClnOcXhTD9l+AmSPYJMk6DRE0UpXusfGtPWDrW/ZrIf1iKmBoeJ79C4eH8PpHif7yAh7Ptgkk5VzQW584=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-95cc1a5fe9cso2667135241.2
        for <arm-scmi@vger.kernel.org>; Fri, 15 May 2026 05:00:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778846439; x=1779451239;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OeqLkT6YmhpaIvM6KqI+mX2KVKU2AF95h98UORdYbio=;
        b=snX9RGgfmmHDSwHfmfancjaYr1JKxA8xjRp4xKBRAj4+wtR8qNsSJegGhoIyXcQb9v
         M1IwRsKADBnO4ONL9XLWzwe2sCqixAa4wrPoKF0V4LqaL8+mxMB+Z1UXvmhc2cIhKejs
         OZ+yGXzLRMTKbEwHhbGLhkJ5+N+Xb5bURN4yID9eLrXI35CpclVqFrKi00AgMATjVBNH
         Gq6gGqJ9/+B0ZDW2aGOFvb0kVLk9BqrT9vWZp0+loql5rezAiIjj4zygiTMCVsZ8ZmPb
         kWGoke3M4xPbO7CSJ5cu26qKa1rs5xPB/PfbsQoHL5BD3pCqPwDyjqPko1iYSOp7e6Pu
         YxWA==
X-Forwarded-Encrypted: i=1; AFNElJ+/tFzekXactvqtY4jp+N7c5SZzmqnKLFjtOguaT84TzE6W+Yn0Sq8a/uBnpMZ7O4js51ALC2HGrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHg9x2fV2k2/ZqUeG+6EimDw/ij8vhTVF3VQsJ59TRend2LN4M
	QwXH8zs+Tp/lghRJRTQUcGw0uSE8uUtqEtWHhR/61Xjb6jxvYnkYM9OT0DQfCrA4
X-Gm-Gg: Acq92OGMnDoW9G7ElRNFg5+rNK+sR3MQFvynhG2s2U+8nAQTliD94o69XA+Cka7WmOf
	IOCm/fVs7AhBf2R03T/BXqUkhZyHPTsoovz4gQcI+0055BXErr8L9C+odabOZl9rrx+cKQF5EUa
	NCJvJKz31ZrKnVAZdw9JaozA2561ubPJlWaVhuK6CZeRqfaAUdaLAl2k8VpWWBetNp3lM61RdVW
	kb6bAQmY48nwcKGss1uX0qkkH6Bzm7aWmn3T/LIyzTPy4+ZftwBMFiID5WarJR1I1IUgTyWQqeE
	QPpAkkKCQrcpxtIfKk9ZR4ntAmgRM2IfTtarjzPzDU5PTL499iG+EEgI1Hrr6lUrClau5Ra4iEz
	BgQEI9Sm2NoyO1JtDBIDMy/Vkl7epXIGpfTUVyg9orH0JW1GrGV2yQt27+uzVF5DvueSFEBZQAj
	sttFDEdf05Sd6SwlV5u0x5c95JwgUIFBNlm4u42xuDzbN/w4glQCEMKxSEn0cW
X-Received: by 2002:a05:6122:d95:b0:56a:9841:9f81 with SMTP id 71dfb90a1353d-5760be56d3amr2027455e0c.6.1778846438640;
        Fri, 15 May 2026 05:00:38 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5760f58feacsm1170166e0c.1.2026.05.15.05.00.37
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 05:00:38 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-63130466364so2877407137.2
        for <arm-scmi@vger.kernel.org>; Fri, 15 May 2026 05:00:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ943uDShvWlNWFyZmcXCmH6NX84pV7kWhd8AG9Hc8IEXknvU8dpq5ttzJGGkZE3mi7nTLMssYZKRA==@vger.kernel.org
X-Received: by 2002:a05:6102:304d:b0:62f:2f1f:599b with SMTP id
 ada2fe7eead31-63a3d21f6e7mr1529435137.7.1778846436927; Fri, 15 May 2026
 05:00:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <75caae28bdffb55199a0bc6cac5df112a966c608.1778838987.git.geert+renesas@glider.be>
 <agb1Q6mrGyDwFdmO@stanley.mountain> <CAMuHMdXreO-6xQ+e88AKQ_vSiwMPMnx=t8h5JChBAtuV4UDMEw@mail.gmail.com>
 <agcHnzzdhV36j9eH@pluto>
In-Reply-To: <agcHnzzdhV36j9eH@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 May 2026 14:00:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVVAioAk_3K4y-7T0MCa7L++sVcWGRfdj_ESHau0ov9eA@mail.gmail.com>
X-Gm-Features: AVHnY4J92Za9USCx0Iqrdp0VKNlh7Aqvg8Y1zHpQUS0Wj660oR8QKip2za8oQmo
Message-ID: <CAMuHMdVVAioAk_3K4y-7T0MCa7L++sVcWGRfdj_ESHau0ov9eA@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: Fix OOB in scmi_power_name_get()
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Dan Carpenter <error27@gmail.com>, Sudeep Holla <sudeep.holla@kernel.org>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cristian,

On Fri, 15 May 2026 at 13:46, Cristian Marussi <cristian.marussi@arm.com> wrote:
> On Fri, May 15, 2026 at 01:29:27PM +0200, Geert Uytterhoeven wrote:
> > On Fri, 15 May 2026 at 12:28, Dan Carpenter <error27@gmail.com> wrote:
> > > On Fri, May 15, 2026 at 11:59:15AM +0200, Geert Uytterhoeven wrote:
> > > > scmi_power_name_get() does not validate the domain number passed by the
> > > > external caller, which may lead to an out-of-bounds access.
> > >
> > > Is an external caller an out of tree caller?  So far as I can see this
> >
> > I meant a caller outside drivers/firmware/arm_scmi/.
> >
> > > is only called by scmi_pm_domain_probe().
> > >
> > >         scmi_pd->name = power_ops->name_get(ph, i);
> > >
> > > where i < num_domains.
> >
> > You are right. But this seems to be only API implementation in
> > drivers/firmware/arm_scmi/ that does not validate the passed domain
> > number.
>
> Yes we tend to validate protocol operations calls even if apparently
> safe from teh caller perspective...indeed I have this fixed locally
> since ages in an horrible patch, that does a lot more, and that I
> never posted :P
>
> Usually, if it is worth, we also build an internal domain get helper to
> reuse across the protocol unit...but here really there are only 2 call-sites.
>
> What I am not sure is what to return: "unknown" is safer as of now than NULL
> for sure, but really, what happened is NOT that the name was "unknown" (which
> by itself would be out-of-spec behaviour) it is more that the whole domain that
> was referred to that was invalid and NOT existent...
>
> ....mmm I suppose we are opening another can of worms here :P

Like scmi_perf_info_get() returning ERR_PTR(-EINVAL) instead of NULL,
and scmi_perf_domain_probe() never checking the return value anyway?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
