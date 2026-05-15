Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04403CF05C
	for <arm-scmi@vger.kernel.org>; Fri, 15 May 2026 10:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840906; cv=none; b=Kl2RtXMVG/lg8jRcHo2yWx9BHp8c2BCsRjbhQYPjEFWnh5n2yF2GumHpbGlDt2nvZWhkOyALI1J+gpciL2DruPaBqDP9WQU3ShF4c/2cOE9u/QBIWKdoJtCLXpj0Dwa4ut8mCdo3EagAPywaXqqS6F3kQ5DUSTZuBXcYYP8TBsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840906; c=relaxed/simple;
	bh=mMwKeTLJORNTYUVaMmInpEMcOzUyMv2KbBqcSYSCVSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O0fGtEOxuHJAvXxkXkfTaqqNbxFiaBiNi2cQg7XpEaNdJpTIDQF6grwNadd+V2Ve7QhtWfscSsuMAfGkrnx2H7yN2LtRSQD+kC3H2klOC5O0F7W6S2bNV51qnW5YRKQ+qmJvVZueYedc938jjtR3u6WFWZIeHPCd3d7tg08mVjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ManCKDS5; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ManCKDS5"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45562c41ec7so4600055f8f.1
        for <arm-scmi@vger.kernel.org>; Fri, 15 May 2026 03:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778840903; x=1779445703; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cGJn8Hnu9Cg2hyA+NdzLMHOmCSnkgp4MbF/B53wnZOM=;
        b=ManCKDS5krXVtVFDsqua2KEX2CB5sjnQ3pwpp8hGsw0zQjBwlxmaH187RoMA6FH0TQ
         UObKNxOX6Avx0+/hxSOG66RshTY1rCP7KD7Ltaz+l+HX3oUh0KOwQMiYP0zRHI3rLX5d
         84qLeoVGDQnnGSOEgj2sASv1E79Iig9lLAOob6LJJGGJotnqf6yAGPH/U5gJj/BpFUzv
         JyerjHb7tQRtu1zI7+CWO8bewX2z1WS8gubj/Qi9j2HUuzbwEHPrtTWe7uBghxU4LzKV
         lwuDurT/Ln6i+aQ9rP9HQf3ZpoG0mSuKfURTkrfn7Jnez68pxs7Xj8rXfnpLL0H7a07V
         8LLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778840903; x=1779445703;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cGJn8Hnu9Cg2hyA+NdzLMHOmCSnkgp4MbF/B53wnZOM=;
        b=SoR/eehGGleWp2ovQfHg7fuKt9QD+RxqKjKHtyO4N5ruY8PXIjFuNMTzbF5V+IrE2U
         RPmiJv4wL3KHp9K+yryh3y+HMptXHF8Q0mtJug29FKaxJ4AIpm+JUQAXQz1wAsDwjjAS
         ciIQGCEx8GmUuNL4F7Um7aLL3K2FQx4/rmigtyrljS5jjWemNvsR5rjfX0pOQlBm9AlY
         nN22gVL3oMNkYTbvkHaOyg81bliXqcZ97pmGdySzRtANEJ6L9ncShYNGgVOk1re5PLn4
         yTXOKpfVPqbOl/OFXZyGEyGVK31U8y+Gla72eJmLJaD+GzP1vY6gzcWd+r+2jTpyOHNo
         Lj/w==
X-Forwarded-Encrypted: i=1; AFNElJ+2GCd9EkQsDDncB0+lAaThcLjCbKBY5IgXcqzteYLtDB1aXmd0bRtHTlI1JdBqMKKrPK5nyBQrkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQW5d/fmpMyFS4Q1fRoRDyq311uJAMI5LsIAf7JV49LWKXv7GA
	d5yPhs7ErTMzfcoppDAoi/PWv5Ya/8tBjQsugy9YcUeQ3tZ7KJPU0SE0HiaQzA==
X-Gm-Gg: Acq92OGXXViK428VC7o2WMkufTpSYNdd9mUusx11bv7riswM+pyeL5VjqKM4m6LhcFd
	f3eVQl+G/5ovuKgUtOZS4sIXyPVGbE+Emhy4/w02hytMiavz0UzH9LhKqA9262R39MP47HUH7h8
	2//7eAbklG9qNVYOUOCt1k3TwqRhXZMuV8w+19LMq0p+p6nB7BvZAp5wmug3dcNia+gHlzCu5pt
	QobO0VXsinmyF3dHZCGcc1Cf3PkL3zKPBHWYhIS6NQx2S6371uaenkdLPfNPW+uaWzsFK2Wx5yi
	Too3R8/WQQK60UTBkMtN4t+GIurOQUe1Z1xH5+cxog12k52kIi3CJkg58iXtiJZ65iaEB21+6WW
	kjf3EhOxmbntwcWowzJ8wcvgZ4GgR5ct10ALpuw6R68IVnLBKW8LIJFgyANExYX/SLhfndzdwwN
	/uK74frwV5sZctF92qYTA=
X-Received: by 2002:a05:6000:288c:b0:43d:761d:5423 with SMTP id ffacd0b85a97d-45e5c5af599mr4592584f8f.16.1778840903228;
        Fri, 15 May 2026 03:28:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768c4fsm13718499f8f.8.2026.05.15.03.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:28:22 -0700 (PDT)
Date: Fri, 15 May 2026 13:28:19 +0300
From: Dan Carpenter <error27@gmail.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Fix OOB in scmi_power_name_get()
Message-ID: <agb1Q6mrGyDwFdmO@stanley.mountain>
References: <75caae28bdffb55199a0bc6cac5df112a966c608.1778838987.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75caae28bdffb55199a0bc6cac5df112a966c608.1778838987.git.geert+renesas@glider.be>

On Fri, May 15, 2026 at 11:59:15AM +0200, Geert Uytterhoeven wrote:
> scmi_power_name_get() does not validate the domain number passed by the
> external caller, which may lead to an out-of-bounds access.
> 

Is an external caller an out of tree caller?  So far as I can see this
is only called by scmi_pm_domain_probe().

	scmi_pd->name = power_ops->name_get(ph, i);

where i < num_domains.

regards,
dan carpenter

