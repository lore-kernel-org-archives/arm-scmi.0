Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2F6463B62
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 16:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787590528; cv=none; b=FIYpe3VP44ImQCxpKKaYM+uTiRwA05PaMgsqhtmvNokol5GW1rWEikzpm+VxHXOdVDivn3W60PczZonV+aLMogCvbxXd3T0QPGbkD6yC8a+0KetOJC43iQPuc5IqAguRjzxyc2YXU0Q9ScdkuZ7uFFRMXM59N2z0Ewtu/Q/R8fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787590528; c=relaxed/simple;
	bh=AQoWXsfJHmwnAyLj5EhV03cDbyvTWuaUKTcrQyW8y+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bWG22Pa9CNRdeHy/Ti6bs+NpPriQCcGBypZP1z+d8hwW5U7c+WMG4DuDEUR+XTBudC5OInMF2+yf/W8pujFyyfLhoTdvJgS94zwGp0WHyDm7oD/jzWWPsnTQINQHPG7v2pQwAi54PT2EIIIajMaj3K60fFqYij2SMkgohhWdVhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ByBN/BqV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fm39jQD3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ByBN/BqV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fm39jQD3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OFmhFl263635
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 16:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sfXILiAwBDaxvqRoSf8xZ7r6Qs2Yw0ErBR+u4/IPE9Q=; b=ByBN/BqVIwxSsv7C
	5vePHD+qP1XPRv26tJh1xJpiFcWjFIupOTGGuEA8DnxthAUGC18zZH9r0NikPRN6
	rJfhaYVRAHTyg9RT4OEGiUnReE6SxP0IPOnn9/wq1xBZB/4nAxhFptNLOz+w4jhk
	h90r9/ZlrdfCYk3KFd0MroXEjuk3TXyh1N3Kljw34vKY0paYqhph/cdnGsdsjIzt
	tafxak0YMW4qBZRh7kQQ2b6Ea3KhmBj3NiBivPKXZdYnwkIfoKODPe5k/T2Lok2X
	YQgKuKOlCN9yM7tooAr1Oohc1oKaWPSWbtly6MNEYByj8rNTo4o2gf9FS2mQS8/u
	impz9Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jpkxqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 16:55:26 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb48f41343aso57914a12.1
        for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 09:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787590526; x=1788195326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sfXILiAwBDaxvqRoSf8xZ7r6Qs2Yw0ErBR+u4/IPE9Q=;
        b=fm39jQD3goMgBWbSoZzSPlvWcFuRCaK+9sWdNSPWOugP12xvsiqRClSZFyMdpq3a6m
         d92S9v43j54olTYiPHK/0R8CktRHOnnKOoulkS2Ek/F8Phaxkko+oJafLjQtYO5te+8e
         Z11jY+MCiJpAlmrWVm4YPHCV1MsNY/T6aTQenlYPFKQzpbFnab9xh4SuD+O9pf5pqA1B
         v0LAfmDrFxbDTEGbBAh+M5daY9fPT6to4b47u8ABMaFA48vHOW4jlFOrXZcA5qz7rCvO
         HDh47zZnnl7EIFUHeU7UxsScBng8NqV9TA9VJv/9oVPH3pvVG9xQ2OIvR7I0YxteCKis
         YUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787590526; x=1788195326;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sfXILiAwBDaxvqRoSf8xZ7r6Qs2Yw0ErBR+u4/IPE9Q=;
        b=Kx0F6+DXKfexEDqeD424xTSEW3HcRxjzAxCT290huINs4C2SvffbhYxjbGK+A4c2Gg
         FTPTeyOxmXD7CxfGt6KTQFYbUdzU0p7jvHt5Dlq+AgHi8OPEtRxx8ajQuyYskzG6vhe2
         FMn4+mZ7cmw9nkkwe42s32GloaJgKMvkILxkTED4kDBU6u22aX0BWOKnN9aRiI5MhsE0
         /S/JS4c8uwnsLnDLyNIsKYKfpOZpaa+d7TfiN1UCsjMTBCBATSiVdMMm/a4qDp/c1XG4
         UT7xVXG2bFUlvyR/VP23eySwkCEVWaVy0bSeXRCJTrTWFeGCSh7ThNELtD6Up0V5xOhp
         jHnA==
X-Forwarded-Encrypted: i=1; AHgh+RpAwUtCthAqMEdPbc0ph7jk+2BVHTWIYMh6dXFFXDvYHviBnzIkKvFWCqHGQFKHdGG0OFgWGMy89A==@vger.kernel.org
X-Gm-Message-State: AFuF++nfaYXIvOTdVLrqFhDPv4Eq6X0D2Bt3mtUcExd9KK6MzCbS5PAl
	+hHRrEc2NGXhYHV04pqT5NN6MEvRw7LHjrIph2o7NHCKFYPA1LqDAr7EE7EEPkjjmXwiWk7agkR
	SFqJCIArhCs/HsQT04zCWECjFbcTln+I5hCw04NsD+JuTRLYf2k7SPYiZwOAqdg==
X-Gm-Gg: AR+sD11MZ31afs6DJZF/1r76Ep0dIQ4wMQUWO9h/2duylwcIqADLDxb3PgBYVUf2Gk/
	iihzX1SagmhyhvE0+bw7Ec6503WsezVsmvaL18nbtrUo+6T9CK5UwB4zdebE37iJpEgKLQ1oJKI
	ro8M05B/ugwarQsdM4U/29O/r+AJsfoPJply2Z3GY/FOn7bYn0XgbfwvcVh1f4h3LRuy9IkIzAc
	I7SC6pS/qdkBX8fA+dY8LmiRXbHM87M9Q+R9gpptWvAUFulhVdhek6p2N5Qs/sn+HT2LJImDdDj
	GOyCCXsTJg6YLwZ9mkqCQQ6rkVjrADeDapyqvY5WpEY1CtoVuSWFysuBlgrqeY2OQcQ+yzT8F3M
	HeDeJQ5OSHdzlRqpbWC/WYPMI1HaX0g==
X-Received: by 2002:a05:6a20:431e:b0:3bf:b9de:8557 with SMTP id adf61e73a8af0-3cd8f294ee1mr683433637.9.1787590525706;
        Mon, 24 Aug 2026 09:55:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:431e:b0:3bf:b9de:8557 with SMTP id adf61e73a8af0-3cd8f294ee1mr683336637.9.1787590525072;
        Mon, 24 Aug 2026 09:55:25 -0700 (PDT)
Received: from [192.168.0.6] ([49.204.106.1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc199daeccbsm1253160a12.7.2026.08.24.09.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 09:55:24 -0700 (PDT)
Message-ID: <e47bea2c-ddf5-4568-9a2d-a30a31793352@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 22:25:16 +0530
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] soc: qcom: geni-se: Populate clk_perf_tbl with SE
 source clock frequencies from perf OPP table
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
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-2-61171ab1cdce@oss.qualcomm.com>
 <d81d61fd-79d1-4bea-b93c-0afe44f9aab4@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <d81d61fd-79d1-4bea-b93c-0afe44f9aab4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDE0MiBTYWx0ZWRfXw6ybTHrLuzaD
 nXBXykZYNn+JWewLZQABBa84ucrKacBY1BhxH7uUk0Aq6tODKxLgZX0LruHM4aR0xUC2AeDrmHU
 Kmt8yKJmJs1HrvoT6yrC/IcjLnQuJ6d5ZTGAt1E9WMXxNI9IpAfx8vpoC14kxejJPYseevJF4LI
 4CJKIaIxdk5McKVQNykibYkzXWbQKBiB2h6Y1ShIrNaOP+dKXTQ/e++euk7YJUjIalvhWR7Gr1U
 l9uEbg/JOulRIK8hOvlxt6XHLd+eNuAl2v/S8+JGlONgtovQInOLehp8lPQ9GgmHJ0waI+7y9MR
 bEE7SJJbT/RA4bEaNjcjtTEeBMAAmAAe7SNfzNYw23lNqFm8Wd+s0ugQmwVt4J5AM2w/YBrpOW+
 3iicR7eWyuUHkgRK25iPIYiU3LOc/PP6H3qXv6MGwb0t32V3Tzp8+9chUXLKWYkrVhOfhKf5nZ7
 qd7K9peTW3jH8GAv+jg==
X-Proofpoint-GUID: 6MTjYAfsLYfBMmIOY5a5oopa9YZ8G7Nr
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDE0MiBTYWx0ZWRfX9jTJirD0+nFC
 gPxlzWsOX7PQIs4UoQue8QK5fyNLpE21ERsNDGxOyFnaOCAenVkB6IoCR8JnmPzr4d0dHY5wBN+
 ZRGyvgWOUJzBnwlrVeSGVJZf2aNinY0=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8c777e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=3DKySdf3VQHjbkfL60kt6A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=rko7XVifj6BEHbDbj-IA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 6MTjYAfsLYfBMmIOY5a5oopa9YZ8G7Nr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240142

HI Konrad,

On 24-08-2026 20:26, Konrad Dybcio wrote:
> On 8/4/26 9:57 PM, Praveen Talari wrote:
>> Currently, on the SA8255P platform, protocol drivers attached via
>> geni_se_domain_attach() treat each OPP on the perf domain as directly
>> corresponding to a protocol value such as a baudrate or requested
>> frequency, and simply request that OPP via
> [...]
>
>> @@ -1175,6 +1181,29 @@ int geni_se_domain_attach(struct geni_se *se)
>>   	else if (ret < 0)
>>   		return ret;
>>   
>> +	perf_dev = se->pd_list->pd_devs[DOMAIN_IDX_PERF];
>> +
>> +	num_opps = dev_pm_opp_get_opp_count(perf_dev);
>> +	if (num_opps <= 0)
>> +		return num_opps < 0 ? num_opps : -ENODEV;
> if (num_opps < 0)
> 	return num_opps;
> if (num_opps == 0)
> 	return -ENODEV;
Sure, will update in next patch.
>
>> +
>> +	se->clk_perf_tbl = devm_kcalloc(se->dev, num_opps,
>> +					sizeof(*se->clk_perf_tbl),
>> +					GFP_KERNEL);
>> +	if (!se->clk_perf_tbl)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0, level = 0; i < num_opps; i++, level++) {
> One iterator is sufficient here

Will review and update.


Thanks,

Praveen Talari

>
> Konrad
