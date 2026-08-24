Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53A446D571
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 17:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787590819; cv=none; b=Bk9d8lM2dfaD+DVZt9lY9R8/UzX31RpeB3nuhb1JJNMuKvRKP2Hig+5Q5lsFBSkfmpajw64FR9Gcfvah53RKiMgBZOnKeIkNHc9scXt+7urSCiPNw0oHDUSD9nXqaIAvgiKQ807kT6VlQwibEHSgEJHpCdFCWC/6BUn6PPTYUTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787590819; c=relaxed/simple;
	bh=x/KdzJwoa5zKxm6NKRxHEpBvqzGa7toXqXps2h0m+FM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UdDPziSI4ncDrF3jPMCbAVssVbkJX3Z6E4Kvh03vraEIfkbQXxGT6rKmYmRhjCaln472gHmUcJr1wpSAEly1tWLcw3xvIgDFXixdq6dtUOQhokMUSupfvDMjHNsHIxppPyi/QFP0/tUiHnDEXmXvbogDjR2rEk3XR++yVHIrNRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kp235+Tr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OmIWyxIj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kp235+Tr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OmIWyxIj"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OFn1a73234949
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 17:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/PFBQEZw27Yxkqm/8BheVqymzKB2ikrlKjRCFFjz/i4=; b=Kp235+Tr10HCOUDw
	TcQJpm1Tm12Y3qg9XiTawDjjb/6V7gBSvJ6UZHw8dgfn3ilBN7GOlgPz5++Vnchj
	7O30j4rG/bKc6Ti1B1JQmj8jK0xGEu/slqrkQx+Z/LTCRREvNeQa6vpptO3SjKA8
	34kja9iGtGfyxcOhOaOK+2ceUC/aIpoGU8iUxHa9b/ejAmlx5gy76BNzXSYrKnL1
	02iPddG9v4jqBqmx9XZEJFu7peR7RHSdT4kI2MpWYBik6dG5sQqS1sh/Xrq8U5k5
	BHxuaJ/gSL6HtrRmU1VNjwcjfW+kH48Z5P5g7CDhRlMoPWQRe7gCt8i7/LNe8rGS
	6SjJeA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gqnakfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 17:00:16 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso5276046a91.3
        for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 10:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787590816; x=1788195616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/PFBQEZw27Yxkqm/8BheVqymzKB2ikrlKjRCFFjz/i4=;
        b=OmIWyxIjuKuCbyfGNQuEGoSe6JCBiNMGHwWljVSvXOQinv5rQ4frfcb5IPGeoCeE32
         JEPDxSK1Xw1frLgIzCyb2vtl5NKohZNP/hCc0kpBTFO8Jkms31IwRXNSHJAuxzReNjyY
         cNNxUDaEnNlDjr33eTB3rwCpmyj68cHSBVsiSiMroSA09Px1+TSaPIik4SPAuUioXK/Z
         kJQbi2xC7QFB6Vh059iK3DtbepYwvwK+0A3sA6F8jYjMJuXtWgpw7qQ0PDRmNGHE9HOY
         P3zM+7joMKOSKE8RKjAy5CC9DuGXgtYLD5bR5JMdBBPKXpy+fv17olWcF3WxWVPTf19m
         bQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787590816; x=1788195616;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/PFBQEZw27Yxkqm/8BheVqymzKB2ikrlKjRCFFjz/i4=;
        b=WdVnC7Ai6wwE4xXdr9zSf0ioXDh4vqz9Aq9dfPry8Tin0qHFFpIVwvPVY1liB1VI5e
         EUc9s9BfdDlBsUK8G1FGF1sRUyVzfjTiwP44dB/CVnXOtjxeVAVN1x2p76H7Iu6Kdk03
         P1o7u7F+scT2I+KCsS0W0ydp6UUOf+ci4PaFWk72sFxac8ZDjvcBqIsz+KudSQiWityx
         hVncn4eRbFkJC5vlKz6Lf/0Q5ADfVZtDSInAaKPs7ckdDcL6K8r/rZAbUuzIctJsFjvn
         vPJQWzOjloVEMUUmEIk2vzBRLTUEwFJ4aBs0qOkLw1KM7B831AstpND8sFe9ZxsBmJtB
         jDsA==
X-Forwarded-Encrypted: i=1; AHgh+Rqg2TGjKLJheqbADB0RSyEU89IaCyIp4PlnN9avMPq9WY/UI5ZbwaVY1TdFPyGxkUX+z6kb2o4RuQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lO5TKXFgsXJsMfNM5MUyQ6Lln/T5Y3pwI/i4BJds9hj0HmD0mS
	m2/CO3W/LTikZOk7oswHQM7thL/dRSWdP9ggGn1GOK2a5Jpoyw0NPz3+5CVQs5n/oeu1/367kCi
	dNYxyEcEzsqRVm11x5DpPaJ8WQOSqYPqZJzSINfY9pvl/PfFWhiDw+87tId5biw==
X-Gm-Gg: AR+sD10tNczoFKOGlT0saXcRmvtl9MCBve8pOJ/Km9sXkqYgQD2qGxf6/I0VTj0c0N4
	zL356/NR4PuvJC2oevCS7mmpVNtlz9QxnVFoTxVH2vo3FYvCRuRKpwQf/5OhiQdmDBNY98KVQtN
	+iIgJQYa31oomUv5Do/4LnbqLBPTNf5EBR5AXG6maMGghq5h1APZf/FyRt84OjCTcAVkZrKlybu
	ZTrE72HZ4WEGVKs/1gWrPWrYLHZUjg6lNV/V/xg6J4c8hcQYnLjpnq0PYRGKpVjaOkMQE17PgUe
	zXZ8RJTadxYWa68xv+ezB/xeEQcs/JnT1OfHBUokv+di25KnubpMHve6LofMkI4+bI7roT8+GX2
	WULzbH5bt+rbciWgsHtEPCab4wEig9Q==
X-Received: by 2002:a17:90b:4b0a:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-396462ff21fmr510430a91.1.1787590815369;
        Mon, 24 Aug 2026 10:00:15 -0700 (PDT)
X-Received: by 2002:a17:90b:4b0a:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-396462ff21fmr510221a91.1.1787590814598;
        Mon, 24 Aug 2026 10:00:14 -0700 (PDT)
Received: from [192.168.0.6] ([49.204.106.1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141860fe08csm41584554c88.8.2026.08.24.10.00.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 10:00:14 -0700 (PDT)
Message-ID: <52ed6e1d-57a3-49e2-91df-0886b416282b@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 22:30:07 +0530
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] soc: qcom: geni-se: Add helper to set SE clock rate
 via OPP
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
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-3-61171ab1cdce@oss.qualcomm.com>
 <5d2504be-0691-4174-9d98-7759205718cd@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <5d2504be-0691-4174-9d98-7759205718cd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDE0MyBTYWx0ZWRfX8xuuCLU4W+5u
 9lacHQdUOrq7lcL/AlI90YFnOv5F/rZfy7VpfeMaUAvBerchpYxNE47JqamiqVHIY0kWnnA3T0S
 hDD2HwF9Udkz+KS4WKYYDnYDREKPT/Q=
X-Proofpoint-GUID: yldpIgnwAzfkyGZ8ci556dLtOSStagFJ
X-Authority-Analysis: v=2.4 cv=fqXsol4f c=1 sm=1 tr=0 ts=6a8c78a0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=3DKySdf3VQHjbkfL60kt6A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=k7YlSEv--4VGoxf32YcA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDE0MyBTYWx0ZWRfXzb7MLnZwjXC7
 9raB+TAdWM2jMaQJ0yvlkdg4yi3RO43wsMdKqzlZU8UVHpNRdHH1GM37+r7QcxPX95IAeTpzpwK
 y8TKNjT9DqoXJrlRCu7jBujmjb3ond8aU59RmeezKJ7/PbR2f+oapW7e+itZpxMtRLoe5FNzEzC
 NqGNlKREnmaT6otRo7GU/tyQEVTf4S30H6zXayPjpEEkJvgzyEmZCkl3XiFt/t5f4+QJen8H7Mx
 a8wCQnxajHV2hoZnWSy9n2VGcGe401MthY361ECPOMc+OfpXfX6r/Zbo7T6sRnXYrKe4ab3Nclm
 Tf/xp5dW9687En/Mq0MPoZmG/6BtTi3ENp7eLTGS73Tb3o2AFhEl7HrxKr6juFK9ELr5yu+Ghp+
 xQbbnu38sPRVrjHxiF1fpHSScWBR1voUngw5qde6WOLO63ymLJz/4YITaEWJIMYSzsMSmh94/J+
 c3R7aZE89dTcOjcIUHw==
X-Proofpoint-ORIG-GUID: yldpIgnwAzfkyGZ8ci556dLtOSStagFJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240143


On 24-08-2026 20:28, Konrad Dybcio wrote:
> On 8/4/26 9:57 PM, Praveen Talari wrote:
>> GENI protocol drivers need a common way to scale the SE source clock
>> through the OPP framework. However, the device that owns the OPP table
>> differs depending on how the SE resources are managed. For Linux clock
>> managed platforms, the OPP table is associated with the SE device,
>> whereas on firmware-managed platforms it is associated with the
>> performance power-domain device. This requires protocol drivers to be
>> aware of the underlying resource management model when requesting
>> frequency changes.
> [...]
>
>> +/**
>> + * geni_se_set_rate() - Set the SE source clock rate via the OPP framework.
>> + * @se: Pointer to the struct geni_se instance.
>> + * @freq: The source clock frequency to set.
>> + *
>> + * Applies the given frequency through dev_pm_opp_set_rate(), targeting the
>> + * perf domain device when the SE has power domains attached (firmware
>> + * managed path), or se->dev otherwise (Linux clock managed path).
>> + *
>> + * Return: 0 on success, or a negative error code on failure.
>> + */
>> +int geni_se_set_rate(struct geni_se *se, unsigned long freq)
>> +{
>> +	struct device *perf_dev = se->dev;
>> +
>> +	if (se->pd_list && se->pd_list->pd_devs[DOMAIN_IDX_PERF])
> The latter will always be true if the former is

Sure. I'll simplify the condition to just check se->pd_list.

Thanks,

Praveen Talari

>
> Konrad
>
>> +		perf_dev = se->pd_list->pd_devs[DOMAIN_IDX_PERF];
>> +
>> +	return se->has_opp ? dev_pm_opp_set_rate(perf_dev, freq) : 0;
