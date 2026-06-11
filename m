Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8533C9EEF;
	Thu, 11 Jun 2026 11:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781176849; cv=none; b=u4sb4EF1mLAHU4eNu0AeAWswRGc36XcnJIaaBzIkOxKavWPlTDYX3sOqdQLejhxXhILDs3g/0aAOKpyoCELy0NfhZsPjD8VuKXdEc91bAY5EiTNnKvAQ0ZgQWna0cOBzUn792NthZY6O+SLm6cTbMJ9Ca58i7Kfk3ww2M5XRfvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781176849; c=relaxed/simple;
	bh=OFh1/b1LnIhEhCvfR3RACSxZDLRFac2VAuOc7+DAECk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FQkevCOsFroox2XPGN+5iVhwNG8YgsJsbrBJcQwE+8vWz0TteGRhKeu1zVdfdVaQ3FFhDQ758Zq7/uznKo7wWX7brYZMLrM5LxEEStXfiSCTHOuD6woRXEmIlsa1WQlT/lz1qAz/6fDWWlOIqIzZ9bZpE759vjJHnK0e6LQykBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MHNKcILq; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MHNKcILq"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEB2E1E2F;
	Thu, 11 Jun 2026 04:20:41 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9E013F99C;
	Thu, 11 Jun 2026 04:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781176846; bh=OFh1/b1LnIhEhCvfR3RACSxZDLRFac2VAuOc7+DAECk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MHNKcILqIFkwUeM49WMED3f412FnavaaFcuc6S4n/B3nBaxYKbfPjGfPdFeFd3vY9
	 tzKsWYTHy1CE/C5YGoqWO3ZcCYqK0wEkjpd9MrmgnygBJ50Zmc8W7EZG0snbe0Zbfb
	 88u1V3NDF8+B+sxd4Gv0DQ0+WQ33JRE7IckMj7S4=
Date: Thu, 11 Jun 2026 12:20:33 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Use common error handling code in
 __scmi_device_create()
Message-ID: <aiqZiv995sbvcBjq@pluto>
References: <545ffb86-55f5-46b2-83ca-285cd8d540d7@web.de>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <545ffb86-55f5-46b2-83ca-285cd8d540d7@web.de>

On Thu, Jun 11, 2026 at 10:34:52AM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 11 Jun 2026 10:27:45 +0200
> 
> Use an additional label so that a bit of exception handling can be better
> reused at the end of an if branch.
> 

Hi,

> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/firmware/arm_scmi/bus.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> index 793be9eabaed..8c20ed1a8243 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -450,14 +450,13 @@ __scmi_device_create(struct device_node *np, struct device *parent,
>  		return NULL;
>  
>  	scmi_dev->name = kstrdup_const(name ?: "unknown", GFP_KERNEL);
> -	if (!scmi_dev->name) {
> -		kfree(scmi_dev);
> -		return NULL;
> -	}
> +	if (!scmi_dev->name)
> +		goto free_scmi_dev;
>  
>  	id = ida_alloc_min(&scmi_bus_id, 1, GFP_KERNEL);
>  	if (id < 0) {
>  		kfree_const(scmi_dev->name);
> +free_scmi_dev:
>  		kfree(scmi_dev);

I can understand the aim, but jumping in the middle of another block
just to reuse the cleanup statement is far less readable (and ugly)

Cleanup handlers probably a better solution here...but I have NOT looked
at all the sorrounding code here recently...so I maybe wrong and keeping
the current code could be even bette.

Thanks,
Cristian
