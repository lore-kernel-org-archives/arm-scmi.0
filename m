Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9773E7633
	for <arm-scmi@vger.kernel.org>; Wed, 29 Jul 2026 14:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785336802; cv=none; b=DDHaptsueT2dd3yMRbJRmG59P7doqYs+FxAjM5S5+tDlHC6D01HEgdWu9xNrktANvTKRXshGbbyOmNF0yzqOf68IZyPxviuPmuCi1g71ngCx4QdikxY7cc86HGYn6F2FK4lNzwmB0IEmNwYklGkuXihzqKoA2oHd/hMjqof93gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785336802; c=relaxed/simple;
	bh=3jY5K6+SbOxFPpbJjekX6KpVzCf4B/o+w8KfeRsjWkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rZeh5m30ezLC4jIQt7kf5VBDd4K+TYDuPmR24hnf4VjFcCUKGppjG+wuhKR75ZaGWUe3AmX/IabIOPqWfaj0J7LlavbZF5ZvsnJJnX1moYUCGtjbclDEb+yqVZQ0IV8fBsKD9azUmAPRCkzZVb7dvWXLxIoitZD1sdglbW3AM6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=odno/PMu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HQNOFotd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="odno/PMu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HQNOFotd"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TEZPb42043573
	for <arm-scmi@vger.kernel.org>; Wed, 29 Jul 2026 14:53:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n2970P6vAPUvkgw9uaF9sNtIWHtiv+z5sxig+NiQqow=; b=odno/PMu2poUiAnE
	0hF8u+n2WEvwswMQVqbTp7Z/D6Zq6vC43AIKSFz6bIXOz8BWPUKDto9rRmDYO+b3
	3ffoOnAa5K6RWitXRk/xGr+8IUlNPCYQAkUha+XADy45CNrvZnqLIZ3/VIJBEzMJ
	0FLrDMHMGbagTIv0j/q9rF0I2LM+EHjKHN2Emru5FpSIjqVgrf8B8Cir3dUVVLmT
	bV4IWbIunqvZDcpeHTFNG7H1NbXvUo327bPSQcPLgHlhbnQRN+rR6ruK7sXqjo+m
	Bq7gYsv/pnP8gEYdIon8EhO0kXP2gQsLp9Qv36R2ahQFy1Fj15misxFRwqQiLmre
	p+Em0Q==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqkds8362-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 29 Jul 2026 14:53:20 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81f3c871fd7so38979977b3.2
        for <arm-scmi@vger.kernel.org>; Wed, 29 Jul 2026 07:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785336799; x=1785941599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n2970P6vAPUvkgw9uaF9sNtIWHtiv+z5sxig+NiQqow=;
        b=HQNOFotdMd38t0SDgXotkjLw0jb2VGENAD2z+YTYFaaGtTBCXiz6WblUWJ5WoPEApF
         V6dqcAFzcRg5Od+sYjrCaP4d0hZfbD4X7AoefdgJdEgFItNI4fhdwHfBJ/K1ObFcHG4x
         5wuCN+jw4QYy/M5/GTljXkcatvYuYMwo2lJrR1LKyKELUsF5KCN1n5Tfdh9cXGu4Nd7B
         SCI+D+SK7l3XAppeHRFyTrLmFSu1rEt2vlJeuAaMLAVQnjl9KK6qYAUwbDTfvwthC1E7
         6bYEn37B3ptPsw3UiiFkt7aq+n0p1AVksX6wlaaY1Oi/wv7/bPyIs6BFndo7TdLHlwn9
         z2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785336799; x=1785941599;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n2970P6vAPUvkgw9uaF9sNtIWHtiv+z5sxig+NiQqow=;
        b=UEpxXO454ufLq8BhjYZPl2D3Vs5m29i8ulz0oqCtB3INaMwN5cqAp/Ytp0IBHlOPoh
         7uSjvqKU3ODo76CWvlV2af5JPOxlV/Q2nlCYP4lx5HCLkmNgMdC91zhFXE0N7Jo92WZI
         S3IfjSRoQtdH3nTgnYsucC0t6gSJmeFLgBEZ+L439ib3KnIfzYAyXQe+2yeFOnfSvKhG
         X1aqPPPOxv9A/Nd7YAQKbBogAByQMB8pRrgCnTjrxTER1+zrfp2bpwLmuMI5furoEjRN
         2ZcSf6BbE27BeMjRP01HqhK1cPKPQ2a3lL/6ypgslBW9WB09bqZ4Hrsdvh0yQ3AFEFCa
         OSKw==
X-Forwarded-Encrypted: i=1; AHgh+RrjTpVDQDtOB4V0F0hYdlshGGpCCgRbMm73nwmnW2kmfiLvhG/g0kvJcHtTOb+hGLZI3HzKQWajeg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4vR8OiwA3C07KNhR+VVK1zQS05paOforhCIyLA18Yt4NY3jEH
	m4VBF8QEu6+fKaIUcdkyotyLBS5LUo+OhtfrA2daOzVqS/snFbnMs76i8UxUjWWgFid7ZgGChyF
	0fnCMc7nZf/8pA0oxPme/Qtk6OGtVeYoddRQ7q+UA8jHhmUJdGUAAcAdy4rJjCg==
X-Gm-Gg: AR+sD12On+3e2luSsCvKwpPM/BhRvfckMCiyIik3/yUcW9fUnBI3tKIRWc8u2ErTuh3
	zJy0ocoQ3mcpHx3VHeIplhyG6gL++YsS5exijWVbUNdifzdQS60//SPmv0rmrBIu6ARyCJE2Y4i
	hTcPrkhfyQvxHLdi4CvKxD1igE0JPUQDL/2s76bIcdaa/xiAo+UtfhbX1yVD6BG1xsZvNebstGn
	QdKc+Aafw3m5uUaQkaY+EUWBRgILg8C8RSFCP143LspxLRSNxy0WdmILOyoOkeZ3nCvvIdJ7c8E
	qq7xnUpeo8PEyO5sh4L0yOzyF/8xA/1BzFXXeZXo/wrbairzq1HFXSzJH/KBWxx62zG7Wr+PGS6
	aoZIyshPqkDOhB0zOj496WPGW3XZUpuNuTmsgAyIAvNgVSG+Ha5AsHRmjrYEB3VDm
X-Received: by 2002:a05:690c:6301:b0:80a:4f5b:c032 with SMTP id 00721157ae682-81f993b207emr40446527b3.49.1785336799331;
        Wed, 29 Jul 2026 07:53:19 -0700 (PDT)
X-Received: by 2002:a05:690c:6301:b0:80a:4f5b:c032 with SMTP id 00721157ae682-81f993b207emr40446347b3.49.1785336798709;
        Wed, 29 Jul 2026 07:53:18 -0700 (PDT)
Received: from ?IPV6:2a01:cde0:108:24ed:bc31:6b08:4ac6:465d? ([2a01:cde0:108:24ed:bc31:6b08:4ac6:465d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fa279b529sm19348047b3.15.2026.07.29.07.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 07:53:18 -0700 (PDT)
Message-ID: <f3da8400-1d2c-4eaf-bd50-ae1fcbab04c5@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 16:53:16 +0200
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] firmware: arm_scmi: Add bus support for
 autoloading
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
        guomin_chen@sina.com, linux-arm-kernel@lists.infradead.org,
        peng.fan@nxp.com, quic_xinqzhan@quicinc.com
References: <Z6CNWOp8B_ghIrJt@pluto>
 <20250203100154.140877-1-cristian.marussi@arm.com>
 <20250203100154.140877-2-cristian.marussi@arm.com>
 <aibW10NMmzw3QnZ5@mai.linaro.org> <aibzLcZiVwtUHAgV@pluto>
 <20260609-upbeat-bullfrog-of-enrichment-0f44aa@sudeepholla>
 <282af085-1669-4d9d-9c1d-2fc232252be0@oss.qualcomm.com>
 <20260729-optimistic-lemon-myna-a14bbf@sudeepholla>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260729-optimistic-lemon-myna-a14bbf@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyMCBTYWx0ZWRfX4l4pCBOzcLv3
 KUlOAdkKspSAwZ1zMCPx2+R4zxBqPh8vWX6w9ypVTl06g3mIV18qCqS4PwAa3zf3SChRwSyGzkq
 uGrklW38ctoPgbtP/NzGjbJ8Dd590F8=
X-Proofpoint-ORIG-GUID: G0qOtZrRtVg0L_nnwDPoVOUQXtBl-OSG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyMCBTYWx0ZWRfX1ynIg7aNbiCI
 ZD16WYfK904sm4MRsoQBGtI7I2NjjQCXBrRYggcmrXbkfIswQdoxS8CHtzqoSzpjl55HdLG//ZJ
 jYJZCwUN0e5ABEpWZhXFUEO/OeFNG49da6uUudV17X0sNug0+XF3Gq33JlqhcsRnw09cuWa8VuH
 8qtq6B0prjihob6n4RoblGuDnpW7UkdbOuyD0q6rUZ4A+WBzEd7ONf6oSl+ibuI07sU8A7XxG7F
 sSOMwieRTfVojfDzr6OM3fMIZEQYBOcswBd7z6FGxrsEVAyLaGmmvSyPNnFVc8EeNCMMRdLFuDe
 bkSn7GOhWme8ydVkJ6BjMd3YweC9babwC/ML45CiYziVSRBluW9NYG7guXu8gEpBa9xYeRPoiMT
 c/yw4ptsp3xMwcTp+Z9nROryn3lqM6dXJ5Zyt10qv9PastWcfFvxtwtV3+CTw8FSd+Ke61sV/Vs
 ehtrHWArl9Xt3rKkXvw==
X-Authority-Analysis: v=2.4 cv=VJTtWdPX c=1 sm=1 tr=0 ts=6a6a13e0 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=yLWW5E55xat3Fkwo5-YA:9
 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: G0qOtZrRtVg0L_nnwDPoVOUQXtBl-OSG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290120

On 7/29/26 16:17, Sudeep Holla wrote:
> On Wed, Jul 29, 2026 at 04:11:18PM +0200, Daniel Lezcano wrote:
>>
>> Hi Cristian,
>>
>> On 6/9/26 11:01, Sudeep Holla wrote:
>>> On Mon, Jun 08, 2026 at 05:51:57PM +0100, Cristian Marussi wrote:
>>
>> [ ... ]
>>
>>>> Thoughts ? Plans ?
>>>>
>>>
>>> Just repost as non-rfc after next merge window and we will see if there is
>>> much interest to get it merged for the following one and take it from there.
>>
>> Are you planning to resend the series ? I can test them on my laptop
>>
> 
> I thought [1] from Bjorn was addressing the same issue ?

Yes, indeed. I was not aware of the series.

Thanks for the pointer
