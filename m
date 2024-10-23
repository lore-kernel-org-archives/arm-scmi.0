Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3369A15CD52
	for <arm-scmi@vger.kernel.org>; Wed, 23 Oct 2024 09:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729677058; cv=none; b=NhhMnzGz9lpy52tnJvEbKstzXvhnDwbaHsukl9CkVXeTx/XZPRFdFiqqy85IIHeQM+DWln2gcKseIEoPaeLCZS/5wNQ/mbH8xNVc6cserrkUgv+1bsv+9fX30GTpPVUWVeLxJEChRNdxdFKEFk1SEK1a9NE+9LVH5smea8gN0Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729677058; c=relaxed/simple;
	bh=nlKBacKHPOlDwLOyMp8xbwLYiwczYhXmEFbpebh+yW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nkGXRiWzq8ZU9G2ndkoCYC88Y2PntabCo1EFevT5uKhLeInfcPMUFJm+UrqqKwnWaLceUUsVg2NJKYIS4Vzh6ao6O5EZfpYUUO7M32+ZPD0VYqnXhLWpGXMYbAST8GP/7EC/7K24EzH0FuZFpjZTHK1kmZXPnk2UYfMUbxpdwKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CFCC339;
	Wed, 23 Oct 2024 02:51:25 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 881063F71E;
	Wed, 23 Oct 2024 02:50:54 -0700 (PDT)
Date: Wed, 23 Oct 2024 10:50:52 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Jean Delvare <jdelvare@suse.de>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: Odd dependency on ARM_SCMI_PROTOCOL
Message-ID: <ZxjG_PIyQ0cIH58h@bogus>
References: <20241022135537.4a93c5cc@endymion.delvare>
 <ZxeY9VhAOLp8qSkF@pluto>
 <Zxe-SBfVUEiYBkes@bogus>
 <20241022181349.19be62b9@endymion.delvare>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022181349.19be62b9@endymion.delvare>

On Tue, Oct 22, 2024 at 06:13:49PM +0200, Jean Delvare wrote:
> Hi Sudeep and Christian,
> 
> On Tue, 22 Oct 2024 16:01:28 +0100, Sudeep Holla wrote:
> > On Tue, Oct 22, 2024 at 01:22:13PM +0100, Cristian Marussi wrote:
> > > On Tue, Oct 22, 2024 at 01:55:37PM +0200, Jean Delvare wrote:  
> > > > Hi all,
> > >
> > > this pre-dates me, so take this with a grain of salt, and Sudeep may
> > > have a better explanation...  
> > 
> > Indeed, I had to dig a bit and found a patch from 2016.
> > 
> > > > I noticed that the following dependency construct is used several times
> > > > throughout the kernel tree:
> > > >
> > > > depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
> > > >
> > > > Maybe I'm just missing something as I'm not familiar with SCMI, but I
> > > > can't really make sense of this. Considering that ARM_SCMI_PROTOCOL
> > > > does not depend on OF, I do not understand why it would be OK to build
> > > > these drivers under ARM_SCMI_PROTOCOL without OF, but if test-building
> > > > under COMPILE_TEST instead, then OF would suddenly be needed. Can
> > > > anyone explain the logic?
> > > >
> > > > Considering that ARM_SCMI_PROTOCOL can be enabled through COMPILE_TEST,
> > > > and OF is now available on architectures, I think this dependency is
> > > > needlessly complex and these drivers could simply use:  
> > >
> > > ... my guess is that ARM_SCMI_PROTOCOL does NOT explicitly depends on OF
> > > simply because it depends on ARM|ARM64 which have an implicit OF dependency...
> > > ....indeed in order to use the SCMI stack you need OF...
> > >
> > > ...not saying that this is right....just trying to interpret here...
> > > ...on the other side for these reasons, if you dont have OF implicitly from
> > > the arch, you cannot COMPILE_TEST the SCMI stack without OF, so the
> > > complex dependency
> > >
> > > Probably this should be done better in Kconfig...but lets see if Sudeep
> > > can correct me...
> > 
> > Commit e517dfe67480 ("firmware: scpi: add CONFIG_OF dependency") is the
> > one that I copied to SCMI as well as we wanted  COMPILE_TEST coverage on
> > SCMI as well. As per the commit, !OF will give some warnings for COMPILE_TEST
> > which the above commit addresses. It is just copy of that you see in SCMI
> > as SCMI replaced the old SCPI and is used more widely and had more framework
> > support, hence you will find it at more places than SCPI.
> > 
> > Hope that explains, happy to take a deeper look if you have or find issues
> > with the way it exists today.
> 
> Thanks for the explanations. It makes sense now. That being said, I
> believe that the same dependencies would be better expressed as:
> 
> depends on OF
> depends on ARM_SCMI_PROTOCOL || COMPILE_TEST
> 
> because 1* the code technically needs OF to build,

Not true, just force enabled SCMI on x86 without COMPILE_TEST and COMPILE_OF
and it builds just fine. But yes, I removed dependency to enabled it on x86

> and 2* these drivers are only useful on kernels which have ARM_SCMI_PROTOCOL,
> unless build-testing. The result would be the same as what we have now, but
> the intentions would be clearer and the correctness more obvious IMHO.
>

I am just trying to understand why it is done so, but can't think of any
reason that contradicts you statement above. The code itself can cope up
with CONFIG_OF not enabled, so unless I can trigger the warning that Arnd
faced when he pushed the initial patch on SCPI, I don't have much useful to
add. You can post a patch cc-ing him and take up the discussion may be. I
don't have a strong opinion either way.

-- 
Regards,
Sudeep
