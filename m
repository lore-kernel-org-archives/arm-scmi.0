Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C99E49CF29
	for <arm-scmi@vger.kernel.org>; Wed, 23 Sep 2026 11:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162774; cv=none; b=NfLwFFgRNFrD2AjDPunEwiHKWxbsApYLlA8hjba2NBcOxffYKFYlfjaUY5IPg+tlyJB/2a625TrWUCUgFF9oBB7REDTlGFYsooeytjSsHR5YYpDpLd50lRGF3l00vIPCuy3/Z2oQkm1aGCyjtGQyR4X37YWASxd1qsIVdKIsbiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162774; c=relaxed/simple;
	bh=wAz63z4vM59cDGM6LsTxL5BGIjXCM3agwqWGM65/FGg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=TgS9BMVgO5XRTS1D3PHJPmZPDkCrbiIsGWovSe2QqSfTTUKVADJeFku8l7q6DKWLKycjcPl9sk2CuXGJ/MopqMgb4FCLmoFsEiGXAMXQRV69UuRgr4euX8lncL6wcdw2Qd8OS4wOjY9okdjgTrzTlR17vUwrMw0A+tmRxMJ99EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LDCAF+6P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SRA9iwn7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LDCAF+6P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SRA9iwn7"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA304f4087733
	for <arm-scmi@vger.kernel.org>; Wed, 23 Sep 2026 11:26:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A8kpEDihnr+M8TdP16ky008+U5/0wXpkYZQ8ZAiWRp4=; b=LDCAF+6PYMGDa1hX
	CZho+8P+RdrJLHQuAcRrSndkxfxHFu1MLaYZ4ZtNGpefNEW2/EHpm7u/aiG1C5SW
	g9HQyleQkbgaCGn7QyLaBjkT4R8G5IvcDCrR2Iuu5Cpy4UudLkXDRqBME2QJBUFe
	6rEIMlxmoSPQROr7w/vbCMH6MBybl5F6VUD+S+9KexpQvBwk4QTVqsNgyLJe+qko
	qFLuIMUD7PGiQiPFMN2pkJx6gabdI8y/+Fo9Xi7ERomhni4pYEGVu+K9GIMHRiE+
	v2ubZn/1ta1ZY/f4UKEEBBIkJOKZ8RhOs7gwfnqrzTGn7jz8h74446AOOG1CnFAk
	EEigjg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c43fs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 23 Sep 2026 11:26:04 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90e8dd8be81so8595066d6.0
        for <arm-scmi@vger.kernel.org>; Wed, 23 Sep 2026 04:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790162763; x=1790767563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A8kpEDihnr+M8TdP16ky008+U5/0wXpkYZQ8ZAiWRp4=;
        b=SRA9iwn7BR1fmm5DN2/47VVTqE2edvbQ5ubCeseZ1myHjCFeq/McdqekyeCXz2P/Og
         8GSmZWRcXwMVLrLQRBF2q4ZixjIPwJsE6zoWEluaOXH8VD/Qm3U612X5ldIRdsKb368D
         hEQirXT+IQ8K8cLGA7LePPkSYvHnl7PWBA+BEEDwcsVXDkPS1vGBxMI9Cw65k7f8W6l1
         EdgvVUvqg1aF4ZyaiMWmnCYAjYSKTGvxOxEsSvXDdwOtWI1y9gobwBVjlOraIEn35pD0
         GZbmHXfY3WfZZiVAK2ZGNhe4qGOr9IrgFu8cWVwollehZlME4eH1jKsYqUqLIff/0Mir
         JAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162763; x=1790767563;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A8kpEDihnr+M8TdP16ky008+U5/0wXpkYZQ8ZAiWRp4=;
        b=juu3vCTmgiyYnYiq8A7c2APvvnNe6AABN2UxP30dVb2+p5ykOphR2CA0n6CeoMS8cD
         LTnG0SLSmz3lCKlJk9d1cCmPwjOqhs1UdvJtHdzZFqXvQmlKgUdCBL2Yp31bV+KahgCq
         F7wTogD0KKv2zI8MDeKOeVyaTc1OhasEvw6CqnA6x3u2ub6eLswYg6hqNqS8KAUcW+Ll
         YF6jSX4jHdXcK86TAUdMLKhl3S19nZJi7bCndGDm3VlTE+AVg6yFhrUOVgyLZ/E0bLvB
         Pe9wK5TOWFrdvzhvnL2C6DA4NYD5mD7NAmu4uISQqiowm9+9v1lCQoWopiILUKiPAC08
         0a/w==
X-Forwarded-Encrypted: i=1; AKwUvBwUWuf/vcYfrE9jpmMwEN97kR6ifyQNFVJsWdeaABV0QLCsRR6ZSuv7iBnjoUEYgUr8Ya4dqJqdrg==@vger.kernel.org
X-Gm-Message-State: AFuF++kJSwgEprW02X44dwl6r67hR4APv4Muif0xpdLqE9SjIMFoaFzM
	qJ4TXpw90sUig1uZVc1FXLsofAFRo2wo1m1pTkhl5ESlFQmzj/YQ2pIoNmbhPJxrIonx/XEoWiD
	oYA82tdV0VMcCFEILA7LiC4u0VyTHcaZlXLloPUv0j/ybaj/BG9Ds4IiGbAa5Rg==
X-Gm-Gg: AYBFou0I8uzSphMiS330gGvXj7C89TTWtlB4U9JxTPCCw+dAAxLoNhmTm55du8yO+4j
	Lt9ELFP92LcXj/G1Gae9qbTCgB7rnGKmiLuIhBFZSFZ2Etd0JRf+x98wR9iKbomS0Skf+tX8xA4
	ZNqG0GeTITrG/xYA8Hu3oejejFyUXOTTb8Rv3u8LoVx7mSUOzTyhGcAHnYMvc82Fw6A9wbsF96Z
	ePaL0DULTyNTCGzet1THGLBrmXZK89czHshTIuKvB1NMUEQ2SVi1fBPGdY42qTZZ29amZn1lttN
	wJGmkrsGk6z4onsmTcUw8032zgjy0st0G8EUDDfW/++50cHskQYA1Xp4ONueBsNnF1OMRXZAta5
	V+P5NxMOYkSOhI7zn87nwQe0IHx8hNTiejGVYgNFdz0cJlGG3H8tNkFQobtA3HjjqOauLnGQJB8
	V58grJs8sniV74OufUARBe1IbmRVPzo4JqABoN8GT3M9q5CQp9np+jhdPVNHfAreKYihk=
X-Received: by 2002:a05:620a:260e:b0:93b:d7ed:ff54 with SMTP id af79cd13be357-93c2521baa1mr353037285a.65.1790162763260;
        Wed, 23 Sep 2026 04:26:03 -0700 (PDT)
X-Received: by 2002:a05:620a:260e:b0:93b:d7ed:ff54 with SMTP id af79cd13be357-93c2521baa1mr353033085a.65.1790162762755;
        Wed, 23 Sep 2026 04:26:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c5c7asm100347966b.22.2026.09.23.04.26.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:26:01 -0700 (PDT)
Message-ID: <a5e56180-b96f-4fac-980e-e837e84cd5a5@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 13:26:00 +0200
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Sudeep Holla <sudeep.holla@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <arFKVhlgJge5EZyj@monoceros>
 <20260923-sceptical-mauve-firefly-f5456d@sudeepholla>
 <6b5a8300-ebf9-4717-bd39-952e89fc5e78@oss.qualcomm.com>
 <20260923-snake-of-magic-satiation-c3b857@sudeepholla>
Content-Language: en-US, nl
In-Reply-To: <20260923-snake-of-magic-satiation-c3b857@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NSBTYWx0ZWRfX0HzccBFVVuQf
 Rmh0pK4X2l4fchbNbQVq+XbcZkzjHTmmWfsCMUw+WCSzTpXv0/tn0fVpZJDuhkwjNwiULNfOspp
 bbdxzMOxiC/TMbWHkiQ7GV7CdPKwYwHyUF3wEfp+y3L7pNAc14mor/K/TeI45sr5kyeeCK9CII9
 BYABa9JQZ4vtZVaAy2oQdRFsei9zL1Wb/B/xN8SREuJadjEUIiWE9rFr4hJGSss/M7OS9RWIk2h
 j049dUi9UFBny100VXomw/EMh0SXJ0cqqOVVCMHgBwaYC6J1XLzaCDhyZJOzC7j+GtUxm1eC78B
 CHLkPJYEZpY2k+GvICp6LPxymCDHcSk2z3hW7UHSBCyTF4jxZuhmobSqhmIuMksepjAXkmnmZPs
 +5zgwB8aIs4sp890fpQifikRGz2KCa97ys99mkjTBgUPTAUDQKayFN/AOBHzAqgOB/9QO6mHtNO
 yomN6SoGWrIX3SKN12w==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab3b74c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=-cZiopXip2GWjs8Ks5QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: ncw83LzkFPj-u-BXRmPcV8Jr84kIwjgs
X-Proofpoint-GUID: ncw83LzkFPj-u-BXRmPcV8Jr84kIwjgs
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NSBTYWx0ZWRfXyJXPo2LvPjTh
 CTIKRBNuPazdDgOYvXFbkSkkQ+3rQ4dYm2ddfp54G4d00aZMIO7FO76znbGU1J3ZMC84w3d6lno
 xLXNInCzNWWkIjejgj7HHvIKkiZZevg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230045

Hi,

On 23-Sep-26 12:49, Sudeep Holla wrote:
> On Wed, Sep 23, 2026 at 12:23:50PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 23-Sep-26 11:07, Sudeep Holla wrote:
>>> On Mon, Sep 21, 2026 at 05:19:45PM +0200, Uwe Kleine-König wrote:
>>>> On Fri, Sep 18, 2026 at 11:29:50AM +0200, Hans de Goede wrote:
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
>>>
>>> [...]
>>>
>>>>> diff --git a/include/linux/device-id/scmi.h b/include/linux/device-id/scmi.h
>>>>> new file mode 100644
>>>>> index 000000000000..1b4ccfa9dcc5
>>>>> --- /dev/null
>>>>> +++ b/include/linux/device-id/scmi.h
>>>>> @@ -0,0 +1,17 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>>> +#ifndef LINUX_DEVICE_ID_SCMI_H
>>>>> +#define LINUX_DEVICE_ID_SCMI_H
>>>>> +
>>>>> +#ifdef __KERNEL__
>>>>> +#include <linux/types.h>
>>>>> +#endif
>>>>> +
>>>>> +#define SCMI_NAME_SIZE		32
>>>>> +#define SCMI_MODULE_PREFIX	"scmi:"
>>>>> +
>>>>> +struct scmi_device_id {
>>>>> +	__u8 protocol_id;
>>>>> +	char name[SCMI_NAME_SIZE];
>>>>
>>>> I wonder if you tried to keep this a char *. ISTR someone did something
>>>> similar recently and they claimed it worked. That would get rid of the
>>>> artificial name size limit and simplify this patch.
>>>>
>>>
>>> I agree with this. 
>>
>> Ok, so I checked and no other include/linux/device-id/*.h file
>> defines a foo_device_id field with a type of "char *" and
>> then uses that field in scripts/mod/devicetable-offsets.c /
>> scripts/mod/file2alias.c .
>>
> 
> I looked at hda_device_id and its uses. It looks like it does use
> char * and there were loads of drivers initialising the string. I must
> be missing something then ?

If you look for hda_device_id in:

scripts/mod/devicetable-offsets.c
scripts/mod/file2alias.c

Neither references the name member of struct hda_device_id.

So the actual modalias(es) added to the .ko by modpost
do not include the name, they are of the following format:

        ADD(alias, "v", vendor_id != 0, vendor_id);
        ADD(alias, "r", rev_id != 0, rev_id);
        ADD(alias, "a", api_version != 0, api_version);

        module_alias_printf(mod, true, "hdaudio:%s", alias);

>> 2 device-id/foo.h headers (dmi, pcmcia) do define a "char *"
>> field, but then do NOT use that to generate a modalias.
>>
>> So scmi_device_id would be the first to do this.
>>
> 
> Your response made me dig further and I found snd_hdac_codec_modalias()
> which seems to do the magic there.

Note that function:

int snd_hdac_codec_modalias(const struct hdac_device *codec, char *buf, size_t size)
{
        return scnprintf(buf, size, "hdaudio:v%08Xr%08Xa%02X\n",
                        codec->vendor_id, codec->revision_id, codec->type);
}

Also does not include any name field into the modalias. Note this
side is the modalias which shows up under


/sys/bus/xxx/devices/yyy/modalias

not the one which gets included into the .ko (and can be shown
by "modinfo") that one comes from scripts/mod/file2alias, but
the 2 must match of course otherwise udev will not load the .ko.

So it seems the name field in struct hda_device_id is only
there for the kernel to include it in some log messages,
just like e.g. the dmi_device_id "ident" string.

But this is not used by the modpost code which adds
the modalias to the .ko, that tool is the one which has
problems with non const size strings.

Regards,

Hans


