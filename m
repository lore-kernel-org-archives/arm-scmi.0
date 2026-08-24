Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4204A37F737
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 20:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787603097; cv=none; b=KTYCNKrU+OuwCsRZNm1ZUsWO2ithit0fWkNW9iBuoYJKUqygGFcT2dsuCNinrrYFAtbpf20xdiM1jbn4m4IbLNQTMqgrfgaYGAedtoUNl7IXt92KaBV5lPOYT67eb0M8b398U5V5E/8xxT/dkKdw7EgaDouZDnNpgJ3+kF000a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787603097; c=relaxed/simple;
	bh=+R97fBZgSOc7iBaUP8BG+m8T+pMT0oJSwrFJ7nfXF9I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fBhIETAlYuUG4eIgOVE6Y7A43EBaJ1wD+R6iBXSQL0MFiCIeQ1xFkYoJX21OcNjKM4r+LS8MbueLIwdbWuY02WCeuXm5zWxauTuC+7z4GiSZ0qgIAPsIIxL1KZ23nVUxO3gNeuaOZz14NVlVlO342K/k1WPLsKSZ4LPDjVXK9jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FDCaMHoq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f7kUSPUJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FDCaMHoq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f7kUSPUJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OJGrow3415627
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 20:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4eV+1RCKn+9EGaZT0SNQ5VzJ6PPe347P8gHCzbGdu6Q=; b=FDCaMHoqKfZ3f0nY
	KT4NecyfEqk7qLhd9kyi67KXkCdc/gI+A7/WVLhmKIFoQIkM66PCqxgOnyEzHlr8
	UPnWFfgVkEMW9bUzbnqrXTplMemPmHj/tW0kj0gY3F2w0tcMvAZU8ub57fzGDrKF
	5q9KDtV2sEHPlRvFbK+VZQlr7mS0oYqCQclI8Vnanw6B4qSlqgsrLGAHRgrvB09c
	l80f4wQ0zOzHg1qMMEp6W2ptRIvq9TTJ9hY1usQehAGos2eYxZJ2iyjEhNPApSex
	vwC9GbpFTncWxqiCaTp+q3TneJ8K/QBTnPMXloJvL5CuHRcfCOsTOhcLJnDMTnDf
	n+fAbg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8t3drqfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 20:24:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so4988243a91.1
        for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 13:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787603094; x=1788207894; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4eV+1RCKn+9EGaZT0SNQ5VzJ6PPe347P8gHCzbGdu6Q=;
        b=f7kUSPUJJKVbmxeWTiNh9nB0pAgwCBQpCo+ggh0Xliv0h0ozOsY0ihjLaUVOWWxlbs
         /2GuuN0Esg2dHJmv132hjjAvc9URvcOe5ngTP6tKz9LGMZ/Lw9kMIyoQqEoN0a7P3/zP
         AxI+rPmxwIALVQdrIBqhZHv81h01gAC2tEtdGov9Y4BKihl+Lfhh4vanY4KiWkqJigzA
         wgVT8Smh1QX8r9xc2EtDQdsTNCog/dwqm7Gm8v7eQR2CnV4EIOh85CG32yiM/nTTRZqE
         41jSYIkS5MqwgFWhb5b/pwWDckOgviTbzwPLXFIE1VLBvGwQ5MKpQHq8pVal+yCDoZHH
         3Avw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787603094; x=1788207894;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4eV+1RCKn+9EGaZT0SNQ5VzJ6PPe347P8gHCzbGdu6Q=;
        b=o3iuHdLZP9rt3JO+c5YGuSx6vikiTUjN2oBV3GNHpuu1J8hlF7K7QwTdfPuDAVdxVi
         R8K2q6Itdk5iSxTfvYPVvH0CQQSoxKOZmQryl+CbQTJ84s4EULnuDEtqUnj6M2C9qUjW
         sui2rQHz+0NYRQEiuC1Tfp3B0xqwoZ5bWdjjGr5o9GQUc8/kkhGTr3X15wt3sDZjMaLm
         34NW3vQ0+gT2+ipgPl9gnU9jy1iYYEnhQvwRQ/CDnPyF/6IQklY+CdIZVdnUNT8Z9fsz
         lI2dNHNqYxUcfGwjuZEjmWYKtYTknffBeVdJWkV5alVBw7Rhi20GcRdv0uMAsNLn3lOv
         2AoA==
X-Gm-Message-State: AFuF++mYOFxckThRyjWyM/370iolrRDuOjFOTuMRITgmYKSxRwszx42W
	8CSXzZvAwjIFygg/pvP9tsiRXYeU8dtDoLL0RrTCO/rpSCymxX4jPe8yFAPlXyBesbSkfi5Qbr/
	voZrTf8lgyFnP9OdOfwpzbE7TZ/pS/3mbDWY8mRYB5wNd0hvv1H0fTt027R1h9w==
X-Gm-Gg: AR+sD10D5vMx8OgA1vnU08iF4LBrmVt6Nnt6kTCRGRdJSuoR3m0W8+ObvLQstP6gieN
	74GUZOtL6pFPWbodFXxxW2NUslUTiMuL7eYa6uSF8Z6rm1dXM7YpfRPDqsP1FYAHL1TE6ag352z
	aSz7WtYlQXxM8QYU2AXStw1wO5TqZ3HqMV530hEjyXl+VtjW4vm9ARmhqoHUhKXjJqpFdVAZqJT
	W3tgkxMFFI+0HhQWEht9wUvf37bBqRQxG9cTU86GTbTqSnNdILnRTLvugv06FcuIjawUhk4nJdn
	0pUziSBj906vAAokajy7CRlO5SM1M+WZd4Abhuhk3GRkAFJofSAdasU/UW/fI2QVFk2Rd7Rp+Fv
	jRwMJbCi2pW/Zuzf5EGJyLc9ecw==
X-Received: by 2002:a05:6a20:ce4f:b0:3cb:d156:d362 with SMTP id adf61e73a8af0-3cd90fbd2admr2743245637.3.1787603093917;
        Mon, 24 Aug 2026 13:24:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:ce4f:b0:3cb:d156:d362 with SMTP id adf61e73a8af0-3cd90fbd2admr2743167637.3.1787603093506;
        Mon, 24 Aug 2026 13:24:53 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d381csm31902753eec.19.2026.08.24.13.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 13:24:53 -0700 (PDT)
Date: Mon, 24 Aug 2026 13:24:50 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
        Breno
 Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 9/9] firmware: arm_scmi: Validate PCC shared memory
 signature
Message-ID: <20260824132450.000045ca@oss.qualcomm.com>
In-Reply-To: <20260813-acpi_scmi_pcc-v3-9-cb6b88b4ebb3@kernel.org>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
	<20260813-acpi_scmi_pcc-v3-9-cb6b88b4ebb3@kernel.org>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bfH45LZdMRN7i9pI1WgX0UA89jnVBg5b
X-Authority-Analysis: v=2.4 cv=OLAXGyaB c=1 sm=1 tr=0 ts=6a8ca896 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Xy_CICi7n2P0mFM9eQgA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: bfH45LZdMRN7i9pI1WgX0UA89jnVBg5b
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDE3MiBTYWx0ZWRfX6y7NjgjWKxdZ
 Fe303pMDTeRNPsOIuGM6zDDgrZR/ms22ifKiii6v6oQXCoJUIRmHwYb7Xkte8gHrPvSKsQXzQ5X
 YeyCSAtYJjN1d+wDcPfhMgRzA8wlZIw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDE3MiBTYWx0ZWRfX4/dd3azWv4kS
 UqbyCvOP/QUWFo5wmWsX5xkYWFEhuZ973p5dgAsl6fuGsTTyDG5P75CHeO33b3etPh8t54TJGph
 SnU9eNrYONJ8KQHuVpksBo86trlFsN2Lkj4dRV4Hn3B0ERC8B4OH66xG4e0UjYaxf6nJlcaIPrQ
 I/FDje4KKyFM/jDZGy7JZ2XKVjI0z0Ds1aWB/bqE0jPS2Qog3cn8iKar7Fr9osOC6u5mznz1Zw3
 efuj5YBc+xNZcyd3S9JHRw/kljAdm71nUy2459/Tdo6OhHIgQBuzEDm61VGV5BCOOD/ovigb6ER
 lbVdUA95eSEFQHfw9h5gBCPC7yHp1lm3LouP0cWRUKt8cEdeTEm76Z/3JAiY3XxhbaEDCGpJ1xg
 tCsMgoCOfOnEGEqjbqiA16tJF7k6lwbMDsVfnsHgMC3ANhGHnP9wWo3NpoxZLj8rJwYcRSphMZM
 lL34DxHLphs/7vLe8+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_06,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240172

On Thu, 13 Aug 2026 12:33:04 +0100
Sudeep Holla <sudeep.holla@kernel.org> wrote:

> Validate the PCC shared memory signature when setting up an SCMI PCC
> channel.
> 
> Reject channels whose shared memory signature does not encode
> PCC_SIGNATURE combined with the PCC subspace ID, so misconfigured
> firmware is caught before the transport starts using the shared memory
> region.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
Interesting there aren't more checks on this in the various PCC users.
Question for another day perhaps.

Seems correct to me.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> ---
>  drivers/firmware/arm_scmi/transports/pcc.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/transports/pcc.c b/drivers/firmware/arm_scmi/transports/pcc.c
> index 337d551e3ad8..0ead0ec77162 100644
> --- a/drivers/firmware/arm_scmi/transports/pcc.c
> +++ b/drivers/firmware/arm_scmi/transports/pcc.c
> @@ -623,8 +623,11 @@ static void rx_callback(struct mbox_client *cl, void *m)
>  }
>  
>  static int pcc_chan_validate_shmem(struct scmi_chan_info *cinfo,
> -				   struct scmi_pcc *smbox)
> +				   struct scmi_pcc *smbox, int ss_id)
>  {
> +	struct pcc_shared_mem __iomem *shmem = smbox->pchan->shmem;
> +	u32 valid_signature = ss_id + PCC_SIGNATURE;
> +
>  	if (smbox->pchan->shmem_size < SCMI_PCC_SHMEM_OVERHEAD ||
>  	    smbox->pchan->shmem_size - SCMI_PCC_SHMEM_OVERHEAD <
>  	    cinfo->max_msg_size) {
> @@ -632,6 +635,11 @@ static int pcc_chan_validate_shmem(struct scmi_chan_info *cinfo,
>  		return -ENOSPC;
>  	}
>  
> +	if (ioread32(&shmem->header.signature) != valid_signature) {
> +		dev_err(cinfo->dev, "invalid PCC shared memory signature\n");
> +		return -EINVAL;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -667,7 +675,7 @@ static int pcc_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
>  		return ret;
>  	}
>  
> -	ret = pcc_chan_validate_shmem(cinfo, smbox);
> +	ret = pcc_chan_validate_shmem(cinfo, smbox, ss_id);
>  	if (ret) {
>  		pcc_mbox_free_channel(smbox->pchan);
>  		return ret;
> 

