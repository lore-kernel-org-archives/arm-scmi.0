Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351DD231836
	for <arm-scmi@vger.kernel.org>; Thu, 15 Oct 2026 03:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792036713; cv=none; b=lMI69QcIPWItHhgntYlGe5CJtuCKKna0YBbXGefVNUedlwoT3AwH/EYdc6WbG3UdztJOZRjbJasrShV3vBCndG40CE8qmL5NE+f4Dk8Yw0mLvC3daaaE9LvlM5la7STRw6oDM6pkENfX8/bJSyFK0ryRi9RHUTlnehdcZoAQtwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792036713; c=relaxed/simple;
	bh=nguePDkbSX8CdLrI5jeCiApYYmALGzarrJu+OM9Fqm4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ax54cG22XnWbTjxRTOaH6TdZpIow0Woric0TNaJq5+DWRcSXi4st2NMHazjZd1Hy5YBqCoyjzzlBAxQXA9sE2MuW+Z2o1gSUGMMyzf2Blwoj5lcQfMQwl0GKyNWojYKxZJ/Qj4rsetmEsYrdLXJO6jr8khFtAcfXOpXWnrHfC+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a7kG2EMK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bZ+62dYM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a7kG2EMK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bZ+62dYM"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ELwRXO500307
	for <arm-scmi@vger.kernel.org>; Thu, 15 Oct 2026 03:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yLcj2xFJ+ldAWy0+daCRV0vS+QgpQC6UVrd5FcRL0HE=; b=a7kG2EMKtNc3ppFV
	ogttzL9XW4vzOAZkDYPt2ffRra6tQRSjZqEc5ss7PKoRXS3+CC1neU11bs5H+wJJ
	hv0t6JzmuVAVNBJMNpYtXtmAHgvs0ZLgHPfCtsrwNzyRUiFaFgblwJe1V3XC0PN6
	5e+BVu6dTNcrxA0F6uGaN2XuN3U1OMcoMCDwscp9ZABI6fTaQcSDKunlFPDiWZXz
	U7uPDBBOcvNuwLLzE9W3WPH5sc8IN6Vq+iPqdYETcyY7IVg5T/j0sSvSx/BEH4d5
	1QpW/a0vbZDFtNGyLXbtAzN3PEPir4XiS13YiIp+WaDrZsNUxAmRnoE9UN1eiaua
	Q34uFg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haagf31g3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Thu, 15 Oct 2026 03:58:31 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-147be78cd56so19031075c88.1
        for <arm-scmi@vger.kernel.org>; Wed, 14 Oct 2026 20:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792036711; x=1792641511; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLcj2xFJ+ldAWy0+daCRV0vS+QgpQC6UVrd5FcRL0HE=;
        b=bZ+62dYM1MkDW+yNCtwXnFmU0rRsmt+hOm2R86MsgwR1TaaWRYEqHLXkUEj5D3aFrZ
         b3UFjMCJyjGE2cziPtAYBuZFBczQlt76fBuDeXTPYGDswpoWy8u9tNWx4PNLOHIutaLG
         XarRFDMreyQPNY2MoG6slsLkyR3XPUovtr2rNzNW2yHaGGm9+5c/4DLoXwRy7RIJoYmM
         emdfwIpgVNEitVE84sUW0rhyUf7MwauLw9oxMWv6gf1QHNSVYSrgqALoLbgkR6brV2/e
         MYgV0o0NSChJi9SPbwCVNVpqL2thU+hPlrsfudKNBwm52Qz0ei8dSYQu4a1tc/Fv19ix
         v0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792036711; x=1792641511;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yLcj2xFJ+ldAWy0+daCRV0vS+QgpQC6UVrd5FcRL0HE=;
        b=uL1E3d8YaP0S3aOR+ec6Fd4KcHcodaTJKvmlXjhI4tHO3guEjweGSaMZMxAaFJ8fiv
         j+To5hhFlZDI+gLyA2HBa/mDhYLX9rCMaCjhRMOsfKmBNGL0UJexuFwNOAwuond5L3XC
         FgDVtyo3H3cC9s7oMtHi2QSH2L+mRadrtbak5y66IYbctXH+IiTA5WoxIsYs1aOwk72l
         oktSiql7xkO/NjUK1N3k26MMlw2x/bQaI4fYYFBzKQIbrFwCPRKcqPiq3Qdo3t7ZDQ4v
         jS0a5J+YAne/FlRN6UUYuhn4PyCxfLrsON3uqkR4u+eNCEtQ1GHEEE99eXMlOUubv0Va
         KLwg==
X-Forwarded-Encrypted: i=1; AKwUvBxNzKPYhFYbILtAQI3CPDdQnYbsO2L0o2iJbPe2n9EQjdN1SfJOSb/VQnNRdBr604Z43FMHoG69Dw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJY5yfghjzQg7c39/fYoNA0/zJORdV4z4fvt8iSvN/NK64ztJYZ
	nTqOWHW51ivJJnxPr8DRZx/QNZz2xv2VmqfV2VkkgjkvXLmAAGSvB707gTJ81Ixxh6hwyHUwyFw
	CwYGOQcx84Tu3R1OcPGBreq+eSbnZmwVlkVc3B+hrejnVWOZmHywII1f1o3TaSg==
X-Gm-Gg: AYBFou2hjvLL+U8c81CT/T2b4YbkyY1slsn/OOZE+Ht2A945rvz7vofnPFRQgrbzkGW
	pKEg6gXMNoTCMFlAWxApqnPCDHrRM02QPcjF486f+fvyvu36nmtC/BUEY8fvNjOZN6NxClEhv8f
	/LL2Bji7ntgSY8XZxxR4SmAMJlPJTlnS/HPRfGnznAvH5AaIwvzKGV8GZLFfS83oD3BTlqiZc2O
	VMFrQnaoNwPItwXs8u4PbAGDfRR0Re6G2qsdTdT3//E6E09t7Jg89rTX1T0uEpE03VBRSH4ubxG
	87nP0gaFMsDjMjWSc/kHYYC4D7imVTrLYWcGJ/vN9OCNa620Gx8lwjI4iwWVQH2+9amv2uUxrrM
	gC2ILdoIMkUrwFx34iq2WoYhajVwUoA==
X-Received: by 2002:a05:7022:e806:b0:178:4a98:8751 with SMTP id a92af1059eb24-1784ab70e5cmr12450021c88.37.1792036710729;
        Wed, 14 Oct 2026 20:58:30 -0700 (PDT)
X-Received: by 2002:a05:7022:e806:b0:178:4a98:8751 with SMTP id a92af1059eb24-1784ab70e5cmr12449972c88.37.1792036710046;
        Wed, 14 Oct 2026 20:58:30 -0700 (PDT)
Received: from [10.218.14.97] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b29c2f861sm41853429eec.11.2026.10.14.20.58.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 20:58:29 -0700 (PDT)
Message-ID: <666e2768-28a8-4bb7-8c15-457ad20970a8@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 09:28:22 +0530
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] serial: qcom-geni: Use geni_se_set_rate() for
 source clock configuration
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-5-091697dbeb02@oss.qualcomm.com>
 <cf4b63ca-adef-46f2-a616-01841a70b173@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <cf4b63ca-adef-46f2-a616-01841a70b173@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxNSBTYWx0ZWRfXxF8C4JXi0IWR
 lnrBSaFieKWT0SNuV+45OGdN/jM9OEb5l8GC4PWfZyozjZrg4Dv1UtuBK8kQ3XMZ6gFpWnF1/1h
 lqeH6XJIsLDvg6ZI7l/w7GMOeQiG+goqpoY3rcif6r8GwZAnHJiuyjc9cPpegCCfLzrYzi7veLk
 JCSVOB+dlEnq5WDkVKiGb3vDXED9bSd4hhblZ8vbwx0WkTeWJDXIp0Rv7xQqwPYVVWaxkZyfwc8
 +KwjFxj/BSqqWJKqhrgchR0nwKTyhfR8zrL4TCktFiyPYUuUXpJJHfYy1oOIb6Pf3XmJ29YrPl7
 e64C9CkPMnIU1QxhkmdxGnOQOxatD3UshcOV9xiW3iWZd4RYY2vHkBomkguPbjAi/iHbK1nnFJN
 LRil1/xH46drzycsM8NLFDy8gsd6m+P2/ffyiERNlXY3yEk+U5v4qClbepLPqjJeqSWZk5S/ICE
 iMsCfMVY1dpjKD4bfqQ==
X-Proofpoint-GUID: Po3v5DiGnK8VYSczNxYiqTqhYfewDxev
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxNSBTYWx0ZWRfX2k0hJKR35gfd
 ryiCHBUQ+OA9W6K5yHX7lFXzVjcrMpRG7WRWPPjeVwJujq7Lct2YXqYBh13hddwZNrK/th96PWK
 wJEjdj3nMjwEvySvGEqVAWU4OMuq7I4=
X-Proofpoint-ORIG-GUID: Po3v5DiGnK8VYSczNxYiqTqhYfewDxev
X-Authority-Analysis: v=2.4 cv=V/noQuni c=1 sm=1 tr=0 ts=6ad04f67 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=ip-HRx4nHBnhdLLshUsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150015

Hi Mukesh

On 08-10-2026 13:05, Mukesh Savaliya wrote:
>
>
> On 8/27/2026 11:29 PM, Praveen Talari wrote:
>
> [...]> @@ -2039,15 +2041,19 @@ static void 
> qcom_geni_serial_remove(struct platform_device *pdev)
>>   static int __maybe_unused qcom_geni_serial_runtime_suspend(struct 
>> device *dev)
>>   {
>>       struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
>> +    int ret;
>>   -    return port->dev_data->power_off ?
>> -           port->dev_data->power_off(&port->se) : 0;
>> +    ret = port->dev_data->power_off ?
>> +          port->dev_data->power_off(&port->se) : 0;
>> +    if (ret)
>> +        return ret;
>> +
>> +    return geni_se_set_rate(&port->se, 0);
> Is there any register access happening as part of this 
> geni_se_set_rate() ? i was searching but could not see after seeing 
> set_rate() callback removed.>   }

No, there is no SE register access as part of geni_se_set_rate(), nor is 
there SE register access immediately after it.

Thanks,

Praveen Talari

>>     static int __maybe_unused qcom_geni_serial_runtime_resume(struct 
>> device *dev)
>>   {
>>       struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
>> -    struct uart_port *uport = &port->uport;
>>       int ret;
>>         if (port->dev_data->power_on) {
>> @@ -2056,8 +2062,8 @@ static int __maybe_unused 
>> qcom_geni_serial_runtime_resume(struct device *dev)
>>               return ret;
>>       }
>>   -    if (port->se.has_opp && port->clk_rate)
>> -        return dev_pm_opp_set_rate(uport->dev, port->clk_rate);
>> +    if (port->clk_rate)
>> +        return geni_se_set_rate(&port->se, port->clk_rate);
>>         return 0;
>>   }
> [...]
