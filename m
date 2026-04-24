Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5AE3644A2
	for <arm-scmi@vger.kernel.org>; Fri, 24 Apr 2026 14:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777039237; cv=none; b=C5DcT8PEENB0hbnJQx2cfFRjY3M+PgQMGwy3lZLZNUJAffSJrMGnerTKzpw6sS0BmX+fMZLlRdGsgopItVQEkhbgcH8uXUoWSrNNrjKGflwvOI1oHS4muDX0nNIyA5/0c7+zUo9Xy24kSUU3j54i7+WLyU4jtty9IuHRjlrZAb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777039237; c=relaxed/simple;
	bh=3WWUYT1S+sWCthHEyd69qr4QRMOSskrJUjp0/GRNRCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NKwRzGI4Sj7Eru/53R6vqagrV0d2VYlwHLyu/LysOHJ1avW5uoDwSlN8mTKjSJmMTNZhjcCeILh9G+RyQThMwxp/Juh50lPf2Q+u39pv9VWvHg8o6VhQse7YWqb5/cH0LXorstYvolRaNTlcKHvCDOp3YMdgMwGCh0WM/aUffC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-824c9da9928so3987829b3a.3
        for <arm-scmi@vger.kernel.org>; Fri, 24 Apr 2026 07:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777039236; x=1777644036;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5W09Put2d2jcS6dMqMtNkVaKBleBYHmqz0mTuj06mJ8=;
        b=qiWGLRdtk3s6f6iHKG3Ich++tnGgUm0licqBIfAKjxWoGz9ekDQsBeXgGWaU7J2rYE
         vuxeTJM9xpXepG1lpK/DMGnOX7d9s9rGGTglgsn2dI6I5PCzyyK43mNUv6u+RHAfxUwp
         shE7wE3+ljYVnT5duE4dva1V1NCqxTRyFzQimai4ChqzXR1MB4iFZa2eem7m+WZjQxD6
         m5InhgDKsp7GEDelrE18B1aSteVcoCk0P6GZuALYuAe9CVFwW+Wuu4FsvdFSjv3D+FCx
         XqP0L96anYsHCDCcLIGaMigMtOZCW1cAu0bJ6KeVRSIAA7In5u3oTKpqdK9pZl/TdLgH
         Cq+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+M/+n3C8Gn65lrQhqhUgQtGUzmf5CVUfqQxAnVsbZaSzi5ZVhYliD7LMOzGcF4vSXkMXcL6WRTuA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl1P7+lA4vGR1RE8iLaV0w1GIOmBb7R4zn7wXwtuUx3iuHD7c6
	fiNztYWO/4kQPaNr0szInSDqm3MsQ2cEGa3sS/imjvVUMT77jAwlA9hMu0zRpt8R4eI=
X-Gm-Gg: AeBDies8gaQw5K/UFDk6kzhYLejfc79EVC2Z/m/sVWl647+OU9IbBLLUembHym5XThN
	JEDkDcwZFzwc6xwhbnh0Mx6j0zFNd0oc0rZbcxEgG0nZNzeKPIF/vq/ethK9c1tHUimMw1AHEU7
	qmcItIwd/QkKj5Zad+UX65TIIlBVDzuqPYp+U2t2LpXDUl/KiACNUKsf7jh7M56iw0pR11mOwfO
	oWIwoMu5fbsCCX2zEjTOpq04a+hz8/NfEvtXgeVUFlnG1DCsE3l8cD+upftbCi4RimUfXk16NDm
	nCqoos7OaV1NaT23dCpkkOM8xycFh+eE/X681pqT5NZukn0cL4by35b5no08WaAyDyS/hiSEtY5
	E9bb7LYRhYin2z/rBT6yNEzkJABAT/rgMzAaYCNd4IbTApemHWS8879LGXwvNjbc9j1mzhggpy3
	iqasC5/FgAyKNoW7USv6WsThRTEbA16FWF4Zl6YfNZMIWwKLsy19UmtolbgpaXmlXI5sBjJAefD
	tw9a9T5
X-Received: by 2002:a05:6a00:420e:b0:82f:2070:2693 with SMTP id d2e1a72fcca58-82f8c8bdb1fmr34770577b3a.22.1777039231723;
        Fri, 24 Apr 2026 07:00:31 -0700 (PDT)
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com. [74.125.82.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9cbb1dsm25782762b3a.14.2026.04.24.07.00.31
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 07:00:31 -0700 (PDT)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12c565476d7so3664185c88.1
        for <arm-scmi@vger.kernel.org>; Fri, 24 Apr 2026 07:00:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9HPZNNB5bykHqsSaJPsBVTz4ApPB21h73AkCv0CbBbIeK0wnz0Tterz6dSyIP2YBAHrT1Bz4/Naw==@vger.kernel.org
X-Received: by 2002:a05:6122:888b:b0:56f:adb8:7c54 with SMTP id
 71dfb90a1353d-56fadb88baemr9569375e0c.3.1777038919660; Fri, 24 Apr 2026
 06:55:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-9-cristian.marussi@arm.com> <WNCeTzosRbKm_zGsbSPx8w@collabora.com>
 <aetw1WcSCDxk11AV@pluto>
In-Reply-To: <aetw1WcSCDxk11AV@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 15:55:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXYGRzq2j3z1io=kHj_QsWtJBirPhbZPa5bFBD7U9e0sw@mail.gmail.com>
X-Gm-Features: AQROBzDgUwf7y8JAYn7HmssU55ZLu_QWLKDdr6HYpgz_IN4dOPPU1wpFaeXKzVc
Message-ID: <CAMuHMdXYGRzq2j3z1io=kHj_QsWtJBirPhbZPa5bFBD7U9e0sw@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] firmware: arm_scmi: Harden clock protocol initialization
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	sudeep.holla@arm.com, philip.radford@arm.com, james.quinlan@broadcom.com, 
	f.fainelli@gmail.com, vincent.guittot@linaro.org, 
	etienne.carriere@foss.st.com, peng.fan@oss.nxp.com, michal.simek@amd.com, 
	dan.carpenter@linaro.org, geert+renesas@glider.be, 
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Cristian,

On Fri, 24 Apr 2026 at 15:32, Cristian Marussi <cristian.marussi@arm.com> wrote:
> On Fri, Apr 24, 2026 at 02:07:59PM +0200, Nicolas Frattaroli wrote:
> > On Tuesday, 10 March 2026 19:40:25 Central European Summer Time Cristian Marussi wrote:
> > > Add proper error handling on failure to enumerate clocks features or
> > > rates.

> > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > > ---
> > >  drivers/firmware/arm_scmi/clock.c | 22 ++++++++++++++++------
> > >  1 file changed, 16 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
> > > index c9b62edce4fd..bf956305a8fe 100644
> > > --- a/drivers/firmware/arm_scmi/clock.c
> > > +++ b/drivers/firmware/arm_scmi/clock.c
> > > @@ -402,10 +402,16 @@ static int scmi_clock_attributes_get(const struct scmi_protocol_handle *ph,
> > >                 SUPPORTS_RATE_CHANGE_REQUESTED_NOTIF(attributes))
> > >                     clk->rate_change_requested_notifications = true;
> > >             if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {
> > > -                   if (SUPPORTS_PARENT_CLOCK(attributes))
> > > -                           scmi_clock_possible_parents(ph, clk_id, cinfo);
> > > -                   if (SUPPORTS_GET_PERMISSIONS(attributes))
> > > -                           scmi_clock_get_permissions(ph, clk_id, clk);
> > > +                   if (SUPPORTS_PARENT_CLOCK(attributes)) {
> > > +                           ret = scmi_clock_possible_parents(ph, clk_id, cinfo);
> > > +                           if (ret)
> > > +                                   return ret;
> > > +                   }
> > > +                   if (SUPPORTS_GET_PERMISSIONS(attributes)) {
> > > +                           ret = scmi_clock_get_permissions(ph, clk_id, clk);
> > > +                           if (ret)
> > > +                                   return ret;
> > > +                   }
> > >                     if (SUPPORTS_EXTENDED_CONFIG(attributes))
> > >                             clk->extended_config = true;
> > >             }
> > > @@ -1143,8 +1149,12 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
> > >     for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
> > >             cinfo->clkds[clkid].id = clkid;
> > >             ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> > > -           if (!ret)
> > > -                   scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > > +           if (ret)
> > > +                   return ret;
> > > +
> > > +           ret = scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > > +           if (ret)
> > > +                   return ret;
> > >     }
> > >
> > >     if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {
> > >
> >
> > I see that a quirk is being added for this, but I thought I should chime
> > in with my opinion for future approaches in this direction.
> >
> > I don't see how this hardens anything. All this does is break platforms
> > that were previously working by returning early. At most, this should
>
> Certainly the naming in the subject was chosen badly (by me!)...indeed it
> should be more something like "Enforce strict protocol compliance",
> because at the end all of the broken platforms really run a slighly odd
> out of spec SCMI firmware that does NOT implement one or more of the SCMI
> mandatory command...
>
> > be a warning (as in not WARN but pr_warn/dev_warn/...). If firmware
> > returns nonsense, a clock driver should imho try its best to work
> > around the nonsense in a safe way, because the alternative is that
> > a major part of the system (and thus likely the entire system) no
>
> ..well yes we definitely dont want to break deployed platforms BUT also
> we dont want to legalize this kind of out of spec behaviour in future
> firmwares...hence (a number ?) of quirks an FW_BUG warns probably to
> let already broken deployed platforms survive while discouraging such
> implementation in future fw implementations...
>
> These firmware most certainly wont pass the SCMI compliance test suite [1],
> which indeed we do not mandate, but the reason these bugs happened is
> exactly because the kernel SCMI stack was buggy and left that door open...
>
> More specifically these kind of out-of-spec behaviours are not really just
> a matter being 'picky', the problem is that any resource set in any
> SCMI protocol is defined by the spec such as to be described by a
> contiguos set of IDs and the drivers are designed anyway under that
> assumption from the allocation point of view, so allowing a clock ID to
> just fail one of the mandatory commands and skip a domain would jeopardize
> all of this and, even if clearly is NOT a problem here, seems a fragile
> assumption.

How can you have all of:
  1. a contiguous list of IDs,
  2. implement all mandatory commands,
  2. restrict the use of some clocks to a subset of the agents in the system?
Use a different list of IDs for each agent?
What if a mistake was made, and a clock was exposed to an agent by
accident?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
