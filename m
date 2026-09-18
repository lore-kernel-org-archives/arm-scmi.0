Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FF935F172
	for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 09:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723836; cv=none; b=iwD38kISW6thYmAtvufK03fT8wdYiVfYoiIP78yJRaW3lTKsW4MNQXG9Ahp0brUUtR8OlHRDgPAuKZMfnWAyFJfMeUoDitVLZbCEoUPdnXrHnPVhs8dZV1bJOyUi0bBPExysAUd0qXNyEchwyreQy4mmZbyReY0RbfRoKHddq3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723836; c=relaxed/simple;
	bh=xVvPBhcxFPbVB1dpikehNudtA6+pusoKbTL5cGXpAfM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=EHoAdRWYNPkzoM4FR3Kb2/8MR0NLLyoMrgjzdW61CGz/q2RmtxdVfODHFrO4OZ6iGkfmAqHTgXEG1bvME62YTfjsLFeQ0S4Od6Kuyo7Ix1mXuKaKoJO1UzQiS4NGjLUf8AihmMTNc6N0TneWG/gpzL2lXXIoK8SP4h2PJfe/+sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YLPoiHxs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N4uB33JQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YLPoiHxs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N4uB33JQ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I602g03304787
	for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 09:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sPt4UPchwds0HyAFeyAS2O3QFIIxm44YoVgrGfIwWCM=; b=YLPoiHxsIe8HtJiX
	oRFJRCjiOGzRoV9uipka15Bze9kbzS8DzAO2GzdTk7SGkPMz/qKuOT74bkrHyt6K
	rWWrh0X3aG6oRE9542rI9flAMwzY8xHW4ZPa/yYPwwmJQZojBBeH1DLbzMQPHF+6
	9FKrkHY/AeqYfFldo8GkzOvTpp8EquXjwbv8JQZjEtlmZHEEaanMTbaHt2ZCtUlM
	gYWcp7P7Dg9YNt4OTIumt21JY7BICjqNpWPn69RHGGq8JAFV+Z/xsOqTrzotEcQi
	JuYhYVpylKaFAIYS7LwfInhuNiU1pemnFoMSyuDAws5Ov1DJ5lI5F50FY06FzO18
	sYAdSQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grq2ktv3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 09:30:33 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90cddf4f59eso10984436d6.3
        for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 02:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789723833; x=1790328633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sPt4UPchwds0HyAFeyAS2O3QFIIxm44YoVgrGfIwWCM=;
        b=N4uB33JQeZnWL9PowAanzd506YMRmAxqYSIkgm6r+c2ZSqmjy8bhYK4Blw5jGHIrL2
         XrOlOrw2yctz8ysgemxzrZ7ENV//Ca52o9bPcxBy9wZ1iUtyAPQukg2jPH4pEbGJjMCT
         8QSgRMZ83pnpzBd5Fyj/Q4EzLnqszDzRGNtolhxci+F3EG9yc6Mexew8wCLQXl+X1HA7
         3s1mnlF5RppRsBLlHLUQ3U0V85g1C/RYNV9vPY4jAoi8YAlRAX3IGadO0GX/Lj+Sn//E
         LiQKJej1m1PRTDdHt4lSK/6/PQZMfcLf2JMiKt+xT492mhSEdrasw3g6aK4CvzTy2ehr
         9PFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723833; x=1790328633;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sPt4UPchwds0HyAFeyAS2O3QFIIxm44YoVgrGfIwWCM=;
        b=P/emgLXMslJs6wvQEyBp+/Ibn78XGGGiRWznfgyYddi6TBZon96c3UhGnsOGsmSLT+
         +iFfWM6rILrlySYVjFeAeSytwdbJqXnPP3oEsTrETI4IYu06p7zCIInA3gIY3yfHNvdt
         bmIMA8OYC2BdqS55oHCPpgaHPaJ1xBkrq+3oDyKxk7CIrXD/4mH1NRqyxadXhspwWSYC
         VyqJVMk2zudGX0MZoRcrRFz8lU8TDs/aJ6qBE61aCvKd/4+mDFDmFtZj6d913Mq6J/Qr
         zDviSCSryZU0r4l4juzWcCNJSmcOROoI/xITnC4DxKuhCGWqUlroTrhjtG0jZZzc9lAH
         0cjw==
X-Forwarded-Encrypted: i=1; AKwUvBysb7iybti0ZR9Ia8AANtu6nEl3ELWV6vpUHO8Dft+jS+xn5xItATcHoOq3MWEUheppclJoz5gbuA==@vger.kernel.org
X-Gm-Message-State: AFuF++mNDY67WaqdYfkNxcurea+kMxHPVEO9l6/jZy17mr/Vu3OHoAYV
	mb7os48HlwOEfYh4NL+FlWaJaxf/b7T13ZYBjixXfiBv+fB7HfRxfEgUElDoy4ejkIu8vDBHfGk
	VcfY09OaHgEK9aF4/rGdB7PqrGG6s/DOJ9LVPzpgg25ELD48xEywBmJ+aKREmiQ==
X-Gm-Gg: AYBFou30K2yxT+haO6UPjIJv3cK593iqSM9Z6HgfwOfp0f5wDDKL+Qy60NCY7O4F18d
	ihMMta9nYom+MW2yyb74K3x7SnpyjW3ecuucWFhFI1/dN833qrY5/e4znliGn6L/iEFVM6Rq8/+
	Y+9q1Sn3iZxobYnDwtE0Fl4bxUKJUWh0F6VYD5Ee2jQmlEV5OJNaPjt70t5GbfGa5rt7ZtLeD4g
	KRJeJuO0p4opPy4ZSDP/TBOncRS2cX2dBemCeCR3rFI3rf7drnAC2Z0uayb7dg+TT8tTKaxTb+1
	uh5shGHCiVndUqr8JF4BfhEEuU+4jPS86CumUlJiREamEMbLXxlfhiEkvlyvn5jVu0KN5paUvFH
	arV5wduxWosa7vVNZpVhZJHa2O4VMGYmzUYBRijM3GCBOPhoHmstgJLYNulbdqGIo9L7w2OQ8lS
	heRsRkGrGKevIPSsIPZkWVAS8m+kVjRD4b/3H/yykGhDolj7vzXbNE/GJTP0OUcltUvg==
X-Received: by 2002:a05:620a:4385:b0:93b:d7a2:83d7 with SMTP id af79cd13be357-93bdca24e18mr230323385a.70.1789723832738;
        Fri, 18 Sep 2026 02:30:32 -0700 (PDT)
X-Received: by 2002:a05:620a:4385:b0:93b:d7a2:83d7 with SMTP id af79cd13be357-93bdca24e18mr230308885a.70.1789723830923;
        Fri, 18 Sep 2026 02:30:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bbc6a06sm36747966b.53.2026.09.18.02.30.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:30:30 -0700 (PDT)
Message-ID: <6f1870b3-c01d-4434-a7e7-64c82cb8db41@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 11:30:29 +0200
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/4] firmware: arm_scmi: fix module auto-loading
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
 <20260915-origami-ibis-of-love-adaac1@sudeepholla>
Content-Language: en-US, nl
In-Reply-To: <20260915-origami-ibis-of-love-adaac1@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzMSBTYWx0ZWRfX5YNZG9qPBhla
 LQixqe66lUS2Wv7gbQWFAx/fcWtpx0UCrsQ3OI0G1ywo+2tFqCqEAEQsR6gqG6/WR+g0hQ1d9np
 nPR4f9aLbmAUPOk+UvlgFNg8Yz/3yNkefRloxWEyNmoyHT79gcMNt+67XUUpTX5SS9Y6zkG7+OO
 Gh1bHu6G7gF5zw6FwrBbbXATMwUnm2EV3RENzbzfAUdUTELYv8o9/HpXu1Jowg0HNg3MlL6oEYD
 5k+0u9R+qg/wXLIU+PjaydAK6+0SzKHG3cMB2hXNfGKkg1aK65ikxLLZ7TG8t1VxEx39vg9PPKd
 W+Hqbq4gmwnU25ntn2m7sjDpV4exF6Xat0ivgBmQy45DdMj6byY8Nr/jfEP6q8x6r0PNOKArHY4
 q+cJ4ocrmhUNpWGiBBRaG8wcF8Ohan9JOymnJ82b8Ez4yliO+wYmfqqNknSPI+Cv+SMaAQt2m03
 mhg8jajfvT7UXVCM9Zg==
X-Proofpoint-GUID: EIkwGuT3h1RIuSSG3YG39RJ1rNWep7Iu
X-Authority-Analysis: v=2.4 cv=bcD+w+PB c=1 sm=1 tr=0 ts=6aad04b9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=hAX5TG2nhHmSM0hg0PEA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzMSBTYWx0ZWRfX1Mz/lp63c5tZ
 Fnia1uJUVlpB9Vsj0tkBpMcCPnnl89UO/wA/GSFjLJSzznT638Atqv0jht7tOqgnIzH5ykjiOk0
 M9injNsJmTBlm7a5nY7P2xZ6XW0BfQ8=
X-Proofpoint-ORIG-GUID: EIkwGuT3h1RIuSSG3YG39RJ1rNWep7Iu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180131

Hi Sudeep,

On 15-Sep-26 16:24, Sudeep Holla wrote:
> On Fri, Sep 11, 2026 at 05:23:25PM +0200, Hans de Goede wrote:
>> Hi All,
>>
>> Here is v6 of the patch series fixing arm_scmi module autoloading this
>> combines:
>>
>> 1. Patch 1/4 from Bjorn to add support for scmi bus modaliases to modpost:
>> https://lore.kernel.org/all/20260618-scmi-modalias-v2-1-8c7547c1be21@oss.qualcomm.com/
>>
>> 2. 2 SCMI bus code bug-fixes.
>>
> 
> I had a bunch of SCMI bus/core driver fixes merged into v7.3, please
> rebase these changes on v7.3-rc2 or above and post.

Ack, I've just send out a v7 series which is based on v7.3-rc3.

Regards,

Hans


