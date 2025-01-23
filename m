Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29CF31B4132;
	Thu, 23 Jan 2025 19:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737661748; cv=none; b=MtOj5dpYE19p3KuMVjd4n1qTU+sE4/dOpPxPjTd3FAibtbuS6cfrDgOuY79XByAMFibe5v/sXtrCyXxkdDaEaXdcXBrKHe/NfbSo4hE9bGnzqbditszAK+PxH/kVlj9UvKHiF6wk+m2kVRa2SGxoPistxvZt2ynAQfb5LBx8YII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737661748; c=relaxed/simple;
	bh=Pq3SCiW60th8sF4flbWS3iX/XJ2cM63zOO/bh1PeJVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SUCgcQikegLkMY1m9rvn9cYkybTvzcRBgRuCTsp0LR342uguxtM2RMfAHSjghJZLXu/Map/ZtMyZnD5i2ymlXCIqrHiQN049mthjVs8y4s7Vm8d/GhJ+FDU2bC7SpmN2lYKR6ARjWP7GceIV2KGv3yX31yK4l+ZzfDLlojA4MiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1786A1063;
	Thu, 23 Jan 2025 11:49:32 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4AE1B3F5A1;
	Thu, 23 Jan 2025 11:49:02 -0800 (PST)
Date: Thu, 23 Jan 2025 19:48:53 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: jack21 <jackhuang021@gmail.com>, sudeep.holla@arm.com,
	cristian.marussi@arm.com, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Huangjie <huangjie1663@phytium.com.cn>
Subject: Re: [PATCH] dirvers: scmi: poll again when transfer reach timeout
Message-ID: <Z5KdJa0QOIYIIRv4@pluto>
References: <20250123083323.2363749-1-jackhuang021@gmail.com>
 <f0fbc4cf-21ae-4332-8842-73f0467d16ff@stanley.mountain>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0fbc4cf-21ae-4332-8842-73f0467d16ff@stanley.mountain>

On Thu, Jan 23, 2025 at 01:38:30PM +0300, Dan Carpenter wrote:
> s/dirvers/drivers/
> 
> On Thu, Jan 23, 2025 at 04:33:24PM +0800, jack21 wrote:
> > From: Huangjie <huangjie1663@phytium.com.cn>
> > 
> > spin_until_cond() not really hold a spin lock, possible timeout may occur
> > in preemption kernel when preempted after spin_until_cond().
> > 
> > We check status again when reach timeout is reached to prevent incorrect
> > jugement of timeout.
> > 

Hi,

probably another not so short email of mine :P ... 

> 
> I suspect the real issue is that we exit the spin loop when
> try_wait_for_completion(&xfer->done) is true.  Probably we should add
> that as a Fixes tag?:
> 

The Kernel SCMI stack, acting as an SCMI agent have to cope with the
possible (even though rare) scenario of receiving Out of Order messages
when dealing with async commands...

...IOW, what to do if, after having issued an AsycnCmd, the Delayed response
is received BEFORE the corresponding immediate reply to the initial request:
such a wicked (and rare) situation could be the result of a misbehaving
platform server OR simply due to parallellization of activies on the A2P
and P2A on some transports, i.e. platform sent reply and delayed_response
in the correct order but the transport delivered those OoO, being
transmitted on 2 discinct physical  channels...hard but not impossible.

Kernel side we address this OoO scenario by assuming that, if a valid
Delayed Response to a in-flight Async-cmd is received on teh P2A chan,
before the immediate A2P reply, the transaction itself is good and we
can progress by just logging and ignoring/swallowing the missing
immediate-reply, that will probably arrive later, and just carry on
processing the Delayed Response.

In order to do that, we maintain, in fact, a per-message state-machine,
and inside scmi_msg_response_validate(), when we detect the OoO condition,
we cause the wait-for-immediate-reply to terminate by issuing forcibly a
complete(xfer->done)....

...this works straight away for the non-polled IRQ transactions since
causes the wait_for_completion() to terminate cleanly, BUT in order to
cut-short also the busy-wait in the polling case we need that additional
try_wait_for_completion()....so as not to spin forever for a message
that we dont care anymore...
[ note that any late arriving immediate-reply will be in teh future
 discarded at this point]

For this reason, I think that this patch, while correctly checking the
poll_done() condition when the spinloop terminates for the reason
explained in the commit-message, it should also check if the loop was not
instead forcibly terminated by the OoO scenario...if not, we will end up
considering the polling to have timeout, while instead it was forcibly
terminated by the OoO state machine complete() and just want to ignore
such missing message...

So what about instead of checking (untested):

+	if (!completion_done(&xfer->done) &&
+	    !info->desc->ops->poll_done(cinfo, xfer))

... so that we determine that the polling has timed out only when:

- the immediate-reply has NOT been received [!poll_done()]

 AND

- we were NOT forcibly make to ignore the missing reply in an OoO scenario
    [!completion_done]

NOTE THAT xfer->done on the polling path is ONLY completed in case of OoO.

> Fixes: ed7c04c1fea3 ("firmware: arm_scmi: Handle concurrent and out-of-order messages")
> 
> Btw, the scmi_xfer_done_no_timeout() has a confusing name, because it
> does timeout.  Was the "_no" an accident?
> 

Agreed. Not sure of the history of the bad naming...

Thans,
Cristian
