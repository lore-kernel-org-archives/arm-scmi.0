Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34EA38F651
	for <arm-scmi@vger.kernel.org>; Sat, 12 Sep 2026 20:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789246265; cv=none; b=qgFhxzEPMzP/cQ3ZEOfo8R5v254riIMeCnC1R7YsP8Sld7AsP1kL1YgVm+86kfaa97qp3vd7NwmZwZwHdMBvtdSh6yxGQpFNsLx01R/4RZyr/lBFY0i+wInUwQiAF2pGa/LLGrMQXMJZQmoT8AUzuJZX/sYglQAMpqb2zuVARqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789246265; c=relaxed/simple;
	bh=kttfSOKg/yQanFRXG3yh7u3S71n/ayBAbVoEgimZi1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJ+AlJv6hQj7wKqHzKUEO4GJ8aDyIdXpqD36mEc+0qryTVO2eReW/z9SIxFMC7hWhWM9xl74SfR2BZO+aTV8TaHLRg8ZwHqozVctOPefSxVAsTSFhtNbVPLbGSkmHQBY8l/v8qUrOVl6zp2lh1gZNnFTRgzJinwNoy7oDg4/9qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ay+SGGoT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QHfo5IVD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ay+SGGoT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QHfo5IVD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CI52Zj3220823
	for <arm-scmi@vger.kernel.org>; Sat, 12 Sep 2026 20:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KmMs3gRal1z49mHzxWm4Gkbi
	6oU8/Tm+5YR7zF+GVoc=; b=Ay+SGGoTAZSu1hitwSPfrGlcXjYxxexyI7ofZ3Y6
	S+tuVGB3y0mr7m67JyYXEJlJW7PlccZgEc5xvsTuQHApcViM4YazCNZjHozxlz3a
	vegeaylaaLj5z4zMPpM8bbowTD3CA66pMa/dI4PB7kfL1mgRKjr2ZksgcVuJWnPN
	NnKVR3DLLdPHXjfPqUQESfIWJfSuThchTAiISC/VjCGtXk1ZB8Spp3fz4xAOSkcd
	lwj/k/GWkDSyBs9IUSXv7nKyy1QD63t/UklqOTL2RJXXnxzXWR+DNLQ3o+OTIbPX
	+8jM/y+FVyLRp8lNvY6i37zAvtO9rlN5p60ncOWElO45wA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd1wvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Sat, 12 Sep 2026 20:51:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9399b66e0e7so471562585a.1
        for <arm-scmi@vger.kernel.org>; Sat, 12 Sep 2026 13:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789246262; x=1789851062; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KmMs3gRal1z49mHzxWm4Gkbi6oU8/Tm+5YR7zF+GVoc=;
        b=QHfo5IVDbnwy7WWSJ7UNh8Xt+uCVkFoeSNz8E1xvnEIrZAokXUGhZOOQlBSE0d6gZ5
         PDrdF6pVXYFIZjN5JyJiY2rvu1dMNSvIMDOoxhMgajDPNkSTDX0iyAEmlxpoV6cfDQBO
         /CCepZ6ZQ+vnrtBiJjoR+v+ld+pTn51ISOEnb5TgIa123pJiEwOrdguCaq5oPa9okqK7
         /g/GydH1Au2y7mzzNB9ohBgwE+XdpMrvnFuWJINcXi83uM6YaH0Y54qI2wV1sij6oEdF
         V9PRIhdYNNaBLnh5EFQUr2Vdfp71BnAVGpKhY219uZk2KNSlBCYLukGlhrBzNTQWWbEN
         Ypaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789246262; x=1789851062;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KmMs3gRal1z49mHzxWm4Gkbi6oU8/Tm+5YR7zF+GVoc=;
        b=NoIkCeCXF8qg1CvjeWZutpbOc+Xcz9kqvvYHnPevUgaXUmkPi+SUKP4Gg4NK17Pw54
         3fy1GyMFTIju0NP8v2kPOriFsaz/5es5yNmVhGwB1L2L5b6QUGLitbbSptrqRWGJ80NG
         2Qt/U7sHmGeCsa/yF6xY4AZp2SQXW8tFxsVJ14ozo0stWQwi4s8bnNRr4sHO4Bh/VEnK
         sKzwnJi3oEadorBgGY4Se6FJPa4l3yPmv4ZyhsPkPUhgqT/nGNtP4Ih6yFlo+GTEU3wY
         aIJ1yqNgsMao0qbh4pq9h0aCxKUiknnHqPILX7oZY5yE36FJtGkHscXqWdC8Im2a15HV
         InAw==
X-Forwarded-Encrypted: i=1; AKwUvBwtce2XdzV2OTQ0OwGUflZVboYMzfmLTFdvrELoD68GNvcmL5wMElEVRA8LJFOVEe9m7YjrTrTAwQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kd5mu2NhdGq3NU3dgyxUixiSTN3UkdUtoBj3NS2i+wYlZawVZ1
	Cvdi4DQDHsLKLEPyMnSdJKdtgPg8aBr4aFlCNOgTXxv2+hsQKW56tTlE+2j6bnqDXBRgR+JNdE5
	j1tzy+Ja6gXRDN0noyZ+9krq7VIgcxGEvKsD6tyMdSHJlfBvb7k3MTvJmrEjFBD/dkXdQHA==
X-Gm-Gg: AYBFou1JWtpS3dOnstV58y5AMycu+b76Q4+viQUegFVLkXiY5/418jFslAC1LUWfaR3
	3ijEJNZZfF6hk1497FylSLh8p7wdO9n8wR0E/tgHijgArtvPBbUtVt3twiLEE40u8egnqhusw+M
	nAUpYNnLCAhPXsxPxjiIWnTX/VLEBN3ByFNjn2S4UwO/5vlZnkS74Et+UCQkJTQeZqGE+XBrw9S
	YFQ1TwAGWzow0fZhQrRpfkqPMJiORRD9V4H80fl7KLK8ssvmrbcb2v3wqINpJ4aMAOqRkuE+R9i
	NZjc19s65gaObQIbvYHnSajSwGU8nlIcqX8k2dSXYK7HxW15aeI9Bd7EB/fr2MNsFV2SBVMXxey
	aC2oC3Lrf1xxi5A==
X-Received: by 2002:a05:620a:260f:b0:939:3a81:326 with SMTP id af79cd13be357-93a0390793emr670206085a.37.1789246261929;
        Sat, 12 Sep 2026 13:51:01 -0700 (PDT)
X-Received: by 2002:a05:620a:260f:b0:939:3a81:326 with SMTP id af79cd13be357-93a0390793emr670202885a.37.1789246261354;
        Sat, 12 Sep 2026 13:51:01 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33fc02sm14093160f8f.16.2026.09.12.13.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 13:51:00 -0700 (PDT)
Date: Sat, 12 Sep 2026 23:50:57 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/4] firmware: arm_scmi: Fix
 scmi_protocol_table_register() error handling
Message-ID: <k2agmmtgq2tbx2zyokidn3dsdkcjpdjbasx7vlch6b3xz5sjuk@pfhc5npwwegc>
References: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
 <20260911152329.5822-3-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911152329.5822-3-johannes.goede@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa5bb37 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=yiJOAx8gJh0FWUIRsxYA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDMwNCBTYWx0ZWRfXx0EZ9SktdJd9
 5cps+EoRJAEUGxwg7paITMoXp0YI4C2hElcevnBcQ9qeYk2Hfske9jNhlWG/LRBhZ1uhE7ZmiwF
 wamLc4P2+BYsCJFCHjZzDQWMF8Y0tdw/RUg7iAVHC4LjrHUdv1n63jSaUyZT4pE4+oZ7K6BcAFd
 avm4wy7Am1A/XNeiABVy/bln+wCxtW6TF/IovhDqXYgvQ02cqZIgGYCZjj3lJ1EnEnR85kmkTm2
 Savgm67Eo2hcY/nSmMkH3PtUYkpvW6/fa+ghEaZZULzav3IKz4JYDNkC/y+rlLBxulQs79fQa6k
 GjV6OkXjIrFDYd153F38h2XPCZf8yfO5BimAosCmBDe91yV1dtCAT/wKn6YeqH2teJ/AKLQ3uOW
 IAECwxqCIw5+U8as5zhwHfyk/hCxRCSpi/EsZLDOklbP6GfckI6SdrhBZhwCePj77ZPDp9Pwqn2
 BKMQz1ufg9vC3zGSsDA==
X-Proofpoint-ORIG-GUID: eDilNdoxJ5ybIU08CaMqT3WXkXxQJMIr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDMwNCBTYWx0ZWRfX91lHoRVrFH+9
 Lg/f0Yiatu3Eja+0Qh4bDyHQ+i1n3d9cuu5Eufgho4ZKyj06KNRRQ7S/s34qwle3AHgZ5wipR2H
 BP/Gv/EJPghfJ4yXssOol+h44EmoPhk=
X-Proofpoint-GUID: eDilNdoxJ5ybIU08CaMqT3WXkXxQJMIr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120304

On 26-09-11 17:23:27, Hans de Goede wrote:
> scmi_protocol_table_register() stops at the first failure to request
> one of the scmi_device_id-s into scmi_requested_devices, but it leaves any
> previously successfully requested device-ids in place.
> 
> Unrequest any successfully requested device-ids on error to fix this.
> 
> The code manually unrequests these rather then calling
> scmi_protocol_table_unregister() because one way this can fail is because
> of duplicate device-ids and in that case the original device-id must not
> be unrequested.
> 
> This also moves scmi_protocol_table_register() to below
> scmi_protocol_device_unrequest() since it now calls that local function.
> 
> Fixes: 2858f6e5f064 ("firmware: arm_scmi: Add multiple protocols registration support")
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

This was already done by the commit:

2224b622260b ("firmware: arm_scmi: Roll back partial protocol table registration")
