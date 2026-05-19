Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243E3421F11
	for <arm-scmi@vger.kernel.org>; Tue, 19 May 2026 09:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779183631; cv=none; b=c1d3HUBA+YT2YPiwHDjOQt5p6Q9avFlGlgI3o+bAMYjpNDTJfbZHa8x2IuahPGx+JX4H0NkxY0tkWFlsr6Aa+gC8fLKlUidtqbbQBb8pQ96IBRiw3MkU2f2VyUs43XE4qWSew5dheISY4FDyJshn6u9mrAMChm8myFm7S4QoFUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779183631; c=relaxed/simple;
	bh=1EEkTBJ2/vsJloKiamHl8dU2H8n6mbJKFZttg7Q3C50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J4t5RdlYxG9h/nyvFUO7sozFYtZxJp3lVWdrDHsVrX/dCmvvy2D/zq/UPhFYxeqL4Sa1hXUrdPo/elO9LqX2ne7Z4Nz4NtbD6Wlw8YEEiEMmKXu3Yh+9bOb6lu13250lL2tIacTBOAsQmh99cx9/IhaWweFlBid5Ovwvn0rIPW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nXuvZA0u; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nXuvZA0u"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52A3B1CE0;
	Tue, 19 May 2026 02:40:23 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AFFD03F632;
	Tue, 19 May 2026 02:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779183628; bh=1EEkTBJ2/vsJloKiamHl8dU2H8n6mbJKFZttg7Q3C50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nXuvZA0uDqawDEOb5EaXbgJaaJ3V8IDCO7Kauoys/FRL/PhPm7xUH3OOZgyw0DcVu
	 ovtFe0nUmSAveFCaoDxuGYOgu8LPY3DXOruyxPgXn+ci1jzvmjmXjzYeQR+Ufi+jsJ
	 jIUSe8XKwttgnVZreXZltxjoextS4UERkHWWwKKQ=
Date: Tue, 19 May 2026 10:40:24 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/4] firmware: arm_scmi: Validate SENSOR_UPDATE payload
 size
Message-ID: <agwwCJ5_cL-Ip-xm@pluto>
References: <20260517-scmi_fixes-v1-0-d86daec4defd@kernel.org>
 <20260517-scmi_fixes-v1-3-d86daec4defd@kernel.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517-scmi_fixes-v1-3-d86daec4defd@kernel.org>

On Sun, May 17, 2026 at 08:02:42PM +0100, Sudeep Holla wrote:
> SENSOR_UPDATE carries one or more sensor readings after the fixed
> notification header. The parser derives the expected reading count
> from the sensor description, but it did not verify that the received
> payload contains those entries before parsing them.
> 
> Reject truncated update notifications before reading the variable
> array.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> ---
>  drivers/firmware/arm_scmi/sensors.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/arm_scmi/sensors.c b/drivers/firmware/arm_scmi/sensors.c
> index 836c294a9f42..b14bb1146356 100644
> --- a/drivers/firmware/arm_scmi/sensors.c
> +++ b/drivers/firmware/arm_scmi/sensors.c
> @@ -1072,12 +1072,15 @@ scmi_sensor_fill_custom_report(const struct scmi_protocol_handle *ph,
>  	case SCMI_EVENT_SENSOR_UPDATE:
>  	{
>  		int i;
> +		size_t expected_sz;
>  		struct scmi_sensor_info *s;
>  		const struct scmi_sensor_update_notify_payld *p = payld;
>  		struct scmi_sensor_update_report *r = report;
>  		struct sensors_info *sinfo = ph->get_priv(ph);
>  
> -		/* payld_sz is variable for this event */
> +		if (payld_sz < sizeof(*p))
> +			break;
> +
>  		r->sensor_id = le32_to_cpu(p->sensor_id);
>  		if (r->sensor_id >= sinfo->num_sensors)
>  			break;
> @@ -1091,6 +1094,11 @@ scmi_sensor_fill_custom_report(const struct scmi_protocol_handle *ph,
>  		 * readings defined for this sensor or 1 for scalar sensors.
>  		 */
>  		r->readings_count = s->num_axis ?: 1;
> +		expected_sz = sizeof(*p) + r->readings_count *
> +			      sizeof(p->readings[0]);
> +		if (payld_sz < expected_sz)
> +			break;
> +

LGTM.
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian
