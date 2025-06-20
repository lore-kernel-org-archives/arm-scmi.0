Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8D61E1C1A
	for <arm-scmi@vger.kernel.org>; Fri, 20 Jun 2025 03:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750391751; cv=none; b=ND4H8lbczQVDHUrVPRt1s871cmo3T8cxhkOqwrqmwr9OmKEPchwTpZQgjNyBayTT1E+cOhPqND8MV33lgeqeafbye0EXffxdWMka1vQs/xpBz09TcfVmgvCWbH8Dflzb7YZ/Xg/zDSy8c8dL8ZZcU77XSxYNP52dvl0lRNa7+3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750391751; c=relaxed/simple;
	bh=LY8ANmPaWU03IOjkEPYoZ2pfuLTEkXi7k0X/MjRp79o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KUiT3Qi4zfSFOvnxiZqV8+ZQHqsEUquglzIQ3GlNp5h8dyZdw/SY0EVvRWyun0eGoDOjgyjnth3HtMkcJntZnP8epvSDbi2TSlb89Ogg+tuT2Ji1/iyH2Si/VnSCfd0DnvYFQizBVw3uHGRPVq4Yrlq6RBahldf9DdZukcY3Vdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ksehFE35; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ksehFE35"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-400fa6eafa9so950638b6e.1
        for <arm-scmi@vger.kernel.org>; Thu, 19 Jun 2025 20:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750391749; x=1750996549; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9ygpRy1yhhvPXt3ON6IStdleo1cb/x/nqaI0QI7Xp8=;
        b=ksehFE35g7scQ7JurvjhwSZTU8uma/OdZHPI3DBSf9M1a79QH+121ek3OaSMjk+j4q
         tHBzAybwosov+2Tr8wrYEpQkU+Gtc8WG5k+H9dmjz9y2ww5iMGbAdtzdc6dnxMN+GePB
         hAZltC5W4dE6XAz/6oSb1KQnN1jh7XhWQJlEis5buX5+tBIvSfE9LWuO1FFS23/GX0HV
         KP7Fa2GZGJoDLSKcO9e+YTetg3USdCLacep35X/XRKRV7GMp1vki4MDYm0c/Xj2ypX7+
         NEcsg0BBN/l/bS8qtl3PdP9zZywuffiXYWc4d5eN70T21dvIeHtnAy3cUHdQTKUagT/9
         3j6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750391749; x=1750996549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q9ygpRy1yhhvPXt3ON6IStdleo1cb/x/nqaI0QI7Xp8=;
        b=uqTLoRkJNRSiK7QMVXTQjcfBtpjfNszphbwdtpGxZV7KgzbHYjwnzMR0nG1cjwqSBk
         65SOmRLQhf1re1kyXUuaKX0Hzja+iANPNwu+fjBMFXKU82wdf+LZUDjAJKnCzjxcopTH
         JwslFLQyMzGuOEj5qcinCXMJK3ZckjWjFxjWOxZxLyxtsylbCSLQqh8XKMBEkc9GfhOT
         EwP/tNg6qs3uQzh5E3SznBrcpGSpofUuEJfGsnTxLCzQORYUhrHjK7zAbYpwNfRYiZPU
         QPRW0d8qfnDHeuLHLrNXJzkXR0GSrn3y15yNqykW2E2DU2bO2EUv2IvOxTl28aNv9p4I
         6+JQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwUZXMW/dGD/1Fz6s9NkP+9cMvsVNgJK2HqRmfBNeJbq7AMoRG0I6qOxbq8tXHbht7WfPxFVHyNA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6UDb0Ja3/7Sxd1UfmWwcI1g9oZr6Ob7qPIjlYwANH31brqWAF
	hK2VVRUfj9Ob45AIXYBVgUWe9qRnyFyf2M7kHeUi4nq0saO/uebbwjyiqZ9Z/nQlHIE=
X-Gm-Gg: ASbGncvl5UCBjkYKrwMmqDSPiRy3m5mBd+yhr8Bursig3Yvf+XCybH58p/lSPqZvgF7
	FvA8KkxaIxW7ZsF6zPJQNZwEX5Wg9v5nIOnuvFo7TuhRgFFYRjMj6VN6sV1pxbIFgrhTC2hHbqn
	pGDxjS/pctGjoRSPRGUAzxsP6YlO5nwD56tgvcvSFuPShGYNKuxbq/KBm1p7fHPEZpYFHq68HZi
	vqZt9AlJgEbvGAYRywMQkEqHkCbYMFnjuhx6rB3b0ibj8BjkA6+qzJ285jmBC/NvFSFAK/W1FXP
	aLAqWrBS5rsDshbBsIR2Vf3X7XgjtyZfPDFsUwJ9ZuE1KCmQKAP+CjPZ26lc5n7CLaHu4Q==
X-Google-Smtp-Source: AGHT+IFpMqMfL10VDeZnAPZWqzBUfFVLrNCqWwvVeY7CBAKdJ4F2IHl6lMhC8ceeQFXXdaQcmdLn7w==
X-Received: by 2002:a05:6808:19a7:b0:406:6d79:49d2 with SMTP id 5614622812f47-40ac6fccb21mr1032511b6e.26.1750391748683;
        Thu, 19 Jun 2025 20:55:48 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:67e2:ece8:b2f5:738f])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a908bc982sm193555a34.0.2025.06.19.20.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 20:55:47 -0700 (PDT)
Date: Fri, 20 Jun 2025 06:55:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>,
	Chuck Cannon <chuck.cannon@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/2] firmware: arm_scmi: bus: Add pm ops
Message-ID: <8a7e6e24-5ab2-434a-ba71-7b1b4f74e9f3@suswa.mountain>
References: <20250620-scmi-pm-v1-0-c2f02cae5122@nxp.com>
 <20250620-scmi-pm-v1-1-c2f02cae5122@nxp.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620-scmi-pm-v1-1-c2f02cae5122@nxp.com>

On Fri, Jun 20, 2025 at 11:37:13AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Take platform_pm_ops as reference. Add pm ops for scmi_bus_type,
> then the scmi devices under scmi bus could have their own hooks for
> suspend, resume function.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/firmware/arm_scmi/bus.c | 45 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> index 1adef03894751dae9bb752b8c7f86e5d01c5d4fd..2d1ef73cb6d39ac611afa5d0008c46515e297b93 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -323,6 +323,50 @@ static struct attribute *scmi_device_attributes_attrs[] = {
>  };
>  ATTRIBUTE_GROUPS(scmi_device_attributes);
>  
> +#ifdef CONFIG_SUSPEND
> +static int scmi_pm_suspend(struct device *dev)
> +{
> +	const struct device_driver *drv = dev->driver;
> +	int ret = 0;
> +
> +	if (!drv)
> +		return 0;
> +
> +	if (drv->pm) {
> +		if (drv->pm->suspend)
> +			ret = drv->pm->suspend(dev);
> +	}
> +
> +	return ret;
> +}

These could be done on one line:

static int scmi_pm_suspend(struct device *dev)
{
	const struct device_driver *drv = dev->driver;

	if (drv && drv->pm && drv->pm->suspend)
		return drv->pm->suspend(dev);

	return 0;
}

regards,
dan carpenter

