Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F2432E12E
	for <arm-scmi@vger.kernel.org>; Tue, 25 Aug 2026 18:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787681010; cv=none; b=kIEuz+usCHLDrw6/F1glnBKSn2Am36YtNNc/ernxUK7MdMcOFrW+YQSFuL0IKk4yIyk9YVqC25pd3RBqjjUmGNxofiKBdR9o8ZQrZHGWfjW83BB0Ly9QONJq/opieRf5yq6RqFOtHDrdt2MltDgdjSxKeMcHITS7PoLBpG4UXlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787681010; c=relaxed/simple;
	bh=/qmvj7oQP9+hee2C20TKZdFcP+FMqjk6v+eNCfV8brU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o4pFrISelbv2ZNfoIonZUW3olIgyaztKiNzsnO2PaMirzpbnSt/qj2wKAbKOfRHaBgKQJfWIyKbdIIkm0acAei/6dxpFooU7MrT0brbbagoDepQ2OtFAQRdEtqSVavucEY3Gn39end6Hhxxb/61JyNfY2BXfK7VZ84eHIAdG8e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LStShXil; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=khaUJU89; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LStShXil";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="khaUJU89"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PHdMJb2145122
	for <arm-scmi@vger.kernel.org>; Tue, 25 Aug 2026 18:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dAzvwPMvS0QGNlY8eB3tLuP2d1LA5UE0AZDeb4igS9A=; b=LStShXilBn/N/NVU
	B+zJ086C8sJhHVWLd+R8rKiO9UfjZ0740/W+UGfDVPq1bKPENeK4jFfAyipylQJu
	BVHo5R1jDR+u93GetjgtVEj78/zpeMpkezZobvZcP9GvPdAdpFo4xz526CB7J4/L
	wPFFto914JwtFXJGu1jM1yJ53TkHeSG+BI8vSo/ENi2hzJ3W+en+8vdrL2/bwVXl
	kJuIV4gj8mFE7uBeQYpZkJxQgJk5IOocT7/JvB5MDsMUsmsuP51NgRq1E37cVd3H
	wwmoU+biGU/cZYb4Y03MkYOB3Di92t2XG3svLhIS0lB99KMrFzTR7kXia+r5OxvD
	F5eR6w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9cgu110j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 25 Aug 2026 18:03:27 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso28408a12.0
        for <arm-scmi@vger.kernel.org>; Tue, 25 Aug 2026 11:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787681006; x=1788285806; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dAzvwPMvS0QGNlY8eB3tLuP2d1LA5UE0AZDeb4igS9A=;
        b=khaUJU8989VwdPaqaxaIb4vL+m2uYEvkuniKfELujRysXiZFdFXLp4eQzfOkSObr3x
         +RBSfF7VgsJQvuWepZWOZPC2epKOjHigeh9ffy/coSnMEtnkw00RRmObr7YzFfPs+kz2
         DW3FNzWdbOGJ6rzpZsk+x89Fu4kR0GnJA2/ijeF4GQgQVz2MZRsreN01gOD/sjJmFaVH
         vXr8bOBrO3GBqlFDotWIrAW+fyzn0MNxTfc0KuSdJP5NIqpsQa1HJsV5bH+OxHli8juq
         L8gApFt/e77lqENBvfrlMCZamwX+pPx+OXFZyTQVt10wpj9+y4o4XTHHtcbMxk5rokUq
         qbUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787681006; x=1788285806;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dAzvwPMvS0QGNlY8eB3tLuP2d1LA5UE0AZDeb4igS9A=;
        b=cA/1NnTyDOO2iUya/vOiw2HwaQLGrPL0rsSxto7ZYVjysKFyZ5qCS3e7ykerzOt86I
         yIY/eYJ2fnDD0BPL9XAzG/eX+M6i1YfhQYQnfOJ8Xfl08gF6A6EimagOiqsZA2bI60YR
         2c+Cm7LVneUWDbtuloJEqTorU3PGKhvkUmnly9AJXN2kCZAYU6kdQ6pUkCkasjnrMfVv
         Ld81d5Q+bZmvslYljHxyQDqoxmwNh/hjW3WfkDvuAY3dpgyMufII1WAsXNm6CRXiuOob
         KbH52ukHGmhKzemlJ8h1asNCevfrNA77uKJ5hujazvRoa+ImiJBeTi7Xt5PNo9Kxoz1n
         eAVQ==
X-Forwarded-Encrypted: i=1; AHgh+Rod+mHl7ezMTAbRkZgWFKnIevA0mk/km6LYRiv6nj9lnF9CPWss3mNllD44y8bJo6CZ34DUvQGFpA==@vger.kernel.org
X-Gm-Message-State: AFuF++m4M7wL5sII6FCOJ9AZr3n4LhZu20/EtElcYGodaRl6WoupnJJV
	DnrB0W5SdtI1zqEh+TsJZ72FSmC36ZQ6mGxH9LXPC/+0DT7pze7+fHqHIFdWcuY0RpdIxEjhBq0
	Bh7qC9l+r2i229rcegLujyLul/oygIFLBkAy52l4AU4a4aJbFwIYVCJu9T8Z12w==
X-Gm-Gg: AR+sD11nTnXIBigFEfC2ZZbKfw+Z5qcGy9QhBE6dujCTY/rkqW5TU1ulNk8wlrcnqzD
	HboFVAISGmxmS5kuzZFWfuWUjtUYfvFo2yQ0FR6AC7e9dNF8MI1nf1Vx36OrJ8w6jGT92FzMLOl
	86PTayIOTXQ271qnxjqxDw/HjSsSazih2NldsiXRNSPgoRjkBzrAKofCz+dWJneAejOI0o4pLru
	REej4S2SY3OOwlJ6ldpqAw73KI4OGEYIILI0zyW911W0ZaE5CrKCWTbb1M85otbuNoqCcdBO5GQ
	P/vAHBiwTRuIffwRJ4Z70qoUl92cBG2dsVavtCReyN9ufAM3UxywMb9WK7q3CrIQU+WG9HfWsyR
	gAtPa9j2/CJh8j+p7gtEG7W/wyI5xAz/Y
X-Received: by 2002:a17:90b:4e8d:b0:38d:f5bb:e0f4 with SMTP id 98e67ed59e1d1-3966d400334mr1832591a91.1.1787681006054;
        Tue, 25 Aug 2026 11:03:26 -0700 (PDT)
X-Received: by 2002:a17:90b:4e8d:b0:38d:f5bb:e0f4 with SMTP id 98e67ed59e1d1-3966d400334mr1832233a91.1.1787681004826;
        Tue, 25 Aug 2026 11:03:24 -0700 (PDT)
Received: from [192.168.0.7] ([49.204.110.145])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8f20095sm914906c88.6.2026.08.25.11.03.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 11:03:24 -0700 (PDT)
Message-ID: <29b5226a-d403-4bdd-a114-eeb2fd341ea0@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 23:33:12 +0530
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] i2c: qcom-geni: Use geni_se_set_rate() for setting
 source clock frequency
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
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-7-61171ab1cdce@oss.qualcomm.com>
 <8af7a34a-da4f-492f-a51c-cc420edc5e6e@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <8af7a34a-da4f-492f-a51c-cc420edc5e6e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDE1MyBTYWx0ZWRfXwbBV2V80SuCz
 PFboQoo1nC9uHremRCrVcVe4Yo8et97o4zBjDiy2ImZ2XNA52r8FIM5B6abjeMc8krUhExWsJs0
 9PON0N50arM2rqOXkmMq+7hbi9jmAXk=
X-Proofpoint-ORIG-GUID: dp_fnJaksBMGJuKDQt_MwSIwojbBPeXi
X-Proofpoint-GUID: dp_fnJaksBMGJuKDQt_MwSIwojbBPeXi
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a8dd8ef cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=T2iwtsF3Qoe1cvxaLfjbZQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=s8i-5AHMM79FQocxpXYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDE1MyBTYWx0ZWRfX2jNYxkbn2o+D
 T2Jrqel4dmEf8Twfx/E5rRfO2O2FGs4eAqYGDzxgtaJSLrxuWCnrxnKb98VpgoaOGijykGEKzPQ
 mBlAHFqxRSiL8N51RQkaXyCqqWVY4YMaOfBx2bXypx79BafZGtLTvCDKcPiUQX90q5w87vojAnc
 NhuFwXizCE3tOIWhXgXR8zms6JINk3+fkeO2vMMx4YJT8WMVjnnOlhuHy57S2muGUzjv3tP8/J2
 hkRMuCPVZjMmSPFfz/NI+FhX2Adt8vYkMm6P3o5cv9lhHzRUbuwu97kVf++noJJaWqWIgl/nkiq
 QWxKiGRjmCsxlkPZw8BTZGxtidOpl+I3DDsOak+5Lwj1lW+si2k5pOWstvqDnpah1LftMGTQBvw
 QMLgNq6tmRzbWoX/qBFRTa4cYNjpt+bqA58jxu7lnUKBN+v20MCDPecn31wkF/XB0gHHwToRpll
 pB3/KAvQF5sPNEz+9FQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250153

Hi Mukesh

On 24-08-2026 19:11, Mukesh Savaliya wrote:
>
>
> On 8/5/2026 1:27 AM, Praveen Talari wrote:
>> On the SA8255P platform there is no Linux clock handler for the SE 
>> source
>> clock; resources are instead managed by firmware via a genpd performance
>> domain. The I2C driver therefore relies on geni_se_set_rate() to 
>> apply the
>> fixed 19.2 MHz source clock frequency expected by the SCL divider and
>
> somewhere it's 32 MHz also and this may change too ?
19.2 MHz is just the frequency currently requested by the I2C driver.

Other frequencies such as 32 MHz are also supported and may change in 
the future.
>
>> counter values programmed by qcom_geni_i2c_conf().
>>
>> Call geni_se_set_rate() directly from qcom_geni_i2c_conf() so the
>> configured frequency is applied to the correct device (the perf domain
>> device on the firmware-managed path, or se->dev otherwise) without 
>> the I2C
>> driver needing to know which resources_init() variant is in use.
>>
>> Drop the now-unused set_rate field from struct geni_i2c_desc, the
>> geni_se_set_perf_opp() usage on the SA8255P variant, and the unused freq
>> parameter from qcom_geni_i2c_conf().
>>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 13 +++++++------
>>   1 file changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c 
>> b/drivers/i2c/busses/i2c-qcom-geni.c
>> index a23554d101fd..4561e2d235d5 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -213,11 +213,11 @@ static int geni_i2c_clk_map_idx(struct 
>> geni_i2c_dev *gi2c)
>>       return -EINVAL;
>>   }
>>   -static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
>> +static int qcom_geni_i2c_conf(struct geni_se *se)
>>   {
>>       struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
>>       const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
>> -    u32 val;
>> +    u32 val, ret;
>>         writel_relaxed(0, gi2c->se.base + SE_GENI_CLK_SEL);
>>   @@ -233,6 +233,10 @@ static int qcom_geni_i2c_conf(struct geni_se 
>> *se, unsigned long freq)
>>                    itr->clk_div, itr->t_high_cnt,
>>                    itr->t_low_cnt, itr->t_cycle_cnt);
>>   +    ret = geni_se_set_rate(&gi2c->se, 19200000);
>
> hard code ?
Good point. The 19.2 MHz value is not intended to be a permanent 
limitation.
This matches the frequency currently used by the I2C driver and 
therefore preserves
the existing behavior. If support for higher source clock frequencies 
(e.g. 32 MHz or others)
is added in the future, the requested OPP/performance state will need to 
be updated accordingly.
> May work currently, but if higher frequency support added, source may 
> change.
>
> Also you have added in commit message, but add a comment also here.
>
>> +    if (ret)
>> +        return ret;
>> +
>>       return geni_icc_set_bw_ab(&gi2c->se, GENI_DEFAULT_BW, 
>> GENI_DEFAULT_BW,
>>                     Bps_to_icc(gi2c->clk_freq_out));
>>   }
>
> [...]
>
