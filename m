Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D606723C39A;
	Tue, 24 Mar 2026 08:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774340351; cv=none; b=qId8MKddBlMdHc0OPuXLA8UtCnMAo53himzEzFN2mqQWOFv0khsMUYUPGK2O6oQUQf1QSOf5x879rW2ydHxojVfVjBm9a3HDbQiroSzeyKdUcZcSJ6+4bCMN1K3SpbHeBtYotOhb1EzC2aPLXf+nwna3PzsXm06jp0l/OHVZ5es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774340351; c=relaxed/simple;
	bh=e/Dq7NYDFQdGG8flGJOMFKnKb0IgmvX/864Uyge0xi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVMKrYUS3tyNaJyS+8IDdPdXoHmV0GZ7nLG/WCaftpvJAg86ebg9A3w3IEgCCZOy1NrKLellxHfzNkyhhz9RhPIl77eHY4EYGB72uEERXOwFeZ62FR+hT1/EYTGcyiKZxlZR9cI42hvhGRveu/SQSrRyiGlSJFAfoz5CyNKeOD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C40281476;
	Tue, 24 Mar 2026 01:18:58 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 83CE03F63F;
	Tue, 24 Mar 2026 01:19:01 -0700 (PDT)
Date: Tue, 24 Mar 2026 08:18:54 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Jacky Bai <ping.bai@nxp.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: clock: Relax check in
 scmi_clock_protocol_init
Message-ID: <acJI7o79lVNMjV_d@pluto>
References: <20260324-scmi-clock-fix-v1-v1-1-65c21935824b@nxp.com>
 <20260324-lean-bobcat-of-reputation-6628b5@sudeepholla>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324-lean-bobcat-of-reputation-6628b5@sudeepholla>

On Tue, Mar 24, 2026 at 07:49:22AM +0000, Sudeep Holla wrote:
> On Tue, Mar 24, 2026 at 02:24:14PM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> > 

Hi,

> > On i.MX95, the SCMI Clock protocol defines several reserved clock IDs that
> > are not backed by real clock devices
> > (see arch/arm64/boot/dts/freescale/imx95-clock.h).
> > 
> > For these reserved IDs, the SCMI firmware correctly returns NOT_FOUND in
> > response to the CLOCK_ATTRIBUTES command. According to the SCMI Clock
> > specification, NOT_FOUND is expected when a clock_id does not correspond to
> > a valid clock device.
> > 
> > The recent hardening added in scmi_clock_protocol_init() treats any error
> > return as fatal, causing SCMI clock probe to fail and preventing i.MX9
> > platforms from booting.
> > 
> > Relax the check so that -ENOENT is treated as a non-fatal condition.
> > 
> 
> I understand the use-case and the fix here, but still wonder if this
> should be treated as quirk or handle it in the core. I am inclined to
> latter as reserved SCMI clock/resource ID seems to be trend in its usage
> and hard to classify as quirks.
> 
> Cristain, agree or have a different view ?
> 

I was just replying...

Looking at the spec 3.6.2.5 CLOCK_ATTRIBUTES

"This command returns the attributes that are associated with a specific clock. An agent might be allowed access to only
a subset of the clocks available in the system. The platform must thus guarantee that clocks that an agent cannot access
are not visible to it."

...not sure if this sheds some light or it is ambiguos anyway...I'd say that
NOT_FOUND does NOT equate to be invisible...

...BUT at the same time I think that this practice of exposing a non-contiguos
set of resources IDs (a set with holes in it) is the a well-known spec-loophole
used by many vendors to deploy one single FW image across all of their platforms
without having to reconfigure their reosurces IDs ro expose a common set of
contiguos IDs like the spec would suggest...

Having said that, since we unfortunately left this door open in the
implementation, now this loophole has become common practice
apparently...

...I am more concerned about the impact that this COULD have on underlying
resources allocations that at the driver level was certainly conceived
to manage a contiguos set of IDs, even though it was certanly the
usecase until my harden patches...so it could be safe but to be double
checked...

Quirk or core I suppose it depends on how much we want to 'legalize' this
trick for the future (thinking also about other protocols)...

...a middle ground could be to implement it as an always-on quirk that
matches any FW (like the existing out_of_spec_triplet quirk)... as a way
to keep on allowing the existing behaviour but sort of discouraging it...

Not really strong opinions about this, BUT at this point, in general I
would keep all of this series on hold for further testing, given these
issues together the bugs fixed by Geert on iterators and the lack of
clock-MAINTs acks...

...also Geert was investigating the need of a different quirks in these
regards for the Renesas boards...

Thanks,
Cristian
