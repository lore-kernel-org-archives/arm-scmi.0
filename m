Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F0644062A
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 17:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787593531; cv=none; b=DrEAGRrdbI51yqtysFTYQHFLL44PFmBqjBnzspJrJrZMUWwnlsdrevinug8HbwDvC3HSpEdz7MCC/QgkdF1JjEZ8ml/VE4iYUyqs3jfx75boKm1iYTRRuuSaYzzhSXnGa/1H7LrGQ3SdBCMjPzfoVJ0lUW+hVVK5hmoZsa89PUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787593531; c=relaxed/simple;
	bh=z8WfvyOXMTrtgFqQRqbfWeMWGXhi8UWGAiPIuoalQy0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tYiTFctJ5LJnL6lqHhSp3A5YyOztsIFmQWJuV5O2KO9l4ksLIHti5FvoHRwkNF6MgKPXZYqj6Sq3nRp3xyAR7WYSG37Uc24N5wkcGjiq9nGIgXFOxjnwBdl6uPVdBL+BE8RWNTLHW+xouiKjiqqL6yTzArAVolxHOCV1PaO4te8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nkN1N2rV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FfSUoDya; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nkN1N2rV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FfSUoDya"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OH5UjC3504320
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 17:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bNWcOKtXMRQgYg/YFNMPsFxR3DaZppMUZM3MBSPYFjo=; b=nkN1N2rVXI16kjTo
	nqcMuUZQ4Fg4sO4kv0V8uLUIubPxlJNLA53XqwH+Tz6DAHtOFlm3RJi5W/QEPoj3
	QK9z6GSBPuPdf1Lk09du9JJ3XAfLMKJLNT4K2dJwNYFZPsJtPSO1ObLMD4goRJl1
	ji71K1O9oG9Y8V8ndb9IHdpg8YlqQG9nSjEbZiWlijQe84ouHlhhaOggg+M6Gd7m
	CLOrIaZEXJ9VMwHF4KvDCg8aLT/YZSfvCC3VQCybqnhapgTFpAjOi+zX+akwk/Q+
	IXeD3Kz4QA8yFYfxEY1gVRXVZGo7bJOZ8PNAsBaWtNmHLW+k5lRz6cM9RJE0s5q4
	faAB9w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8t1s05cw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 17:45:21 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c89704da8c7so5509963a12.0
        for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 10:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787593520; x=1788198320; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bNWcOKtXMRQgYg/YFNMPsFxR3DaZppMUZM3MBSPYFjo=;
        b=FfSUoDyatnu6+FP717/VWPlFvQVUbfrdxw36pVW+YvxKL9LgE6ODtnyUeqftqHY4Wn
         6avDyRnJazTi9rVxuTsK9mITfKiX7iP+gdR/vE0TBHpmFgDI2+j4gEQjjfkMn45yU3JL
         hOiSrVDuCsryKQaC7c4hVM9iGd1CktwwYqBP68au2J+p2pUx7v21FqI30mDcJ0B1ipoL
         yrFcTvodMXzdSQf18CAEaL3Taww2CmeTgS9FBHl1e6h5dD15/lRzJixViSKlIJWRrqiI
         qj4P1ALbclRVugoEe//dsmJ6WjwwqKrhHWAn8A7vLA6Ga29VvzenVlNEi/Ye8iaNpE4Q
         oAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787593520; x=1788198320;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bNWcOKtXMRQgYg/YFNMPsFxR3DaZppMUZM3MBSPYFjo=;
        b=rudDS/RNBgPikyKV9pWf49Fpj8021IV4WVaZEpOSWWWdErApzbXVFlqZMa2/TeDSZ1
         UUBDjMdCbLpVcqyYkEXFGLuFDgT/K/2mb/1hr/D+mRcDW7wSCj+rCVdXQm6C/HSM3WG7
         StLAEpyyhQhHTC5ga2XZYVNrFuMCeMuiJ+KMxFqEoycAF90OB8KnR1UzoKIxtJw6R9CA
         dx4/XuwzYXgmHflMCMkPXXvioXpcCUze1PD4LBklF8RZWbYb21gP57mZTbxPFjTIuEop
         vsjD19lhdL+WFC2P2S7qNFgI+XPKjwNxvPn+iHymScjJEbe1KwyhaY9lL3lS6l4TFBvC
         9aJw==
X-Gm-Message-State: AFuF++lSXh+GwFqFzOz0/X+Jr11S0kV6BxpE/v7XlfCD8KAgZnJs/z2P
	QTukB9kbD0hyYuvkRUYZjlj8pg9NWDS2Bfu9e4yDJbt/gjcRhohntWvwGK5YXFhiLDBHVArsrh4
	SQvZuOdeZHIxKxYrS0as4Simh75cR0r8kao+QEs4NBH6MizE2luDnR55u9t5Ovg==
X-Gm-Gg: AR+sD135zNmpVDCvEQwnILJnaw9/dSZoU5vvC5P/vNo0e85fElmRCPqGmmgGuqXoTYP
	414O//WxQvPNJcPNTKaMdpK9lZ0HSF06XjrXNA3Mgw1PmurExAjBdYOCnxABDKzqkxBJHPOyBAr
	9WKgkh0cjwmRn/cumFugJDWcGUmTi9QgbP00tqpAH9fm+xxdtln5u+/wSvkMvPASi36iQ4FuCJ5
	0CvYkpR65zE6X9+qJtDBvmKP5gydLR+MddA2+ZYkJvBPvGTyzN//p3BUr6Ve3FwAZ/nrjp9G4PN
	SytzKlzFv9jwGkqkz/9H9Ks7PTewXXdDd6oFpqLUmzwOpzcC21didEFafmmm5MPolPxPt7RZCVz
	pPyTqMYG+UUJuR66lVoqpS/jTBQ==
X-Received: by 2002:a05:6a21:790:b0:3c3:7ac4:dac0 with SMTP id adf61e73a8af0-3cd300d467dmr57067907637.13.1787593520190;
        Mon, 24 Aug 2026 10:45:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:790:b0:3c3:7ac4:dac0 with SMTP id adf61e73a8af0-3cd300d467dmr57067819637.13.1787593519750;
        Mon, 24 Aug 2026 10:45:19 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141860c697esm24112160c88.3.2026.08.24.10.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 10:45:19 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:45:16 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
        Breno
 Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 5/9] firmware: arm_scmi: Pass protocol ID to
 chan_available() transport callback
Message-ID: <20260824104516.00002b8c@oss.qualcomm.com>
In-Reply-To: <20260813-acpi_scmi_pcc-v3-5-cb6b88b4ebb3@kernel.org>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
	<20260813-acpi_scmi_pcc-v3-5-cb6b88b4ebb3@kernel.org>
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
X-Proofpoint-GUID: eW3CWIb0_pOA64p9LFDf6Z79ZxjxPn-K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDE0OSBTYWx0ZWRfX3Dmh+aDEVMXg
 pbIb3tgHrx/yJw6OLDkWjtvWpfXVM9AP6fWy55okoxVu77Uw8N5YzyU16xnir0KqBmS/KVbsEPR
 mYxiihNjQMXgXmhp1LCuDK3J2U5ZEg7rz54LidRNxRgSsfgZZcR473E73L1RODmnUaSlh3WBG3v
 2n23ZDnw7y6xK//sesuzcO+YZezvl+eAAIKRiAejVdi3sJ27vqiQ0HM8cKqjaBowNrlvkpcLik7
 u8Kxvxzt469Vbimob1jMxCLwsUkEMK1AHb68MygmzM67S5juOKaHuE9ZK7g0w4niuz+0SMtQxEo
 1Qwpilm1AZOL2AbpG7Np+H/aemEwlIjZ8cKb4yX5MKNAHToctJTPfKJ0OlWSwC+DIIvMSwcsxmG
 Nf8EewoBMb/AIToaBLLDs8UvlnPN2XF/VApTgtbtT9gO1S+KMJCHwZSnwssOeGvUtpsSqttC0o7
 ZlEQBMCiS+UwnPWyUdQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDE0OSBTYWx0ZWRfXx8xFY9uCnC0x
 crm6cRwX9xBx+qym6JVHhJSya8Hi2CtRQWLkhen2AFllOpGi3ABFrVpZ+49Y7joZzgIfYbtsggC
 G9yMdi4h6PIP4sG+RmTyUFN/huBZNbg=
X-Authority-Analysis: v=2.4 cv=L7ItheT8 c=1 sm=1 tr=0 ts=6a8c8331 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mK2TJSJBIbLwxmLH4kIA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: eW3CWIb0_pOA64p9LFDf6Z79ZxjxPn-K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240149

On Thu, 13 Aug 2026 12:33:00 +0100
Sudeep Holla <sudeep.holla@kernel.org> wrote:

> Extend the SCMI transport_ops chan_available() callback to include the
> protocol ID (prot_id) as an argument. This allows transports to determine
> channel availability based on the specific protocol being used, improving
> flexibility in platforms that share transport channels across multiple
> protocols. This will be useful when ACPI PCC transport gets added.
> 
> Updated all existing users and definitions of chan_available() in
> SCMI core and transport drivers (mailbox, optee, etc.) accordingly.
> 
> No functional change.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>


> ---
>  drivers/firmware/arm_scmi/common.h             | 3 ++-
>  drivers/firmware/arm_scmi/driver.c             | 2 +-
>  drivers/firmware/arm_scmi/transports/mailbox.c | 3 ++-
>  drivers/firmware/arm_scmi/transports/optee.c   | 3 ++-
>  drivers/firmware/arm_scmi/transports/smc.c     | 3 ++-
>  drivers/firmware/arm_scmi/transports/virtio.c  | 3 ++-
>  6 files changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
> index 042867c28b88..1ab4543e0f4a 100644
> --- a/drivers/firmware/arm_scmi/common.h
> +++ b/drivers/firmware/arm_scmi/common.h
> @@ -207,7 +207,8 @@ struct scmi_chan_info {
>   * @poll_done: Callback to poll transfer status
>   */
>  struct scmi_transport_ops {
> -	bool (*chan_available)(struct fwnode_handle *fwnode, int idx);
> +	bool (*chan_available)(struct fwnode_handle *fwnode, int prot_id,
> +			       int idx);
>  	int (*chan_setup)(struct scmi_chan_info *cinfo, struct device *dev,
>  			  bool tx);
>  	int (*chan_free)(int id, void *p, void *data);
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index 9ad827c6a9ab..aad678db0f6e 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -2768,7 +2768,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct fwnode_handle *fwnode,
>  	if (idr_find(idr, prot_id))
>  		return -EEXIST;
>  
> -	if (!info->desc->ops->chan_available(fwnode, idx)) {
> +	if (!info->desc->ops->chan_available(fwnode, prot_id, idx)) {
>  		cinfo = idr_find(idr, SCMI_PROTOCOL_BASE);
>  		if (unlikely(!cinfo)) /* Possible only if platform has no Rx */
>  			return -EINVAL;
> diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
> index b692cae4ff25..56af2cb0f424 100644
> --- a/drivers/firmware/arm_scmi/transports/mailbox.c
> +++ b/drivers/firmware/arm_scmi/transports/mailbox.c
> @@ -77,7 +77,8 @@ static void rx_callback(struct mbox_client *cl, void *m)
>  		      core->shmem->read_header(smbox->shmem), NULL);
>  }
>  
> -static bool mailbox_chan_available(struct fwnode_handle *fwnode, int idx)
> +static bool
> +mailbox_chan_available(struct fwnode_handle *fwnode, int prot_id, int idx)
>  {
>  	int num_mb;
>  	struct device_node *of_node = to_of_node(fwnode);
> diff --git a/drivers/firmware/arm_scmi/transports/optee.c b/drivers/firmware/arm_scmi/transports/optee.c
> index 07d3affa0964..6022f74d28f3 100644
> --- a/drivers/firmware/arm_scmi/transports/optee.c
> +++ b/drivers/firmware/arm_scmi/transports/optee.c
> @@ -314,7 +314,8 @@ static int invoke_process_msg_channel(struct scmi_optee_channel *channel, size_t
>  	return 0;
>  }
>  
> -static bool scmi_optee_chan_available(struct fwnode_handle *fwnode, int idx)
> +static bool
> +scmi_optee_chan_available(struct fwnode_handle *fwnode, int prot_id, int idx)
>  {
>  	u32 channel_id;
>  	struct device_node *of_node = to_of_node(fwnode);
> diff --git a/drivers/firmware/arm_scmi/transports/smc.c b/drivers/firmware/arm_scmi/transports/smc.c
> index 1079cd01190b..ee9e44468c1e 100644
> --- a/drivers/firmware/arm_scmi/transports/smc.c
> +++ b/drivers/firmware/arm_scmi/transports/smc.c
> @@ -84,7 +84,8 @@ static irqreturn_t smc_msg_done_isr(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> -static bool smc_chan_available(struct fwnode_handle *fwnode, int idx)
> +static bool
> +smc_chan_available(struct fwnode_handle *fwnode, int prot_id, int idx)
>  {
>  	struct device_node *of_node = to_of_node(fwnode);
>  	struct device_node *np __free(device_node) = NULL;
> diff --git a/drivers/firmware/arm_scmi/transports/virtio.c b/drivers/firmware/arm_scmi/transports/virtio.c
> index 6b060d61e0ca..3d608c8c4fe8 100644
> --- a/drivers/firmware/arm_scmi/transports/virtio.c
> +++ b/drivers/firmware/arm_scmi/transports/virtio.c
> @@ -375,7 +375,8 @@ static unsigned int virtio_get_max_msg(struct scmi_chan_info *base_cinfo)
>  	return vioch->max_msg;
>  }
>  
> -static bool virtio_chan_available(struct fwnode_handle *fwnode, int idx)
> +static bool
> +virtio_chan_available(struct fwnode_handle *fwnode, int prot_id, int idx)
>  {
>  	struct scmi_vio_channel *channels, *vioch = NULL;
>  
> 

