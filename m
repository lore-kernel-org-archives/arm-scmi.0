Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487A138B7AF
	for <arm-scmi@vger.kernel.org>; Mon,  9 Mar 2026 10:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773051984; cv=none; b=XFYIAWtERGtSY2OsUdFwAZCR1Xnnic5yK9vY+qcUlpj11qK6JKzSBceCjg9wkeONqEnAYd1afKE7FKJQ+72rT1kOc/QcaFMHiavJlSawb57a7yxBeYKJEWG/B7QqLSu0vz8ORwBcvCK6jkDT9OctWNpGEUW2p6yqsYR7LVU4IuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773051984; c=relaxed/simple;
	bh=uA3WpUSSabz5uS2JHGrLH5pFgNTVd2X+Xg/70x/ta6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m8g3tQqDtnBIU+X3t2esoeYxSbVLphZI8Tjp5omtL2cqj24NPQ5+2iXGbVrFQ7dJb8+2qgq0lh5CDgedbjYPITdWTqbCBG1mrSc447S2tS6nGaF0QZvQmXXqEqm2oKbWg4jfg8GENBHBdpHggJ8S1+XnlLhX2bgD+IhUOAGlHys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RLIDEp2P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RLIDEp2P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7883C4CEF7;
	Mon,  9 Mar 2026 10:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773051983;
	bh=uA3WpUSSabz5uS2JHGrLH5pFgNTVd2X+Xg/70x/ta6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RLIDEp2PXEgWTfAUAH+yS1GySAYdz7iq7q5HCI6+SdRTQ2vKmvv88or9n7FEdbDdq
	 uxcMXbF1uQlnnNA88UdvqmX2VbM89Viyg0iMbz+qy+T3sEgZF/i6n3SANosHdpoJK5
	 MY+j79H43w1JttiybYWMBsXkKnPgjFuljACJ8BHFPggmjkius3pj2ZkK99pOwsGQXu
	 mWq364s8MoJTQWZfhJTRv3VEBPEm5GtZ+xtq92vgTapL+GtECpyyeaRtrqWGQ0GU6T
	 96Ufks2bRgs6BK7ZT67xmVG88JW0tPh/RPAJu/kvclIrTc/FswIjGBvWqGx11LOUvP
	 lnVooEdFvIvLQ==
Date: Mon, 9 Mar 2026 10:26:20 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] firmware: arm_scmi: Spelling s/mulit/multi/,
 s/currenly/currently/
Message-ID: <20260309-fierce-pastoral-otter-bdf2df@sudeepholla>
References: <6735401861e0c2f3e5e680533cd6f71c4d6fd5eb.1771581270.git.geert+renesas@glider.be>
 <177297485599.1088487.13156698600769816077.b4-ty@kernel.org>
 <CAMuHMdXkyrDRLyDf77TFFjAX_Q_fnA_OwmbkoaEicd+F9JP2aA@mail.gmail.com>
 <20260309-bold-space-ibis-fbff63@sudeepholla>
 <20260309-frisky-proficient-gecko-b8d7be@sudeepholla>
 <CAMuHMdUkJzSLiAO4cwCFSFg73q9hCYQ0fCM5_HEdwKxxgP8aoQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUkJzSLiAO4cwCFSFg73q9hCYQ0fCM5_HEdwKxxgP8aoQ@mail.gmail.com>

On Mon, Mar 09, 2026 at 10:53:27AM +0100, Geert Uytterhoeven wrote:
> Hi Sudeep,
> 
> On Mon, 9 Mar 2026 at 10:38, Sudeep Holla <sudeep.holla@kernel.org> wrote:
> > On Mon, Mar 09, 2026 at 09:29:29AM +0000, Sudeep Holla wrote:
> > > On Mon, Mar 09, 2026 at 09:16:29AM +0100, Geert Uytterhoeven wrote:
> > > > BTW, I noticed some of your commits use the non-standard
> > > > "Message-Id:"-tag, while others use the standard "Link:"-tag (albeit
> > > > with the lore.kernel.org instead of the recommended patch.msgid.link
> > > > domain) to record the origin of patches.  Do you have different git
> > > > setups on different machines?
> > >
> > > Not really. I used to use "Link:" and switched to "Message-Id" a while ago.
> > > I use only one setup and if you are observing something like above, I am
> > > doing something different. I need to check what is that, but the intention
> > > is to use "Message-Id". Let me have a look.
> >
> > OK, did a quick check and see last time I used "Link:" was an year ago and
> > that's when I saw some discussions about use of "Link:" for other purposes and
> > switched to "Message-Id". Let me know if I am messing up something still,
> > happy to look into it and fix it up.
> 
> There was indeed a fuzz about the Link:-tag[1].  In the end,
> it was agreed that the Link:-tags are fine, but please use the
> patch.msgid.link domain, to distinguish it from discussions (which
> should use lore.kernel.org).  Unfortunately I can't find a link to that
> (too many trees in the Google forest).
> 

Ah OK, I didn't follow up to the conclusion of that discussion for sure.

> About Message-Id: I totally agree with [2] ;-)
> 

Thanks, at least the setup is working as expected though it is not using
more common "Link:" format.

> Thanks!
> 
> [1] "A policy for Link tags"
>     https://lwn.net/Articles/1037069/
> 
> [2] https://lwn.net/Articles/1038003/
> 

Thanks for the pointers. Much appreciated! I will use "Message-Id" for this
(v7.1 cycle) and switch to Link as per the above format later as I see that
is more common than "Message-Id" in v7.0 cycle. I don't want to fix-up now 😄.

-- 
Regards,
Sudeep
