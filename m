Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341883AF678
	for <arm-scmi@vger.kernel.org>; Thu,  7 May 2026 09:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778145051; cv=none; b=oTtOSnqbKgkMAp6qh8OPpIdUimVgaoW7aNnjH/YgBvZeB5XXqd8pIYf5nrY8t4JCPuT2tKKHAcWdYQ6ZuEjd0Wd6ZG5Iv9dtw5DbX1kQB/B690BCjo3qYm3qy0sPHpDUOWAhV/wpY/u5t8VYhNzfwoVsL8T0xrjBM1nm2PWRltA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778145051; c=relaxed/simple;
	bh=cSbnmKIeK5PiH7jDW+BQqyiKxH8RY05vb4L396PVn/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SIBUVmL8MpeRIy6nPBapLy/hcU5V/tTPzyYqTRcnTK9u3JqK7KEAk8oa7y7+VUWJRNEYxKMNxY9l2/7NqYi4kqwFz7y/p93Gg2f0feOuwSt8QmpNBL7XVRJhNPWmErUoTM9+5iLjQEZrI609YFal81jkxtSUj9Jnhx1jCagc5do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aaj2kPf7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eaayxXqs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aaj2kPf7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eaayxXqs"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475LMRC1068056
	for <arm-scmi@vger.kernel.org>; Thu, 7 May 2026 09:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fiLRyqVWGS0Ix+7Et8ZETjKI
	EZ4pzdPJfw5gz/TlT3w=; b=aaj2kPf7Vt70KA2i3+8H5rqr4GaTBRUxUXfFCAIX
	1wdBO8jPUfsMqMrznswtbQ2P2Sc+PW6u3Lv/QSqcGF6r0+iMf3u3kaQtK6o9hdEQ
	CbqLEGnxg2KU0oLYXWLl4EXauJIGscXmUQ7FkaJ5ATmeVNCi9CPdyPreNdMhujls
	lo2BJ7dWx4/ULLNGvksEnomZ1gSIjLo9AVuTUsGBgxibOK+a9ikaCy7nV2o1vnKy
	+7+q98leDPrDHpE1aow5LsCT1+nLVzy8Pwfnb6CvPbz7NcYllukprl0QwQL2LNMG
	cMQ0cNd/S3qW7IY5fCfePp5fy9uOvRNQhHlP8BRedEPrmQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mh18udm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Thu, 07 May 2026 09:10:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8fcc3e2a3baso100962785a.0
        for <arm-scmi@vger.kernel.org>; Thu, 07 May 2026 02:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778145043; x=1778749843; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fiLRyqVWGS0Ix+7Et8ZETjKIEZ4pzdPJfw5gz/TlT3w=;
        b=eaayxXqsFRTvarNydVcHFRARBFPSw+J57YxMg9pETfh8Dga987mHzV4BWW/Np7q1u6
         g3MtwRlgZ4/rQksxVHQQC8hyu5qCqtpMHtKyd/wNSMP8q0I6bp86lycopKq+FeOBuKPo
         NpLT19srU4rmTZH1UMu+19x9fCIuFl9TIfS1sdKzQMGIv97rsHnoH7SWVVHEjjqsZywM
         Sxpft5Hd5cGHKWV3zLyFrAyDiFaSJiq/qQhN3Or2GP0TXk2ZJ93X7KCxnZnPEaxGHYwv
         kf7u6M0+fxHKa3WueAMgXYneJGNfFvv1cPPfyy1cFfYmezT+GzBajtZi47wIu8toiRii
         68ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778145043; x=1778749843;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fiLRyqVWGS0Ix+7Et8ZETjKIEZ4pzdPJfw5gz/TlT3w=;
        b=G56kgzgYOyr4Wrz3WO0V/oWsWcOh9GEKoN//JDmly39LlsdCbeW5aDk1W1Z5ml3BQ6
         OV85Fv4m3TtFhdii/lI3Bg415C8CwsQvbS7gymnFxURZ2Bd8nC++o9E/Q1xHRo2/nFua
         onErfGCJJVn10PWYJK47i7L0d/lzm1C+UO6QHyxoAD1Dk4w0WgmVsuWoo+xIO4f3nij4
         kInHEXaP+CQSfwuGXRvY8VG5gwID1UVeURLOGuE/2sthH8pxMxroUtwDNmUxk12PEbkX
         y+HJWKkP60G3oqV+ZUDloawaGtXQ1N5OryMUHv8iMso9DRKj4VYGZEpJ/SYzl1Uiw3Z3
         oOSQ==
X-Forwarded-Encrypted: i=1; AFNElJ/k56+ASWH/Ayw3Eq7vTPyslQdygW3D8rzwAabdQNij6G9zMpq3j1sPLYZJzWDlSXHkYaw+240cCw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzva4qheqvuScKGv0BKyXPaMoZizwMGvVZMfmg8LnszPzlXbZPL
	ged+8G8Mqayw2wKvsjxF+eWCYCZQ43SrW20HENq3jf0onBAvcF3eD9s6W1UuyOx1zvdbgkSqdQW
	MZ29W9bqOayUzCLDx3ZnI5+itC12GSfnWD4jHwsy0OlNgGASFpcDxdaUazj9c3g==
X-Gm-Gg: AeBDiet3q1tvmTM9jvJle6oZjevcMoGyJ5LpK1+b4T/PSpqcCW2FfI4Sa67C0aWPqAE
	1RpAbKH7QXfX+9yJzTVpNVS7nok5V2GnthCkpUiVRp/ay6E6CoyWT5PMKXkIV5U6aK6HA4gnRFS
	9jL4XSpQVRkJ9NQaEWMkg+Es9wv6V2jr0qVz1jMYdjxejk72dN3MkE75eK96bpkgcllMaoCzntC
	M7P07KtDc+ko9+WdZHAyuImzVLkxtZ/aqI7EoxnE3cRzOx1QCuGVLU/cmVM5NM5gF2gCRw1sSCP
	vookn3WuETM8bi5mkYksjPfPv78lakI0uKkYdvf/b0AfinVMnsy/zBfoN0mqtGu6qu/6BeC1jc5
	DoSNW4uop/Eko1BQ9vZ0VPeO1nCQ24mfoDjnKouxhW8+7T0HLxEmsxOTrnBt0DlpAEzVXVImbjf
	VIy98fOXgSn0XL+r0WevzX2zmPwjTc9WmI8tfbS87aXMD6anVhrVVK75Ta
X-Received: by 2002:a05:620a:2848:b0:8d0:82e:7423 with SMTP id af79cd13be357-904d69d8e00mr989743885a.44.1778145043093;
        Thu, 07 May 2026 02:10:43 -0700 (PDT)
X-Received: by 2002:a05:620a:2848:b0:8d0:82e:7423 with SMTP id af79cd13be357-904d69d8e00mr989741085a.44.1778145042666;
        Thu, 07 May 2026 02:10:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a86e65fdf6sm3822632e87.78.2026.05.07.02.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 02:10:40 -0700 (PDT)
Date: Thu, 7 May 2026 12:10:39 +0300
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
Message-ID: <mplk3qvyslzazuolwlcgy6fb6ta7ts63x3dq5wwybyejaxpyh3@fctfzjkyxi55>
References: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
X-Proofpoint-GUID: v9FcmCGMHzXmtBYtuOCi8PQvXDK_4R_T
X-Proofpoint-ORIG-GUID: v9FcmCGMHzXmtBYtuOCi8PQvXDK_4R_T
X-Authority-Analysis: v=2.4 cv=P9gKQCAu c=1 sm=1 tr=0 ts=69fc5714 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=RJIkCpciCD5dGSa3Y80A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA5MCBTYWx0ZWRfX3APybtx91R1I
 7EiUkhrFuBeytVT9TwI3AyRJ4Iqj2wEa9oOCPPwexeNcKnpRAYew90gHb6La+L5rsNVY0aiHgND
 fwePYI41tP6XtAkM1dqok6/v2z1vFMqehw4Yq/+4bDsniHxoExfB8raO4nTOF9ke55fmDTotCIr
 dI6Eb6i5EMOXthR2vVJ9rU4qpawJyjZslrUimSUvtDF25rKMJfmIH41jjyDwdCOFfWoww9yRsge
 acipGZiPyteZ2sLRWR8WeKKBb5GFMhyq5bX+B7WWuokzE7BPfB2Rqt+/UXSe+Qmxlu8QlbVbjkQ
 3Rt4Y/xsKm6MM57cxVRMr6EBMgtNaR2Ewr7yUuBscw3RB7SgS6phoRJZdD4U8cAZukbSV05DPpg
 DCzDl7Iu06y6XughGLXf/5yzUTMTJlJH+rFJvc69t1vkYrofWqT4IX3yJEtUJ6Rall6W76flwpq
 sGI+Uyyjlvu4qXbRWDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070090

On Thu, May 07, 2026 at 11:52:29AM +0530, Sibi Sankar wrote:
> The QCOM SCMI vendor protocol provides a generic way of exposing a number of
> Qualcomm SoC specific features (like memory bus scaling) through a mixture of
> pre-determined algorithm strings and param_id pairs hosted on the SCMI
> controller. On Qualcomm Glymur and Hamoa SoCs, the memlat governor and the
> mechanism to control the various caches and ram is hosted on the CPU Control
> Processor (CPUCP) and the method to tweak and start the governor is exposed
> through the QCOM SCMI Generic Extension Protocol.


Could you please clarify, does this apply to the common commercial
Glymur and Hamoa laptops?

-- 
With best wishes
Dmitry
