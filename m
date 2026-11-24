Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560844;
	b=AgZZZIy0Rj3qOjJCj2rBSKlgantOpBl1d93vAnWqYABNZxBePZr6pp2aJrE4CjJBGVRU
	 mYIn2/n9tBQxE59ac57M5inj5HrJMgc996ju2md0b+ZDrIqdUS1+StNvEtG+E4zKNP/3V
	 IYfDgHqrIOTbLObdMxaBqYVQ4iBEnEaUwkdhw/CnwLB2W3pBxQ8uG+tjn7R6L0OakWCzf
	 4YHL8ahqYOc7Zz+5sYFVnGyUv5Fof5BhiThkr43n1lLIdm5IFLP47YxB7xrg/M3itPUmg
	 YuLWaeMs2Mcg6vIZLTbkLPDNjQNlal7//EcRBW0kO78NS8mesobTrks5ORnrUP/tp9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560844;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XMB/Jny4u3WqVurFKRqFAqz/mYflSRmFYQ6ksF+dO8w=;
	b=lr3uedL+1DFWrxzs5q8ODeSI4LNVIknsDtReNPnucD5DZH5RvX9D+S1eBjSfyypwaA+Y
	 BImDrxSktK7I3x/ozAORMBtLuyqjLI5kWVHbzos3hh1wD5hiyLOfvvYVS/bQLq/QxR/vS
	 x9hH8aAUolby9N7r9NzEH/ph2rzVzD4uWl7KJM9pTA7jXqzGfgA/QIeyiNMZKqO/mdgZb
	 smv3mbyWGMrcO8p0seWdUK/ZvtjarGAg0tEpGaUv6dlvR5QB9MLQp1Ws8eiAP6Q+f/HAC
	 P3li8HZQM0UDQ/JnTA04zmjK979rBoV7ueGjyRDaIcdebA4pIR9xyxOFrTr4La549VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cAqieYB9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YbZz7GvJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24D7606A326
	for <arm-scmi@vger.kernel.org>; Tue, 24 Nov 2026 22:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D24D7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cAqieYB9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YbZz7GvJ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMabYZ1654144
	for <arm-scmi@vger.kernel.org>; Tue, 24 Nov 2026 22:54:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XMB/Jny4u3WqVurFKRqFAqz/mYflSRmFYQ6ksF+dO8w=; b=cAqieYB9PYXK9wiS
	seI4bz/T3gnzW8qzi+yuIyLTRs8jAWSgvmQkufQpgBtfBxkLJFk7SIYbHC/xsbok
	jh6Msd7xe1jvC8KyRKH0EsCOkm2u/14MD8HOm+mw7+B4PmlzwW/X0/FyPswwznvp
	M8uZnBAla1Oz9CrtXeu8hrpOZjFkwfd6NmyFCv+xR2xqzcaLH8v1obEaeWIhYvUv
	huLrIDBuYIKdcJzADv3LtdMzcx+1GC97fgBodl2R8ybzthWXaY3xPDXtiLTMhJT/
	5kjNwI+SApe9xU0IYz3pjwelPKJZDQeE7CuMeJkIa2ky+jd71nh0zPMylHIISVoS
	5W3eYg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eyd97h7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 24 Nov 2026 22:54:03 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so5959916c88.0
        for <arm-scmi@vger.kernel.org>; Tue, 24 Nov 2026 14:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795560842; x=1796165642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XMB/Jny4u3WqVurFKRqFAqz/mYflSRmFYQ6ksF+dO8w=;
        b=YbZz7GvJaDPZrq6KVAf2P/gcD178BFZ7Cn2ik+SCe4I+I9fPkXlbMKKkEeS3sdP844
         IZSNeza/MBTGQCuYiR30ZfoE9QpniiucU3kY+tSJmDoBjdtpsozdrvobKM9006wY8/wH
         ImwM6xsKXJHLXDJaxrSI/MfYmWkxemq/h6SqXb4det3DMk3ggoFDYP43t5cVcBJZGJY7
         4lkGPwqvSpNWNey1xg7u5jXcz/4SoJ8BA5L0oBSKWPcGemfrqdeydry8LQfGtJwu4ak+
         x9aqsDJ5oxcZbNsgk7SszzpgrTj99ZPnigGyoJHez72TPaf80IVZjrm+G34Dg/qo3+RZ
         x26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560842; x=1796165642;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XMB/Jny4u3WqVurFKRqFAqz/mYflSRmFYQ6ksF+dO8w=;
        b=HcvpRW/PseeQlETpcyXP7PhP3R8X0/egvlQr1DPyZUFwjFR4yl3svTdi8jlfE+SOPM
         OehYDBiJPWr3NTWHO3L4vwfU6Xx9WacChZvUrxj2+Q7xYeu7mCrM8r6Kmd0sQ1V/qcY+
         O8x0Rd4A0j1oV8sdMbBNHvTTkbn3icGob0DyoUPbm7lhxYdPQ3Lx8gWsNHHrRNrEct5r
         fLN5oAbBQt+NvgNA1pspUwP+p8Ko8BfNbBLDm7XYCy4bRMxdDjTmifd8neU9Fkph6C87
         Mz8CqoIJTF6/BPY4qGH355SA+gpxVe7pfh7yjQYR+fZrcFebPkJbO2E1A5QbvPwZbe5x
         /7MQ==
X-Forwarded-Encrypted: i=1; AL+hErEzXfpMhDXj94878vvXZ2PYuv2dlx1tl8QMQFT8hW17gdVzB4ADHF4lQTlCP1RewOdmN9GUHXcdyQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/LtiyFDVEE+VDMG8QCwrVVVmndP55Vby3Y/9Ioi560q5fXFfMw
	mPPgI40hn46VFHPybNGlhXLjoaSjYxr+oBpNFi2pps8Np/X5g/SEJT2Yv9sKbBbrogJOeGAnWxa
	ifLijZg8jzUVQk6Gvruh+48PcNU8TUUKz0PmEyYPOz15eiOhgPMynLT1VLJZ+eg==
X-Gm-Gg: AZFdTZdcnbqHOJzoILCjbNIagYzk61/fhneZ/Oc38+3XoP9RhyBlOQFrS+HWV5ynsFV
	kupvX4mZVKVmrI/cVSQyBTG3cY75cBhE/FZbE9w3z8NIo3sauhVSUWKhstc8rZ2cWi9xa3/s1j5
	g/78cYUjTO5+hKbLPBHr8CaFF0v2SHw3wNWnB4ScZdM3AMrrVOqfB8x6VNV3Oz+GbKyO1vSF9mU
	v4Tg1GBnIvRfVrNdR/aDqVwK4Jzmt7nxthOkogZdNUDrgVoj/MG6faEoKRuGcSYbzRokjgknrlp
	UUG9uZtLbka6R1VTkBoF3PCK6jEL3Px5vpj5D9oIKKj6EyXS5uk1XZ1ri5GcA//but3dhCXn1oz
	GJ3I7T+ox3zL2dqXPudkYgrxb+0idrGM8mIhizdiAOqSuHOy8yrPt/4pEUlhWPUNg6RLjhHbZr5
	/r7Cv91/7etBhSNLiN5VQA1D0X7GI=
X-Received: by 2002:a05:701b:2817:b0:1b3:aceb:b8dd with SMTP id a92af1059eb24-1b556911012mr15571058c88.38.1795560842366;
        Tue, 24 Nov 2026 14:54:02 -0800 (PST)
X-Received: by 2002:a05:701b:2817:b0:1b3:aceb:b8dd with SMTP id a92af1059eb24-1b556911012mr15571016c88.38.1795560841728;
        Tue, 24 Nov 2026 14:54:01 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm26179110c88.4.2026.11.24.14.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:54:01 -0800 (PST)
Date: Tue, 24 Nov 2026 14:53:57 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v17 00/34] Introduce SCMI Telemetry support
Message-ID: <20261124145357.00003e9f@oss.qualcomm.com>
In-Reply-To: <20261124194841.1147072-1-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA5MCBTYWx0ZWRfX7DLHr+Zqarfw
 AyyucYHJuEO3WaJpoxos/JQEJRRdY6CcGsdjK3/E7GFpqXGOi2OkBvye9Y8610kP24GnrG98CXs
 4kQroZ+ZMbrkZAfmS8b2b/wMsI8PVYE=
X-Proofpoint-ORIG-GUID: Bv07FTO-FDDf-tEcB3YmaCj8428PRgPf
X-Proofpoint-GUID: Bv07FTO-FDDf-tEcB3YmaCj8428PRgPf
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b06158b cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=7CQSdrXTAAAA:8 a=FV59EcnNoF-tUHG6_8cA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA5MCBTYWx0ZWRfX6ZRKGuFPVebA
 Q92SHkOdTX6x7kSnpJQfezqd7TvrX0gU7MVzO+NDb4AEavRevewia9Ayc6UNnQpl7gEbToY4Ise
 zRdSq/36MU3ocAXeCTNAeEmVF1JL0ZSuKvR5B+Bs5wlgtkPeQSXh4Wv+9sKpFIdwG7bbg8i6+/4
 MLt/hEDaCCkedyXPC6eWLebdcJ73caulwJIoE54JfOTLonmWi7LlO/TcN38u7AQcXNnAaHe+ZZF
 uuFKjiL/z6RWL0zKCKLEzxpXj8Tvv3XTJrLaRt1W/ipzEBRV/D9lMZFwQyc/d5mhKTegapTLT4E
 zdtuX3/XQUiu0huwwWTdt5BAzZQc/Uhzye6CVf3/BV1gDhm/+kSR4Aa7jn5XT76/H+N/JlF8GOJ
 WycWZidQQ3TlvR5m5uV6QgtUa4uVkXpePRzPHtOZGFkFmJ3TSAcLDZLYrD4FGPwPi8Pe4ePlojv
 1IfLj3B+EpKYwLzMsxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240090

On Tue, 24 Nov 2026 19:48:06 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Hi all,
> 
> [TLDR Summary]
>  [V17 highlights]
>  - addressed more Sashiko reports
>  - added a few more SCMI Core fixes that ease per-protocol logic:
>    + added more consistency in the SCMI Core Iterators machinery
>    + added centralized check (SCMI Core) for truncated reply
>      + Reworked some SCM Clock behaviour to allow for truncated checks
>    + SCMI protocol core initialization refactor and fixes
> 
>  [V18 TODO]
>   - address any remaining outstanding Sashiko/reviewers issues
>   - address pending human reviews feedback
I'm lost.

Does this mean humans should wait for v18?  I'll assume not and
take a look anyway... 

Sashiko is moderately easy to run locally as long as your company
isn't too restrictive with tokens (if they are say upstream folk are
complaining and ask for more!). Might not be exactly the same
as the version here but will reduce the noise and versions on list.

Jonathan


