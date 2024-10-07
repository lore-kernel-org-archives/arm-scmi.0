Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B3731E519
	for <arm-scmi@vger.kernel.org>; Mon,  7 Oct 2024 12:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728304503; cv=none; b=AjbROVVW8WCyqMKuOM6RsLsLajNC0AP8zJHyBnVzprYJeWEqqcn9cAMcRdOvX3g4DETyJnSt7+rIkDdHZRaMjwE65eIXAJ02PDEa1ZXe3/xpTS5LHiHthWxhP2DPUG2jqeNzOvupLJZ2cPS7CPL2m/cIuZ+7SnTuWRUPGcmOm1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728304503; c=relaxed/simple;
	bh=GAdVpIUB16I+68fVaJXoJS4gad679vRaIt9QXPhQixo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RLoqHJ5H5zOPWe9DXBkemHaO0TqqvK9GLV+ZVkOyl5TvApQ0xbkbKwQTSo6ALGPhBCpuglY6mwFaL7YJbYACxRGds2H+ziGIKys5c/x5Ee1bYuPLtgjUSBvaBdBZslJoG4dxam9d+XB5vAee9OFnTXMb0jL/i1ScbcY4+L0Su7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E683FEC;
	Mon,  7 Oct 2024 05:35:30 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A59203F640;
	Mon,  7 Oct 2024 05:34:59 -0700 (PDT)
Date: Mon, 7 Oct 2024 13:34:57 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Justin Chen <justin.chen@broadcom.com>
Cc: arm-scmi@vger.kernel.org, cristian.marussi@arm.com,
	sudeep.holla@arm.com, linux-arm-kernel@lists.infradead.org,
	peng.fan@nxp.com, bcm-kernel-feedback-list@broadcom.com,
	florian.fainelli@broadcom.com
Subject: Re: [PATCH] firmware: arm_scmi: Queue in scmi layer for mailbox
 implementation
Message-ID: <ZwPVcWIThkbKr0Ih@pluto>
References: <20241004221257.2888603-1-justin.chen@broadcom.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004221257.2888603-1-justin.chen@broadcom.com>

On Fri, Oct 04, 2024 at 03:12:57PM -0700, Justin Chen wrote:
> The mailbox layer has its own queue. However this confuses the per
> message timeouts since the clock starts ticking the moment the messages
> get queued up. So all messages in the queue have there timeout clocks
> ticking instead of only the message inflight. To fix this, lets move the
> queue back into the SCMI layer.

Hi Justin,

thanks for reporting this, I'll try to understand better in the
following since we always avoided a lock in the mailbox driver (till
now) since it seemed not to be needed due to the interaction and inner
workings of the mailbox subsytem and its queues....so I just want to
understand better...not saying that this patch is wrong by itself for
now...

when you say:

"this confuses the per-message timeouts since the clock starts ticking
the moment the message get queued up."

...you are referring to the core mailbox subsystem queues and the code flow
that derives from mbox_send_message() right ?

So roughly the mailbox subsystem callchain involved would be this:

mbox_send_message()
	add_to_rbuf()
	msg_submit()

Am I right ? Is this the code flow you are referring to m?

In this case I am not sure what you mean with "the timer starts ticking
as soon as the message is queued"...which timer ? ... because:

 - the SCMI mailbox client is registered as "tx_block = false" so the
   sent messages are never waited for with wait_for_completion

and on the other side

 - once we have 1 message in-flight already, the next attempt to send a
   message will result in a call to add_to_rbuf() BUT the following
   msg_submit() will bailout immediately at line 63

	if (!chan->msg_count || chan->active_req)
		goto exit;

   after the first message is queued since there is an active_req
   inflight, and so no more messages will be queued till the next
   tx_tick(), which is invoked only by us from the SCMI stack when the
   reply to the inflight message has been read back. (this also means
   tx_prepare is NOT called until we kick from SCMI MBOX driver with
   mbox_client_txdone()

What I am missing, here ?

Thanks,
Cristian
