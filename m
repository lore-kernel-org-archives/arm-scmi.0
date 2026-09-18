Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB1F2E5B02
	for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 10:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726400; cv=none; b=ac0633z4nA96HNHOgMibAP2JmYF2igDFE4FUc04CqbOhGOl/lHkRB+dFhDixxpwjsp4c8ToSgoX3Nzw+8iPuqbXeDLRzx1GqEEEVGenxh6ozyUsxQLrfJVxnx7bjVIYHFXD4LINCTAYG98JdJ4QzlE2LfGDDEfqFKytfGJq7AsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726400; c=relaxed/simple;
	bh=ItKb6XO2/XDUSUojUIMmcg3tfa5IbP14FHAxsC8QauM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NOE5fNREVk1LzC4FYxAtXXrj8Uk7hI2VF5MjtHwzHyK8nCSos5Ksszctz25pwEmmnbG9uFXzpFIUJQg4nqlhGCqyfbSpbRhhTnzWBKB/KXlz89q04gMKx/DIelf0AqmPYHU4vEyQIm8UOYKdLrJvzqZ3PKXpueSb9GrVXz4tb7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GYrEFTaV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WgXMGXsz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GYrEFTaV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WgXMGXsz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dawU705553
	for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 10:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J0Yw7Fx/hFGe8hAKBYaSSc1ucE/f9f698gB4GVeKBZ4=; b=GYrEFTaVKgXlmTVL
	FdIUe/gOgfaQNgoApN9hwMcMyZYpiVb87js0w+jlRw5HZTJt2YA12liBgJ5avDWx
	w6jnDY6sr/HfJ7qG2RRYllo0Zjc139ZmNufJTxmE9A3HhCUmyLtoCv/ub5l6Uw92
	Ym9/7PYxLhrNPNpIQGCgSfOb1dlvJ56MlVo/nX8rsOG36fxRBbgYqhPHUaWZ4aXk
	tr4/8JLjw43i+58RgJfNK2I0fFnPEK4eYzZFAVT3l0xAmZSAvCO6Ean2l4R2LbGV
	heOvq67fpXSaHWc5nqD9HFOsgh2pdtMuX0juKA8vFnMB7I0F4f7cedysaUBjulgC
	ei4tLQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grxp2s80s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 10:13:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a00c70d28so84958985a.0
        for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 03:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789726392; x=1790331192; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J0Yw7Fx/hFGe8hAKBYaSSc1ucE/f9f698gB4GVeKBZ4=;
        b=WgXMGXszMxAJJh1swuEiRTG0s7XYuCQOzBWDsNxFuJli+nlMVpR27eOQgKMSo/xCjd
         6IOs4Awn5b2PfTKVDvYdmnjGFZHU9+sXuig8uSMCjO/rWqFAKOMylR4eOCEV6dwHZfI6
         zekWWzQrafGATtl397T9YvvsGQC1VtRow/vMjHRxaiJBmZBNSghrYB0u0mWMjchyKgIK
         d89fXBsaLTW516AD+7A2wwv3KFabLLhzTB4eCh9OnLxxNaIH2FTJ7eNV7cjITAj/WlpC
         fkwliMpsQk9iS0U+yjb+SvOph3aEs3Hu/RXArtTSKcr/Eawwdm9KhoJN9H0/0nyWVjGd
         1Nuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789726392; x=1790331192;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J0Yw7Fx/hFGe8hAKBYaSSc1ucE/f9f698gB4GVeKBZ4=;
        b=lfhbqrdi2zJ/PAUnQYkrUDC97lisK8ilPbrFB3uCDpfG4R0o4Dee8jH3I0LsMSTbrU
         QPbFInHzYUvq5paa+SSCCjbXnKVhtJmD/W/vO+CjftAYI32kV2bEvAX7AFgSKGhn8ubT
         LgkAG0hrnu39O01LcgBkHmmzeQe5padrRIHS01833t2NGqDrnLfLgv6C4nmTE3BhjHKz
         bIvJiSqo7LoADGnKjloKQhKwd4Rri+ch0YQW2Vcr4uoO20qZiK0qYKzyCprsvg+pHkoo
         tb982VrIna+ezE8j3Y6qz32FsMRXOGPtRkXVbAY416mhdPgHgSyREvG9X7d6AOXjAojY
         iNkQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8zsrv3AErkHBMttwwE1af/g4S8GfqJOlDBttlUHqpVf2j0ZHGQW7FNl6pS0F6ZyvMKib3yqZfow==@vger.kernel.org
X-Gm-Message-State: AFuF++mBmsx6Gr87uQtKqBcvfUqJ9KFzOD1Xv1BGGaQh6W//JNgVwRi+
	ljqSs5wh4AVoZ53Y+4pyg60wQvkruhprSaUlYkYCbFBiq10b/a+iWI03/jVGajknvPGNnagypPP
	kP6TWZG0iKYIB/BKvBAVE0vGAlt6MK+EKAka8slFMXZpkXdq6GebV2/stgfLRBQVSOHgP6Q==
X-Gm-Gg: AYBFou2Qh3UyIzxfFOFyMAMoYDAHiPU6AW+OJPEbvVf0fwiO52kAtbsAUr2KsuzAS5O
	H0XuUXuXKLnoovJ4VtByRQKc0WvFHsQsvElWnop9TkxSDd4Tji5LYuLkw6E/XtsEtyvKlDUOm3U
	tFHNQgqi9mpH+b4KttnIl50qRcj5YVYtlfH7fKYKmv9cm6Gcx48d7I5iuwN8WbmYHZfyhqGUJvT
	1UQ1JZDsGgLnCjfVER6o+PnWQ4gCE1e8+vGzmgAVmXUU6v7TTkgNbMRYzWO8IWCuy+MHr295RB/
	T62/WFzYHS5YZDB0fDshwBlrJvePId+Uit2h+ZH3BZ8GN9TJMDVcoUcBIuS1j5/Wi9eobTZoMbP
	WErNCpYW0RriMRNyeUoCRBDYVeuyZ2AIAsdu3BwUsvtjizKjrvRw8aYU1OEJrdLI=
X-Received: by 2002:a05:620a:27d3:b0:939:710:536c with SMTP id af79cd13be357-93bdc8c8c09mr231184685a.43.1789726392484;
        Fri, 18 Sep 2026 03:13:12 -0700 (PDT)
X-Received: by 2002:a05:620a:27d3:b0:939:710:536c with SMTP id af79cd13be357-93bdc8c8c09mr231182085a.43.1789726392001;
        Fri, 18 Sep 2026 03:13:12 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:82ae:cd75:d970:e66f? ([2a05:6e02:1041:c10:82ae:cd75:d970:e66f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7b7a6d9sm36299205e9.2.2026.09.18.03.13.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:13:11 -0700 (PDT)
Message-ID: <3f51bf6c-5318-4e32-a1ca-3ce8cf8c4ceb@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:13:10 +0200
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Frank.Li@kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <2104f437-e960-4e55-b0e1-2b37126e8c2f@oss.qualcomm.com>
 <82a72918-7bc7-4e2c-892c-0dcdd6dd5548@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <82a72918-7bc7-4e2c-892c-0dcdd6dd5548@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0MSBTYWx0ZWRfX08gl3BA9m943
 q8lNsv2pirYEsdHEXQkSsvv1xw614jxiVbBKhe5MmwLP7SPVKqdzKttu0j/hqr9Y2OcZVIWOkYl
 ZqRiF4yhn04E4imt8i5VKZjnezzxFxk=
X-Proofpoint-GUID: nV3zgGX3fgj3W9v_qyQhVLEy_YuhKYnV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0MSBTYWx0ZWRfX+YaSIGhAGnc+
 jnGfsMqTR5yXtTYshWlng6YPJEgGeA99Nk5LYZookXgwoVURpU4kDvQZsLoLOcCZw4qUKReOQso
 SqHUUQR45mbpwCIS93pCx08n0ymtOM+a56suQmNXqTsgEqGneklFlz/VtaU8OB28e9fmXMPNsyg
 vaAD+Afujii0UmVe2bvInozEZmBSVGuN1ITBRGSRORQQVQQUlnS2s/f7Qkx2fZ/n0ZvuMprK4EB
 T2lnmShAxXb60xBztL6flPRam8KY3NoINriGsk5mNgE0TtIAn99Gcy+h5qSPg3YxJWLmlkJ+t3K
 VQ1dDE6/6pR9lc6Ssf7JLgqLW8tIqSRnr96ZKdaB0u4lnPk5Hc6vruCRuAAzgtaVkySPo0YMEhs
 ugW7YKokUJTYPIvo+N9k7MDG/DqgMgMa7XUmFHdU66fxPXMg4+Wr1OwZRkNJwHojeu8f71pFYuE
 yAIUnHusbuFdamMSXYw==
X-Proofpoint-ORIG-GUID: nV3zgGX3fgj3W9v_qyQhVLEy_YuhKYnV
X-Authority-Analysis: v=2.4 cv=cNF1IVeN c=1 sm=1 tr=0 ts=6aad0eb9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=OcJ0dzw6xdPU1XpcOr0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180141

On 9/18/26 12:02, Hans de Goede wrote:
> Hi Daniel,
> 
> On 18-Sep-26 11:53, Daniel Lezcano wrote:
>>
>> Hi Hans,
>>
>> thanks for taking care of that
>>
>>
>> On 9/18/26 11:29, Hans de Goede wrote:
>>> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>>
>>> SCMI client drivers already describe their bus match data with
>>> MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
>>> SCMI device tables. As a result, SCMI modules do not get generated module
>>> aliases from their id tables.
>>>
>>> Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
>>> visible to modpost, add the corresponding generated offsets and teach
>>> file2alias to emit scmi:<protocol>:<name> aliases.
>>>
>>> Use the same stable alias format for SCMI device uevents and sysfs
>>> modaliases. The previous string included the instance-specific device
>>> name, which is not useful for matching modules.
>>>
>>> Assisted-by: Codex:GPT-5.5
>>> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>> Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>> ---
>>

[ ... ]

>>>    #include <linux/bitfield.h>
>>> +#include <linux/device-id/scmi.h>
>>>    #include <linux/device.h>
>>>    #include <linux/notifier.h>
>>>    #include <linux/types.h>
>>> @@ -951,11 +952,6 @@ struct scmi_device {
>>>      #define to_scmi_dev(d) container_of_const(d, struct scmi_device, dev)
>>>    -struct scmi_device_id {
>>> -    u8 protocol_id;
>>> -    const char *name;
>>> -};
>>> -
>>
>> What is the reason of converting the char * to a fixed array? That limits the name and may result in truncation and potentially name collision, no ?
> 
> Because of how modpost works to generate modaliases inside the .ko
> any string buffers in device_id structs need to have a fixed length.
> 
> So the truncation / name collision issue pretty much applies to all
> foo_device_id structs in the kernel. People should now to make sure
> that any strings used will fit inside the fixed string. And I would
> expect the compiler to warn for overly long strings.
Ok, thanks for the clarification
