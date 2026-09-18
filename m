Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730B33CA4BB
	for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 14:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742930; cv=none; b=iddKBYmWr8Jn7VyWrSYUrrUvGTEYIthybSBNqbnSE3y0tPKhMyOeFLwGJjND8EM6p6DRGJkOf2Mrh7l+hI0DJE1EptdyncVSFx7wakN+HbgVuFhWk+ZX1vq7LBX+O0Mpk62Pr1XGt2E4MxP1X00WBtL3E9Yi/jjSZsqZlkQfotA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742930; c=relaxed/simple;
	bh=grQaeezD4loaQ3dOGxCiDT5OfyrOGQRea/DATIc6/hg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eRlgUnb7FhaeHNmj+JfaeQblp1BY1MbxWc5N2bbCnYEhbpGDS+0neVsnngoTS/5P8UyNBR1qX9Pd72OowDDLB3aQYKUF6rUsgDeZmDVdVKn9Eg7WvdzqjVFOMiCApU5yhCUuULQHv7XZHxYvuNJu6+sVXZ05ByYzu7pTzTqtLW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=neK5cG8A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HSUyeLl/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="neK5cG8A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HSUyeLl/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOhtF1353961
	for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 14:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zHH5No/d6gK16qDfihynuj16LmMumAiiVmAs/BzwDkc=; b=neK5cG8AuR+jOvy0
	3tl6pVJjFoD/X0tupaQ1EiBON5lQjYY3VACqmtdocu5OJ2ylQi34YJ2sv/xBqw5J
	CxZp/+GWO7uPW82E/UCudAPEDe21rD4bP8LsmNGJGxFwThFHdM3MjbXlf2DQn1mx
	p13KjkULEaCUUX4AGpb7+T6326hRnViTMEW1fLL+sOSC3uVeaZGokab0OJNyRpwe
	zJ+Nk5ckVD9QTx/GIF28f1UWYgGuFUSRyBKklfmVG1LCB2v91aBl6Y+dE5h7m7a4
	DiEP0K4433MVL4nI8JYmmLeQHZgxyFQiizLYW+S2bMPsRn9EKCZvK2DwEeabTq3U
	oru+gQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs2hv98cp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 14:48:46 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9106fce784dso16135226d6.2
        for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 07:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789742925; x=1790347725; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zHH5No/d6gK16qDfihynuj16LmMumAiiVmAs/BzwDkc=;
        b=HSUyeLl/Mp+Kqr5tkSNPC9fBss2Z9244UwTrorqBjqxod5xsMKPnnh+fhkGMY9XTRK
         fo/93q4TRA9f8WWn+5UA64uaITDC5/ug2NapdaPwsRLD2jNTfm4+SRifdNmqF1FF1yVa
         tFuaMmm+NoJawBwopDfCxi9gYikOTvPJmLE1TSMeFrD9X4CU50us0rtEV1S5XfJL6Evx
         P+8R6EnBmWrRcPD5V7+lapnWmfgxMwWZng4Hjs849dpVBjtWthxgJqND0BZcPH4WuQ1S
         0kZHINtmzsMUPlgf4WVJBrFN+qI/SYbm+aIFl+qo2ffGYftjuJc1R8NqMR6JfjCxFZS/
         uD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742925; x=1790347725;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zHH5No/d6gK16qDfihynuj16LmMumAiiVmAs/BzwDkc=;
        b=R0sXn2kuV5fdR4j01O0ErRZAdv/Amdd3idqXgKM/bfX5Q/s7hTuxti73VmbFD/J/9+
         lt4C8XVtvuJ223p/bGWAcAGDXuM4Ccsk3LG5icvyr11fuyW/bIJNW+MGPnxOaeP59Y/e
         5OvtqheIgTbKYI/FQ6JKNyhj8NByPLcISTAzD5g6UuPD4B4mieW3i1P5O81kPozsVPNy
         RUhlB56G06A8VrbwgY6txzN/SrTcRovcVF6FvC45AVLMm3TuQQat3bhwAPF5pdCyquIf
         eDH5kC/0oEsuwqXjrS8POwUs2lWyKHh6ojpdgFr7InxJwVmQ8vuHKvJk/xrd0u+lxsEw
         cdzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzfaZnz8Wq/OLUjwEBErDo+kgQO6rIbiE4CfwGhp9aHHHS1w3Roe0XtLC3wSXQ2KqivQqjYyMXZQg==@vger.kernel.org
X-Gm-Message-State: AFuF++lUaWIpRC2Ekx1lqHCW5hJUQWXRaE67Vk+0dEaNplVTcjzeMbn6
	v1oVaF11VADs9zuL2vNZ92IeiOHkCWw5VsGK3Xzm4AnyxOMK5zV/2uyrgcyQzxhOSLl4+xQOs8s
	lW92xmYXkJOUQnDKGKnsnzGVZTZflP/74Ucj+ku5x15oAF7x4fYFeAROgqcOioA==
X-Gm-Gg: AYBFou3WmrvyA92SuMdtTOJgsPE2dW6134d9LOusB53h4Hp2emQg5hisXLDcQaUu+nN
	/0lgK6PJf/4UBmMlR167uhhGZSgr51zajFksnnVvmz+SJUNUyrbwRXgiC5TUvL65UGib1pnfyrj
	rylR7Ca8safwT0g0WuTkIyjKAasSZ/onDjNZu5iPHEyho72JJ0hxBsDtApPoRno1gDosqaf15yL
	CR7F6Rt6YyUW6RZa8JVPm3anShI8r3M1bEjTVQ8T0x2l2zfUToNjkChN7U7P4A+InK0C3GTWD3L
	bZ8zaRYTcvgKP8zD0tsjLCc2XGNbTCxV/0yJrLKy78zG5AG9NTKyPGNVJfdq+ygBpNirO4kwq/A
	DqV1LpRW5DzUDtvXLOWPE3zG2hq6n2iewizpxkggrJoez7ub6qbJYMSceR1LACZU=
X-Received: by 2002:a05:620a:4686:b0:939:feaa:949c with SMTP id af79cd13be357-93bdc7503a2mr376113785a.36.1789742925575;
        Fri, 18 Sep 2026 07:48:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4686:b0:939:feaa:949c with SMTP id af79cd13be357-93bdc7503a2mr376109285a.36.1789742925068;
        Fri, 18 Sep 2026 07:48:45 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:82ae:cd75:d970:e66f? ([2a05:6e02:1041:c10:82ae:cd75:d970:e66f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcc1160a1sm12355955e9.4.2026.09.18.07.48.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:48:44 -0700 (PDT)
Message-ID: <b5a41e7b-3a6a-4c1a-9475-b40e85ff4916@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 16:48:42 +0200
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <2104f437-e960-4e55-b0e1-2b37126e8c2f@oss.qualcomm.com>
 <82a72918-7bc7-4e2c-892c-0dcdd6dd5548@oss.qualcomm.com>
 <3f51bf6c-5318-4e32-a1ca-3ce8cf8c4ceb@oss.qualcomm.com>
 <20260918-roaring-bee-of-acceptance-50a8a9@sudeepholla>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260918-roaring-bee-of-acceptance-50a8a9@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIxMCBTYWx0ZWRfXzexv3vWUNayR
 OAFaoyskHfMtzYw8hY8/r+ORlZ766qmK1BZWBui+2rirFyYXxLT4m+idBzwzIH/5W42F07D0CDa
 /GZ1zSnZPvD28rL1UN0rfVRQ7CaNYN4=
X-Authority-Analysis: v=2.4 cv=IOWXmQvG c=1 sm=1 tr=0 ts=6aad4f4e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=EXJEmdUHkevauOIPG10A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIxMCBTYWx0ZWRfX66TO7mKz70K/
 fCHApff7HR5xT9Idlk4bZcKwpN50QF9XwpCSgSzCgUYMPlKGvQZNbd/H2e7jVYaA7qE4VZEEUzi
 jMURLKvn5A5qTel8v8TuBicDnrV+TroJtj2/LJ12H75B5EoyPw4m1WSOyRUP2/f3K3TiuT2wFn6
 MDp/gTlzhZITrmvfVNZ3lEp7RBaurM1rDvbqiBzkW+GB/oea1ryylCch/X4VBIAxkT+Sa8oyPP+
 eCUHI0d3wpp+gUhrGNEd6jbQiahvc7ps+gFws94S2R36I8VhEcxywrCLyr8yHAOx/vl4991Yfp3
 cXw28olYgyVkI9XGNw64MG4x3cSxfR7qf/95E/3yhOTMrL+iNF9zfnNfGW8nQT3LsERuE/+8b6F
 DPey0fHq1Uk3sbUvqlpUjmtDxCYCFBR+30ljFQmKMbIDwlgU93JeUW/DGgHpGai6OxeES73kcdz
 bF5uSeveQlvL1fvz5WQ==
X-Proofpoint-ORIG-GUID: pyyR7179yTmrnBgSAzWsMb_SHqj9hkK1
X-Proofpoint-GUID: pyyR7179yTmrnBgSAzWsMb_SHqj9hkK1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1011 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180210

On 9/18/26 15:38, Sudeep Holla wrote:
> On Fri, Sep 18, 2026 at 12:13:10PM +0200, Daniel Lezcano wrote:
>> On 9/18/26 12:02, Hans de Goede wrote:
>>> Hi Daniel,
>>>
>>> On 18-Sep-26 11:53, Daniel Lezcano wrote:
>>>>
>>>> Hi Hans,
>>>>
>>>> thanks for taking care of that
>>>>
>>>>
>>>> On 9/18/26 11:29, Hans de Goede wrote:
>>>>> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>>>>
>>>>> SCMI client drivers already describe their bus match data with
>>>>> MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
>>>>> SCMI device tables. As a result, SCMI modules do not get generated module
>>>>> aliases from their id tables.
>>>>>
>>>>> Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
>>>>> visible to modpost, add the corresponding generated offsets and teach
>>>>> file2alias to emit scmi:<protocol>:<name> aliases.
>>>>>
>>>>> Use the same stable alias format for SCMI device uevents and sysfs
>>>>> modaliases. The previous string included the instance-specific device
>>>>> name, which is not useful for matching modules.
>>>>>
>>>>> Assisted-by: Codex:GPT-5.5
>>>>> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>>>> Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>>>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>>>> ---
>>>>
>>
>> [ ... ]
>>
>>>>>     #include <linux/bitfield.h>
>>>>> +#include <linux/device-id/scmi.h>
>>>>>     #include <linux/device.h>
>>>>>     #include <linux/notifier.h>
>>>>>     #include <linux/types.h>
>>>>> @@ -951,11 +952,6 @@ struct scmi_device {
>>>>>       #define to_scmi_dev(d) container_of_const(d, struct scmi_device, dev)
>>>>>     -struct scmi_device_id {
>>>>> -    u8 protocol_id;
>>>>> -    const char *name;
>>>>> -};
>>>>> -
>>>>
>>>> What is the reason of converting the char * to a fixed array? That limits the name and may result in truncation and potentially name collision, no ?
>>>
>>> Because of how modpost works to generate modaliases inside the .ko
>>> any string buffers in device_id structs need to have a fixed length.
>>>
>>> So the truncation / name collision issue pretty much applies to all
>>> foo_device_id structs in the kernel. People should now to make sure
>>> that any strings used will fit inside the fixed string. And I would
>>> expect the compiler to warn for overly long strings.
>> Ok, thanks for the clarification
> 
> Not related to above topic, but just wanted to check with Daniel if this
> solves module auto-loading for you. Was there someone else who was testing
> this series and was having issue with earlier versions or its you only
> Hans de Goede and it was with v1/v2 when Bjorn posted them. I remember
> something vaguely and couldn't trace back all the versions easily.
Sure, I'll try it with my t14s laptop (Hamoa)
