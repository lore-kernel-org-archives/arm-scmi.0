Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53813446CE
	for <arm-scmi@vger.kernel.org>; Fri,  4 Sep 2026 09:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512415; cv=none; b=megeTSjezeEPlgh3qfYalYR7Q96Sd72aj+NGgmPX8Es3Rc9TiQ2VcUZmJrNBz9qkVNv60D4vmHRGM33mAqSX381E80RqXO9eoIqMdpydIWXEIJAaMLJQXrAEDgssU1/qgRU3VNk8An2j1BNQycjKbNWJZGqPwyY/Cb0AMtpHpV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512415; c=relaxed/simple;
	bh=TwdMkfkku+7xLhkQkYda0UxtIy+OV/r23+7AedMhDfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xa+/DJbxDEvS0xbvUTFjoaPX7fgqAhTvmGqUzb0U+HWXVvzIm8GiGqF4/JOREd3BLjNzgMPzkYZ1cnFHhkSnN9C5mEdaKRdfB2HbVwEYakESD940lBqNZoktDrXExzGK7BEfOIe2+VPReB6G910q1umr1a62gdXkYxS1r9DWwEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RgwQcusi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WqAIiNG5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RgwQcusi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WqAIiNG5"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847mmCs3234634
	for <arm-scmi@vger.kernel.org>; Fri, 4 Sep 2026 09:00:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hPrFnyRkQ5lya7hdY6VenELDRNtS6j9fb64j+zDHYFs=; b=RgwQcusiD+sBqz0F
	jF2XOTgx2pvLO5qTcCp/KU57VdohSxr1FqohE1cUY2tk70/TPuqmFfLaMLktqg5G
	p4MqrQnqlWaHEFJUah4LmnpDevNJ2eLS/gnd0y1pFcnONHPfRtNjZQIVvRymxVSY
	v4R5GIk+wNf0LXbGizShkEWD5YmrmXmp0Xbd1PHNjPXeDphndDl8Ddm1kU8w8OZB
	/YZ6QQtzCG95q1v9KMPEviI16gYbWaZVyfLdO+kisFMjX9kKo1Ks5eGMfFdUZiSs
	rUPqZPmbNa63fw8kXGxpLCAHsjUTGkR52R5Qo/+UoO25SToQqlmkMr/Y2+Ue1T1w
	ifDMYw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp0r0yv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Fri, 04 Sep 2026 09:00:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9310484c005so12527685a.3
        for <arm-scmi@vger.kernel.org>; Fri, 04 Sep 2026 02:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788512412; x=1789117212; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hPrFnyRkQ5lya7hdY6VenELDRNtS6j9fb64j+zDHYFs=;
        b=WqAIiNG5dHBmO4vHhsOlR0n3WKFia1TV0WBXci8ycyJi2gAJA8Wn2qwkpw9o8WyPie
         IKV+RFqUIemZu+WN5Lyo+ceSEw/ttQN4M+DhH+u0MjVowfFDXhG0eK8Dqxc7htaMhhAh
         Eu4akonf0e/hrK5fDgA5n9LnEiQKUUeQJph3UQzU6wvguywSSFIghIO0zXaF9OQ6NJ/B
         0laJuulNAsbF9pdYHEovw9IpUMgtKZJcXc1pSfkzMzDRTCbZQn+0IXFPiazf4fMHpMFo
         vymWn5VXOOPVkvzWY8YOJCCnkwfNkHFuUh/g75XRC4RLldpmCbxZO7747quVsawmJI+/
         MaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788512412; x=1789117212;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hPrFnyRkQ5lya7hdY6VenELDRNtS6j9fb64j+zDHYFs=;
        b=Gv2UzrP1C/7ld2Ea23YIsQYIVqT6/3jyLBK9jpkVWDviHmgUXlWA27rIycclmvGeEO
         nMomlGIc0hdN/5g4GpvIDMxUv5pvw6gkurZlcv9xTeegOL8J9NXxDYwtOHCjpzPrtKUr
         uPct+8SXxf598MotiWC11gJC6jOeBcIB2qBRwyxU9Alxp+8P584h1350QpDTodwrc5Q/
         vv0X1TKMDGbt+Q9i2AQgGjCGj2btTvTBYT34Zu9kwyHqTBmeS3adf8BbeoB66omsjfC+
         NRYe6qtbc5SWjCRJyKr1q5TrbEQabp3UsTv7AidaMuN8dMS6TvmI4cUPSL8vuDxCMCbC
         zBjQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5ves4ehpdwdng+YK9eDhs5RnkL0uuevRMV0Zn1by/kISx9LpP5slJ7mlYRKcC0pM1K5z41r739Q==@vger.kernel.org
X-Gm-Message-State: AFuF++mVASUOZ05mWamiv3VrnOCOEe2anyKCx32hkhwbP7RGSqR26039
	WQEgiXuHkIYfU97lqhHx9PTf60lPQoBpqxxbmgJLtlptfewljK48VZRZWlRhBWT3dQoQZqkvwSX
	cwm589/PFZUF0pW+SQb2bxsDFLehjfbSpkBjGmge/T4T453c1MMxbZQURs7GSvQ==
X-Gm-Gg: AYBFou2jazV6Tg9KxdCVwUH9/u/McbFogPNKj2K+6gW6GDXI8fNFIlyYMLizOMTGbRc
	QzMdIFe1zySWZIsu6Xb63qaHia5klPb3mExV1Y1H9BUJfo7sytRK32c7HMxsizxF8r2hbXMKO7H
	UbqRBl0t2YjYIWDnC2FV5QxTPzdUOFF6z/wZXSXdfPjeeQLF+tWpbQXlYjy9k5OSgU3XMknak97
	BNpQTUHNuv8QuxTTxS5hBoZs0VWA2oj6xFi2cJZJu7diM+pbbKPfuSTf/zQT8AKdfMRjQfBdqNt
	5c6B+qW6Gh02DYaHNxEkaZV15k3ZSNblmGnChokN0r3Zvh4eEi25YF2VU8knnkjrsXQwKe2B9Ws
	81TngLIRz6UHeZHzPps/w9w==
X-Received: by 2002:a05:620a:178d:b0:939:4a24:4de4 with SMTP id af79cd13be357-93980c5c987mr285928685a.5.1788512406262;
        Fri, 04 Sep 2026 02:00:06 -0700 (PDT)
X-Received: by 2002:a05:620a:178d:b0:939:4a24:4de4 with SMTP id af79cd13be357-93980c5c987mr285923885a.5.1788512405649;
        Fri, 04 Sep 2026 02:00:05 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e6c20c0fsm895767a12.30.2026.09.04.02.00.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 02:00:03 -0700 (PDT)
Message-ID: <0f5494c7-c3c1-4668-a09f-d8c43d1c58b9@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 11:00:01 +0200
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] soc: qcom: geni: Derive SE clock configuration
 from OPP table on SA8255P
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, mukesh.savaliya@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <CAPx+jO9fcvBsxe9yx9oK=0EXmpNwub5ba0a-TGk1WRFaRGsqpA@mail.gmail.com>
 <177884a8-902f-49be-8fcb-b2bec3ec7d6c@oss.qualcomm.com>
 <CAPx+jO8bXn2F3cWz87Ozjrh00E+a_UWBrHeUViTEkTL87JHW9Q@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAPx+jO8bXn2F3cWz87Ozjrh00E+a_UWBrHeUViTEkTL87JHW9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4MSBTYWx0ZWRfX3hlXUD1Weby2
 x8Vj1M7oVqtMs270dXY5G/c016NNA35x44hQ/6rTN/WTexITE4YGB0MfCXJXCg6DU1LQcs4jmcg
 NX01iFU+bh+kpV//WWyjkcauYQhpyk8=
X-Proofpoint-ORIG-GUID: fdU9TObHXiy7STwzXFZsn4B2j_rWZdyP
X-Proofpoint-GUID: fdU9TObHXiy7STwzXFZsn4B2j_rWZdyP
X-Authority-Analysis: v=2.4 cv=T/S8ifKQ c=1 sm=1 tr=0 ts=6a9a889c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=tfn4aQiUfrmVOWBwnpMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4MSBTYWx0ZWRfX+DOWUyWr665L
 0B9JpWzlBWFFuOb+VpJioP1w509Hbdu7sNIWkA3v1zuKpBfB9jlHtTu6sTQQ6ci5m5d4gA6Ow7s
 +RGabBZFzy2c1NOwVLT0huUVlu1Ts2p6VJxjwfVzFVzVEHLxtjc5zw3Bt7ybAsdIXo10fyVvsYm
 vov1viVbx2dUisb4dSAnkrdGvp5GGvfI9Cy3bS256mITOw0oSk8fH3ZHLa9qeFM9dyU2j3eMnyO
 GR36EJFSteyb9kmONakFVi3t1oTYh4il5PwqvejbQXAH9D4qxHIUYosseyW70MEFSZ5GfNCKJEJ
 XcbGA5grnMncp8tbY5Xsw5n+cPY/Z5h7HyudCBkRdYc3ZBqLr2IyXeDrvY8a8PSKBv9VrUI0cev
 Ymjy4YvTiViRkGuoXPI8T9u2qlcAlCu7+Mwf4ti+6uqq/Zgk68VlqF1mwe/qA+pTw5Ptka30afi
 0mGypy8YVfWs3MFkx0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040081

On 9/4/26 9:56 AM, Ulf Hansson wrote:
> On Tue, Sep 1, 2026 at 6:48 PM Praveen Talari
> <praveen.talari@oss.qualcomm.com> wrote:

[...]

> So geni_se_clk_freq_match() is used by two consumer drivers today,
> drivers/spi/spi-geni-qcom.c and drivers/tty/serial/qcom_geni_serial.c.
> 
> Beyond the $subject series, there will be even more consumer drivers
> that call these platform specific functions. As I said above, I don't
> think this is moving things in the right direction.
> 
> If this can't be solved with generic frameworks (clocks and OPP),
> please clarify why so we can figure out a better way forward.

The way I read it, isn't geni_se_clk_freq_match() more or less
dev_pm_opp_find_freq_exact() called in a loop with an increasing
divider?

Konrad
