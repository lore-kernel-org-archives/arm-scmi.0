Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAD53A6B85
	for <arm-scmi@vger.kernel.org>; Wed, 20 May 2026 08:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779264616; cv=none; b=MZ4yhB02rY6g0s4bJYRNVAjFRHGpy9FZO3+zT+2rIhq99XK0lpmjfezsR86D+8C18reMvHNp4CjiLBl64l0Gkyp5Cs9QKAwZGE/Iwm4zmsykxmMQvCyi0X7/ixfNNtUdVSZjihGE/Ilztk6+ow+idf8rxtqpFIu8TjGRaUIGNyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779264616; c=relaxed/simple;
	bh=oGciuNGd5/Q4nCXq+2RyUar+b0fSU8OOQ2sBHWQ7gA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jOKSFeRHgH2l705MjLOZ+flkjjMB9huSx6x/pSwf5Wg/OL2nNkBwl/85NJDOf1uaxydz8bEMGs19cZgOGj0Cbd+lTGkii6uOZgXhGm9mqTFA8NC8J2YnJ6IdvPzx4QXNLPX3k6XMPPwbaSmKgcHGlVZP40a5zagoOhb6+vem5QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gKeeVMuD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gKeeVMuD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68F1A1F000E9;
	Wed, 20 May 2026 08:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779264614;
	bh=Y3jSmj/q7r9XoHpkKM7+f2nT3njbkCtAPLWwJEuoUWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gKeeVMuDx+rpLUPRiNm+kwdwTIxb4YoqOE2p7OPqYCAUaBjGLkbpYOf0UNb+LUMvj
	 ufElgBTkYq+SWyBRqo9OU6fmKrzZv0CuOrL1t60Vvg7YGH9vpRYVQWdGqxtUsmgPQJ
	 vFOlWmNpONVd1mqqmWyy5gRETqo1jLP/MnqAgjwQ+TD7gaDs0MXUdyq7qr8sOha/qN
	 pRzpwMN8JMQBLin31RBhgDGySb3AlnmkQ8/Jm3Og/co8WeKkbNCrO8AbooxzVSdfV2
	 jt0e65eqhYYJZweXamvlIhg0/S7W2EyMBhkuoYXMI47TN70eYcmvhM0jJSzXIaLp+h
	 MjR8iRHI1HTDg==
Date: Wed, 20 May 2026 09:10:11 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH 4/4] firmware: arm_scmi: Validate Powercap domains before
 state access
Message-ID: <20260520-wise-lorikeet-of-health-34648a@sudeepholla>
References: <20260517-scmi_fixes-v1-0-d86daec4defd@kernel.org>
 <20260517-scmi_fixes-v1-4-d86daec4defd@kernel.org>
 <agw1ueCQ0WjoBX7-@pluto>
 <20260519-utopian-parrot-of-sorcery-eff40c@sudeepholla>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-utopian-parrot-of-sorcery-eff40c@sudeepholla>

On Tue, May 19, 2026 at 11:04:41AM +0100, Cristian Marussi wrote:
> On Sun, May 17, 2026 at 08:02:43PM +0100, Sudeep Holla wrote:
> > Powercap protocol v2 keeps local enable and last-cap state per
> > domain. Some public operations indexed that state before checking that
> > the supplied domain id was valid, and cap_enable_get() updated it even
> > when cap_get() failed.
> > 
> > Validate the domain before touching the per-domain state and only
> > refresh cached enable state after a successful cap_get().
> > 
> 

[...]

> >  	/*
> >  	 * Report always real platform state; platform could have ignored
> >  	 * a previous disable request. Default true on any error.
> >  	 */
> >  	ret = scmi_powercap_cap_get(ph, domain_id, &power_cap);
> > -	if (!ret)
> > +	if (!ret) {
> >  		*enable = !!power_cap;
> >  
> > -	/* Update internal state with current real platform state */
> > -	pi->states[domain_id].enabled = *enable;
> > +		/* Update internal state with current real platform state */
> > +		pi->states[domain_id].enabled = *enable;
> > +	}
> 
> Mmm, this changes the logic as stated in the above comments...now the
> problem is recalling WHY I adopted this logic :<
> 

The comment captures only ignored disabled request in which case
enabled=true is correct. But I fail to understand what would happen
if the previous call is scmi_powercap_cap_enable_set(..,false); and
assume the scmi_powercap_cap_get() from scmi_powercap_cap_enable_set()
also returned false, but failure to get the state in
scmi_powercap_cap_enable_get() will update it to true.

I wonder if it is due to the SCMI versions to maintain compatibility or the
kernel default sysfs value. scmi_powercap_cap_set() treats cached disabled
state specially. If cap_enable_get() defaulted the cache to false after
a failed read, later cap updates could be suppressed even though the platform
might actually still be enabled. Defaulting to true is the conservative
choice. I will drop this change/hunk. I will assume your reviewed by with
that dropped, please shout if not.

The generic powercap sysfs layer itself defaults enabled to true, but if a
driver get_enable() returns an error it reports false. SCMI avoids that by
returning success with true I assume.

-- 
Regards,
Sudeep
