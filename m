Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E34B203708
	for <arm-scmi@vger.kernel.org>; Tue, 29 Oct 2024 09:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730194958; cv=none; b=L2qTXCsTdvAHx5FrqF7qpqyhSa+mruYwnC6J5bRyYMyXSp9dZlha8CCptq62Cpsldo2gGDXGA+vDxIwGdd48zfrXxqVkTdp4gzNpFsXCYrcVNpzKuewvcEkfZf3TvIjBDNttVKXjL4cQQ+KnAyjKVFJWyrh8FGvZnAWvXKvdGrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730194958; c=relaxed/simple;
	bh=yMgvo+HMNVhyYEvI6ZIdLNDOmCd+i8g92yHvgJc9pRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fsjd/ALET0xpMiqtSzDWCXF4kDD5DM2ua0I5Db+f9PGCYl1Yeic2WGFSH5eTZCMirJ30YMdeRf61YkN3nHb0UU1a0Djddr/31+3ovFgl5O+b/APH4f75M+l6fhcRpvgN8V9neL4lWsDbKB5zrS/jbsVOKdsnmJTzKEV8PlHC+T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36FA113D5;
	Tue, 29 Oct 2024 02:43:03 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 694423F528;
	Tue, 29 Oct 2024 02:42:32 -0700 (PDT)
Date: Tue, 29 Oct 2024 09:42:24 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: girish.pathak@arm.com, Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, vincent.guittot@linaro.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Souvik.Chakravarty@arm.com
Subject: Re: Question about identifiers
Message-ID: <ZyCuAKfqRnuFdAwC@pluto>
References: <c5fdc171-0dc7-4c38-88e7-fcf9de7cbec2@stanley.mountain>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5fdc171-0dc7-4c38-88e7-fcf9de7cbec2@stanley.mountain>

On Mon, Oct 28, 2024 at 06:09:50PM +0300, Dan Carpenter wrote:
> Two questions:

[CC: Souvik]

Hi Dan,

> 
> 1) In SCMI pinctrl protocol each pin, group or function has an identifier.
>    uint32 identifier
> 	Identifiers are limited to 16 bits, and the upper 16 bits of this
> 	field are ignored by the platform.
> The linux-kernel assumes that the identifiers are basically, 0 to nr_pins,
> 0 to nr_groups and 0 to nr_funcs.  Is that a fair assumption to make?

It's not an assumption really, any SCMI resource on the system, across
all of the protocols, is identified by a number in the *contiguos* range
(0... TOT_RESOURCE - 1) where TOT_RESOURCE is usually gathered with some
discovery initial command...looking at Pinctrl specifically in 4.11:

"Protocol commands take integer identifiers to describe a pin, group, or function.
The identifiers are sequential and start from 0."

Pinctrl deviates a bit from this since you have 3 different kind of
resources, so you have 3 different TOT_RESOURCES values to query.

...maybe adding "sequential and contiguos" would have been clearer...or
maybe it is just that I am used to SCMI spec parlance/world so I
implictly interepret like this...

IOW, for any protocol, in general, the platform is expected to expose
to the agent a contiguos set of IDs numbered from zero...i.e. without
holes due to reason like 'resource X is not present on platform Y so
we'll leave a hole in the set of IDs returned at discovery time because
is easier than remap the physical resources to the set of IDs exposed to
the agent'

> 
> 2)  In the spec 4.11.2.7 PINCTRL_SETTINGS_GET and 4.11.2.8
> PINCTRL_SETTINGS_CONFIGURE it only allows for pins and groups, not functions.
> Meanwhile gpio functions are functions.  That's just a mistake, right?  I've
> been working under the assumtion that it is.
> 

Mmm, there were a lot of discussions around functions and GPIOs (which I
dont recall now) and a last minute rework to some commands in that
regards, so that now you can use those 2 commands to (optionally) get/set
the selected function for a pin or group specified in the command.
All the other configurations are, indeed, only pertaining to pin and groups:
what do you think is missing around functions ?

Moreover, are you sure that you have the latest v3.2 spec from developer.arm.com ?

Since there were a lot of betaS for v3.2 cycle...with changes especially
around functions/gpios...so many betaS that, till last month, AFAICS, even
the ACS SCMI compliance suite on the tip of master (still not an official
release, though) was broken, since it was really implementing Pinctrl
testcases against an old obsolete v3.2-beta (i.e. testing non-existent/older
pinctrl commands...and I have fixes to upstream for this...once I'll have a
bit of time...)

Thanks,
Cristian
