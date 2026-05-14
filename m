Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6833C1F46
	for <arm-scmi@vger.kernel.org>; Thu, 14 May 2026 11:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778758914; cv=none; b=pQ4qzWAjQkot5Yj3aodr8BnWDmnM8RnaAV9EAEtV0RvssCR9yJEsiKEbejlzK0cJH6QKOuhTIBnaJf4JjwUIbTYB7J1Z6YWhuc8HK7x3GJssU2DdAazmGsRW/kPJu1hJs35cr28/W08neaaRrTbPoDtND8Ed+bQcW2hDEdpLm14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778758914; c=relaxed/simple;
	bh=ZBNju30QtNx5PO3WA9oP+jix/lPYme6w15d21uQ73ZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a3VfWToq/sGS+/yQAnXF3+MyGjTy4P/fuUII950YD7is58cwAnNtM7kJctU2kIa1GxgOA6X3jBHVohus0AFX+aLJ8b6MhaD5KinbY58yJTCodIuMnUVceKiEDJQ5oNH3XB9teW40iDID/3Mq25IaePusLfC/mJfTQf30TxodwLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ejb/PgHL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LdQQwjTB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ejb/PgHL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LdQQwjTB"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeUFd3048540
	for <arm-scmi@vger.kernel.org>; Thu, 14 May 2026 11:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XN/svW0Jt+ncyOKlvvxZnVvpxXsVA9QC86tQ/FOEaIY=; b=Ejb/PgHL4Hh2Pyf1
	vLHN+/6ozUtuCdEpQMd9u4UOr8Kh5EHOCzn0MwqcUrMfF1KY1DfwLwQhvf0fOBmN
	K6qz1qRJQW/7HIfhRTqWXWJ5l5gxw6liZbpJ++KhhNssFQtj5lRz4rVOc65s67+U
	0NaDXs6dqMDYKSqJv2uUmMm4mbhbzHh7B2GIt/o7xyfoYxvUrnnaSkqy8TebPwrr
	NRFFRA/QI8az8+s+YIP1egAr53LTgGu1zaUkg8O8OEUUIQmq3qPBbsvqhUO6gMAa
	viClD+QsJeoZkuQrhA3ljtP3LhvZU/FSFnNWYUFgjq4kldA2KaspJpb4bn+/taxc
	b6ubig==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5492sxfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Thu, 14 May 2026 11:41:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b4654f9bb6so82254935ad.2
        for <arm-scmi@vger.kernel.org>; Thu, 14 May 2026 04:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778758910; x=1779363710; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XN/svW0Jt+ncyOKlvvxZnVvpxXsVA9QC86tQ/FOEaIY=;
        b=LdQQwjTBY99PS7PRR2fzAT6vDV1NnXzljcDZBccZWK4qkRX4JqkmmQuWsJLIcpeN2G
         OR+hRXxkaRYJaWCIe7sj3bu1wfO1zqlMKFtaAVAmoGoX7plXDHCbNk/sXrgV6fhF6OYc
         YnFKh/jB0sax1hjV/1Q2xv9b1UflGWwISb5iYOnt+AuytEGU9wRjAawp6sS4Ku8yG+kj
         OFLAMuXeIwIfTWQzS7gwzfEC/Mb1ObYfvq1zgaerppW95nDpeysF4AT8hLRfDxKrirEv
         iU9QOMHWrMoiHws4O5HR/01z3qtT0dqjgJ2K5BrWxuqG3J8Hkw33gqDbOKbbqp1j3s9o
         T2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778758910; x=1779363710;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XN/svW0Jt+ncyOKlvvxZnVvpxXsVA9QC86tQ/FOEaIY=;
        b=l+YI3LhSKNMo2WkpeivZQYcRn69k/Aeysh+LiICuV7KeU5OPbCE+Kd7NATbwkC41LE
         NuHdAnY8MW+UgKwug0y50lk/tjIWrK5mj4uSP8sMUSlkZBFSAik3dmA1vS0nldWuiN21
         h9q0ASYwSL675+arx0g7a5jqSkCBDm6WIdor6eLXAT4iEPvdSJdC+ubXNteZuLk8gCAj
         eHFWxVSM5VltjaB9VdfkvgdFl8euE3h03DJ6XSMtaehmgtfFMP1RR10YTkauJZqWQvvc
         XZbarFNsJiHxFL0/CpOtt748HyjgJ74/ZzrXOBkCK5YdgWVgGGFp+8CuOoabt6QgjAoU
         NxqA==
X-Forwarded-Encrypted: i=1; AFNElJ8kK0qNsIkFAUTI21QprgFmUA9/qOrI42EFHu/EOLYxjQtyUATZqeDWukH6H+uThcabrjrbUWqs6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1wY22No2CY3mClOsmqQXt8pFfu+fnC+Mvw5oZqlevB9ygjZ1P
	YbdLVenU81XnUotfiQ7JQACcEnaqWt7nGBtdaip6M+QY4NUoJBJuoQ6JpeNUmor4952d/v9eQ3T
	Q2O+qHja35ZVjv/KEVkuJ5DEm2zO34duiiJtN/P5J+AAbSQXjWw25sKl084wVGA==
X-Gm-Gg: Acq92OEIaay2dAV7BWcND9lPpqKLCbXU5ZHjvV7bAov3Wpm5B/eafiVnRuKA76xVMdU
	rORa3UTP0HNxzVlmdK+J2uAoPJ4ccpcvCarL61ytyLZ0JieLXzCw0jaFKnrI9MKYkixbE9Wi9Fy
	8gT8bZPcGUTNJKiJlsOVqxRwOhdN2Cxnt8YEcKhfTdnxv4yyHRc22p2Uu6+iSnAOOIVwD4f1Iqe
	jqqtpOvSd9Lkub6A5Cm9Pz7I3QUu2QY2ioXIiQErbZ91Mm0mJv8JJDIkiFAv16wk4y5toKXcc6w
	FXGzSsRrxwesnZvSLVXTsV/wUYRuk0Eh/oZx2Qd88P4cHrtoih2mGHBPjb7TL4VNoTq7pLajjy7
	aOgNS7r04crKm/WLsdbK8MMGAETDEBuq6ME3iQmM4XgcHYGT3T1fa3rXzfQZ4oi5OvonxoVX5L2
	rVD0E0TLu5QEW7UnqwNnozeRkdgzApn1s+9qyD1dE=
X-Received: by 2002:a17:902:f54f:b0:2bd:7ca:e67d with SMTP id d9443c01a7336-2bd276dfda1mr85598245ad.29.1778758910268;
        Thu, 14 May 2026 04:41:50 -0700 (PDT)
X-Received: by 2002:a17:902:f54f:b0:2bd:7ca:e67d with SMTP id d9443c01a7336-2bd276dfda1mr85597715ad.29.1778758909638;
        Thu, 14 May 2026 04:41:49 -0700 (PDT)
Received: from [10.190.200.238] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fd384sm24879805ad.65.2026.05.14.04.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 04:41:49 -0700 (PDT)
Message-ID: <5494a379-1e49-4551-a5f0-50d0bd7cd7d0@oss.qualcomm.com>
Date: Thu, 14 May 2026 17:11:41 +0530
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V6 0/8] arm_scmi: vendors: Qualcomm Generic Vendor
 Extensions
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        sudeep.holla@kernel.org, konradybcio@kernel.org,
        myungjoo.ham@samsung.com, kyungmin.park@samsung.com,
        cw00.choi@samsung.com, cristian.marussi@arm.com,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, jonathanh@nvidia.com,
        thierry.reding@kernel.org, digetx@gmail.com, conor+dt@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org
References: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
 <436ce846-bd9e-45bb-bdc2-d2a0fd00dc25@arm.com>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <436ce846-bd9e-45bb-bdc2-d2a0fd00dc25@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: t5AH5zMOvdCjTHH7RSw4E3qIsVZ_sb6L
X-Authority-Analysis: v=2.4 cv=R74z39RX c=1 sm=1 tr=0 ts=6a05b4ff cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=2dUMNUc8cBhmsmHMSX8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: t5AH5zMOvdCjTHH7RSw4E3qIsVZ_sb6L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDExNyBTYWx0ZWRfX8WXl5HSIf+il
 4Eg0yxLTSet26XThKi5EwBfrITLHeg5e1wBX7Np2Ks6XDzguPyB0Eodpa/3hI6W9rWQEaMJZlJn
 tGkl3j7NgXTKVZRowl/7b1whmLTYlkxpjY6X9nexiNXGtjTNC/SEPYwyNhyLGoCAZ+cdkD8fecl
 FkLr9pE2k9QY8vFM5iuKpyP1LdZMvZEkQui7/1HHjU7qAC8PcDBcJUT8Hi8O/97GQvejIY9ikhl
 Kbsslb8ttzmBkHnx5BDWj8YsJtx5sX4HWeajUPIzan8rYJtULCiHqU7fwINMNw4tpvBf7znkgvC
 pC6pUZ0o707JgYCmAOqDbiX9ODWepi8mXG8JYPD/d9TjaWWD8oqTnAtxH07PCicBLW7P7z4aKYZ
 9egBQNa1ZCSTzmpQoo3n4kygYJL0jVcB87dWnnPCWTfjB/L7tNOE6QKYZMKooNFqSLo1YkIgdwO
 111NBp471TmdN6P2W7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140117


On 5/13/2026 10:30 PM, Lukasz Luba wrote:
>
>
> On 5/7/26 07:22, Sibi Sankar wrote:
>> The QCOM SCMI vendor protocol provides a generic way of exposing a 
>> number of
>> Qualcomm SoC specific features (like memory bus scaling) through a 
>> mixture of
>> pre-determined algorithm strings and param_id pairs hosted on the SCMI
>> controller. On Qualcomm Glymur and Hamoa SoCs, the memlat governor 
>> and the
>> mechanism to control the various caches and ram is hosted on the CPU 
>> Control
>> Processor (CPUCP) and the method to tweak and start the governor is 
>> exposed
>> through the QCOM SCMI Generic Extension Protocol.
>>
>> This series introduces the devfreq scmi client driver that uses the 
>> memlat
>> algorithm string hosted on QCOM SCMI Generic Extension Protocol to 
>> detect
>> memory latency workloads and control frequency/level of the various 
>> memory
>> buses (DDR/LLCC/DDR_QOS). The DDR/LLCC/DDR_QOS are modelled as devfreq
>> devices, with the governor set to remote devfreq governor. This 
>> serves as
>> a way to get a basic insight into the device operation through 
>> trans_stat
>> and provides for ways to further tweak the parameters of the remote
>> governor.
>>
>> Transtat data for DDR/LLCC/DDR_QOS is now available in this series:
>>
>> #cat llcc/trans_stat
>>> From  :   To
>> 315000000 479000000 545000000 725000000 840000000 
>> 95900000010900000001211000000   time(ms)
>> 315000000:         0         3         6         6 6         
>> 7         0        30    143956
>> 479000000:         2         0         7         1 1         
>> 1         0         3       356
>> 545000000:         7         6         0         5 5         
>> 0         0        10      1200
>> 725000000:         3         0         5         0 6         
>> 1         0         6      2172
>> 840000000:         8         2         3         2 0         
>> 4         0        12      1188
>> 959000000:         3         0         1         2 2         
>> 0         0        13       272
>> 1090000000:         0         0         0         0 0         
>> 0         0         0         0
>> 1211000000:        35         4        11         5 11         
>> 8         0         0     21684
>> Total transition : 253
>>
>> QCOM SCMI Generic Vendor protocol background:
>> It was found that a lot of the vendor protocol used internally was
>> for debug/internal development purposes that would either be super
>> SoC specific or had to be disabled because of some features being
>> fused out during production. This lead to a large number of vendor
>> protocol numbers being quickly consumed and were never released
>> either. Using a generic vendor protocol with functionality abstracted
>> behind algorithm strings gave us the flexibility of allowing such
>> functionality exist during initial development/debugging while
>> still being able to expose functionality like memlat once they have
>> matured enough. The param-ids are certainly expected to act as ABI
>> for algorithms strings like MEMLAT.
>>
>> Thanks in advance for taking time to review the series.
>>
>

Hey Lukasz,

Thanks for taking time to review the series!

> Based on this description I have a few questions:
> 1. Why we don't use SCMI notifications for this purpose?


This is an attempt to retrofit firmware, that is already out in the wild 
running
on X1E laptops and Glymur which continues to use the same firmware, into
generic linux frameworks, so that it provides some useful information to 
user
rather than it being a complete black box. We already have a ton of firmware
changes suggested by Sudeep/Cristian that will be taken into account for the
next generation of SoCs, will make sure this is accounted for as well :)

> 2. Is it safe to assume that there was no extra frequency change
>    during that polling sampling period?

Yup, there is expected to be at most one transition of DDR/LLCC/DDR-QOS
per polling cycle.

> 3. Shouldn't we sample 2x faster than the changes that we try to
>    observe?

Yup, that makes sense. Will fix this in the next re-spin.

> 4. IIRC there was some extension in the SCMI protocol for performance
>    domains which allows to expose the stats like the one above but in
>    the shared memory. Why we couldn't use this? It would be more robust.

Same answer as the first point, since the current firmware provides to no
such provisions :(

-Sibi



