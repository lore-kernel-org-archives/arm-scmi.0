Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794852894;
	b=W4ziaTWnSSQ3/P8t1lAiotg9NxyvA+T1DsYvI4hUeww0s3Ws4KZIuMT7ULW2PvmNaec1
	 ru9Hi65daVW1tFE2gtSI01s5o90q3mB11vl7YdY698ZmOiBYihGB7sjtmi5QRpnlb0H+I
	 itmr0Yd0alhv/yDmIt6z5OLJA9GZ9Tg8OZe1riXNb67u7ISfyqmikquHV0Gao5Vq39NiR
	 bkf3ljQv9Ka6dCkbMi0HWJTNadVhEwskIK/IXjj0clyyGTqjIqQLpC46l0vIsZvZEosSR
	 V9TjIRl0houBGFILILuAdEsVv1PP0+9Fp53F0aOdIs1Z3KpcXvtFT8nQ13g3xiwQikg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852894;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=pDsIq9Hj0Z1uudtdxnTWzZt023tFRmK4nYb/lSKU8Jc=;
	b=ec6wQTn24+1YkmA505v1kZRCVL2L0Ijhxf+1k64IqSHP0KqHDOBdkOzbjAzr9PLkDO4j
	 DDjnAAfwPhxDepSy9n+3wG+YZL3QD2twWYLdOsP/gPIW36V752UC56bW/2mOdYRiMXyc/
	 29A0I5UtCufhCdUNUvNFc71GXIebxjEeVtOZ42oiwopDwh1FzZfHpjfHF8cV9+67zbkWV
	 TltFW/BUhFavH3IO9xhQxJ2+UgY2TCQotmSr/KPDg/5XlS3SIlTq5b6iJwFL9wTeYRurw
	 3ncEI9nnWdbxvS13Xil7AABXseSBqiVd4qTZWhqekx0MLsJMreGmWf2aeDpx5q723HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Yv/i2k/k";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4D5606A31C;
	Mon, 16 Nov 2026 18:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yv/i2k/k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94E141F000C4;
	Mon, 16 Nov 2026 18:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794852893;
	bh=pDsIq9Hj0Z1uudtdxnTWzZt023tFRmK4nYb/lSKU8Jc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yv/i2k/k8g3RNz005a766m5TmvJ/WBREV6tP5YrUGzqOECOaLgPdBqL2wOInmQI8M
	 9TJTbOzMiC1ZHhzaR/O+gIwuIov5o9pore6zuchZJGRWN3FpsIP3TjY0e4Cx5KNRZE
	 oXwZj9oU2mwaNBJGSgmszH4/QJqHP8h9kgn45oJPQ9HIR4EazbUkoWkRwtnoHGms97
	 Zpv053OurUMNSAi9JgJi2H41aUZitkZ87dkaS6UW9xOYyOtnuntQg5izG6wOermK62
	 ldRFRI/7YmX6i+VI8N3A1PZKrMRfO5PpcUYoFjEgIwBKldiLqUW0alm0FDUVGJPMGK
	 U2Wb8ddNmjnaw==
Date: Mon, 16 Nov 2026 18:14:50 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, philip.radford@arm.com,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 2/2] firmware: arm_scmi: Fix SCMI Power Control driver
 removal
Message-ID: <20261116-merry-hypersonic-skink-91109c@sudeepholla>
References: <20261116084211.3066460-1-cristian.marussi@arm.com>
 <20261116084211.3066460-3-cristian.marussi@arm.com>
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
In-Reply-To: <20261116084211.3066460-3-cristian.marussi@arm.com>

On Mon, Nov 16, 2026 at 08:42:11AM +0000, Cristian Marussi wrote:
> Once a reboot is initiated following a graceful shutdown request received
> from the SCMI platform server there are a couple of registered notifiers
> and possibly a scheduled delayed work.
> 
> Take care to properly stop, unregister and cleanup all such resources
> when the driver is unbound.
> 
> Fixes: 2c4b97fee94a ("firmware: arm_scmi: Add SCMI System Power Control driver")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-dbe4eba7-1520-40a1-92e8-8892b6e47c4b
> Tested-by: Cristian Marussi <cristian.marussi@arm.com>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
>  .../firmware/arm_scmi/scmi_power_control.c    | 76 +++++++++++++++++--
>  1 file changed, 70 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/scmi_power_control.c b/drivers/firmware/arm_scmi/scmi_power_control.c
> index e0680e33180e..b0a10fd92fa6 100644
> --- a/drivers/firmware/arm_scmi/scmi_power_control.c
> +++ b/drivers/firmware/arm_scmi/scmi_power_control.c

[...]

> @@ -296,6 +310,10 @@ static int scmi_userspace_notifier(struct notifier_block *nb,
>  	struct scmi_system_power_state_notifier_report *er = data;
>  	struct scmi_syspower_conf *sc = userspace_nb_to_sconf(nb);
>  
> +	guard(srcu)(&sc->dead_srcu);
> +	if (READ_ONCE(sc->dead))
> +		return NOTIFY_DONE;
> +
>  	if (er->system_state >= SCMI_SYSTEM_MAX ||
>  	    er->system_state == SCMI_SYSTEM_POWERUP) {
>  		dev_err(sc->dev, "Ignoring unsupported system_state: 0x%X\n",
> @@ -357,6 +375,10 @@ static int scmi_syspower_probe(struct scmi_device *sdev)
>  	if (!sc)
>  		return -ENOMEM;
>  
> +	ret = init_srcu_struct(&sc->dead_srcu);
> +	if (ret)
> +		return ret;
> +
>  	sc->state = SCMI_SYSPOWER_IDLE;
>  	mutex_init(&sc->state_mtx);
>  	sc->required_transition = SCMI_SYSTEM_MAX;
> @@ -364,12 +386,53 @@ static int scmi_syspower_probe(struct scmi_device *sdev)
>  	sc->dev = &sdev->dev;
>  	dev_set_drvdata(&sdev->dev, sc);
>  
> +	INIT_DELAYED_WORK(&sc->forceful_work, scmi_forceful_work_func);
>  	INIT_WORK(&sc->suspend_work, scmi_suspend_work_func);
>  
> -	return handle->notify_ops->devm_event_notifier_register(sdev,
> -							   SCMI_PROTOCOL_SYSTEM,
> -					 SCMI_EVENT_SYSTEM_POWER_STATE_NOTIFIER,
> -						       NULL, &sc->userspace_nb);
> +	ret = handle->notify_ops->event_notifier_register(handle, SCMI_PROTOCOL_SYSTEM,
> +							  SCMI_EVENT_SYSTEM_POWER_STATE_NOTIFIER,
> +							  NULL, &sc->userspace_nb);
> +	if (ret) {
> +		cleanup_srcu_struct(&sc->dead_srcu);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void scmi_syspower_remove(struct scmi_device *sdev)
> +{
> +	struct scmi_handle *handle = sdev->handle;
> +	struct scmi_syspower_conf *sc;
> +	int ret;
> +
> +	sc = dev_get_drvdata(&sdev->dev);
> +	if (!sc)
> +		return;
> +
> +	/* Wait for any notifier to complete and inhibit further processing */
> +	WRITE_ONCE(sc->dead, true);
> +	synchronize_srcu(&sc->dead_srcu);
> +
> +	/*
> +	 * Once here any possible in-flight userspace or reboot notifier
> +	 * will have completed and further notifiers will bailout immediately.
> +	 * Cancel any work which was possibly already scheduled.
> +	 */
> +	cancel_delayed_work_sync(&sc->forceful_work);
> +

To keep it symmetric with probe, do we need cancelling of suspend_work as
well here ?

> +
> +	/* Unregister reboot notifier...if any */
> +	unregister_reboot_notifier(&sc->reboot_nb);
> +
> +	/* Unregister userspace notifier */
> +	ret = handle->notify_ops->event_notifier_unregister(handle,
> +							    SCMI_PROTOCOL_SYSTEM,
> +							    SCMI_EVENT_SYSTEM_POWER_STATE_NOTIFIER,
> +							    NULL, &sc->userspace_nb);

Just wondering if it is better to stop receiving notifications from firmware
first and then cancel any pending work ? Basically reverse order of probe
for remove.

-- 
Regards,
Sudeep
