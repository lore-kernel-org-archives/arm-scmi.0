Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 802F63C1994;
	Thu,  5 Mar 2026 15:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772723841; cv=none; b=cKBpiL8rWh+ZpzOkN43HAMya4/yfAKErmj+KGFC76fM/bxpI3m6tpYCt+8S4Vl1gt0aM6ckItBL1EdvBD/i9aMcWxQQTAaI8TP7rJGLVrL81kXMzo9eG3rWFa4V+Tc4XF+NuO6XnR8J0TrHQ8bF7bzzjeMOgks1+OKvG8x62vSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772723841; c=relaxed/simple;
	bh=fsUuwS8SPabiNRfYs1Z0MiRTIOfz/IX47+usvPqf/Fk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNJk+f80ZJtCufU42vUwbUwXriKU3aL6W01KAd1Tp8uUnYZJ0TMY3OFLV34gZAR2CwOr8EYoOZU5I0wCibxBSIEb9a7gNuvgF5H/xMaC4CgSc/93hkQPiFg51PYo0rpjmUAf4obzRQAF7W1xZ8q0DImECxlEJHSuKtLfrge/jhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B834E339;
	Thu,  5 Mar 2026 07:17:12 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6DE0A3F73B;
	Thu,  5 Mar 2026 07:17:16 -0800 (PST)
Date: Thu, 5 Mar 2026 15:16:54 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com
Subject: Re: [PATCH] firmware: arm_scmi: Fix NULL dereference on notify error
 path
Message-ID: <aameZunhUGIn7xoK@pluto>
References: <20260305131011.541444-1-cristian.marussi@arm.com>
 <aamcu-f14DZNJzw5@stanley.mountain>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aamcu-f14DZNJzw5@stanley.mountain>

On Thu, Mar 05, 2026 at 06:09:47PM +0300, Dan Carpenter wrote:
> On Thu, Mar 05, 2026 at 01:10:11PM +0000, Cristian Marussi wrote:
> > Since commit b5daf93b809d1 ("firmware: arm_scmi: Avoid notifier
> > registration for unsupported events") the call chains leading to the helper
> > __scmi_event_handler_get_ops expect an ERR_PTR to be returned on failure to
> > get an handler for the requested event key, while the current helper can
> > still return a NULL when no handler could be found or created.
> > 
> > Fix by forcing an ERR_PTR return value when the handler reference is NULL.
> > 
> > Fixes: b5daf93b809d1 ("firmware: arm_scmi: Avoid notifier registration for unsupported events")
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > ---

Hi Dan,

> 
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks for you review.

> 
> I feel a bit bad about this.  I saw this as a Smatch warning last August
> but I somehow marked it as a false positive.  :/

:P

...it was tricky because the code is bit convoluted...
...indeed I posted this as a quick easy backportable fix BUT I am gonna
post soon a full rework on top of this around that function and the
whole SCMI notification core code that makes use of cleanup handlers
since they greatly simplify some of the mutexes hell around this
stuff...

Thanks,
Cristian
