Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6F7318DF8B
	for <arm-scmi@vger.kernel.org>; Wed,  9 Oct 2024 08:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728462780; cv=none; b=Op4Slc1h35wWgI15hnDywEtHDBnWc72O0L0tUoZMkRgCGf1HVRtQ3VNh9bMLPpGZiRSkFKEFl1x5lDnTVf+xnG6061TE8BdilRi7+9oYR07G+6uIaBnncVawryxhHICDrHdKBmh27rxhi0ttWNKu4b0WRhhRrHoWNUsbZEom5vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728462780; c=relaxed/simple;
	bh=sk+E1BYmwf+j1l9gJdhVvIxMs/dWHBzGjCZvFtN0lvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mXLD81lnvrcv3JDgpzz41EnYyH5xn4ZJeMUYsPk0nGi4eyJGCO6GV1xzwlZoREW+JPCdwrzhKUCrIbtKPdbkZmdnp16hkRVP+KJoVGzgsjjUsXmbufRcO/XEFZK+43rYDQ8cuGmaaprHbyYt7w4oOFik11acx5l+j/qPrmNPfqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B0EEFEC;
	Wed,  9 Oct 2024 01:33:26 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 432D43F58B;
	Wed,  9 Oct 2024 01:32:55 -0700 (PDT)
Date: Wed, 9 Oct 2024 09:32:42 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Justin Chen <justin.chen@broadcom.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com,
	bcm-kernel-feedback-list@broadcom.com,
	florian.fainelli@broadcom.com
Subject: Re: [PATCH] firmware: arm_scmi: Queue in scmi layer for mailbox
 implementation
Message-ID: <ZwY_nrvxCEkDgN8u@pluto>
References: <20241004221257.2888603-1-justin.chen@broadcom.com>
 <ZwPcSmRpTGrCdt6I@bogus>
 <ZwPd1Z2jl0A46hEU@pluto>
 <1ad5c4e9-9f98-40ab-afa4-a7939781e8cc@broadcom.com>
 <ZwUhP0SYEXUKpRG-@pluto>
 <ZwUyNCnXmjtVbhai@bogus>
 <ZwU1A_R81_ed4L8o@bogus>
 <ZwU1m4Uj9uF2bzoE@pluto>
 <ed8b9825-c655-4712-806e-fee22f30c113@broadcom.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed8b9825-c655-4712-806e-fee22f30c113@broadcom.com>

On Tue, Oct 08, 2024 at 12:23:28PM -0700, Justin Chen wrote:
> 
> 
> On 10/8/24 6:37 AM, Cristian Marussi wrote:
> > On Tue, Oct 08, 2024 at 02:34:59PM +0100, Sudeep Holla wrote:
> > > On Tue, Oct 08, 2024 at 02:23:00PM +0100, Sudeep Holla wrote:
> > > > On Tue, Oct 08, 2024 at 01:10:39PM +0100, Cristian Marussi wrote:
> > > > > On Mon, Oct 07, 2024 at 10:58:47AM -0700, Justin Chen wrote:
> > > > > > Thanks for the response. I'll try to elaborate.
> > > > > > 
> > > > > > When comparing SMC and mailbox transport, we noticed mailbox transport
> > > > > > timesout much quicker when under load. Originally we thought this was the
> > > > > > latency of the mailbox implementation, but after debugging we noticed a
> > > > > > weird behavior. We saw SMCI transactions timing out before the mailbox even
> > > > > > transmitted the message.
> > > > > > 
> > > > > > This issue lies in the SCMI layer. drivers/firmware/arm_scmi/driver.c
> > > > > > do_xfer() function.
> > > > > > 
> > > > > > The fundamental issue is send_message() blocks for SMC transport, but
> > > > > > doesn't block for mailbox transport. So if send_message() doesn't block we
> > > > > > can have multiple messages waiting at scmi_wait_for_message_response().
> > > > > > 
> > > > > 
> > > > > oh...yes...now I can see it...tx_prepare is really never called given
> > > > > how the mailbox subsystem de-queues messages once at time...so we end up
> > > > > waiting for a reply to some message that is still to be sent...so the
> > > > > message inflight is really NOT corrupted because the next remain pending
> > > > > until the reply in the shmem is read back , BUT the timeout will drift away
> > > > > if you multiple inflights are pending to be sent...
> > > > > 
> > > > 
> > > > Indeed.
> > > > 
> > > > > > SMC looks like this
> > > > > > CPU #0 SCMI message 0 -> calls send_message() then calls
> > > > > > scmi_wait_for_message_response(), timesout after 30ms.
> > > > > > CPU #1 SCMI message 1 -> blocks at send_message() waiting for SCMI message 0
> > > > > > to complete.
> > > > > > 
> > > > > > Mailbox looks like this
> > > > > > CPU #0 SCMI message 0 -> calls send_message(), mailbox layer queues up
> > > > > > message, mailbox layer sees no message is outgoing and sends it. CPU waits
> > > > > > at scmi_wait_for_message_response(), timesout after 30ms
> > > > > > CPU #1 SCMI message 1 -> calls send_message(), mailbox layer queues up
> > > > > > message, mailbox layer sees message pending, hold message in queue. CPU
> > > > > > waits at scmi_wait_for_message_response(), timesout after 30ms.
> > > > > > 
> > > > > > Lets say if transport takes 25ms. The first message would succeed, the
> > > > > > second message would timeout after 5ms.
> > > > > > 
> > > > > > Hopefully this makes sense.
> > > > > 
> > > > > Yes, of course, thanks, for reporting this, and taking time to
> > > > > explain...
> > > > > 
> > > > > ...in general the patch LGTM...I think your patch is good also because it
> > > > > could be easily backported as a fix....can you add a Fixes tag in your
> > > > > next version ?
> > > > > 
> > > > 
> > > > Are you seeing this issue a lot ? IOW, do we need this to be backported ?
> > > > 
> 
> I wouldn't say a lot. But we are seeing it with standard use of our devices
> running over an extended amount of time. Yes we would like this backported.
> 
> > > > > Also can you explain in more detail the issue and the solution in the commit
> > > > > message....that will help having it merged as a Fix in stables...
> > > > > 
> > > > > ...for the future (definitely NOT in this series) we could probably think to
> > > > > get rid of the sleeping mutex in favour of some other non-sleeping form of
> > > > > mutual exclusion around the channnel (like in SMC transport) and enable
> > > > > (optionally) Atomic transmission support AND also review if the shmem
> > > > > layer busy-waiting in txprepare is anymore needed at all...
> > > > > 
> > > > 
> > > > Agreed, if we are locking the channel in SCMI, we can drop the busy-waiting
> > > > in tx_prepare and the associated details in the comment as this locking
> > > > voids that. It is better have both the changes in the same patch to indicate
> > > > the relation between them.
> > > 
> > > Actually scratch that last point. The waiting in tx_prepare until the platform
> > > marks it free for agent to use is still needed. One usecase is when agent/OS
> > > times out but platform continues to process and eventually releases the shmem.
> > > Sorry I completely forgot about that.
> > > 
> > 
> > Yes indeed it is the mechanism that we avoid to reclaim forcibly anyway the shmem
> > if the transmission times out...and we should keep that to avoid
> > corruption of newer messages by late replies from the earlier ones that
> > have timed out.
> > 
> 
> Yup. I saw an interesting interaction from this. Since modifying shmem and
> ringing the doorbell are often two different task. The modification of shmem
> can race with processing of timed out messages from the platform. This
> usually leads to an early ACK and spurious interrupt. Mostly harmless. We
> did see lockups when multiple timeouts occur, but it was unclear if this was
> an issue with the SCMI transport layer or our driver/platform.
> 

Are you talking about something similar to this:

https://lore.kernel.org/all/20231220172112.763539-1-cristian.marussi@arm.com/

... reported as a side effect of a spurious IRQ on late timed-out
replies, it should have been fixed with the above commit in v6.8.

Thanks,
Cristian
