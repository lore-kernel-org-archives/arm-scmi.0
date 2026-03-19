Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C9C8352927;
	Thu, 19 Mar 2026 11:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773920789; cv=none; b=GmLmQ373/HogqGQmwSsdRST9viScg2PPubcuUKC+ecHqrEZpKd2iIT5Bx3HpZ7NbUilQjP+mNV4IBbVYenz42i6uZ7RzzupZ/AT4VIrrco6CSpgGe97Frt6EX0spYCDHkHqHmkln9hV+5MtFS4yZRIuvrwJzJYXQXxc1YZjAfIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773920789; c=relaxed/simple;
	bh=kypcxapqqt6pZ1oGDFy+vRhLLajcqCe1bUvLmHdRNtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PEfL4uJ5eidqClqfNlKfvQBrNVyVnHDvp4oeS1Ut1phQ+a6ny17nr82rmL2jGdrs4/+UcGDao2PX7Ux8oATGWQjDbXBUTOHQ5P+Z6btTSgPjhdQFJJJw1pFWuzZocs2cNl/kGS52LdU8K9hTc4wt2/zj8nRPP/lvYFahPRIKpFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C61F1A25;
	Thu, 19 Mar 2026 04:46:20 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A6313F778;
	Thu, 19 Mar 2026 04:46:24 -0700 (PDT)
Date: Thu, 19 Mar 2026 11:46:18 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@kernel.org, philip.radford@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, gatien.chevallier@foss.st.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: Re: [RFC PATCH 0/4] Rework SCMI transport drivers probing sequence
Message-ID: <abviCkBeX9uzsgxy@pluto>
References: <20260317165811.3352752-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317165811.3352752-1-cristian.marussi@arm.com>

On Tue, Mar 17, 2026 at 04:58:07PM +0000, Cristian Marussi wrote:
> Hi,
> 

Hi,

a clarification replying to myself down-below... O_o

> when the SCMI transports were split out into standalone drivers [1] the
> probe sequence was laid out in such a way that:
> 
>  - the transport drivers would have probed first, triggered by the firmware
>    driven discovery process (DT/ACPI)
> 
>  - afterwards the control would have been passed to the core SCMI stack
>    driver via the creation of a dedicated device that would have inherited
>    the original firmware descriptor (since that same DT/ACPI node would
>    have still needed by the SCMI core driver to be parsed)
> 
> The tricky part came around with some transport driver like virtio and
> optee since they are, in turn, upfront dependent on an external distinct
> kernel subsystem; IOW these have first to undergo their own subsystem
> specific probe/initialization to become fully operational as transports:
> this kind of initialization sequencing of course must deal with the
> possibility of probe deferrals BUT at that time we avoid this by using the
> trick in virtio/optee transports to register the next stage transport
> drivers ONLY at the end of the subsystem specific probe routine, from
> within the probe itself.
> 
> This behaviour has 2 issues:
> 
>  - it is frowned upon and can lead to hangs in the driver core whenever
>    some core locking is changed as exposed in [2]
>  - it limits these transport drivers to a single instance probing since of
>    course you cannot register the same driver more than once
> 
> All of this was tolerable because optee/virtio are generally only employed
> in a single SCMI instance scenario AND because no hang where triggered in
> the core driver subsystem... (not saying that was perfectly fine :P)
> 
> This RFC series aims to solve both of the above issue by:
> 
>  - moving the problematic platform driver registation away from the probe
>    into its own module_init/exit
> 
>  - introducing an optional mechanism for the transport drivers to provide
>    to the SCMI core some sort of transport specific handle so that multiple
>    instances can be supported and multiple probed transports instances can
>    be registered and identified by the core. (who is who)
>    Note that at the same time this optional handle-mechanism is used to
>    synchronize the drivers probing sequences and possibly trigger, when
>    needed, the probe deferrals, if the transport driver has still to
>    undergo its own subsystem initialization and as such is still NOT fully
>    operational.

Implementation issues aside, one thing that I failed to make clear about
this series is that, while this series addresses the platform registration
@probe-time issue above and enables the capability to technically support
multiple SCMI instances also for optee/virtio transports (like it is
already for mailbox and smc), the multi instance support for optee/virtio,
as of now, still suffers from some 'structural' limitations that make it
unfit for production and useful ONLY on a testing scenario (...like in my
virtio based setup :D)

The crux of the matter lays in the fact that there is still not a way
in such transports to be able to match a specific probed transport instance
(device) with the corresponding SCMI DT top node instance descriptor that
usually, in a multi instance scenario, describes a different set of
protocols, or the same set of protocols enumerating a different set of
resources...so, e.g., if you want to match and reference by phandle a
specific clock domain from a specific instance you cannot really be sure
that the instance reference that you have is the instance that you wanted
since depends on how that was associated during the probe.
(in mailbox and smc you have an explicit channel/shmem association ...)

Still a lot to reason about this as of now...any suggestion about this
is even more very much welcome :P

Thanks,
Cristian
