Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74971EDA14
	for <arm-scmi@vger.kernel.org>; Thu, 13 Feb 2025 08:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739434667; cv=none; b=KNtmw7F6D76C3moRAx4ebbjWXMPj1ESBvICm9kOwmYi3LRMlcQLlB3LEee+Wz14eQyHTW9jb7gkADzDfekVQVeTtWiiD0US5R4hNBCV4D+M3Zh6VWfiB4O/C7CPoSZ0uhdbDMbvfg/C6o/To7KBINePg5fUFH7/m/F3Y5+1r9xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739434667; c=relaxed/simple;
	bh=QIcpGwLOutIyQh32HNDYfU3g6OUWstG2YLgU9TsX+WI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FJUh8DsXLbOr4Bctf14nRzFtMIL/A7O8pk6+j6bD14z0W7KfeSro9xZXg2fDfSZ2Cx3ktP+CFt5NZqhNU5U87HwORm+GtGm2KK4+8kpUpQMhPRYfoaxdjLd+hH07kcBWN541yFy6LmaW9uSU9D7dPp+VKE3VDE6pP+ktDpEa5ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oMXitEiR; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oMXitEiR"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54504f29000so539487e87.1
        for <arm-scmi@vger.kernel.org>; Thu, 13 Feb 2025 00:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739434663; x=1740039463; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fEfu8GLWbh9oVDTAIcK1Jbp7CxeZowSLouxzJ5V5kc=;
        b=oMXitEiRuwfq49pY7AKMyNT4gWyJAk1mOiy56ZYJpjaBvJBhZmbGULsaw0AYLz5r3F
         yAkKuELMX9rFljpAJDq5DltS744wcfogSP5ssNgwMMHTiVQqTSXYL0nazcsb9RcARXyD
         8+rIeFz+rhkUalzNfpGWDaG5FIlB6koJSc0R9cyArAi7TMqx+IkDe5lIqVZ8sU+57Iey
         b5gReVR2VgHONCToAgwmhhUigGi7Wfb6xVPEt1fGb/xYXC3tMqTFdPWBLjNdBy3JObgp
         xIYX2V9vu+5D9+IT+Re7VpJnmktqMKVI0fC++MOdo99D8KY6AxCKxGlT5bDn+ngnC56n
         iYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739434663; x=1740039463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7fEfu8GLWbh9oVDTAIcK1Jbp7CxeZowSLouxzJ5V5kc=;
        b=sHR6lFUZgK3sSITG5QKlUtzzQ8GkAQS9wMBuWDJNItgfd9AjC3l3T6tqCMoA38OhlN
         CWQfwyaeZ+vt1pJtxSoWGsqdWcwu0IpzgmpJOxQ7F3OrDTfpZpuOqtCPy8rGGD9/Cq7J
         j30qi41q3vldxaTX4ayrcSKarNa9Cs5aBpZtAcCUEUU6WXAzHZ3IDvYHHa58pqJsctxD
         Zcn5ykL4MXstyePbvfbTOuF2usmwvX/CrA9y0KbCuN4SQgQ15UCF2NbbSrzwmjTpezFN
         hnb8d0cTc0ah/hAVrdeSjsvjITHO+tXKLo5vKThpJzHOoit8+zMmf0GXnhR/AZE7e/Lq
         Hj+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVeNVrA8annMQUXC0P6U4RyhjGl7gHB6YzAwid/YNV0FxKbAzZVdyZ+itV9WhTfWYQEDkNi6HE0UQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwD+ZjyQS9Y2GNbzcn7wv5cAKAlNWIbrbRZkQnhVoO4Z1NRADl
	vwltHWh7j4AlwcE9MwaYl+tehUF/obd/ycM2aGMEDZXCmVycQVzkuEjjwQvWl+NRkTPgtQG/vgR
	AbtOZSmaZoM8TadXtChYNjqvNiyuP6ydaMX5E
X-Gm-Gg: ASbGncsEFAuTUPvFoFg7AN021zn0tQSExDSp+GvchyRf6n2fhxZdkmLNo+7FQ+A9Ix/
	7JSNs9unOWpr7NI8WH/ezmTyVQC2Dtx1LTQhbIrAstlofU8pOkTFilLNCisoU87aST53zmMg=
X-Google-Smtp-Source: AGHT+IF69eZEtmq/bytiQvp5QhXzQAgT59awT8Yvq0oySfRGAni/tuvturEoI284/LivbVgt7JWAcyiW719+mfChwik=
X-Received: by 2002:a05:6512:1324:b0:545:c92:271f with SMTP id
 2adb3069b0e04-5451826ea10mr1946789e87.10.1739434662716; Thu, 13 Feb 2025
 00:17:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-1-3af2fa37dbac@nxp.com> <7a29ec8f-fef8-4f1c-a2eb-16a63f2b820c@stanley.mountain>
 <20250206105218.GA22527@localhost.localdomain> <e20415aa-517c-4e72-a1c3-9c02769c1149@stanley.mountain>
 <Z6SgFGb4Z88v783c@pluto>
In-Reply-To: <Z6SgFGb4Z88v783c@pluto>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 13 Feb 2025 00:17:06 -0800
X-Gm-Features: AWEUYZmIzWqZe4wj2qpsKpM0Mnm6z_-a0UXdGuXwQ-oMTHKT5ieIi6a9LqYyhk0
Message-ID: <CAGETcx8MXpLntMu4=9qECdZJzJLJbWa8ziH8XcW=yJNDAgD=Vw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] firmware: arm_scmi: Bypass setting fwnode for scmi cpufreq
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 3:42=E2=80=AFAM Cristian Marussi
<cristian.marussi@arm.com> wrote:
>
> On Thu, Feb 06, 2025 at 02:31:19PM +0300, Dan Carpenter wrote:
> > On Thu, Feb 06, 2025 at 06:52:20PM +0800, Peng Fan wrote:
> > > On Wed, Feb 05, 2025 at 03:45:00PM +0300, Dan Carpenter wrote:
> > > >On Mon, Jan 20, 2025 at 03:13:29PM +0800, Peng Fan (OSS) wrote:
> > > >> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/ar=
m_scmi/bus.c
> > > >> index 2c853c84b58f530898057e4ab274ba76070de05e..7850eb7710f499888d=
32aebf5d99df63db8bfa26 100644
> > > >> --- a/drivers/firmware/arm_scmi/bus.c
> > > >> +++ b/drivers/firmware/arm_scmi/bus.c
> > > >> @@ -344,6 +344,21 @@ static void __scmi_device_destroy(struct scmi=
_device *scmi_dev)
> > > >>          device_unregister(&scmi_dev->dev);
> > > >>  }
> > > >>
> > > >> +static int
> > > >> +__scmi_device_set_node(struct scmi_device *scmi_dev, struct devic=
e_node *np,
> > > >> +                       int protocol, const char *name)
> > > >> +{
> > > >> +        /* cpufreq device does not need to be supplier from devli=
nk perspective */
> > > >> +        if ((protocol =3D=3D SCMI_PROTOCOL_PERF) && !strcmp(name,=
 "cpufreq")) {
> > > >
> > > >I don't love this...  It seems like an hack.  Could we put a flag
> > > >somewhere instead?  Perhaps in scmi_device?  (I'm just saying that
> > > >because that's what we're passing to this function).
> > >
> > > This means when creating scmi_device, a flag needs to be set which re=
quires
> > > to extend scmi_device_id to include a flag entry or else.
> > >
> > > As below in scmi-cpufreq.c
> > > { SCMI_PROTOCOL_PERF, "cpufreq", SCMI_FWNODE_NO }
> > >
> >
> > Yeah, I like that.
> >
> > -     if ((protocol =3D=3D SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufre=
q")) {
> > +     if (scmi_dev->flags & SCMI_FWNODE_NO) {
> >
> > Or we could do something like "if (scmi_dev->no_fwnode) {"
>
> I proposed a flag a few review ago about this, it shoule come somehow
> from the device_table above like Peng was proposing, so that a driver
> can just declare that does NOT need fw_devlink.

Sorry, looks I replied to v1 series. Can you take a look at that
response please?
https://lore.kernel.org/lkml/CAGETcx87Stfkru9gJrc1sf=3DPtFGLY7=3DjrfFaCzK5Z=
4hq+2TCzg@mail.gmail.com/

If that suggestion I gave there would work, then that's the cleanest
approach. This patch series is just kicking the can down the road (or
down an inch).

-Saravana
