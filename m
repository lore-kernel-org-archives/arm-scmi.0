Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94740488D84
	for <arm-scmi@vger.kernel.org>; Fri,  2 Oct 2026 09:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935033; cv=none; b=sujKaXbqZCbb7MWcPZimXXcwss2jdIQgtbMiNMKEzHhHxN6TPJAmu1s7auWJxWtzB6TlUyRs1ILSgIooa064p1d4jqZejYneZkidjwQcpvDuBNbXgcbuN5HNKy/QufZQy5WQ5x0Zya/r5lwNmOAGfBfREmsNZqDDXksWgleidMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935033; c=relaxed/simple;
	bh=XLvE0pu0Fu8EE852FMZFLjwx9UgvEWmyoSNyEAxo+fA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=D9EYIwWu31cvCVE+bNIGRq52YRPjLGab1jQ/cr+B6qsTLytHY65T6ipWZ0QFgG0FDxhr5kDhnYL7NVXZsecC66zX7OIY4hlBf/J2dParC36JSpBdb0XAuOYBJ+TZrmhlGrvWFRZse/VegPg3ClvPzJ6ztciYrqnHgE5wexrl9CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DvfBbBtL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dd273DnV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DvfBbBtL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dd273DnV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929o07N1591213
	for <arm-scmi@vger.kernel.org>; Fri, 2 Oct 2026 09:57:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lP2wYjA1gyhEj52Ib/HTxStTq8k7si3x+Tdonkmtr4s=; b=DvfBbBtLShN3iUVr
	f9XGD0rMU1r00uBiTI8rMhWLUnVp0HWGPlIcabiuwIxKy9naOiq/zvj31GvSkqB4
	QZKMjEVCHRhcVJedb1+zW2Mysu1dDmFAqxvWW2yaM9ozr8i0idmCDO9x1IK3dbAU
	6QJTUxjkZlj2I1Mpl8y801CFCUOndCb4HAZqn5VMBVhHe3dGdzlDq18Z9ct+Tw+e
	kR3N5B5N83LW7G2O9LyD+2YrQe/FOZUkJYBls3WH85xWxY1+U0IsydVrobC0E8UI
	ShjxDYJ1/7/ct0gAg5Gk4bZ70l87UoweDW9tuwFSkhXRrQkzVH0PNBb4kqKiI856
	lrPhIg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1qukc9qb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Fri, 02 Oct 2026 09:57:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e46b4b700so30861985a.1
        for <arm-scmi@vger.kernel.org>; Fri, 02 Oct 2026 02:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790935030; x=1791539830; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lP2wYjA1gyhEj52Ib/HTxStTq8k7si3x+Tdonkmtr4s=;
        b=dd273DnVBZJFFm2FaP8TPsEYDbzc9iMXzO280M1kqccGEAVzEhKUNe/yRUHFrVnoga
         8fKIZ6Pt1WfJfX03jVLk2cf6BRxCBquX9n/p06gRohBQscwollKjFonEqHsNT+6Z7rBE
         nxkz8h3Hn83YVlzhg9CBdehgIYCoUNuJCyzRhC02i0+2bkh39PqZ0XhMV5FmF6FVPtqY
         x28p8+8Nv/ACVZDeDCnRfoFWAhbXLKbuoWC5nKTL2j4qC6TRphUijEoPkou1CcQeXGYa
         pIZ9o2bHLbtpqk4tcYmkdUTBmS7wdN2JU/I0FaI4FV1yItBok28uKyrhkPD6yxU6hCLU
         9U+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790935030; x=1791539830;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lP2wYjA1gyhEj52Ib/HTxStTq8k7si3x+Tdonkmtr4s=;
        b=fKXvqUmLyRylb7Y/+uVdb8TU3e4waOfjZjwiQoi2mHClTpdaoMT6W/W5WJr2ghSDZ+
         ajE8IztEDxxnIXDuDs5Wpx1hyiHE2A3xR6psOZZKaZsqLAOT2bofiZMVxhcDJQj8FgSN
         2zamGFay3GPeLW1peNTo0l9CzQmVxgPEacnzdYLmkzHQPGi6+vwgUrPTZL1p5jBWEKxc
         frBzbvgiyZKVffB+1f4+Pzr48WjxlnwEAWH4zb1DYkfCxpWIsyBBrzWWoYUEGI+/wzY5
         q0zQ47tGM+EFozganD3/duCxSDpUCYchKv0pgRm8q3BcVADSqGhOFvDBwkSvtXye1vky
         rtTA==
X-Forwarded-Encrypted: i=1; AKwUvBxpTPtwkUs2HEEtviT0YUKGVRQPUcF+Tph6fzGh3OZbctHlIojhW3vTXKU1j4SXDJPR/96qU6m7jQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mNaTBDgT4Avkw0goh+0AI4sVgufXSlYVDWOoxuGGOQe6BdpHS4
	VbR4cuCJq3YlAoFL+6mC3UzlMdm1I+vVVcImzf6MJySZ5XlASFwBv2bkVgXy44NeKltiGqurYFo
	KMILEMwU/r8mnifpFT8s+P6QbvRe5I/wlEnpTHcyGhiLwXgrohqgeHh8kj9WFkg==
X-Gm-Gg: AYBFou0jRYME6FMAEt6lpVzbofZUcgBNK9GIODOlh1BjUNllRPTr/uKGHxW/2jUybGk
	KPWU2Nrt28veZCcz4P304ovCpwpJsE/qqUO4XqqvDGI4v58Et5JzHi4aGOKAkf+ILJzVpy97vBd
	TS2rQ1b1kJhrX80/NcKL7epacMO/EjVKqEzgcRUM+0FMMQDna95Vj3WBUH0vCySzNMn6rxyR16+
	vCQSBUm0stW0Eb/lv+iYwdv7aJnqbHDkkyniqtYXf7zlEqcCtVJiWzTueDwO09lecG8onw3+5wS
	E5MF5xw9oEAb0XLWrs+t+1/o2i16SBJCF1Z4h87yteTK72aN95yZiW/RrLm6G0si8XyqChyQRSm
	fKP+hxZ+yQFmglYnK8gnVNn1u0O59LNI125M4pIyRaF7ks6DpVE7XILXK5OFqQFGOXbJzYVbo6G
	ospVYJOb1/SHMlcb7wMuff77U+/LKISIQzvJM6YhjgXMQazx0eWYfz6mdLy2tTGSs5rg==
X-Received: by 2002:a05:620a:4713:b0:939:fce5:f6d2 with SMTP id af79cd13be357-93cf16de7femr369305985a.27.1790935029754;
        Fri, 02 Oct 2026 02:57:09 -0700 (PDT)
X-Received: by 2002:a05:620a:4713:b0:939:fce5:f6d2 with SMTP id af79cd13be357-93cf16de7femr369302385a.27.1790935029190;
        Fri, 02 Oct 2026 02:57:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cf86035sm70783366b.61.2026.10.02.02.57.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 02:57:08 -0700 (PDT)
Message-ID: <6018e425-9aef-47c4-98bf-8578f3ea8c8c@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 11:57:06 +0200
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 1/4] firmware: arm_scmi: Avoid protocol devices in
 exclusive raw mode
To: Sudeep Holla <sudeep.holla@kernel.org>, arm-scmi@vger.kernel.org
Cc: Peng Fan <peng.fan@oss.nxp.com>
References: <20261002-scmi_bus_fixes-v1-0-8695cbab3fe7@kernel.org>
 <20261002-scmi_bus_fixes-v1-1-8695cbab3fe7@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20261002-scmi_bus_fixes-v1-1-8695cbab3fe7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzOSBTYWx0ZWRfX7rK8xQWYwrwp
 NTZTXN5E1jRqg3ld5x/RkO7CJ4wFufx2ARNsY/Qv9ug36SuB8ywCM+36ZY11TAQJqFRE4RLK+Ru
 XXSwoaYR6jCRc8ZYEArzQftF3A4kYDY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzOSBTYWx0ZWRfX09dlIu2g+QzX
 D5ua4MoS+Xo9bfHnf86jgzgVU34GrNd2gEhmku76xqWV8iRJm8vIE7rDrzZF1P3QbT0FUil08x9
 NXKmGNt9EyozgwkaBziEmOHy7qStItwohiAah27E7ag3Lx10GpmUixvUFAn7rFvmbAETo9IKMOM
 UNLNGqzaVAMkkEyz0jmcjIzJcgRd7aNNZswaOZQK6AoMhr0S8g99LErxr8oJFN2KPER6AlLeY54
 6k5fC2AwkNeUDLz1Ywef212/sGC4sKWyQKRc6OEzj5ycUTfmk02IEZvM/Bevo/C7OOGjvQKarFT
 xNYxOQbvFKtHvzi2wq3pyQhSKaVYy3JLbABOUpDQprNccUUN/YfOvs+wwQIeWz/76MlrrRUgRxx
 GUnHNQictafa+RT9z1zwiyInuY1H7jnjlYw+1zI898ZF9AGh4EofQOxfe/qn7ls8xXJOnwEZ4PA
 3LPK84y0SmOXDJwwr7g==
X-Proofpoint-GUID: 0Y0IUTS8NUGNn9dulTcFXfUeMi_RIB52
X-Authority-Analysis: v=2.4 cv=TdADJhQh c=1 sm=1 tr=0 ts=6abf7ff6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=ROgxBt_nIHit-rkumhoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 0Y0IUTS8NUGNn9dulTcFXfUeMi_RIB52
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020039

Hi Sudeep,

On 2-Oct-26 11:36, Sudeep Holla wrote:
> Since standard protocol devices are created without a driver request,
> rejecting SCMI driver registration is no longer enough to prevent them
> from appearing when raw mode is enabled without coexistence.
> 
> When raw-mode debugfs setup succeeds, scmi_probe() returns success
> before protocol enumeration, so it does not normally create those
> devices. That early return is not sufficient: scmi_device_create() is
> exported and can be called later.
> 
> Skip protocol-device creation in exclusive raw mode, including named
> non-transport requests. Keep named transport devices so raw mode can
> still set up its channels. Share the raw-mode condition and transport
> name check with the existing bus paths.
> 
> Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Fixes: aac4e67d6eb9 ("firmware: arm_scmi: Always create devices for standard protocols")
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
>  drivers/firmware/arm_scmi/bus.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> index 25197197db8e..f2e2ed56bc32 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -36,6 +36,12 @@ struct scmi_requested_dev {
>  /* Track globally the SCMI SystemPower protocol device. */
>  static struct scmi_device *scmi_syspower_registered;
>  
> +static bool scmi_raw_mode_only(void)
> +{
> +	return IS_ENABLED(CONFIG_ARM_SCMI_RAW_MODE_SUPPORT) &&
> +	       !IS_ENABLED(CONFIG_ARM_SCMI_RAW_MODE_SUPPORT_COEX);
> +}
> +
>  /**
>   * scmi_protocol_device_request  - Helper to request a device
>   *
> @@ -60,8 +66,7 @@ static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
>  	pr_debug("Requesting SCMI device (%s) for protocol %x\n",
>  		 id_table->name, id_table->protocol_id);
>  
> -	if (IS_ENABLED(CONFIG_ARM_SCMI_RAW_MODE_SUPPORT) &&
> -	    !IS_ENABLED(CONFIG_ARM_SCMI_RAW_MODE_SUPPORT_COEX)) {
> +	if (scmi_raw_mode_only()) {
>  		pr_warn("SCMI Raw mode active. Rejecting '%s'/0x%02X\n",
>  			id_table->name, id_table->protocol_id);
>  		return -EINVAL;
> @@ -210,12 +215,17 @@ scmi_protocol_table_unregister(const struct scmi_device_id *id_table)
>  		scmi_protocol_device_unrequest(entry);
>  }
>  
> -static bool scmi_device_is_transport(const struct scmi_device *scmi_dev)
> +static bool scmi_device_name_is_transport(const char *name)
>  {
> -	return !strncmp(scmi_dev->name, SCMI_TRANSPORT_DEVNAME_PREFIX,
> +	return !strncmp(name, SCMI_TRANSPORT_DEVNAME_PREFIX,
>  			strlen(SCMI_TRANSPORT_DEVNAME_PREFIX));
>  }
>  
> +static bool scmi_device_is_transport(const struct scmi_device *scmi_dev)
> +{
> +	return scmi_device_name_is_transport(scmi_dev->name);
> +}
> +
>  static int __scmi_dev_match_by_id_table(struct scmi_device *scmi_dev,
>  					const struct scmi_device_id *id_table,
>  					bool skip_transport)
> @@ -591,6 +601,11 @@ struct scmi_device *scmi_device_create(struct fwnode_handle *fwnode,
>  	struct scmi_requested_dev *rdev;
>  	struct scmi_device *sdev, *scmi_dev = NULL;
>  
> +	/* Exclusive raw mode still needs transport devices for its channels. */
> +	if (scmi_raw_mode_only() &&
> +	    (!name || !scmi_device_name_is_transport(name)))
> +		return NULL;
> +
>  	if (name)
>  		return _scmi_device_create(fwnode, parent, protocol, name);
>  
> 

