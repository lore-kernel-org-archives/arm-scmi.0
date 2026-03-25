Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1198F3DDDDA;
	Wed, 25 Mar 2026 12:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774440885; cv=none; b=PzHyWhi5TrbMYS4h1FxRF0dulmtw5IaBnT8MJP8wJME/bbR6XWojMOO98G9SyCl9KhOE+DyouPBAxORJnce5OKkS1i9Owky8+uwRNUPYBUJ5bilYrJAU/qoRfuE11Pmsk+mvkWO0Am7eR2LDCjG3GgbEk7GF4SKoLqp2Q6gixek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774440885; c=relaxed/simple;
	bh=ddmo43ydD3DzDMQ4kgM7JV/r98vLaJXcKhiK8DEbdhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dswioCfeNS4S3YSyOp/8Sgm0DCwQNZFZA9c/pFwZgORROe5FotHPAELW4hWdSOWXMSlpbE7KtUoIHGqCfj8TXnswHkhiSjMQUNwY5y/CtlyDCYjsRFHoS8D5OXLFWxz9bbE8M0FIFB539JFe2bJNwtJ+2Al49VDFAIP6dB6lrsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ux8Cj21p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ux8Cj21p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F32FC2BCB0;
	Wed, 25 Mar 2026 12:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774440884;
	bh=ddmo43ydD3DzDMQ4kgM7JV/r98vLaJXcKhiK8DEbdhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ux8Cj21pNOzMC7o/XaAZAEfVbpqDqYGxtvUt+BSUapBGnOVUi4FLduFkxxoJ7pFzJ
	 hj7B1UE87Oasj3Cb9dAbamKn46FKcFuD/Bj0qRCG3PbRnZgCPZpYP6dzf4+wgj4psB
	 ovpwrqouF9crN9y+ut5APZUl0zwt+mT8Dh83Dmtz+m87tBLnkglCVZYENJ7Xjbgiuv
	 gGoivSbtropAF/n4IhThf2WnZHQAC7nlZfjYS9gi7u70hr5cci26WTcCORZzIkL60c
	 dLormc1nmp22Ss6kUox5m2Y82twYnvMfxSClOyztKOwn0mFAPGs/xHCh1Bv3pv7KOB
	 ZE8m5gVv8ByWw==
Date: Wed, 25 Mar 2026 12:14:40 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: clock: Relax check in
 scmi_clock_protocol_init
Message-ID: <20260325-dainty-hilarious-rhino-affa78@sudeepholla>
References: <20260324-scmi-clock-fix-v1-v1-1-65c21935824b@nxp.com>
 <20260324-lean-bobcat-of-reputation-6628b5@sudeepholla>
 <acJI7o79lVNMjV_d@pluto>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acJI7o79lVNMjV_d@pluto>

On Tue, Mar 24, 2026 at 08:18:54AM +0000, Cristian Marussi wrote:
> On Tue, Mar 24, 2026 at 07:49:22AM +0000, Sudeep Holla wrote:
> > On Tue, Mar 24, 2026 at 02:24:14PM +0800, Peng Fan (OSS) wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > > 
> 
> Hi,
> 
> > > On i.MX95, the SCMI Clock protocol defines several reserved clock IDs that
> > > are not backed by real clock devices
> > > (see arch/arm64/boot/dts/freescale/imx95-clock.h).
> > > 
> > > For these reserved IDs, the SCMI firmware correctly returns NOT_FOUND in
> > > response to the CLOCK_ATTRIBUTES command. According to the SCMI Clock
> > > specification, NOT_FOUND is expected when a clock_id does not correspond to
> > > a valid clock device.
> > > 
> > > The recent hardening added in scmi_clock_protocol_init() treats any error
> > > return as fatal, causing SCMI clock probe to fail and preventing i.MX9
> > > platforms from booting.
> > > 
> > > Relax the check so that -ENOENT is treated as a non-fatal condition.
> > > 
> > 
> > I understand the use-case and the fix here, but still wonder if this
> > should be treated as quirk or handle it in the core. I am inclined to
> > latter as reserved SCMI clock/resource ID seems to be trend in its usage
> > and hard to classify as quirks.
> > 
> > Cristain, agree or have a different view ?
> > 
> 
> I was just replying...
> 
> Looking at the spec 3.6.2.5 CLOCK_ATTRIBUTES
> 
> "This command returns the attributes that are associated with a specific
> clock. An agent might be allowed access to only a subset of the clocks
> available in the system. The platform must thus guarantee that clocks that
> an agent cannot access are not visible to it."
> 
> ...not sure if this sheds some light or it is ambiguos anyway...I'd say that
> NOT_FOUND does NOT equate to be invisible...
> 
> ...BUT at the same time I think that this practice of exposing a non-contiguos
> set of resources IDs (a set with holes in it) is the a well-known spec-loophole
> used by many vendors to deploy one single FW image across all of their platforms
> without having to reconfigure their reosurces IDs ro expose a common set of
> contiguos IDs like the spec would suggest...
> 
> Having said that, since we unfortunately left this door open in the
> implementation, now this loophole has become common practice
> apparently...
> 

Indeed, I agree. I wasn't fully convinced to relax and this discussion
seem to strive towards right direction IMO.

> ...I am more concerned about the impact that this COULD have on underlying
> resources allocations that at the driver level was certainly conceived
> to manage a contiguos set of IDs, even though it was certanly the
> usecase until my harden patches...so it could be safe but to be double
> checked...
> 
> Quirk or core I suppose it depends on how much we want to 'legalize' this
> trick for the future (thinking also about other protocols)...
> 

Agreed. I am more nervous about legalising it. Let us see what are the
issues with the firmware in the wild before we can decide. That's one reason
I would like keep your changes in -next even though I have now dropped the
idea of pushing in for v7.1

> ...a middle ground could be to implement it as an always-on quirk that
> matches any FW (like the existing out_of_spec_triplet quirk)... as a way
> to keep on allowing the existing behaviour but sort of discouraging it...
> 

Fair enough, worth an attempt at the least.

> Not really strong opinions about this, BUT at this point, in general I
> would keep all of this series on hold for further testing, given these
> issues together the bugs fixed by Geert on iterators and the lack of
> clock-MAINTs acks...
> 

Agreed.

> ...also Geert was investigating the need of a different quirks in these
> regards for the Renesas boards...
> 

Yes still waiting for the outcome from the cliffhanger Geert left us 😉.
Just kidding take your time Geert, no rush.

-- 
Regards,
Sudeep
