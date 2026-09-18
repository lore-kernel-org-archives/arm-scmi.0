Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC34645D5CC
	for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 10:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725729; cv=none; b=QXG8AEm9p4fpjolStr9FgsNu/sEFvB3ebbWpyGvO5hs7JfqcQlI94nd3L+BYRNZXpX0IFchrOCWxl+ypjWfHoTbJb3bHmbWQ9w1yCeY5amh0qXZZH8kNT/ddUYyqyOjjQrjFxzSRODAw+kE6tpwX1cK9f/IFFT4IxyAZqEtL0JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725729; c=relaxed/simple;
	bh=aWdUbLPfvC6wNjFP+17bs1Vn8BgG4/eM1GE3CrUak1Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=i0egkPELDOSgjozNvqFYVsFMDjbYi2nYYHmVRmm1LrWimUmg2MPT3CbAJSom05oLVI0A/Q3WEcHTZfC/X5guSIkkDdzmtFCRKx9LEI9DJcaR+Fv8kW8KIvSetsWkNB9r27GKU11aJzBa1oq/6tFE6cbZa8G6mR/jEj0eRJdFQts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AqKkK2Z+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KEjbBX9g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AqKkK2Z+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KEjbBX9g"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dObN3746763
	for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 10:02:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qYA58SCxkPQpuxebyIQOtCSJePOccGQb1BNaM1QCZVY=; b=AqKkK2Z+nF+Z/dGt
	FWBPIBa9LfPCRuhIMDS79rzdtAonoYumPp1/erhcFZxnlhFx2qXcCfasS6QCaRzq
	PhJXaQ75jatiT5KGqZlOElNbKQgH7nwxVEuyHjgrEdJAwC8oJ9fGmXSwkOUx95Mv
	wL3HE7/XAeLp33/7aUlJ3RPC/daRq2zVZrKDWfeJvzou1Cun6Gsimf6vDEQxTfRv
	g62tVzKbpRzjhexa76EFC0MrEzbjEwUKX3WhiKKFSt87TGbCmTnqAMqa/o7sLVqA
	KK55FrH3OweXu3HkaexGQ6aJ9mMoYwLaVNuxbgDAhx3nwHn+sLQzHPBmcxsuL0YO
	CiAppw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grmv5kkph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 10:02:06 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78580a6b2fbso136680137.3
        for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 03:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789725726; x=1790330526; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qYA58SCxkPQpuxebyIQOtCSJePOccGQb1BNaM1QCZVY=;
        b=KEjbBX9gok5cMjbvWJFQMcG6vdEH2CvB9VTgvhDaNPHsnmMK0SfUvVmXfZ4bOilNhU
         7shADD/BrKJk67nm/mJPWZlNLbneodCLvF+9sfDma9Urn/oJWZ2UJUjB4q4U/DqIWvRK
         Cx2+9tVPTaRp8z9apg5jJGOYDXpHFE2nFQJfia56NjDiBZAD+vzF8rLIaARA5iWCUenh
         1s6yyGPfRRNaDiNnq59tXcNoYEHIBjHFjdWTOMiecDf3fhTxrv/VVSAC+GqB3mI6Ido+
         RSWidYGA9kk3e6cmGQPpBeiYUBTbRY8Fi2wQ92bCALhxTd3xxSpYwRnELB3yMPU2nLoR
         Jp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725726; x=1790330526;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qYA58SCxkPQpuxebyIQOtCSJePOccGQb1BNaM1QCZVY=;
        b=Aa3T3nDHuP6ZxPudM09RPdxnEUtT13tUqqhV6zuYtN5ueXY47yuyG26Rs2NGmq8oLU
         3d+Dqr3TzqTQ5AGsOaWXJ6Sh6454cwGFK90mek1IFZLCbWQ8yOogcznKnKZD/pccnhZF
         zSPv10DV7Ul3BCSu99n99SffZQnuJPx/QEaPUhu7kdJgS01UTXAy2fK0sSXRHUzeiTey
         X9101AazVnadVmr7XfHcriNclgrmSML1nSnDjwfsawnpgK+vQyOCWujyuxOIy+1jQ1kK
         G6MsIp7uGKnpzwKMiq3HTl6ffrFBCQ12XeEq4toi1aQ0gjN3WfVeKpbhN88iH3NCnc3D
         GZ8w==
X-Forwarded-Encrypted: i=1; AKwUvBz82QiGa7RQ4m4ZTKzx8GMkiN20Bz52/VlHp9yues/AaOGKehNTwg87Pd7OPWvNe52FueEww5XbwA==@vger.kernel.org
X-Gm-Message-State: AFuF++kSstzWzS7+R4p8j8lWqVl4sfzceVAJ3odUZkCOAnZkJy4zU+Ku
	dPZIuq1JUcjIgAn6qC9+P/OyDMtiohNfIVCjtc8OPsE2tgF0KpOmwn3OeZ7k9BJFeRj8Dbv6op/
	+ooROTNO0bFRk9Tpnh/yRNfTfOrhv7O2aCkTPZTvz55wbs4HsVH+hMVI+1sebYg==
X-Gm-Gg: AYBFou0mAu3euhp5XMwQMmJAd7WTyL6RAehDBsY+g6xm3g0bXs6DtcKHb3ZJuqeVlBo
	1XBqIC7RfzJdorAV1u9JOb3xWmSX4x0GQY4Yi3gerr1vOfIRxuN4U6YVfeWQpQVAfNfR8xk9iZP
	kHeUhzm7Le/eTag7tsCVLK0fDFSR7g/fizD0uKPLd0E29xSA7FKRHhuQt4hV3QkBsAc3pS06N5m
	DiuBpFFq1HCR13pwFg0rtMVrBGoeWTnsxie7Inqj690aXEZpeISkRAalSKz+sBS/Regid+GLO7q
	WX/C6OcVJg7f8yWdlSJclvGNlcK9qCYSXjWeOW+8166c5xw7T/5i5h6NG4/Aa2Ko2eqlBMtqDQK
	lAjxg/+T1rBq/bMlRdjtVm50w7apZyUNi9gMbHzHpbpmGhwkaRcURAW+d8vq10Ux5qpXSeyhIIn
	Iyc7V3DPqFVt+aSGtuXroqPqdfL705GLGSfC3yvnsd7Ahn7/LW8sPpIQaY8AUe0F9AHw==
X-Received: by 2002:a05:6102:358d:b0:79f:e8ce:27f2 with SMTP id ada2fe7eead31-7a55af2df71mr615820137.4.1789725725437;
        Fri, 18 Sep 2026 03:02:05 -0700 (PDT)
X-Received: by 2002:a05:6102:358d:b0:79f:e8ce:27f2 with SMTP id ada2fe7eead31-7a55af2df71mr615773137.4.1789725724990;
        Fri, 18 Sep 2026 03:02:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bbc6a88sm37992566b.54.2026.09.18.03.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:02:04 -0700 (PDT)
Message-ID: <82a72918-7bc7-4e2c-892c-0dcdd6dd5548@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:02:03 +0200
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
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
Content-Language: en-US, nl
In-Reply-To: <2104f437-e960-4e55-b0e1-2b37126e8c2f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzOSBTYWx0ZWRfX0p7WBBSBGJgO
 b8vBq5y8iARNAewZqA73bxbzTVc2j2ThfHs6Cuz1l8EjFcZIIJDvkWPgIgr9bpnVGMGOuaMTjHK
 PDVHrqy/FMFVAv/o+pWKvfbE/SNZmlXnfWWpd2ZbIopX9jINvRTT3O112CU/i6dd/NXwr7om/WZ
 FBUHDd4BynauPmdECvdS9e1zgWol08SxvJOvmrEAgiAIQ6suNNK0jnWOUSFuvzZhJoOHCbOhGee
 tFNqseNuOZXClxLFOSH3Qc4XkdvUxYPmswpcmFZfMLZfVBwTzoPiKQQkvOPMC6TTjqjqbVvqvw/
 K3Oz+pvUiztjJlLl0ILwIRBdz74nvVpxpS4JanB/J+LXvtwbjnqK8u6VGTPwX1zr6CBhR6hnzPS
 I7jHaU/Y12vCMpCh0yOVPCA6knIjiK2B1Et6UZV2Nm7l5J5/QJGNMDXLu7HLLyh6rDTddIbzjRZ
 R8WWHAfhPX+1NXXvFTg==
X-Authority-Analysis: v=2.4 cv=E+5YNqdl c=1 sm=1 tr=0 ts=6aad0c1e cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=9vOhfBaG-gSLgbD7qJAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: S6IGErrGTuRxeMqcX-WSRiAy_sXcmJyI
X-Proofpoint-GUID: S6IGErrGTuRxeMqcX-WSRiAy_sXcmJyI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzOSBTYWx0ZWRfXzLGnGcgMzMA1
 wo/bbjYS0/H4HdEO5lzwtw5NVC1Fk784T08OU4wL1CYqH/ecJu9O9HQaYqOQnpG05u0yZDbPK/T
 pCgb9Ra4UycKyuGY8UiBne7HYnJ0Mpg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180139

Hi Daniel,

On 18-Sep-26 11:53, Daniel Lezcano wrote:
> 
> Hi Hans,
> 
> thanks for taking care of that
> 
> 
> On 9/18/26 11:29, Hans de Goede wrote:
>> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>
>> SCMI client drivers already describe their bus match data with
>> MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
>> SCMI device tables. As a result, SCMI modules do not get generated module
>> aliases from their id tables.
>>
>> Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
>> visible to modpost, add the corresponding generated offsets and teach
>> file2alias to emit scmi:<protocol>:<name> aliases.
>>
>> Use the same stable alias format for SCMI device uevents and sysfs
>> modaliases. The previous string included the instance-specific device
>> name, which is not useful for matching modules.
>>
>> Assisted-by: Codex:GPT-5.5
>> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>> Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>> ---
> 
> [ ... ]
> 
>>   -#define SCMI_UEVENT_MODALIAS_FMT    "%s:%02x:%s"
>> +#define SCMI_UEVENT_MODALIAS_FMT    SCMI_MODULE_PREFIX "%02x:%s"
>>     BLOCKING_NOTIFIER_HEAD(scmi_requested_devices_nh);
>>   EXPORT_SYMBOL_GPL(scmi_requested_devices_nh);
>> @@ -185,7 +186,7 @@ static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
>>       const struct scmi_device_id *entry;
>>       int ret;
>>   -    for (entry = id_table; entry->name; entry++) {
>> +    for (entry = id_table; entry->name[0]; entry++) {
> 
> Is it possible to rely on a NULL sentinel?
> 
> Here if the id_table is NULL, entry->name | entry->name[0] dereference the NULL pointer

The NULL deref on id_table is NULL already happened with
the old code, which would deref entry to check the name pointer,

This just adjusts the check to check for name being an empty
string since it now is a fixed-size string / char array.

>     for (entry = id_table; entry != NULL; entry++)
> 
>>           ret = scmi_protocol_device_request(entry);
> 
> [ ... ]
> 
>>   #include <linux/bitfield.h>
>> +#include <linux/device-id/scmi.h>
>>   #include <linux/device.h>
>>   #include <linux/notifier.h>
>>   #include <linux/types.h>
>> @@ -951,11 +952,6 @@ struct scmi_device {
>>     #define to_scmi_dev(d) container_of_const(d, struct scmi_device, dev)
>>   -struct scmi_device_id {
>> -    u8 protocol_id;
>> -    const char *name;
>> -};
>> -
> 
> What is the reason of converting the char * to a fixed array? That limits the name and may result in truncation and potentially name collision, no ?

Because of how modpost works to generate modaliases inside the .ko
any string buffers in device_id structs need to have a fixed length.

So the truncation / name collision issue pretty much applies to all
foo_device_id structs in the kernel. People should now to make sure
that any strings used will fit inside the fixed string. And I would
expect the compiler to warn for overly long strings.

Regards,

Hans


