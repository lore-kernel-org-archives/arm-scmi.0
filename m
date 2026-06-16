Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9C12356C6
	for <arm-scmi@vger.kernel.org>; Tue, 16 Jun 2026 19:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781639611; cv=none; b=aPPkvkykQHViF8Ib8tvrnLrpjamSUxDTQ3nmq0mjdIX/TYaIOXfs4762KBESwlwg8SkLMDEJtrSxRp0ym45tl+iXHCW6PaWqkofqdGgpMYck8lRsXErJeCo257x+kBQjHVqvA1Z0hb6kqOiHpCqQGF2H+0jqnHfXB5QEQU0pi2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781639611; c=relaxed/simple;
	bh=3j1iAbwip3MXBelKsZgxoBbS2Ky//DwfF+Bz78aHnY0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=V71gP6I14of3wekgZLJs2+1LrMsmoDJLOPbtKBS/GaK2pX9NjBX4mUCP/1/Xqhw0wvZ9stPFUhkkL++NXc2XboWvLwMjCUSoSnspF+5XyY4MiBQDIVUgp49U4LSf2J+XvolPczvxBr4U7zJC5E3gL5rEDV+acCoALjzW10aP//E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iX2176kk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dhipdKEp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iX2176kk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dhipdKEp"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIOZBI303258
	for <arm-scmi@vger.kernel.org>; Tue, 16 Jun 2026 19:53:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2nKMcxi54NbqW8wjhguv+GM1uZZW8w55AzUsDGhMNIY=; b=iX2176kkjLU1lcEH
	7RkzJ1rIHnwvn3cfxtrZLeunR1thRCKE5l2QKaZQWR9doAk37Jm0avgKfwlCBXea
	eeNvYBm2Jkigi35sDzojS1TV/8fBWo3Suv3IDbPZ+D88cyAQWdMaiXsNH9y9iYsj
	YjNsUBWKELugrjg376j1f++0dmeONXnjV68eT3XbJXQPtp1m2JkdqILhMoF+pYcO
	domb7P2HsPTFTJ3nMlqYxQG9QDpbyayCYlYTKmXX+gr0j9DuQ3HO3/ywS9lCrN3k
	AmzEPKinoeffFYWzCObHEvtcLLz+lcw/2ff99t086PRjZ7P6XfDy9wW+nZTlpX1T
	Gh8MPg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1epbk0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 16 Jun 2026 19:53:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ccd719a2f2so79067396d6.0
        for <arm-scmi@vger.kernel.org>; Tue, 16 Jun 2026 12:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781639609; x=1782244409; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2nKMcxi54NbqW8wjhguv+GM1uZZW8w55AzUsDGhMNIY=;
        b=dhipdKEpHo9Frq/8sQBrIH4nhnJFstzG9EjbyuRpNO7UascDTO14SGlorzK7CIZpDU
         ZTPKbOlDngCRP96mQE8llbIWp4Qv7tLLlRRntx1spJdYXlK7iIij3BVF5iQEJ2h1ide5
         JK7oJ8ibLtFe6Gsi/GtDy0wNqJorgZn6WRdphDV7UhenSjGowmqC+HaDZkKEpo+ywhMh
         Ni40iZGrIXxHsM3mSxixQZjfVyqWVcye28Q1QF3W66+yvKr1It+ZYO31L6QslJmAgCr8
         aSf4fQrP5j58QrDFAaxXvhW70x8tamtw2DyLbqT5bcCm9nznvNEWx7dL05BNXTFf/z5x
         ZFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781639609; x=1782244409;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2nKMcxi54NbqW8wjhguv+GM1uZZW8w55AzUsDGhMNIY=;
        b=L0TO4Ahxe84GJI9iZqLSnFl7CwodsZQT9Wap3E/2mgNSPmolNgPljAUa2qKLjrK6tM
         BW2IexiOlb4Cfb/9PL7D4r48rvEaUVPBK+OcXIwQsjOr5mkO25ZYAnG1mbit1biZDe1p
         qGKodEl3dhR4PmDqPERndpZYicAoEix49YEJ2Mtv3Q48oJl4Kj88C2BhsxVFYNuV8zWK
         tNF4z+dXEnhUeO9nrhtI3wp2TMcKTp0U5RgQ1p0vT+8hsP4lMR4OODSsPJAOlAjMxgZO
         MvZovkHVG2CNXYixCbjJA0rOIMQGtDLCR0da+GFJigEz+Mirq5pQOuWdX8mNZlvcbVUg
         3TTQ==
X-Gm-Message-State: AOJu0YyoefnqSfDbbrmnqdnovRE9rZiswMuLvLoUnaBD9lFBGA42qlPv
	toqfBTGEvEb+BBO0AIBAvh0DBFirjWIIm4DbQpyxMmhJmMJBaAFt6ZVnzIsejvoCjovtf4qd8KD
	XVHGm2C50UZIFt1GRPhN3TvMWFQ3a4mXENASF5R59fX+4hgEuc0RKBNyjEf9qSQ==
X-Gm-Gg: Acq92OEkkEjmCw4fnKr+0HTCUFgZCVJDeFvThJWPd9BUi+Y+CH4PE/5vp/l0ySFByxy
	iyzrasSRr5qpCxHOJ/ly1QK3pzgpw91mnXhhtT4/7AkCETK5pXe2TzqiyGwJSbxYoNQgXotpEd+
	TBx+Hw9qQAsBZxPUvyao9xUaciqOYHQqjnlTcfefZHEuTf2i7ImYDb2ufwygK4Xz4Wl58XreGVi
	a8mFvDKg664vkAN2fXfYT/T8wCqLA/WxLe2c0zu4RovcHmMOOTC075ReRVXdPrWPn7NyZ6D6FFE
	MO+la6lJPjALlpcT3v0FW5YQXj/dMSmUluiyKlwGZl1eWLyhMDlDuPGHzBdwAUHJfHhqRAg7NTr
	HUsiqHf1HgsIqRQAHc/AzyP/Ac5QSfde1tvQVEkvYum3tLinF69C6qfZFxf1duDGwFNFjx6SE7Z
	j0lBrRwd+fbHS5TNp7bT0MxiYZXsOugChGLWxxiNaLQlPgbipSiteuPDlNMA7d9nTdvAsdfCZbn
	rlQtznBybaQbxjk
X-Received: by 2002:a05:620a:44c5:b0:91b:d037:4a00 with SMTP id af79cd13be357-91d8add3a1dmr192596185a.12.1781639608865;
        Tue, 16 Jun 2026 12:53:28 -0700 (PDT)
X-Received: by 2002:a05:620a:44c5:b0:91b:d037:4a00 with SMTP id af79cd13be357-91d8add3a1dmr192592585a.12.1781639608423;
        Tue, 16 Jun 2026 12:53:28 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb8d1de1fsm708913866b.55.2026.06.16.12.53.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 12:53:26 -0700 (PDT)
Message-ID: <2d863db7-afad-4413-96db-7a1befca62d6@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 21:53:25 +0200
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] firmware: arm_scmi: request modules for discovered
 protocols
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20260616-scmi-modalias-v1-0-662b8dd52ab2@oss.qualcomm.com>
 <20260616-scmi-modalias-v1-2-662b8dd52ab2@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20260616-scmi-modalias-v1-2-662b8dd52ab2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I/ZVgtgg c=1 sm=1 tr=0 ts=6a31a9b9 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=0IHGurON3k-uK7srJYgA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIwMSBTYWx0ZWRfX/FTzICk6tcIJ
 Zo729ITBtjUXRgpCBEaH0d5Chd3JstL6DWU1YcmnRoe8o4SM5JB4W7x2x/ZPlezc3A4SKSo7deF
 +8c58EXZZu4C37jBw8U9nZ67r8/5Kgg=
X-Proofpoint-ORIG-GUID: ilFmlH3lJNabOYQnnl4ppWFTPwHw94SY
X-Proofpoint-GUID: ilFmlH3lJNabOYQnnl4ppWFTPwHw94SY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIwMSBTYWx0ZWRfX5i0g5QVHlgOW
 uBePiCfrFpYVigQuDfjcPUL2JjrbhPXiB+fiEI+Q9iZDsygq/mJyLZ76lDQAOXIn6uHLPA8hYxC
 mxVtaS0+Frn3PpBVBP6xlDiAE7owumz8ckBy9QScrvtlCbyAslwRNP+JZaN2GhbEUmp8uIrc4xK
 cX5w9FcFjd/b1ExZ8OWCjFeIqmvDntzjXiErEwZ6RrpYvpZfCT8MwAUYuKD9WO2lqFdHd3frFBG
 zs7QZx1XyhL6kwNwzvhwqoIDi98tVoDKbGF4AxekhGaRsS33u1JyX/tJOe3Llggk2ZeitvFJEUs
 LK/soYqFrJm20862uVzCtnO02+6dluzIIMF41n8ucLouROzLOSd6CGQepK5lJhDy5QjvjR6dtfG
 /90Nh+e4y7cQKxQXPkzFrXI6aRZAQ0DOgqsZl2R2y/p0yVxA6ACBtVVVzUIy+YNynKgNzMnad5K
 PWiVFSlUpE6nAK0tXIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160201

Hi,

On 16-Jun-26 20:09, Bjorn Andersson wrote:
> SCMI client devices are created from SCMI driver id tables. If such a
> driver is modular, the core does not know the driver's client name until
> the module has already loaded, so normal device uevent based autoloading
> cannot break the dependency cycle.
> 
> Emit a protocol-level alias for each SCMI device id table entry and
> request that alias when the SCMI core discovers an implemented protocol.
> This loads modules that have registered interest in the protocol; their
> normal SCMI driver registration then requests the concrete client device
> and the SCMI bus matches it by protocol and name.
> 
> This allows e.g. ARM_SCMI_CPUFREQ=m to autoload on systems that expose
> only the SCMI Performance protocol node, where the cpufreq client name
> is Linux-internal and not available from firmware before loading the
> module.
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/firmware/arm_scmi/driver.c | 2 ++
>  include/linux/mod_devicetable.h    | 1 +
>  scripts/mod/file2alias.c           | 4 +++-
>  3 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index 3e0d975ec94c..8538eedc7c3a 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -47,6 +47,7 @@
>  #include <trace/events/scmi.h>
>  
>  #define SCMI_VENDOR_MODULE_ALIAS_FMT	"scmi-protocol-0x%02x-%s"
> +#define SCMI_MODULE_ALIAS_FMT		SCMI_PROTOCOL_MODULE_PREFIX "0x%02x"
>  
>  static DEFINE_IDA(scmi_id);
>  
> @@ -3362,6 +3363,7 @@ static int scmi_probe(struct platform_device *pdev)
>  		}
>  
>  		of_node_get(child);
> +		request_module(SCMI_MODULE_ALIAS_FMT, prot_id);

I think it would be better to use request_module_nowait() here. AFAICT there
is no need to synchronously wait here for the module to actually get loaded.

Either way the patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans






 


>  		scmi_create_protocol_devices(child, info, prot_id, NULL);
>  	}
>  
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> index 769382f2eadd..2cc7e78e35a3 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -477,6 +477,7 @@ struct rpmsg_device_id {
>  
>  #define SCMI_NAME_SIZE		32
>  #define SCMI_MODULE_PREFIX	"scmi:"
> +#define SCMI_PROTOCOL_MODULE_PREFIX	"scmi-protocol-"
>  
>  struct scmi_device_id {
>  	__u8 protocol_id;
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index a5283f4c8e6f..40a37b6bf1ad 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -852,7 +852,7 @@ static void do_rpmsg_entry(struct module *mod, void *symval)
>  	module_alias_printf(mod, false, RPMSG_DEVICE_MODALIAS_FMT, *name);
>  }
>  
> -/* Looks like: scmi:NN:S */
> +/* Looks like: scmi:NN:S and scmi-protocol-0xNN */
>  static void do_scmi_entry(struct module *mod, void *symval)
>  {
>  	DEF_FIELD(symval, scmi_device_id, protocol_id);
> @@ -860,6 +860,8 @@ static void do_scmi_entry(struct module *mod, void *symval)
>  
>  	module_alias_printf(mod, false, SCMI_MODULE_PREFIX "%02x:%s",
>  			    protocol_id, *name);
> +	module_alias_printf(mod, false, SCMI_PROTOCOL_MODULE_PREFIX "0x%02x",
> +			    protocol_id);
>  }
>  
>  /* Looks like: i2c:S */
> 

