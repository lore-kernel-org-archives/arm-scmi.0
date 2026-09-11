Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3A549B210
	for <arm-scmi@vger.kernel.org>; Fri, 11 Sep 2026 17:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789146812; cv=none; b=Nei+PKHufKpXvlFOu1DJIfBb8cKjD5JDUvvdFPhE5Jz5x9E8TKYj2aU1dczIaFHQk2RSWtdmvOgagEn9V6CJ5xmJuY/9hRHTPYAp+S/uMuap37s3HmgSuH79+2KDQfp0DqCOr7XXHPUr44sq5iYq9mXPWhwchER9KmNPEFn79NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789146812; c=relaxed/simple;
	bh=GIg8Ee17H8uLahuwZG6QIu9IwUSfphXuVEckTgzzbiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nGDWN0oMauvsMe9tbhugQp8HjWtbkIbic8keeIIqkTO8Iw/7QSes5c5/pFkWJkkcmqlcewnxQZZyBtKlKxnorPM9x6jTuRB11YwvOtUSGakk9WFp7vX+9BBpYwZ6MRlHABN4YP/0xGSPY6taxjsru6LRQMqvvBp+59qu5e2jqdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MbMJ043Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WsA2Dq90; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MbMJ043Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WsA2Dq90"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BG430p3426931
	for <arm-scmi@vger.kernel.org>; Fri, 11 Sep 2026 17:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GIg8Ee17H8uLahuwZG6QIu9IwUSfphXuVEckTgzzbiI=; b=MbMJ043Qh3693KxM
	TC8kMQTkju8cjNkcgW0WulTHDisRDeS0zOWD/ntCNBIH//BMVQJLOwmHGnfrnVoQ
	we6dQdxk2dewXcF7hvbcGVMtcQyzu+7IrU7yfFFkhxWA0BLxT4RBARs93uNpWFfh
	psCq4Ciz7SXlC4Kr+yxAixZvt0u1AIbftjDKa5DNH2SU98Rg4Fie+fSyEIOIJZgb
	3nxRV46XfAERrERiZVDNEDd0G8cygfq6HCYuON8opaV5PrqvXD4d+sykhXziHZBG
	WqdZ3HZvPs5sCRC5KNok3cCunb/JVu5nUgZpOTrxivUvVl9vyeWKEIWYdqtnIIae
	RJeFIw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmmubr9dr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Fri, 11 Sep 2026 17:13:29 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-86a43fc3527so2067680b3a.1
        for <arm-scmi@vger.kernel.org>; Fri, 11 Sep 2026 10:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789146809; x=1789751609; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GIg8Ee17H8uLahuwZG6QIu9IwUSfphXuVEckTgzzbiI=;
        b=WsA2Dq90HLFrqu66j4Q2H6a9nD7NPsx+o4m/8mN5hvJF932Mh0pc4kw7wVoXFniFOt
         vS7s6OCUoeDtCg6/7KSUksEAu1dv9RBcs3uxL/UvPdhQDHs55lEM7Knczd6u5byiHH/V
         VSqF1SVZqhAsoytWU4IuBMwWcnzWAlcGpZAEjIa3QFKL9J9zkWPSd5svchIO3XVqG7Ad
         Eg0FWIs170vg8WNUqu+BOLPaF2w4PzDqBi8zyYny9OqZJY6bhwA9RMQAJd/KKZC4VIOg
         diHrn40i7XV7gib/bdayQI9IFyKjMquJ66HaEgtIqBTv7qzFz4cZa8+sbY9aEB1eoShh
         EhBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789146809; x=1789751609;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GIg8Ee17H8uLahuwZG6QIu9IwUSfphXuVEckTgzzbiI=;
        b=BuQI8/xotAv5SHYpKiQvF5Lfw37HP4E2Z27b4ZsvAf5pJwtuG/QvaVYplVoII1ml3S
         HTvCjhE4L207gLypfU7LXCDjDRsmtowE/hvbTZFBtq0lC2B2qBfIgbsv9KBUzbgWHXLZ
         gvjjecUMSHjLBahKelizWvtnfA6XMz9QMXiuTOf0X/62U4wKhAmlxI4PEDG44OwzV7JF
         kFiQfYqpYCfHqKElg2yowXVkUD95lysiej3Z2+Jkglc24wwW6BvquR3UQTr7L8n9OlJa
         kAy6BouKErEkFKCWHkiODXamU+EgsowfT+8qjG6GOih034CZOC36+EK0ztIk1QkyvqUh
         05zA==
X-Forwarded-Encrypted: i=1; AKwUvBwVyt2HK8xbhLeU6Kl3pkGs14hJ4uAwlXsp8j9a/AUfGTHpYUhkGSXRSYe49T8Or1LSIV0Ghh1zWQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kBpbEskXsIPOEz3RCthJZfkluK5s/DJzFWuWYJnATzjVC0qDhN
	+F+14/En43mTDAn3gcMY8gCyw7o0zQZxa8j/2x4addbvUKn8/xRkk77eNwSmmGRrFfrnJWnunAz
	TWW7a0MTPxAJqslnSwPLIIZ+BHW9LHlcmgUdsHSHLxPZhth0WYUOx+u+Ncn4kow==
X-Gm-Gg: AYBFou0f4W20utmRfPbDRdzi2qY+WJVicY6p9c2hHlXwFw9O14t4wNRlCTUlCJe8v3q
	0M+m6/WWVnos3v3xw9RiLZqmGeuVBRA1V9CMt9sxf8d2Wq8ewdPjZDRKY8YHMWhLhxlqQrDzKZq
	igmAxul32IQ55wVpKX7phW7xcUglIxYui/8fuJs9xa90ARoiGDOWBXrd6RZgAeaG6T5hJEexLp2
	6zD5BlwZjjWepCejNvoIwofbROF2QzQk3INHuV2dS/3Jy/vu7B7wG27IOXEkRK6YPtJ9oqYgBl/
	UC9fdTAF7cERqdtDNrgLhSIDqI+qQvfVQOdLhL/FVrdrXpW8tnZq/TWEYV01BFX2LFnCFPA2zLH
	S4hYk2Zb0sotT9OziH1bN6QqzPcnej81g
X-Received: by 2002:a05:6a00:1786:b0:84e:354:422b with SMTP id d2e1a72fcca58-86b6f55356fmr3892839b3a.2.1789146809326;
        Fri, 11 Sep 2026 10:13:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:1786:b0:84e:354:422b with SMTP id d2e1a72fcca58-86b6f55356fmr3892808b3a.2.1789146808816;
        Fri, 11 Sep 2026 10:13:28 -0700 (PDT)
Received: from [192.168.0.6] ([49.204.105.169])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b291c1601sm1492832b3a.31.2026.09.11.10.13.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 10:13:28 -0700 (PDT)
Message-ID: <e43b8af4-011d-4896-b488-1a9c790718b6@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 22:43:20 +0530
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] soc: qcom: geni-se: Remove OPP rate reset from
 resource deactivation
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
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-4-091697dbeb02@oss.qualcomm.com>
 <813aae42-22bf-4029-8f04-54fc555a2a1c@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <813aae42-22bf-4029-8f04-54fc555a2a1c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OuEWfD6cXgDFd6qonfiPMCl-nja-pyxD
X-Proofpoint-ORIG-GUID: OuEWfD6cXgDFd6qonfiPMCl-nja-pyxD
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6aa436ba cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=KFINdI5Z0390/lZYonNNQw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Bcqig9hN0zFNc8VZEzUA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI0MCBTYWx0ZWRfXzNc6Z0CkXfAH
 OzncJENYlKUaCfD5l4rgz7MJ+weh58DlZvEwRUilJIYQxeil7gOujxzCZXRF7oj9QivyrfOAEao
 ZUVWMYf5VKwiodZTzTRywD9aR0kxMz0OHCJDlgN0lzJOpSfnlA9SLwY5AP1GHaxPjR4pHNSYdPW
 WTSgC4/I0RcowFitze6Yxw0tfR3/Xe2uJHrjt25IGDCuQyAdWLloXcRWLjKh2U+BSf2J3o7XcEm
 66mxU0swpx54NoTUqUU2MZCKCSE8niOgs88pbyoNTCBDlJkAckRKJW/RyAkpAKaovS1MpUUwooF
 xciwWY3x8zOzTzAYB5Le/bOziTLzlQOlxYDL+kOTQzpoMFuhLC5ZsGI0bM57wT2tAXxpccisfQz
 BFEZ/p3UB2QscKhS05rap0DF9pO8/ZAGGZFkoV5lOJidNOjeP8FaL34e8JNm5wew3wvneb+jWy9
 nd0PLdvS+a2NGvv7ZVQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI0MCBTYWx0ZWRfX6vF4nBhit72B
 39rzcaaK7Y09m2uYNeY0bI59S/85QolZW6NDfbeT5kVThAMkCB5Ey2R2Fa/QAOYYxSUii8LPMui
 +NC4JyoZwBCKgJ64cv1nxy1Q+xJP1sA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110240

Hi Konrad,

Thank you for review.

On 04-09-2026 14:19, Konrad Dybcio wrote:
> On 8/27/26 7:59 PM, Praveen Talari wrote:
>> Remove the dev_pm_opp_set_rate(se->dev, 0) call from
>> geni_se_resources_deactivate().
>>
>> OPP resource management should be controlled by the consumer driver.
> I believe the opposite was the original intent behind creating
> these helpers..
Previously, resetting the OPP rate to 0 was applicable
only to Linux-managed resource control. With this series,
dev_pm_opp_set_rate() is used for both Linux-managed and
firmware managed resource control.

Therefore, the reset should no longer be performed
unconditionally in geni_se_resources_deactivate().
Instead, the consumer driver can reset the rate when required,
keeping the common resource deactivation path applicable to
both configurations

Thanks,

Praveen Talari

>
>> Additionally, clocks are already disabled by geni_se_clks_off(), making
>> the OPP rate reset unnecessary during resource deactivation.
> That is, on the other hand, a valid reason
>
> Konrad
