Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1836B126F0A
	for <arm-scmi@vger.kernel.org>; Tue, 22 Oct 2024 15:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729609295; cv=none; b=CAZfOM1+h8UTYkl7VA397TnGOAxavHrbvAxsFHttmTNfZGmDsqiAIl5WkpQRfnSRW3cgSJTDpSgX5PPvq/3Ni5tKZ9gKwB85F7SMhG6HCgOHJOqI+JFjNF2yLb4wx6IRBwrK80prGLwiFuaF2vr6ff4bglbk3Jm5CdzOFiRhJX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729609295; c=relaxed/simple;
	bh=xqQc8vby/njovYmHJ2kXk0lu6yDdDq0sbbr0Z8mPh4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQHyj4tRyJ/wGbP0H4LufOxL1qFK6IT9RL+Fxi99OvFjglVRZLpGv9NEzyfM6xV4wsf+0spU+YY3CZd6eQTWAfpiq4ANZUSTFD52ZSdwqdEe+BpRb5BtUhH5BPYUzdwqIEmBSCt+T6n1BBPCSvMfrFENBJjSFeGl1jXqoWLbpLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEA88497;
	Tue, 22 Oct 2024 08:02:01 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B5EA03F73B;
	Tue, 22 Oct 2024 08:01:30 -0700 (PDT)
Date: Tue, 22 Oct 2024 16:01:28 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Jean Delvare <jdelvare@suse.de>, arm-scmi@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: Odd dependency on ARM_SCMI_PROTOCOL
Message-ID: <Zxe-SBfVUEiYBkes@bogus>
References: <20241022135537.4a93c5cc@endymion.delvare>
 <ZxeY9VhAOLp8qSkF@pluto>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxeY9VhAOLp8qSkF@pluto>

On Tue, Oct 22, 2024 at 01:22:13PM +0100, Cristian Marussi wrote:
> On Tue, Oct 22, 2024 at 01:55:37PM +0200, Jean Delvare wrote:
> > Hi all,
> >
>
> Hi,
>
> this pre-dates me, so take this with a grain of salt, and Sudeep may
> have a better explanation...

Indeed, I had to dig a bit and found a patch from 2016.

> > I noticed that the following dependency construct is used several times
> > throughout the kernel tree:
> >
> > depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
> >
> > Maybe I'm just missing something as I'm not familiar with SCMI, but I
> > can't really make sense of this. Considering that ARM_SCMI_PROTOCOL
> > does not depend on OF, I do not understand why it would be OK to build
> > these drivers under ARM_SCMI_PROTOCOL without OF, but if test-building
> > under COMPILE_TEST instead, then OF would suddenly be needed. Can
> > anyone explain the logic?
> >
> > Considering that ARM_SCMI_PROTOCOL can be enabled through COMPILE_TEST,
> > and OF is now available on architectures, I think this dependency is
> > needlessly complex and these drivers could simply use:
>
> ... my guess is that ARM_SCMI_PROTOCOL does NOT explicitly depends on OF
> simply because it depends on ARM|ARM64 which have an implicit OF dependency...
> ....indeed in order to use the SCMI stack you need OF...
>
> ...not saying that this is right....just trying to interpret here...
> ...on the other side for these reasons, if you dont have OF implicitly from
> the arch, you cannot COMPILE_TEST the SCMI stack without OF, so the
> complex dependency
>
> Probably this should be done better in Kconfig...but lets see if Sudeep
> can correct me...
>

Commit e517dfe67480 ("firmware: scpi: add CONFIG_OF dependency") is the
one that I copied to SCMI as well as we wanted  COMPILE_TEST coverage on
SCMI as well. As per the commit, !OF will give some warnings for COMPILE_TEST
which the above commit addresses. It is just copy of that you see in SCMI
as SCMI replaced the old SCPI and is used more widely and had more framework
support, hence you will find it at more places than SCPI.

Hope that explains, happy to take a deeper look if you have or find issues
with the way it exists today.

--
Regards,
Sudeep
