Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB39C471CE9
	for <arm-scmi@vger.kernel.org>; Wed, 29 Jul 2026 14:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785334286; cv=none; b=gv0kdxX3DDDHkGv1sLwq5STr//IGT0+TPAtXrsbgGLOJrenYuzZM31NkQjGZLT7unGwu5Yx0bp8RnE2MbobcZs7KMsyf1RwNwzW2dE89Q+NK7w3/P7QNGWbi/mO/NXN9ukjRvfKj+P7VMeKx7hktAIngVP4Eq5OYlxKhQAT2ywM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785334286; c=relaxed/simple;
	bh=6cWJ5dNkfU6cGTuNanaSIJr8htKyMA7t+xWZ+OaCVOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=in3aSXmcz/cuBGeVMmc46Hw9BWhcWXaZAztpyP7US3/DHNlhf6txApfFM0k8V1hxd4nf3YczVEgaC9pLleRfQby6oUeU3Rubnq8bZ0BgwGI8tfy4+2bVi5wjd6gMIleoYks1Dw7gaucX+psVfpFmYc2LigXJfL6YpNtYLZzkChU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h6nm73Xb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SiJ7mgVa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h6nm73Xb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SiJ7mgVa"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TD8U4N2062554
	for <arm-scmi@vger.kernel.org>; Wed, 29 Jul 2026 14:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q7+OTVTEZUP1wM0Ujf/KEVFMFUrvZ/Yv2lNz8KnLtck=; b=h6nm73XbwpLX9H6R
	zyvd4CXHZRTjWPq6bWYo8kmc82tiDy9Iql5U4QHlajWUr3A7XYeq9J9/e0tKqzMS
	WOsGzvOPWilUeXFF08v5jjfFEzd9ooLV8zW0HM0jckGYvewtS/HT8r4KeH6dwuG5
	ydBbM/QoMdjXBy6ZvUb0YEkl1f6+iKher/1Lj+BUyOK7hh4OrZRjbXC0u5INAA7O
	6JgMSvNZuXtnyGyRnd2dcwxiHlDfDkpeqsX2+A1vK11jXlz6lDPhBq2MMc7GHSa2
	PMGZSVn+E1TdK1laSA8zj7uiqj4B6qEaUa5YcGY5h8fZ2LLyLUqUaF05+AxaU2S7
	axA+Yw==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgrcgnhn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 29 Jul 2026 14:11:23 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81f3c871fd7so37512987b3.2
        for <arm-scmi@vger.kernel.org>; Wed, 29 Jul 2026 07:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785334283; x=1785939083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q7+OTVTEZUP1wM0Ujf/KEVFMFUrvZ/Yv2lNz8KnLtck=;
        b=SiJ7mgVajwSAEjTcFq+wSdh+t0JoZvSitXFgnnttyWb7g0h9tT5Rmh67HqYjdefrYO
         3UkP0mySQgfs4i7wy9oAGoRrx49cStF3HMsQbaXEMiFpN136Xgr57Fk1IdvavrVBnYxD
         BmMOgaojKFkw7+L2/1s0PV2xwztGLrdb7i4S1wO4I058yKLM/79TXZareTDnVOXnalLb
         aXGCAmp0phToxx5/udnWRDYwfu/+szh1d9UOwUOGnVOqofBMDaPVnNPAa/ZZ3YXX+v39
         fdmzd8KTpraBzCR62paMnC6+ercAPIQLIPuD6wx44YuYKvILbNITGRQ8TKunObRjUoCB
         iL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785334283; x=1785939083;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q7+OTVTEZUP1wM0Ujf/KEVFMFUrvZ/Yv2lNz8KnLtck=;
        b=oq2K1myJ24X6y8U5/GL9Km8eHJXnYzR14KICo+ONh+Ro1WJ9SebhuI1Um0PQHenN7u
         rzFNF7FrW2IlK87PasOIvvNsb1wydyG4vNW1u2/uIiyLjs9RfY88YNCR5+Y/VQtMMHOf
         dbPPRc4dmaYxXy0oCcF1QnEq8nSJPFljoXI8Vc2H3db4gNbmZ5fyEiV1X3epqJZYzQZm
         guPEghARFVwi9aWHoRLBTRKpxu/Q0YbpqnGDGNiuMIbUslfaf990WEP5fA3LWJt89OUd
         Ve4yOi7LVaFi1SOu3jprWxJcI87nXTQkdTAmtu0y1i55W4PnWCKxp8391KrKGORsLH+C
         GXZg==
X-Gm-Message-State: AOJu0YxKb9k9TTCoNO6ub2M1X7XM4L0IWdJafVaclq6abu4BhkrAhV7T
	O60ob+JfcI4fQJvWbIoGQOcWx/kAuvdmV4HvkJnMEQO5endByRVi6KrhInkVCJvVCK+vVPCNfOy
	9vOTzkThzhbBsjYFqvfGR77OM4TRIgq6WP57VQypLIgjsNXFq1LWvbDbsXn6ghA==
X-Gm-Gg: AR+sD11dCJkbpg6VUmP+2SdtvW3iLXZqu9cE6D1kbErhfpJ9pTyskCCcs1P0HMam8iw
	uzuwcrf2QxD9I6XZKqmEnEhDAlUc4Ej1BqEWIPZh4OF9hhJiaZK74LKhZdroaZEzE0D9ryWU6qB
	K0HM5xNj5PZUotHuOFRJZQf91ZObTy9+T7mL7Vyo+d0W4QwNI2PuLJBZpzK+ISihkdTMGhH5YvR
	PRv6yb1cymE2lnzb+P8SZirS/AOj4kwwmmv5LG4fEcWaPPLo4ZHMp4wqdmAPPqhRgMAoQZOKJMB
	Y7n5ITiT7I6rZFGeXIt9/9MKjkiSOQsZuB+74YjBoC3D8Z7cn3iFcaFtuqvNK3zEutJGrWDgq6y
	Ow6R0BjfUTXaZlcX1zg1z9IDCLzSS/Lt8tok9rwDlE/oQwxS6WIlnGzv7hRZP7SAd
X-Received: by 2002:a05:690c:4b01:b0:80d:c24f:b790 with SMTP id 00721157ae682-81f991fab62mr37843167b3.5.1785334283108;
        Wed, 29 Jul 2026 07:11:23 -0700 (PDT)
X-Received: by 2002:a05:690c:4b01:b0:80d:c24f:b790 with SMTP id 00721157ae682-81f991fab62mr37842977b3.5.1785334282588;
        Wed, 29 Jul 2026 07:11:22 -0700 (PDT)
Received: from ?IPV6:2a01:cde0:108:24ed:bc31:6b08:4ac6:465d? ([2a01:cde0:108:24ed:bc31:6b08:4ac6:465d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fa25ed2bbsm18607147b3.0.2026.07.29.07.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 07:11:21 -0700 (PDT)
Message-ID: <282af085-1669-4d9d-9c1d-2fc232252be0@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 16:11:18 +0200
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] firmware: arm_scmi: Add bus support for
 autoloading
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, guomin_chen@sina.com,
        linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com,
        quic_xinqzhan@quicinc.com
References: <Z6CNWOp8B_ghIrJt@pluto>
 <20250203100154.140877-1-cristian.marussi@arm.com>
 <20250203100154.140877-2-cristian.marussi@arm.com>
 <aibW10NMmzw3QnZ5@mai.linaro.org> <aibzLcZiVwtUHAgV@pluto>
 <20260609-upbeat-bullfrog-of-enrichment-0f44aa@sudeepholla>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260609-upbeat-bullfrog-of-enrichment-0f44aa@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: E0mjHmpM2pRA81p952SL8SR-9A38UHwu
X-Authority-Analysis: v=2.4 cv=Id+3n2qa c=1 sm=1 tr=0 ts=6a6a0a0b cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=dr1Y8-9SNSHxNSfogBUA:9
 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-ORIG-GUID: E0mjHmpM2pRA81p952SL8SR-9A38UHwu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDExNiBTYWx0ZWRfX7bKxANuHVQl1
 laMOdaG2TtNqGspPcKY451gDAp5bO27bbpchQMNgCAw21uifkxP8xNR6yYRCLy0h1HR1iV+Fu/g
 mZ/gbnyfTQkYqI0Yw9mkBLT+XiuYVPs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDExNiBTYWx0ZWRfX+/TA/CXZeEDg
 0fZUFRIz2PNEzVxg5Ml3m4CxfZGV/kTOwRJ8lSIrz2P9Jin0ihkZFJkEqOrdvowPc4uL3tS9vhy
 QO7doU6O+5/HWtyrzI4c7ypng2OpGULsfsV+CEiera22LA352LzrhswN9121VGUwNRaIg0dlXG2
 douqWdMACnUxR5q1+N/734A5CE3MH9sSlUimQBo3t1t8TQCYm/PkfUDf65R92CI18jIh2yxiEpo
 67odUL1pBTHi2kyeGUQYfbwFvdaNLNJOKXnm6BaEYiFSOtbw9VizI/VKSnEalsS5akNLp5jtiyj
 K9a1tcJoQ2DCClEL5kIBjeRCj8Vp1BWRo0alFY9Ky2NJ2tgOFAe+8mi4aurROuOc77tC+GUy8Ng
 2jga2L86VzkTPvXXXHnhri1OpVpMchCaroG6nWlybx/DkEom8QetJESR4kvy+cjb3t48wYP3eNi
 FfndqSqldBHBor2Gfcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_05,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290116


Hi Cristian,

On 6/9/26 11:01, Sudeep Holla wrote:
> On Mon, Jun 08, 2026 at 05:51:57PM +0100, Cristian Marussi wrote:

[ ... ]

>> Thoughts ? Plans ?
>>
> 
> Just repost as non-rfc after next merge window and we will see if there is
> much interest to get it merged for the following one and take it from there.

Are you planning to resend the series ? I can test them on my laptop


