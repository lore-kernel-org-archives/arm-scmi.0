Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792671746;
	b=BC4UHd+NMJvhvBLQHx/IFB5FsFVF6fEj2XvjN1LG4/C+y1bApMUe4HFulmlKE9kS1cBt
	 JGzGMI2ny5CzAIhMHtnQ+LPZ6JCTqMh9sCeH1EYbrRdP5c0sZr1MiLWeblS5v982dqoMN
	 YW63Gf06/qogYBUISJhAH9YMpzZb58GSXWte6Fwf3dmNaprVIae9g56T60/2i5MWrjkab
	 Yy5oU4RX66pKTtl/CKIiHnLDUIS0C4vTSpjkkrAnTtYauj2mf9jvYFxq4bL1tP5SVJoGm
	 UDXV49fF9VpAk6MG0DQtHuEey8UqR66PCH41BzVI9FjfZfxrnsZoiRmRkMInqtjO3TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792671746;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jMMBwaLsIajhBzJwHlXR4BwgAy9WFdwK3Pip2rL08qc=;
	b=SaitHWgcBK8a6rvRk0hEKe3BacewIh0PJFJQMpzPkzPp0WGORgZCvimqg92CjMLUdWOb
	 BxeV8KdZl/ZOcMEAVc6xGlAhEI048VYN/6fWXHMkwBo6DiAcrccLmVvhAdYugAq0hnkee
	 uRFYF8j+iJba8QEBDriGW7x66mF7ik380f2Ht6h3WWgWBHwFcVyUENOXhNv93335XS/7q
	 5xtpXe2DSiMw15s2qCVYCkh6Zl+4wL+Y8+ohPm5vr9V8u4LaoZT0RgajZFPHcSIjFwRcS
	 HrEPgCeyBj5yc+oNzDoENiv0IiMbLuhITXs7svs4/xFwIrB8EP74a/2tO3Md7gKLtxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b7FjuHri;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C6zvZYVD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94573606A320
	for <arm-scmi@vger.kernel.org>; Thu, 22 Oct 2026 12:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94573606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b7FjuHri;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C6zvZYVD
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xpqT346108
	for <arm-scmi@vger.kernel.org>; Thu, 22 Oct 2026 12:22:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jMMBwaLsIajhBzJwHlXR4BwgAy9WFdwK3Pip2rL08qc=; b=b7FjuHriWyJcQF6b
	oVxgz8d4XnoXFI7faQANh+GAqlf1hwx2KqrTuYLjyW5FpjEwS2L/kimmAc3pa4AB
	CT4m7ayULxWWZG3q3wZbrPIeLAHicmVkjguUeG7SFxAspd6FWvaKxbVB3HurC8OK
	fcUz/yF/RvrJD4lPFSo6JhfOzG2b4VNvQPZIQxfZkBQgvZJephazPUFFGQ73TqiJ
	R5iVVRCTGKIlJJQdCgbkZ6MEHpNZ0Go3fRbWPJuCci5ZvlhXGO52remI9hyptRID
	m9aiYahu2KCq3Fmjs91IJukRzfggloF1DzztroxWsu6nIhC08nEbKX1fDlEAVsCH
	olWzmg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93db4n6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Thu, 22 Oct 2026 12:22:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e94f72fb9fso16273875ad.1
        for <arm-scmi@vger.kernel.org>; Thu, 22 Oct 2026 05:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792671744; x=1793276544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jMMBwaLsIajhBzJwHlXR4BwgAy9WFdwK3Pip2rL08qc=;
        b=C6zvZYVDvsQzlkSCBnbfBSEinTQ5aqEOrZNT674hCUTK3Z05R+AH6DP0WTc4lrKLzq
         +pHyQwZQfA89UHm81BY5XebO+yKhsStKDNo/bb/r5ijlIw08rB48z7jdfSphizItJbq6
         f+H3UlJilQPQOOB4erv+ZTLSQCR5y3vZw7ipABz59FsDCLTHvPj8c+5v8jl/hTBVBbow
         Yy724azzBS6hhZ09zZa6IW0tE2c72VLgTx89YOy4SEyBu4Faoz692cMJMWFMC08uJdZt
         TP9FEUjo7ZFUeowAtZmVF3OFihn7b+/hpHpgojpxauF2sHALP64B2pKOLNPSZe+NLo7e
         +n1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792671744; x=1793276544;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jMMBwaLsIajhBzJwHlXR4BwgAy9WFdwK3Pip2rL08qc=;
        b=Gbm3WvQtf5PKECx6goCmu4H1yiEb3CtDGQa313k0H22f5osfogcJRaEQfYGRfw0Y2E
         y4QSP0dEn1gINVYb5MBullHOMNCD3bQlupoUjyL/aRlK9gdGSvcGwNiikuyZ/Xlzo0ap
         2cDIJx7mtrgR765UU47+FUjN4CeCXZvjdqXk2NS9CWpl9QW3JPD+M7TlnMuVYWqynXgQ
         /5DNNFygP4Bt5hst9PC3+3YsavZyb+Ezwl3+swLXL37E5DNmSn7lZpjj4NvO0hlJeUl4
         vLlOV+RLZpwsZaqmyZhAT+Dw7Km0F+/cO/ZjQO5u/xiUlx3tW7we8TcPInrIc2xTtgDr
         wtmQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/oPvgJxeCRVHX3ZUlQ8qI78VQS/cyd9cBzAIpSddj84GMoqA5JPy3nm6cLfuTXVyvIfqFNj6LxQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKZYlqNFL6mgNhpDYr3pGxwPbfC6GEZlPg3cIYxev7L2/w1FUvm
	RVkvja50ISeDmeUUWJulNQfHP82ThC86y+RkoQWRumUxiqWyesEPjd8TK0CQEALyL7dPXrOKrno
	wWnJ0ZoV08dQkTjvc/IU6aI4XxkJ9ZyLPkuL17wGnNdA1paX+PxFHkfDw4VYTqg==
X-Gm-Gg: AYBFou3ZfR4H+44+R4plljmEiWcTB+E41zc3CrRZJ0MMKLb/+0NElf+JXnaWWdGaIM5
	my3V0i6Wwd7JKgQnQueU61SsJUzjye2kbXx6roFIVsq6RD3HcFNcrlxg9M8zSb2DCfnzUvIUxhF
	+gO7N9wmEYSpjpcxHutgoFX36FRFKdVARP+FUkwONvKg3jT5qJHoZO2YS3bgO8rREzeyubsR/Ph
	a7Uccz41Vkjg+Dn0V+J6Kkr2eQmw0LreJ3YAb3eyRlJA65d1d7jxIySbIfMAlABKxTJtrcTZk8r
	C2dsxLV/Oimp/k69AYuLqMybGbPyjYpN8VYTsThllm6CP0ipuFfgPK5cNoK2xcx8bushtJ5niYX
	cnNAzg45Y1WuMv5HP1z0odk/uQbQpLeiArw==
X-Received: by 2002:a17:902:e844:b0:2e9:514b:7a73 with SMTP id d9443c01a7336-2ea43fa9f19mr45591825ad.48.1792671744020;
        Thu, 22 Oct 2026 05:22:24 -0700 (PDT)
X-Received: by 2002:a17:902:e844:b0:2e9:514b:7a73 with SMTP id d9443c01a7336-2ea43fa9f19mr45591515ad.48.1792671743527;
        Thu, 22 Oct 2026 05:22:23 -0700 (PDT)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b412756sm23642595ad.24.2026.10.22.05.22.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 05:22:22 -0700 (PDT)
Message-ID: <5dfd7245-c2c0-4468-95ed-6bb8a385da98@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 17:52:15 +0530
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] soc: qcom: geni-se: Populate clk_perf_tbl with SE
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
References: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-0-5da1096243c9@oss.qualcomm.com>
 <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-1-5da1096243c9@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-1-5da1096243c9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0OSBTYWx0ZWRfXzz5q3pW6NY5w
 QSxOKy/nz1DsORfCbWMOqiCNrTwXEcOSU7PXPZtELiAc22xtUYf2mYyFudIGObZ5x7exjFG8klo
 2ChJQOlM9KxheiSCJmh5oSrdhXYmgGA=
X-Proofpoint-ORIG-GUID: yz6yzQ3vKZbxz9UtS2xit7X_uICXGWmG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0OSBTYWx0ZWRfXy8gDTzODi0rc
 12gka6IeEYx0i3rNZl44fz+qezu7wa60Q71i0mlF0omhhbQoIVT/KnBTYIBkLDlMZbg+RYkbb6d
 ehx+DpSpfDjQ/NBHhJnrmD2HEHAMn+vfk+gasyqt72wqNzVna11m+4xHc/d5arjw4G7c4pELDb6
 pqQmQ6aOuvWwCgPFs3tR9CmFm+iwLBAPBrf18oF1PmPoHHq+Bd42Vi8stItVvONtUkpS0vrYaIf
 1OE+1ykyRxr0W22AXG3dDrTWVtkB7q47TRVkfulLBqj8L262dxRsCafO+D47/m9sgstL1dz7QGy
 +nF0ecq4aS8dGnLaawCXK/qeyGVB827TF16AJetQYaS1zIO25ZDq1G9qie3hHhnPjIRIvvT6qhk
 RaCqe7oQaSAwNG2APhCiWslaDNlo3kChyL1FXT/TwdX0JuNSCwxss2L8rDgz2WheZX2PgV8zb3F
 i5Z0WiUPnzh/wmL+brg==
X-Proofpoint-GUID: yz6yzQ3vKZbxz9UtS2xit7X_uICXGWmG
X-Authority-Analysis: v=2.4 cv=TIPQ2Fla c=1 sm=1 tr=0 ts=6ada0000 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ddSnBWzqd8mu_d83chYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220049



On 10/15/2026 6:28 PM, Praveen Talari wrote:
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

Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
