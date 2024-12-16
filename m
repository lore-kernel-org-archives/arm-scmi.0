Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E981FFC6D
	for <arm-scmi@vger.kernel.org>; Mon, 16 Dec 2024 08:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734339047; cv=none; b=MsAs7YubODA+S5RNKWOHlpQrMJXSfkxjld+wqWBoNvIxJgJD6pqD9nrpgd0aRd/3nqgk18eyhDcpKaXFhSZNfyymPAuBTzyoBd/QrI3olr3XEmcbYNepagMmFDE3judIsZzuq9ZmYj9xlJf+WuHm4m6eq52kw4E0m63sldFCO5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734339047; c=relaxed/simple;
	bh=pvWfJGgfvO/3/Lb36hzasOWZYsFEazQ9IoGl0sSU7/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJmfTUZy4wkPEwxtsT4WJdLskazrbCoOsr5ZvG00V1xmHH58w+7SVF+lYFp0xxtT0J2+i85EgiHlRVmCpcoAtyUdvLwqicZChMDVoTtAaOrKTpzZj26cjkyQXTObOAqgsAUWh/2gxopRCiKxeesJijWWlrHDv8GdWBH2dPbYtqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D7B1113E;
	Mon, 16 Dec 2024 00:51:11 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6F463F720;
	Mon, 16 Dec 2024 00:50:41 -0800 (PST)
Date: Mon, 16 Dec 2024 08:50:26 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: guomin_chen@sina.com
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Xinqi Zhang <quic_xinqzhan@quicinc.com>,
	guomin chen <gchen.guomin@gmail.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, dan.carpenter@linaro.org
Subject: Re: [PATCH v2] firmware: arm_scmi: Delete the meaningless
 scmi_bus_id.
Message-ID: <Z1_p0nU93PHJ4Sg_@pluto>
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

Hi Guomin,

this same pTCH was NACKed(Rejected) a few days ago:

https://lore.kernel.org/arm-scmi/20241211134505.2218386-1-guomin_chen@sina.com/T/#u

...and you agreed that is not a simplification we can do (not to break
multuple instances...)...

..so why you are posting V2 now ?

Thanks,
Cristian

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
> -	snprintf(name, 32, "__scmi_transport_device_%s_%02X",
> -		 idx ? "rx" : "tx", prot_id);
> +	snprintf(name, 32, "__scmi_transport_device_%s",
> +		 idx ? "rx" : "tx");
>  	/* Create a uniquely named, dedicated transport device for this chan */
>  	tdev = scmi_device_create(of_node, info->dev, prot_id, name);
>  	if (!tdev) {
> -- 
> 2.47.1
> 
