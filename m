Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3225942DFEA
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 15:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584022; cv=none; b=Xw4QsnR+AL1fViR8Zt77p5D/qDm+zSvi23y/eihwGHDZXwHpqaKYSGOfKnnW8p73RExfyZ6vRsH38YJBunH4bQv0ix1CtwyMmhqe9EllJ4DpNSYuoOLD9A56IHcyr/NjZZIxU70X3q3kqJho8Yx81U3yE0w1ftdmOJmk6rgCz8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584022; c=relaxed/simple;
	bh=WsnfpTDfkMnaQf6HEL+ttL08frhpgTwPFvG7hASiU0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tCbyiYl3wB04FIKey3mqTXJQjio71CzA9/TNtEgfp7K2ylEiNBrJfet23TSimLEzy5woaq7XaOSbhgU0owwVrnEZY0teR17Hz73BI9ZllT0KKOxsM2jWDZk2X+fsDEtADz0B3WWjqZhHEMS1RFSzEYtowj1DW6wALz0UlsXfZLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ateVbhtm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gc/upujG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ateVbhtm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gc/upujG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCur8o3613372
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 15:06:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8G2ECsoTYtsyvfoNVIawmowBPsx5W3LlCQSF/qBNKBE=; b=ateVbhtm+14kvfjM
	DGoIJjbkOeNppgOxnkxhmXJ0kbvA+4O9h0ks0U2b0R3CsgH1wLql/YWPjzR4tWSA
	7TjtpvVg0AG4rj9E3PrwO/kqu6nsrBY98YB8aV0l3dHa5X8ylVaWqHvCPQksfTt+
	9lWerPMdhULTye/QlBOC9fGCDkNZlFlBZSYEWFE1EDVVhLm9NyjEeoeVKWJGQ6LJ
	wcgpbcIryQXmQ8iX8yQAmD+qPL2reEpsIzj3XOk83mZHUMlR0JscrwzHMXKzKTzs
	xsCp0SxIz1jyAPd9XQy+LGaae5TmSz8mgT78yrcbPagsJ57560vifAqFVrSVNGbN
	kWzALQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8jgk1tqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 15:06:59 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97bf8df21a1so51476241.0
        for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 08:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787584018; x=1788188818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8G2ECsoTYtsyvfoNVIawmowBPsx5W3LlCQSF/qBNKBE=;
        b=Gc/upujGDOUYRfD5bn3XnKuj4By+4y6Jn4r5dYb85u08JZR7f8itr2LO+wB9XIBLjL
         yWTlVHA2h012PgmQaWeKdVl9ybAGpJL7eySgoMkeEUS30pxX2uaFQF3/wpzd/v8eQK7g
         9jMluDgM/IpZ6Cnkd+lB0f+Wk24ygdZcgB/vvhFby/H9Gz7GaORE2bVh4NlwHuXbvN8k
         A6pOtxfMidjSLAkuM+apj16ZZvrgRcwV5KJnnHspcKRXgOZ7Pw6GxE5GbX9ZL5WntISX
         5zdaCGqOEbuFreGH1cICdatIabZBgTbrfwfiHzf8sbF2zmNW/zb3YZraftvwGv+N3v5w
         3i7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584018; x=1788188818;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8G2ECsoTYtsyvfoNVIawmowBPsx5W3LlCQSF/qBNKBE=;
        b=aWxvSCSCftwq/AfELehmtU1p3NpLDkzs/WP4Ksq+4bT+cgmlllbeA/bsE9Vp8xrPiS
         52aTIxoB8Rmbic8CYJPfSyvLG7dm1Po/EvlyMTedEC31jJsLBzRpzJ2kyWAPCOUKjbvG
         SdfuEaXuSDxE8bL75DEKBkRZHJ9RdM2j97uSHo2+nWqIiDSD3byYGsHIyVhZgVOgLX9H
         iKXQMP5JIILXRYJmmdYBnFzZHpHg9TnhCpX3a0ljVTZe4zFRYdgdNz9PRxDR1hkayz7W
         rdMw7cxr28VXIrnYLKL1J3pC0bHuNStTMxov/rOWzFNNVSBZ570/4TOG4JjvTcN5rZge
         n/DA==
X-Forwarded-Encrypted: i=1; AHgh+RpbjRhrBYafpZzw4lL/LJUwVMVfP2DHOStB/cYLGOQSM3RbuGw8qKY7hlteyabL47Qu9bGiYHFWpw==@vger.kernel.org
X-Gm-Message-State: AFuF++lpvnud01iuMyqnKmeGuLqKqlVaT65YaKIt4nax8yYRO31aTJH7
	Gb6IXjeHrouFjkJWKoauVXVVPybtexpvGMVIa+qxT+lmTO6U0Ym4vccaE2c3b9WOhWdeAfs43Ni
	dSnvhdI5mRHtDlSaDPyNyGS+RaOCVsmh6LcrUlZjuqFNHknon1PobUtEMkGn0zQ==
X-Gm-Gg: AR+sD11erCmqZljpeMbcxy188C4RUm9Dhc0VjY7icfAQZMucXCx9xksl/iZqMqWGr4R
	fG8Hcg3zoj27iF3BNwDsY9c0Uad0HogYhb6ngR9/im/fxidpQqwWXP62vqbi8kT/w7U5FEqyF92
	XQ+oay8ObLk6dOH58qXBvUPOyIC8V6VqMKw70g6s1B8ZKeBHoDm7GjwF47wnBJ8fvvt748RTtm7
	E0lDRY7jEhGcaAl7fhSWi0tuP+CsF2yNbA52EBOmkiECsMK8gCFVzvIlqAvSpD9bV5FMn4iNbL2
	RFFXA7yvnQK05Wp18TO/8zIi6iS96Ey1P/edwX+qDBC7Zot2OPPU8S1tZvNRnMg3db8LMrA+6rH
	9ZdtYAEQK4lhzw4K+g3+xcmPk
X-Received: by 2002:a05:6102:6893:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-77a6433632emr3704112137.1.1787584018235;
        Mon, 24 Aug 2026 08:06:58 -0700 (PDT)
X-Received: by 2002:a05:6102:6893:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-77a6433632emr3704068137.1.1787584017657;
        Mon, 24 Aug 2026 08:06:57 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e199ad5sm9278440a12.18.2026.08.24.08.06.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 08:06:56 -0700 (PDT)
Message-ID: <aca6afe7-4659-4359-b5c8-e19390a07f8a@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 17:06:53 +0200
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] i2c: qcom-geni: Use geni_se_set_rate() for setting
 source clock frequency
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-7-61171ab1cdce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: z4150WMfs1saGszkOguMGyqqeiOgxr0b
X-Proofpoint-GUID: z4150WMfs1saGszkOguMGyqqeiOgxr0b
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEyNyBTYWx0ZWRfXz+L5Vip5by3g
 mvgN03fzf1RBYAh8JTBtRQPlIjefEnFmCyTKGOKUGbK0sDMsRksDU5Jiym3WKvu41oQfCmqeDKe
 8txeudVsU4/TNBnwcgpPqZxVCYLH334=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEyNyBTYWx0ZWRfX4+s7kVlnbbqZ
 MN3+Ufgb6F7h8+tJgz5rOMnvJn76heAla761kAawg9Z2Lt4RzBbSochIk3zeJiK81HiCRqWYZzv
 7KbkYyF3ykqnjhgkgEiwCMdAdgtWX0WOiJm2Evo0+E/kSVW0gTFAPz8jw20ab36cIgWhMhITmTR
 ihHbsinHAP4Oy8c/lVgtZZdLKXIsBOVfKsCjAl8zgGdkfQl49PUt7ohguZJB31UApQqdnBh6MGl
 mDbjXSiA8YRLLCnyUmqDN1KoHiPdy0Xyso47Crl14tEAHqjVfxdTINLka+FJv+frOw+4Kz2ChkT
 aSqPbn26qsNRTFxD4NrmQSBN7pk4BL/hPfQncaQA1gk8KlxZzyP/C3gmLtNYQ2+FMIrg6J1Rg4R
 WftxA6t6NmcqfQMNaULK2CAXlwgjlnOvjV1c3YQ89TSQX/d0y3sqNvQXbi+rjFya0dnQ/G5Jm7l
 t2ImK2cuf2p0g0avTiw==
X-Authority-Analysis: v=2.4 cv=KcvidwYD c=1 sm=1 tr=0 ts=6a8c5e13 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7mB3cpwZ_riAn9QYn-4A:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1011 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240127

On 8/4/26 9:57 PM, Praveen Talari wrote:
> On the SA8255P platform there is no Linux clock handler for the SE source
> clock; resources are instead managed by firmware via a genpd performance
> domain. The I2C driver therefore relies on geni_se_set_rate() to apply the
> fixed 19.2 MHz source clock frequency expected by the SCL divider and
> counter values programmed by qcom_geni_i2c_conf().

[...]

> @@ -233,6 +233,10 @@ static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
>  				 itr->clk_div, itr->t_high_cnt,
>  				 itr->t_low_cnt, itr->t_cycle_cnt);
>  
> +	ret = geni_se_set_rate(&gi2c->se, 19200000);
> +	if (ret)
> +		return ret;

This wasn't here before and the commit message only says something to the
amount of "it's necessary" - what's the difference?

Konrad
