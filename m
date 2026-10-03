Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDDC23E33D
	for <arm-scmi@vger.kernel.org>; Sat,  3 Oct 2026 13:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791033229; cv=none; b=PB+Gqrpz6vl0/chI27sjJwL7wh8zQ6qSUemQIVFWYSQDke49OeEuLyE01RqgiZqDCBpkwVpjmp5sESJs5JaG27P7jsY21dbks3RNccs1beO560Ws5KkF0V2cqFqy0mFTxhPdiHRqdBXaMfor04kviYBgsyN7cSZrFD7smYIYinU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791033229; c=relaxed/simple;
	bh=QveLTuUEmpUF33mhQzgAo37vyE5sNfDTU/2RFx0vvXM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=poF8+eP/EdOu8JY8lVrnMS5Hj3myg6O2yLg40TE56BTLafzelMm2ijFP4sdSFpNbGqxSMaeeDXAeGJwB8tpknZUEkdwCzhXnyLSoa/HsIbcxYJxxaVyxPaQJe/YBV80cLCQVmuhx2ppevkM3wXlc3PjNx3t+9GIerV5a8R8yFLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BKePmO3s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VSfI3R/4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BKePmO3s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VSfI3R/4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 693Atp7E511863
	for <arm-scmi@vger.kernel.org>; Sat, 3 Oct 2026 13:13:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B0/Xo+aemJ+JG29Nu7HtIhf53jwlxuImWeAWbZb/Xns=; b=BKePmO3sujzJnzQi
	DK50KPE4dbpUjlPdAME2PqKDlS8coC67J9Tuub4oHHS01djCqnBQqNPAPj8MiYGF
	ZWsOuFLdcE58FZM+2/Pn2otjw2DhNfOxY/sDN43o2YHmkZEU2wBOrxzBrraxj/uq
	S9b1efMXMQKvlJXk195VYJTuM629TBq244GhQy+rUxSqpr5MXOiIrqWOGwxU1Llt
	lE93c2e2ZSXABWZdwSfuidWS1Wc5FGa9zo/CHtevM96jLegsTpsimg5SjLOLke3/
	Y9HHKEH/6dJlWN4tduZhKrYRulXtLcCvVWvC/SAWudKBs+N2BcE/YMa5K4nJeSp0
	BXic0w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sq8rw72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Sat, 03 Oct 2026 13:13:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb98809caso10957485a.1
        for <arm-scmi@vger.kernel.org>; Sat, 03 Oct 2026 06:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791033225; x=1791638025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B0/Xo+aemJ+JG29Nu7HtIhf53jwlxuImWeAWbZb/Xns=;
        b=VSfI3R/4i0esVt68mtZceGpyDQdm4lsIB0K9OWmVIJthoH0NoUzPuPvgFi1J1fn1zP
         R9B9bnOC3JakPXX1V0y89KDXdf+T93t8F/Ov7SZKdtmQZ+nPRCgnRxy2pcrgG1Hccyj0
         LMheZXJkgUCe8/xP2MhPaBkNTCujuDw+CuBuvS1C2wNq8fsH+NfOjadbPLImzRsbDCNV
         VxfXyq6ZY1lmFFcCCgEhAtM/mHyelgkzPgyj3KGIoKlZz1Kbva36u+oJ/ItTqflYF4In
         91TXqyU7mN8U+AisoFN6Zp+WVYOsMSW+zZ74Qh2nK4WkO2maFAhY01AIk7LshymN2Ibe
         JLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791033225; x=1791638025;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B0/Xo+aemJ+JG29Nu7HtIhf53jwlxuImWeAWbZb/Xns=;
        b=xlTkb2J/lvHoncgl4FqqcdElr4wqVpqukw15Mos5J81P5eU7k+tbSshx9WX8Uv+8na
         V0RBM0QzbMC9a4lrf8D+yzgMql9Rx2LGhaQADVebeN00BeWpY3+1f6wwj3Hj5H4cqezz
         P1WanfeTI0My+z7UCUj9BVwuWsuJh2OsN6jCuzIHLAheWOZhgWp/E2QG13TGXc/1Fr9K
         mkr9/BZhyKzfKXaNl17J9+TH8iDmQwqiq3Fi1ycf/CMtHcxf3XF8qog3+6eX/+izSNxP
         wc0m/CmY8TZlZgy27RMX5giG1Vg2OeSHLQat/Um7CMQWyNe27FXctWL74r+C6ECV+OJE
         hZWA==
X-Gm-Message-State: AFuF++mxNBENz1NN1L8uiioeCaSKjlWfxLJ8BOEM7G5PCsFtCioyuR4B
	P/rHil7feFZW4MPAb1J2hrQvF8ZskTFKJKWXUM+y0GiphyjORq6j5hvanj9Kqrylv8mb42flfFt
	VB7LwpBWoYmNujY6dcTQeL87pD3I3TRJLvkA6rYhUD9lxXzUB969y4NoYBNVYEg==
X-Gm-Gg: AYBFou2jftZCSr9kvsNETvD6AHCqA6EsLVqMw2Xo3sAQbpuKyOUCFAh8OK8NUekbWZm
	qVsYCUlaN87auK2QWkse7AmQmS281X9MQEuJZfYLS0g1P5h4/Uknc7fhPlS/IlWSYPf1gw+pXZR
	77THy7NY55mXjNMFQtr7fdSbcDwjwiXwxvgj8oZ/WrOlXU2vT38ECuPcF6MIENQKBnSW3PTHZDG
	ikJwbWp/QhHxlt+dMmMQOLF4Q0SiVqaH/kHaDa8mdF8tiilRAb25FC+svR8cghcBygjNHey7/S3
	vnj7eDa+e7tZtT9wRWL9LxMnQnSNmy7A63ZqEAPOWdMWHy8b8XGAQl3r4jKuGM9mY2XvHlZSrIX
	g2KjFUB70zNAuk84WXTYvdcBlYUWoSgYZ80znks44d6pecct4QaUTH0TjwPqF47dr62bS+UxFug
	MA3z2t+jdKAQLRFxYHgiaWWHJ5TX/FQLPMk3n2CaLDfeFm49IOIr4oTHMjnPhm4kFkfFc=
X-Received: by 2002:a05:620a:6f92:10b0:939:6c31:2318 with SMTP id af79cd13be357-93cf17318fdmr756077285a.34.1791033225311;
        Sat, 03 Oct 2026 06:13:45 -0700 (PDT)
X-Received: by 2002:a05:620a:6f92:10b0:939:6c31:2318 with SMTP id af79cd13be357-93cf17318fdmr756071885a.34.1791033224745;
        Sat, 03 Oct 2026 06:13:44 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cf87430sm193319166b.64.2026.10.03.06.13.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 06:13:43 -0700 (PDT)
Message-ID: <792f60f7-3b8d-48a1-bf4a-c356bf63ceec@oss.qualcomm.com>
Date: Sat, 3 Oct 2026 15:13:42 +0200
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 2/4] firmware: arm_scmi: Skip requests for standard
 protocol devices
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: arm-scmi@vger.kernel.org, Peng Fan <peng.fan@oss.nxp.com>
References: <20261002-scmi_bus_fixes-v1-0-8695cbab3fe7@kernel.org>
 <20261002-scmi_bus_fixes-v1-2-8695cbab3fe7@kernel.org>
 <d1474169-bf2c-486c-91f1-3754638dbe0e@oss.qualcomm.com>
 <20261002-immortal-normal-nyala-a9b6ce@sudeepholla>
 <d1307d5e-975b-4a4d-b810-d295a1ecd109@oss.qualcomm.com>
 <20261002-swift-of-massive-greatness-ca8ebe@sudeepholla>
Content-Language: en-US, nl
In-Reply-To: <20261002-swift-of-massive-greatness-ca8ebe@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VcZn7s0bpkqONdPAil-Lbt6Of-NQqfsm
X-Proofpoint-ORIG-GUID: VcZn7s0bpkqONdPAil-Lbt6Of-NQqfsm
X-Authority-Analysis: v=2.4 cv=TKzQ2Fla c=1 sm=1 tr=0 ts=6ac0ff8a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Cd0B3hYlUp0tl9xUJB8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDA1MiBTYWx0ZWRfX17ToyyBxa5jy
 fnrfpnDp+HTdGWyXHXBYHJlqop472konXXHKFd1IRmGJwWwIZCedDw8ikrl+o5B7HexsmdThyqJ
 70O258YAsjYc1wtVvAGGxDCyW1hQPbQZmDAfEOtd4sUubcV38f+51WVOpc0G8NQkPYir6uYnQGD
 0nJe6VINO76hkZbHKAbMgbIaYJoZkbtF3qG6IJyaxiBtoXup3iOAEcwM8Aet2HinxUQbtZrxwVV
 8MT325WPg1FA5lh3x89phLZJS4GroZkxOqsnyiDqw3AkXND/jyU58qxCV58ZThV/6HMFnXx7TAl
 wTdOtA5/vEeYV5h6QKJuw8xC1BnsH5xCrHdn7nNqohoLLlFO3sBbeMsx4lvMdI7xYu2SaxGh8zh
 2PKMmqoPB6lvLADqL+gZmQTzN1ZDh7Bbk1As+0447vNAChg2ixQ0+Fj2RSkd3DBhB7id98QP2nH
 zfaWJZt+D7Pu0q8JLRQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDA1MiBTYWx0ZWRfX2TPQkLqkYKPU
 0JOMp3CMmX++n/Dhks4F15OH1HCFnWaCnGIfSsnjd3LdMqRfUAapDCbaikckwvcsJKnJvXhUqKc
 7c3aZmbTrda8KR2wtcwRa+ibo6HWiaY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-03_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030052

Hi,

On 2-Oct-26 15:56, Sudeep Holla wrote:
> On Fri, Oct 02, 2026 at 03:40:44PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 2-Oct-26 2:50 PM, Sudeep Holla wrote:
>>> On Fri, Oct 02, 2026 at 12:18:57PM +0200, Hans de Goede wrote:
>>>> Hi Sudeep,
>>>>
>>>> On 2-Oct-26 11:36, Sudeep Holla wrote:
>>
>> <snip>
>>
>>>> While correct, simply re-registering the driver fixes the device
>>>> not being there, see above.
>>>>
>>>
>>> Yes but IIUC it take the path where bus is tracking and keeping records
>>> like it does for non-standard protocol right ?
>>
>> Correct.
>>
>>> I just want to avoid that
>>> completely as it is hard to read and may be bit confusing as the std
>>> device creation can take 2 different paths.
>>
>> Ah, I see that makes sense.
>>
>>>>> Skip request tracking for standard devices. Keep request tracking and
>>>>> rollback for nonstandard devices unchanged.
>>>>
>>>> This has the downside that it will allow drivers to claim duplicate-ids
>>>> for standard-proto devices.
>>>>
>>>
>>> Sorry I don't understand what does the above mean.
>>
>> What I mean is that 2 drivers can now claim the same <proto-id, name>
>> tupple and both will successfully register.
>>
> 
> Oh well, we want that. We tried avoiding that with different name but
> 2 device with same fwnode is causing issues.

Ah I see, if we want to allow multiple drivers claiming the same
device-id. Then this patch is fine as as.

> The exception is pinctl-imx
> driver which triggered all these. I understand the concern but it is
> hard restrict the usage of SCMI in some ways as it gets deployed in
> more platforms. Happy to hear any alternative solution for the longer
> term if it is hard in short term.
> 
>>>> That downside is pretty much why aac4e67d6eb9 ("firmware: arm_scmi:
>>>> Always create devices for standard protocols") does things the way
>>>> it does.
>>>>
>>>> If we want something like this patch, then my suggestion would be to
>>>> make scmi_protocol_device_unrequest() skip the
>>>> blocking_notifier_call_chain(SCMI_BUS_NOTIFY_DEVICE_UNREQUEST) call
>>>> for standard protocol devices, but otherwise keep them on the request
>>>> list to keep the detection of duplicate device-ids.
>>>>
>>>
>>> Ah, is this the same reference of duplicate-ids for std-proto devices
>>> made above ?
>>
>> Yes.
>>
> 
> Thanks!
> 
>>> If so, I understand what you mean now. I agree we need
>>> to fix that too. I simply don't like keeping 2 possible paths or
>>> device creation for std proto devices as I feel it will be troublesome
>>> in the future.
>>
>> Ok, I see.
>>
>>>> But I'm not sure even that is necessary, my change deliberately only
>>>> touched the scmi_device_create(name = NULL) path to make sure
>>>> the devices are initially created. Future driver unregistering leading
>>>> to them going away as before is not really a problem IMHO.
>>>>
>>>
>>> Do you mean, you prefer to keep 2 paths for std protocol device creation ?
>>  
>> Well we've 2 different paths for non std protocol device creation too,
>> depending on if the protocol-id shows up before or after a driver
>> requesting the device arrives.
>>
> 
> Agreed, but for std protocol we are sticking with enumeration time now.
> 
>> So I'm not convinced we really need to fix anything, but if you want
>> to move to only 1 path for std protocol device creation that I've no
>> objection against that.
>>
> 
> I think you missed the fact we are supporting the 2 different drivers
> with same <proto_id, name>. You worded it differently and sorry for not
> getting that early.
> 
>> Note that other busses do accept multiple drivers claiming the same
>> device-id. With the first one to probe successfully winning. So we
>> could also proceed with that patch as is.
>>
> 
> Indeed, that is the only way it can be made work. In this case we have
> block list in scmi-pinctl driver for i.MX platform and that's how they
> have their own driver probed successfully. It was quite a ride in getting
> that merged after all attempts to have single generic driver failed 🙁.
> It is created problems as we created multiple devices sharing same
> fwnode unfortunately. This series solved the issue by trying to remove
> multiple device creation with same fwnode where possible for that reason.
> Hope that clarifies things, sorry I realise the context in the cover letter
> was bit short to give overall picture of issue and history on this.

Ack, as I said above if we want to allow multiple drivers claiming the same
device-id. Then this patch is fine as as.

With that resolved, the patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans


