Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0F13321C0
	for <arm-scmi@vger.kernel.org>; Mon, 20 Oct 2025 17:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760981859; cv=none; b=rygqqMozzTq/Abqq2y1FZhdW+TZJDA3ymo5Bj3Xs/3NjtYV4LsPTTsheP7FWP3bNgScIiL8IsbCC3C9I5SlDmNuk1ExATtQR2BicTnHXIB0LmF9UJuvBmorytbSHyqPeY5NcY3K6wdZ/Q4I9ZNen76XYFz7fCrCW+cZb6lWpkJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760981859; c=relaxed/simple;
	bh=e+h3cWAorB6DNOFG4OBiF7Ba4+Z/lncZIhfGrToiu0Q=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nBE7uiOnss/ZyGYyreJDLAvv5m8W8VvnFIVXnDOr9qY+zLLBLvjGnTJAEcxT9jgXitMJ/eb4Z/KdJqaDxsr54AdAboG/BuVC2P4PxPDSEv9YrsniKSaG09FiQ5eEqR6Uhy2mqE9DSI8S5/BzhsnYr1Q4DUjrKUSuEIVYQuYf49I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cr2bS1Kn9z6M4GQ;
	Tue, 21 Oct 2025 01:33:56 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 735F3140275;
	Tue, 21 Oct 2025 01:37:33 +0800 (CST)
Received: from localhost (10.48.157.75) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 20 Oct
 2025 18:37:32 +0100
Date: Mon, 20 Oct 2025 18:37:31 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Sudeep Holla <sudeep.holla@arm.com>
CC: Cristian Marussi <cristian.marussi@arm.com>, <arm-scmi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 7/8] firmware: arm_scmi: transport: Add ACPI PCC
 transport
Message-ID: <20251020183731.000023fa@huawei.com>
In-Reply-To: <20251017-acpi_scmi_pcc-v1-7-0adbab7709d9@arm.com>
References: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
	<20251017-acpi_scmi_pcc-v1-7-0adbab7709d9@arm.com>
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

On Fri, 17 Oct 2025 14:23:50 +0100
Sudeep Holla <sudeep.holla@arm.com> wrote:

> Introduce a new SCMI transport that uses ACPI PCCT (PCC) subspaces via
> the Linux PCC mailbox layer. The driver parses ACPI _DSD data to map
> protocols to PCC subspace UIDs, supports shared TX/RX channels, and
> optionally sets up a P2A channel for notifications.
> 
> Key points:
> - new CONFIG_ARM_SCMI_TRANSPORT_PCC option
> - integration with SCMI core via scmi_desc and transport ops
> - response/notification fetch from PCC shared memory header/payload
> - ACPI device matching and registration via the ACPI transport macro
> 
> This enables SCMI to be exercised over PCC on ACPI platforms.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
Hi Sudeep,

Just a very quick look in what is definitely a drive by style review
A few things below.

> diff --git a/drivers/firmware/arm_scmi/transports/pcc.c b/drivers/firmware/arm_scmi/transports/pcc.c
> new file mode 100644
> index 000000000000..39ef83e2dfd4
> --- /dev/null
> +++ b/drivers/firmware/arm_scmi/transports/pcc.c
> @@ -0,0 +1,390 @@

> +
> +/**
> + * struct scmi_pcc - Structure representing a SCMI mailbox transport
> + *
> + * @cl: Mailbox Client
> + * @pchan: Transmit/Receive PCC/mailbox channel
> + * @cinfo: SCMI channel info
> + * @shmem: Transmit/Receive shared memory area
run kernel-doc over the file (shmem doesn't exist).

> + */
> +struct scmi_pcc {
> +	struct mbox_client cl;
> +	struct pcc_mbox_chan *pchan;
> +	struct scmi_chan_info *cinfo;
> +};

> +
> +static int acpi_scmi_dsd_parse_protocol_subpackage(const union acpi_object *obj,
> +						   int prot_id)
> +{
> +	u32 uid;
> +	int idx, ret = 0;
> +	struct pcc_transport *p;
> +	unsigned int pkg_cnt = obj->package.count;
> +
> +	if (pkg_cnt > 2) {
> +		pr_warn("Only 2 channels: one Tx and one Rx needed\n");
> +		return -EINVAL;
> +	}
> +
> +	for (idx = 0; idx < pkg_cnt; idx++) {
> +		union acpi_object *pack = &obj->package.elements[idx];
> +
> +		/* Flags(pack->package.elements[1]) must be always 0 for now */
> +		uid = pack->package.elements[0].integer.value;
> +		hash_for_each_possible(pcc_id_hash, p, hnode, uid) {
> +			if (p->flags & SCMI_TRANSPORT_SHARED_CHANNEL) {
> +				pr_info("Invalid! %d channel is shared\n",
> +					p->pcc_ss_id);
> +				ret = -EINVAL;

This breaks out of the hash_for_each_... but the outer loop might continue
and it's just possible pass.  however we leave ret set.  Why not bail out
on first error?  E.g. return -EINVAL; here.

> +				break;
> +			}
> +			p->protocol_id = prot_id;
> +		}
> +	}
> +
> +	return ret;
> +}

> +#ifdef CONFIG_ACPI

This is the bit I'd avoid by not use ACPI_PTR() in the earlier patch.

> +static const struct acpi_device_id scmi_acpi_ids[] = {
> +	{"ARML0001", 0},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(acpi, scmi_acpi_ids);
> +#endif
> +
> +DEFINE_SCMI_ACPI_TRANSPORT_DRIVER(scmi_pcc, scmi_pcc_driver,
> +				  scmi_pcc_desc, scmi_acpi_ids, core);
> +module_platform_driver(scmi_pcc_driver);
> +
> +MODULE_AUTHOR("Sudeep Holla <sudeep.holla@arm.com>");
> +MODULE_DESCRIPTION("SCMI ACPI PCC Transport driver");
> +MODULE_LICENSE("GPL");
> 

