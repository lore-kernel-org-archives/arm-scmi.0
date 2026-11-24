Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795564792;
	b=4EN37S90Pvs05agt3fimb6ZVHs0LLqWbAw1msCsV26mkZFYx7Ej2ES8//6/D0D2Yq2sc
	 eGehIWi+oRErt9UkTXMcBeLWV1H/M1RjWe5izC3HZpMIgaDqFxHfsDysBvWZS+0jB9Zgf
	 FtAwdh+nM6zL0S1mwp71p473sBJMW9S2+1OtyZsrb1NZDNgk2lEtKVXLF2GPfdC6Ur1v+
	 8HD+NlmeYPK1+Gzf4e1A7x5KVhVn3mzaM8RIo41gheVloIYuk4o8Wu9pEcm9iAG92yQNW
	 Q1NFJgpHB7ffMfwwWmcXiQIx/WXLqAwZp5esPECwIgBBNHy8eoFONF+1+vnbymA6U1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795564792;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JbGMGU3Ni5klOILvUXiLZ0e6e10FjAtQOC+P8hG45Jo=;
	b=zD2SfqxeuVMHBjEPkSBOc/Y6lrBxZF9dJueNF7ZjpOHNF1VnyZ8OBArLVsLVZUNO9laf
	 /n1+rs1/CbHhQb3mlyzIigGVH+/tjIlbvnwHzkHswcrvA4oIJuQ8BGjRaNxBarLBT1ke4
	 g+MoqAnESbCx9Z5q5FLco0XgFRc5BfiHWKaUzk7wFOi3GTmsLHi16Dty6HNDuAmMBUPrM
	 akJLnNXw5GVQt37IbVshfbusCpAPrSZdb+p4oq4fbxvB8eIkDgEhyQL6E6gr6f38mUV8D
	 ZTCy5WC1zZ9eF94Go7xx9Y19j6UIeWp7s1OOsjsGyy0hXRtDMl3SPqXFtaaGfrcFT1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fvTDaTI0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L1wzSz+m;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81BE606A31E
	for <arm-scmi@vger.kernel.org>; Tue, 24 Nov 2026 23:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C81BE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fvTDaTI0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L1wzSz+m
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMakvc2287410
	for <arm-scmi@vger.kernel.org>; Tue, 24 Nov 2026 23:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JbGMGU3Ni5klOILvUXiLZ0e6e10FjAtQOC+P8hG45Jo=; b=fvTDaTI04iPBE2tG
	fT2dwxkTu1GMDapg5uyWy8BRGAZHsY0cNlcPM44To5jMPkYrRdBpEUqcu8bSIsEf
	9rLlSv3gScNWirlesMvhM9T4LRVJWij4ad5BTLcH0NO6WLRtHiL+uANnJV+dan3n
	5KjKUEEJZ+C3Im2ixhvi4jaRaZ0HJhtFTkESP1MM0erMHPhycuqBKlutRxM+xr1n
	AJ4Lj/ZbsFygB5XZ05EXlGtJhWQLZgBSKa8qrDtDYLwk1HeJfY1pWHa71i0j9XOU
	DEm8/9PzJBLysnAyalWivhojUx54wvDnIJ1yF7OrctOXRkA6geGXAPpufSFWBeFk
	bbh7qA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5egs9ghm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 24 Nov 2026 23:59:50 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386a65fca25so3957727eec.0
        for <arm-scmi@vger.kernel.org>; Tue, 24 Nov 2026 15:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795564790; x=1796169590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JbGMGU3Ni5klOILvUXiLZ0e6e10FjAtQOC+P8hG45Jo=;
        b=L1wzSz+mxj7v/PUNvzFmam5Moij5EPD27ScRLRSDcdHM8ymQpWRy71KTiuj++t7brb
         7Ffnc7/Wu17vmvJ3f28s34D9sTRSgAZLJr0x5UmDUjCbiM1sVL005FaVxci5gG1jz6WU
         fkE32DyvLNyLWgtP/SmcXrNnr8S0vCgwGgl0hUUQNCMoa0xVlmEjMbGCDbP6PXKO6GXo
         yzbU5jXEazksORzdnbFK4sbxTW3hmCL2Toa0Uz2OygSbFDYj2/c938lavtf6UledxQhV
         YRF6NAn0Sx+C3FZ5+XF03qmGwd7AIYXzDZd0sSOZKK9WPg1Iyz4X8s5iua6iwbdTEp08
         uZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795564790; x=1796169590;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JbGMGU3Ni5klOILvUXiLZ0e6e10FjAtQOC+P8hG45Jo=;
        b=xokCEUZhhjDUJ5qhw5k3JOfnGp2X2/5FSlBi+wRf1PRjcwnxfM+E95Lz7u454Q7nyD
         fygTnwO7T+84Wm3F1Tc48n9cDamR09PKIbRDjt5g9iRzjLi2HLNVqq4vKCLD+zMfY/Cf
         g2EWsuRaYnR/6lTBOHUZyMrNG9I9egH9OolreUFo/waXrz3Qh8d3CqmjivfORRfGw4NW
         2AZBJh7Qu0xG251D7BVwKAtzMXjSFTsdsXNP0i406hiYzw/7RqY0NJs52TZm5vyivr6f
         EKQBgP1bfXnq0zyRwD8DDr1H/c0UwymcA25w/9ppq3kLnLnbNK9RD8F3d/S77Sui08G9
         XWWg==
X-Forwarded-Encrypted: i=1; AL+hErEYav96s7jANaws7W36/Q/wFRIT3K5fR5yOiUWE8zQHOr/1m6kOpx0HxihWbkRQoEWE7EXlnu4gDQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+O2imzOODOZWjiQGiWq7opqnwnnpp2Ke2GzlDOhl7MjLjYmfjy
	CKXu23qZLpzAiY2OIiF2rifzHRKcms3x8EQfiyS8oXiRM8/oa5AgHtWEI0uXYqYQobz3GuNgt2h
	CaH9T58e/Rdo8uCgrZNPp+DrgqjzAjPm7I+cKTfmlKpffHEqzf7k4vHw3BB/sVA==
X-Gm-Gg: AZFdTZe53coks/WX5W2p1hwADY2g0kgMvtAb4JrkAKEAigOQrPfC5FPUmmXdIub+B6p
	1KI6c5h7aJHKi4P9r8wHbGGx+zEwH+Ea6LW3e59IXn/yCkP2W0ufEgm6790WJ1DpkQaab5EX/dN
	JzcKUVE6pDMbu5OG2/CFpbHIHrcS2M2JfL/e8f38uIswZD55AeBBsjqaEELCuU5OAuHeoCIizCh
	11/pDgE3s5B3R00OKvNjHUI+MnD89MQ4vnqby4W8frSQVNA2cNCsKfqsfuIY9hspB1QqH7kchk0
	UBdy9ATo/sjLhd2JnYwJwXTGhzvk65zgEX8y0wq3yUv+Nhr0HJ6wZKXT1YTPbn4y67Bvo9LB8dK
	vxsccMhAZoFni4BTxEIyRPgPleUC56rQV/RA27trMWC/mfO7sd21xet/y2p6j4BzTNHUl9GwzXL
	2CAse8xwDERDRDRQKSOy8wuhLaPmg=
X-Received: by 2002:a05:7301:2108:b0:386:b99:8ff9 with SMTP id 5a478bee46e88-3860b999354mr14495401eec.40.1795564789583;
        Tue, 24 Nov 2026 15:59:49 -0800 (PST)
X-Received: by 2002:a05:7301:2108:b0:386:b99:8ff9 with SMTP id 5a478bee46e88-3860b999354mr14495349eec.40.1795564788926;
        Tue, 24 Nov 2026 15:59:48 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm15214484eec.9.2026.11.24.15.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:59:48 -0800 (PST)
Date: Tue, 24 Nov 2026 15:59:40 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v17 11/34] firmware: arm_scmi: Add Telemetry basic
 attributes enumeration
Message-ID: <20261124155940.0000336d@oss.qualcomm.com>
In-Reply-To: <20261124194841.1147072-12-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
	<20261124194841.1147072-12-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA5NCBTYWx0ZWRfX6+qf8dK6zqqg
 j1TK23Q6TID7mYiyVM8qtdg/jtMXY957uBIW0wt2Y6FlEoqFffvmqywNeywgd3BxFiDJ7dSwiZ1
 IyYWHF8EYkEERVImjDJbH3jAimCNFsb2UwHfZpptd5U1CmTtwmeFQVVp+aax08Dyq/WwmzK+Zw8
 VzRmShjfaWVbQCfb859cd3xtmGlcMnILL19njXMwAn6g5WSp20pBLC7sfRLWJiFBWs46KS475Qw
 LeTOD6HZsDkh/VTt/dV/oFd05yQShnY32iz61oxQQCB9NGWoK76iRjS5KFBXFtm3TSdHFCrj37x
 rArVOgGtcQ1iCuTpxui+TDoO0EzjlGi8T14QgR1/n9Gt8oITy6g9/eLakCK1vVx72kxQA93IRPP
 jbuDSbWIwgdHZm+FVTid6JP+hmJ5Z74h75jN0B++HzSTdFiBqWgt5iSppLkm4Ng/FRmDrgqSpKx
 ao9mGtlmPQYppB+O24g==
X-Proofpoint-GUID: fC2Mb0ztI9La5qaTgVutrICU-diFyfBC
X-Proofpoint-ORIG-GUID: fC2Mb0ztI9La5qaTgVutrICU-diFyfBC
X-Authority-Analysis: v=2.4 cv=Zt54uN7G c=1 sm=1 tr=0 ts=6b0624f6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=AXIch-7a5tO8ZeyO9HQA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA5NCBTYWx0ZWRfX+rSqkQflK7ea
 yy9aADOKaYcKpbKg5hRkoSYGp9pwgFywjgs8QoRShiHWs8WJtlRtcQ0IWgnHhdXmcVmz1S8pXVg
 1MyRNK1xRotiRkvEpLY5ixzy42Sishc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240094

On Tue, 24 Nov 2026 19:48:17 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add SCMIv4.0 Telemetry basic support for minimal initialization and
> protocol attributes enumeration: expose telemetry instance descriptor
> via a simple information retrieval protocol operation.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> v15 --> v16
>  - ignore groups

Partly... Need to do a lot more ignoring to make this true and consistent.
There are a few things in here, but key is we need the whole framework
to be as unaware of groups as possible. At least up to the userspace interface
layer where we may need to ensure extensibility.

Jonathan



> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index 3f7cc35eb861..f076ce5601cf 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -2,17 +2,19 @@
>  /*
>   * SCMI Message Protocol driver header
>   *
> - * Copyright (C) 2018-2021 ARM Ltd.
> + * Copyright (C) 2018-2026 ARM Ltd.
>   */
>  
>  #ifndef _LINUX_SCMI_PROTOCOL_H
>  #define _LINUX_SCMI_PROTOCOL_H
>  
>  #include <linux/bitfield.h>
> +#include <linux/bitops.h>
>  #include <linux/device-id/scmi.h>
>  #include <linux/device.h>
>  #include <linux/notifier.h>
>  #include <linux/types.h>
> +#include <linux/uuid.h>
>  
>  #define SCMI_MAX_STR_SIZE		64
>  #define SCMI_SHORT_NAME_MAX_SIZE	16
> @@ -828,6 +830,35 @@ struct scmi_pinctrl_proto_ops {
>  	int (*pin_free)(const struct scmi_protocol_handle *ph, u32 pin);
>  };
>  
> +struct scmi_telemetry_base_info {
> +	unsigned int version;
> +	uuid_t primary_revision;
> +	unsigned int num_des;
> +	unsigned int num_groups;

My gut instinct would be to introduce this only in set 2 that adds
groups controls.  The best form of no groups is no reference to them at all
except in userspace ABI where you stub them out for now.

> +	unsigned int num_intervals;
> +	unsigned int num_shmtis;
Ideally grow this as you add support for things. num_intervals and num_shmtis aren't used yet.

> +};
> +
> +struct scmi_telemetry_info {
> +	bool single_read_support;
> +	bool continuous_update_support;
> +	bool per_group_config_support;

Logically without group support we don't care.  I'm less bothered though
on whether you rip out a simple support bit but if we are going for clean
separation this would go as well.

> +	bool reset_support;
> +	bool fc_support;
> +	struct scmi_telemetry_base_info base;
> +};
> +
> +/**
> + * struct scmi_telemetry_proto_ops - represents the various operations provided
> + *	by SCMI Telemetry Protocol
> + *
> + * @info_get: get the general Telemetry information.
> + */
> +struct scmi_telemetry_proto_ops {
> +	const struct scmi_telemetry_info *(*info_get)
> +		(const struct scmi_protocol_handle *ph);
> +};
> +
>  /**
>   * struct scmi_notify_ops  - represents notifications' operations provided by
>   * SCMI core

