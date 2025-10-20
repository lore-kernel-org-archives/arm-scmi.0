Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7673217A2F0
	for <arm-scmi@vger.kernel.org>; Mon, 20 Oct 2025 17:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760980030; cv=none; b=QDww3/1Refo6AfNG4BLp04cIDdALpfVhA1+if+DKivpJUcZp/LeE7ehYeWI+hcuwpDuOrrkw5UpDSS0klkxLlNdmkPtod8pZphH1QaVzsi/kvjVcizu6Tycf3N/TN8zCLFsZZCWSJUJ955fK3FiPmNz+x8InENeLMsNVgz+Ft0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760980030; c=relaxed/simple;
	bh=wYXrpBQxtq1iWoTHAOpPTYxSon0bhH45q2O8vsR5xcs=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=amx6JlckmflN7eTebm6ncfivMS4t7kmO+HxCZ+mo6sA61MN45i6Z0N+fvrPb8xI6EkxpjpOGvwAXFiddfKD27JZNYnkFMpwJ1vwt4aNWXrSltoyexugTXJ3QZ5riWUwwrWku5sP2BAMY7z+0rg/oBD55ryCFWzGpXepN6K2RRNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cr1wH5y3pz6M5Bc;
	Tue, 21 Oct 2025 01:03:27 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 15A4C140276;
	Tue, 21 Oct 2025 01:07:05 +0800 (CST)
Received: from localhost (10.48.157.75) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 20 Oct
 2025 18:07:04 +0100
Date: Mon, 20 Oct 2025 18:07:02 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Sudeep Holla <sudeep.holla@arm.com>
CC: Cristian Marussi <cristian.marussi@arm.com>, <arm-scmi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/8] firmware: arm_scmi: Set fwnode for the genrated
 SCMI platform device
Message-ID: <20251020180702.00005106@huawei.com>
In-Reply-To: <20251017-acpi_scmi_pcc-v1-1-0adbab7709d9@arm.com>
References: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
	<20251017-acpi_scmi_pcc-v1-1-0adbab7709d9@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)

On Fri, 17 Oct 2025 14:23:44 +0100
Sudeep Holla <sudeep.holla@arm.com> wrote:

generated (in patch title).

> Add a call to device_set_node() in the SCMI probe helper to associate
> generated SCMI platform device with the firmware node of its supplier
> transport device.
> 
> This complements device_set_of_node_from_dev() and ensures that
> firmware node information is propagated correctly for both Device Tree
> and non-DT (e.g. ACPI) based systems.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/firmware/arm_scmi/common.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
> index 07b9e629276d..911941e6885d 100644
> --- a/drivers/firmware/arm_scmi/common.h
> +++ b/drivers/firmware/arm_scmi/common.h
> @@ -473,6 +473,7 @@ static int __tag##_probe(struct platform_device *pdev)			       \
>  		return -ENOMEM;						       \
>  									       \
>  	device_set_of_node_from_dev(&spdev->dev, dev);			       \
> +	device_set_node(&spdev->dev, dev_fwnode(dev));			       \

device_set_node() is supposed to handle both dt and ACPI. So this surprised me
and I went digging.

dev_fnode for acpi is dev->fwnode, for of it is of_fwnode_handle(dev->of_node)
Which is dev->of_node->fwnode

So for acpi this is
	device_set_node(&spdev->dev, dev->fwnode);
which is:
	spdev->dev->fwnode = fwnode;
	spdev->dev->of_node = NULL; 

For dt
	device_set_node(&spdev->dev, dev->of_node->fwnode);
which is
	spdev->dev->fwnode = dev->of_node->fwnode;
	spdev->dev->opf-node = dev->of_node; (via some container of magic)


The device_set_of_node_from_dev(&spdev->dev, dev)
is same as:
	of_node_put(spdev->dev->of_node);
	spdev->dev->of_node = of_node_get(dev->of_node);
	spdev->dev->of_node_reused = true;

So subject to some reference counting that I don't think you need as the
spdev->dev parent is the dev here, the first call does nothing extra.

Maybe I missed something?

Jonathan




>  									       \
>  	strans.supplier = dev;						       \
>  	memcpy(&strans.desc, &(__desc), sizeof(strans.desc));		       \
> 

