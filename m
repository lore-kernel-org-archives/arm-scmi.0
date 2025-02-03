Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3284D182B4
	for <arm-scmi@vger.kernel.org>; Mon,  3 Feb 2025 06:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738564074; cv=none; b=q7QwaXhhkjK59PewkctewSdNwPXl8zzphb7sviITEpdQEISdltIbZrMmRL4XUCdMuWQCtBdx560eMG4sVnwUuo8YJqk3uetoQXiSflo+qDYodhgMmy05Fj2UYglrZ4ZsErqhP1LqbTvfYIN1M5IJtPZdByMhaz5aGljIg5LwTIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738564074; c=relaxed/simple;
	bh=AxcgMhbC59Lp4YToW8tI32QuZCr3nTCJr+NlW51m9gI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k3p73Zs/AUl1UYVIzmdewYlkkRQFhDtqMry/Vwf1K5+BgzXAXDZgjSwwC1PEoANM/ZVf3I+kKItna+8EmC+B+L5X6a4dUjShGbz1HTiuG7H2oTb+1i3qCwGLKpmaXNPapFEmDaPyvNXK7XkW35rvSxyJUXo+274znaJZKSolrN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=U/ZMQcy7; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="U/ZMQcy7"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5136Lied2964707
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Feb 2025 00:21:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738563704;
	bh=iXYlcduRaEuZBAJSJkccbjFtw9LjN05LrT6o3bd+HDw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=U/ZMQcy76SDdRgPJBjUDqOjH8hMX63KDfttvW8yCorGwHczDInvX94jcMEZSK6aBP
	 ZDa/Dr6arhhazNm8hR+V4zfzkRhetxWb/xYF2t12kCXylbCALRooreCGNBDOqeN5LR
	 qOCi2tp6+/uX3x0C7KWHyQ+trBcRdvdedIYGZeDc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5136Likd104541
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Feb 2025 00:21:44 -0600
Received: from flwvowa01.ent.ti.com (10.64.41.90) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Feb 2025 00:21:44 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by flwvowa01.ent.ti.com
 (10.64.41.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.34; Mon, 3 Feb
 2025 00:21:43 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Feb 2025 00:21:43 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5136LhIs004552;
	Mon, 3 Feb 2025 00:21:43 -0600
Date: Mon, 3 Feb 2025 11:51:42 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Sudeep Holla <sudeep.holla@arm.com>
CC: <arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Xinqi Zhang
	<quic_xinqzhan@quicinc.com>, Peng Fan <peng.fan@nxp.com>,
        Guomin Chen
	<guomin_chen@sina.com>
Subject: Re: [PATCH 1/3] firmware: arm_scmi: Relax duplicate name constraint
 across protocol ids
Message-ID: <20250203062142.okaan6libbn35cbk@lcpd911>
References: <20250131141822.514342-1-sudeep.holla@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250131141822.514342-1-sudeep.holla@arm.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Sudeep,

On Jan 31, 2025 at 14:18:20 +0000, Sudeep Holla wrote:
> Currently in scmi_protocol_device_request(), no duplicate scmi device
> name is allowed across any protocol. However scmi_dev_match_id() first

Yeah this was indeed a bit too stringent.

> matches the protocol id and then the name. So, there is no strict
> requirement to keep this scmi device name unique across all the protocols.

Right.

> 
> Relax the constraint on the duplicate name across the protocols and
> inhibit only within the same protocol id.

Makes sense to me, it will indeed make things simpler.
Reviewed-by: Dhruva Gole <d-gole@ti.com>

> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/firmware/arm_scmi/bus.c | 19 ++++++-------------
>  1 file changed, 6 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> index a3386bf36de5..8acf33ccfd21 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -42,7 +42,7 @@ static atomic_t scmi_syspower_registered = ATOMIC_INIT(0);
>   * This helper let an SCMI driver request specific devices identified by the
>   * @id_table to be created for each active SCMI instance.
>   *
> - * The requested device name MUST NOT be already existent for any protocol;
> + * The requested device name MUST NOT be already existent for this protocol;
>   * at first the freshly requested @id_table is annotated in the IDR table
>   * @scmi_requested_devices and then the requested device is advertised to any
>   * registered party via the @scmi_requested_devices_nh notification chain.
> @@ -52,7 +52,6 @@ static atomic_t scmi_syspower_registered = ATOMIC_INIT(0);
>  static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
>  {
>  	int ret = 0;
> -	unsigned int id = 0;
>  	struct list_head *head, *phead = NULL;
>  	struct scmi_requested_dev *rdev;
>  
> @@ -67,19 +66,13 @@ static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
>  	}
>  
>  	/*
> -	 * Search for the matching protocol rdev list and then search
> -	 * of any existent equally named device...fails if any duplicate found.
> +	 * Find the matching protocol rdev list and then search of any
> +	 * existent equally named device...fails if any duplicate found.
>  	 */
>  	mutex_lock(&scmi_requested_devices_mtx);
> -	idr_for_each_entry(&scmi_requested_devices, head, id) {
> -		if (!phead) {
> -			/* A list found registered in the IDR is never empty */
> -			rdev = list_first_entry(head, struct scmi_requested_dev,
> -						node);
> -			if (rdev->id_table->protocol_id ==
> -			    id_table->protocol_id)
> -				phead = head;
> -		}
> +	phead = idr_find(&scmi_requested_devices, id_table->protocol_id);
> +	if (phead) {
> +		head = phead;
>  		list_for_each_entry(rdev, head, node) {
>  			if (!strcmp(rdev->id_table->name, id_table->name)) {
>  				pr_err("Ignoring duplicate request [%d] %s\n",
> -- 
> 2.34.1
> 
> 

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated
