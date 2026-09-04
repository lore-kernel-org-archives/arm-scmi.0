Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73658395ADD
	for <arm-scmi@vger.kernel.org>; Fri,  4 Sep 2026 08:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511793; cv=none; b=hNigSfR6JkpEWrIFSjfN5Eln7RGXFs1+gsgXK7r8byujk/dviZGFVuuzFsCsFrbK6S0y/jcAX9HzwjfEJIswPCtg7zECCYua8+9nEM48kTsamCUwj+iwMjPku2/t5OPyFZlTUh74QfucrlvXZGpvuYClgBmAWsINi9++6wZpdQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511793; c=relaxed/simple;
	bh=i5WV/wG5Dqysz3kgPy8ahQVJUTCnfA7qqWTM0oCKVDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k1pmQTNgOnUmhlSqpDlwZuDpr3q8eoqnJH0cUGkRTd6JK05xliaGHqQ8GzB05MPQKzjLhmSTnyd2Xt+ipa0NSwFbLKauwSv5lGLLGh+tt8e75Lks/Ml4sIRsm3eIzRP++FXOdQeprNu+qlH6mzLlExgmJBO3UF26BCT623EmgL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L3rY66/Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iw7AwMoR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L3rY66/Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iw7AwMoR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847mgIN3234583
	for <arm-scmi@vger.kernel.org>; Fri, 4 Sep 2026 08:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j18BJPt/DvGT7g3N2UqsrZWAWZ06VMwJihvlhh2lFbc=; b=L3rY66/ZPsUMtp1m
	yZ5+t8eehR1pILzku+yzJTRv9c8fPHtBIRhJAtktnQcepeykDJVJPP9dFR2egT22
	WMOXcRbe7Va+vtP5a2Tw5XvojiVIYPLjk+2ee/Q+6MSvITBw/WKAjdD3LvXvVF26
	LHt+lhPazQ0+TsN/VttyPFw27t8eLdEf22Tlki6wwUyZl3ujIeNXuPW7NsMR+17k
	RBztDGxY7tL+s/J3A3kCF348jxqh5vXyDwFaa4WQ+fHJXk80JFxJ/g66dtXvCviO
	mvoG7dfdtvdRnFPa8nMAyyN5Din8JuJqzFYNdbhOwTPy2doKvYdhxWwtaGTwxuOy
	WGtymA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp0r0xyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Fri, 04 Sep 2026 08:49:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9349ba88188so11643285a.2
        for <arm-scmi@vger.kernel.org>; Fri, 04 Sep 2026 01:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788511789; x=1789116589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j18BJPt/DvGT7g3N2UqsrZWAWZ06VMwJihvlhh2lFbc=;
        b=iw7AwMoREmB5f8MnuFC+NbL8r5xprSYF7cqYWPzErCnK1Wnj9/t3CYpi7UjIJrgBzb
         ahMU7iGrtWUvWx1AE0RHEr1/4n9KzQSSklDlIOyFG3mtRGfSf/axkuxpiawxfB6U62r6
         xQgF+ymMnfGMLjw2s4wWHkTvw7B31dvrhsFDyhAAbdvEV8RRUjCZSr7GuduMSQwfus7w
         nH6pieYFmyljezx8ELFtkFNnLBIMhCY94sjUBbkxCnVCU6bZsrooF3WgnY7W84SmlMni
         ATkzGy72mOilY7+6RTp4Ay/lrfZYl49b5EA0f3z/IpnUJ1Rcv0hc62GvpjeueA1xZg8V
         D4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511789; x=1789116589;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j18BJPt/DvGT7g3N2UqsrZWAWZ06VMwJihvlhh2lFbc=;
        b=p6xbq1U4FJyQagNyayCLiBB1jwX7E35Z8s/cNEwRtOJKOeGehYhogJkze7RNjErAkx
         baVNj0fRPa1ITP3HA/han3p4dkvL4yJ17S37MCEKtjfxsk2cvw8apzFtgsc/+IroyV5B
         YRdVeXdTUXTrOMqiEH5EMGMXfYJnf/8db0UsbuGAqN6EbNbHow0fRBZl9ztxviKFVgkv
         sbsDw5pw7cS5sZZzE86aJpClYasq57ZQ0AuI9X1gvQsZsjDeIdBrLXC2c2f1pitD26ms
         YLRoN7ufPklIa1MRP4igD9lLp5WwfXyBzxTITxjMP1hLFX2Gye2eD/SC3N22g9Kay9Po
         1TYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlj3D9U/8Whd8oIyMtCtS/z347WszX1hDHVNhx3EHLgUtJoMwvmDzPIOQWHQQ7rfW/x7lJ+BuZig==@vger.kernel.org
X-Gm-Message-State: AFuF++nBxF+j0M98FjgEuKjHZVWHnNyz1VqQpZmBUJ7OLgX42qcR2eVH
	97sSdgBaQQJVGDzcFr0StZT+KM3Z6n8njnFJSOhYQmUNZjitNxzXolGAGb8c1yKCcNMsUtWbzEx
	T07bV0pCjwilP23Kth4O/FNiVa88eD01A8EAlVMmw7JekKaSV25WXlR0nDaMD5g==
X-Gm-Gg: AYBFou0lCz5V1sSMUd2C0BkVKRE8Wl2WE+cEi3F7OQCMi1ah+rRhK1x94ApV270WVlO
	WFZhiGuovewUMIEGXlZZEyKQWhPCo2avIKffofjNa3YRNLWB1RJh91e6ZEinlZZZTR4FSBj1cmG
	ijJnniqo28pZJFtS0qZ+nnTmvqbNNrsh/RBHGfuwlaxgSiUOPjlshFpTlKm5U3eCCqlyC3kOWro
	zfsPWUWSqyLn9CHspKBETbxx6DdYzr5t25OADlddEQ/mEl4nC7nwnKI4MslUDcMJLnDfkwfAQxq
	Ih4EMAThVDIWUQuqJxOyF9GmXbmQM9puGJby73V8yyaA8GXikv3NRu7Aht2e3+WEKJyaar1B7oH
	GZXQKlgDxQ48Bg9cSWBBYZw==
X-Received: by 2002:a05:620a:172b:b0:939:85aa:dfdb with SMTP id af79cd13be357-93985aae0c5mr146195485a.6.1788511789685;
        Fri, 04 Sep 2026 01:49:49 -0700 (PDT)
X-Received: by 2002:a05:620a:172b:b0:939:85aa:dfdb with SMTP id af79cd13be357-93985aae0c5mr146194685a.6.1788511789302;
        Fri, 04 Sep 2026 01:49:49 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68a6a1dsm867795a12.7.2026.09.04.01.49.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 01:49:47 -0700 (PDT)
Message-ID: <813aae42-22bf-4029-8f04-54fc555a2a1c@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 10:49:44 +0200
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] soc: qcom: geni-se: Remove OPP rate reset from
 resource deactivation
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
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-4-091697dbeb02@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-4-091697dbeb02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4MCBTYWx0ZWRfXyO/3xy4OxjR9
 O1r9fALUoHRMhmJIzhRmr1Ov+tNZLZTkn0rL4r3NF4D3cqmiLxlufpqNQARdO9t++Nv1qfmQYNp
 QP/2I5DQUhHpYtp1evNyHJ7zhxr83M0=
X-Proofpoint-ORIG-GUID: 9scx62jJxb0c_isZZlyHQsOUmv17ObmZ
X-Proofpoint-GUID: 9scx62jJxb0c_isZZlyHQsOUmv17ObmZ
X-Authority-Analysis: v=2.4 cv=T/S8ifKQ c=1 sm=1 tr=0 ts=6a9a862e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=9QLVM3U_lBk_t3napV8A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4MCBTYWx0ZWRfX5taiWy5+ZUm8
 N6Lw3aeLwF61cyc3IfbHRrXxjaxIVuNTl8mDKOH/TAGiACdqUZyt0x7WHyWMIF8j8NjEXzNZf8I
 fuF4sc4scV8fPLjmSbGDL3B5haqa2aGTf0Y+EuMc2LPYim8Ihog6OSGDfihBEZzCY8AG2kZsNOI
 uaT9Hgxhw+P4KLL6Hx/BIJmZ32sE/1KlwPKd+9NbbeJj8Xdo9+bn2ws1Fs2ye0r1195K4Wh8zub
 ne71xNxlp3wBh2KlGC50Y2qd3EIZLjfq84PWOctiq3Xk6WiPYeYL7TftVVzm5qcoW8s6eu1yOQf
 roPhTOTmlm8faKbm0dmQhUslqdM36+1ZiZ1YwB6JmlKXs6H09XaiUcUxo/U6uT/m4y1SQhqu4Zq
 9TK4nzEVBlynyqVzmIa12CSLskzxLm3/AB6HgbtHUJjRZfMxPxeoxye9O+ASigRQFW3fNcZJ+kF
 VM29n2abhlo1xtHMBoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040080

On 8/27/26 7:59 PM, Praveen Talari wrote:
> Remove the dev_pm_opp_set_rate(se->dev, 0) call from
> geni_se_resources_deactivate().
> 
> OPP resource management should be controlled by the consumer driver.

I believe the opposite was the original intent behind creating
these helpers..

> Additionally, clocks are already disabled by geni_se_clks_off(), making
> the OPP rate reset unnecessary during resource deactivation.

That is, on the other hand, a valid reason

Konrad
