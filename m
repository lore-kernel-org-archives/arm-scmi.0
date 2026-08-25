Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD8E3DD862
	for <arm-scmi@vger.kernel.org>; Tue, 25 Aug 2026 08:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787645974; cv=none; b=RFYOHsz6+MLSMrnxXYW6ifDEulEPTfmtsFnq/Wt6vzPS7sQ2jxUbmN3R01D+hf56Ps9/T2YjqQxUtmwwU8bsM1RiyjpkDvMwMif5gdrmAydzC5BUOoZqCETmlZnRKKxK1PtMtYiH5ICTw8SpkzVM1CasEKl8CCTs57FO5b/BWZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787645974; c=relaxed/simple;
	bh=Ot8jIiii0wOPLXsN9OFHxPtvh5gzgjm6lZFKpTOJH6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XkzuIYaHXu4EkmE4YWznvVI1vduBHPWdEv+PgwHUEOzX+fYxo5snftNcvVLP6/ncI0g9iDCNTDzWpMz7rWiIA1hysK9Z6QTsITzXf4U4pWr9Ft6FRluvnF4RsmtTAEylQ9K3CGqSiWEPk8Gq3fpgAB1j+ohMW6R4Hum+2KNCryc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j7Rc8kjB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wr80EMqi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j7Rc8kjB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wr80EMqi"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88QuS1359551
	for <arm-scmi@vger.kernel.org>; Tue, 25 Aug 2026 08:19:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GT1LG3ESk4pX1L2+pv91ZrHz4OSnmnqI6wnpsuldA4I=; b=j7Rc8kjBAo5ttSFF
	a4Zv3pZeYdtIKXkG4JHEeDDKnKiKSSQj0wg7tyKNUIJu5LQSLwEGxOSxXslnk8PG
	h8ZLEiADGwfzm+T6fx6SqN4DEgTv/gr8h0+zJqklIrULq1JmTRJbkQkMbD3q2hhm
	malZb9VMsaNEC7RTMvZqtOh4so2ExbdzcQvGKOqhlUKbED0Y4Ka/b4bjedduCxI1
	csCE7XF3ccE/bAjDrVtzDfW2f/vSyGlUY3bwabmuG2leAIQjpQptjdpNGF3vKr5X
	KcfRz0oQlAUjRSZdqEsAvCdV2gKDwx7WQiLP6rfJAiiInS52/O7VW0qT2+F8ajEP
	RS1nMA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8swy2y83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 25 Aug 2026 08:19:32 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8484ba00601so5129747b3a.1
        for <arm-scmi@vger.kernel.org>; Tue, 25 Aug 2026 01:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787645972; x=1788250772; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GT1LG3ESk4pX1L2+pv91ZrHz4OSnmnqI6wnpsuldA4I=;
        b=Wr80EMqiW3KcyFAwopQGGYjYZuix0275KGRnvwM6gWpOXfiDCC2EqpFMeCcTRaPiEi
         luMDvAvmnOVHXVzyNbi9UjXkh1IRSPvakx2dWdEurxtPjsjSu78KGeSmQB28KCvxfyjW
         gIfTEm0fI3FloMxu/0MK+YZRgG3DhHEXF242IG93bIZ8E1CJIZY2ww8G3s3+Fa+oW5nW
         RTvhj/0wEkLil00SHq+/e2NkhWlBo83OPGZLvuzljXBMMwWkJCb9xemGwWTIF8oz0xqO
         zoNYW3UKDhfWqMhYQQYugiiROBRVHGPybtKesOARMY70Yirn/IZrRrxdBikT/2Q5RieT
         z49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787645972; x=1788250772;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GT1LG3ESk4pX1L2+pv91ZrHz4OSnmnqI6wnpsuldA4I=;
        b=CoE4AAIfUb85Ik3eOkfeS1pi3x6WTrDvCuqtavHmun+N5Y2X1dXIt1aze2+q0PfAg6
         gAO9N9XNzc9XBA4yzpwMzO1GMp7Vmw0EEqdJtgK30Jkf5XRMK1HlG3ECwsdoec6AcmM3
         v6uTZjOc9152aq3IqO7hbOSyVTepXnHdhpO3gFxt5BiCxcrsBr9CHJswmBcMOVrvtZL9
         zO9Tc3W2e9Zqanh9zVz2MTPfzdujXxKjrdFfk/jXTtv31YpPYLHLgCHqUZDAU5Q0ECNu
         olzwUIIs7DWMwtJW7O4rErF+F7ELW5uQZiizc1SHqsPbXyeIaLoleYXmVNfhx3mM5oDN
         ubeQ==
X-Forwarded-Encrypted: i=1; AHgh+RpuSx1EfEQXR7QBJ0oMLBNI+XWmzwMKonKVKctwCnbPR6bbGjMkdwG4doJStx2GjxXbeFFLU4JqUA==@vger.kernel.org
X-Gm-Message-State: AFuF++l1wRIHyt5oRyLNddwxrckgj8Uz/CMuWgJx6UZPHMWF4IGWsrWK
	n8Vp8vzZJyyHpZ2xl16HTEtsPTAhbS7wQlRRRxEd61Z3xpYyv2KrLvcB0E589cipKbZxknukjyi
	C7inNJd0waxSo04WjMEfL6gPqLsm2F1/SBel/fMpiBWI5wVTv/TL/2xHcErw3fg==
X-Gm-Gg: AR+sD104iSVaxLbxe3f1CGQ6GN6o5G8qr0nzyAAVICEcor0yoReWpDIuVc0imEZw4+J
	pRkJxGnAiViCjN89co1uf8nlZ/83xv43Ud8IVPcHH1c1IJ0YtnLuEkkCDdPgJk+Y9bsjbjQ1xfy
	A3cMitZAG6Re7eBbSuMw9t/7VZfWwJ0jUTyp7zi3h6j+4lDXZbBK7Lvx6cnNhua551/chDEVjRk
	MBA0974N2NObSgG3/jwEaiaaSJe8w5AVzw1SZtrOIPoBVzq7s0F9OZbTqY1/y8DTe5Jjfabxm9V
	Eg9CWKoP+qekZtSBXL0cLB7rvJDlFysPEwfZRqZU1Psq9bsSONPlidBM+v8M7sermBCXF41Cj82
	7idI8Zuz9HeY2vA+844kmddvU/GKTf+Y=
X-Received: by 2002:a05:6a00:1ca8:b0:84c:1cd2:142b with SMTP id d2e1a72fcca58-8523c8f0862mr9113644b3a.9.1787645971598;
        Tue, 25 Aug 2026 01:19:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:1ca8:b0:84c:1cd2:142b with SMTP id d2e1a72fcca58-8523c8f0862mr9113505b3a.9.1787645970964;
        Tue, 25 Aug 2026 01:19:30 -0700 (PDT)
Received: from [10.218.14.97] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520f161701sm2725924b3a.53.2026.08.25.01.19.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 01:19:30 -0700 (PDT)
Message-ID: <956ad5fd-7710-4731-9796-b03dc21cb2a4@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 13:49:23 +0530
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] i2c: qcom-geni: Use geni_se_set_rate() for setting
 source clock frequency
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-7-61171ab1cdce@oss.qualcomm.com>
 <aca6afe7-4659-4359-b5c8-e19390a07f8a@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <aca6afe7-4659-4359-b5c8-e19390a07f8a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA3MCBTYWx0ZWRfXx5O34cfWxi3V
 u3+nl5dR8F3FvKTI30bs9L7KaH9YEXxLQHFeJwX/l62/8GxsBvxjk2JDiYL49fSS5xgLJIvDq5z
 oBWJvQ+JnTiW4/qFXlafkC5Ll8uDUmbSSUDPNvdwesBMwujLQnp6bXXrYRR+tsLGDy6p9ij9I5W
 OmgQTVDaH9bXETOSnHmRe/0Rj7XObGhGba/sooB8Qq+7roXFwj5V8/PWDxx1RoZ+/svyQ6z8tJq
 4OO1vU2KTibdW5y0Ydb202CGiQp9ur2tbFWr/WOK6Jv3VU+FDMaJ2i4f3xHo1JasR+lVCyW6e2u
 hOSnG/TrpiFX32T0xfWKN0incaYZY3uw/GEtPxHhxCSpr1YHDZ+fZze7QM050+IWGeGWgUtucBJ
 R1zSpAMWuZp26HT2eYMhIJoo3RS+5C+9jHYD8pd4aWHXmRnX2y5PWH83PyEnMOufhUcjB3JyOV4
 o7FDwCDdDmVX0Z1TkUw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA3MCBTYWx0ZWRfXxcdI7khilzV/
 K/tH/Jn5llUljaZ7XPpWw7yoa0f9f4WRFy0QPoIEESnFd7qKhuZv7jvt+qaOm27ProlinC4xgb8
 TpkNiuNYm5v5GhmtB9J3Qa3sMiSFVS8=
X-Proofpoint-ORIG-GUID: nQyVUD8MalwzcG3DQuWmOiIWXZbzHJwZ
X-Proofpoint-GUID: nQyVUD8MalwzcG3DQuWmOiIWXZbzHJwZ
X-Authority-Analysis: v=2.4 cv=QIlYgALL c=1 sm=1 tr=0 ts=6a8d5014 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=QDFqMEhmg62cRBsMz60A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250070

Hi Konrad,

Thank you for review.

On 24-08-2026 20:36, Konrad Dybcio wrote:
> On 8/4/26 9:57 PM, Praveen Talari wrote:
>> On the SA8255P platform there is no Linux clock handler for the SE source
>> clock; resources are instead managed by firmware via a genpd performance
>> domain. The I2C driver therefore relies on geni_se_set_rate() to apply the
>> fixed 19.2 MHz source clock frequency expected by the SCL divider and
>> counter values programmed by qcom_geni_i2c_conf().
> [...]
>
>> @@ -233,6 +233,10 @@ static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
>>   				 itr->clk_div, itr->t_high_cnt,
>>   				 itr->t_low_cnt, itr->t_cycle_cnt);
>>   
>> +	ret = geni_se_set_rate(&gi2c->se, 19200000);
>> +	if (ret)
>> +		return ret;
> This wasn't here before and the commit message only says something to the

Yes, it was not there earlier. I have added because of Fast-mode Plus (1 
MHz)

cannot achieve the required timings with the default 19.2 MHz source clock.

A higher source frequency (for example, 32.5 MHz or 37.5 MHz) is required,

along with the associated voltage/performance vote.


Thanks,

Praveen Talari


> amount of "it's necessary" - what's the difference?
>
> Konrad
