Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2337947DF87;
	Fri, 15 May 2026 11:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845610; cv=none; b=bFYT1IOx2v0WxDiz6/WCwyhMhkbZkkG/yo0mqdwxku+VKXlym/H5bgMR091VnIf2FQjsAk2x00QwRd6ZPjeRrZnzcrESb1cg2yVXigIA4QTtkW6gMOnuf9howUDUYlW/qP4cKIbE4hQP44YiFAiHpz9m+mz3ROJUxhKFwXRITkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845610; c=relaxed/simple;
	bh=woFbGz4cqB9LZc4NQu0SGqfw+B2Gzyz0AHx09mb7Jgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sU2gEWxTqofiVwSHOtK+Ckx1KQ/lldnWAOvkFO/S29hG8/sIjzC1lyLOiZcUK6aJVEAFCXf16ZUZpbTHxmuPVF1oH9q4WLKUviH3tZGUNf5axy3+zCzQLIYvVSZqvDAzTDP/FW68nZ4tOF1mTeTQ1xxQlPzFU4owZcqJc5FvSHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ezykeqOH; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ezykeqOH"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44FC91BF7;
	Fri, 15 May 2026 04:46:43 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D66303F85F;
	Fri, 15 May 2026 04:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778845608; bh=woFbGz4cqB9LZc4NQu0SGqfw+B2Gzyz0AHx09mb7Jgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ezykeqOHq74gbBxfBmz1XAgHhH985DTAdkwCTexwYxokU+8qcTvpCPpQxVm5EgPZt
	 bbtwWb06+BrXKixBoEh7LsfGjWt/vChmEOL0+/6jISYZSR2EihEUqVrSvrHm6GHt76
	 yc7TOTcfH6GO1D2XEQd12TaiPi9YxPYucbm+jufo=
Date: Fri, 15 May 2026 12:46:39 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Dan Carpenter <error27@gmail.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Fix OOB in scmi_power_name_get()
Message-ID: <agcHnzzdhV36j9eH@pluto>
References: <75caae28bdffb55199a0bc6cac5df112a966c608.1778838987.git.geert+renesas@glider.be>
 <agb1Q6mrGyDwFdmO@stanley.mountain>
 <CAMuHMdXreO-6xQ+e88AKQ_vSiwMPMnx=t8h5JChBAtuV4UDMEw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXreO-6xQ+e88AKQ_vSiwMPMnx=t8h5JChBAtuV4UDMEw@mail.gmail.com>

On Fri, May 15, 2026 at 01:29:27PM +0200, Geert Uytterhoeven wrote:
> Hi Dan,
> 

Hi all,

> On Fri, 15 May 2026 at 12:28, Dan Carpenter <error27@gmail.com> wrote:
> > On Fri, May 15, 2026 at 11:59:15AM +0200, Geert Uytterhoeven wrote:
> > > scmi_power_name_get() does not validate the domain number passed by the
> > > external caller, which may lead to an out-of-bounds access.
> >
> > Is an external caller an out of tree caller?  So far as I can see this
> 
> I meant a caller outside drivers/firmware/arm_scmi/.
> 
> > is only called by scmi_pm_domain_probe().
> >
> >         scmi_pd->name = power_ops->name_get(ph, i);
> >
> > where i < num_domains.
> 
> You are right. But this seems to be only API implementation in
> drivers/firmware/arm_scmi/ that does not validate the passed domain
> number.
>

Yes we tend to validate protocol operations calls even if apparently
safe from teh caller perspective...indeed I have this fixed locally
since ages in an horrible patch, that does a lot more, and that I
never posted :P

Usually, if it is worth, we also build an internal domain get helper to
reuse across the protocol unit...but here really there are only 2 call-sites.

What I am not sure is what to return: "unknown" is safer as of now than NULL
for sure, but really, what happened is NOT that the name was "unknown" (which
by itself would be out-of-spec behaviour) it is more that the whole domain that
was referred to that was invalid and NOT existent...

....mmm I suppose we are opening another can of worms here :P

Thanks,
Cristian
