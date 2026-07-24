Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C49D3DFC80
	for <arm-scmi@vger.kernel.org>; Fri, 24 Jul 2026 09:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883754; cv=none; b=QduKPZxTaUspTx8Blti3EkJRnPmfKfbPuLK8U7lZbuDvxQH6NY0+P1sT0jkyfOK3YpzeF8qHWvC9ScBHVrIkTdQB4xaK1ZVMCn2jMuBgVV7PTfA7YHooPdAGIjH/Xd0E+qVFXuVOdpuwOCLquWLmgNMaNeIh1suUI9cnwvjQW5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883754; c=relaxed/simple;
	bh=uGEwcFqsud+F9B3NSbZNTWlyAJ0KhUGW/Uwq6LX6VHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RpckCSZsGz9C9LEhmso62ZjCx0FabNu4hmdcay5vnb55KQqG4mmcQjtJHyTRgJnp0ONZTZtXPGq9R8Q+4aNQxWKtMegndi56c/J/BpruUMu/9Kym/kwGcKPkc1fiF3J206XQf/jth00z8A9PMR4r5oLZTeimKgqZfYRokGV5eVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a7jaVvqr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LwANvs8i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a7jaVvqr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LwANvs8i"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lKuL2162943
	for <arm-scmi@vger.kernel.org>; Fri, 24 Jul 2026 09:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6zMh1KmHao1LhCLxddpBcSUgeQd+7Z2xRwAtyaliLo0=; b=a7jaVvqrETP7JElo
	NqTryjz8Pj/g+f7EJ+foE0wTJQccpblUSr4FD2Rfp/7SeR4iyEcY27EduZ75LE+c
	6YMl7ZqlfcKGfI3dRD85KNNf8mdny8uUG4csvs6Jk5zhscv4tLwC6RIPnKOdLTDl
	2EZ/Go4zOZH7qUWrhPp1Vnoe8oBRG5MyCrSdMl7l5VK5M+q9Uao6GbZ376cXHPop
	N1q6ZfozVvsoC1qBlbWkMmRmIeSzy48kPNSC8/RNMO7jIKb8VksI2qHtU+JUa1EC
	ZgNVlhwndCA8AKQo3vlhhRM1JDjxEH9euO8bB9reUbaiz4o/O5nh6IoBA5bwpnyu
	UkAANg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkp5vkd0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Fri, 24 Jul 2026 09:02:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c7f385887bso5449575ad.0
        for <arm-scmi@vger.kernel.org>; Fri, 24 Jul 2026 02:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784883751; x=1785488551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6zMh1KmHao1LhCLxddpBcSUgeQd+7Z2xRwAtyaliLo0=;
        b=LwANvs8i++yXh91SYF1/5Tb4PQGJt0lQdLGVkCU+VpPCPz1PTR38qImCq5hOraNBGQ
         a339uUevhyPA1lA9Se/4/pF9CuN1IPOberuAFz4PZmN0IckoLxg/VgHijpVXXYiLfcGn
         dYfwb+xVsyKg0ht8+Ud5IXpjUelEs647DYDQFvx/eg6McP6boNSUsCcnvGD9tZVryf4J
         7S+CCR/+bDiqzYaMg3yGH6j64i3M93x68SYuzNlyipkM6FOncn6NIiwODYzqOSoPqcjY
         pjTrIjdhXw7YOAJE9K3KF1VJPCK2nTY7g4jkWxyDoXD6E8aH4thVqXkovzUNo3FmqXX7
         cxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883751; x=1785488551;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6zMh1KmHao1LhCLxddpBcSUgeQd+7Z2xRwAtyaliLo0=;
        b=P/MQBEuu+k3tHvlIdvEwQ9sJyPRzy7MSuZtqGKAiEnEidt5LJ2+NNLq2cvf2MjVOIt
         f8yqW/P8FXMuvH8Snm8CMZFXW4Kxk6OkaCi/40CXZGBkWBs+acjwrLqX6WaIv9iAMD5T
         agjBHt1yhATDpRJLjANVIKCy3BJ6Ci0x7AfmAdjNCVYge9ko285F2Q95/QmFsIkX9CZo
         259WIvEUmPIp1NAeNb6ADwnskdzPkqOYpdOfbgOE69RtZxu35YnDdsnvEXlOV4BRcLSg
         FeNHj3zaqoYEMSCvA+7/YpZhywgL/qFBdEeU9YF1Yam3a5naV+kPPZRt69m9D9x86wUT
         gwAg==
X-Forwarded-Encrypted: i=1; AHgh+RoMEei/gjkqpxW6pKzd+ivvxlzCV//8Bp+xH+PP2AYiW5QYBxDzA9VIj5tC+Yk8Qb4xIvP+41dt/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyV5847i+W9QCE5C6Bkv3uPKXCrw7mWeoQon8RVDnuXp9/n2i4z
	9cVzUYQXPcRduUjQlcSNTlTA3KR6D6l7GZfiuiBxffnTCay8hlwvTsRvPokJkJoc3CToryDzOBv
	yhJs5/NzhMgYnjr2zf7F01C0WrxEr/qP4ylwcTA2kMJ5B1GkKrITNd0+iPF/ccA==
X-Gm-Gg: AR+sD13ofesjSJXGHJea8C5UcLQ+nehWQTLA2jPmr9ceZ6k44GTvl0t7aFNTOTZ+Y3t
	g94vUtuxa6lK2vxH1UmvRDhHU5UyPDGE7QuXi+6ZfRxJlJsiCFmMud3cZhtcr3wZqUuBBMGQX3T
	QhZYrwUaVQHyrclhFFulu3S3gIgMBxqKQEZRLvMT+2JOwvk7bkvEsQ9bxZI2xWK2yqzRx0LeI5u
	n/C9+LgUGTsd43z0jQcVTXDiVu3/zGWIJGoVUMUg5bts1CoEOdsV8c+oX2cxxW1g/NSOT6YgcQo
	auQQfM3HEzz/qugFo+maFF5pS8Npg0qEFNkbH6QXO14UEQbz8oYVkNAHZRtdCsGXtkJ0N1FlApr
	bFnf8tcOb5zrT3eoKeUsnoUwPfHvn9xmRZtucY16BHTXVx9P3bOlkZYBMJQU5jecKAuRfY+4hmL
	t4G5uVYmVfssdHvc+Ki62wAXrrkg==
X-Received: by 2002:a17:902:d2c7:b0:2cf:ba0c:aa5a with SMTP id d9443c01a7336-2cfba0cb91amr39535205ad.47.1784883748703;
        Fri, 24 Jul 2026 02:02:28 -0700 (PDT)
X-Received: by 2002:a17:902:d2c7:b0:2cf:ba0c:aa5a with SMTP id d9443c01a7336-2cfba0cb91amr39534615ad.47.1784883748164;
        Fri, 24 Jul 2026 02:02:28 -0700 (PDT)
Received: from [10.190.200.168] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efddfe1sm48392965ad.32.2026.07.24.02.02.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 02:02:27 -0700 (PDT)
Message-ID: <cce14564-9f74-48d1-a18d-8db6a265b7ac@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 14:32:19 +0530
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/10] firmware: arm_scmi: vendors: Qualcomm Generic
 Vendor Extensions
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org, Amir Vajid <amir.vajid@oss.qualcomm.com>,
        Ramakrishna Gottimukkula <ramakrishna.gottimukkula@oss.qualcomm.com>,
        Jia Yang <jia.yang@oss.qualcomm.com>
References: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
 <20260724-space-magpie-of-promise-b71ead@sudeepholla>
Content-Language: en-US
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
In-Reply-To: <20260724-space-magpie-of-promise-b71ead@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA4MiBTYWx0ZWRfXyD9hxz4BNYtQ
 dhN34aVFJZb6icvxACTY4d6tVHHw8SJaqcE9oEopjbX11MzK8EjiwQDdZbZcR85pdktHiN3RqgT
 7HW7han67lmC3i77Sy3kqiQbOrNjvrg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA4MiBTYWx0ZWRfX24K6FYG0L2Mq
 HFHRMqjhE0hWxCw2bS4K8SoYh5p9uEh/j4Kv9cb6uukzxanMMwXtpGLiC5mxvaivYT2f2SBd2cE
 9Bhau19NqQeglEvDDSBIVh61nSrX3Trkbpo/EMKoSCjfC1xZpn24orTH8SbWJEC/P7Y51dxAOTL
 ccvhCTSfq3QIXvk+ek8o25sAaRw4SAObrEvQMhqvSodzNUS2XM4zNuZsqSMJHZhuIRE/WDxzRY+
 csvwNMAQGlowecb2456PaOr8PlGjBCTnN/+ab8Q0uZBj0c6L0JL4FHs7nyKyytLfj8YEVQhUXjv
 /JyXDyd4kQ+BqABIlujgxSrL3Qrczr3M340g3k69V8VAiCm+zgR8+h29wGyvRsvU9UeNWPC16MK
 CUrOihiv24IWmhZVFeb/3Si1popfIxIZlH+App2Z1I6jX0xfjg5X8lkT/abbLeXiqb9SXUtLRGZ
 Ru7ckjxcmTH90YtEdGA==
X-Authority-Analysis: v=2.4 cv=Z9Dc2nRA c=1 sm=1 tr=0 ts=6a632a28 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=mBLlwB273A3eCssxvk8A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: e2wnCoQ70d06z9hOjQtfzZqAsPfOyIKR
X-Proofpoint-ORIG-GUID: e2wnCoQ70d06z9hOjQtfzZqAsPfOyIKR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240082



On 24-Jul-26 2:10 PM, Sudeep Holla wrote:
> On Fri, Jul 24, 2026 at 12:48:05PM +0530, Pragnesh Papaniya wrote:
> 
> [...]
> 
>>
>> Changes in v8:
> 
> Yet the patches are labelled as if they are RFC and/or v1, so it gets really
> hard to track.

It was a miss. Won't happen again.

Thanks,
pragnesh

> 

