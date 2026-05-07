Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14A3302146
	for <arm-scmi@vger.kernel.org>; Thu,  7 May 2026 11:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778152262; cv=none; b=nCmsE7ubar3icI72Oha1YnOZbMzklcE+npGM6OaAvbsuJv7BbaRF6YC114wp+OqPMYHofTRo/xrYtSsAS88EFyXefCmJ9zVQ/WU0EBdkAhXwDkYb0wUnHtxM9kKmn+zVz3Kn353+1XXJiwmlfosMk8p8Q0ElFTfT0HgXiFEW9xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778152262; c=relaxed/simple;
	bh=iwBZ7AtMlhelEvLw+tye8c1q7oBAuTMT4QG11XTcpvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ubjB04NprQJRQZmbGpUtnAxeRiJ0DL4N/wb2Fz5uli9/lGpC5FX72FzG2mJNPrzMihFi1VtRyFv2KRhqMhu5Z/yhTrUZ3NkxHTAGJAsdy69P8brZACUaFqJ51+QyB4Se3SBqMY47Tjidptst7o7H5NmEe/ghhDDUAuluv3lYjjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O8jZkoVA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g20X+xxt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O8jZkoVA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g20X+xxt"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475wWCl1926339
	for <arm-scmi@vger.kernel.org>; Thu, 7 May 2026 11:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2Y1kuY6AIGy+U4i/Y7pzL/6z
	K08GGDx+3n+4jmLdQvU=; b=O8jZkoVAqt+2HLCrU2eOD6YB3L6iTXF67LpCaRSu
	QAseQv6SNf3eYEndOf+rlKeYTn5xvcmLoniRiabHTBNmoqEMId5tALIdR3xOYLal
	M80isMChprYO83Hs+kwz+mL4ar0l+0LD04kBgpK1seap2XZ0v0VI+meYkfLPzgo3
	KBDG4EMuoWNq5Zso9HhvywmqbfipwOrbHtnNVXWsHQgvlbg5GkRkX0VlgFlAuOP/
	XMvHY5T8+aYuRcvjrt7euN2/KcH6wo7D/lvgSKY71ochyglzsfOMjdPS2CMXeRpC
	XLTzyjYCysKfoMAX/LiT99/jDAE5AaN5C03ulU4NuObiYA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0n2g967g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Thu, 07 May 2026 11:10:52 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6312ba5c81aso24191137.2
        for <arm-scmi@vger.kernel.org>; Thu, 07 May 2026 04:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778152252; x=1778757052; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Y1kuY6AIGy+U4i/Y7pzL/6zK08GGDx+3n+4jmLdQvU=;
        b=g20X+xxtK858QKAdfgknvaE5wdXkNyjSMvfJhZsM6umA6INVGTekjmpmviDynIAbE7
         GY0wLAqURl7qTs0JYq3mapcEpWu2Fci6AnGvHS5lWqGGtjLs8omBvAOxFfDObaMfibhF
         PwM+jNftyf3QhpHC0hygrhI/driWYyGigVa1n8vhZcm/pYz6q4ceKZF/BPx4K6ckm0B3
         bAxuqhXMrUvK3olSICpxo3v0TDsKXKGpClj5VB/Wav5BaxT0xWZo1kQXQiPQXF/jGCcO
         UYnUyrkyA2H1y6I7DVw4YAOVH60PjlPH+ZYzE3cyu2qYSL2llSduqNx9xD4WpT/d+f2Z
         DikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778152252; x=1778757052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Y1kuY6AIGy+U4i/Y7pzL/6zK08GGDx+3n+4jmLdQvU=;
        b=Q+UJnl0tc/hbRZoty4MA+ICsn1tA8agUxAl64MOb7LxpROJbxbY8Ukez520Qrrt6Pn
         IHD5URhuAxC9MjDfrK1WBYyIE6iL9oaZV5Ijgxa5dKkDZ3FkEVZbAj10V3zi5jfrm4NC
         PFsUyYVJ91+KJUJBlReNq5uS3u+TYlqUQ2ddbkHwT/7jQWF9VrDtGss+QEnYefFdq04Z
         E+UbJwXoyhtFukv/B1yt6ZfN04BeQbl22gyLf1nR5BDfhUh/aG9hU8QusnFj6LuD3Hos
         g/1Q7+yq8+PmW+PenYHTpUg5V5M0xgZEzKyfDQTM04gjWveJMfPfe6vqGoLB/WL5PbXW
         PHyg==
X-Forwarded-Encrypted: i=1; AFNElJ/MGPKIKYqaJMS4CPuPvLAd7LK+1GWpLrsnUkCZ9j/YF+M43TFvqXpwTPNs19NvMxDYccJuPT8HfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5sApCbG3D57+odDa+axPAIUnqXNzLdbkjUH/HBcn7AHTIHoMB
	IAZf8xBqA2qSbPwHvb58cq+BHMw/pkp8XSZ3Vwa7LfZUyROXIQPjGUkcwJrhTvKcW8Uv+oaQ6lC
	XxDwmgkl51vl05a6D0oy8NMLU6TaZPlokTGlXn3V4zO/drWvii2oTh49YymcT3w==
X-Gm-Gg: AeBDieunNOTS0YEPTLZq4nVDoeLTUDVrRb75QXuNETB3UJSAjMiFkOpQlaAS9ZcxynX
	9TxL428RdkzRdEcpHOpSRFri3fzn976qiiaiYtECM3HG54HyWBRpVRCm6QziogqsqXxMy5TBKqF
	tOatY6R472ZwZO9hqLmhSI8QqPJ/gi581WtRV+sm2QJtE4uJ3bl4Kt9kH75AHKKSkx+A7wyk4Eq
	yBvyhbKFXLr1CIS4TvQRKdgKi1fURGRSGrMviatb9ruLJA+2E552n/R6MUtS4VMn7YyYY2PCzZ8
	4xY+PhZ79cQ/uoHr0CV6s4mLJ3j/eZBZu9R/jU3Herh9yZiivA30uxk2hc7LEGCKRvZU06jB+hU
	xdK6jLdvMLu7VkyiaQ3GkZKj0ucaDz+JpBUCapTp+SEdqsGHP0j24kKWeBRpxJ6BimC7bLF2w8I
	SLl6m7qoonBF7LQEwpV2p6nYm6EG19KmgA3WmFj5yKxc0IwiC0mPVycn5c
X-Received: by 2002:a05:6102:84d2:b0:605:38d2:26cc with SMTP id ada2fe7eead31-630f9036c70mr2284827137.26.1778152251754;
        Thu, 07 May 2026 04:10:51 -0700 (PDT)
X-Received: by 2002:a05:6102:84d2:b0:605:38d2:26cc with SMTP id ada2fe7eead31-630f9036c70mr2284814137.26.1778152251228;
        Thu, 07 May 2026 04:10:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c22de94sm5528582e87.7.2026.05.07.04.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 04:10:50 -0700 (PDT)
Date: Thu, 7 May 2026 14:10:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: cristian.marussi@arm.com, sudeep.holla@kernel.org, cw00.choi@samsung.com,
        kyungmin.park@samsung.com, myungjoo.ham@samsung.com,
        konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, jonathanh@nvidia.com,
        thierry.reding@kernel.org, digetx@gmail.com, conor+dt@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org
Subject: Re: [RFC V6 0/8] arm_scmi: vendors: Qualcomm Generic Vendor
 Extensions
Message-ID: <nfh7duwh3o6hayhxz4pxwfwng6fi6q4l5rlzlgjjk3atakw4h6@6xbyk3nppdrt>
References: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
 <mplk3qvyslzazuolwlcgy6fb6ta7ts63x3dq5wwybyejaxpyh3@fctfzjkyxi55>
 <605bcc1c-a4ab-4125-a4b9-facf801db26c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <605bcc1c-a4ab-4125-a4b9-facf801db26c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Wv4b99fv c=1 sm=1 tr=0 ts=69fc733c cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=kzQ9Fxln275sraQuM_AA:9
 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: dmGDQrfk7-9-Vp1XM6c6pYLDPiwT3jvi
X-Proofpoint-GUID: dmGDQrfk7-9-Vp1XM6c6pYLDPiwT3jvi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDExMSBTYWx0ZWRfXxMPjY6ER1/Ir
 NFZXqiPlI3YKHBGMVbsp2koB0OCmL1TQ+k4EB6bkT89Pu127j+/l75sl2C7xgBjwb+a3cyN0KcT
 FBLcC2Xxmff7dC4VJgW2Yf5L50uzTLAmdyYDsoWHRU2k3fawPIWN5NLv7GOhdEa92bHSBMZhL6Q
 91K1nkcRwhWttqY/cY02fU0nYyMkUs7MwBwC4wLQaxxv5Z7mdeLpRk3JxeJv3GviUHQBnSfFZ/s
 WI4IW3VqOzx9/ftmId9MWu1pac+bnathoLDQnMuDtYq0aH8R5U+SafRpPwgi79MCGFvlXERLsAF
 o2eNLzTwEcFLaX2Z8ee3YWerT8KcGN8rTkRB2UDRcmJHQD4WCbrxU7pTYBsgr5HmLDII/X4A+Ir
 l5dFI88Ffl4WAWUzbldVRn+lZGs7bvD94EoT//f9Tiy0GKstjDdO6/zjXw6jSozPU04r/zUW0hu
 GY9RQRQunWtJA/4KU/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070111

On Thu, May 07, 2026 at 03:28:21PM +0530, Sibi Sankar wrote:
> 
> On 5/7/2026 2:40 PM, Dmitry Baryshkov wrote:
> > On Thu, May 07, 2026 at 11:52:29AM +0530, Sibi Sankar wrote:
> > > The QCOM SCMI vendor protocol provides a generic way of exposing a number of
> > > Qualcomm SoC specific features (like memory bus scaling) through a mixture of
> > > pre-determined algorithm strings and param_id pairs hosted on the SCMI
> > > controller. On Qualcomm Glymur and Hamoa SoCs, the memlat governor and the
> > > mechanism to control the various caches and ram is hosted on the CPU Control
> > > Processor (CPUCP) and the method to tweak and start the governor is exposed
> > > through the QCOM SCMI Generic Extension Protocol.
> > 
> > Could you please clarify, does this apply to the common commercial
> > Glymur and Hamoa laptops?
> 
> Yes, they do apply to common commercial Glymur/Hamoa Laptops
> as is. This is the same solution used on the windows side of things
> as well. There can be certain cases like Johan has reported earlier
> where certain oems are stuck with on older version of CPUCP
> which requires a the memlat string to be sent out in lower case
> we should be able to handle those as well with overriding those
> by using driver data and specific compatibles.

Ack, thanks for the confirmation.

-- 
With best wishes
Dmitry
