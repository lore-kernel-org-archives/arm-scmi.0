Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBF4340406
	for <arm-scmi@vger.kernel.org>; Wed, 12 Aug 2026 07:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786520208; cv=none; b=MYZImMbGXrTLx3dCgknSz5BDlcV7t4mdnMX6km/pWhf1lf0vzcoGhIUncysRVmUVqKywtVH+5p8LwPT/vNSlJ+YjqmoHHbNi1e+lmHXyvjTw1HAXtLTk9/kJsH4mG0zQM+oyb5V8wTA5bS4Ah7zt6UDIaDpk+RyP5CP6wWv/n2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786520208; c=relaxed/simple;
	bh=Hn67GR+gO5Esig7XtQGNEiHvrdUGoUdeHXneZMlfYRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kv/L82rHYpKZOSrvI4OzOdVGdozHShs4fa2K0S+HcYbbWon2R/cAZCJ5Y2v4j3kUHQhZBg2TRco8vj1grnP9bug9X5Uvo2BFvbh4JK4yqhqOERgm+BpUd7j3exsRpru3BWkTwLNAq8GalvVtF4gHHeFtdJWcY2Z17244qNtb05U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DUT6U5LF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NAQELMKG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DUT6U5LF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NAQELMKG"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C62a6J1720811
	for <arm-scmi@vger.kernel.org>; Wed, 12 Aug 2026 07:36:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NiIIs1N5jSm/s2IraoPfNeMV7WyhxZUx7PoQm7T9cbc=; b=DUT6U5LF+ORWHPgL
	7A5td5L/EjOH8p5NfbokYu8RsMKY33NfTAxUJ2dQtUiQS2PYGYMFtcwLFGQ0RhAW
	2s/AE0vc+NDkEPsKAfG7qWeyazG9/FoFvPWQJVznO85jF2K1nQQ7AS3XMz77sghP
	YKKRZVoh+BdtBdGfTfBp0MDAlueYM59rI2IKupHHwqrZBh5w0y+TillzsXrqa5l1
	9kh8YY5CZ/3sqcHD7KDtcCXuj1zL3AFBVkwpo/HkctruQhvQFfgTKR8TicTp1sWL
	FzZ9vua5JnOpHLzgo/7Dc/ms+JMC3+77Uml+D3cFHfrbfgk6FltE5+RT/HeoWhwQ
	JDJXbg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hfw0r08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 12 Aug 2026 07:36:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbedb8673ceso533697a12.0
        for <arm-scmi@vger.kernel.org>; Wed, 12 Aug 2026 00:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786520204; x=1787125004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NiIIs1N5jSm/s2IraoPfNeMV7WyhxZUx7PoQm7T9cbc=;
        b=NAQELMKGJYSMdNLTIoi+YOi85RrQidRm1RXGmtJNq7bcAO4SZeI+c/okz6TrkhgVBU
         xBtRSKbGK2XwUTTEVXtGn7Fi5qf7Qg/WcS/ny2ySfgxzqau2VwjbMSbm4NpJuBBiMFXQ
         TyDb3RdgAvP267vzG3DrWAjhNIvAp/5Saa4Ebrxvj+X6y1yWNt3mqh6gIf91tPCT445K
         ow5Q5hHpDoBcCNV0lCGR5Zo2xgtWU2O58KCdmldSw5vpfscVdOUGNmV5iJvZQ5LNtaHS
         gBSSv08LE5obA5HmNSeugQEJ33cgkaSWhUrJFEqBAwtgyZ4EI3Pxqc2m3s+yk9qRgaYX
         Q3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786520204; x=1787125004;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NiIIs1N5jSm/s2IraoPfNeMV7WyhxZUx7PoQm7T9cbc=;
        b=dEiiRwKJlr9t9rrHSPXdbjJ+EXmfpf8aI31/VZfxyDRjFlbzEAcB3Lgh+USXDZ1xtf
         fv0SkJcT7U6vTDhE0wSCb1KztX/KjV3oyFHODK8LWvHN1os8uKL500+9GP3jeOwTjTIG
         6S/dHgfT8YSMDnBOh1ki8bXS/GGW80vKhJZGO2/k89xMeP6CVZhK27N5O3sr0ofihx1z
         hwMo0vj9u1HZ4+skz/8OpRX7Hc1glPxWIp9LKjJ6WIkMCD2q7C7YTKnV6WD7hJlZ+siL
         7hP/kYbRFO9CF2TS6rnLjrWTML3tsfJolV5/qSYF4yJr1UirpbqPt1Uw7ZiZtxMes4vb
         7CGg==
X-Forwarded-Encrypted: i=1; AHgh+Rrw9T7iAE2SyqGfOVqd6jyuQwDKwAOqddrqlw/cyDyz5m6UP3zMm9GCuDvVH27naHJgLOgADnc8og==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2PFZHTKkPV1G4ZEVM3lbRmJ1llw58S3JQ87WiJzTPcIIp70e5
	RPbUEQomm5X0b2WO9CJytQsSpbUzOgx9gFeGHYg/vTk1kMG4Lnm/bxeP/ZSPQAdsIxsBVL/rqLl
	sjdkPuswGGgHtne0WQvwD4kBcSnTP/H0BFao2K9DINsYIzmPOSG8HG2HGGektZw==
X-Gm-Gg: AR+sD1116meNX1mOu5TJwoNyir637ruQ87D+QoyIeH/oLQmHWBUcage8U8WcGrUQqZW
	/o1dCOKuntikgMJu04mF9rHu7+ek1hpG6yUYcjwvYfAMcSzDGk+u/oSqhZxsHfyuQAQyJBsmkIT
	E6neux8aaJzQJMUZJIJBlH07Rm1xj5uk7cSoB6E82JZsmE3XVW5z88WETNuHwaQ7spMpEczVDYv
	PUsISzE+JoW2m09w8zCg7+WsJRTE9mhkDCgYCjFXtSFhhbG9wk90+4dzB/PAe4EjLEUftOY758o
	qOO78N0Y10yZ0lo+xvPUOJsQBb2i4Una3BTBLzbtucDyle8Dfbak3kXwSPiT+W1WjLlJXlW8/bk
	FYx7UA86Tuy5OYIyBxpXHI1cRC6xLvpuI5A==
X-Received: by 2002:a17:90b:3948:b0:383:f52b:d616 with SMTP id 98e67ed59e1d1-393014fa36emr3195025a91.10.1786520204568;
        Wed, 12 Aug 2026 00:36:44 -0700 (PDT)
X-Received: by 2002:a17:90b:3948:b0:383:f52b:d616 with SMTP id 98e67ed59e1d1-393014fa36emr3194989a91.10.1786520204012;
        Wed, 12 Aug 2026 00:36:44 -0700 (PDT)
Received: from [10.217.219.92] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f9675e32sm829428a91.0.2026.08.12.00.36.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 00:36:43 -0700 (PDT)
Message-ID: <2c036793-23b3-48d4-834f-9daf8000b2d5@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 13:06:36 +0530
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] soc: qcom: geni-se: Populate clk_perf_tbl with SE
 source clock frequencies from perf OPP table
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
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-2-61171ab1cdce@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-2-61171ab1cdce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA2MCBTYWx0ZWRfXzNPILM8tYnlk
 8431juPkWv2YycfGdl2jTVbHr7rLBrIhJZ5Lbl7I02NqqYDtMn0Dplk00mORe3VF4RmWm4qyB+n
 83suKYgC5eOkfUq8iEU1knST2oHjW6E=
X-Proofpoint-GUID: MjYQ6nZaBmHgI6sARyFQ9pO13rZXjFaD
X-Authority-Analysis: v=2.4 cv=fpDsol4f c=1 sm=1 tr=0 ts=6a7c228d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ddSnBWzqd8mu_d83chYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: MjYQ6nZaBmHgI6sARyFQ9pO13rZXjFaD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA2MCBTYWx0ZWRfX+TMfyOS4/eb+
 DBW7FG+AvEmi30qlkArhTPSMdxGbWmgOEPTR7S6VFdYbw0xWK+8r+QHY//93ShMb505f8zO1jhf
 tU6ooq6w61QPPqw4wgKIU0gEI1qqF/h2i+8mkRyB8G2zpx9iy2O5w/zWXfqB9ND0ywJ26rfWr98
 uiUuv9vsGAMhCxS957xfwwNFtq01FZrHHw/Pui5Z3nCpILJ+KulkhzTVZ8HRsyQtj/GSUjuzUbS
 2gVuMQEqNTRb5rXb3K/XFDRUrvj7JqU/1xzyKPQAfSVcqMperlxnFhCWOiPntDt0Cu97zzgwkE/
 HRzR+sgsFUVcgQsSHm8oqj71omAxN7ZtXe98ehwkdpkY9CH6xVU+gXKJtx1G0RlTuJLeEEb76V7
 2koizf9UaRWUIDGN59DhXBETDwkkm2lSjvhmlHg+qK021liJlyKSY2aYiLyGJg5DiB/fb8e8VPx
 M3E45hPZXG8/CrK080g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120060



On 8/5/2026 1:27 AM, Praveen Talari wrote:
> Currently, on the SA8255P platform, protocol drivers attached via
> geni_se_domain_attach() treat each OPP on the perf domain as directly
> corresponding to a protocol value such as a baudrate or requested
> frequency, and simply request that OPP via
> geni_se_set_perf_level()/geni_se_set_perf_opp(). This does not allow
> computing a source clock and divider combination for a protocol
> requested frequency, unlike the Linux clock managed path which derives
> this from se->clk_perf_tbl via geni_se_clk_freq_match(), and then
> applies the matched source clock frequency with dev_pm_opp_set_rate().
> 
> Change this by treating the OPP table exposed on the perf domain
> device as representing the actual SE HW supported source clock
> frequencies, the same role clk_perf_tbl plays for the Linux clock
> managed path. Populate se->clk_perf_tbl and se->num_clk_levels by
> iterating over this OPP table in geni_se_domain_attach(), so that
> protocol drivers on the firmware managed (SA8255P) path can also use
> geni_se_clk_freq_match() to pick the closest supported source clock
> frequency and calculate the required divider, and apply it with
> dev_pm_opp_set_rate() the same way as it is done for the Linux clock
> managed path, instead of relying on a direct frequency/baudrate-to-
> perf-level mapping.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
