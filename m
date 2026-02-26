Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 155602773EE;
	Thu, 26 Feb 2026 12:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772108493; cv=none; b=tkUhhvSSSL4AvvQRD5VU3+BDNQsk5RH3o8ggP/PlvTFe7P91EDwl4AED9yH47T3aOcpEk6nUd8fWUhWtOUVHlmOf/PeuT5XttijH2T5vB15G0o1HdE6g/BMKXU7ml2gOrPzL5WwBy1w7gM1LK18bHAq98eU0N0ckPiUuqwU1YMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772108493; c=relaxed/simple;
	bh=zWBiL8OKoISdR7c5uEAEZVM8Nnlz5wcO9Y6r91vBjtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Htk51z5sCLij+eKG1gCBLfNx3p34u5SS/zQD2UMk3hOcn9snx6UmDMnTzFSxGnn2B6SocTHkRdNdEWu7V4hzQBDRrq88IEsFCWHJFLcYmLvS05XSsBuBfGpK99IEpYsjZLGPAiGWlQCcpOIHazBq0reRZY/wEANA7I0bZhwmVig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 393C21516;
	Thu, 26 Feb 2026 04:21:25 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CD303F73B;
	Thu, 26 Feb 2026 04:21:29 -0800 (PST)
Date: Thu, 26 Feb 2026 12:21:11 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Gui-Dong Han <hanguidong02@gmail.com>, gregkh@linuxfoundation.org,
	rafael@kernel.org, linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com, Qiu-ji Chen <chenqiuji666@gmail.com>,
	sudeep.holla@kernel.org, arm-scmi@vger.kernel.org
Subject: Re: [PATCH v5] driver core: enforce device_lock for
 driver_match_device()
Message-ID: <aaA6t-J2gRy3dE1_@pluto>
References: <20260113162843.12712-1-hanguidong02@gmail.com>
 <aZ9ZN7H1thCmkPEQ@pluto>
 <DGOBYS4LNHWW.2JTHJHGQA37C@kernel.org>
 <5a291dbe-de59-4603-a712-40d4edc19aa3@foss.st.com>
 <DGOUMO3FAOO8.VAD47Q3CKIPL@kernel.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGOUMO3FAOO8.VAD47Q3CKIPL@kernel.org>

On Thu, Feb 26, 2026 at 12:15:33PM +0100, Danilo Krummrich wrote:
> On Thu Feb 26, 2026 at 9:54 AM CET, Gatien CHEVALLIER wrote:

Hi,

I think my mail thread is a bit messed up...my previous reply is nowhere
to be found, so I will repeat here...

> > It may not be that trivial because unconditionally moving it to
> > module_init() would not guarantee that the TEE bus driver probes
> > before the platform device driver. I think there's a bit more to it.

@Gatien

Yes, it is just what I was going to reply...these SCMI transport drivers
basically have to probe first against their related subsystem like
OPTEE/Virtio and then, only when fully probed at this level, are fully
functional and can become a transport supplier for the SCMI core...
...registering the platform driver at the end of the OPTEE/VIRTIO probe
allowed to avoid any kind of EPROBE_DEFER handling that can come up
espcially when all of this is split into loadable modules..

...I have to review this in deep but I think I had a first version of these
transport rework that worked a bit differently...

> >
> > The platform device driver, as is, is not functional whilst the
> > TEE services are not available. Therefore, it could falsely fail to
> > probe if probed before. We may consider some sort of API to know if
> > the services are available?
> 
> Ok, so there are three drivers somehow involved:
> 
>   (1) module_tee_client_driver(scmi_optee_service_driver)
> 
>   (2) scmi_optee_driver with compatible = "linaro,scmi-optee"
> 
>   (3) scmi_driver with name = "arm-scmi"
> 
> (1) registeres (2) in probe(), and the only thing (2) does is allocating a
> platform_device with name = "arm-scmi", such that (3) is probed.
> 
> So, to me it seems that the indirection through a fake platform device is
> unnecessary and instead (3) should just have compatible = "linaro,scmi-optee"

@Danilo

That was the initial state, all the transports and related compatibles embedded
into the SCMI core stack...then we split out the transport as loadable standalone
drivers, since it seemed to be cleaner (and some vendor also asked for by that
time...).

	https://lore.kernel.org/arm-scmi/20240812173340.3912830-1-cristian.marussi@arm.com/

> and return -EPROBE_DEFER if (1) is not ready. Besides that, this seems like a
> use-case for device links.

We tried to unify the handling because other transports (mailbox/smc) do
NOT rely on 3rd party subsystem to be initialized and this approach
indeed simplified all because you dont need any DEFER simply because
the SCMI core probing will be kicked off ONLY after at least a transport
is successfully probed and initialized...there is a devlink indeed later
that classifies the used transport as a supplier of the core SCMI
arm-scmi driver...

I have to recall the full details especially of the reqs that led to
this design bit I suppose we should at this point reintroduce a bit of
EDEFER...

Thanks,
Cristian

