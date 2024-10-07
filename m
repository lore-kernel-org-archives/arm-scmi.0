Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4811E14AD17
	for <arm-scmi@vger.kernel.org>; Mon,  7 Oct 2024 13:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728306652; cv=none; b=eOOJxrjdHZr+81CF21wS9sdeZrqN8oPYBSfXPHOhhSao4Ey4tSgsw1HZi0YgxL896wm2naMFvEIdMQ+e8IsnSzYU7vSubxE72ocTcpD15MV8B1kxe0XXM5tnnTXb9I9VtNAFFdbDTSaQa59u+0GYE4Lnl5mcKMgmsBDjJh0DFE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728306652; c=relaxed/simple;
	bh=w6i+swf0ptm0huYw19HGkFVn5jQu2pBo3oDKGZfBZes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h8tX39o66lADTXUmzTxhKGQjmORmmBTomiarCsYFpHRkIKRZGUamDAk88Wvw4GeBd9C9rfCXQAGMz+F1kisp4iRCrRb2OXm5NWw0hkbmyZQTk4RfZPPkwm3+TNQTkLRSWaD2BVVz3nShxRc4lHYymwfIUsz9Fzp/+llvOszKsQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E512DA7;
	Mon,  7 Oct 2024 06:11:18 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6496A3F640;
	Mon,  7 Oct 2024 06:10:47 -0700 (PDT)
Date: Mon, 7 Oct 2024 14:10:45 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Justin Chen <justin.chen@broadcom.com>, arm-scmi@vger.kernel.org,
	cristian.marussi@arm.com, linux-arm-kernel@lists.infradead.org,
	peng.fan@nxp.com, bcm-kernel-feedback-list@broadcom.com,
	florian.fainelli@broadcom.com
Subject: Re: [PATCH] firmware: arm_scmi: Queue in scmi layer for mailbox
 implementation
Message-ID: <ZwPd1Z2jl0A46hEU@pluto>
References: <20241004221257.2888603-1-justin.chen@broadcom.com>
 <ZwPcSmRpTGrCdt6I@bogus>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZwPcSmRpTGrCdt6I@bogus>

On Mon, Oct 07, 2024 at 02:04:10PM +0100, Sudeep Holla wrote:
> On Fri, Oct 04, 2024 at 03:12:57PM -0700, Justin Chen wrote:
> > The mailbox layer has its own queue. However this confuses the per
> > message timeouts since the clock starts ticking the moment the messages
> > get queued up. So all messages in the queue have there timeout clocks
> > ticking instead of only the message inflight. To fix this, lets move the
> > queue back into the SCMI layer.
> >
> 
> I think this has come up in the past. We have avoided adding addition
> locking here as the mailbox layer takes care of it. Has anything changed
> recently ?

I asked for an explanation in my reply (we crossed each other mails probably)
since it alredy came up in the past a few times and central locking seemed not
to be needed...here the difference is about the reason...Justin talks about
message timeouts related to the queueing process..so I asked to better
explain the detail (and the anbomaly observed) since it still does not
seem to me that even in this case the lock is needed....anyway I can
definitely be woring of course :D

Thanks,
Cristian
