Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC083148DB
	for <arm-scmi@vger.kernel.org>; Fri,  5 Dec 2025 10:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764931006; cv=none; b=HHydUVJG//20g/rpAQ9v2WmSnATfq2+I/pClsjUQs38TOjFD4DHM1bUYro+xUkvxZX4h0Z3J73kTWMYc3hpU/zQbIrbFSaMUoKbsXf41VRP+3Dcee17jXPRGuuWcGgDXv3+/e+h/7uk9Pq8lzk+VC4izWNnHaPqUK5LSIyF7Dhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764931006; c=relaxed/simple;
	bh=ycKrs6x7UZ0/R2hoNYEhE4aXquXVKoVf36j/PlEQHMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iMdG2xHNDa4bDHo7TwY+8UT8MupYhYt5d6giyAZRx9wkD6c2M9KYMKijhCvUyR0NrHXxbQdeisNeLUxbtMq0CDCDz1HYpEPmeHgyP3r4oHPXnDbsXSoWQbMSoLyTNnTaMjloBeTUAX0MNfUA04r5PwIVju8fstAqFNnZJi5Xsms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LGwMbA/D; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGwMbA/D"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-640bd9039fbso3228752a12.2
        for <arm-scmi@vger.kernel.org>; Fri, 05 Dec 2025 02:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764930995; x=1765535795; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lt2ss1bB/XUliiBno4usPmY/kV/OVOTzpKQ0/U9jwdA=;
        b=LGwMbA/D7sW216m5MYEU1BJCX75iKb78yQiQLW04qFYyoNNt+/4G2CCyPsRMpxwWd3
         korJIpkc8/3kxJ7B13QMpbe/2Z7SeN+ld3L/l50ZQscQn4TcG8LDpJgLOkEp6Hf0Rz8f
         r6LcsToA3+O7kgZYYZXcVuLinRQk9t6w/EJW3+vXXqFroCN69fyMEf/NqfMF1pCRnZcV
         u9dlBTnzR6X2tD2c1YhFCJZpxy4Jz7obMmlvc6zdsqboG8E2Muw/SCyFnJPQi+lmr9p2
         KW04t9BKMWAXiRgBqDjWHjnYIbmahDB79+yeOQflPY1DavXL1S+R7bmtRfvM/J9rpX15
         WKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764930995; x=1765535795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lt2ss1bB/XUliiBno4usPmY/kV/OVOTzpKQ0/U9jwdA=;
        b=RmfgOhhCjPHYFCZWmFq2XNsUMtha2n6k98paSiaRxgDnz6l1SUtecosOkKjtpPGe65
         oePNj5+21PxJvfUOdwXWJrKEV1oZJs22CIiDCdsrECoV5MG0v0cBzbOWb7nNMbsj6FwM
         AZP2nPQYMdDk0ihmxybpBJQC3eiDtBQb+wzjqOojbyRJNxZn3MNJSYBvE66C9aNxLiQN
         R9fG4qW0oG7CqPq4ZLT3zdsWSpidsHvkmNiCxY0nS9JwvB1BySeYRkAVyeVy3GYsYQU0
         boyRlLUIb5TF7lQZdRnKJj9xsuiEc6q5yE6MECGX2W68rGSU51SWnmYvaRTvit3iU4pK
         BR/w==
X-Forwarded-Encrypted: i=1; AJvYcCWWYXaywyqM0AYM/r9DXEaSjgbrjQoukCf5OCZa40bwmHtxTosI/73uS7xJjkcIcIKEpGM/F7HhtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9olPxlC/M9bp9m48l5NivI1eESZGX2XhFTcY5LGf1NX3baHso
	HBVWEtNEeIMyxk+ZQCpsWA+pnz/B7fqZ8Br6Tzdpw0zqn8Nh/F0oMNm8PFOPFgGxxfRlYn14XhV
	8kyJGYarke6BWWFdqNt9VRFIWq0ztRVuDx0R1
X-Gm-Gg: ASbGncubs4YUxKTm79aaUUW7rE2i+isywLuCzNmKZQqYdQYc6t9lWse+3QxsIyi00Pc
	70XWm1qpQGiZxgIPDyQxEdnmZgpDoRza2lmZIyKLp9pIeVKfhbMFgml/BYjmdZ+jwo4n0kHpztO
	sXLa9qcvH4k9m0Cyeq4k6As+B+gmCmqFTFqAq4RAn7fRwcOH1k1iCWXyC5/AoI217tJY5lKOPcw
	43/AecyRo863P2z0+KtkMnIWPPO4gSpELwzsWm9QcqbC+aPE6/FhG5P7KIEm4yN9HV/LbmB
X-Google-Smtp-Source: AGHT+IE+rG3U3UyeuHcB+l8KPCjR+GqvN76/IPOhH7l8IWCpoZ+EK9JYRVYvfqJw76f9AXd9IglIk7Wq1kXQQvRqLnk=
X-Received: by 2002:a05:6402:1e8a:b0:640:e78f:f34f with SMTP id
 4fb4d7f45d1cf-6479c3f6469mr8666759a12.10.1764930995213; Fri, 05 Dec 2025
 02:36:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aRW4PpPjVw1-melm@pluto> <20251123163557.230530-1-a.shimko.dev@gmail.com>
 <20251204-slick-granite-chameleon-58ebc2@sudeepholla>
In-Reply-To: <20251204-slick-granite-chameleon-58ebc2@sudeepholla>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Fri, 5 Dec 2025 13:36:23 +0300
X-Gm-Features: AQt7F2qG7F-3Lpc3xir1O-ytYSXmkO7JGeFDlJh_AWq3WNjYJ0rXmgUc-Vv3SZU
Message-ID: <CAOPX747pTsnTzKnaai-ytnmcf6reraTTSk+mssvHri4GMhCsOA@mail.gmail.com>
Subject: Re: [PATCH v4] firmware: arm_scmi: refactor reset domain handling
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: cristian.marussi@arm.com, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 4, 2025 at 7:26=E2=80=AFPM Sudeep Holla <sudeep.holla@arm.com> =
wrote:
>
> On Sun, Nov 23, 2025 at 07:35:57PM +0300, Artem Shimko wrote:
> > Improve the SCMI reset protocol implementation by centralizing domain
> > validation and enhancing error handling.
> >
> > Add scmi_reset_domain_lookup() helper function to validate
> > domain ids and return appropriate error codes. Refactor all
> > domain-specific functions to use this helper, ensuring consistent
> > error handling throughout the reset protocol.
> >
> > Suggested-by: Cristian Marussi <cristian.marussi@arm.com>
> > Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
> > ---
> >
> > Hi Cristian,
> >
> > Thank you for suggesting! If it works for you I'll try to improve the o=
thers protocols.
> >
> > It was tested on my board in QEMU and on real hardware.
> > The functionality didn't break, and peripherals that are reseted via SC=
MI work correctly.
> >
> > As an example, I can provide DMA test results (as one of the processor =
units dependent on SCMI reset).
> >
> > [    2.559040] dw_axi_dmac_platform 1000nda0.nda_dma_0: DesignWare AXI =
DMA Controller, nda channels
> > [    2.569265] dw_axi_dmac_platform 1000nda0.nda_dma_1: DesignWare AXI =
DMA Controller, nda channels
> > [    2.580601] dw_axi_dmac_platform 1000nda0.nda_dma_2: DesignWare AXI =
DMA Controller, nda channels
> >
> > # echo 2000 > /sys/module/dmatest/parameters/timeout
> > # echo 1000 > /sys/module/dmatest/parameters/iterations
> > # echo dma0chan0 > /sys/module/dmatest/parameters/channel
> > [   95.917504] dmatest: Added 1 threads using dma0chan0
> > # echo 1 > /sys/module/dmatest/parameters/run
> > [  101.931372] dmatest: Started 1 threads using dma0chan0
> > [  102.731009] dmatest: dma0chan0-copy0: summary 1000 tests, 0 failures=
 2508.42 iops 19706 KB/s (0)
> >
> > And vice versa:
> >
> > 1. Confirmed that the DMA module is non-functional without a proper res=
et via SCMI.
> > Disabling the reset logic causes a system crash on first access to its =
registers.
> >
> > 2. Requesting a non-existent reset domain:
> >
> > [    2.463400] dw_axi_dmac_platform 1000nda0.nda_dma_0: error -EINVAL: =
Failed to deassert resets
> > [    2.472091] dw_axi_dmac_platform 1000nda0.nda_dma_0: probe with driv=
er dw_axi_dmac_platform failed with error -22
> > [    2.482911] dw_axi_dmac_platform 1000nda0.nda_dma_1: error -EINVAL: =
Failed to deassert resets
> > [    2.491553] dw_axi_dmac_platform 1000nda0.nda_dma_1: probe with driv=
er dw_axi_dmac_platform failed with error -22
> > [    2.502256] dw_axi_dmac_platform 1000nda0.nda_dma_2: error -EINVAL: =
Failed to deassert resets
> > [    2.510735] dw_axi_dmac_platform 1000nda0.nda_dma_2: probe with driv=
er dw_axi_dmac_platform failed with error -22
> >
> > --
> > Regards,
> > Artem
> >
> > ---
> > ChangeLog:
> >   v4: Add Suggested-by tag
> >
> >  drivers/firmware/arm_scmi/reset.c | 59 ++++++++++++++++++++-----------
> >  1 file changed, 39 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/firmware/arm_scmi/reset.c b/drivers/firmware/arm_s=
cmi/reset.c
> > index 0aa82b96f41b..9854a3016d13 100644
> > --- a/drivers/firmware/arm_scmi/reset.c
> > +++ b/drivers/firmware/arm_scmi/reset.c
> > @@ -100,6 +100,7 @@ static int scmi_reset_attributes_get(const struct s=
cmi_protocol_handle *ph,
> >
> >  static int
> >  scmi_reset_domain_attributes_get(const struct scmi_protocol_handle *ph=
,
> > +                              struct reset_dom_info *dom_info,
>
> Instead of changing this, ...
>
> >                                struct scmi_reset_info *pinfo,
> >                                u32 domain, u32 version)
> >  {
> > @@ -107,7 +108,6 @@ scmi_reset_domain_attributes_get(const struct scmi_=
protocol_handle *ph,
> >       u32 attributes;
> >       struct scmi_xfer *t;
> >       struct scmi_msg_resp_reset_domain_attributes *attr;
> > -     struct reset_dom_info *dom_info =3D pinfo->dom_info + domain;
> >
>
> ... You can just follow the pattern you have done everywhere else in this
> change like:
>
> struct reset_dom_info *dom_info;
>
> dom_info =3D scmi_reset_domain_lookup(ph, domain);
> if (IS_ERR(dom_info))
>         return PTR_ERR(dom_info);
>
> Any particular reason for not doing that ?

Hi Sudeep,

Based on perf.c, I added this pattern only to functions that can be
called externally with an invalid domain value.
Therefore, I decided it would be better to change the signature of
scmi_reset_domain_attributes_get (similar to
scmi_perf_domain_attributes_get from pref.c)
to ensure consistency across drivers when working with domain numbers.

If you believe this pattern should be used in
scmi_reset_domain_attributes_get, I'll send you the next version of
the patch.

Thank you very much for reviewing my changes =3D)

Regards,
Artem
