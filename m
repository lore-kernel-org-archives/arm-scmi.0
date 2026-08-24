Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6DA46EC96
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 17:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787591081; cv=none; b=oMOgKfpuvPFA6LIDrbMLyez95mXjArJTTuZC1wTpTDwvWBGxSKhBoscSytbEAss9vKKy5IBC8E6WDhSnYTgEdCL6fKv4CJKyqFv8X6s9qt+N0lvxX6L5veAk1R1Hp1lLXNbEfjEp8HFunqvs5sHd0cGTIH88IiUyWf0P06NeEUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787591081; c=relaxed/simple;
	bh=uMOQEp1SuZ2raCtDLtffS5xfxw0ghpwVMCxd8ZSO/xY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KknW/DHPbjQgGM2EnszD5ADLmmJF2EmCFOEHi7F8GEEzHAHvPcvj/QLqKZ5xzVFAiZQQKFKEAwZgkMu8UhwYNf6uW/fFCQWfrGttLcRfP6edNpzaN1y6Go779jCSRD0UM6P+Xauz6bxCnL/aHvkBspMEwgYWjo+wjpONKPr2EMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RmhNuGHL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b7cdPiUA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RmhNuGHL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b7cdPiUA"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OFn3SG2261428
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 17:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GYaY+vnNNOIe/x25Wx12BokplYhFQWfsKSh+lqn4l68=; b=RmhNuGHLFAU4b8m8
	DggsyjFNICrReUXFgzf+yop0aKJlWvwJX0Kjsv+Pyvmf9pC2ro3m2WLjlTa6q5rA
	GCdzszOsV/wyKdIW9y0uo8pHA2HpQ/FlAzZ1BGlDC6loBLAyWQ9YNwp6litmysqM
	4GcvHnMMNTjjvHJwJH1T8/TNyIwsZUH7KzIYEBcWEQwmdq5AgDEojuyfWcv/xF+l
	kaWN2EDc5PPG6QyVN4Tt7TqP6bg6Ds0YHzle6cx0t1gJUyivvH4N7HywjMpnZPEK
	ONiuQtfigFNIHl3D7YQy2DIVh4NSwBl3kxjsPWLNYtCeBzbL5ojMAGkZiRX3Mv8H
	aGbd1w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8huf2e32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 17:04:37 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbedb8673ceso3359755a12.0
        for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 10:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787591077; x=1788195877; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GYaY+vnNNOIe/x25Wx12BokplYhFQWfsKSh+lqn4l68=;
        b=b7cdPiUA5r4u/rPxGJqXM8XN+8NeVKVENnwRS0pnI0RdwKdNVnO9U7Cp5r/Hsm4Io8
         QYgwOBVcoRsfvUyi8heAiRZem8d6yc+Dpmf9UfdmGvAsS8E+2mUmiiVtzIOafK7J7n83
         jK5gOfSPi4XyOnAyzUjVU6QrWsfoqE4NkUDQzLLNyixQWHPO/2YoUmk7zSO1NEyq6Gst
         AUIJ9xBAWUSdleZQ5BMz/ONrcvrughXhNe5LwrcPo8cst5i8ID1aZeiHMvhLjz+YF4Ew
         uziTN7XXFORFNC2lgYlAoA0f+DCqzbjZygKakVpFFh6OlLwrmpfK81a9G7/eg6W576IE
         FIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787591077; x=1788195877;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GYaY+vnNNOIe/x25Wx12BokplYhFQWfsKSh+lqn4l68=;
        b=F4LVTSWtPKueDdiZuMTj6Eu5ZFT9R9/rTljXEsWmbkQU2bBgtrQAehHyzpu6Q/azAv
         toq/ye0QnYgC6jk+UFcbaGBmkNvoDVZBdQ95dBHtW3zjpbi73S5fSEorKhhhuMSh+Ogn
         P5VqLSAQgEj3qJqGjJZ2bVo1ldlLdRGeXt8lyrD/bC+ZyATAKo31Ej0WSNJmCzqbM1lG
         f21K7pTPzKjdpzMsmWyvh0YJK5AGmTHmrgPl+0Xu7jgnrsf3AZHPwr8qmxT5AGBNj9n0
         OtAJY/hioLup5diXk0m+Q5M78RUCwmGGi397D2ysab6F2j59WWRO4SFLKMi5fqf5GYKZ
         43GA==
X-Gm-Message-State: AFuF++kWzRcURrMjKBeZVwumeQA/ALsFzfPoVHKkLnR717Dqvsk6px8p
	Fvz26/kmHVlDpK92w6SFzvbk927j+i0KgSb4yM4BWiRjzcL/R9wnKthnIcetwVEMuUooWVeauOq
	HWhGbapUCnHF29avfj+ynHrsSQYIvEk8OQC8ldkTLhNmT7k2KfqHzoA8SIFrEgw==
X-Gm-Gg: AR+sD12wuauAbcHpN0jEAQMIsEHMr1dldZjMKPuzPE4TXGfjzKhdG4LjQdGHPkbw6+i
	au58ckNd4q+rSbWxYV2EPJgw7pcfn8uXlV1lpqd/AV2p6yfd3bNUcgM3myUYCrUoTvYicCnN8eh
	dUm+7H2D33JmBd9HOzebbLk1HxN/Fk0leyzdCRLJ1TDvTGpCf0rDniH9OTtz7XSjjUZwJLvHAgQ
	2fiFQj0Cc4Jo99yUdKDmuCcelgD6DIUnjL9SKuwdohaV2AI4b6LFdXzRlHSjtcxuvqNlOHSAEqr
	Cvf6G4Zv495rVLtHhSIfOMLGwGdqajQNylm+lVPDH3sUas687jC49n9ZmT+618HsI0gbr9icmaZ
	0tZsFRBcpjERfno70Ng1b9mfv0w==
X-Received: by 2002:a05:6a20:6f8f:b0:3c3:a31b:3949 with SMTP id adf61e73a8af0-3cd911bf820mr335860637.11.1787591076712;
        Mon, 24 Aug 2026 10:04:36 -0700 (PDT)
X-Received: by 2002:a05:6a20:6f8f:b0:3c3:a31b:3949 with SMTP id adf61e73a8af0-3cd911bf820mr335639637.11.1787591076011;
        Mon, 24 Aug 2026 10:04:36 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc199e60abbsm1329566a12.23.2026.08.24.10.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 10:04:35 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:04:31 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
        Breno
 Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 2/9] firmware: arm_scmi: Extend transport driver
 macro to support ACPI
Message-ID: <20260824100431.00002daf@oss.qualcomm.com>
In-Reply-To: <20260813-acpi_scmi_pcc-v3-2-cb6b88b4ebb3@kernel.org>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
	<20260813-acpi_scmi_pcc-v3-2-cb6b88b4ebb3@kernel.org>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDE0MyBTYWx0ZWRfX14KrDoHwCZoG
 lpUBoeYq3BzOQp7jSBHn5tsmASKYqsZ1pkpGBFNdXH16isI/0wKIMexP1DCN0uLoOLqfwVOhY4h
 ijYL+wgdZRBg4RBGom/KGKHsy8RCrgc=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a8c79a5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lMat701TfqHOrGvLdtAA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: ajS-DeOAe3bZO29WawAA_CWVjD2-9_rJ
X-Proofpoint-GUID: ajS-DeOAe3bZO29WawAA_CWVjD2-9_rJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDE0MyBTYWx0ZWRfXwduCt2RtmdN5
 etAxvTrxjCD3PFsukbnunMjJ8eHp7BONOVW3cN1zH4XiaM+T9wotrpDchQSDuCZL1vpqoQ3wumQ
 Xlomkt/OmyEEHSa8ha2bnuCNh6dDE5Z5pJYzt9XO569/UsoPGgm+bOfz5IXSXUP3eGszbq+/PJZ
 6frpnozcNOX+DQneYKMQ85RX+AJpz30HL6lisUQg36ZTdXwUSxZu+83DjwQ9Cng1L3YkyGEjav/
 XKZYc+1YmuZrrRZDcZesU2A2UcmHA/iV2qTwFvzBlZOuWUnjuQhvNVIZ29iNCUnd94BA1oCT4G4
 TmP/B58YnGpHmgFKAjSVhPMpWdbN/X5n+W+p4q+cHXTzNWyJ2iDYr+IkWG0l8Wfkf8yPUqCjyO4
 KJnitf3IJE5Ywy5su+IwrfWN3gynTrgQ3geOUEr5TbKMGNDUR8pb2zuuOc8+REDjVvZncZQkwOZ
 +fCzJP/IOZPtD18Dsww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240143

On Thu, 13 Aug 2026 12:32:57 +0100
Sudeep Holla <sudeep.holla@kernel.org> wrote:

> Extend the SCMI transport driver helper to support ACPI-based systems.
> Introduce an internal helper macro that accepts both OF and ACPI match
> tables, and expose two wrappers:
> 
>   - DEFINE_SCMI_TRANSPORT_DRIVER(...) for DT/OF transports
>   - DEFINE_SCMI_ACPI_TRANSPORT_DRIVER(...) for ACPI transports
> 
> For ACPI, set the generated platform_driver .acpi_match_table via
> ACPI_PTR().

ACPI_PTR() is often more trouble that it is worth because of need
to guard the tables if they turn up in code where ACPI might not be present.

Now if someone fancied doing the work to make it work like pm_ptr()
then that would nicer.  That one lets the compiler both see the stuff beyond
the pointer, but also do dead code removal on it later.

Anyhow, doesn't actually matter either way here because you only use that
with a non NULL pointer in a driver that is ACPI only.

If you really want to do it, maybe pair with of_match_ptr() but
that one is even worse as maybe some will be having fun with SCMI and
PRP0001.

Anyhow, random diversion aside, it makes no difference in practice.

> The ACPI wrapper relies on the firmware-node propagation
> provided by the preceding change so fwnode lookups on the spawned
> platform device see the correct firmware description.
> 
> Keep existing DT users unchanged while allowing transports to be probed
> using struct acpi_device_id tables on ACPI platforms.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> ---
>  drivers/firmware/arm_scmi/common.h | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
> index cc7d11c3c1f3..0b896171faa2 100644
> --- a/drivers/firmware/arm_scmi/common.h
> +++ b/drivers/firmware/arm_scmi/common.h
> @@ -9,6 +9,7 @@
>  #ifndef _SCMI_COMMON_H
>  #define _SCMI_COMMON_H
>  
> +#include <linux/acpi.h>
>  #include <linux/bitfield.h>
>  #include <linux/completion.h>
>  #include <linux/device.h>
> @@ -615,7 +616,8 @@ struct scmi_transport_supplier __supplier = {			\
>  	.th.supplier_put = scmi_transport_supplier_put,		\
>  }
>  
> -#define DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, __match, __core_ops)\
> +#define __DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, __of_match,       \
> +					__acpi_match, __core_ops)	       \
>  static void __tag##_dev_free(void *data)				       \
>  {									       \
>  	struct platform_device *spdev = data;				       \
> @@ -679,11 +681,18 @@ err_mem:								       \
>  static struct platform_driver __drv = {					       \
>  	.driver = {							       \
>  		   .name = #__tag "_transport",				       \
> -		   .of_match_table = __match,				       \
> +		   .of_match_table = __of_match,			       \
> +		   .acpi_match_table = ACPI_PTR(__acpi_match),		       \
>  		   },							       \
>  	.probe = __tag##_probe,						       \
>  }
>  
> +#define DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, __match, __core_ops)\
> +	__DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, __match, NULL, __core_ops)
> +
> +#define DEFINE_SCMI_ACPI_TRANSPORT_DRIVER(__tag, __drv, __desc, __match, __core_ops)\
> +	__DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, NULL, __match, __core_ops)
> +
>  void scmi_notification_instance_data_set(const struct scmi_handle *handle,
>  					 void *priv);
>  void *scmi_notification_instance_data_get(const struct scmi_handle *handle);
> 

