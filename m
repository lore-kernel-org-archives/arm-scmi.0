Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567A1352F86
	for <arm-scmi@vger.kernel.org>; Wed, 12 Aug 2026 07:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786519492; cv=none; b=B9RK6PIjNWVi5FCeJT+ZUHZBdtfGhsWkQvcMwqBfXsvw6Z9djkhI2SfLM8SMVkGZXBwbw732cet5RRQ9RThzBOVX/Y2TqyJUdAK6mIZf+6qG2Sj+rMit176/HvQuTmQRUAgNhN/VsH6/3iAOOw14Q8YG+ZeZKvtJ1OrnGA5c6DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786519492; c=relaxed/simple;
	bh=idEgIKuwLufALjp/jBV+Ut+lHDpRAhTiRSvAWJe3BF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PNJZpHK8WcYCzjitCDPQ/ALBn5BDVmhDmpxxj4lAr2MmZi1aKAs/PY0B7h3Rh6+SwLFcUSmhAuuqA5u0SI3OQIaDrRI3o7HRaibD4I+4F5t7wihnn0NFTQhH9P8TVAQNEB4yuLtEX8l2Z2Y8jYRp94+r6vZFgtWoTiskeOcZO2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zm+rjJtA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UQeO8ynG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zm+rjJtA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UQeO8ynG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C62b1R2190393
	for <arm-scmi@vger.kernel.org>; Wed, 12 Aug 2026 07:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j8zmE4Z0t67Uc/IxjelkCGk5duWoHHbuKL7WpxEI2yY=; b=Zm+rjJtAIhhcVVmq
	JDFGgDHRb4vGNP0a3JP6Bkam278h3H4CuLU/ueuWx94zrh+FIQwq4a9AkdnaiGei
	RpZh9f8IMHxtsHa2o968rt4MLpIrUn2oufEH7/LFDsl48yVS6dDwYyT0s7tI8AqY
	A9uHYU0yc+BADE8Xluuv5PbuQyfsJm+vFwMVw8ZujWwUldlsUeVDmk13qWxnPUqm
	QUnLr0QdYLIfinuax6pszF6kZTtozeassr6PvRvCwrrT18Y6AxGnFK6whzABp3E1
	rkwV+TJ2KWan2wv0aEQdJSUqzlc/w37QkaA6DgRPXHzqM7a8tfhkek+3OBkvP7OS
	zIs9OQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049g41bx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 12 Aug 2026 07:24:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so12752085ad.3
        for <arm-scmi@vger.kernel.org>; Wed, 12 Aug 2026 00:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786519490; x=1787124290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j8zmE4Z0t67Uc/IxjelkCGk5duWoHHbuKL7WpxEI2yY=;
        b=UQeO8ynGeX4EQtAhzgsoXL4ypXKcAAmepTP5+2bbvAUpK/sfYPTCK4XTvo//6bgh8+
         3UMhSwV1PezGWGBuMV0N8YulgbbvZstm9DwljMlb7XcGAzc43Uy7UYpIkawVPruSeZ3q
         kNig8kasg8PHO3y2vs1kNH3bs5B43zQmJNEKXo/6U/pqO0xfSNb/b0PqhD0J8+juaeTf
         kMCr0rlr4DPUun43AcJv1mgl9BAx8aC55KmIxt0s3vdonNVPIc/d2zqysXNJ3bgbhdZl
         nnGZYNZotjSJA4vAIlc3m78G6Idn8KmhhzhYHfKZpScYZHPQKf8z7/Q45JU1epmDh3yQ
         rNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786519490; x=1787124290;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j8zmE4Z0t67Uc/IxjelkCGk5duWoHHbuKL7WpxEI2yY=;
        b=b5Dzm4pOHXhb3MzHTRU/HMAS1ZzZmbOILU4d2uEs8d9Y70T1SkGf5MUmOuxcP7ifyT
         P7CA8PLgCRg7jvwwrsj3Awq/CGlVHQXliYqT0dBPZUSvb4TkFlpbbNZkspM1XfWvchaX
         4jZbOT9b6iSGYxRrh+JrYm9KF8ZhO0jzkoFxvRqTT5qFcqFgZccxnUebhE/1lagL7laA
         JsHK5p/22nfoi2euMhOUaB62Hr8JPIP3+MVlL3mUeL3jbrmqR/FiYx30qZm9gZYRtX7o
         +9L/CzktgenhhVBM3Xt9LxiZpm5qr4RcSkC8fBCf7g0RbFWXSi3w+ab7GfDo3fLUQr9V
         1pPg==
X-Forwarded-Encrypted: i=1; AHgh+RpYPC8eYlqBoEobjfC7Bm6zHUtfez/45uBL7daMdX6df2XL6/Gnn1NjwUhTtK/RuXSP67bNqZrG9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YymynbE/uYbK37VhI3kue9r4FV4XFtxfJ+B1zz6GNWs1e9KDA3s
	Ffg36g5PDdILqNhjlYqma5kQ1kklSicw2uEjWcPZ+p0E38125y8DLxEem8jKaks9Dqx+ha/XC3r
	KVGkBFo2n8r3YQ6jaMedIJRTCm2el6NaB4bIJrDAurlTroJuu8qLy6gIrQCTR4g==
X-Gm-Gg: AR+sD10mwNqghhwmeSnOOL38tSuFl1gxzlOmX22x51vBkHwvYSgPkZXumWo9uiX3Vfw
	g/MdhMcPe7KBesCtAVssffD7l50G7sfZQRafo+3KqmghyBPyRZkJve9TWxdr9VllszyF+Jncjm/
	aot4ebaIhIXvFDJe/lJZFDqs2R+L36WEizb4TG5ue3YoZeFLyjp1Y6apn5sEGcKd02d7+XgJz4y
	vUaIMedm+Ju/pTqJyiNYp40wKpa9tvB0iaWOg1s3kMAirNTCaslpmjaXBv7tcpCuLrN+YPeN1zN
	NqPK2/biIxoh/tQZJi8ARilBMh3gNxUQgXNFrV+vOuPkIm7tlJ2txyWJKBdwpfigQiMrhXowze7
	c+toF9Xx2DHd8F/jpTm0TgeUOBywxDm11XA==
X-Received: by 2002:a17:902:cf0f:b0:2ca:e565:7b15 with SMTP id d9443c01a7336-2d3453cce11mr40084125ad.10.1786519489976;
        Wed, 12 Aug 2026 00:24:49 -0700 (PDT)
X-Received: by 2002:a17:902:cf0f:b0:2ca:e565:7b15 with SMTP id d9443c01a7336-2d3453cce11mr40083855ad.10.1786519489524;
        Wed, 12 Aug 2026 00:24:49 -0700 (PDT)
Received: from [10.217.219.92] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d351145d87sm2545055ad.23.2026.08.12.00.24.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 00:24:49 -0700 (PDT)
Message-ID: <d5d64ea3-9c6f-41f5-adc4-9923381d732b@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 12:54:41 +0530
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] pmdomain: arm: Fix -EINVAL from
 scmi_pd_set_perf_state() on state 0
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
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-1-61171ab1cdce@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-1-61171ab1cdce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ObEHyFhHXi2CoXqPn507TZNNbk6VNOb2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA1NyBTYWx0ZWRfX00ri7bDb3Sme
 gSiYpVfFmWqWqYhPZlmKpNHMgjwW8Qvoi9qpXUhrP8aNehraokQUQEODiN7xq3v/P1oLCox0pap
 RwDp06PRgCv19XGFLj0S/4lFSrZvqU8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA1NyBTYWx0ZWRfX8g4oi3L8GTeK
 V/QA+F9pTC9akUwEyxVhUx2EAylk5f9g9p+iQHgCQRxPYHegjSI0BfFwDwM9Lt6VThxCpyle2n6
 A5sJXr8E2qHLa7arduoYrCUGVhEpUc1iM+ZCMFzn/ieNkJLKkaJZe4UEHRm6GCq+ieKAMhQvzwX
 NyH3PPVDNmh2c9wEBcZhEH824EqWTqHGNhk32ZbMdITyoYu7MVcOpYBBKN0rvIYROgmkAFIAsgG
 FYI4pxyQj3Yie69/j5aTI2go2fn2B0k0BroYCdCiOn1HOJK5FEotSeIk0jJ5FafeDTtYHTJ+/F8
 vVwv0rLKQo0XNERbKhovY0GI3ioB5Y3BzJjBlh4NovAWZmlWkLjbtIgwR4JsstmLrIdQv9plSB3
 lMmqc7axnvgQcVxd9RVoW0Tpqbs0qjAaXA49v7EOOt21OVBGx326zVafxi2buSz6ajVaRp/AhRU
 gm35N3imTldqoUF3Rpw==
X-Proofpoint-ORIG-GUID: ObEHyFhHXi2CoXqPn507TZNNbk6VNOb2
X-Authority-Analysis: v=2.4 cv=LIRWhpW9 c=1 sm=1 tr=0 ts=6a7c1fc2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=9TDyKcSpi701ZX69LQcA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120057



On 8/5/2026 1:27 AM, Praveen Talari wrote:
[...]

> ---
>   drivers/pmdomain/arm/scmi_perf_domain.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pmdomain/arm/scmi_perf_domain.c b/drivers/pmdomain/arm/scmi_perf_domain.c
> index 3693423459c9..e390f902a444 100644
> --- a/drivers/pmdomain/arm/scmi_perf_domain.c
> +++ b/drivers/pmdomain/arm/scmi_perf_domain.c
> @@ -33,7 +33,7 @@ scmi_pd_set_perf_state(struct generic_pm_domain *genpd, unsigned int state)
>   		return 0;
>   
>   	if (!state)
> -		return -EINVAL;
> +		return 0;

Won't this cause an issue to other drivers ? how are they going to take 
action based on changed return value ?

Remove Acked-by due to this till i give back.
>   
>   	ret = pd->perf_ops->level_set(pd->ph, pd->domain_id, state, false);
>   	if (ret)
> 

