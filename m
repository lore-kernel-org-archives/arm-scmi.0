Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01534443C18
	for <arm-scmi@vger.kernel.org>; Fri,  2 Oct 2026 19:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790970748; cv=none; b=dCd5nlsafDQEpuGyCq97TyLZIkXsJJvGpLJh95y1F5L5VJKUsz+2k1A7waspToAm2VVWPCr2iba9B4O/AaSj70JMFT8p9ELkRXj0G899qbKjeFvDvuMg3F08Tg0yqrlU2VIiO0ospVL6Ysnz/lXzPJLqMNG6RUjkJwOT8cY4rSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790970748; c=relaxed/simple;
	bh=wg1pPZYojt+XBbkPNEE4cs5V0PX7mIZIb2tv2vEAyg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fw85YTPMtHXxlxZuhsinosXLBBo1V0GQX/nN0FySW5E5sSPaHNsKCiWU5J9pZQH7ojqKsw+v19ewzhZ6sJxgRbRY2rqJWQiXzVp4bqboOytn8rUqMQtglSGaD+dQzBmHq2huQyC7BPJqNRwCJSwttgKBe6x1YWxoVFihPEo9Slk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C5FGk9xU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C5FGk9xU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF61E1F000FF;
	Fri,  2 Oct 2026 19:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790970746;
	bh=ZhmwxDpBRSj9HhWt9UJ3Aq8ee/N0MMmFYzClRQZlLOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C5FGk9xUN12OOygX1akVWiO5ibvOYTdcDTRxOi5lmJsebw4hbHW2LPig2eLDzY3ys
	 GhzxcFvTq2piuk0s8EM++3kbcka/6RcKbkL8M5polq7pdlY9AMSMeL/K6cBHLofz2E
	 7HMwfY5ePdorOiDHDCjGHsMDqDGAz0GeIbt/WASTfJpz6/YNEKq9M0+oI3mjXCWB2R
	 o/0XewQgwN6bduLzxrZNrnqhXDy1Ub0F/m+4P5PEaerAWUN+kcpSiXm1mvJXUGBJB/
	 Ru6/+Y3ixM9wLCxRwCMkbnZh3tm7TVs8TCEzUwVClUAOpk+Lf6FkjmL7IUPo/hPVho
	 n7IeFBsD2vZew==
Date: Fri, 2 Oct 2026 20:52:23 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org
Cc: Peng Fan <peng.fan@oss.nxp.com>, Sudeep Holla <sudeep.holla@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 2/4] firmware: arm_scmi: Skip requests for standard
 protocol devices
Message-ID: <20261002-therapeutic-overjoyed-sawfish-6ad46e@sudeepholla>
References: <20261002-scmi_bus_fixes-v1-0-8695cbab3fe7@kernel.org>
 <20261002-scmi_bus_fixes-v1-2-8695cbab3fe7@kernel.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-scmi_bus_fixes-v1-2-8695cbab3fe7@kernel.org>

On Fri, Oct 02, 2026 at 10:36:31AM +0100, Sudeep Holla wrote:
> The SCMI core creates devices for the standard protocol IDs during
> protocol enumeration, without waiting for an SCMI driver request.
> Recording a request for one of these devices also rejects a second
> driver registering the same protocol/name pair.
> 
> When the first driver unregisters, unrequesting that pair destroys the
> core-created device. No other driver can be bound to it at that point,
> but removing it also removes the device that a later driver could bind
> to or use for module autoloading.
> 
> Skip request tracking for standard devices. Keep request tracking and
> rollback for nonstandard devices unchanged.
> 
> Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Fixes: aac4e67d6eb9 ("firmware: arm_scmi: Always create devices for standard protocols")
> Reported-by: Peng Fan <peng.fan@oss.nxp.com>
> Closes: https://lore.kernel.org/all/20260928-driver-core-v1-1-0846bb8e0f32@nxp.com
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> ---
>  drivers/firmware/arm_scmi/bus.c | 73 +++++++++++++++++++++++------------------
>  1 file changed, 41 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> index f2e2ed56bc32..230ee9f6f1aa 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -186,12 +186,44 @@ static void scmi_protocol_device_unrequest(const struct scmi_device_id *id_table
>  	}
>  }
>  
> +/* Standard protocols table */
> +static const struct scmi_device_id scmi_std_id_table[] = {
> +	{ SCMI_PROTOCOL_POWER, "genpd" },
> +	{ SCMI_PROTOCOL_SYSTEM, "syspower" },
> +	{ SCMI_PROTOCOL_PERF, "perf" },
> +	{ SCMI_PROTOCOL_PERF, "cpufreq" },
> +	{ SCMI_PROTOCOL_CLOCK, "clocks" },
> +	{ SCMI_PROTOCOL_SENSOR, "hwmon" },
> +	{ SCMI_PROTOCOL_SENSOR, "iiodev" },
> +	{ SCMI_PROTOCOL_RESET, "reset" },
> +	{ SCMI_PROTOCOL_VOLTAGE, "regulator" },
> +	{ SCMI_PROTOCOL_POWERCAP, "powercap" },
> +	{ SCMI_PROTOCOL_PINCTRL, "pinctrl" },
> +	{ SCMI_PROTOCOL_PINCTRL, "pinctrl-imx" },

The above line must be deleted, I copied the array as is and forgot to
drop this.

-- 
Regards,
Sudeep
