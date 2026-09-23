Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982C353CA78
	for <arm-scmi@vger.kernel.org>; Wed, 23 Sep 2026 14:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175113; cv=none; b=B6u603MB7L3vwNuDlaq7wmbZ0s3Qacz/FKWWZgcqzbegsLKwT0Ww3O0AkpUo1pCaznN2DCb6LClg2MI7lPqWcZ5RwVbi3r2qWAdZgPzDX4mWes8kuZHM/ZUMHIHjML2dUWWZbYhvLYE35zSH5hzCp6fbfBawXeNbrADihNmcZao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175113; c=relaxed/simple;
	bh=tUeK7QUj2IKE2uFCeChn1ygOQ/iJBXWinQo0JAkeZD8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=KBB07OQF3Z5TkgF73DPRZXP7J5ym4IyyHo5TlyEk3N/DrJbt7Y9QryfMyI8UZy6ATSulXopIVlN/6ZrB6imZZ6yHJRA14WVtCUkYddbmcvXnwwfhcxPptPB/fqWZh/fEsnWhHaijtg72iA+Nkh2z72f5/zHd7OFJ4NIny+mcEEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YDPluFm0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q4lz6wbx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YDPluFm0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q4lz6wbx"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDL3aY177216
	for <arm-scmi@vger.kernel.org>; Wed, 23 Sep 2026 14:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+R3bZnXxOWTMbKlDYq2yQXXsxhWIpfAOq8VfoVqcl9c=; b=YDPluFm0OahNv9wZ
	cGvj+KSuUHVh95uSwMdsn3P3kJhzwjTDpi43NkpI/2SoCSI3jul35+60XSfNXhW2
	DzV4vf0pvvgcKlCUDELPwYzEuKHTJUDAgYnveKZy01SSwovXfd4dcd7ms1k+G0Q1
	DR544JEiBRHK5KLhHhHmydrvQ4mAx8IUEG2OSl/q1jOdNUBZrV7yzIvJJYIFO7Hn
	hNlyLG/AFRFUoIuH5dHrj50WnXxxxrN8G7TM50Rg+kYg9zpFKAMvfLYSGHWTOZwN
	+JuCpav51YiRfNXP8SN7C9RDlzxtfrlLvwFyC2iiFGL6nmABaZXj253uamIf9KuC
	98et3w==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjxrdt6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 23 Sep 2026 14:51:50 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78350646d7eso2194803137.1
        for <arm-scmi@vger.kernel.org>; Wed, 23 Sep 2026 07:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790175109; x=1790779909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+R3bZnXxOWTMbKlDYq2yQXXsxhWIpfAOq8VfoVqcl9c=;
        b=Q4lz6wbxrOhVyf9dNo/Iw2qfLyrFkixppauX2wZb7Q4nyT3vZuCH5xLC1uHXsePCkk
         WacA71yYN0hXyJXHbOsZ1GDzkMgU1Mgwki1RkUnBOrfkrl2/e1YePDs6jSnWv/9jg2hu
         Pqt8qGrUTj+a4tS8OGbXzoFQvrU4jOrftBoCqw+DMIgX5TziPXDnXcIyUS/xhTTl9oVt
         5IfKQ8Q/YZCC74Zmc6utVgpqKuCpjnA5KqEz9aSDXg83yPAnS+l7bQkdWHEJsP21Vw65
         4C3XkouO3ACyZHjx9UtoihRjfFLB5YtNNAOES/bofsaKRLPWxju691m0JeVKzUkG0xrj
         taaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175109; x=1790779909;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+R3bZnXxOWTMbKlDYq2yQXXsxhWIpfAOq8VfoVqcl9c=;
        b=Papa5ykW3OQqlFh31pA53h+HlDRjpe7FTGaUjkMcMzO0FISJEW6p9ATiZyCIkc5C6x
         2YaOimIyqCgkXiW20a3W9zyNdo/Z6dgyXxBR9+fNEI+WgG8f9ztzLjV5YnQlIzv+rrMj
         UFK38pRJPuYz+GuYk9+uX8c1SBpJzrxDF45v6LX1oWas5ttNPjMEJ8Inly/xhTrmnY57
         pdI/0X7pWK7W/p+0zDxO+XwS5QplnIAXq4zSA5SJ8NBDBh/4uJqPFYLBFtAW+5j5csDR
         y4MCfTCtjXTTbrI2s6dVfcf8jLrklpelq4eQkDwUpmra3E32aTKPlgfolsDH/OanKQoU
         TWOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLFXOuKuNWg3B61i/5BaYrKLQpWsBClVrnpOOvPiN4HCgz2iQCQQqON+wgRw693jRNwyLOVbT1ag==@vger.kernel.org
X-Gm-Message-State: AFuF++ms2FVj7GrQnt2SxPNzYBk1dwJEtsBTMlQ13JRP3UmE22wbeYAc
	PXNobOufamjGdfcfRehQHOZtNYwfytxqlQgseGvlgGJj7rXbY1US1h8jEKbwc7EJ4svt8IAfV1T
	lt9BR8Z2pbyOp5ib2ubkqGo4fVqr7AVHafuME/pOYeu2yWpENIorQ59xSotsAVg==
X-Gm-Gg: AYBFou2YJagOwZbyC1M9GeD3slIe6kuZxlIBVzhyJieZ5GtDxNLPmWyiC7WCjj84Jpx
	MxEXynlwQiqOGoMtxkje8j7sMGaGu52plT5kl13tYFmTl5ktk+qLpdppvOePF9Y/69MCiNVfrg2
	9WsWF/FTXtioPQOK9nUjWdpVmvQwgfLm0wbOzs/kwKySxSSIIuKOqiGIZkUWHrmdhzOmSc5Elaa
	3Q9r8OeQI8J8+4ImFIV0FKlz9X7dr2thPt0JIvLiklsOqWhxiSd0s6N0hrRcFi68034+kAX6d62
	VqpJ64+o/ngtSqQT5TbwgGEIwWsd24rnVPyykiQcbbeZ544FgjX1w1DuVVYm+FtCqZwtSPP4zGz
	8vVTfOt1Siveh7KXmKtZu1x9/9nFgml6NqnRC2iqbj15WGRVd1vhCzrTJHb05YiwJjnuvQI9pIf
	qdgOUbqKdDeXgaiD0jJIaaPgIrmk7o+P3ldmEZmYjg4ekZgpNrl88+YtTuYQv+BsYm27c=
X-Received: by 2002:a67:fa46:0:b0:7ab:45e4:9479 with SMTP id ada2fe7eead31-7ab45e49664mr3196573137.16.1790175109604;
        Wed, 23 Sep 2026 07:51:49 -0700 (PDT)
X-Received: by 2002:a67:fa46:0:b0:7ab:45e4:9479 with SMTP id ada2fe7eead31-7ab45e49664mr3196561137.16.1790175109223;
        Wed, 23 Sep 2026 07:51:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae60a04csm143005866b.23.2026.09.23.07.51.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 07:51:48 -0700 (PDT)
Message-ID: <50b27e3b-729b-428d-a903-b118a5bfa249@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:51:47 +0200
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Sudeep Holla <sudeep.holla@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <arFKVhlgJge5EZyj@monoceros>
 <20260923-sceptical-mauve-firefly-f5456d@sudeepholla>
 <6b5a8300-ebf9-4717-bd39-952e89fc5e78@oss.qualcomm.com>
 <20260923-snake-of-magic-satiation-c3b857@sudeepholla>
 <a5e56180-b96f-4fac-980e-e837e84cd5a5@oss.qualcomm.com>
 <20260923-calculating-positive-inchworm-28d3cc@sudeepholla>
 <arPMAXs4jjUeu1DE@monoceros>
 <20260923-groovy-airborne-rook-e1efc6@sudeepholla>
Content-Language: en-US, nl
In-Reply-To: <20260923-groovy-airborne-rook-e1efc6@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 237TMtA0FPjJ0cet3r_MKR9Kc09U__fv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1OSBTYWx0ZWRfXzAedUFBQvr1O
 qPgIByEg2ERhS1Hw/AhLYnKXD082k/On3DQrU69XcUjxxkD9tN1Xz4Q8BZ4EEKL5h2PAltrliQB
 3DJKD9q51zoBpgl/rsX4L3pJFjWBa3BShS4oYnByS/IgDNDe+gp3vpK0GPOy1mTFeKQsMJpYZBg
 ZCrqyFVAaQNxCshXA3sQV6KLOtb/t1kmrhZQcA2t9m4jSRASF696YVBFnti7MyhTwqAIFWJlhLk
 qJRpZ53ctsuKNiH1972uI/X7m/bax/5xrjmdOiRfneVcwYosoS6lGxjFxiY7oZrlHWSKBgDvqJ5
 QR1psnfJyR3IcvzsTW55ATIg6OsYWNazcROQ9mawCrn/7PG+maMo7ELu3EPorfH1EXouSNwicEh
 oYhq0HNYtKUoHgdI2Q8PFmFkl4h0U0TRhuevWyrQvjSL0dk7cwXNAw5dKMm7Pm/Ul/tPm6xEN7S
 NLle/tHnnAOzmLZpXAg==
X-Proofpoint-GUID: 237TMtA0FPjJ0cet3r_MKR9Kc09U__fv
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ab3e786 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=IpJZQVW2AAAA:8
 a=wmcOPm1-qqoyX47EQMsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1OSBTYWx0ZWRfX+qp7kLT9IpD7
 S8LdF5ArXRbX7UUNcvB3+/RKzSeNtiZK5WQbdxtmKVayWyI6N2IaXqHoosfK+HEB0eupYUUWucR
 Cs5kN1/bPwv7BzrHjMjJdufcERu/UF0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230059

Hi,

On 23-Sep-26 16:25, Sudeep Holla wrote:
> On Wed, Sep 23, 2026 at 02:55:26PM +0200, Uwe Kleine-König wrote:
>> On Wed, Sep 23, 2026 at 01:01:44PM +0100, Sudeep Holla wrote:
>>> If Uwe is fine, yes I can take v7 as is.
>>
>> Fine for me.
>>
>> Acked-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
>>
> 
> Thanks Uwe!
> 
>> The nice thing is that the device_id structs are not API, so this can
>> also be addressed later if someone comes up with a clever idea how to
>> implement it.
>>
> 
> Agreed.
> 
> Hans,
> 
> There were other changes in bus.c that conflicted with this. I have
> resolved the conflicts and pushed to my for-next/scmi/updates[1]
> 
> If anything is wrong or if you prefer, you can post a rebased version
> that I can pick up.

Thank you, the fixed up commit looks good to me. I'll try to also give
this new version a test spin soon-ish.

Regards,

Hans



