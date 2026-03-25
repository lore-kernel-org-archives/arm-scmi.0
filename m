Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 748AD3D332F;
	Wed, 25 Mar 2026 12:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441146; cv=none; b=SvDdyXKFQBtbxw/5rUBL9rPp4rZ4mzzgOxeXeySr9/mKHPR43e0lBypzRelBzamaxiLevyLMzUgc575jVkdvoWylJylZTdDu9tBeKfIgQHT0F3PShoCyqn+TaR2Q4vCwF8yluEnjk1r10qyJ+dFB5f36+k4lq9b8tbUzj1/Ziek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441146; c=relaxed/simple;
	bh=1VtDicBwAjX99lDG8d/05N68hlmGlfDw/kov2CzrAp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n7x60bzwSzbXciwGMlRqdAXIXHfEoNp2084JcLUhmHWgf3CIqUInp+BLIs1ZJpFztmT+jHu9bEvb1QY912HYU7la9qfsskCAeuRXUkqDxKbjB3+0heCIjnyerTTQDYZXe7Q0iGYTfLGHqZ+FYpcXQ3Kf7XA1ettYdNffvQUOF1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=aYBkDpc2; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="aYBkDpc2"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93DEE1CDD;
	Wed, 25 Mar 2026 05:18:55 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA8CB3F915;
	Wed, 25 Mar 2026 05:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774441141; bh=1VtDicBwAjX99lDG8d/05N68hlmGlfDw/kov2CzrAp4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aYBkDpc2eDgHZyQYHUoLAJt2BHIwIuu/WzM82njvOdvPK44tY2BTYfF1eKgyd4v8L
	 jkFp7WvXP3UcDuR8vZ5f+fHqBfqf7lwWgAgvqmrtuTH2NUXqd/eVS9CHL+PHz3AY1T
	 bZfjCEdbZQgEA1N7owJazQjmtMlplncihp3GV5LE=
Date: Wed, 25 Mar 2026 12:18:53 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Jacky Bai <ping.bai@nxp.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: clock: Relax check in
 scmi_clock_protocol_init
Message-ID: <acPSrTxMkfdeNOfr@pluto>
References: <20260324-scmi-clock-fix-v1-v1-1-65c21935824b@nxp.com>
 <20260324-lean-bobcat-of-reputation-6628b5@sudeepholla>
 <acJI7o79lVNMjV_d@pluto>
 <CAMuHMdVcE439Cyn-TCoioLZXP-YpqObZ0UF8F2NvMCZ41eO6QQ@mail.gmail.com>
 <acKhJ8Z9WDvHEnYL@pluto>
 <CAMuHMdW==oMpCS==L8ADexPC=4uczNwK5UD6DequBjGOKQfOZw@mail.gmail.com>
 <20260325-spiffy-analytic-sloth-eabfea@sudeepholla>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-spiffy-analytic-sloth-eabfea@sudeepholla>

On Wed, Mar 25, 2026 at 12:06:15PM +0000, Sudeep Holla wrote:
> On Tue, Mar 24, 2026 at 04:32:55PM +0100, Geert Uytterhoeven wrote:
> > Hi Cristian,
> > 

Hi Sudeep,

> > On Tue, 24 Mar 2026 at 15:35, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > On Tue, Mar 24, 2026 at 02:15:36PM +0100, Geert Uytterhoeven wrote:
> > > > On Tue, 24 Mar 2026 at 09:41, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > > > Looking at the spec 3.6.2.5 CLOCK_ATTRIBUTES
> > > > >
> > > > > "This command returns the attributes that are associated with a specific clock. An agent might be allowed access to only
> > > > > a subset of the clocks available in the system. The platform must thus guarantee that clocks that an agent cannot access
> > > > > are not visible to it."
> > > > >
> > > > > ...not sure if this sheds some light or it is ambiguos anyway...I'd say that
> > > > > NOT_FOUND does NOT equate to be invisible...
> > > > >
> > > > > ...BUT at the same time I think that this practice of exposing a non-contiguos
> > > > > set of resources IDs (a set with holes in it) is the a well-known spec-loophole
> > > > > used by many vendors to deploy one single FW image across all of their platforms
> > > > > without having to reconfigure their reosurces IDs ro expose a common set of
> > > > > contiguos IDs like the spec would suggest...
> > > > >
> > > > > Having said that, since we unfortunately left this door open in the
> > > > > implementation, now this loophole has become common practice
> > > > > apparently...
> > > >
> > > > When I first read that paragraph, I was also confused.
> > > > What does "not visible" mean?
> > > >   - Not present in the clock ID space exposed to that client of
> > > >     the system?
> > > >     Yeah, multiple different sequences of contiguous IDs, depending
> > > >     on client!
> > >
> > > Yes that is the most spec-compliant interpretation usually; in general
> > > across all protocols the SCMI server, through customized enumeration
> > > results, should provide a per-agent view of the system: this should help
> > > handling shared or virtualized resources, since the agent always see
> > > only the 'illusion' provided by the server...
> > >
> > > ...under this assumption if you dont even need a resource at all (not
> > > RW nor RO) you should NOT even be able to see it...this in turn of
> > > course means that in order to expose a contiguous set of IDs you should
> > > be able to properly configure at build time the FW resources on a per
> > > platform basis...
> > >
> > > >   - Return failure on CLOCK_ATTRIBUTES?
> > > >     Which is what implementations seem to do.
> > >
> > > Yes this is what is done leveraging the gap in the implementation...I am
> > > not sure that the non-contiguous set of IDs is supported if not by
> > > chance as of now :P (especially in other protocols)
> > >
> > > > The next step in the fun is when the system actually needs to know the
> > > > clock rate of such a clock...
> > >
> > > Well...that seems a bit of wishful thinking ...
> > 
> > Unfortunately it is real... [cliffhanger, to be continued... :-]
> > 
> 
> I am late to the discussion. Based on all the discussion so far, I don't
> want to rush the clk changes from Cristian that adds the hardening yet.

Agreed, the whole series with the iterators and hardening needs fixes from
Geert upfront...

> I won't make it part of my SCMI v7.1 PR. However is it good idea to keep
> it in the next so that we can converge towards some solution in v7.2 ?
> 
> So, the question is if I add the fixes from Geert[1] to my queue, will it
> be a good baseline for all these changes and discussions ?

Yes having my iterator series plus Geert fixes on top would be a good
starting point to have a sane kernel...then we'll see how many quirks or
de-Hardening will be needed on top of that to make all firmware
survive...

I will re-test on my side in the coming days but anything that goes on
linux-next from your next of course has a more broad audience...

Thanks,
Cristian 
