Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8838217557
	for <arm-scmi@vger.kernel.org>; Sun, 13 Oct 2024 09:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728811626; cv=none; b=czUhsRD1MulLhfurxMu/UUAQTjLZlKTPwLfqBc8LUABI5rb5n2gUPzCPkiXgsWVc7dvwcw9JQoUNTIH3O5S074Llfx1eLqwAtzdKGpFKSJpss51z8PScbYL3SU6neXI0a/5SPS3i2C21tnyO4Gt5NENZazusks9+xGb3AUQCT/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728811626; c=relaxed/simple;
	bh=k19qcRnPaWutfVI8pS7Tl4MxObx/8lbruehShFoYdE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gCl4zLPlDoPTnopLx0DzQTwKY69GfejqcdwqGLuhvTrHKNLt6b5uuiozrjhu+hHVMMya4nQ/oO6K+p8CjBKb56DBKX8XR5s0fhFS3v1PRvzPuey/ItBeHHV+mBsR143l6J2PdL4uVo/WNiZOU1+PEpiqB2uNkybj5lL9NN3myS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 069201007;
	Sun, 13 Oct 2024 02:27:32 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2572E3F5A1;
	Sun, 13 Oct 2024 02:27:01 -0700 (PDT)
Date: Sun, 13 Oct 2024 10:26:49 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Justin Chen <justin.chen@broadcom.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	sudeep.holla@arm.com, linux-arm-kernel@lists.infradead.org,
	peng.fan@nxp.com, bcm-kernel-feedback-list@broadcom.com,
	florian.fainelli@broadcom.com
Subject: Re: [PATCH v2] firmware: arm_scmi: Queue in scmi layer for mailbox
 implementation
Message-ID: <ZwuSTVFYAhwD2KYf@pluto>
References: <20241009192637.1090238-1-justin.chen@broadcom.com>
 <ZwkrVQOVJpUvhW4g@pluto>
 <50f4d2d6-dead-4053-834f-134d2df0d6bd@broadcom.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50f4d2d6-dead-4053-834f-134d2df0d6bd@broadcom.com>

On Fri, Oct 11, 2024 at 12:15:07PM -0700, Justin Chen wrote:
> 
> 
> On 10/11/24 6:43 AM, Cristian Marussi wrote:
> > On Wed, Oct 09, 2024 at 12:26:37PM -0700, Justin Chen wrote:
> > > send_message() does not block in the MBOX implementation. This is
> > > because the mailbox layer has its own queue. However, this confuses
> > > the per xfer timeouts as they all start their timeout ticks in
> > > parallel.
> > > 
> > > Consider a case where the xfer timeout is 30ms and a SCMI transaction
> > > takes 25ms.
> > > 
> > > 0ms: Message #0 is queued in mailbox layer and sent out, then sits
> > > at scmi_wait_for_message_response() with a timeout of 30ms
> > > 1ms: Message #1 is queued in mailbox layer but not sent out yet.
> > > Since send_message() doesn't block, it also sits at
> > > scmi_wait_for_message_response() with a timeout of 30ms
> > > ...
> > > 25ms: Message #0 is completed, txdone is called and Message #1 is
> > > sent out
> > > 31ms: Message #1 times out since the count started at 1ms. Even
> > > though it has only been inflight for 6ms.
> > > 
> > > Fixes: b53515fa177c ("firmware: arm_scmi: Make MBOX transport a standalone driver")
> > > Signed-off-by: Justin Chen <justin.chen@broadcom.com>
> > > ---
> > > 
> > > Changes in v2:
> > 
> > Hi Justin,
> > 
> > thanks.
> > 
> > A few nitpicks and one remark down below.
> > 
> > > 
> > > - Added Fixes tag
> > > - Improved commit message to better capture the issue
> > > 
> > >   .../firmware/arm_scmi/transports/mailbox.c    | 21 +++++++++++++------
> > >   1 file changed, 15 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
> > > index 1a754dee24f7..30bc2865582f 100644
> > > --- a/drivers/firmware/arm_scmi/transports/mailbox.c
> > > +++ b/drivers/firmware/arm_scmi/transports/mailbox.c
> > > @@ -33,6 +33,7 @@ struct scmi_mailbox {
> > >   	struct mbox_chan *chan_platform_receiver;
> > >   	struct scmi_chan_info *cinfo;
> > >   	struct scmi_shared_mem __iomem *shmem;
> > > +	struct mutex chan_lock;
> > 
> > Missing Doxygen comment....
> > 
> > arm_scmi/transports/mailbox.c:39: warning: Function parameter or struct member 'chan_lock' not described in 'scmi_mailbox
> > 
> > >   };
> > >   #define client_to_scmi_mailbox(c) container_of(c, struct scmi_mailbox, cl)
> > > @@ -205,6 +206,7 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
> > >   	cl->rx_callback = rx_callback;
> > >   	cl->tx_block = false;
> > >   	cl->knows_txdone = tx;
> > > +	mutex_init(&smbox->chan_lock);
> > 
> > This could be move at the end of this function after the channels are
> > requested and it is no more possible to fail and bail out....messages
> > wont flow and lock wont be used anyway until this chan_setup completes...
> > ...BUT I have NOT string opinion about this....you can leave it here
> > too...up to you
> > >   	smbox->chan = mbox_request_channel(cl, tx ? 0 : p2a_chan);
> > >   	if (IS_ERR(smbox->chan)) {
> > > @@ -267,11 +269,21 @@ static int mailbox_send_message(struct scmi_chan_info *cinfo,
> > >   	struct scmi_mailbox *smbox = cinfo->transport_info;
> > >   	int ret;
> > > +	/*
> > > +	 * The mailbox layer has it's own queue. However the mailbox queue confuses
> >   				  its own queue
> > 
> > > +	 * the per message SCMI timeouts since the clock starts when the message is
> > > +	 * submitted into the mailbox queue. So when multiple messages are queued up
> > > +	 * the clock starts on all messages instead of only the one inflight.
> > > +	 */
> > > +	mutex_lock(&smbox->chan_lock);
> > > +
> > >   	ret = mbox_send_message(smbox->chan, xfer);
> > >   	/* mbox_send_message returns non-negative value on success, so reset */
> > >   	if (ret > 0)
> > >   		ret = 0;
> > > +	else
> > > +		mutex_unlock(&smbox->chan_lock);
> > 
> > I think this should be
> > 
> > 	else if (ret < 0)
> > 		mutex_unlock(&smbox->chan_lock);
> > 
> > ...since looking at mbox_send_message() and its implementation it returns
> > NON-Negative integers on Success...so 0 from mbox_send_mmessage() also means
> > SUCCESS and we should not release the mutex (I think the 'ret' returned
> > here is the idx from add_to_rbuf...so it will become zero peridiocally
> > on normal successfull operation)
> > 
> 
> Yes, I see the implementation. Looks like it returns the position in the
> ring buffer. I also confirmed with CONFIG_DEBUG_MUTEXES which triggers a
> warning.
> 
> What about this?
> if (ret >= 0)
> 	ret = 0
> else
> 	mutex_unlock(&smbox->chan_lock);
> 
> A bit easier to read IMO.

Oh yes much better definitely...or, maybe, even more simply to read:

 ...

  mutex_lock(&smbox->chan_lock);
  ret = mbox_send_message(smbox->chan, xfer);
  if (ret < 0) {
 	mutex_unlock(&smbox->chan_lock);
        return ret;
  }

  return 0;
}

.... up to You...not sure what Sudeep prefers...

Thanks,
Cristian
