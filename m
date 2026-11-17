Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915343;
	b=XeAuk7mn1VoNZU7j2HIlGthUPnFSHhVHlP/nNQkUxFpZCwhFadM4OurG/ST+yNIMEXG4
	 y5fpU+D962KUKUkXfrUedb2s+nscg6ET+dnvKZVtGvrGKg3hu7DkeuaQtt+s15wMyqLvm
	 4XhYwqY2kaGH61lHRcGIBHdg75TgrXC2iDrUkJ8MZjflogW0MzxvMwabIzeTyCpyQvFJm
	 aPT8gpnRauV649S8WI/NgYZRI70nbUBqP5Cbv6TeprFoIEONAqnqWjO4KS8zJhtSmETfb
	 iZGTP3Og0RQbNfQspw6lRFYmEL2oIy5FZC4FQ+jeBbpGjnDBR3+Gfy0duj1r8V1qIlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915343;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=CtprQKaqONIzKnq3zmbcyeT6g/iiSQamtXKbLaCRAvI=;
	b=ew2udgZRynZtOVmHYrH5XXx5mvH3eX6wLm2kJL+lLiL2yVrW+RiV2xEDLWNTDQGdlzYS
	 s5E8FsLsjicRG/87kZPdArwEtLVVU9/Fio5VxN0Rq7pHLzPxL4v4bUaVZG49lcegIEqPw
	 U8trd7l7m8Byv+6SGnJ0LIi163EZyWU7NRl3AWdVyeHy7KUR0EhW+4bCLHlN7iJU6OjSX
	 yv1dz4JICUCyFfMHJtS+F1v75rmDTRdXMUGXBjHBooGh5w5N7u6DmBSgF0/ClA65LzrmD
	 q6RHHrQ215wNs2u37Pz1oD9Ey156VOM5vw/0ACfgmpCe+qcqvdJU3696TTUbzkMu+3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=S2uwp4k9;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D2DA606A31C;
	Tue, 17 Nov 2026 11:35:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D2DA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=S2uwp4k9
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E59C31476;
	Tue, 17 Nov 2026 03:35:38 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFEFE3F763;
	Tue, 17 Nov 2026 03:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794915341; bh=xDNOG/RyHuCKgvOys0iXiL5/z7Vv4BoX3RzY0YiL7m0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S2uwp4k98qyIgwXkARUYbiHAOs5X5SkwUUZN+OhkEjF/tW77RLFK6XJQROyuGHO9Z
	 TXNMotIVDGjP/kF2F2qcpG5AYrdGqirGStvdnRPTSTXWmowLxS8fJvLk3uawIokM65
	 kmCAtHN3Z2q9eJh0JBxlcftSTnNFH74gy+817nDc=
Date: Tue, 17 Nov 2026 11:35:38 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, philip.radford@arm.com,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 2/2] firmware: arm_scmi: Fix SCMI Power Control driver
 removal
Message-ID: <avw8CvBXXWNx4YGX@pluto>
References: <20261116084211.3066460-1-cristian.marussi@arm.com>
 <20261116084211.3066460-3-cristian.marussi@arm.com>
 <20261116-merry-hypersonic-skink-91109c@sudeepholla>
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116-merry-hypersonic-skink-91109c@sudeepholla>

On Mon, Nov 16, 2026 at 06:14:50PM +0000, Sudeep Holla wrote:
> On Mon, Nov 16, 2026 at 08:42:11AM +0000, Cristian Marussi wrote:
> > Once a reboot is initiated following a graceful shutdown request received
> > from the SCMI platform server there are a couple of registered notifiers
> > and possibly a scheduled delayed work.
> > 

Hi,

> > Take care to properly stop, unregister and cleanup all such resources
> > when the driver is unbound.
> > 
> > Fixes: 2c4b97fee94a ("firmware: arm_scmi: Add SCMI System Power Control driver")
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Closes: https://sashiko.dev/#/bug/linux-dbe4eba7-1520-40a1-92e8-8892b6e47c4b
> > Tested-by: Cristian Marussi <cristian.marussi@arm.com>
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > ---
> >  .../firmware/arm_scmi/scmi_power_control.c    | 76 +++++++++++++++++--
> >  1 file changed, 70 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/firmware/arm_scmi/scmi_power_control.c b/drivers/firmware/arm_scmi/scmi_power_control.c
> > index e0680e33180e..b0a10fd92fa6 100644
> > --- a/drivers/firmware/arm_scmi/scmi_power_control.c
> > +++ b/drivers/firmware/arm_scmi/scmi_power_control.c
> 
> [...]
> 
> > @@ -296,6 +310,10 @@ static int scmi_userspace_notifier(struct notifier_block *nb,
> >  	struct scmi_system_power_state_notifier_report *er = data;
> >  	struct scmi_syspower_conf *sc = userspace_nb_to_sconf(nb);
> >  
> > +	guard(srcu)(&sc->dead_srcu);
> > +	if (READ_ONCE(sc->dead))
> > +		return NOTIFY_DONE;
> > +
> >  	if (er->system_state >= SCMI_SYSTEM_MAX ||
> >  	    er->system_state == SCMI_SYSTEM_POWERUP) {
> >  		dev_err(sc->dev, "Ignoring unsupported system_state: 0x%X\n",
> > @@ -357,6 +375,10 @@ static int scmi_syspower_probe(struct scmi_device *sdev)
> >  	if (!sc)
> >  		return -ENOMEM;
> >  
> > +	ret = init_srcu_struct(&sc->dead_srcu);
> > +	if (ret)
> > +		return ret;
> > +
> >  	sc->state = SCMI_SYSPOWER_IDLE;
> >  	mutex_init(&sc->state_mtx);
> >  	sc->required_transition = SCMI_SYSTEM_MAX;
> > @@ -364,12 +386,53 @@ static int scmi_syspower_probe(struct scmi_device *sdev)
> >  	sc->dev = &sdev->dev;
> >  	dev_set_drvdata(&sdev->dev, sc);
> >  
> > +	INIT_DELAYED_WORK(&sc->forceful_work, scmi_forceful_work_func);
> >  	INIT_WORK(&sc->suspend_work, scmi_suspend_work_func);
> >  
> > -	return handle->notify_ops->devm_event_notifier_register(sdev,
> > -							   SCMI_PROTOCOL_SYSTEM,
> > -					 SCMI_EVENT_SYSTEM_POWER_STATE_NOTIFIER,
> > -						       NULL, &sc->userspace_nb);
> > +	ret = handle->notify_ops->event_notifier_register(handle, SCMI_PROTOCOL_SYSTEM,
> > +							  SCMI_EVENT_SYSTEM_POWER_STATE_NOTIFIER,
> > +							  NULL, &sc->userspace_nb);
> > +	if (ret) {
> > +		cleanup_srcu_struct(&sc->dead_srcu);
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static void scmi_syspower_remove(struct scmi_device *sdev)
> > +{
> > +	struct scmi_handle *handle = sdev->handle;
> > +	struct scmi_syspower_conf *sc;
> > +	int ret;
> > +
> > +	sc = dev_get_drvdata(&sdev->dev);
> > +	if (!sc)
> > +		return;
> > +
> > +	/* Wait for any notifier to complete and inhibit further processing */
> > +	WRITE_ONCE(sc->dead, true);
> > +	synchronize_srcu(&sc->dead_srcu);
> > +
> > +	/*
> > +	 * Once here any possible in-flight userspace or reboot notifier
> > +	 * will have completed and further notifiers will bailout immediately.
> > +	 * Cancel any work which was possibly already scheduled.
> > +	 */
> > +	cancel_delayed_work_sync(&sc->forceful_work);
> > +
> 
> To keep it symmetric with probe, do we need cancelling of suspend_work as
> well here ?
> 

Yes, I was going to do that in V1, then I decided it was not
needed...without any good reason really O_o...
Sashiko pointed out the same...I'm adding in V2.

> > +
> > +	/* Unregister reboot notifier...if any */
> > +	unregister_reboot_notifier(&sc->reboot_nb);
> > +
> > +	/* Unregister userspace notifier */
> > +	ret = handle->notify_ops->event_notifier_unregister(handle,
> > +							    SCMI_PROTOCOL_SYSTEM,
> > +							    SCMI_EVENT_SYSTEM_POWER_STATE_NOTIFIER,
> > +							    NULL, &sc->userspace_nb);
> 
> Just wondering if it is better to stop receiving notifications from firmware
> first and then cancel any pending work ? Basically reverse order of probe
> for remove.
> 

I think the order is irrelevant given the dead_srcu gating, BUT indeed I
kept this order so as to keep the undo in reverse order: in fact the
probe at first issues some INIT_WORK, but the real schedule_work happens
only later after a notif is received, so the order is:

 - init_srcu
 - static WORK init
 - register SCMI notif callback
 - RX notify msg
 - register reboot notifier
 - schedule delayed work

Also, even if the notifiers are inhibited by dead_srcu, I felt better to
cancel that work as soon as possible.

Thoughts ?

Thanks,
Cristian
