Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD52FBA34
	for <arm-scmi@vger.kernel.org>; Sat,  3 Oct 2026 13:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791033332; cv=none; b=HPzL9/ZVgdkNccnIKAL0svkNmal9PADPBtwBAH8ps7xoOJsffQz0QvnjFPDzm8LFpUNe49MUqztC2/gBSrpHw9mUGNwKFKmrhusk8LnPAFT/R8fNWZoFIRFpUO6o6jqXLmY9p2ehRKeBySOza9emRPaKUDlecWpC6pkLmmdX9jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791033332; c=relaxed/simple;
	bh=wer/QrDNyBn/dRPAYqb6jLiP7xEEWCETzAMLAP1V6MA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DT78CbK1PxhmctBMEgGJR+Tkrb+NV8pKzx8mVR1oTa7V68EH05boABPrGnF/LvW5CSFjPi5MlVOTa+1PVXvt2SGTmJPgDSV9l6o62NCwZJg4IRuC594HasEMLc8xKobZkzBxlqR+yJ4nUms1v5Yq7FLXmpz/NqE4eldEs9uk4Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pu966JqW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O92y+wIw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pu966JqW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O92y+wIw"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 693Attnp365542
	for <arm-scmi@vger.kernel.org>; Sat, 3 Oct 2026 13:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	73v5pbRnJoA02apBd5KYHOoqqU14zpfv9GVeIvcOWO8=; b=Pu966JqWctmeqW+R
	zgIkT1pFxP/6gwXSGJXxYx1I8nkOfATMChgEQ+9gf4aClioL+32SL696VOc66ps4
	0kMxF0v7iyZvlAvog9SVZ4KovqlWUmJR5bgCkSDQQ9JqX3DQ3AE07c10EhvaR2lg
	Z0ssq+7R6tgIOooemohF2fh2O4/fnY6qAZsBWn3dyUZgv+bEegXf78ZkLyAxQF8S
	LeWwh1POd6SvCvNkyRHYGobSETVOKY0/NG/IuexURJFX4ktxzE65snlxQrWcW1uX
	1A0Y8RCv+7/kdsvkuV52OgV2x0/GD4kntI3Ok59V+TINQrd7uR26Uxt5lGlEnbso
	sao1Rg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2spa0w28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Sat, 03 Oct 2026 13:15:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ae8e7e546so46852285a.1
        for <arm-scmi@vger.kernel.org>; Sat, 03 Oct 2026 06:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791033325; x=1791638125; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=73v5pbRnJoA02apBd5KYHOoqqU14zpfv9GVeIvcOWO8=;
        b=O92y+wIwDCxGEUkIN4a5g6UZBD5j02srbSNesBL9BQPWGID3pNY241aCANkc+gNOPK
         HJQyyF6jLPC8Wrk8FaJYuk+PXnaOK67sL0p0K2Xig4NcH7+/3zLiKzg/QgFXEcqkjAPx
         s3GEI/dN6bOsndyyHv8TqHrZ0ZzG72UYiOHnJa+PkutpD+7ltawckwvHatugi3CjRjxi
         JYAFRsVwC3fUu64ph2lQCIFmdKvo/7wL7OKhJX07dxajKkdclRR53eOVpEMRLf9sqeM/
         zo4OLpo0ULunNefnDDodANolQK9f8uD9i0/cl3DeCuU6Ml83CEsVIPTAWxSrbL5oa0Kn
         VSug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791033325; x=1791638125;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=73v5pbRnJoA02apBd5KYHOoqqU14zpfv9GVeIvcOWO8=;
        b=rrkX1A1VlJjLzQzPhfDcS+4Kdx9kMRLrlySgtA+a45PRV45WS9ZTJdhxpES1TUXeik
         V4deqpntkQ8pq4QIlW8PPP1dWOETK10GzVAWEMI37R/u2Ze0G8mTAHM630a1oR1I4lBB
         a/AZMmVFuaT8bjlmXRU6OVES2FPeufrr4PTUXO9R/CnTENegDB/rJmqy29MDOmRMo1Uq
         9lA5dVElGG+hYn5LRB44Qf6X3YUAEhGQHOIoFsqlfahJboGqhyUNohHsLM26E6TY4SrT
         wxYjkGGtvn9ZHCN9xib//s2orMRQ4Y0purwkuH1EX8QHl52rNqzCu0O6RJqVqzLS+iZy
         hN/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzA/CzscQGcj4RtYmb90/i7tC0VzKWH9DCH16Dfh86hf/FKfHgBIUIxT5AJMAcEBibpDoTlJ09Ojg==@vger.kernel.org
X-Gm-Message-State: AFuF++mmuTriq+YWv/u7F6CH2A/F6XdhnioPncj9hGIJ5zXc11KyvZeG
	h79IsxX2PZS0zqTi+nFYiJPYVmCzpcev1CBPAIxmU8u9NWtZZt43rGEJBkclpR/j5fCmejhY2oT
	3KGIgmax6+OibPjzRhTHmZ7eh50HOf2Cw+fGlsOx9N5U3O4Kb+JV4sLpPs8o6Bg==
X-Gm-Gg: AYBFou3fg1LR1X+qiJqd4zM7z53mNeA73O228NqBjMq2PM5QjO3AntGvmVbV0Ht/YmP
	Vbcr/K/WFCDgZfkDSlQOTwTiSZb8ExQujEwhFLV/cCOdVmzQO0o6YXE8/H+HwpyLST7EEydqEHC
	QoZe8VPB0HnKOjXtXs19XFEruE/TEBIpUUBQFMNSsCbrohE1IUBF28lg/wiC5kSLL5rbMsVQDg3
	7ivtVlci0PK3DMP9t+CPJTkmsXr4W0G+ZHI7ZIiTsjZI5TulAR1kr8g+cZLZkdVobcQdMxcQe1U
	PbJ0h6ZKYPXMu8M5tZZBEjrf0OgIZQz9dQhiNJ0p714ZQdbPnBwF2bV9zjlSmUW470BB4+DAcR2
	Bibt1bWr/QPpixIkox/+/BYJh3euMsaGuKkTvJckfqlc2+MCgz6hu5o7JGcAnONWqVcOY4yDfPF
	Vd0biKeyxmuQjFQfIGClId5FyPPMr7EVUUc/6BiJkrCJ4EjR9poQQ0bGbT1B3dD77WybQ=
X-Received: by 2002:a05:620a:1b8a:b0:93c:6925:dfee with SMTP id af79cd13be357-93cf188f4e4mr1079919785a.55.1791033324814;
        Sat, 03 Oct 2026 06:15:24 -0700 (PDT)
X-Received: by 2002:a05:620a:1b8a:b0:93c:6925:dfee with SMTP id af79cd13be357-93cf188f4e4mr1079914985a.55.1791033324299;
        Sat, 03 Oct 2026 06:15:24 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb0227a56sm836414a12.34.2026.10.03.06.15.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 06:15:22 -0700 (PDT)
Message-ID: <f33e6049-44c9-49ed-9d26-ed50e08c6b61@oss.qualcomm.com>
Date: Sat, 3 Oct 2026 15:15:20 +0200
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] firmware: arm_scmi: Skip unused performance-domain
 devices
To: Sudeep Holla <sudeep.holla@kernel.org>, arm-scmi@vger.kernel.org
Cc: Peng Fan <peng.fan@oss.nxp.com>
References: <20261002-scmi_bus_fixes-v1-0-8695cbab3fe7@kernel.org>
 <20261002-scmi_bus_fixes-v1-4-8695cbab3fe7@kernel.org>
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20261002-scmi_bus_fixes-v1-4-8695cbab3fe7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDA1MiBTYWx0ZWRfX69gLBFuq2lh2
 fkyVaGFHQZAfdNiIj980MTXBFsDpoYCcvf5ZWwr6Jaz/YWatgYk1IYcDmaMRF2ODf0f40V32B5Z
 7PPLUPagDZbFuxZHdwxwZJxmm0+TXhWSRWGMaX7T/cQVe1FKtrZ5cK7uwazw6WIget7u2JGrPIs
 zBC9nq5XcpRKCeUOC/fb9MoF1sy2E3Rd5Pfv1uMRF6w6hY32x8cBpms6REqSStxolEh94CZbHEX
 alVVyxyfKiZ5kM4+kDr+E4zJ+LJOAC96jcbXTOX5/WgXR+hPORe3z6aOwJDdmTPToVvRG6hjLjM
 7rNn5JWviM0yk7NNlqnPuFk6RdlMlwwVLKcyWyqVwBatSxY8BeiUGxvwdn+8rmlsJ5H+GiTRNI2
 a4Im4izfce67WMthqbysk8e1xHi+ovTJUbzOrChkH8dL09QfbVj01GUZCAzBWd220Ue1GNOmlDC
 GmpImnTloj2xHkodrmA==
X-Authority-Analysis: v=2.4 cv=b7MncdGx c=1 sm=1 tr=0 ts=6ac0fff1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=JrLxGunq7KE4Xhz3aEsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: No6ESU8cMA0qNmBimAwAhd0WTqi9frB-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDA1MiBTYWx0ZWRfX2WRuaCsirIDa
 iE9xp0HxVjqOxBnMVMH2qSJzPGr0u3FeyCxzjoumOjWszEvmb4Ya3b+b8w0lllaf2+v4lgd5O9Z
 u9OYI7jTGzJsDut5MqqCm67PA8iK6HU=
X-Proofpoint-GUID: No6ESU8cMA0qNmBimAwAhd0WTqi9frB-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-03_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610030052

Hi,

On 2-Oct-26 11:36, Sudeep Holla wrote:
> The SCMI performance-domain driver uses the named "perf" device only
> when its firmware node declares #power-domain-cells. Otherwise its
> probe returns without registering a provider, while the same SCMI
> protocol may still be needed by the separate "cpufreq" device.
> 
> Do not create the "perf" device when the provider property is absent.
> This avoids an unnecessary device claiming the protocol fwnode and
> leaves cpufreq creation unchanged. Update the device-creation contract
> to document that an intentionally omitted named device returns NULL.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
>  drivers/firmware/arm_scmi/bus.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> index 230ee9f6f1aa..9a9a816eb119 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -571,6 +571,11 @@ _scmi_device_create(struct fwnode_handle *fwnode, struct device *parent,
>  {
>  	struct scmi_device *sdev;
>  
> +	/* The perf device is only needed when it provides power domains. */
> +	if (protocol == SCMI_PROTOCOL_PERF && !strcmp(name, "perf") &&
> +	    !fwnode_property_present(fwnode, "#power-domain-cells"))
> +		return NULL;
> +
>  	sdev = __scmi_device_create(fwnode, parent, protocol, name);
>  	if (!sdev)
>  		pr_err("(%pfwf) Failed to create device - protocol 0x%x (%s)\n",
> @@ -597,10 +602,8 @@ _scmi_device_create(struct fwnode_handle *fwnode, struct device *parent,
>   *
>   * Return: The created device (or one of them if @name was NOT provided and
>   *	   multiple devices were created) or NULL if no device was created;
> - *	   note that NULL indicates an error ONLY in case a specific @name
> - *	   was provided: when @name param was not provided, a number of devices
> - *	   could have been potentially created for a whole protocol, unless no
> - *	   device was found to have been requested for that specific protocol.
> + *	   note that NULL can also indicate that a named device is not needed
> + *	   for this fwnode, or that no device was requested when @name is NULL.
>   */
>  struct scmi_device *scmi_device_create(struct fwnode_handle *fwnode,
>  				       struct device *parent, int protocol,
> 

