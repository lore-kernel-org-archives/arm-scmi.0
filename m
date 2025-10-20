Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CC9221FC8
	for <arm-scmi@vger.kernel.org>; Mon, 20 Oct 2025 17:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760981399; cv=none; b=n3Mgx88ybyA/bY8LJJj7ZwVs2VkNotOv9SS9sOj/pYAvrJt5EMkWBXT6ubuCtOqo7rswF+hqlnAEQKhlh+vtg7fWsnjN7DQQwXPzN9YAiE9QtWUiLsmiTJh01Ir4MmMSE535kkaQC75Ihr5wrHpOsoSGYLSmkgp7O1pH41Sw2VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760981399; c=relaxed/simple;
	bh=1JRUKKW21+WJZA3fZH3/irJqi6muXMjaWvQxPLRaF8g=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bYER/WFnEGd/OxsuGg9qPB3ORZ5PWFDFAkOAq/quvnnc4JTHUmajcBzxUyg9/IKTcklFC0FLZcfhxSm5HaGVjBd2nGSsfY1ut9T0xWstrjLIRna7C5EaSuQ1B8Zq26++UjlUktyGKNUfgpCz/+WDIIQ/b2dtWIExmSibRDelV2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cr2Qc23yqz6M5Cj;
	Tue, 21 Oct 2025 01:26:16 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 8A72B140275;
	Tue, 21 Oct 2025 01:29:53 +0800 (CST)
Received: from localhost (10.48.157.75) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 20 Oct
 2025 18:29:52 +0100
Date: Mon, 20 Oct 2025 18:29:49 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Sudeep Holla <sudeep.holla@arm.com>
CC: Cristian Marussi <cristian.marussi@arm.com>, <arm-scmi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 3/8] firmware: arm_scmi: Convert OF-only paths to
 generic fwnode in SCMI core
Message-ID: <20251020182949.00002bbf@huawei.com>
In-Reply-To: <20251017-acpi_scmi_pcc-v1-3-0adbab7709d9@arm.com>
References: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
	<20251017-acpi_scmi_pcc-v1-3-0adbab7709d9@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 dubpeml100005.china.huawei.com (7.214.146.113)

On Fri, 17 Oct 2025 14:23:46 +0100
Sudeep Holla <sudeep.holla@arm.com> wrote:

> Switch SCMI core plumbing from struct device_node* to struct
> fwnode_handle* so transports and core code work with both DT and
> ACPI firmware descriptions.
> 
> This change:
>   - Replaces of_* property lookups with fwnode_property_*() helpers.
>   - Switches child enumeration to
>     fwnode_for_each_available_child_node_scoped().
>   - Plumbs fwnode through the SCMI device creation and channel setup
>     paths and updates transport ->chan_available() signatures to take a
>     fwnode.
>   - Stores the per-protocol child fwnodes in info->active_protocols so
>     the core can later locate the descriptor for a given protocol ID.
>   - Update mailbox/optee/smc/virtio transports to accept fwnode and
>     map to OF nodes where needed
> 
> DT-only transports (mailbox/optee/smc) still parse DT properties by
> mapping the fwnode back to an OF node; on non-DT (e.g. ACPI) systems
> these transports will report no channel available.
> 
> This refactor is a prerequisite for adding an ACPI-first transport like
> PCC and brings the SCMI core closer to DT/ACPI parity. This is a mechanical
> step towards firmware-node neutrality; DT users continue to work unchanged,
> and ACPI paths can be enabled on top.
> 
> No functional change is expected on DT platforms; ACPI platforms can now
> discover and participate in SCMI where a suitable transport is present.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
Hi Sudeep

A few comments inline. The reference counting on fwnodes gets a bit complex in
here so my review more or less skips that bit (it's end of day!)

> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index bd56a877fdfc..bc5fea11b5db 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c

> @@ -2820,7 +2820,7 @@ static int scmi_chan_destroy(int id, void *p, void *idr)
>  		struct scmi_info *info = handle_to_scmi_info(cinfo->handle);
>  		struct scmi_device *sdev = to_scmi_dev(cinfo->dev);
>  
> -		of_node_put(cinfo->dev->of_node);
> +		fwnode_handle_put(dev_fwnode(cinfo->dev));

This may follow on from earlier thing about device_set_node().
I think this is freeing a reference that will never have been gotten if you
follow what I suggest there.  Note that I'm fairly sure it was never
gotten for acpi anyway.  However this might be a different fwnode, I'm lost
on that front.

>  		scmi_device_destroy(info->dev, id, sdev->name);
>  		cinfo->dev = NULL;
>  	}

> @@ -3118,8 +3119,8 @@ static const struct scmi_desc *scmi_transport_setup(struct device *dev)
>  		 trans->desc.max_msg);
>  
>  	/* System wide atomic threshold for atomic ops .. if any */
> -	if (!of_property_read_u32(dev->of_node, "atomic-threshold-us",
> -				  &trans->desc.atomic_threshold))
> +	if (!fwnode_property_read_u32(dev_fwnode(dev), "atomic-threshold-us",

device_property_read_u32() Same for all the other places where the fwnode
is simple dev_fwnode(dev) and there is a suitable helper.


> +				      &trans->desc.atomic_threshold))
>  		dev_info(dev,
>  			 "SCMI System wide atomic threshold set to %u us\n",
>  			 trans->desc.atomic_threshold);

> @@ -3262,10 +3262,10 @@ static int scmi_probe(struct platform_device *pdev)
>  
>  	scmi_enable_matching_quirks(info);
>  
> -	for_each_available_child_of_node(np, child) {
> +	fwnode_for_each_available_child_node_scoped(dev_fwnode(dev), child) {
I don't think there is an exit path in here, so this is functionally the same
as the non scoped version.

Also, if you are gong to use dev_fwnode use
	device_for_each_child_node() and don't worry about the available.
I think the patch merged that made device_for_each_child_node() only
consider the available ones for all firmware types.

>  		u32 prot_id;
>  
> -		if (of_property_read_u32(child, "reg", &prot_id))
> +		if (fwnode_property_read_u32(child, "reg", &prot_id))
>  			continue;
>  
>  		if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id))
> @@ -3278,10 +3278,11 @@ static int scmi_probe(struct platform_device *pdev)
>  		}
>  
>  		/*
> -		 * Save this valid DT protocol descriptor amongst
> +		 * Save this valid fwnode protocol descriptor amongst
>  		 * @active_protocols for this SCMI instance/
>  		 */
> -		ret = idr_alloc(&info->active_protocols, child,
> +		ret = idr_alloc(&info->active_protocols,
> +				fwnode_handle_get(child),

This change is a little subtle to be buried in here and I'm fairly sure
it is an unintended functional change.  If idr_alloc() fails the continue
and loop iterator magic, will drop the reference held by the loop but
not this one.  So it will leak a reference.

If this does make sense, do it in a precursor patch before changing away
from of only.

>  				prot_id, prot_id + 1, GFP_KERNEL);
>  		if (ret != prot_id) {
>  			dev_err(dev, "SCMI protocol %d already activated. Skip\n",
> @@ -3289,7 +3290,6 @@ static int scmi_probe(struct platform_device *pdev)
>  			continue;
>  		}
>  
> -		of_node_get(child);
>  		scmi_create_protocol_devices(child, info, prot_id, NULL);
>  	}
>  

