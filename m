Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4016D190470
	for <arm-scmi@vger.kernel.org>; Tue, 18 Feb 2025 10:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739875281; cv=none; b=UNwqhC4wAaYW+3LIjyQEGvvS8jP3WWAN1GJFWA4uHbYNpv5eTkhEnyldmd7QMiTX9T5T2XNNB2EviSDh0l9mqi063LxjObJN9/I6/wHrmUedx9KzTXG+8jtdJrFhlQX34Cl89LmxQEFPS4fJ1SRTULGS9Ae7WQwBuJzxKjpfrEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739875281; c=relaxed/simple;
	bh=D4Bjmkx93rJBE333KwFKJtHM62B0j/z39Qzr86gjrcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AFDFthU6y+B/S8zLe/oyg0EtMf7bQ3xKPROQ6wdg6DK66OgO8xnviRKGLjw/7hRbrBU0l5SzAKpD3vROorxSAhULtA8XyqGh3Yru85AZOSKg5YyNL20Pgqq85YexLErkWtQ6tXtT88+IS4M+eNrGeglWHhYRm//728d6HOj2cNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 475E713D5;
	Tue, 18 Feb 2025 02:41:38 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA3E53F6A8;
	Tue, 18 Feb 2025 02:41:17 -0800 (PST)
Date: Tue, 18 Feb 2025 10:41:15 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "cristian.marussi@arm.com" <cristian.marussi@arm.com>,
	"souvik.chakravarty@arm.com" <souvik.chakravarty@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	"Dan Carpenter" <dan.carpenter@linaro.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	Chuck Cannon <chuck.cannon@nxp.com>
Subject: Re: POWER_DOMAIN_ATTRIBUTES in SCMI
Message-ID: <Z7Rjyy7_Jg66vqCf@bogus>
References: <PAXPR04MB8459E8D1A82DE43C08B6C26788FE2@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PAXPR04MB8459E8D1A82DE43C08B6C26788FE2@PAXPR04MB8459.eurprd04.prod.outlook.com>

On Fri, Feb 14, 2025 at 09:20:27AM +0000, Peng Fan wrote:
> All,
>
> Previously I posted a patch to linux to set all power domains
> with "GENPD_FLAG_ACTIVE_WAKEUP" set in
> drivers/pmdomain/arm/scmi_pm_domain.c

Yes, I remember ACK-ing that and now I am thinking why 😄.
The description of the flag GENPD_FLAG_ACTIVE_WAKEUP says:
"Instructs genpd to keep the PM domain powered on, in case any of its
attached devices is used in the wakeup path to serve system wakeups."

Does that mean all the SCMI power domains remain powered on with this
flag ? If so, that sounds wrong to me. I hope it is not the case and it
is effective only if the device attached is wakeup source.

> But in the end we find that some power domains
> could be in off state while it still could wakeup
> the system. And we have a downstream patch
> +               if (!strcmp(scmi_pd->name, "hsio_top"))
> +                       scmi_pd->genpd.flags = 0;
>

There you go, so you simply rushed some solution upstream to carry less
patches downstream but this time you got bitten again. Sorry, but I am
seeing a pattern from you here and I don't really like that.

> So I am wondering to extend the attributes of SCMI spec,
> Saying In SCMI spec(DEN0056E)
> 4.3.2.5 POWER_DOMAIN_ATTRIBUTES
> Page 44 of 210:
> 
> Bit[26]: If set to 1, the power domain could
> wakeup the system with power state
> set as off.
>

This is not what the above flag is all about. It just instructs genpd
to keep the power domain ON as the device attached to it could be a wakeup
source. They are not one and the same. If the device is marked wakeup in
the DT and it is both wakeup capable and is enabled, it shouldn't request
the power domain to be powered off when suspending. Why is that not
sufficient here ? What am I missing ? I am interested in knowing it as
it is important to fix the issue you are trying to address here.

> This is just an idea in my mind, I not
> write code to verify, just wanna to see
> any comments from your side.
> 

I wonder if we need to revert GENPD_FLAG_ACTIVE_WAKEUP flag enabling on
all SCMI power domains if that is not solving the problem you thought it
would.

-- 
Regards,
Sudeep
