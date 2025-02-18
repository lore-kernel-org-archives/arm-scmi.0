Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2861926BD91
	for <arm-scmi@vger.kernel.org>; Tue, 18 Feb 2025 15:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739892383; cv=none; b=txw7jB9wrFuFf2fKVDeR0hPXcLXbGfruL11SmBpdemrd6xUQFEP+BaK5F1qeCG0jBqBtfDdXFe2zkduYjkXTeiR8LLAaR9dbDOY4pHYiSbZfA99+GagO14yJQW1QzWKVcs+Alq1aX7SfRXo/7oI78+7zQPCANypowyaNzwb8KOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739892383; c=relaxed/simple;
	bh=GyUOXUzNqE9s0CJlF8LGyDRSkEk8hMkwUEN0M3CL3oM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nRI8ZuBEGwJoEeanv7krSTA5a+pSKbnVadsj7OWlxUZcthlwPYWNEdMeFQ65B3la4XBlyxqHZ32iXPsYdijMQEhqtlUvh7ElszVrPksfPpQ7yAba9m7tDQTw5u0gw1u18pmZmIas2Gmag59Qbu8vcSxSZHLqOq4bcg6w7yXAD+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E08E13D5;
	Tue, 18 Feb 2025 07:26:39 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C7E93F6A8;
	Tue, 18 Feb 2025 07:26:18 -0800 (PST)
Date: Tue, 18 Feb 2025 15:26:15 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Peng Fan <peng.fan@oss.nxp.com>, Peng Fan <peng.fan@nxp.com>,
	"cristian.marussi@arm.com" <cristian.marussi@arm.com>,
	"souvik.chakravarty@arm.com" <souvik.chakravarty@arm.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	Chuck Cannon <chuck.cannon@nxp.com>
Subject: Re: POWER_DOMAIN_ATTRIBUTES in SCMI
Message-ID: <Z7Sml8yXXaqnhdmw@bogus>
References: <PAXPR04MB8459E8D1A82DE43C08B6C26788FE2@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z7Rjyy7_Jg66vqCf@bogus>
 <20250218130823.GA17099@nxa18884-linux>
 <CAKfTPtBd14wM2st62m3tnkQOZgBTUmxpjZXghMVff-Yg7wCVDg@mail.gmail.com>
 <CAPDyKFq9QHw==2WqcThC5mjMy8ALqmZ_hKxt2QsZJ1q-qixLfA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPDyKFq9QHw==2WqcThC5mjMy8ALqmZ_hKxt2QsZJ1q-qixLfA@mail.gmail.com>

On Tue, Feb 18, 2025 at 04:02:58PM +0100, Ulf Hansson wrote:
> On Tue, 18 Feb 2025 at 14:57, Vincent Guittot
> <vincent.guittot@linaro.org> wrote:
> >
> > On Tue, 18 Feb 2025 at 13:03, Peng Fan <peng.fan@oss.nxp.com> wrote:
> > >
> > > On Tue, Feb 18, 2025 at 10:41:15AM +0000, Sudeep Holla wrote:
> > > >On Fri, Feb 14, 2025 at 09:20:27AM +0000, Peng Fan wrote:
> > > >> All,
> > > >>
> > > >> Previously I posted a patch to linux to set all power domains
> > > >> with "GENPD_FLAG_ACTIVE_WAKEUP" set in
> > > >> drivers/pmdomain/arm/scmi_pm_domain.c
> > > >
> > > >Yes, I remember ACK-ing that and now I am thinking why 😄.
> > > >The description of the flag GENPD_FLAG_ACTIVE_WAKEUP says:
> > > >"Instructs genpd to keep the PM domain powered on, in case any of its
> > > >attached devices is used in the wakeup path to serve system wakeups."
> > > >
> > > >Does that mean all the SCMI power domains remain powered on with this
> > > >flag ? If so, that sounds wrong to me. I hope it is not the case and it
> > > >is effective only if the device attached is wakeup source.
> > >
> > > Only when the device is setup wakeup source, the genpd framework
> > > will take this flag as keeping power domain on.
> > >
> > > Without this flag, even if the device setup as wakeup source, the
> > > device's power domain will still be powered off.
> > >
> > > >
> > > >> But in the end we find that some power domains
> > > >> could be in off state while it still could wakeup
> > > >> the system. And we have a downstream patch
> > > >> +               if (!strcmp(scmi_pd->name, "hsio_top"))
> > > >> +                       scmi_pd->genpd.flags = 0;
> > > >>
> > > >
> > > >There you go, so you simply rushed some solution upstream to carry less
> > > >patches downstream but this time you got bitten again. Sorry, but I am
> > > >seeing a pattern from you here and I don't really like that.
> > >
> > > I not wanna to argue here.
> > > I DO care reputation. If I do something wrong, I will improve.
> > >
> > > >
> > > >> So I am wondering to extend the attributes of SCMI spec,
> > > >> Saying In SCMI spec(DEN0056E)
> > > >> 4.3.2.5 POWER_DOMAIN_ATTRIBUTES
> > > >> Page 44 of 210:
> > > >>
> > > >> Bit[26]: If set to 1, the power domain could
> > > >> wakeup the system with power state
> > > >> set as off.
> > > >>
> > > >
> > > >This is not what the above flag is all about. It just instructs genpd
> > > >to keep the power domain ON as the device attached to it could be a wakeup
> > > >source. They are not one and the same. If the device is marked wakeup in
> > > >the DT and it is both wakeup capable and is enabled, it shouldn't request
> > > >the power domain to be powered off when suspending. Why is that not
> > > >sufficient here ? What am I missing ? I am interested in knowing it as
> > > >it is important to fix the issue you are trying to address here.
> > >
> > > The flag must be set if the power domain needs to keep power on to have
> > > the wakeup capability.
> > >
> > > But in some case, a power domain no need to keep power on and it still
> > > have wakeup capability from hardware perspective.
> > >
> > > For example usb phy in i.MX95, its power domain is off, but it could still
> > > wakeup the SoC. But with the GENPD_FLAG_ACTIVE_WAKEUP set, the power domain
> > > will not be powered off, so more power consumption in suspended state.
> >
> > This probably means that the wakeup mechanism is not in the same power
> > domain but in another one that is kept on while the device is
> > suspended and the main power domain is off. Do you have more details
> > about this wakeup source that works with powerdomain being off ?
> > I vaguely remember some old discussions about inband/outband wakeup
> > source settings for devices which enable drivers to specify if the
> > wakeup source is in or out of the power domain and if we should keep
> > it on or not. But I can't remember the details; Ulf should have more
> > details

Thanks Vincent for starting this discussion, much appreciated!

>
> Vincent, you have a great memory! :-)
>
> Indeed I tried to post a series (I can dig it up, if you want?) that
> allowed the driver to instruct upper layers, such as buses and PM
> domains whether the wakeup is managed in-band or out-band.
>

Right, this distinction must be clarified in i.MX case as I don't follow
their use case yet. Peng ?

> An example could be an SDIO irq, being re-routed from a regular DATA
> line that is managed by the SDIO/MMC controller to a GPIO pin during
> system suspend. Another similar use-case with a potential similar
> wake-up configuration, is waking up from a UART console.
>
> My point is, the SDIO/MMC controller could be configured as a wakeup
> source, while it's actually the GPIO pin that is managing the wakeup.
> In this case, typically the GPIO irq can be managed from an always-on
> logic/PMIC, which means there is no reason to keep the PM domain
> powered-on for the SDIO/MMC controller during system suspend.
>

Good explanation and example. Thanks again.

> At the moment we don't have any way to express this kind of
> configuration, I think.
>

Understood.

> >
> > >
> > > So I am requesting extending spec to give agents the information whether
> > > the power domain could wakeup HW system in powered off state.
> >
> > I tend to agree with Sudeep that it doesn't make sense to say that a
> > power domain can be off but the powered devices can still wakeup the
> > system. It usually means that the wakeup is not powered by the main
> > power domain
>
> I tend to agree. In general, I think we should always use
> GENPD_FLAG_ACTIVE_WAKEUP, but we are lacking a way to inform genpd
> (and other upper layers) that the wakeup-irq is managed out-band,
> which means genpd can still be powered-off.

Thanks Ulf, that's reassuring that SCMI is misusing or using incorrectly
some core genpd feature.

--
Regards,
Sudeep
