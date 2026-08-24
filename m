Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA225470EA7
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 17:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787593437; cv=none; b=jmAq+0DOJloElj6Jk6pJQ2B+aDDycHXIVg22xxGUa/IjbAx53+DfmbAIRu4rDWy4LBaGd7DUwl/NzBeJpdsoVq+i7tkBZSEvIiDgk3gEDzwDHIf6oairJwOiyAqbE0fAJ5T67pV5rlnj7eW1vQDdiYPbdS4STcOPsSPn66F9gNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787593437; c=relaxed/simple;
	bh=MZiw+eluyN0v1wcJlbv+XYqfapZt0gDA0pHoPnoQYYs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F2YfwNJVcs4N2Fl+qJSYXR3Pu8kmotwQ2FE6LkZ0Qmrd98huCjDKP4V4K0yjs0w+OZWthm5kZriOYrVJEvODTVFu/roPa8XO27QXaW2Mbwb4K2dosncnRs4yQpEiOIlzlMJlSLCz7Vb65IloDP87CvfFTjfd5pbxGhPSYgFC06s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pV2oM7kX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L3GKrR/v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pV2oM7kX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L3GKrR/v"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OFmicp3994143
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 17:43:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wIXa1i4FToCq5BvtMUKZe6PS6FxIaYe/Fw1HFVvct3k=; b=pV2oM7kXSREA308K
	koty8zjmLK2Qxgtx0h1S9TsF7kqd+00WHGUOhcZldg9ghYpsxQICTuzIq/CXrJ5k
	lhuYUKIAr308OeTycSyA36DHP+XlDSIfoWq8oXmZqigQMsMvWWOvlv2D9pB0e1+y
	e2xwI7EYbFs44mabOjXo8CES5+LWWhJTn2HAm0Ag6fDhRpm9y94kzQGWEKfSvtco
	09uNoRZAir2JORF+VpsLQa17WQUrgk0FyTuVPn2lq2AvF8N4F4QQ17DoRu5Y2N82
	1n6FYBVmBux9da1SaHEw1yXTyIWhbY17ghDXywA11Jerwds6dsZorA0T2mKUnxJc
	u7IzLA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8jgk2jfv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 17:43:44 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8484b9fb055so3432399b3a.0
        for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 10:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787593422; x=1788198222; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wIXa1i4FToCq5BvtMUKZe6PS6FxIaYe/Fw1HFVvct3k=;
        b=L3GKrR/vnsqDeVs/aqYjFyNe7MsCEstb90kuIqDaDxOcophk9P7VRFTGPcNZqKL0me
         IsgQpXr1F/lWXQCYH7gkszmhAJSEXQCE1QrETMrf3SsLEVi5oAuQUO3j9GnWLZNNdMNp
         K/Quzqp58I7R73q1tPxh19RjJ/qvdeqssEg+BoWI12AWsIVDUMcUc5T8O19pQvmKnfkW
         k8owNO05wIjZbG77mU1y1xJApP2hhL0NG1K0HZ5Iti3Zgo8ujgnvU5jZklKwkENUSdLk
         PUslu2JVmDbf2WWGsIY5GCLNqEqVmV0lDeW1YX0qDTUR+RsWI00o/Hy5+KJr/uGc05Do
         Qcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787593422; x=1788198222;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wIXa1i4FToCq5BvtMUKZe6PS6FxIaYe/Fw1HFVvct3k=;
        b=U7GBXsSk4lJ2t4PNFPSnZQ20yLufhnUSSWh7cdnlQ1JWQhEJrk83+8IOxKFsE6Fi9x
         lOoJIIYb+gG7HcVtjhG9SwUYHaYdSZ+0cPjK9SzAVEdeU9gl1aZSVH95K/i2lb046wnQ
         iinB9yPPP11PCwh15ULFHF/VipU7P1zRQeyh/XjxZZKIM+cECOLFOv1hsQTkbi0ktEOd
         zWH2Yq+OWNyGR4uHa68379pAIl1lvitU7xHumQ5pwb6uXUb00lFYYkzPNiru+dfBOcy2
         9XcVIiYY9JaHZszoaWjnce9/i/90ccE5bHxuLcRFhlZt4T1Tt4XYdd9ivWeMlFYZg0g+
         6Ybg==
X-Gm-Message-State: AFuF++krZ4El6yDECRUhmGuoFc3EaGKpa3aDHuTHlbTX6QroXjzaOpOB
	610bcevcNJjaD8ueQReMah6U5/zxCCMgX158fwbPm7FhEPr2fn4ME/cB2YmjKMroR0AlP/8QTMJ
	H2z//nMgUHOCBSpEAAuUEgryH571QHst59+sy19tm9+csmmzI59hrJv2oSlhR2g==
X-Gm-Gg: AR+sD13/ybOaKojy86syEvqmmYRx6xvvtDq8VkIRE0nQ9A6MYABEyY4xKB1r2Unrril
	zJcpd5es1c9fWSMSegBtCobEAV+fLB666boLCrOXtm40hgw3ltwug7ylXebI8GrHWpUXzXQt4ly
	t/LRmD8YE8pKgwMqWm4sw7kpGv/dOoe+X4vJkaWrWRHYk+dnxPdCmVoQoxQQijKMm90DSm8ltc3
	bFANqFsbtuPDInHEHcJ6lEsdJYoFrtzvoljUV5w8tbUq3aPRVgFQ+2yKNv3BHVxb7KC3wvUlpEf
	hPLZt3gvNBBX5+NaKA19Js1xsg8MB9/9uBlQ/tGI7c/Y95REBFAS7wfNyRBFiAXmeZPl2y7kpl1
	Ftu7B8bD8aUYP6PMfMPqhfHmKqw==
X-Received: by 2002:a05:6a21:4d8b:b0:3cd:6f46:aceb with SMTP id adf61e73a8af0-3cd91103da8mr982752637.8.1787593421687;
        Mon, 24 Aug 2026 10:43:41 -0700 (PDT)
X-Received: by 2002:a05:6a21:4d8b:b0:3cd:6f46:aceb with SMTP id adf61e73a8af0-3cd91103da8mr982668637.8.1787593421228;
        Mon, 24 Aug 2026 10:43:41 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d2d1esm29442144eec.17.2026.08.24.10.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 10:43:40 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:43:37 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
        Breno
 Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 4/9] firmware: arm_scmi: Fall back to ACPI HID when
 "compatible" is absent
Message-ID: <20260824104337.00002275@oss.qualcomm.com>
In-Reply-To: <20260813-acpi_scmi_pcc-v3-4-cb6b88b4ebb3@kernel.org>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
	<20260813-acpi_scmi_pcc-v3-4-cb6b88b4ebb3@kernel.org>
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
X-Proofpoint-ORIG-GUID: cke6oarJ3eewrdpUsjBaadlFCXJ6IQXR
X-Proofpoint-GUID: cke6oarJ3eewrdpUsjBaadlFCXJ6IQXR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDE0OSBTYWx0ZWRfXzhPRnkK83SX9
 Izl7ww6YjsP3WIRmffKR2MN2aqngJU28/UZQsYi/8gpqmNiq7d9g5MfnFf3VrgwHUUVYkC5fHQ7
 Vokv8yevK2hdXzbNk6YlOKsUTcPQXHQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDE0OSBTYWx0ZWRfX1UbQG1Rw+Oiy
 FBjwb4GGBRrCN5b3QHEoPWInT/FDlM+CrIA6EB3+/KVSpZ8OQF33lJpikMvVS288v/OSn/4Ce/R
 VP4P2NIPDbbcy9ejBllX+dzHy6bP7P6SBNpPagRMQnQERFwvjkHoP/sTkzzGXv8jdZRv3Wospcy
 iJhWFtCxyd8lQiFnaS+sU7L9cfAoK7jwtxwsmkP4uC4dMpj2sOxZfsG7k/S2KiS+IjpptpIEAPP
 H8WyyKXdwqnI83/ltyxe3s3M705iIvJGpXLhwbHcVpc9bX9aaz4Q/kqTXetXmlEWqq3CWRUSbSo
 DOujFmZN8hgTnTtcd3vRQFtFBVttHO6vbZnv32VLp7xP1+WDXUNep2SpgdHI5iv/zE8ahB6yuQZ
 8xNuAgPeEVMmDJyMHPfwZ68Y7ZaYEFsI81cB+UgxyoRSUfXIyYGEr6jJ5/mbfiew8O4Bioma5aH
 SVipdXPAkuA8+Fd2YTQ==
X-Authority-Analysis: v=2.4 cv=KcvidwYD c=1 sm=1 tr=0 ts=6a8c82d0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=l6Goj-m7ziazzFgbZv4A:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240149

On Thu, 13 Aug 2026 12:32:59 +0100
Sudeep Holla <sudeep.holla@kernel.org> wrote:

> scmi_debugfs_common_setup() uses the "compatible" property to
> populate the debugfs transport type string. ACPI-described SCMI
> devices do not provide that DT property, so the string remains
> NULL and debugfs setup falls through the allocation failure path.
> 
> Check the property lookup result and use the ACPI HID as the
> fallback transport type when an ACPI companion is present.
> 
> All supported DT SCMI platforms are expected to provide "compatible",
> so the non-ACPI fallback is not needed for normal DT operation. Keep
> the explicit "unknown" fallback anyway to avoid passing NULL to
> kstrdup() if that assumption is ever violated.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
Can drop some complexity in here and rely on the stubs in acpi.h a little more.

> ---
>  drivers/firmware/arm_scmi/driver.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index 9014723e0f7f..9ad827c6a9ab 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -16,6 +16,7 @@
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
> +#include <linux/acpi.h>
>  #include <linux/bitmap.h>
>  #include <linux/cleanup.h>
>  #include <linux/debugfs.h>
> @@ -3063,6 +3064,15 @@ static void scmi_debugfs_common_cleanup(void *d)
>  	kfree(dbg->type);
>  }
>  
> +static const char *scmi_acpi_device_hid(struct acpi_device *adev)
> +{
> +#ifdef CONFIG_ACPI

Hmm. Ugly that acpi_device_id returns an empty string.

However given when !CONFIG_ACPI the stub for ACPI_COMPANION(dev) is
NULL.  You don't need this dance anyway.

> +	return adev ? acpi_device_hid(adev) : "unknown";
> +#else
> +	return "unknown";
> +#endif
> +}
> +
>  static struct scmi_debug_info *scmi_debugfs_common_setup(struct scmi_info *info)
>  {
>  	char top_dir[16];
> @@ -3080,8 +3090,10 @@ static struct scmi_debug_info *scmi_debugfs_common_setup(struct scmi_info *info)
>  		return NULL;
>  	}
>  
> -	fwnode_property_read_string(dev_fwnode(info->dev), "compatible",
> -				    &c_ptr);
> +	if (fwnode_property_read_string(dev_fwnode(info->dev), "compatible",
> +					&c_ptr))
> +		c_ptr = scmi_acpi_device_hid(ACPI_COMPANION(info->dev));
> +
>  	dbg->type = kstrdup(c_ptr, GFP_KERNEL);
>  	if (!dbg->type) {
>  		kfree(dbg->name);
> 

