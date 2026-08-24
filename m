Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4B438A701
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 20:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787603715; cv=none; b=bC5SCC/WrFhwS5BiOFyOZ6xLu1/IXCw2jBbqBCZHBNWCUkv18dL38Mk98LE/nQH9wx4pOqD0OMULRxFzyHDqqJqA8qeeC6AweF4l3UI1+HY0qGhbSQEnxmHlhCxXzUUcIt5WeFbQ8Aa9I1tDm0NPl3V2ncjFTOfqNEDxrEK8aNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787603715; c=relaxed/simple;
	bh=nbT5dzntacKFRQSPqk1p9+anOK/Ykfp9XH6Z31bA46Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JmhOHtuNjrxATJB/C1xuWXwIKNlV4oHZJmXPPjJVZcv9ILEVWwVul13vlaPEXyj7H+K11IyVMXCd/Yf2RcgKCAvTPXp7lYKsyNDa1oRBKKMZwQxJF6JDzr/VbQD99bGXCBz+iGef/0ZILr9LeXnYeI3u5nm69OoY9vGklksyC+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QBqX2cXE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IWAZNghB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QBqX2cXE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IWAZNghB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OJH5IB3789530
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 20:35:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qwb6Za5Jh+xtMbV4sA0pv+cTfOUaw+dS3gVnx/6DE8A=; b=QBqX2cXECxUzM1XJ
	WfAsxafAL+U8LEeWZY7aYFIKxDLTk4DcUmrnCyCoW58Pz5k3D3UlMkYAC0j67KJl
	7zPXbCweJtUkOaNOLlz0oVTXYJYkl+R7RMjJUJaO0gEtBVh7TauGUrG4XKUX/pTd
	7ShltVXv6/Yl1zUW+XyYWKRnIFE13cCXgbWIpYjE2U0ANx+SoM5cmX5LvEvjY8Sm
	XoCni4S81gqE10Sn2LpzgTRyGQSKeNoOxwqQt86klnZbOSg5WFLnGvFMiytKiszQ
	cmid8zGuAZu8JXpZSJVt1TiEyaw+JIPEwRHQirkaqr5HMBc9j5WIDA7A5uhQABIg
	v6RQrw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8t1s0r9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 20:35:12 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb5ea36f969so4641571a12.2
        for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 13:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787603711; x=1788208511; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Qwb6Za5Jh+xtMbV4sA0pv+cTfOUaw+dS3gVnx/6DE8A=;
        b=IWAZNghBJuGwbwfhWUmiw22uakA6zMAVQIAFR8JnZZv/soqp06aWEgBNtgo3dGwDIe
         gBCZS7AqSq8cvDG+kvPgz4l8DLh4gFmFh/4Ig2wPPMJqNxdB+TM6AHeoM230UkLvW9BQ
         0u/WhU4WJdOOs73ZeYWiRoAvOApRRBcDkco0IQqg2sEiEhzueChXvVs302/FNFwpn2Qp
         u+6LEm7exrotzaNAd02Mo71Bd3xNE4zwYpwYCtGjLPsOUaanJ7wjx2T+0ylAFG7En1m3
         Jb0Kj5DX9YdSg04WVAHNloHWVRqu8/D0Iy7XhOct+UmaYR6ycU6IKtEHAz01HKKpvy3R
         RZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787603711; x=1788208511;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qwb6Za5Jh+xtMbV4sA0pv+cTfOUaw+dS3gVnx/6DE8A=;
        b=PxnXYEkog9/U6Dg/m+2bkAerdKNz1mlBvBxidU2kM/b+6YQ80KZ6wO3viO1ZU2sWln
         t909svvgmhz8Iuwm02W/Jy6GuuAL+EsgxvhruluYfVVj8lEvs/JWo4eK8TjHx1thbDJY
         MkbTIumhv7z+McdHx4SH7LNyEiJaitqQtVNFcVJWHB0HKf8R67JTApQJ2t84H6crtVyp
         B4NLPak/49LahdmYYHPZHfG4Z1lkwdjVF+EJC2woumaolrpKVpLGAS2LdC0etHBc6bFO
         S1ynGflQOYUcLeqy7mGLJE0iEbcDlQMYOMt+xc79/qrFXobXzypdwmRj4byYIRn39NRB
         TN7w==
X-Forwarded-Encrypted: i=1; AHgh+RoSF8FjxKdxFpS+mHckyRosZnHIXjQVDMIb80xwrB4vpbHijxrPWH4x9xbyhCPismO31I0d5L5QjA==@vger.kernel.org
X-Gm-Message-State: AFuF++n7kEuVVI1cnB1fzcZDCf+8uokb4VH+l8jUNfEbi0B1M4aBHZ/K
	JwjStKAllqBVoek3pwByyYzRdqhZtfFWK0NQv/1GuY/GGS7OFKkvZl/URyiprkpcI/8OMdlW34Y
	Wifc4pKRFbUlGA/UwKf8gzoHB+mFZojxMYLgzrx2yP7rmZix1SKpem+70tUY0AA==
X-Gm-Gg: AR+sD10o/Mwb/5QGSu83sR3sd7eR8LLXJeKpV0+XSkqx0u0u+Qpi6Uus1pyAzuUku2/
	B6ifk3+2HyKgT/97SrntqmEH9Fo0MxIZxi1LvtPiqhBm4aaSxBHTuVsNlyRIRPxK60jQsHjSHeK
	bZA6zOKAFZXyF9y6/up8z3oZ+/FzZRD4+mXCpSQcR3KeJxPrzsB4STVKZ7w3hulTPXz/2RHzaku
	8pQ0BwvjFpLIOxKftOKdtA4uScxfKIg3AwnTzbi3JO92DarkaWl85LS2viOP24KHTsXNCPBHA7C
	j6yJm/hLWKzPmteiVUcjaaxT2dO2vb774ttGeyxGOYyx2UfnvMEUQtR9ZrqH3TysMKSjffW8Ruk
	mdVol85wCk5J5mMIllx0mHrnf3A==
X-Received: by 2002:a05:6a20:7292:b0:3b4:7e2d:a3c2 with SMTP id adf61e73a8af0-3cd301c72f7mr44771624637.18.1787603711129;
        Mon, 24 Aug 2026 13:35:11 -0700 (PDT)
X-Received: by 2002:a05:6a20:7292:b0:3b4:7e2d:a3c2 with SMTP id adf61e73a8af0-3cd301c72f7mr44771557637.18.1787603710735;
        Mon, 24 Aug 2026 13:35:10 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1418600535csm25139612c88.0.2026.08.24.13.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 13:35:10 -0700 (PDT)
Date: Mon, 24 Aug 2026 13:35:06 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, jic23@kernel.org, elif.topuz@arm.com,
        lukasz.luba@arm.com, philip.radford@arm.com, david@kernel.org,
        souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
        puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v10 03/24] firmware: arm_scmi: Introduce protocol
 instance notifiers
Message-ID: <20260824133506.000053ed@oss.qualcomm.com>
In-Reply-To: <20260815232604.3730754-4-cristian.marussi@arm.com>
References: <20260815232604.3730754-1-cristian.marussi@arm.com>
	<20260815232604.3730754-4-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IO53HalpWB_9SVRS5RX8275Ci9OijGg1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDE3MyBTYWx0ZWRfX570+TG4oumKo
 wi8CM300KKnTp20pXch61BtEWGtDz9UHxIXu+IXEp/V3pevv3tUb3jGB/AYy1gZv44WV+XSeczE
 qJ2RY+g/EoAuq4qQMARnXIXF5ztAKYKAWE3jkW+c9zWw/6Ivh/Cyo/EplVFecgetMo9FdIl8OlX
 g4VrhtY9oPZWBXcAMA5XxXvqoqLCBuXF04J/djHJb6cgsg9lrZnpDKQ7lQd6f9yc4X0vvuEJLBT
 KIdu3b05feDXXXdjFpHrP3IXSWCO/aeE/dFBW1eL7fGcYutX+mKjefVk0BvD70/zmCEeytjNF0g
 wOLWonSikXvzOSCtxdzrw5F4V88fNvqGQmJqxpbgxpVViVEGKotIcD1L0Ad28ONBDC1RJZBbPKN
 YRG6YrV97A2BnoS5T5RadhEtjLYVObFGUQaSu/FJbsZDNMuwNy+YXa385M67UX2y05UkZEdX+xu
 FqPtvdhsgrp1toavUkw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDE3MyBTYWx0ZWRfX7nRFpwB+fMlu
 DvNv+Rd0VlFTWUY3mjQkc3fLOrNsTbr3uMHtJiMviuBt8fmzuOVe2Eqkf3/0DkRnX1T+A26xY+R
 Pd6nWw6/id3m7NOwQ/x5blgBxkhP/sk=
X-Authority-Analysis: v=2.4 cv=L7ItheT8 c=1 sm=1 tr=0 ts=6a8cab00 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=aGd6ziPyllhe5ofM85oA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: IO53HalpWB_9SVRS5RX8275Ci9OijGg1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_06,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240173

On Sun, 16 Aug 2026 00:25:43 +0100
Cristian Marussi <cristian.marussi@arm.com> wrote:

> SCMI Protocol notifications are typically used by SCMI drivers to detect
> and react to particular conditions: this was the assumption and the classic
> usage scenario upon which the SCMI notification framework was built.
> 
> Some protocols like Telemetry, though, could be interested in enabling and
> registering for such notifications: in such a scenario each initialized
> protocol instance could want to register a common protocol notifier.
> 
> In order to reuse the existing SCMI Notifications machinery, allow
> protocols themselves to register for their own notifications and provide
> their own notifier callbacks.
> 
> Each protocol, at the end of its initialization phase, can now provide one
> unique per-protocol-instance notifier block, which will be registered, by
> the core SCMI stack, on the related notification chain: such notifier will
> be automatically removed during the protocol de-initialization phase.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
I skipped a few versions but what you have now looks good to me.
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
