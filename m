Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC4F16A956
	for <arm-scmi@vger.kernel.org>; Thu,  4 Dec 2025 18:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764872742; cv=none; b=IYemCReX3C3LW765fzqCf59aq+UWX/m2JKRmSY4fFTt00b7d3Wns9x3AmR8nW7E2K+o+SITvuiWtGu7jUbzFQv5rpxCYTEGR9aPSw234Rxrit3lF/r/cQWmgT7BVyRbtzuDc5QX6MrKqzBqkFVjqlOK2CI1XKtNovxL5/JN9u48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764872742; c=relaxed/simple;
	bh=IhlnwTUuu94mYE5+7gwV/b1e4+P4DIXzG48bpME6e84=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=L/Tn8hgkXowM5BhpL4h7I6AsEyec+DQ+kXcvPRB9JnYCfLjxOtHH1eMpxUwjvfsbWCE6/WmvQ8qJwPQVTPD7fedu+xzYmPj6LObQlHnbOcQ5G4RLhFkAol6h15wkCKII01vNl+qL8chZN7TLtT/Swtx0Y2aMKQlU/4Y1S7zlnW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dEwyNu6T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O0u5dMgW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dEwyNu6T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O0u5dMgW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4AEu4f926199
	for <arm-scmi@vger.kernel.org>; Thu, 4 Dec 2025 18:25:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IhlnwTUuu94mYE5+7gwV/b1e4+P4DIXzG48bpME6e84=; b=dEwyNu6TfJKZIWmZ
	Dkg2OteskjpjAd0AcRwZ1j1TmSdP2h95zStnJSTJka3ZZVa7AyBgQ+luS/HYv96u
	SHrswjC8yskQTUhh1kVhLnEwtfyyFzuDthnu3CO8cJZja6UDZXGba2ojgHkTcoSJ
	fy3CuIxjSWou6MXZr2TexSFr+bxqkyGoaYX/xjCapXmTtqoQIKU+4Ezz9ZxXPCBN
	aiPyfVRKeRcDiBZR7jtcnEOWgSBDlwLt5xEEjjvmC2C1503wKO1z8g3y7OpRd1dR
	I/6GbgHJ6sjds0p1LMWlAx1Xd3ZACo37Vtfg+opLIDlp2OzjiguWR4lm5p1HCZCg
	Jj2McA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au5m321xv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Thu, 04 Dec 2025 18:25:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2657cfcdaso166975285a.3
        for <arm-scmi@vger.kernel.org>; Thu, 04 Dec 2025 10:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764872739; x=1765477539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IhlnwTUuu94mYE5+7gwV/b1e4+P4DIXzG48bpME6e84=;
        b=O0u5dMgWJ8hAoVIopNwFyL/f9iKYzCI6XgxoVnKYzvmBuoCoCKPf1wrKiAJDKl4pZi
         7UJ7pCHwXjl3EvXlZ0veAYoaD9pz7CdcQf0X6pcdZAz1E/Sch+HdXIi+LVCuTxJeclUz
         2BmutQl9wTQei4/fhXTO0dfI9p9jk+z4ik+Lrj1kH6YDVCjeLg54tVync82Bm54I0jjT
         fupJ/oSoZn7UVVEBF8M32hojrIjGmcByLwr80CNMN3P/Mnzg0aliI+LB/9cX222zPTb0
         L2kgROo3E9mJ8IvUffCuGq6UoYz992anUpQ4BgD+xM9H5ZQdw6GxfkeaI84MZo/VA5gc
         YyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764872739; x=1765477539;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IhlnwTUuu94mYE5+7gwV/b1e4+P4DIXzG48bpME6e84=;
        b=MIVB52RndBxcKQCMHp8Gh1oMAh1L54iv6gWNL0MDTgNcEKDhHTqDDeYoh0m3cOaekT
         EImZppIxkpzNejqQw92Ba7fkS4Bn1QtB88iOC3EKTLnzHIXAKe9kJWqgQ/egVxk/gVmg
         /T9Gdth4O80nZd+ykk2Bkt5WbD9/vF0UfZaIoWFw058yPtbP2UokHW8EsEqcOPvuAaTa
         juIGv75btDLM4tRi1Cuk60F+rMt1Jh7p7At88O2BX89K4/t8YJ2yOVa7i2xQ9aQ2pnyH
         /mUVFxMxpMmjRnI4JQ8OARMLtYrFAoFjI2t4yJMuXHjtggSy2GSJwqrev0Oi2vyVGMuz
         KeQw==
X-Forwarded-Encrypted: i=1; AJvYcCUEtyizjueenqfwZMBZKqpiQBKkbFjJVT8qcTWJM+FBKPXDVnSwuTVa9Dwikjn+i85gmLCIjqv2QA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwm3PK/rEJq4FKNVks/aXPHFGMkweeNq+29tL2j1vudSUoB7te
	3+eWlpZ+CN0tTYnHF7+Dz5kh4U4b95O2zQcmMRe691QISDt0EpliRPZgsQQY1TmhGxJ1qHFz0js
	27NHVkg04ioomPU8kaQF2cV+BSkkGbCrWCoeFOlD63BZjJn9t4uWb9hzrz3vx+A==
X-Gm-Gg: ASbGncsERY2EzqEaD4744G3P+Ff/wYHaOt5qcbKk3ekvceU++xF7PlyCj32rSFEslUa
	HYBUmTaH1472bU6XYHaXhigN3PQ6lymsLgNmhAzTjvWOTyrnXeHV4puQ9/r9B1Ye86tppuk8Q+J
	XxPFmonK+VAH1FFiV7v6O++Z7pf8EJ/G7CAa5qwSlVbsHrvg9dLK5+6XXPqFv1HwQ3ZzgOa66bZ
	V+ehE9gek+B+b0fh60fwNGxIjO5siUKTTGhD+Qyw822WmdJYmVnXQ6VSYkPjCWwL2jUz22gBKzD
	2rK6H+JJ75FmqsDzymqsvcBUv3AmCBYA7zgQE9ahv5o6F1x+DsDgqb/FjrAzN3Ac917tN0MKlgY
	JHAZqGY2uR/WAq/KT3YaG0auB
X-Received: by 2002:a05:620a:3720:b0:8b2:a4ec:6f5 with SMTP id af79cd13be357-8b61817302dmr505912685a.11.1764872739030;
        Thu, 04 Dec 2025 10:25:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5aWqiaetsamvKNgp+D6pbKGjz3C7s4SQA1ECEYT8J6MJtch66K/7k9GTaanXbvz9dZojKMA==
X-Received: by 2002:a05:620a:3720:b0:8b2:a4ec:6f5 with SMTP id af79cd13be357-8b61817302dmr505909585a.11.1764872738552;
        Thu, 04 Dec 2025 10:25:38 -0800 (PST)
Received: from localhost ([2a01:4b00:b703:c200:1ac0:4dff:fe39:5426])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42f7d222506sm5214118f8f.28.2025.12.04.10.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 10:25:38 -0800 (PST)
From: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Punit Agrawal <punit.agrawal@oss.qualcomm.com>,
        Cristian Marussi
 <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/8] firmware: arm_scmi: Refactoring and enablement of
 ACPI PCC transport
In-Reply-To: <20251203-super-kagu-of-amplitude-fef078@sudeepholla> (Sudeep
	Holla's message of "Wed, 3 Dec 2025 15:21:31 +0000")
References: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
	<87wm44aect.fsf@stealth>
	<20251126-camouflaged-delightful-cuckoo-ddeac8@sudeepholla>
	<877bv3n7x2.fsf@stealth>
	<20251203-super-kagu-of-amplitude-fef078@sudeepholla>
User-Agent: Gnus/5.13 (Gnus v5.13)
Date: Thu, 04 Dec 2025 18:25:37 +0000
Message-ID: <87h5u6ksta.fsf@stealth>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: c0q2oFwcXeqbsbqIyHXau4UEWv2Ja4Jd
X-Proofpoint-ORIG-GUID: c0q2oFwcXeqbsbqIyHXau4UEWv2Ja4Jd
X-Authority-Analysis: v=2.4 cv=esHSD4pX c=1 sm=1 tr=0 ts=6931d223 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7CQSdrXTAAAA:8 a=0Dndub6nNIkmeintA3sA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDE1MCBTYWx0ZWRfX9mnP7PBWs/fC
 vuI8tDexih5fF3fJRInYRDHKNPUIQ0P3CRJE1HlKfUKgI57483mOsJRxb0NjJt6jY6DxbbUZWg5
 ZKysT7LDaz6yeQ+x39sijJElNHlkq/FaMrmZKRKHaI6IAVZ7XpAcepLBFQN1aNSd7RCSQZs3DA/
 UngA56NAsVGwZXI/j96448FA/F38nZDqw+ppRLXNg71CycQdnrHInhfZrGfp9maJQwAPdZIoDQk
 eR0/x+kDVwWcXw3nkV9LKsGHqR51Zq8/gqGiiPU1VDhX3k9Mdq5LotR4TjdZEpI4mqjXYLArZqm
 TYK2muwHkZ1rzfxEA5+bcaTZ7GSMXlnFkUZgU+0gbd+QLGINCtr3d8+4HR+7GBd/pIZKSDxMM7k
 EI27Tn/OmDpbib80raBZOnWhfHAOSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040150

Sudeep Holla <sudeep.holla@arm.com> writes:

> On Wed, Dec 03, 2025 at 11:04:09AM +0000, Punit Agrawal wrote:
>> Hi Sudeep,
>>=20
>> Sudeep Holla <sudeep.holla@arm.com> writes:
>>=20
>> > I can create one but that is not strictly necessary. As mentioned in t=
he
>> > cover letter, the only dependency is on value of SCMI_PROTOCOL_TELEMET=
RY
>> > ins `scmi_std_protocol` enumeration. Just add one and you must be able=
 to
>> > compile the series independent of Cristian series.
>>=20
>> Thanks, I managed to get the patches building. Looking forward to the
>> series progressing. If possible, do keep me in the loop for future
>> updates.
>
> Sure - I=E2=80=99ll try to remember to copy you on the next updates. I do=
n=E2=80=99t have any
> immediate plans, though, unless the spec moves into beta, changes come up=
, or
> someone specifically requests important updates that would help them make
> progress.
>
> Do you have immediate plans to use this on a platform ? Or you are review=
ing
> just out of interest/curiosity =F0=9F=98=89 ?

Ah right - although I'd read it in the cover letter it slipped my mind.

I am hoping to migrate some prototype code on top of your patches. Only
worry is if there are big changes planned in your patches. I should be
able to use the posted version for now.
