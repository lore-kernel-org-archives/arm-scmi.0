Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 224FD1DD9D1
	for <arm-scmi@vger.kernel.org>; Mon,  3 Feb 2025 09:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738575219; cv=none; b=T9SR4ls28fYnFvFo6CnBKPUqw/foq0YkhcITb/liADb7wbdvjSqGVVe6ws7U3DnNvRc90rJYMZUZ/TStF3QzIYqXWt5JBoGkq6nOD5Tkzc3d80G6I7FhYhyH4StelR4wOpbEt3rXteG5nslEOAh8S6bXje6PU76zTLN/QjWMzZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738575219; c=relaxed/simple;
	bh=wEVZdtH+HLVmhaYdvgkComPFGInTUcq3OspXUcG2WLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WXmR6Uql/c/StrgtfSlodXISIqAGm4JR1ORM+TG/Lk5ozispCi/AM4KH6XXT5PyjfuU3wGgEbO9UbsLyrEa9+IO8YpvJmFrZF6eMl9iLROHKTT47fbE1Spkk9qj59EPM8srbrDf8hxL3dl2l3LK5m6K1c5J861r1E3K8CwsZdqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8DF591063;
	Mon,  3 Feb 2025 01:34:00 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB2153F5A1;
	Mon,  3 Feb 2025 01:33:34 -0800 (PST)
Date: Mon, 3 Feb 2025 09:33:23 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	Xinqi Zhang <quic_xinqzhan@quicinc.com>,
	Peng Fan <peng.fan@nxp.com>, Guomin Chen <guomin_chen@sina.com>
Subject: Re: [PATCH 3/3] firmware: arm_scmi: Emit modalias for SCMI devices
Message-ID: <Z6CNWOp8B_ghIrJt@pluto>
References: <20250131141822.514342-1-sudeep.holla@arm.com>
 <20250131141822.514342-3-sudeep.holla@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131141822.514342-3-sudeep.holla@arm.com>

On Fri, Jan 31, 2025 at 02:18:22PM +0000, Sudeep Holla wrote:
> In order to enable libkmod lookups for SCMI device objects to their
> corresponding module, add 'modalias' to the base attribute of SCMI
> devices.
> 

Hi Sudeep,

Indeed, as of today if you build the SCMI stack completely as modules, only the
core stack (scmi-core/scmi-module) and the needed SCMI transports are loaded
automatically, so this patch, I understand, is meant to add the missing bits
to enable autoloading also for the SCMI drivers that sits on top like
scmi-cpufreq etc..

In fact, I tried experimenting with something similar to your solution
recently to enable MODALIAS emission and full stack autoloading, BUT then
I realized it could have worked ONLY with an additional hack...

...the problem lays in the fact that since we wanted to allow Vendor
drivers and protocols to be easily added without changing the core (as
asked by vendors themslves AFAICR), we dont have a central static
devices-table hold by the SCMI bus core (as usual) but instead we let
SCMI drivers dynamically request protocol/devices that are needed...

...and this in turn means that the devices are created only when a driver
requires a specifc protocol/name pair (and a matching DT entry is found)
during its initalization at load time...so it's a chicken-egg problem
since the MODALIAS that will cause, say, scmi-cpufreq to be loaded will
be emitted only when the device for scmi-cpufeq will be created BUT that
currently happens only if the device was requested during the init/loading
of scmi-cpufreq itself...

...the dynamic request-device mechanism added to give vendors flexibility
does break the usual module autoloading capabilities AFAIU...

...indeed I tested this series with a full modularized SCMI stack and it
does NOT cause the full stack to be loaded...

Having said that, since this dynamic-request device mechanism was meant
to ease vendors additions, my hack was simply to pre-request all the
standard protocol devices at bus init...in that way the full stack does
finally autoload...I will post that 2 patches of mine as and RFC in
response to this for the sake of clarity...

Note that such a hack, or a better polished version of it, would NOT work
anyway for Vendor modules: if we want to keep such flexibility they still
have to be loaded manually...

Alternatively we could get rid of dynamic device creation as a whole and
revert to a more standard static central devicetable for all...not sure
really if the flexibility of device creation at runtime without keeping
a common central table is really needed/appreciated by the Vendors that
asked for it in first place :D

Thanks,
Cristian
