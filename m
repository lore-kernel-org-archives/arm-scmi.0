Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8EE317164
	for <arm-scmi@vger.kernel.org>; Fri,  2 Oct 2026 13:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790948451; cv=none; b=YT1qQox3xxp/NDHwBOnFDKiIcs6DrFGbEHEUvHJsYCWI7Brk8xV5u6URyZE0Hw/QiZnLi4zOkhrkys/KHY3N4YYx3WbRVip3oTUUhmDFc1zolB6E/LFdCh/QRf7EJsQ77yKKs3hiILwKhXWwRFDi3H1xX9WVVMNFVGqm7Xh/6nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790948451; c=relaxed/simple;
	bh=5s0xzyQXaZ00m/0Qpa/yaY5t48QvJwaFzqzcr/hPC6g=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YAmEnLM1txU9KBv2ApJ39PffZG3XDhMwOq+5o8jKXM8xZJpjgxfNsmUehyWNZpXWOMryBORQISCJktQIVbroc1KSkkFSxYVDwJ0xBtOsFsa7oTtXOPi/mzlyu7MeXbsAoPjmmkNEuYvMa46TRupVcv7AfPPorS5uUD9qYwdbE9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oNqJXdu5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y2mxshe2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oNqJXdu5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y2mxshe2"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692DAEdj2008385
	for <arm-scmi@vger.kernel.org>; Fri, 2 Oct 2026 13:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V8fjRWGGQmi+uT6TU7OvoDwlaRJTdIeDhn+mzn8ZV/w=; b=oNqJXdu5xIh2lxvT
	3WPvWePGHzyCoPl0VDo/cxcOJurBkm6nItyvXFc5C/ic7CiFv1WNJtCnOvR2JSRg
	8JBxjzmFQnvANGVirto0jbckRCOahJt6VF+Qc63mtKamSKy4lZGhgjx9wrAg8HLa
	e0W7A0rcD9sWDgc2TMDV7T7hbIcWpzHYZ6CYFC+NKVp0ouhMTjCBZZczCPx88Ock
	opxJsC7CWwgxT6k6dmvW2C+mPdOgj7PF2Z5qMk0AUXEYL0GGRqotxNYLRgoyof0J
	xmDkoc18LLZLw97XiRsrwh/FhZCYUvroR3EgthiK1N+zRCzIuvRO1dFpeWrKItvT
	5jZXKw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2aj00q1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Fri, 02 Oct 2026 13:40:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93dd3c3badbso112768485a.2
        for <arm-scmi@vger.kernel.org>; Fri, 02 Oct 2026 06:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790948447; x=1791553247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V8fjRWGGQmi+uT6TU7OvoDwlaRJTdIeDhn+mzn8ZV/w=;
        b=Y2mxshe2toGCueB/2LGkls8Og4yFutCXtFUFSlnkhcPGDXTMjqYV2mtuu4UQftlMgx
         L2hSdHoT1QOzVWOcXVzI/1cTJTHlotAlZc+FLDLe7II2zYzJhmXt4Ep2jUg8+RxB2tMK
         FM0dAoil9Ou01d6std8Y+PpKD1syQV6b0oMF+Yq8o+aUwfp36/wln0XArNVMqN3aQzxR
         W1K425WcXjhz10YQ25TEmgVUnjWKqesdJcngcczg8gHRntta2eYwx0/KUa3MhzOMmMi7
         jT+HnKcTvgNMEBTAFJFijv6YuZqF+GF3mcu0xazGDolkUTUKoI7rBsWNulcFYhc2PJlX
         UhRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790948447; x=1791553247;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V8fjRWGGQmi+uT6TU7OvoDwlaRJTdIeDhn+mzn8ZV/w=;
        b=2TLa5U1NM0OlveUQ3CD7DrXR/LwJk4FNufFSBUv1V876N9sE7HDuGwwZ5WPs64CZsM
         GljsmnBpabBoVs2vLsQAgnrGG4/BGLlxjZjt5xWWXLJ97t1rrlnvl4+C2c017Gn4KUP2
         Tef7cV/3Ci6o/f63onQBLWTHI1kQIqHqPP/enVd+vZsNtI19YA0lWYUzjFD8BwdJ4/j3
         pnhk370VqSZ7dR5PoKP/R0yKeQnvna7JuoarQg1hIulO3KOq0AA2bhINMynOmdPEBaRo
         QvRTObnN3au5Rs93XsRrHlgXKRgvkQuc0GlWgWW+LCkIJP8m+8V+dBGSY7X3KC/BtWzs
         Fwxw==
X-Gm-Message-State: AFuF++ltI/Oii2CBe4s0SKby4gScq8s7P6whkkkXVPIIt+spq5unTXAs
	Xz+hY/QwHyYb2lr+FyDTPLZvnGX5YwdU7xl4LI5lkXfpDUL8dLKI3iYKBPa/uYlJCSYQufIJA0j
	WGFoqEpCBJeaKEfyMS2rqoZrqvMLbOpoKiyuqzPOdTR2wvLDXaGtMQK4p1Vy8f9Kb7U568A==
X-Gm-Gg: AYBFou088K9yx+s7j5baB7Q45cqwj7XTf5rp1Mta/vRu39VwLUwYP6GiWeaq2jiPAVk
	nce0cZFXLu83pSdBFcGM9brOHBDk6UrCJ+JLWI3qPozNc/ttx7V4XL1Eyu5M5dragXQ8NkeEF0b
	GhR7n3PkbJwUvg50mGUfK0Q1KZvVCE7UpaYzR5zRDozaS8zG7uuA6VvyZ4SJB5u1DNZAMK7IeAL
	6a7Wwy3fofs0EoHqcQS7JPEg9RTK/M9MRCAw6nniFniw6lgp4zgezKTDA7Hva45gi1m1wRhGteS
	PrYclRNFti/wbfoueJfCLdKLHxMyL49FiK76EOZ4jScssb5Q1+oedd8BfG3JghCSKFvz9wn5Fdn
	EkU9W9i+u41XNPJBDKTSGlDV+rIRyXMqS2Vk+gHk0sanRRgyNa9C2xIG2qg5Rw9OhEE1J/tbIN3
	PyEI8S0gxuaQdvSmJR92PZYIVDN4VAUcbw6JeJRRzto7LzCJ2YRfmzRgaaT1V6w03QvQ==
X-Received: by 2002:a05:620a:d96:b0:93c:5eef:baf5 with SMTP id af79cd13be357-93ce8a67b76mr486191285a.14.1790948447215;
        Fri, 02 Oct 2026 06:40:47 -0700 (PDT)
X-Received: by 2002:a05:620a:d96:b0:93c:5eef:baf5 with SMTP id af79cd13be357-93ce8a67b76mr486183885a.14.1790948446609;
        Fri, 02 Oct 2026 06:40:46 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:8e96:3679:b9c:de47? (2001-1c00-2a07-3a01-8e96-3679-0b9c-de47.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:8e96:3679:b9c:de47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afa262ac74sm558122a12.22.2026.10.02.06.40.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 06:40:44 -0700 (PDT)
Message-ID: <d1307d5e-975b-4a4d-b810-d295a1ecd109@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 15:40:44 +0200
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
Content-Language: en-US, nl
In-Reply-To: <20261002-immortal-normal-nyala-a9b6ce@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA1NCBTYWx0ZWRfX0O//Kcc+L/cz
 C8BcvUeTXq6VJrTwCorr+vmvZ1ziYe4fiUTOpkwOO0DbZaCVS7VPTx3EmzfKhyJfsKl2TIUWf87
 rXMBuesNh1UXPrsSe33oNnd9JmzaBPc=
X-Proofpoint-GUID: SCZhSMZBa5NI_DdsfPsTCwlH48jIOvNJ
X-Authority-Analysis: v=2.4 cv=UJZIjyfy c=1 sm=1 tr=0 ts=6abfb460 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=8XGSAnieTuU4AdakXbAA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA1NCBTYWx0ZWRfX9NavlO88MCsN
 p137MWrirW1PO8cW3PQ2usPcq96PbfLwMidXbAb/xF4EnPOzXujtVqmSjw2PNu8NQKybWc2NY/V
 WzTaQ6nlCZpXvuyB3rScGDVkB5sFw3SvsLKPXG8AeB8bI2zBNm5J1sBBTmPMA4ssvFApsOaZkvI
 I+qfA7+k8rRp6RS03ybib/cuV2LvkZIBvE4PBBXr/tm9n+APlWahnJZoz69TM+z1TpXZvcXw5ks
 vRY4IEasnGZqY4NHo0KdKvUbERixBTwP1/jW4mPjaTRcIYbv205P5YV9OrEwqXon4oR7Q9oFPlr
 0DTTtnd6biTu3eIsaqdRFCxFRVJqLjqgdC5LAcL7xRWPNvdwJ8yv7qVvqAEhRP7G2edfHASbFvk
 ih8k30xD0hezgj3aDxJMcj6Ll8L6VCptkbKPbxAf5aGlgSWP5B7ZPYHhmuauRb0KML4KYSsgB/9
 zjTHR4cTE1DgRt5jomQ==
X-Proofpoint-ORIG-GUID: SCZhSMZBa5NI_DdsfPsTCwlH48jIOvNJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020054

Hi,

On 2-Oct-26 2:50 PM, Sudeep Holla wrote:
> On Fri, Oct 02, 2026 at 12:18:57PM +0200, Hans de Goede wrote:
>> Hi Sudeep,
>>
>> On 2-Oct-26 11:36, Sudeep Holla wrote:

<snip>

>> While correct, simply re-registering the driver fixes the device
>> not being there, see above.
>>
> 
> Yes but IIUC it take the path where bus is tracking and keeping records
> like it does for non-standard protocol right ?

Correct.

> I just want to avoid that
> completely as it is hard to read and may be bit confusing as the std
> device creation can take 2 different paths.

Ah, I see that makes sense.

>>> Skip request tracking for standard devices. Keep request tracking and
>>> rollback for nonstandard devices unchanged.
>>
>> This has the downside that it will allow drivers to claim duplicate-ids
>> for standard-proto devices.
>>
> 
> Sorry I don't understand what does the above mean.

What I mean is that 2 drivers can now claim the same <proto-id, name>
tupple and both will successfully register.

>> That downside is pretty much why aac4e67d6eb9 ("firmware: arm_scmi:
>> Always create devices for standard protocols") does things the way
>> it does.
>>
>> If we want something like this patch, then my suggestion would be to
>> make scmi_protocol_device_unrequest() skip the
>> blocking_notifier_call_chain(SCMI_BUS_NOTIFY_DEVICE_UNREQUEST) call
>> for standard protocol devices, but otherwise keep them on the request
>> list to keep the detection of duplicate device-ids.
>>
> 
> Ah, is this the same reference of duplicate-ids for std-proto devices
> made above ?

Yes.

> If so, I understand what you mean now. I agree we need
> to fix that too. I simply don't like keeping 2 possible paths or
> device creation for std proto devices as I feel it will be troublesome
> in the future.

Ok, I see. 

>> But I'm not sure even that is necessary, my change deliberately only
>> touched the scmi_device_create(name = NULL) path to make sure
>> the devices are initially created. Future driver unregistering leading
>> to them going away as before is not really a problem IMHO.
>>
> 
> Do you mean, you prefer to keep 2 paths for std protocol device creation ?
 
Well we've 2 different paths for non std protocol device creation too,
depending on if the protocol-id shows up before or after a driver
requesting the device arrives.

So I'm not convinced we really need to fix anything, but if you want
to move to only 1 path for std protocol device creation that I've no
objection against that.

Note that other busses do accept multiple drivers claiming the same
device-id. With the first one to probe successfully winning. So we
could also proceed with that patch as is.

Regards,

Hans

