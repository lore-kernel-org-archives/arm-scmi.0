Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBCC1C3BF4
	for <arm-scmi@vger.kernel.org>; Mon, 16 Dec 2024 08:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734337867; cv=none; b=kJGdNgCfq8KYsyLYSIUoPMJuFt2ZN9W1bA6UHX1dS9SkncuDjsDomjR5D0E+j4MPNI8Xj9iAP9V2/iH5HIHWr1FHfH69dkUiMtxx8LXMO4PTIzGfI1MoOIb+3MJzBYwp8mUyfF4AfYFJHx9jfJui88GbkCQ8M+4+yAYfd4XqYIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734337867; c=relaxed/simple;
	bh=gdslt6/6o5VN0gbIRVRB2jv5O//cjnwjnRQtzf3jCx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kLHxcyrZBxeMVoZ5Sfo0h66OZ6jUTk7/jdVF7eTSLiWbENjcE4KybpP1oPoqu1p8YFUPJwbKBLjJPIpq3+jhobskdR2wriQdO3ALleg4ZAYxwrNfFMA9fvxScSxeiKci2CC+8Dn8TU070pK91VTxfNtokOwuFX998OO3yjZIqWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DwD+aK9Y; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DwD+aK9Y"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d41848901bso6954371a12.0
        for <arm-scmi@vger.kernel.org>; Mon, 16 Dec 2024 00:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734337864; x=1734942664; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Eg8b6Xt4hTeFaUWaulbB4qSRTysVhEe5TEtb9iz/l9E=;
        b=DwD+aK9YTIuWotsM+qIvPkueCOQ8C4YX5HuoAc+QiMTT61LhbRMx367C/94cRvmhwm
         fqBr7KKMUEl8qPftw/VyZlW7ipxRuA8TwBPd1uHBg4myEA+C7C1arP5HfJ8jYGAIw8t/
         U4HBuvV3qpYdgYmko4VyijUsdC6eBcDP9bCzr7oRFmUA13OlY+Y5Fuk7iugY5BBwdPJe
         RhrE4mYztCQQTEjYI0KYd0paQmQW02uCWwEs/csZl4h+4JYL1KoMeMgiloY5NMMJbHv+
         dGGuDOAEhKWqwJY+vmfdEaA9otw21vMWXCIk9i6nwssNKB3biDrT7nutR1KLJB+QlyRr
         k+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734337864; x=1734942664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eg8b6Xt4hTeFaUWaulbB4qSRTysVhEe5TEtb9iz/l9E=;
        b=STnaSbfFAFXG4252GpSkcx18rmkVTmhyki/jIVS5RrAeyiZRXBoWiGaExTBTmShOJh
         WeUiIo7TmLWfBTMTIM5cmaBjnrPRrD9YDamKJ+Orm+Aa15TTsjtku9SVF3kcFkZqsY9N
         n42EKFneIPTRI4+r9QXLQSJ9t3aWsBPkQ9Y/1qvDIW94+p9PWddrV4PxhB0K5eD40qlQ
         ka98UlyhvmhT2G2SwUSfZHzghLmKU1GkQQk+l3KdxszJYmDhaNXaz3/OEWlqCx2HkNG9
         FA57hari1VdP9xO+wN4OvVAW02N/taPUhhXxyEzRCLz3LQsbf0MGJTwBITtgzs3X5uT8
         uMlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKXgEgd0svpXH8EUSxEnGZlchPgEkJ+rrsZ3NSfiB2rBDnGgfZ8FlNUGpW8c5Jp/5eDmEnzTEhUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfvKPL633sqRqHqKzTEnB1ZPEjRG/vBtSJnsPuuVt/yHluXTBP
	j9PEX/fiIKMZgt7nIeFjU8e47pqvUGToCOkBQEqCpa98SLhit4BW9ey3Da+SNEU=
X-Gm-Gg: ASbGnctiID9wOpSsLjghUxDbINV16IFar4pNoHCGZxdaWOEZ0Pvbc/kWk7F6s2Uk6W9
	a6LqFPHCARhNpSufT9T6P5CivI8o2CwdGz/TzFGRYFIYqXcA06UrS9LlHPWqNKIcEx1n8coj75o
	2E5wtttDka6ylj9dGpX+7uKpCWgOAul0P+o9i16CGGB+bbtoWxQTCS0DxrIvCa9s44+ik/Awfqg
	HzIBwLTCnqfPepLxS3H2MXG4uD4EmASIOhH6XjlYTxVFmGkmLC4FhwGE4utJQ==
X-Google-Smtp-Source: AGHT+IGNDvyG/JdW7IDGZpKsOjZ/Wrlo8Nc6f3yVtNxAi01ShD06b6XzDRRMyvFAPX/5jinEtDuY0w==
X-Received: by 2002:a05:6402:5383:b0:5cf:ba23:3e44 with SMTP id 4fb4d7f45d1cf-5d632317925mr13436968a12.7.1734337864039;
        Mon, 16 Dec 2024 00:31:04 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652ae1210sm2899769a12.47.2024.12.16.00.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 00:31:03 -0800 (PST)
Date: Mon, 16 Dec 2024 11:31:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: guomin_chen@sina.com
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Xinqi Zhang <quic_xinqzhan@quicinc.com>,
	guomin chen <gchen.guomin@gmail.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] firmware: arm_scmi: Delete the meaningless
 scmi_bus_id.
Message-ID: <e6a19d60-8e39-406a-8426-5fbec50c4b3c@stanley.mountain>
References: <20241216073745.2973317-1-guomin_chen@sina.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216073745.2973317-1-guomin_chen@sina.com>

On Mon, Dec 16, 2024 at 03:37:45PM +0800, guomin_chen@sina.com wrote:
> From: guomin chen <guomin_chen@sina.com>
> 
> Currently, scmi_bus_id is only used to set scmi_dev.id,
> which in turn sets the SCMI device name. After removing
> scmi_bus_id, it is clearer and more meaningful to directly
> use the unique tuple [Parent name,device name, protocol] to 
> set the SCMI device name.
> 
> Signed-off-by: guomin chen <guomin_chen@sina.com>
> ---
>  drivers/firmware/arm_scmi/bus.c    | 17 +++--------------
>  drivers/firmware/arm_scmi/driver.c |  4 ++--
>  2 files changed, 5 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> index 157172a5f2b5..800e8ec9357c 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -20,7 +20,6 @@
>  BLOCKING_NOTIFIER_HEAD(scmi_requested_devices_nh);
>  EXPORT_SYMBOL_GPL(scmi_requested_devices_nh);
>  
> -static DEFINE_IDA(scmi_bus_id);
>  

You'll want to delet the blank line to avoid a checkpatch warning.
(checkpatch doesn't warn about the patch, but if you re-run it on
the file later, it will warn).

>  static DEFINE_IDR(scmi_requested_devices);
>  /* Protect access to scmi_requested_devices */
> @@ -341,7 +340,6 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
>  	if (scmi_dev->protocol_id == SCMI_PROTOCOL_SYSTEM)
>  		atomic_set(&scmi_syspower_registered, 0);
>  
> -	ida_free(&scmi_bus_id, scmi_dev->id);
>  	device_unregister(&scmi_dev->dev);
>  }
>  
> @@ -349,7 +347,7 @@ static struct scmi_device *
>  __scmi_device_create(struct device_node *np, struct device *parent,
>  		     int protocol, const char *name)
>  {
> -	int id, retval;
> +	int retval;
>  	struct scmi_device *scmi_dev;
>  
>  	/*
> @@ -387,20 +385,13 @@ __scmi_device_create(struct device_node *np, struct device *parent,
>  		return NULL;
>  	}
>  
> -	id = ida_alloc_min(&scmi_bus_id, 1, GFP_KERNEL);
> -	if (id < 0) {
> -		kfree_const(scmi_dev->name);
> -		kfree(scmi_dev);
> -		return NULL;
> -	}
> -
> -	scmi_dev->id = id;
>  	scmi_dev->protocol_id = protocol;
>  	scmi_dev->dev.parent = parent;
>  	device_set_node(&scmi_dev->dev, of_fwnode_handle(np));
>  	scmi_dev->dev.bus = &scmi_bus_type;
>  	scmi_dev->dev.release = scmi_device_release;
> -	dev_set_name(&scmi_dev->dev, "scmi_dev.%d", id);
> +	dev_set_name(&scmi_dev->dev, "scmi_dev.%s.%s.%d", dev_name(parent),
> +			scmi_dev->name, protocol);
>  
>  	retval = device_register(&scmi_dev->dev);
>  	if (retval)
> @@ -413,7 +404,6 @@ __scmi_device_create(struct device_node *np, struct device *parent,
>  	return scmi_dev;
>  put_dev:
>  	put_device(&scmi_dev->dev);
> -	ida_free(&scmi_bus_id, id);
>  	return NULL;
>  }
>  
> @@ -526,7 +516,6 @@ static void __exit scmi_bus_exit(void)
>  	 */
>  	scmi_devices_unregister();
>  	bus_unregister(&scmi_bus_type);
> -	ida_destroy(&scmi_bus_id);
>  }
>  module_exit(scmi_bus_exit);
>  
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index 1b5fb2c4ce86..bbf1f05f2be3 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -2641,8 +2641,8 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
>  	cinfo->max_msg_size = info->desc->max_msg_size;
>  
>  	/* Create a unique name for this transport device */

This comment should be updated.

> -	snprintf(name, 32, "__scmi_transport_device_%s_%02X",
> -		 idx ? "rx" : "tx", prot_id);
> +	snprintf(name, 32, "__scmi_transport_device_%s",
> +		 idx ? "rx" : "tx");

We used to create new transport devices for each port, but now we
only we only create one for recieve and one for transmit.  This is
unrelated to the commit message and needs to be done in separate commit
if at all.

regards,
dan carpenter

