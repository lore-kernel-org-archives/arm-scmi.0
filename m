Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254A63AEF55
	for <arm-scmi@vger.kernel.org>; Wed, 19 Aug 2026 16:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787156576; cv=none; b=aSjIqjZVLSHE28n9b1G65whSAV7rdyP0x8oVhPOfGYgTOSvwEt4cpf2zJzxXaoWh2sYFHpQgvP0xoFxoO/teSHmEOPPn2rIeqZvys0BI92Xpm8oiWyRxeMq5l0Y3c1PTtgePFGoadwCScAhLtTx92QeqfE8tNGxQKs0uxaidZ0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787156576; c=relaxed/simple;
	bh=3OVEs+njzEHiD+JDYUlQm39TQKqhEP/e0jyYZ/bwxyM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VCiRGtZKTNKwNlxM8jJJboG1S2iW8Ynq4C0Cje/qTOCo3gsK23I10I1NHByToBpo9zjWCf31ecHCWf4Q9k2SiRLyHwg9mC9/m6KiSCUfwDnBIuRYEL4sMOxx72RdeapPYNDstbthuWubCHZDalA6gijweGGFhXK9SKIQrxgndqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X+/fJX6u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f70HQW/b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X+/fJX6u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f70HQW/b"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF1maG537284
	for <arm-scmi@vger.kernel.org>; Wed, 19 Aug 2026 16:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zdNvXJp3fYWDb4AeWrNS2N9ptcm8b/tF0m0nP1jqz2c=; b=X+/fJX6uFXJ/C5IE
	mH+lU7cavZEfKpJlQsX58EJcAjQPP1MMkLhq95kufJs1buOEcPVKSAeiXSE7/tlc
	7hxopYU8Ky+Fpe/rjrO49Voc0QO5hDywi+kM+f6YDEv6ynwZLvq3YNRXyQ4wfnzn
	g0ah5Q5XkJxKbRwpenNlsosV8qV34/jp2uea1Sc6HQiiuXwi5wUwBI/z7LvtP0yE
	G4ZFBXrCKwgbGP1/TOB1wzyzqM1xAW7b6uPJVKde8CnsVx1PKuM6PC9QQtk53FWH
	ZpDagyTQbICqAFL6nkOgKGMa0yxHdvEmQkogEi6oQ16ZGnF7yd9ZI/z8LQc4CnPY
	1yEoRQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es58ec5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 19 Aug 2026 16:22:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cf1c86963bso440305ad.0
        for <arm-scmi@vger.kernel.org>; Wed, 19 Aug 2026 09:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787156573; x=1787761373; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zdNvXJp3fYWDb4AeWrNS2N9ptcm8b/tF0m0nP1jqz2c=;
        b=f70HQW/b93kpR4b9YAaCmiif+NDZQVxqUlfG7XuUN6tYslwk/NoaEIzR048ncdM++K
         FhDDOGPwuwHwr8nvfE1ZG3C+6geLvJS81qJWqtNGTSd+BTPIBHewXPQJqpUn857Ifglg
         JQ3dq+X9U/kyUjWeemxF/81O8FuO9LFZksZi9tuazfo2OXquKfBetwgl7wedThPuROui
         DqhVU6UM1VLbJRh1r8pHFG3Pzf7whm3gptihPVBgBHbUbZrMoXTSGBjgZLpE7kcsjK6n
         4kKBZNUo6l71G4HNGaWZDRJFLWjAQrA7xC8y1DobqmD/ukL4+RMJBr0FAJxdhxa4ARo+
         32pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787156573; x=1787761373;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zdNvXJp3fYWDb4AeWrNS2N9ptcm8b/tF0m0nP1jqz2c=;
        b=souMcWK4Nt2Bx5JJLJDNRa6BcBvSI1ZRZdpUT4o9eu8VVG+0YEIYgdF3IhAZObwk/F
         eTLm+OAhKMOlcISaJsXUgJfqzcvvjGB4+CM4En4P4ebKt4Hh8c2kVO3qZpr6GOutfnca
         RNJV8mXWl7NQcrXluDhMYbX0rQvaf3jYq03zydwdfOhK+e5bJpbcAjg6CzYLMwKfuvLj
         Mro+FpqUXUTZsRXa84hh/Y/7gEOmU1dDtAFFEDAauSjs/P2HiFSdbKy3isMThn4cBqK9
         RN3+BQSAo85e5zVVPozeFkXp1orI+ZdHNd9cVTLdjM/qKml55JLEGkqv8J/Tasxrg5yE
         5TiA==
X-Forwarded-Encrypted: i=1; AHgh+RqO5KGDgTcNRWCPJy5hMLkqbF/fQp4zMEYabA5N3q+gkNXe+TXE4F3VdudqJxpt/fBklXWQu14K7Q==@vger.kernel.org
X-Gm-Message-State: AFuF++nAlRbifnkXvXU3GYo6sbflPN7GS7XazO4XzH3UoBwNUz0quGEP
	uL0TZxYRA5Ae8hmpycj5gtddFNLB8FVe8lWy6iVjnkVX/OxPv8gg6mTOljYYCgesdz5kd0PKc0C
	FedByjk7nlj4yewNEhvuLpa/HAoN9cb5OOSz1mLTKkRixwu7mN6cKWxre3dUH9g==
X-Gm-Gg: AR+sD12wB9j8DCOs/ToDUwRtoZuFOo5xAMo1sQIEgCcj6YdEgResOucrzOhYwt/qwMk
	56jZO2JEAFY1inihEk4es3hqINZHcQ1mNpP1uujq9EBXwVdCE3dpKf93Ne5GXXu49q5b0xwqjva
	er25mTxTciF3GQDpaS7x6uSH2k8rhq7MbIJys+2SPlqlg8YEydhcxIDIK1ntRp5SJvjf8WloxCq
	eUnjdCxhRf1HSSAgvRnarxk0QTlTQY3fX/Q0BOrgV8MkgGomZ6myA8y3TAetFnmmLDUJ3JxvcTr
	e8qXb/w82tzcViZ2S50CneJLZg5XpI9eZr557pIlueIoGlLvghUSzpa+QYmcWtH5o2copg1ZpD3
	jO/RaMdAHFBrHW1YnrASfdkPIaw==
X-Received: by 2002:a17:903:468f:b0:2d3:7122:833 with SMTP id d9443c01a7336-2d61a1d22d4mr2876055ad.15.1787156572695;
        Wed, 19 Aug 2026 09:22:52 -0700 (PDT)
X-Received: by 2002:a17:903:468f:b0:2d3:7122:833 with SMTP id d9443c01a7336-2d61a1d22d4mr2875525ad.15.1787156572113;
        Wed, 19 Aug 2026 09:22:52 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef7a0easm9906098eec.12.2026.08.19.09.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 09:22:51 -0700 (PDT)
Date: Wed, 19 Aug 2026 09:22:45 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Li Jun <lijun01@kylinos.cn>
Cc: sudeep.holla@kernel.org, cristian.marussi@arm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] firmware: arm_scmi: pm: use SIMPLE_DEV_PM_OPS for pm
 struct
Message-ID: <20260819092245.0000440d@oss.qualcomm.com>
In-Reply-To: <20260819061530.2391788-1-lijun01@kylinos.cn>
References: <20260819061530.2391788-1-lijun01@kylinos.cn>
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
X-Proofpoint-ORIG-GUID: fnDJLW6HDtOoF-8k5QeMklHyoTa2_NQX
X-Proofpoint-GUID: fnDJLW6HDtOoF-8k5QeMklHyoTa2_NQX
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEyNyBTYWx0ZWRfX43DEHTgkcf34
 ajxUolLutR88HbJTvOAbnXIzRmWxBogr1nuU0C6pQwF/uHhCLvLhTE5mWmMfU7gQh6Rt3//KQn7
 8O8GFGiUZxq0oypoBrD00KEfQWPk+DI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEyNyBTYWx0ZWRfX5fYzvD87TFnw
 FH6gvhRitjvCVIROx1+GVaeCTVvUSuip4ZwiG9Id/j0N2Q91+yC4DCY6ymUyKe6Goe8x7cRo82F
 Jb/Jn14zPEcM70ytRiWwpUjX5JBdfIzavpmAMeWQZbzjEnHthYtryoZ2rCAHHZwJCSv6JnJR817
 cdb+XlkRDvbesnAJhOKVbigF0Gc1lPTbX3LlAzzDbY7rfaDhLDWhEvrdAV1hNMmDQ8iydbRkGkh
 mHN89uKdYaMF6G9idCKu4R4FRnfcLmTH9G4N1FVGl5q3nx+xVi6rccJHqR1VvUibUVZyzYn5xD4
 1QG7Q2A873BQ3dLFm4ea75NMEyqMPLAdFOQbhS9/mTun+vXeA/P4O8pqCNKGtYCdp81nsNsTCFg
 LFehrsblSdb96D9crjwtU2kpHUdXUoxqkq1JP30IuUgby1jnTXympGmxBN3iA5SJsALe6LLhuIn
 EgkrFukGzspfYZCr80A==
X-Authority-Analysis: v=2.4 cv=Oc+oyBTY c=1 sm=1 tr=0 ts=6a85d85d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=QMhJhkxfpb1qmTAqszQA:9 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190127

On Wed, 19 Aug 2026 14:15:30 +0800
Li Jun <lijun01@kylinos.cn> wrote:

> use SIMPLE_DEV_PM_OPS for scmi_dev_pm_ops,and add the value of
> .freeze .thaw .poweroff .restore.if these address are null, may cause
> error in s4.
> 
Read the note immediately above the definition of SIMPLE_DEV_PM_OPS

That is slowly going away so I doubt we want to introduce more instances of
it.  So as part of this change, flip to DEFINE_SIMPLE_DEV_PM_OPS()
and make the other changes necessary for that to work correctly

Jonathan


> Signed-off-by: Li Jun <lijun01@kylinos.cn>
> ---
>  drivers/firmware/arm_scmi/bus.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> index e060edbe7e83..4ab32f1eed4f 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -13,6 +13,7 @@
>  #include <linux/kernel.h>
>  #include <linux/slab.h>
>  #include <linux/device.h>
> +#include <linux/pm.h>
>  
>  #include "common.h"
>  
> @@ -361,10 +362,7 @@ static int scmi_pm_resume(struct device *dev)
>  	return 0;
>  }
>  
> -static const struct dev_pm_ops scmi_dev_pm_ops = {
> -	.suspend = pm_sleep_ptr(scmi_pm_suspend),
> -	.resume = pm_sleep_ptr(scmi_pm_resume),
> -};
> +static SIMPLE_DEV_PM_OPS(scmi_dev_pm_ops, scmi_pm_suspend, scmi_pm_resume);
>  
>  const struct bus_type scmi_bus_type = {
>  	.name =	"scmi_protocol",

