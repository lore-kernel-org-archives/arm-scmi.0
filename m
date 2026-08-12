Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27613BCD14
	for <arm-scmi@vger.kernel.org>; Wed, 12 Aug 2026 08:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786524917; cv=none; b=G2mTMJs1r8hUm8lCXJV3qsa/gZksuBZNziA1A5+obY/FynTRkqB13Efz2CTv54naJRF6CvL/HGFQlO0MuZL7tjDRXb2FyNVqQbuZKNhwgfWoeEVkKXK8pL4zC+AiGtU12l1aveKzfngnKO4FTTf+59P9IoUpo3WjGJCvfcdzBaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786524917; c=relaxed/simple;
	bh=F7MqsTpvXEhShRZzCrVhWm+SLKO+Vc5RAc23Ul79HmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lHugoru/sQ4XhSqqYWMT5Dme9LzSoExEZuKgnZ0c4OE0ufKcQosDlLtD1OJ6egb7eJfK9FL234IpS8OnsX5iyMJgVsipEz8lzOpVHMWb0YdPiM6CYYr3iyx+2qYSZd+lePmlh9GGJaNgNEarMj5qHxBrv420wXSBwI+LnlsW1go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cL67h0iu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QfbOGbE1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cL67h0iu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QfbOGbE1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C8YsSO2528344
	for <arm-scmi@vger.kernel.org>; Wed, 12 Aug 2026 08:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l/9WLhEJTgXWRjhzQHboMAkJhxat9TGdxV61Ba2hGvY=; b=cL67h0iuMunP3Yqn
	+dKF8mXZ2XFnPGfyvHp1w2Ih1MY1WrOc6GqtrXdddlSD7I0/N47HFrp6Div3gJ4N
	KSf0k7v4+2I4IDFhcaTepJbDkcoV0eepRY4mCcUExPzizr1RZuCVaqtdzohIYdkq
	C4aobWj+TeBFiCVxLqNYUQouMenBZeDMXHXsWhzR//tZPW8TUGKKDIB80rQmCA25
	ZujvmJvrbpJtjiwR12Rs24X/aFvxhZSvEsQO4USZgnlEgX0t2cA5XejgTsQc9YBT
	Ad1nc5Wr4jv9C01nbuBtwEPSe7UWmUWbuftY/gnXRceX0v2IsDfI8M7CqP12vA+M
	4zclJw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0mnd88mj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 12 Aug 2026 08:55:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-381250979d5so939250a91.0
        for <arm-scmi@vger.kernel.org>; Wed, 12 Aug 2026 01:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786524914; x=1787129714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l/9WLhEJTgXWRjhzQHboMAkJhxat9TGdxV61Ba2hGvY=;
        b=QfbOGbE1dT4ou/+9LRTPtoNUH8UNZMkDn6xnSeV/pE9QkX4Ue23uAY+ExS9evvb+Kd
         Jzz9jdosEVxztAA5YkGXoLBG8A7dFoITcxBJutE0Fe34VCuHV40njSjniTPwPym4o94L
         nTivS27WwQL6OOhaJm/FHjUDOLwhuSclxv/fVdomAs6LRniVUrPj0FcvT1TprseA5AKS
         HpaXqlRqiMk526WE05YSmu6nxX5b1/c505GE908jb+CVU0xJPVzjlUNQlLBxQAnqZvKB
         jWSpAhZHbRetdAVodjucv2osdP4avQz6dHnsoSVhVhuHKWSJnQYcDBezx+o+LjJcDSuW
         JQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786524914; x=1787129714;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l/9WLhEJTgXWRjhzQHboMAkJhxat9TGdxV61Ba2hGvY=;
        b=pW2gqu+R20JPUFFdYWtxJylmtvpM4bgAgSxOEXeg5ZTzFcUP2R73LyUhitkMzrvEWU
         ZIQcZnojSacgdocYQW5vnL0ASfo70fdFJ9QBZz1u+C/2KDkPCU/YhQ6xHvilMgPKsZe6
         D5SRUJnaBvj5RXmv8lZiHSyR0Xd6cQCAiSzIAhh64VekCZXKGw0iTqTgX2pb1t9KsCaN
         yPcsLzTQwycNfWHkQk/5x/v+2h2/Vr9fQTWZLacrm2X5wKi4xomFllQL1v/RugNDn3eT
         MDyaPd/XruSEOrImGXq3n/lsvPgtffmka+m2SCUW7z9HMQlO3qmlZlkeKLKsxwCtDotj
         nLyQ==
X-Forwarded-Encrypted: i=1; AHgh+RoVfEOeO6eghaq7HKJs/mDF4+wW2Zp6y2iUo33J7eV0garbcUMG4qq9d9RhBhPNgBL6E9qjHerZHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYWEq99U5Y0k7Cn81KuJhWRD61xuFYf47Hqi7HCXhaZ814HC5K
	z4LdOYlm2Pb4dDNNRXsgCvf+gO8bTL1lPo/PRrAzVUwozvnntMiibViHvo+UFJbB9oQ+18qmem8
	tl2JOMsikqisErBmcB9RMitHoTYs6krcEpQA5DT5g11pSABJK0Yo6WiFavJlEug==
X-Gm-Gg: AR+sD11Y79PHzi3DebVTFBWbk/r4msfqMvJOyr3ABeuD5mw/MEAj0F3fu8wLkl0tuvl
	gBhRD8AUfgqtuufPLVScEgjhX+yyh8WX5+UQilpgqGACWz5u3kUoMqdjS0PTOsiaMc2P0PcTXXR
	lpr+vGy1HrcVNZllRucAy4pG307X/ArUsceJertM/do1G5AQRVp5coESY8EFgo/mwCRit7dyU9v
	eEdUWCFsiygVS8avS/sYgTaXHbHPObesdUy3o/XDi3DHAlDCK8Zc+Xua3EoxPgJVj66l5tWfao5
	Gm0SqmIWX57c+2dji9JS4wtvKbR2LuY+ZF0vW871xglQPjR7eLZ+JmffuCH06WmpyOV9UbWudXg
	x9ihOK/XjM4aTWsP0xGCHLniNYNLHsw87vg==
X-Received: by 2002:a17:90b:3802:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-39301490a5emr3605671a91.11.1786524913684;
        Wed, 12 Aug 2026 01:55:13 -0700 (PDT)
X-Received: by 2002:a17:90b:3802:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-39301490a5emr3605632a91.11.1786524913227;
        Wed, 12 Aug 2026 01:55:13 -0700 (PDT)
Received: from [10.217.219.92] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f908a82bsm2808212a91.0.2026.08.12.01.55.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 01:55:12 -0700 (PDT)
Message-ID: <de19d0ac-3b3c-494b-a3da-028570989bc7@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 14:25:04 +0530
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] soc: qcom: geni-se: Add helper to set SE clock rate
 via OPP
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
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
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-3-61171ab1cdce@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-3-61171ab1cdce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA3MCBTYWx0ZWRfX2zZKklo0CBwO
 m7BSnSjXEqldX9zo1UPE5/KVfSBsYUnnJVRDIHQiaoxuR8jFbahWNBnE0A9Cv6NYgnagD2yuwnB
 1JTpPLXLkXlmYZGaSb+/dN8Z/I2roFc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA3MCBTYWx0ZWRfX13LTUiBFCSNi
 YE+8xk4xqqykpgBSl0NeUehfoyB7/j6GQ2nsaBky9LPcjSmpj8WEdUCJZqeLJjkw3bcP/fuf06P
 B7eTr1O+mvMtq2DmleSwdGAQmDz5ZBsOyRabXtWbhjnu7Ne0/KLRQZi5cA4pwpVTWyGK8EYsUvJ
 au37F8zQ0SEvyNLFjR1wMfM93q7Wf7dl0i3Kd7Mfek1jvskNwkVo3zTTuhHSc1ZnGMKTTrq79Th
 Vbq+unIoS/xOn8vcLMaIWB0XwlWXBJ56ljZeV/a055cTHU8tZrBLyaYblYpGlvs1lkq+J4jlwbw
 vxMklPefKVD5/oLUAFVqrOrc60u2tz+nMm+8JkH//KqyofRon5zBnQ5sTFw64jNBicfL16+5Fgp
 UalmQnPXVW3bBtBT19j6Bh4Rfilmbrjamzet2VxoZjMEp19WZz7fzdHBrcBI+RDJ4R4RgCMO8va
 TMR56bxwBeqzUK7oMSg==
X-Proofpoint-GUID: H0gGu56UbdBoUSeUNJoZSUyt5mYBmA8F
X-Authority-Analysis: v=2.4 cv=C87ZDwP+ c=1 sm=1 tr=0 ts=6a7c34f2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=9aiwZt7zaXvVnErAyWsA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: H0gGu56UbdBoUSeUNJoZSUyt5mYBmA8F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120070



On 8/5/2026 1:27 AM, Praveen Talari wrote:
> GENI protocol drivers need a common way to scale the SE source clock
> through the OPP framework. However, the device that owns the OPP table
> differs depending on how the SE resources are managed. For Linux clock
> managed platforms, the OPP table is associated with the SE device,
> whereas on firmware-managed platforms it is associated with the
> performance power-domain device. This requires protocol drivers to be
> aware of the underlying resource management model when requesting
> frequency changes.
> 
> Introduce geni_se_set_rate(), a common helper that abstracts this
> difference and applies the requested frequency through the appropriate
> device. The helper automatically selects the performance-domain device
> when power domains are attached and falls back to the SE device
> otherwise.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
