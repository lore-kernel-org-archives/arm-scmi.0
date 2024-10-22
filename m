Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967FC146D78
	for <arm-scmi@vger.kernel.org>; Tue, 22 Oct 2024 12:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729599742; cv=none; b=lI4sGG4lUAzvu68gL68zUBz4P3Rl/TRmuJY8W1Lt8a94xaQNop19fUcY8tt8uR5aEWoWNsgeS5d287B1kj+RsUB/wyQcHg5DoqVniTgeZ925ohXdUNFzUkGrNKYCqGkr44fNPk6pB71DwXGuN3ladiEp+sJnT3aGOI2bOnssWoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729599742; c=relaxed/simple;
	bh=NH/4FNTVj2wWIUh/OVp7W+kVozPI8l4LY6XEBNkBkmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q7f28NkBv/tgGxGhwksks52wcjfwClbpEHjLnpmJWJm36ojB2UqgdvZq70bRna/d5ahzJBBY1+vduw4X3liEX+4Wu9H0+VbgCZgOM45zrIODR0ykLTFtyYgbh7S0rknRcXOTSH1Stxdrb1noZ6Fx4iG7nfch5PX1vpxm676NV/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7EE18497;
	Tue, 22 Oct 2024 05:22:47 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 850F43F71E;
	Tue, 22 Oct 2024 05:22:16 -0700 (PDT)
Date: Tue, 22 Oct 2024 13:22:13 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Jean Delvare <jdelvare@suse.de>
Cc: arm-scmi@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: Odd dependency on ARM_SCMI_PROTOCOL
Message-ID: <ZxeY9VhAOLp8qSkF@pluto>
References: <20241022135537.4a93c5cc@endymion.delvare>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022135537.4a93c5cc@endymion.delvare>

On Tue, Oct 22, 2024 at 01:55:37PM +0200, Jean Delvare wrote:
> Hi all,
> 

Hi,

this pre-dates me, so take this with a grain of salt, and Sudeep may
have a better explanation...

> I noticed that the following dependency construct is used several times
> throughout the kernel tree:
> 
> depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
> 
> Maybe I'm just missing something as I'm not familiar with SCMI, but I
> can't really make sense of this. Considering that ARM_SCMI_PROTOCOL
> does not depend on OF, I do not understand why it would be OK to build
> these drivers under ARM_SCMI_PROTOCOL without OF, but if test-building
> under COMPILE_TEST instead, then OF would suddenly be needed. Can
> anyone explain the logic?
> 
> Considering that ARM_SCMI_PROTOCOL can be enabled through COMPILE_TEST,
> and OF is now available on architectures, I think this dependency is
> needlessly complex and these drivers could simply use:

... my guess is that ARM_SCMI_PROTOCOL does NOT explicitly depends on OF
simply because it depends on ARM|ARM64 which have an implicit OF dependency...
....indeed in order to use the SCMI stack you need OF...

...not saying that this is right....just trying to interpret here...
...on the other side for these reasons, if you dont have OF implicitly from
the arch, you cannot COMPILE_TEST the SCMI stack without OF, so the
complex dependency

Probably this should be done better in Kconfig...but lets see if Sudeep
can correct me...

Thanks,
Cristian
