Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9629520B7F1
	for <arm-scmi@vger.kernel.org>; Thu, 13 Feb 2025 08:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739433836; cv=none; b=iTbdGkiB6AdFKupSFDVqSAc/m+5mLQ0Oed3RUQNgzi/HBmrR30Rt4zeODszxSWVqV1ZzRKzO1NlcCyPiBk65gBd4I/n7K7BBtyK801pa11bufR7tYuUvf8ezq2y/5zD3Twd7UcTwhjtLdFfjRUugOBEcoDSg2f8naulFGonSB9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739433836; c=relaxed/simple;
	bh=vE/nMK7SkZLF6SPBiS+pD5YKBv1qwS1OW7LGyXSjOw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HqOclqHinP07HBYWHdF2/uwW4c5XpwDv2TJf5P5EAWZEshr4hhxGmTwu65v0gQknNzUWm0DrO38do6NQ0qLBnMntzual5l0uILgHg8arqa+YRXVoPhARdWLkPSb9qWs1NRWeZtwQbJq2LBVKJBUTUfvl8SW0qvFhQs5XFjzevSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xi0lMrRE; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xi0lMrRE"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-543cc81ddebso575400e87.1
        for <arm-scmi@vger.kernel.org>; Thu, 13 Feb 2025 00:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739433833; x=1740038633; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fyc1yaw37X9Hy+KPrdEbRh/UJTHUV0AcPCsCJ/7TTWI=;
        b=Xi0lMrRE3aiCQjSJc1h1DrkxyWLf4p7g+fIsHYrnRT4/v7JGGDvuVhqKVc/EXSFIj5
         kU2srXhwqLJBsxgtodSV0ZoaWRx1LB/6ci2yUke6IOFrd+I9MZLMV8p8DW8EoR9jWZSh
         YaqZpdDfHtyWW9Q7EnKPZUnk1Xl/bIWjuwyCuYf2QRtPH87y71PWWIe7XFEa/AtAnzb0
         p64IS/egQiKzwE5OIyQEeUuYvRahTzh1CH2jb4/MzEtt9EwESRPIbkKuMXnokjNIQF3h
         fCjbKlnB1V10NUEK60DNPZCjwGtZh4zN0PCJgwu3pjZlahiMLvzPSYSjNL3wzUh7Jixp
         K9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739433833; x=1740038633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fyc1yaw37X9Hy+KPrdEbRh/UJTHUV0AcPCsCJ/7TTWI=;
        b=I1/gQWwluDbKhDikOKyqjyKT2PvBdFZZ8hAXhVALSN295Rt6CwEXeXCw0/sB5ete5h
         X1+5tFUhVql+o6KSn5fZYnMKN4j+dQOZTzZjaY7FgFUmNW9WCpdNJhx7AoGEmfV2h8Ea
         dZd98hArrgLAd87jnEn3DwZIS82rt/a2kU43koTH+jgVBqR26METICoPTEDVGr8rnxt6
         6n3W2OuC4O1dxBBWImIWtbuADW3WkWS4uIX8j+wr2A6zwdEOCDOIl8A+AFhGeM1TMb+d
         v+5x9Ej3VOIicF6HVO9VbGjjzMdB1ziRiB87ShXoNOrbT8w0oAuz5Pviwy6ljzjpi0PJ
         aqFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxyiDN5SB2W17WyrFR2V79mp1k6lh1Z741PlyvRHlgfuMxmVqvu8Swl4UnFsULin+UZrCLW2so2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgR9n9RP/CB1kF3QcpxOBYmEd/JUBqFFe59a88qp9on5HrTIQ4
	yImW5fdvGPcJQwQzByv+mEGZQ37s+QJPhQDjxzuTKj0Ih6gEbDErggVBxSRTLnCU2rqqFK1NHNJ
	bg8/qFVFRGA7h0j9MNwwwjL+lJabFrbPJaglS
X-Gm-Gg: ASbGncu4uOCj67j77jzuxksXkjLYqjBzyKuCRyk8gY/ATYeoAmoJI9RX2b3zeLWjUaF
	UBD+1ywkilQhGvWF399nM99J076bILo8w4nI0d61sUqB+i+ORPvGf3eGVhaqqhr5s1gvHPGo=
X-Google-Smtp-Source: AGHT+IFWyIrhkyKlq1DLb3nMjYFpG5D1inOQfYzABRURIba5WYtufrGTgdJdkB8ZyACpw4GjQScdFhUnuN3eyI7vuSU=
X-Received: by 2002:a05:6512:b29:b0:545:c9d:ef26 with SMTP id
 2adb3069b0e04-5451dde812cmr595357e87.46.1739433832285; Thu, 13 Feb 2025
 00:03:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
 <20241225-scmi-fwdevlink-v1-1-e9a3a5341362@nxp.com> <Z6uFMW94QNpFxQLK@bogus>
 <20250212070120.GD15796@localhost.localdomain> <Z6x8cNyDt8rJ73_B@bogus>
In-Reply-To: <Z6x8cNyDt8rJ73_B@bogus>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 13 Feb 2025 00:03:15 -0800
X-Gm-Features: AWEUYZlo14W5CDbxko4W2HItMT0EmqxiYqRbj09Nfq6VGtFk976X-V52R5aJvug
Message-ID: <CAGETcx87Stfkru9gJrc1sf=PtFGLY7=jrfFaCzK5Z4hq+2TCzg@mail.gmail.com>
Subject: Re: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 scmi cpufreq
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2025 at 2:48=E2=80=AFAM Sudeep Holla <sudeep.holla@arm.com>=
 wrote:
>
> On Wed, Feb 12, 2025 at 03:01:20PM +0800, Peng Fan wrote:
> > On Tue, Feb 11, 2025 at 05:13:21PM +0000, Sudeep Holla wrote:
> > >On Wed, Dec 25, 2024 at 04:20:44PM +0800, Peng Fan (OSS) wrote:
> > >> From: Peng Fan <peng.fan@nxp.com>
> > >>
> > >> Two drivers scmi_cpufreq.c and scmi_perf_domain.c both use
> > >> SCMI_PROTCOL_PERF protocol, but with different name, so two scmi dev=
ices
> > >> will be created. But the fwnode->dev could only point to one device.
> > >>
> > >> If scmi cpufreq device created earlier, the fwnode->dev will point t=
o
> > >> the scmi cpufreq device. Then the fw_devlink will link performance
> > >> domain user device(consumer) to the scmi cpufreq device(supplier).
> > >> But actually the performance domain user device, such as GPU, should=
 use
> > >> the scmi perf device as supplier. Also if 'cpufreq.off=3D1' in boota=
rgs,
> > >> the GPU driver will defer probe always, because of the scmi cpufreq
> > >> device not ready.
> > >>
> > >> Because for cpufreq, no need use fw_devlink. So bypass setting fwnod=
e
> > >> for scmi cpufreq device.
> > >>
> > >
> > >Not 100% sure if above is correct. See:
> > >
> > >Commit 8410e7f3b31e ("cpufreq: scmi: Fix OPP addition failure with a d=
ummy clock provider")
> > >
> > >Am I missing something ?
> >
> > Could we update juno-scmi.dtsi to use ?
> >
> >  &A53_0 {
> > -       clocks =3D <&scmi_dvfs 1>;
> > +       power-domains =3D <&scmi_perf x>;
> > +       power-domain-names =3D "perf";
> >  };
> >
>
> We can, but I retained it so that the clocks property support can be stil=
l
> validated until it is removed. I think there are few downstream users of
> it. It is not just the DTS files you need to look at when dealing with
> such things. It is the bindings that matter. Until bindings are not
> deprecated and made obsolete, support must exist even if you modify the
> only user in the upstream DT.

Sorry, been caught up on other stuff and trying to get to some long
pending emails.

Sudeep,

Do you know why commit dd461cd9183f ("opp: Allow
dev_pm_opp_get_opp_table() to return -EPROBE_DEFER") was needed? I'd
think fw_devlink would have caught those issues.
I'd recommended reverting that/fixing it differently instead of
creating commit 8410e7f3b31e ("cpufreq: scmi: Fix OPP addition failure
with a dummy clock provider")

Peng, Sudeep,

If you make fwnode ignore the cpufreq device, then it'll also not
enforce ordering between cpufreq and it's suppliers like clocks and
power domains. Not sure if that's a real possibility for scmi (I'm
guessing no?). Make sure that's not going to be a problem.

Cristian,

Thanks for taking the time to give a detailed description here[1]. I
seem to have missed that email.
[1] - https://lore.kernel.org/arm-scmi/ZryUgTOVr_haiHuh@pluto/

Peng/Cristian,

Yes, we can have the driver core ignore this device for fw_devlink by
looking at some flag on the device (and not on the fwnode). But that
is just kicking the can down the road. We could easily end up with two
SCMI devices needing a separate set of consumers. For example,
something like below can have two SCMI devices A and B created where
only A needs the mboxes and only B needs shmem and power-domains. This
will get messy even for drivers if the driver for A optionally needs
power-domains on some machines, but not this one.

        firmware {
                scmi {
                        compatible =3D "arm,scmi";
                        scmi_dvfs: protocol@13 {
                                reg =3D <0x13>;
                                #clock-cells =3D <1>;
                                mbox-names =3D "tx", "rx";
                                mboxes =3D <&mailbox 1 0 &mailbox 1 1>;
                                shmem =3D <&cpu_scp_hpri0 &cpu_scp_hpri1>;
                                power-domains =3D <&blah>;
                        };

Wait a sec, looking around at the SCMI code, I just realized that you
don't even really care about the node name to get the protocol number
and you just look at "reg" for protocol number. Why not just have
peng's device have two protocol@13 DT nodes?

cpufreq@13 {
    reg =3D <0x13>;
}
whateverelse@13 {
    reg =3D <0x13>;
}

You can also probably throw in a compatible field if you need to help
the drivers pick the right node (where they currently pick the same
node). Or you can do whatever else would help make sure the cpufreq
device is attached to the cpufreq node and the whateverelse device is
attached to the whateverelse node.

Looks like that'll first help clean up the "two devices for one node"
issue. And then the rest should just work? Cristian, am I missing
anything?

Thanks,
Saravana
