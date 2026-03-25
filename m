Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62AF3BF678;
	Wed, 25 Mar 2026 12:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774440379; cv=none; b=uoCkfuddESJRnxvc5rPct0ZJsIF1qheF9tweFAiyO/6MnW/uPG2C4rxaKtEIaFhOV8+ZlSAhdAa0cYrsVoSpy+vIdfWrZb0a/IsBjIUgUn4pCRlUNF4w9juZ0THEgzMbZCUSBUuc0j8AWycY6TuRozL5fPwlQ8a/q+pEr840fIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774440379; c=relaxed/simple;
	bh=GLFCeOJiFLT5z6XuUp/haZuUWke7Kk3EIhUX4sc5SiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q3Rus5LMfWmatc1jYp15451H3o5faVzdX/vHmXSxSdvvySLuwEpDT6qYF0b/l/9k2lrlG6rTOFXqvZxLvldnlVAQj5ZSRpeedySFD2032BThX0MKi1GHx9gF9C2OL1pJMamQn9eOM1mwjHOyXEQAN/BK78QCeJcBqWmjVdJFXm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oytF71RE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oytF71RE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D738C2BC9E;
	Wed, 25 Mar 2026 12:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774440379;
	bh=GLFCeOJiFLT5z6XuUp/haZuUWke7Kk3EIhUX4sc5SiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oytF71REZveCJZgrtlhlQ1Ax5N+yZFQ+GRvmFgX6TXhAOLGJ7tDExr3J2fYmrdi71
	 NVLYE5IJVD0iCLLMdjo2PqUP5YQ/yvzmRToC+rMf3WtIlG4Zlm66GJ98pLwo67jdL4
	 Wbr4INcFhFVuspC93PS6sm6c4DYooDqzN6iL/6xWB49qMKaCBTi6ycieHwbyELrtd0
	 Xt45aw3m+AUT5eYAZX5F9brGeFeksamm8hXUqmDYP00nzeLwr38lITgi7KhoE0LD2a
	 SQsWelR2dLB2iFl+ydUTXkuUmhY85PEC9QQcMmCTBiyea0VIHfvlCo6H3L/+atalIN
	 WhkF7+MD3z1hg==
Date: Wed, 25 Mar 2026 12:06:15 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Jacky Bai <ping.bai@nxp.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: clock: Relax check in
 scmi_clock_protocol_init
Message-ID: <20260325-spiffy-analytic-sloth-eabfea@sudeepholla>
References: <20260324-scmi-clock-fix-v1-v1-1-65c21935824b@nxp.com>
 <20260324-lean-bobcat-of-reputation-6628b5@sudeepholla>
 <acJI7o79lVNMjV_d@pluto>
 <CAMuHMdVcE439Cyn-TCoioLZXP-YpqObZ0UF8F2NvMCZ41eO6QQ@mail.gmail.com>
 <acKhJ8Z9WDvHEnYL@pluto>
 <CAMuHMdW==oMpCS==L8ADexPC=4uczNwK5UD6DequBjGOKQfOZw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW==oMpCS==L8ADexPC=4uczNwK5UD6DequBjGOKQfOZw@mail.gmail.com>

On Tue, Mar 24, 2026 at 04:32:55PM +0100, Geert Uytterhoeven wrote:
> Hi Cristian,
> 
> On Tue, 24 Mar 2026 at 15:35, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > On Tue, Mar 24, 2026 at 02:15:36PM +0100, Geert Uytterhoeven wrote:
> > > On Tue, 24 Mar 2026 at 09:41, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > > Looking at the spec 3.6.2.5 CLOCK_ATTRIBUTES
> > > >
> > > > "This command returns the attributes that are associated with a specific clock. An agent might be allowed access to only
> > > > a subset of the clocks available in the system. The platform must thus guarantee that clocks that an agent cannot access
> > > > are not visible to it."
> > > >
> > > > ...not sure if this sheds some light or it is ambiguos anyway...I'd say that
> > > > NOT_FOUND does NOT equate to be invisible...
> > > >
> > > > ...BUT at the same time I think that this practice of exposing a non-contiguos
> > > > set of resources IDs (a set with holes in it) is the a well-known spec-loophole
> > > > used by many vendors to deploy one single FW image across all of their platforms
> > > > without having to reconfigure their reosurces IDs ro expose a common set of
> > > > contiguos IDs like the spec would suggest...
> > > >
> > > > Having said that, since we unfortunately left this door open in the
> > > > implementation, now this loophole has become common practice
> > > > apparently...
> > >
> > > When I first read that paragraph, I was also confused.
> > > What does "not visible" mean?
> > >   - Not present in the clock ID space exposed to that client of
> > >     the system?
> > >     Yeah, multiple different sequences of contiguous IDs, depending
> > >     on client!
> >
> > Yes that is the most spec-compliant interpretation usually; in general
> > across all protocols the SCMI server, through customized enumeration
> > results, should provide a per-agent view of the system: this should help
> > handling shared or virtualized resources, since the agent always see
> > only the 'illusion' provided by the server...
> >
> > ...under this assumption if you dont even need a resource at all (not
> > RW nor RO) you should NOT even be able to see it...this in turn of
> > course means that in order to expose a contiguous set of IDs you should
> > be able to properly configure at build time the FW resources on a per
> > platform basis...
> >
> > >   - Return failure on CLOCK_ATTRIBUTES?
> > >     Which is what implementations seem to do.
> >
> > Yes this is what is done leveraging the gap in the implementation...I am
> > not sure that the non-contiguous set of IDs is supported if not by
> > chance as of now :P (especially in other protocols)
> >
> > > The next step in the fun is when the system actually needs to know the
> > > clock rate of such a clock...
> >
> > Well...that seems a bit of wishful thinking ...
> 
> Unfortunately it is real... [cliffhanger, to be continued... :-]
> 

I am late to the discussion. Based on all the discussion so far, I don't
want to rush the clk changes from Cristian that adds the hardening yet.
I won't make it part of my SCMI v7.1 PR. However is it good idea to keep
it in the next so that we can converge towards some solution in v7.2 ?

So, the question is if I add the fixes from Geert[1] to my queue, will it
be a good baseline for all these changes and discussions ?

-- 
Regards,
Sudeep
