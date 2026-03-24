Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022E53FF89F;
	Tue, 24 Mar 2026 14:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774362934; cv=none; b=mJghS9aaNXNYSSwchlV/65No0mfISFn3XHn0v4uqQxXbBijmGIv+kVFh7M85hKtBYRUFkjOz6SJtvEUHcMW7D97kuvglr5W8XtV5zKpso+4gK+gW6SR4AqhUkz9TmSjCNV5gijsGk5XSLE0jPPqBTidG8Pg79nzv/wKg6HprpzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774362934; c=relaxed/simple;
	bh=WPd4At4OVeMrUVA1K/Eh5KCs9ljuPJONJ4dUEZvo+yU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EFs+2slpdijEONsr0zF5mQlow2TJhV2edCUxth7kCn+3X+T6A3eA36xLWI/MiE25pBOBlFYh9nrWFeNIbEJL2aH4Bq6hF4QTpYnWRfacyBioCEBPiH942vhzIWpM3HOU1aN9v6uKY/rr5ULOLw0uFK6S/bjfLsUr5AyXsglVvuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=M2/sRZnu; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="M2/sRZnu"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65324153B;
	Tue, 24 Mar 2026 07:35:26 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3170A3F915;
	Tue, 24 Mar 2026 07:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774362932; bh=WPd4At4OVeMrUVA1K/Eh5KCs9ljuPJONJ4dUEZvo+yU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M2/sRZnuEHdGGxSh8fetnbPDv9Tzmjl49RncTarSgMEQ1PcaSmLkZe6mDhfIlQ9LU
	 f3Q6Jsu2Z9M/6unjZOs/7tSNWINpHREURdtuY1+/uRcMx+4zykJuHygYgmSZmUW2Fw
	 ECkOwyzuZ6S8Hc5F6fTzKglynpEqIkKDqHjbHeBc=
Date: Tue, 24 Mar 2026 14:35:19 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Jacky Bai <ping.bai@nxp.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: clock: Relax check in
 scmi_clock_protocol_init
Message-ID: <acKhJ8Z9WDvHEnYL@pluto>
References: <20260324-scmi-clock-fix-v1-v1-1-65c21935824b@nxp.com>
 <20260324-lean-bobcat-of-reputation-6628b5@sudeepholla>
 <acJI7o79lVNMjV_d@pluto>
 <CAMuHMdVcE439Cyn-TCoioLZXP-YpqObZ0UF8F2NvMCZ41eO6QQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVcE439Cyn-TCoioLZXP-YpqObZ0UF8F2NvMCZ41eO6QQ@mail.gmail.com>

On Tue, Mar 24, 2026 at 02:15:36PM +0100, Geert Uytterhoeven wrote:
> Hi Cristian,

Hi Geert,

> 
> On Tue, 24 Mar 2026 at 09:41, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > On Tue, Mar 24, 2026 at 07:49:22AM +0000, Sudeep Holla wrote:
> > > On Tue, Mar 24, 2026 at 02:24:14PM +0800, Peng Fan (OSS) wrote:
> > > > On i.MX95, the SCMI Clock protocol defines several reserved clock IDs that
> > > > are not backed by real clock devices
> > > > (see arch/arm64/boot/dts/freescale/imx95-clock.h).
> > > >
> > > > For these reserved IDs, the SCMI firmware correctly returns NOT_FOUND in
> > > > response to the CLOCK_ATTRIBUTES command. According to the SCMI Clock
> > > > specification, NOT_FOUND is expected when a clock_id does not correspond to
> > > > a valid clock device.
> > > >
> > > > The recent hardening added in scmi_clock_protocol_init() treats any error
> > > > return as fatal, causing SCMI clock probe to fail and preventing i.MX9
> > > > platforms from booting.
> > > >
> > > > Relax the check so that -ENOENT is treated as a non-fatal condition.
> > >
> > > I understand the use-case and the fix here, but still wonder if this
> > > should be treated as quirk or handle it in the core. I am inclined to
> > > latter as reserved SCMI clock/resource ID seems to be trend in its usage
> > > and hard to classify as quirks.
> > >
> > > Cristain, agree or have a different view ?
> >
> > I was just replying...
> >
> > Looking at the spec 3.6.2.5 CLOCK_ATTRIBUTES
> >
> > "This command returns the attributes that are associated with a specific clock. An agent might be allowed access to only
> > a subset of the clocks available in the system. The platform must thus guarantee that clocks that an agent cannot access
> > are not visible to it."
> >
> > ...not sure if this sheds some light or it is ambiguos anyway...I'd say that
> > NOT_FOUND does NOT equate to be invisible...
> >
> > ...BUT at the same time I think that this practice of exposing a non-contiguos
> > set of resources IDs (a set with holes in it) is the a well-known spec-loophole
> > used by many vendors to deploy one single FW image across all of their platforms
> > without having to reconfigure their reosurces IDs ro expose a common set of
> > contiguos IDs like the spec would suggest...
> >
> > Having said that, since we unfortunately left this door open in the
> > implementation, now this loophole has become common practice
> > apparently...
> 
> When I first read that paragraph, I was also confused.
> What does "not visible" mean?
>   - Not present in the clock ID space exposed to that client of
>     the system?
>     Yeah, multiple different sequences of contiguous IDs, depending
>     on client!

Yes that is the most spec-compliant interpretation usually; in general
across all protocols the SCMI server, through customized enumeration
results, should provide a per-agent view of the system: this should help
handling shared or virtualized resources, since the agent always see
only the 'illusion' provided by the server...

...under this assumption if you dont even need a resource at all (not
RW nor RO) you should NOT even be able to see it...this in turn of
course means that in order to expose a contiguous set of IDs you should
be able to properly configure at build time the FW resources on a per
platform basis...

>   - Return failure on CLOCK_ATTRIBUTES?
>     Which is what implementations seem to do.

Yes this is what is done leveraging the gap in the implementation...I am
not sure that the non-contiguous set of IDs is supported if not by
chance as of now :P (especially in other protocols)

> 
> The next step in the fun is when the system actually needs to know the
> clock rate of such a clock...

Well...that seems a bit of wishful thinking ...

...sort of a Schrödinger's clock :P .. it is NOT_FOUND but does have rates ?

Thanks,
Cristian
