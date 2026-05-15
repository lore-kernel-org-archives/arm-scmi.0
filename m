Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 704743D25C6;
	Fri, 15 May 2026 12:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778847064; cv=none; b=g+OT5pWrv5DEjmOAzBMyXUbfE4EtBiNjNfDtFoS2EVR/ci6EQFmFrNjeJD3WVxFK5tBvBsUXU6o/lK4K120++kqz/TBHX0PJNxHFllc1nIpEg7U8iF91L+nasbjedMS1PV6kaDk5uZxVw0YpSNf2+hgosI1eVyxwakhvmQ8jZ1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778847064; c=relaxed/simple;
	bh=9Ggm0xl0Rj1dV1c+fn5OpThB5uFuSG64WFLRSkQ0fUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ixF9Cq1utG6M3vw8yHqwQcIZ4c+ej7q9/rQjVVjZfQrWSeGxAbZWy5mY7pbEPKLZlPqpHhAjWPE+RcXoCSZZLAY3EUYUVtj7qF65uj6PL0hdVtlUUFgM0iDAFrTx9443F2YKra9ct/0e/tv+IO5M/shn0MMevX27g+vYBH7F+aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=cWi5ErhP; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="cWi5ErhP"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03C2E27D3;
	Fri, 15 May 2026 05:10:55 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C975F3F836;
	Fri, 15 May 2026 05:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778847060; bh=9Ggm0xl0Rj1dV1c+fn5OpThB5uFuSG64WFLRSkQ0fUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cWi5ErhPTqtArb43mzcx1iT2vADWKmKqsbY3/lKtpWmZUKlf6UgMs7eRmg154qiTT
	 SFYJIzHQCc1MnGA5vfDWLhg7m0/VVKNkcBSHOGDiYd5Cea0s02YbbIZUiOyWgyIPQ6
	 KFXzaIWMdTwQjx+2R5u/cQSYFWk2pZ1s6NxdnEos=
Date: Fri, 15 May 2026 13:10:56 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Dan Carpenter <error27@gmail.com>,
	Sudeep Holla <sudeep.holla@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Fix OOB in scmi_power_name_get()
Message-ID: <agcNULwGvCACUYx2@pluto>
References: <75caae28bdffb55199a0bc6cac5df112a966c608.1778838987.git.geert+renesas@glider.be>
 <agb1Q6mrGyDwFdmO@stanley.mountain>
 <CAMuHMdXreO-6xQ+e88AKQ_vSiwMPMnx=t8h5JChBAtuV4UDMEw@mail.gmail.com>
 <agcHnzzdhV36j9eH@pluto>
 <CAMuHMdVVAioAk_3K4y-7T0MCa7L++sVcWGRfdj_ESHau0ov9eA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVVAioAk_3K4y-7T0MCa7L++sVcWGRfdj_ESHau0ov9eA@mail.gmail.com>

On Fri, May 15, 2026 at 02:00:24PM +0200, Geert Uytterhoeven wrote:
> Hi Cristian,
> 
> On Fri, 15 May 2026 at 13:46, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > On Fri, May 15, 2026 at 01:29:27PM +0200, Geert Uytterhoeven wrote:
> > > On Fri, 15 May 2026 at 12:28, Dan Carpenter <error27@gmail.com> wrote:
> > > > On Fri, May 15, 2026 at 11:59:15AM +0200, Geert Uytterhoeven wrote:
> > > > > scmi_power_name_get() does not validate the domain number passed by the
> > > > > external caller, which may lead to an out-of-bounds access.
> > > >
> > > > Is an external caller an out of tree caller?  So far as I can see this
> > >
> > > I meant a caller outside drivers/firmware/arm_scmi/.
> > >
> > > > is only called by scmi_pm_domain_probe().
> > > >
> > > >         scmi_pd->name = power_ops->name_get(ph, i);
> > > >
> > > > where i < num_domains.
> > >
> > > You are right. But this seems to be only API implementation in
> > > drivers/firmware/arm_scmi/ that does not validate the passed domain
> > > number.
> >
> > Yes we tend to validate protocol operations calls even if apparently
> > safe from teh caller perspective...indeed I have this fixed locally
> > since ages in an horrible patch, that does a lot more, and that I
> > never posted :P
> >
> > Usually, if it is worth, we also build an internal domain get helper to
> > reuse across the protocol unit...but here really there are only 2 call-sites.
> >
> > What I am not sure is what to return: "unknown" is safer as of now than NULL
> > for sure, but really, what happened is NOT that the name was "unknown" (which
> > by itself would be out-of-spec behaviour) it is more that the whole domain that
> > was referred to that was invalid and NOT existent...
> >
> > ....mmm I suppose we are opening another can of worms here :P
> 
> Like scmi_perf_info_get() returning ERR_PTR(-EINVAL) instead of NULL,
> and scmi_perf_domain_probe() never checking the return value anyway?

...oh probably more than that...and related vendor FW that already exploits
these missing checks here and there to arbitrarily skip domains and return
out-of-spec non-contigous sets of domains becasue they cannot bother to
implement properly the spec (or they have simply forked their codebase from
an old drop and never updated it again...)...so that any kernel-side fix
you made along the road carries the risk of breaking something and a string
of possibly needed quirks...

Cheers,
Cristian
