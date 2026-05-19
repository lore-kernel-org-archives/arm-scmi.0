Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 956B73F86E7;
	Tue, 19 May 2026 09:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779181531; cv=none; b=uDCu45O+nrT7zOIhIBNtj1AgfLZs6/5bGr7UDNUzNSY+fNCHI4vA1wMZV+22BJOQUtdaDytAhem/5XmvG7G/tijD5HjmmIoe9XmcPOCPYYNoJQ4L6j01jl/oYANSGHcpowlgtM78yyJ8hw9IJyiMVWFstxj2qELDS7TQx3DH2FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779181531; c=relaxed/simple;
	bh=vF7j9naEMvUEYe6tmHkEEIkCe/QLdr7yqU621pmB1sI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jvJxHvBRpfE9DEoWJX3qkl45xdGZ0cnvIFysm2ppqvtYVmlQoMZuDBqjrf8DKT9CBgkIR2aQDkpXpFdt4ANMZIXRvU11w0SlyShHVcx9OAuPzjfy9oA7okCklSPuVU69ZElVoKBnCDY5mSJGRlirIVT6+eQtMc9wBb7D4J/7684=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gXVaR63t; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gXVaR63t"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C92BE34FC;
	Tue, 19 May 2026 02:05:15 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B0533F632;
	Tue, 19 May 2026 02:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779181520; bh=vF7j9naEMvUEYe6tmHkEEIkCe/QLdr7yqU621pmB1sI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gXVaR63tor9HZjirL/2SHo20ht2u0MYFJjTfOcdb+45QRGtH7MdMYOK4q+BrOwfOL
	 9UsK2zU1RbOAdsSSkjKSWOpXRCRkGOVgCGOTH53koHHP25AANyUfp2R85jAsN9wCrG
	 W1aJBJRhUFZezWM/zzuJTI2nQvMFRenCeLXt0yqk=
Date: Tue, 19 May 2026 10:05:16 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Sudeep Holla <sudeep.holla@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Fix OOB in scmi_power_name_get()
Message-ID: <agwnzGf5jq6gepiU@pluto>
References: <75caae28bdffb55199a0bc6cac5df112a966c608.1778838987.git.geert+renesas@glider.be>
 <agb1Q6mrGyDwFdmO@stanley.mountain>
 <CAMuHMdXreO-6xQ+e88AKQ_vSiwMPMnx=t8h5JChBAtuV4UDMEw@mail.gmail.com>
 <agcHnzzdhV36j9eH@pluto>
 <CAMuHMdVVAioAk_3K4y-7T0MCa7L++sVcWGRfdj_ESHau0ov9eA@mail.gmail.com>
 <agcNULwGvCACUYx2@pluto>
 <agwhGERAdaKepqgT@pluto>
 <agwjfyMykDJTlrBd@stanley.mountain>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agwjfyMykDJTlrBd@stanley.mountain>

On Tue, May 19, 2026 at 11:46:55AM +0300, Dan Carpenter wrote:
> On Tue, May 19, 2026 at 09:36:40AM +0100, Cristian Marussi wrote:
> > On Fri, May 15, 2026 at 01:10:56PM +0100, Cristian Marussi wrote:
> > > On Fri, May 15, 2026 at 02:00:24PM +0200, Geert Uytterhoeven wrote:
> > > > Hi Cristian,
> > > > 
> > > > On Fri, 15 May 2026 at 13:46, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > > > On Fri, May 15, 2026 at 01:29:27PM +0200, Geert Uytterhoeven wrote:
> > > > > > On Fri, 15 May 2026 at 12:28, Dan Carpenter <error27@gmail.com> wrote:
> > > > > > > On Fri, May 15, 2026 at 11:59:15AM +0200, Geert Uytterhoeven wrote:
> > > > > > > > scmi_power_name_get() does not validate the domain number passed by the
> > > > > > > > external caller, which may lead to an out-of-bounds access.
> > > > > > >
> > > > > > > Is an external caller an out of tree caller?  So far as I can see this
> > > > > >
> > > > > > I meant a caller outside drivers/firmware/arm_scmi/.
> > > > > >
> > > > > > > is only called by scmi_pm_domain_probe().
> > > > > > >
> > > > > > >         scmi_pd->name = power_ops->name_get(ph, i);
> > > > > > >
> > > > > > > where i < num_domains.
> > > > > >
> > > > > > You are right. But this seems to be only API implementation in
> > > > > > drivers/firmware/arm_scmi/ that does not validate the passed domain
> > > > > > number.
> > > > >
> > > > > Yes we tend to validate protocol operations calls even if apparently
> > > > > safe from teh caller perspective...indeed I have this fixed locally
> > > > > since ages in an horrible patch, that does a lot more, and that I
> > > > > never posted :P
> > > > >
> > > > > Usually, if it is worth, we also build an internal domain get helper to
> > > > > reuse across the protocol unit...but here really there are only 2 call-sites.
> > > > >
> > > > > What I am not sure is what to return: "unknown" is safer as of now than NULL
> > > > > for sure, but really, what happened is NOT that the name was "unknown" (which
> > > > > by itself would be out-of-spec behaviour) it is more that the whole domain that
> > > > > was referred to that was invalid and NOT existent...
> > > > >
> > > > > ....mmm I suppose we are opening another can of worms here :P
> > > > 
> > > > Like scmi_perf_info_get() returning ERR_PTR(-EINVAL) instead of NULL,
> > > > and scmi_perf_domain_probe() never checking the return value anyway?
> > > 
> > > ...oh probably more than that...and related vendor FW that already exploits
> > > these missing checks here and there to arbitrarily skip domains and return
> > > out-of-spec non-contigous sets of domains becasue they cannot bother to
> > > implement properly the spec (or they have simply forked their codebase from
> > > an old drop and never updated it again...)...so that any kernel-side fix
> > > you made along the road carries the risk of breaking something and a string
> > > of possibly needed quirks...
> > 
> > Anyway, it is the safest option on the table until proper checks are in place.
> > 
> > Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> If it has a description like this then it's absolutely going to get a CVE
> assigned.  We're used to hundreds of CVEs and all but I really feel like
> this is a bad habit.

Indeed, I think already happened to get a CVE on this internal improved
checks despite the fix was more a defensive thing since it had no chance
to be exposed by the current code.

I could be wrong but I think that this is one of the reason I started using
(and maybe abusing) for similar patches the "Harden protocol...." commmit-msg
because it really does not qualify as Fixes for backporting as specified in [1]

[1]: https://www.kernel.org/doc/Documentation/process/stable-kernel-rules.rst

...so at the end probably worth to drop Fixes as you said earlier...

Thanks,
Cristian
