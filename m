Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466C92E03EA
	for <arm-scmi@vger.kernel.org>; Mon,  8 Jun 2026 17:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780938408; cv=none; b=f+/W1LoO0H7zpch4qZ//66qepwCLsSoI3VFZaKh+PFUpkY4hH2F96lJ2zE6w5MsBFd/2ne2eMRHGYlUAcc3a8fsZFO2qq+4gFm8TXHikbnDlGn48pLqgDG2rg2JLASsEKkMIYdQ5Nuu7C5CcWHLcNZUzXcexxTd+j93nzC7uWJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780938408; c=relaxed/simple;
	bh=N5vHVsvL8YAoqMjaVvSpGZHBZeZ/T6TSTx/KB/pKTes=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pyovi6WtDZDlX1NqNVSxkuhHB//sH4MZALk21WVCttGXyg5+qJu1JS7ouPg56BUUd3qyn8TwEDmAebFu6TSvgfh48AWSdPvAg+SUiYH0TZra8qJrT/3qlqfT/eaTLeFsOhHO5O2ROsTs3eNfycQwMTpeimBcyRcTvF5px1zHzmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MJszQfAH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M7c6t140; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MJszQfAH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M7c6t140"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFS154008425
	for <arm-scmi@vger.kernel.org>; Mon, 8 Jun 2026 17:06:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xT/zeOS72re4T4ULchYM4x9R2PdBDBD0TzXisULHajY=; b=MJszQfAHl0sGcgJU
	kW6ZGOW+B/2VIe/kmbP2p76IgtjV1sfutjgnwmirgEIYITZUQRxlGl7gXA4B/05V
	PQJ2bi1dwIsuiUAMdLtvBFnXOWIMCi/JzqAqtq63+xG9mt/d/va4xTZYxWZyoqAc
	tRn52mbPO/W2ff7zWgn2c45pf5Jq26u0j8HK4dF855RAvtw7f59tyZJ9pF1YFwJ6
	Dc7QZ77AvJR7egVufXSkE0tDn3qwOlBfmqeI/ASrN6Q+1+ySYLze+ovld9k0ygrV
	4t/Ua+i1qHOpKYuZxx9aLdy64+ZZid4NgcOWymdqNs3YNe9BgSS9qOUPGN+QpO5d
	Psdo0w==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entr0j8yj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Mon, 08 Jun 2026 17:06:46 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-59ec5a8fed0so8420993e0c.0
        for <arm-scmi@vger.kernel.org>; Mon, 08 Jun 2026 10:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780938405; x=1781543205; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xT/zeOS72re4T4ULchYM4x9R2PdBDBD0TzXisULHajY=;
        b=M7c6t140sPbVVEqJ7RAMSWwuw0kFpqFcgHAOgoeabRuBUcl2qio1oChvkYJIjFKmiU
         nuVTzavtOWOqaEA6qcfXrU8Zolj5kusNEGr1pNYP7AUcg+cO5k0/BoFSOPbTW+1O1lbS
         Ztud2ElvEYzMAa5IF3SRDAZ7yeNik8+JPaTIDIhnzuwZpVVYh/UzvXNKXEvDBHvNARBy
         hUiyByKjydMyA/ynweRKcayhZTwyN0j71tOcp0ajO1MN68PYrLMKG0SBq9Q2Wmpinag+
         Jhgtxeh6tRjkZrp5F9dpsrkHzYRv0QLnxWcj2AYZupZ2oly/I14l5VTVDYhVUDVVa85t
         DS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780938405; x=1781543205;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xT/zeOS72re4T4ULchYM4x9R2PdBDBD0TzXisULHajY=;
        b=Ih1hvLCU37H7Xb6nh7qt6KOyEQdEgzeVCp3Ppr9Y5DlYl3A24VI+kI1JahZco6TI2+
         Xph5qXckL3NHYfOR448dGNtPsL9aeBIl06sEb23CoQytFNV+W42eBMLcfl2dhoJD9qk3
         bdHIQKRcjabpj4CfXc7mJl18k3RCZvCb2rAuIm+XIZYufvqMV58z5JjKMi/KFVO+4VJS
         Jsxe5hygzH8lepSqxsHNxbzwAhXwCgoCXlS5nivxDHu9hRsII+hAIuAmdeDav/4mqwXy
         zS1CO7uxDYO2JewTX3VtFcYTgqmel5/lKMLKTsQ/Y1KwUnsFx3Jgf2S/+07p6piS0MMI
         7ggw==
X-Gm-Message-State: AOJu0Yw0Vr7M1wIvi7JIeWHloWmd/ESaRNWUveadC3FP91LjWzDg+NUy
	GuSG2NrqFo6ywJiDwP0ISo/2pfYtHo5ZeU67hYQpPUNkD8oC34mihB+MBTKaQlvRpuEqck5j6/A
	bANqhIkMFl5GxmaKmUZBxBal6OZX7zn0Rt0fXKvIO6g03KVLVp8kq/IY9HgE/6w==
X-Gm-Gg: Acq92OEBqtiNcER4vTYOyZ32gzigFjBNhkMIz7IEANd97mORK3oLWU1AYLzkun0h3zO
	2aBKbWrfrec9dVM2qEY2Gg5tz2NrNj083qVkSiHdzlkRXhRf/KkKRhip0+yUUR1Jd8w20zO0I6e
	MBRHOJGM006ZSTjsywzP6f65FF+EJttrPts/k6q4aNUUyj0ESJWf4ecjELkr8j98T9+2qt/l7cl
	/XsecSUz7+DSZWTanp9Nu/TW43xwMJZRGASqahJYXiS9Am9SIDJmnQgzJtWEp9bASlqkLQPhTmc
	V5XvEAYuXFCuqp6ZNmqe+HuFZhLHG3tGD/W0lRXZed3rKhs2atxj+3lwfEAoatRmEZS5/IEZ0JV
	sgHFr9BkzIBJX32oNWewmuu2lYB2GbzokphNSuhf8AgkiN3Tn0VHrvi7kK+pXKkRPWfN5SJBGB0
	egbaifSYhFLU/cIX+uVW4=
X-Received: by 2002:a05:6122:c94:b0:59a:7b23:16f5 with SMTP id 71dfb90a1353d-5acd5cf1c67mr5070401e0c.1.1780938405414;
        Mon, 08 Jun 2026 10:06:45 -0700 (PDT)
X-Received: by 2002:a05:6122:c94:b0:59a:7b23:16f5 with SMTP id 71dfb90a1353d-5acd5cf1c67mr5070375e0c.1.1780938404904;
        Mon, 08 Jun 2026 10:06:44 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:2c9a:9b81:ddb8:1d14? ([2a05:6e02:1041:c10:2c9a:9b81:ddb8:1d14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc413adbsm411951625e9.15.2026.06.08.10.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 10:06:44 -0700 (PDT)
Message-ID: <256c182e-a093-4bf5-a353-ca5c06eff489@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 19:06:42 +0200
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] firmware: arm_scmi: Add bus support for
 autoloading
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, guomin_chen@sina.com,
        linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com,
        quic_xinqzhan@quicinc.com, sudeep.holla@arm.com
References: <Z6CNWOp8B_ghIrJt@pluto>
 <20250203100154.140877-1-cristian.marussi@arm.com>
 <20250203100154.140877-2-cristian.marussi@arm.com>
 <aibW10NMmzw3QnZ5@mai.linaro.org> <aibzLcZiVwtUHAgV@pluto>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <aibzLcZiVwtUHAgV@pluto>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE2MiBTYWx0ZWRfX6bO+IQuUtlRo
 dnqoDXSo+tdcQ7pA5zV/lFmpuA+AK1wuGcNkYYwF9V7OdO/hgTgy/WluBb6/xYk51UcFP5zJRM+
 xbDxgR1M/TQFsR01+zT/H7q+EYAOIYrPfdBGM7O7Uzfp/Vm73mAtsfIEh+gEOIXdminAqWAncpG
 Xx0n49YceFqc4yMXIxrsli/lFu+joa4hIOC1GB7IczCeSvgowV3RzYR2CoDB7bDhsmabNVNVYH+
 la+jm5oLLOiL0uGjX3KjCZ3AbDByZHJf0uJgD30Em5+hFcWmbC94PnjrkMv6FMgYjBrHxMQ83dH
 L3A4FD/Ap0bwwDXS2h4yotzW7HswAjefiZQVF5gGtwJtkZCjOU5lV4YsG2TQbglKoJNu4V5CsXI
 3PBVrZuxnV/E+CWW5/fZNWKXcH+7laNzosImxH9wsK4K1gxv9gfa6ZdMRLc+z6JAjc+c9xau2mo
 dGVHqUyQkQ2YGzKwGyg==
X-Proofpoint-ORIG-GUID: a2jOz1XMuG6KGSj93Q8XDjDwJjJi3B7O
X-Proofpoint-GUID: a2jOz1XMuG6KGSj93Q8XDjDwJjJi3B7O
X-Authority-Analysis: v=2.4 cv=VowTxe2n c=1 sm=1 tr=0 ts=6a26f6a6 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=7CQSdrXTAAAA:8
 a=SzbdiQ1KgPcw3MfRos4A:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080162


Hi Cristian,

thanks for your answer

On 6/8/26 18:51, Cristian Marussi wrote:
> On Mon, Jun 08, 2026 at 04:51:03PM +0200, Daniel Lezcano wrote:
>> On Mon, Feb 03, 2025 at 10:01:54AM +0000, Cristian Marussi wrote:
>>> Emit proper MODALIAS uevents when SCMI devices are created and make sure
>>> all the standard protocol devices are requested when the bus is
>>> initialized.
>>>
>>> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
>>> ---
>>
>> Hi Cristian,
>>
> 
> Hi Daniel,
> 
> nice to hear from you in the SCMI land :P
> 
>> what is the status of this patch ?
> 
> ....I'd say forgotten/abandoned...I worked on that a bit when I realized
> only part of the stack was autoloaded...then it did NOT received much
> love and then I forgot it....buried by other prios....
> 
> Indeed I have still the local branch...but after a quick check I think
> is the same as the RFC posted.
> 
> bbd14b0f7733 firmware: arm_scmi: Add bus support for autoloading
> 8d982393b505 firmware: arm_scmi: Generate aliases for SCMI modules
> 383c127faa97 (scmi_vendors_autoload_V2) firmware: arm_scmi: Add aliases to transport modules
> 00caa894bce2 firmware: arm_scmi: Add module aliases to i.MX vendor protocols
> d900620c46bb firmware: arm_scmi: Support vendor protocol modules autoloading
> 4fe57bbeb6dc firmware: arm_scmi: Allow transport properties for multiple instances
> ad236e5a7f01 Linux 6.13-rc1
> 
> ...where scmi_vendors_autoload_V2 is merged already...

Actually, I'm puzzled.

On our platform, until 7.1-rc1 we had to add a modprobe.d script to load 
the scmi_cpufreq driver because autoload was not suppported.

Now (7.1-rc1) it seems to be automatically loaded.

I imagined the autoload module has been added between 7.0 and 7.1, but 
the series you are mentioning is from 6.13.

What I am missing ?
