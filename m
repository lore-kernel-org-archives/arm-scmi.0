Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7686D1DE3C1
	for <arm-scmi@vger.kernel.org>; Tue,  8 Oct 2024 13:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728393427; cv=none; b=DbuDNqmmWozSFeMLMVdMQRx+6ybJNzcYuR+XX42yJdwZIR8ifbarzQtdNU9fS5emy3TWhBS06LY/bocRh9Ev6KpZ4DmbYR4NKhuxekCKAQqJO+6gcCDEqpgwCzVi+17OEfDX0Dw7y0iE4GhDKzN7tc96L68pV7Klh80O3A9Dotk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728393427; c=relaxed/simple;
	bh=lRl6o9PnTSe/AXxVguMryTEt7X+Dyie1+huKwIZYBKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MHpohfq3JXASSJUP4ssrQ1iK6DRdF2RZMDPdjH4wygnH6QvQq6ElLLkql6i/DFVcmfBJswaOIvvpqnszrkK6P9Univt8zktExDbqr4HHudevzJflMJ0VakbVSSE/2rxW8873m68smJbdtu7f8c4SKROLLBoq3PdhQFN/nr4+F/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68DB3FEC;
	Tue,  8 Oct 2024 06:17:34 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.77])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8EAED3F640;
	Tue,  8 Oct 2024 06:17:03 -0700 (PDT)
Date: Tue, 8 Oct 2024 14:17:00 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Justin Chen <justin.chen@broadcom.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com,
	Sudeep Holla <sudeep.holla@arm.com>,
	bcm-kernel-feedback-list@broadcom.com,
	florian.fainelli@broadcom.com
Subject: Re: [PATCH] firmware: arm_scmi: Queue in scmi layer for mailbox
 implementation
Message-ID: <ZwUwzNxT9p3cvF8i@bogus>
References: <20241004221257.2888603-1-justin.chen@broadcom.com>
 <ZwPcSmRpTGrCdt6I@bogus>
 <ZwPd1Z2jl0A46hEU@pluto>
 <1ad5c4e9-9f98-40ab-afa4-a7939781e8cc@broadcom.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ad5c4e9-9f98-40ab-afa4-a7939781e8cc@broadcom.com>

On Mon, Oct 07, 2024 at 10:58:47AM -0700, Justin Chen wrote:
> 
> 
> On 10/7/24 6:10 AM, Cristian Marussi wrote:
> > On Mon, Oct 07, 2024 at 02:04:10PM +0100, Sudeep Holla wrote:
> > > On Fri, Oct 04, 2024 at 03:12:57PM -0700, Justin Chen wrote:
> > > > The mailbox layer has its own queue. However this confuses the per
> > > > message timeouts since the clock starts ticking the moment the messages
> > > > get queued up. So all messages in the queue have there timeout clocks
> > > > ticking instead of only the message inflight. To fix this, lets move the
> > > > queue back into the SCMI layer.
> > > > 
> > > 
> > > I think this has come up in the past. We have avoided adding addition
> > > locking here as the mailbox layer takes care of it. Has anything changed
> > > recently ?
> > 
> > I asked for an explanation in my reply (we crossed each other mails probably)
> > since it alredy came up in the past a few times and central locking seemed not
> > to be needed...here the difference is about the reason...Justin talks about
> > message timeouts related to the queueing process..so I asked to better
> > explain the detail (and the anbomaly observed) since it still does not
> > seem to me that even in this case the lock is needed....anyway I can
> > definitely be woring of course :D
> > 
> 
> Hello Cristian,
> 
> Thanks for the response. I'll try to elaborate.
> 
> When comparing SMC and mailbox transport, we noticed mailbox transport
> timesout much quicker when under load. Originally we thought this was the
> latency of the mailbox implementation, but after debugging we noticed a
> weird behavior. We saw SMCI transactions timing out before the mailbox even
> transmitted the message.
> 
> This issue lies in the SCMI layer. drivers/firmware/arm_scmi/driver.c
> do_xfer() function.
> 
> The fundamental issue is send_message() blocks for SMC transport, but
> doesn't block for mailbox transport. So if send_message() doesn't block we
> can have multiple messages waiting at scmi_wait_for_message_response().
> 
> SMC looks like this
> CPU #0 SCMI message 0 -> calls send_message() then calls
> scmi_wait_for_message_response(), timesout after 30ms.
> CPU #1 SCMI message 1 -> blocks at send_message() waiting for SCMI message 0
> to complete.
> 
> Mailbox looks like this
> CPU #0 SCMI message 0 -> calls send_message(), mailbox layer queues up
> message, mailbox layer sees no message is outgoing and sends it. CPU waits
> at scmi_wait_for_message_response(), timesout after 30ms
> CPU #1 SCMI message 1 -> calls send_message(), mailbox layer queues up
> message, mailbox layer sees message pending, hold message in queue. CPU
> waits at scmi_wait_for_message_response(), timesout after 30ms.
> 
> Lets say if transport takes 25ms. The first message would succeed, the
> second message would timeout after 5ms.
>

I understand this issue and was aware of this. Just had assumed it won't
have such a impact as I was assuming transport to take couple of ms for
any synchronous commands.

Typically I would expect transport to take much less that 25ms(1-4ms IMO)
to complete any synchronous commands. If it takes 25ms for sync command,
then it could be some serious issue.

Anyways I am not against the idea. More details in response to Cristian.

-- 
Regards,
Sudeep
