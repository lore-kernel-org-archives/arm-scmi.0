Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3392F41
	for <arm-scmi@vger.kernel.org>; Wed, 28 Aug 2024 04:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724820469; cv=none; b=APVCgFFYN6ngQZ2skVn0dJHTCB3C1sM+S2bHA/ztd3YdnybGR4gnsU9hYMgvf0K2Gc4+v6TD6ZkrUVAvkRWTQZhwjWUu/Ji+OUSSCihsm6g+RpPihxg1wCD4YwElA7qRn1piX2rr3dZfZusxD9zs4arL0wr9yjungEpZUlFy1zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724820469; c=relaxed/simple;
	bh=AGj9fNJx+7GillN4iSgCsoFVOrYJ2ykI3u8UIumg4r4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nWmh6oPc8yo/LWNwv3XLMt2bgbzimFsxUsj3Ry0JLnQ7nh7Uj9IKugVMSWqmnyAfpZPMzck3QbMaJDI1/UjcPZjwknpK6hd+jHjBQwweK2zOPp3q2wNyGhIDNGjDRyXviXD9K9HITRw2fjByaceE3+9O18uI+FynLIIXaMxRRV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=T3EMW5Hg; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="T3EMW5Hg"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47S4lfTm010071;
	Tue, 27 Aug 2024 23:47:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724820461;
	bh=sVsLWxz1P0Alb8CYo4V1/9f82vlENjNHD4QuAkC0sIA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=T3EMW5Hg2XSt9/GT03WS7dUHrCDyHtUPpfVfe9WsLzwTEtZBzNu7oWN6brNuhdK1E
	 daCVpKDX10FUe4MabTA665veHQNhVKfhMPdvagXp9xIOn6Hi7iBjkoapLnbOTMKvau
	 MQxl7Pz2U7CdRGgiTEvN2qXIjbAvUK55LqFxzBdY=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47S4lfG6088415
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Aug 2024 23:47:41 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 Aug 2024 23:47:40 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 Aug 2024 23:47:40 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.68])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47S4leao065646;
	Tue, 27 Aug 2024 23:47:40 -0500
Date: Wed, 28 Aug 2024 10:17:39 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Sudeep Holla <sudeep.holla@arm.com>
CC: <arm-scmi@vger.kernel.org>, Cristian Marussi <cristian.marussi@arm.com>
Subject: Re: [PATCH 2/3] firmware: arm_scmi: Replace the use of of_node_put()
 to __free(device_node)
Message-ID: <20240828044739.rqai6p6v5mkdmoph@lcpd911>
References: <20240827143838.1465913-1-sudeep.holla@arm.com>
 <20240827143838.1465913-3-sudeep.holla@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240827143838.1465913-3-sudeep.holla@arm.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi,

On Aug 27, 2024 at 15:38:37 +0100, Sudeep Holla wrote:
> Use __free for device_node values, and thus drop calls to of_node_put.
> 
> The goal is simplify of_node reference cleanup by using this scope-based
> of_node_put() cleanup to simplify function exit handling. When using __free
> a resource is allocated within a block, it is automatically freed at the
> end of the block.
> 
> This cleanup is aligns well with the recent change in shmem.c to use

Grammatical nit:
This cleanup aligns well with....*

> __free for of_node_put.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/firmware/arm_scmi/transports/mailbox.c | 10 ++++------
>  drivers/firmware/arm_scmi/transports/smc.c     |  5 ++---
>  2 files changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
> index 9d258f5d5da8..1a754dee24f7 100644
> --- a/drivers/firmware/arm_scmi/transports/mailbox.c
> +++ b/drivers/firmware/arm_scmi/transports/mailbox.c
> @@ -129,18 +129,16 @@ static int mailbox_chan_validate(struct device *cdev, int *a2p_rx_chan,
>  
>  	/* Bail out if provided shmem descriptors do not refer distinct areas  */
>  	if (num_sh > 1) {
> -		struct device_node *np_tx, *np_rx;
> +		struct device_node *np_tx __free(device_node) =
> +					of_parse_phandle(np, "shmem", 0);
> +		struct device_node *np_rx __free(device_node) =
> +					of_parse_phandle(np, "shmem", 1);
>  
> -		np_tx = of_parse_phandle(np, "shmem", 0);
> -		np_rx = of_parse_phandle(np, "shmem", 1);
>  		if (!np_tx || !np_rx || np_tx == np_rx) {
>  			dev_warn(cdev, "Invalid shmem descriptor for '%s'\n",
>  				 of_node_full_name(np));
>  			ret = -EINVAL;
>  		}
> -
> -		of_node_put(np_tx);
> -		of_node_put(np_rx);
>  	}
>  
>  	/* Calculate channels IDs to use depending on mboxes/shmem layout */
> diff --git a/drivers/firmware/arm_scmi/transports/smc.c b/drivers/firmware/arm_scmi/transports/smc.c
> index 2ffed5280eab..f8dd108777f9 100644
> --- a/drivers/firmware/arm_scmi/transports/smc.c
> +++ b/drivers/firmware/arm_scmi/transports/smc.c
> @@ -84,12 +84,11 @@ static irqreturn_t smc_msg_done_isr(int irq, void *data)
>  
>  static bool smc_chan_available(struct device_node *of_node, int idx)
>  {
> -	struct device_node *np = of_parse_phandle(of_node, "shmem", 0);
> -
> +	struct device_node *np __free(device_node) =
> +					of_parse_phandle(of_node, "shmem", 0);
>  	if (!np)
>  		return false;
>  
> -	of_node_put(np);

Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva
