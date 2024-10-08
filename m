Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F44317C7C9
	for <arm-scmi@vger.kernel.org>; Tue,  8 Oct 2024 13:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728394656; cv=none; b=sbNsT0z1jkQeCMdmJIXtwJ1ElH5tmRN30w/2azvXEkMNcQdPrhqX6ktpCZ5N+gi/ZfRYvdp22uvYuUeD0DWNY5E57Lq2mkryEoKEpg/zmwdhmBk0d01V7k1Ng3ExEYLK7k2BbeE9JpRBr1I0LpS8SgNd3nrDmPvKRDC3yDklTIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728394656; c=relaxed/simple;
	bh=cOj0ZRDzOHWNS1vK4td8fh95tAs6huDTPGa2ZIAqD8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PplPR02fxICh3SRKWMfOZqBR4MRGfQFZ8+QzeLYshpKV/DXxXDtEdBtrXAMxqy3vAL2o4kQq7wDRnE+VSFXEVs2HrH9oomuGyFWSi3yeErdOIi59TfjrlL24C/h5GtGW6cxSLwdg2pHl/S+ypBKl/vc5WbYs5Kf2FgJ9/iZf7Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D622DA7;
	Tue,  8 Oct 2024 06:38:04 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 715093F58B;
	Tue,  8 Oct 2024 06:37:33 -0700 (PDT)
Date: Tue, 8 Oct 2024 14:37:31 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Justin Chen <justin.chen@broadcom.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com,
	bcm-kernel-feedback-list@broadcom.com,
	florian.fainelli@broadcom.com
Subject: Re: [PATCH] firmware: arm_scmi: Queue in scmi layer for mailbox
 implementation
Message-ID: <ZwU1m4Uj9uF2bzoE@pluto>
References: <20241004221257.2888603-1-justin.chen@broadcom.com>
 <ZwPcSmRpTGrCdt6I@bogus>
 <ZwPd1Z2jl0A46hEU@pluto>
 <1ad5c4e9-9f98-40ab-afa4-a7939781e8cc@broadcom.com>
 <ZwUhP0SYEXUKpRG-@pluto>
 <ZwUyNCnXmjtVbhai@bogus>
 <ZwU1A_R81_ed4L8o@bogus>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZwU1A_R81_ed4L8o@bogus>

On Tue, Oct 08, 2024 at 02:34:59PM +0100, Sudeep Holla wrote:
> On Tue, Oct 08, 2024 at 02:23:00PM +0100, Sudeep Holla wrote:
> > On Tue, Oct 08, 2024 at 01:10:39PM +0100, Cristian Marussi wrote:
> > > On Mon, Oct 07, 2024 at 10:58:47AM -0700, Justin Chen wrote:
> > > > Thanks for the response. I'll try to elaborate.
> > > > 
> > > > When comparing SMC and mailbox transport, we noticed mailbox transport
> > > > timesout much quicker when under load. Originally we thought this was the
> > > > latency of the mailbox implementation, but after debugging we noticed a
> > > > weird behavior. We saw SMCI transactions timing out before the mailbox even
> > > > transmitted the message.
> > > > 
> > > > This issue lies in the SCMI layer. drivers/firmware/arm_scmi/driver.c
> > > > do_xfer() function.
> > > > 
> > > > The fundamental issue is send_message() blocks for SMC transport, but
> > > > doesn't block for mailbox transport. So if send_message() doesn't block we
> > > > can have multiple messages waiting at scmi_wait_for_message_response().
> > > > 
> > > 
> > > oh...yes...now I can see it...tx_prepare is really never called given
> > > how the mailbox subsystem de-queues messages once at time...so we end up
> > > waiting for a reply to some message that is still to be sent...so the
> > > message inflight is really NOT corrupted because the next remain pending
> > > until the reply in the shmem is read back , BUT the timeout will drift away
> > > if you multiple inflights are pending to be sent...
> > >
> > 
> > Indeed.
> > 
> > > > SMC looks like this
> > > > CPU #0 SCMI message 0 -> calls send_message() then calls
> > > > scmi_wait_for_message_response(), timesout after 30ms.
> > > > CPU #1 SCMI message 1 -> blocks at send_message() waiting for SCMI message 0
> > > > to complete.
> > > > 
> > > > Mailbox looks like this
> > > > CPU #0 SCMI message 0 -> calls send_message(), mailbox layer queues up
> > > > message, mailbox layer sees no message is outgoing and sends it. CPU waits
> > > > at scmi_wait_for_message_response(), timesout after 30ms
> > > > CPU #1 SCMI message 1 -> calls send_message(), mailbox layer queues up
> > > > message, mailbox layer sees message pending, hold message in queue. CPU
> > > > waits at scmi_wait_for_message_response(), timesout after 30ms.
> > > > 
> > > > Lets say if transport takes 25ms. The first message would succeed, the
> > > > second message would timeout after 5ms.
> > > > 
> > > > Hopefully this makes sense.
> > > 
> > > Yes, of course, thanks, for reporting this, and taking time to
> > > explain...
> > > 
> > > ...in general the patch LGTM...I think your patch is good also because it
> > > could be easily backported as a fix....can you add a Fixes tag in your
> > > next version ?
> > >
> > 
> > Are you seeing this issue a lot ? IOW, do we need this to be backported ?
> > 
> > > Also can you explain in more detail the issue and the solution in the commit
> > > message....that will help having it merged as a Fix in stables...
> > >
> > > ...for the future (definitely NOT in this series) we could probably think to
> > > get rid of the sleeping mutex in favour of some other non-sleeping form of
> > > mutual exclusion around the channnel (like in SMC transport) and enable
> > > (optionally) Atomic transmission support AND also review if the shmem
> > > layer busy-waiting in txprepare is anymore needed at all...
> > >
> > 
> > Agreed, if we are locking the channel in SCMI, we can drop the busy-waiting
> > in tx_prepare and the associated details in the comment as this locking
> > voids that. It is better have both the changes in the same patch to indicate
> > the relation between them.
> 
> Actually scratch that last point. The waiting in tx_prepare until the platform
> marks it free for agent to use is still needed. One usecase is when agent/OS
> times out but platform continues to process and eventually releases the shmem.
> Sorry I completely forgot about that.
> 

Yes indeed it is the mechanism that we avoid to reclaim forcibly anyway the shmem
if the transmission times out...and we should keep that to avoid
corruption of newer messages by late replies from the earlier ones that
have timed out.

Thanks,
Cristian
