Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2ED1353EEB
	for <arm-scmi@vger.kernel.org>; Fri, 22 May 2026 07:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779436607; cv=none; b=SKDDks71hqNoLixAOa96pWxJTfabUK0VaIAHrsspHlmIl72GOinSvPEqxvbrVDdf5Y1Vyw6yVz56UO5zKAmjEmghX/F4ewQTqOTcF/t5GcFSERpvyCAkWBJANfQ0KP3aOZWkFmJzxWSCGOo+UTYtW/GvHD8fWLDUpG2EphFvuJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779436607; c=relaxed/simple;
	bh=n3+0dkEVfppB+BlGkqJd3GlAYo0KxiC+GqVw8dhmUrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o5e/BMQojXVEJz4FOfspepOxbV+90pieY18apnoPvNjNnidDtopCx4bucl5Zk3HITxKQhWzrBDg5xOt+d8E14Xr4WmlWxylHWIUUMJcXRsD7ZAYFbW9MRqjeJEK1PEnbYEsdcO+s/wMMRqvRw1rcUfNjijJPqWZsNrn+UNzP5os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56a857578a8so2780059e0c.3
        for <arm-scmi@vger.kernel.org>; Fri, 22 May 2026 00:56:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779436605; x=1780041405;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1URFBCQFkCLKN9AgsB1caAKF9WTg3pIgR98LDqqD60=;
        b=T7tEUNFLU4QkcxZQT9e+ExgffPWrmoaj+EbU/7ShBG+Cpfdt+BEdagG6YKj9U7Efd4
         vWu5bMo22h5fQpoxy0gxSmHh7W9S2jeIggoFumVMnc6YUnRxvjbFUl63Pd8wty0eGdrx
         0+F8AH21B2gnFT9h6zvvg26wsVV29g7rq01LR3cEBN3JxbNYNKFLHaal5myEgT+//Fv/
         uoYFsIcjPG1lFs7041h0ERfJK4StSGetmcbBAgrisZ7MFYdR3L5oA13pQAh3p4HmNGDE
         pVwgsdl9ESBsRx65/AQshhCi7ldurAVG212/HubrnV+axgy/qV9vg20z9Wju29hIP3B4
         7Ptg==
X-Forwarded-Encrypted: i=1; AFNElJ+DDCZ3HXG/h0k7H4zVewER1yV3JTotOBI24YKFC4Bwofx6VKk+mcLPhCrTO/okpwPumpV98UqBZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhoQoSJc6jN2VuByh8lIqDuO+XzE5CC7+0cIMCMMFl/1QKKvFW
	Z/0x1iDjocTcck9mQJ8kQv/rery4TE4eYCLu8BjeMJsF15g4XA3W3jWbCYcuEPz2
X-Gm-Gg: Acq92OFizpWNpEDRCRxANZZDtOcDyVZVaL+8ebN7cuwyrMYAxVaqippV94HFrNBbJou
	c7vESQJvqkBKsU/R59dS0icawWJzVufeboXNw/rsDPJLM3K4xpMWtCTrFlUppuB4DxyDPKUj7Rr
	RFJGFA1QyJ8bSvzwgJ3N1eg4SgoLv1w1j15xolNZGMcGwu0H4clmOUt+1yGMn6f2XclARco0kjd
	vJPqUBUVTuObgqVWEq6bNdg0RIzT4gLkTbD06Ds0G3pAGVmlCPRw/468ysZqaC/imgz3hBf2de3
	FxXQ6JpZk2VtsukDcD6loXv6VzYW1sECEKWyH9G7dEyEVCFWRNu0kHExEOdA1aT94HVrDPQar8l
	LGF/FeP4eekoMtF9OgokyzTmqSqBZTShKyZDiXsxKNPvi9yR/sX+VA7O3uLW58omEcU649ak/eE
	iQJaIJQe7wERdDSZZPUx2qkNwUi8xoIESIvBfKb0G2S1dASBjWXBqGk5e589IdCLWIbCrUV/Ei8
	Y0HvBu/qA==
X-Received: by 2002:a05:6122:905:b0:56e:f262:9113 with SMTP id 71dfb90a1353d-586626bb34dmr1101631e0c.14.1779436604415;
        Fri, 22 May 2026 00:56:44 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f973300dsm1291081e0c.18.2026.05.22.00.56.43
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 00:56:43 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-63319183a49so2593994137.2
        for <arm-scmi@vger.kernel.org>; Fri, 22 May 2026 00:56:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8RHf6oWXTLCRgZvUiqb8e0W+zi+mDGlwVMWYUv8q7PREx2KEixVmvyhTDukl6sPxM4YS1qur/7pA==@vger.kernel.org
X-Received: by 2002:a05:6102:580d:b0:631:4191:6f7e with SMTP id
 ada2fe7eead31-67c6f273735mr1076501137.4.1779436603553; Fri, 22 May 2026
 00:56:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <75caae28bdffb55199a0bc6cac5df112a966c608.1778838987.git.geert+renesas@glider.be>
 <20260521-loutish-lurking-koel-229bd9@sudeepholla>
In-Reply-To: <20260521-loutish-lurking-koel-229bd9@sudeepholla>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 09:56:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWA1UpZSiN26fd71LUMYatVOwJos6bGb4zR0bnPUqBF8w@mail.gmail.com>
X-Gm-Features: AVHnY4IbACGIPx8bzoPdFLB4YFVUiG1ESnLSjpbPYX_MILNqEuLBdTCR2tWqAP8
Message-ID: <CAMuHMdWA1UpZSiN26fd71LUMYatVOwJos6bGb4zR0bnPUqBF8w@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: Fix OOB in scmi_power_name_get()
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sudeep,

On Thu, 21 May 2026 at 18:26, Sudeep Holla <sudeep.holla@kernel.org> wrote:
> On Fri, May 15, 2026 at 11:59:15AM +0200, Geert Uytterhoeven wrote:
> > scmi_power_name_get() does not validate the domain number passed by the
> > external caller, which may lead to an out-of-bounds access.
> >
> > Fix this by returning "unknown" for invalid domains, like
> > scmi_reset_name_get() does.
> >
> > Fixes: 76a6550990e296a7 ("firmware: arm_scmi: add initial support for power protocol")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  drivers/firmware/arm_scmi/power.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/firmware/arm_scmi/power.c b/drivers/firmware/arm_scmi/power.c
> > index 3aa84ceb6d2bab68..4a7215e02dec035d 100644
> > --- a/drivers/firmware/arm_scmi/power.c
> > +++ b/drivers/firmware/arm_scmi/power.c
> > @@ -204,8 +204,12 @@ scmi_power_name_get(const struct scmi_protocol_handle *ph,
> >                   u32 domain)
> >  {
> >       struct scmi_power_info *pi = ph->get_priv(ph);
> > -     struct power_dom_info *dom = pi->dom_info + domain;
> > +     struct power_dom_info *dom;
> > +
> > +     if (domain >= pi->num_domains)
> > +             return "unknown";
>
> The only user of this function must not call it for domain >= pi->num_domains.
> However, I am thinking if it is bit inconsistent within SCMI core now. I like
> the way pinmux/ctl handles this as I don't like the alternative for this
> (i.e. ERRPTR(-EINVAL or something)). Worst case if this ever causes issue
> we can change the signature of the scmi_{power,reset}_name_get to follow
> something like pinmux and update the users. Thoughts ? Happy to apply this
> for now.

You mean returning an int error code using return statements, and
returning the objects using passed function pointers?

Depends on the number of returned objects: if it's just one (e.g. a
name or info pointer), then the valid pointer/error pointer idiom is
very common in Linux.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
