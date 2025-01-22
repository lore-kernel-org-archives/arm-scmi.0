Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F725212B1A
	for <arm-scmi@vger.kernel.org>; Wed, 22 Jan 2025 12:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737548068; cv=none; b=Wf6jhZYnOaPCYxzK5wnZgRNUAh6Ewbe0p9mupgshTxF+faXm8WIMDh4ld7huF8S24yxsOmNtJdCS/hFj79U+8y9ibA12x8Bk/mxcfnosk31yVRb9qtn9Qo9c+pXHN+afbdAhv0/B9Kj/BGv2xmtiMS+OHoRm8JGbrsrTpAq86Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737548068; c=relaxed/simple;
	bh=8bDNFcP1fWq8S/nVG5SKs4jvU4KPF+S/Menl8yTgoLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NwNIUPBdvQdIryFhEqTMReXSXfx37Nx+XgFdAHN4/gbGqUQIn6CecUYssjv3BzAfEU5yGNWBbIG6zthDONtZ9DEJAJZZ2V0S+yeBC280VesNaaUq3Xdw9z1mB+Qq3YJTQNAQ4hJDvboXYfSUBVGhLqZGEc+sLg3wYDW74D5AEMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F05F51007;
	Wed, 22 Jan 2025 04:14:53 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9151E3F738;
	Wed, 22 Jan 2025 04:14:24 -0800 (PST)
Date: Wed, 22 Jan 2025 12:14:11 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Radu Rendec <rrendec@redhat.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [RFC PATCH] firmware: arm_scmi: Support mailbox transports with
 no completion IRQ
Message-ID: <Z5DhE3-SGOP9O4NZ@pluto>
References: <20250120212418.889385-1-rrendec@redhat.com>
 <Z497vnIasuJbVarg@pluto>
 <5806bbd198bc4361a41e06a02f93a157bd8eb7e8.camel@redhat.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5806bbd198bc4361a41e06a02f93a157bd8eb7e8.camel@redhat.com>

On Tue, Jan 21, 2025 at 09:19:37PM -0500, Radu Rendec wrote:
> Hi Cristian,
> 

Hi,

> On Tue, 2025-01-21 at 10:49 +0000, Cristian Marussi wrote:
> > mmm...I dont think you can do this....it is a bit tricky to explain BUT
> > the optional txdone_irq in the mailbox subsystem is NOT a completion
> > interrupt as intended in the SCMI world, I'll try to explain why in the
> > following.

[snip]

> > Sorry for the not so short mail :P ... but if I am missing something
> > and you are seeing anomalies, please let us know.
> 
> No need to apologize, and many thanks for taking the time to explain
> everything in such detail. Much appreciated! What you explained makes
> perfect sense, and now I clearly understand why the changes I proposed
> would not work.
> 
> I have quite the opposite problem. I'm using a mailbox controller that
> does *not* provide a txACK interrupt (or any kind of interrupt for that
> matter), and the problem is that SCMI transfers do not complete because
> scmi_wait_for_reply() times out.
> 

Do you mean a unidirectional mailbox controller (like ARM MHUv3) that
allow for bidirectionality ONLY if you effectively use a pair of them,
one for each direction ?

> I tracked this down to xfer->hdr.poll_completion being false, and
> therefore scmi_wait_for_reply() taking the second branch, where it
> calls wait_for_completion_timeout(). Looking at do_xfer(),
> xfer->hdr.poll_completion is set to true if is_polling_enabled()
> returns true, and one of the conditions for this to happen is that the
> no_completion_irq flag in struct scmi_chan_info is set to true. But it
> defaults to false, and in my case there is nothing there to set it to
> true. This is what led me to the RFC patch I sent.
> 
> Even if now that you explained it I understand why the txACK interrupt
> is different from the SCMI message having been processed and replied, I
> still fail to understand how it's all supposed to work for the mailbox
> transport case where the completion IRQ (which you said was optional)
> is indeed *not* implemented.
> 

Well...the answer here is easy...it is not supposed to work :P

...I introduced no_completion_irq to centralize message handling into the
SCMI core instead to leave it to the individual transports, BUT we did
that because it was needed by the SMC transport which originally had NO
completion IRQs by default, but that, later, was evolved to have an
optionally defined completion IRQ too.
You'll see that the no_completion_irq flag is set there based on the
actual DT description (or lack there of)

On the other side, mailbox HW (that we had at least) originally were
just bidirectional in nature (like ARM MHUv1 MHUv2) and only recently
with ARM MHUv3 we had to support unidirectional HW, BUT, again, in our
setup the unidirectional MHUv3 mboxes HW were anyway used in pair, so
as to achieve bidirectionality in any case, so again the case of
no_completion_irq on mailboxes was still not needed.

> Since xfer->hdr.poll_completion defaults to false, I looked at what
> could trigger the completion that scmi_wait_for_reply() waits on, in
> the case of a mailbox transport. The way it's set up is quite
> convoluted but if I'm reading the code correctly:
>  * core->rx_callback (in mailbox.c) is set to scmi_rx_callback()
>  * chan->cl->rx_callback is set to rx_callback() (in mailbox.c)
> Therefore, the (reverse) call path leading to completion would be:
> complete(&xfer->done)
> scmi_handle_response()
> scmi_rx_callback()
> rx_callback()
> mbox_chan_received_data()
> 
> If I understand correctly, mbox_chan_received_data() is supposed to be
> called by the mailbox provider driver when the mailbox receives data
> e.g. the SCMI server rings the bell to indicate completion. But doesn't
> this mean that the completion notification (through mailbox doorbell)
> is expected to be implemented by default?

Nope because when the SCMI client requires a polling transaction, beside
the busy-looping on the channel BUSY bit on its side, it will also ask
for a polling transaction by setting the proper bit in the channel flags
(as detailed in spec chap 5.1) of the shmem area, so that the server will
know that the completion IRQ, even if existing is NOT required for that
transaction: in any case, polling or not, the server will clear the channel
BUSY bit when it is done, since that is the mechanism that is used by the
client and server to pass back and forth the 'ownership' of the channel.
[BIG RED WARNING: I never remember if the channel bit I blabbed about
above is defined as a BUSY bit or as a FREE bit....so the logic could be
reversed.]

The above backtrace is only for the IRQ path...if you are polling, you
are indeed busy looping inside scmi_wait_for_reply() and if you dont get
a timeout (or an out of order invalid reply) the reply if picked up at
the end of the poll loop by a fetch_reponse() inside that same
wait_for_reply....since polling anyway is meant to pick up Delayed
Responses OR notification that does on the P2A channel (RX in the SCMI
stack) which needs to have an associated IRQ to work at all.

Beside your scenario of a system lacking a completion IRQ, polling
transactions can be asked for a speficic SCMI command at will like to
issue a clock_enable(), so polling is generally working as far as I know
and tested....you can easily test that also by just enaboing
force_polling flag in the transport desc (for testing/debug purposes
only)

> 
> Now I get that the mailbox layer has no knowledge of the client layer
> (SCMI in this case) and that the txACK IRQ in the mailbox layer is not
> meaningful or useful to the SCMI layer. But in my (uneducated) opinion,
> there should still be a way to set the no_completion_irq flag in struct
> scmi_chan_info to true for the mailbox transport, for the case when the
> SCMI server does not implement the completion notification. Perhaps
> through the device tree?

As I said, the flag is NOT settable, since it was a scenario that was
never needed....but you are right.. you will have to somehow set that
flag to handle this kind of setup.

Now, I was hoping to be able to somehow handle this with the existing
bindings, because if you look at 'mboxes' definition in:

  Documentation/devicetree/bindings/firmware/arm,scmi.yaml

..you will see that we try to handle all the possible combinations of
mailbox controller types implicitly by deducing the kind of controller
by the combination of the number of defined shmem/mbox. (this is because
unfortunately we cannot rely on naming for backward compatibility issue
since mbox names was NOT required prop from the start).

So, I would have loved to be able to deduce in mailbox_chan_setup() that
in a specific configuration there is no completion interrupt and set
accordingly the no_completion_irq flag using the existing bindings....

...but seems to me that it is not possible since there is the assumption
that unidirectional mailbox are always used in pair to provide a completion
IRQ....and we run out of possibilities to exploit this implicit info
(again because we address the most common case with the current bindings)

At the end, yes I think we should be able to describe this particular HW
configuration somehow, so a new binding could be the answer, since this
is exactly HW description, the tricky part would be to add something
that can cope well with all the above existing implict combinations
(maybe is not a great issue eh .... I have not though about it...)

...BUT...before all of this, just to be paranoid, I would check to make
sure that your HW is really unidirectional in nature and not that, instead,
is a bidirectional mailbox controller, where the SCMI server is really not
taking care to ring the doorbell back ? (which usually is the same
doorbell used in the client->server direction)

(I ignore which server implementation you use...so just to make sure...)

> 
> Now it's my turn to apologize for a long email :) Hopefully it makes
> sense and it's clear now what problem I'm trying to solve. Thanks again
> for all the input provided so far, and I'm looking forward to some more
> answers.
> 

... better stop apologizing here and now, given the average payload size
of these recent mail exchanges :P

Thanks,
Cristian
