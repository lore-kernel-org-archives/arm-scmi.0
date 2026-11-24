Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560243;
	b=DbtATWn54Qwm0vph6ICqrHhFcUqpvhYRhBbcfZjxJyk5Lj+2kRDujoV1dOQMcYdvvXHm
	 EoT/bKWZW0CZ1j4WEqbf9mGKbgDLnXWzCF9vRDBbu6d00zfGRBHxgjsnQEOaGnDVwcRfD
	 pl8PqzoROpNXuzXNBbMSUdOm2IgJJT4Zioglvb9Mf5Gvfjc5AJoEC9wqUeFejjaj7VpZD
	 houyH07ojXr15lx0xcBQDu5d88keMi6TVBUHn5Q8GcikRQLkfZjJLyZVEiMEkdjTq2mZZ
	 QPTi29FGG249IZgUc2aclhi0khdy/nLtc8ERoylPd+YHfNWZ3XEk7rgAejbkaSN7ODw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560243;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ASw7SC9wV/z7vgENMCASn+3Pkx4XRveXsq5V8cY73js=;
	b=Ztb+Mguw4m0Ls5mfUK0cSmPyCSuETcsd17UjEZhUmC5fyhKwhvTbo4BdM/p6EPNc+u5d
	 yqQK6ZaWlswTe5ONBovCh36I1yyGRxmjXu2b/a66KfFS1ZcMgBfGi2PBQdCFUhdt+wpc7
	 wFqumD7cvUgE4OeS7WGpKr09AifgKB9mtKmAjjJnCXblFcGvyt1yGWYK4m09Y9AzvVh/X
	 1tX3f1whOTsuVbMT90n7Y/YSdPjB7Vg6mKJMd4qYJWbLOgYZaqpKCifMiaoQCeAy1fsib
	 QfsIjsKx0WnRE6HEqwq6kmPCAO/C19c5YMZ7ZNzz1wMcAoTM+U+Qx2pjB/kH4zmm+aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HFmRMel+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a26x6jD5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3A5606A323
	for <arm-scmi@vger.kernel.org>; Tue, 24 Nov 2026 22:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD3A5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HFmRMel+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a26x6jD5
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMb2de2288255
	for <arm-scmi@vger.kernel.org>; Tue, 24 Nov 2026 22:44:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ASw7SC9wV/z7vgENMCASn+3Pkx4XRveXsq5V8cY73js=; b=HFmRMel+kSNMaBNc
	ecE/2xFlKYK0OskutL/ZqSgBBf413VS8uQk7MyhxrLmYFsklTZAN+3n9ErYVHlit
	UOvS8/RnRYEldAzYSy1k4M1Tcauqs64z7XjJZX/Y6GPx4im/wwHaPSfj3gC2PY8L
	nF43g3luwvIfJ4gQdcb+5Bxg07LaOaNU1iQnXtWv5Ltbi3GScOtDnatTXmmn3Jdr
	QWkM/BbGkKt1a0PFQdbMQqfn0StZW2I5p091+EiMZnDbEWYP2ZVLSY53AEJerchJ
	bT0+H2R8a1Ui5JW7SqkXQAHD8i5JKI9tBFDlZWJsJzIKYVXGiC7QMLJ5OeXD386p
	J392pQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5egs9ahh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 24 Nov 2026 22:44:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdd4dafdcf3so4150338a12.2
        for <arm-scmi@vger.kernel.org>; Tue, 24 Nov 2026 14:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795560240; x=1796165040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ASw7SC9wV/z7vgENMCASn+3Pkx4XRveXsq5V8cY73js=;
        b=a26x6jD58KijrZa8YLMR3KJNKlzHJAonv4cTZA1RIgO5y7ifNHexMXahTVJAv+svKf
         WF621p2Gt/y6Fydw8fRWRq1LToFSRLlHztqrqACAIXfUKVXMziHJTOg1Oyi0N0/LrPdQ
         Q+PWmvZ8sPyGOUhEdU2w5GCJ6IWIdltLImW7tOWWdVj4ik2xoMz3kTH2CIFeDp+Xu5TB
         QdeHCmk5Uy0CyNuMT5v5xm+Ks7NrjQ8LXqH8mKC02yiM7IBZxO63csQ29SnTgRZzW4gO
         xgB7H7bJl12FJuu4nOPenCI0ZSouDu6TMr7Jk0P7sWDW4T4AzIviCzSOCDAxIL4+u7pL
         F9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560240; x=1796165040;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ASw7SC9wV/z7vgENMCASn+3Pkx4XRveXsq5V8cY73js=;
        b=buJ1+eiHLWGpo6HOpicjrgl3gFElvn407GVUWLX8qhBY9NlLGrB6Ui6huB6S2x+vPL
         F7wNZiR6cqbNEReqSVm7EaazGFsDTTXyEW7aIVx5qmMraP53/nAmoqmA09hsbNbeyS4q
         55N49BJj2BNy4pTpX3hQTP/bE32cMsrvdHV0PT3jL/QU0ilurLGGhgtkryJJP0GkdXcO
         zgP8DbmWv5423U9lq2UnIoqyfaUmEp56lK9aInYK1nNbOVT1K8BX9yl4j7tm26QN+iRe
         HWFXEWp+pY7tlztCO3+803ejhYRZ/PMdAyuAIUmfX4qsVWi/7WaJcOVT2yvdTiS8mb9x
         IwTA==
X-Forwarded-Encrypted: i=1; AL+hErEQHzQUfNp1IAqVIRBrG6ANIeqko0Gb+Dh3u8Ya1SJBgM044eaFfYDRBe8SIucY/TnEw1aEQVQlgg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ao0hTnsizb0+ey3jHS4ajLM4STsPkBEVzsTUIJAHEzH15LL4D
	D71AslRA+LSUZ8BEXMgeC+uvBZgpv2jnPDtHXLX+Xk1Z51l+nlXP5P8ahK/cMdxlxEHU9AjtI5Y
	GqGY7rkjKlBvpkEIowSekJFOM4G06mXzKCs7wHVrY2ZPE1+kIKDPmJRdpgV69YA==
X-Gm-Gg: AZFdTZcfTpQG12LwwOYtTrhGIhyagAjyRC3zbAIL0WTYLcWB0K5Cwz+2SzIV2p7DNZS
	XgoG1PvZ7e0UD3EfC7v/ohRk4+IUK3cRDCEJNLzZTVVkm+6eGhkEFVtZqCZoKI8hec6EoR4qoxe
	pr6KQhT+loaxw41G10OcpzcwY3kA/XjdNkK7bAqf4W8maK0XJPAU3OLk648Oe48PaEL9mfBIB/9
	dPA1UVRvgXTX0MfpSxcsmz5nmJhzXv6tV9acC3+DTbLMwRvCFtuU/k9UjQJwIlP0QcJUuX7DDqC
	F1RPg+vrcragSP4C4SjWYaUXnx0EGsozTqThPlgEuQDlhHyyyMaKdk4lMoLqfARWRmI0LjopSnB
	yVipeKBF9k0kGqzdtwe/swxkHZzHUuK056LqtDc6uN9LSmmoKt4ML/9dpp0sOsEYESNBceKpgnD
	5gE9ssWSYlRDZGcttCeLXrc//rUt4=
X-Received: by 2002:a05:6a21:7704:b0:400:554c:f8cd with SMTP id adf61e73a8af0-4014dd67354mr15681385637.54.1795560240422;
        Tue, 24 Nov 2026 14:44:00 -0800 (PST)
X-Received: by 2002:a05:6a21:7704:b0:400:554c:f8cd with SMTP id adf61e73a8af0-4014dd67354mr15681370637.54.1795560239982;
        Tue, 24 Nov 2026 14:43:59 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfcadffsm7644525a12.9.2026.11.24.14.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:43:59 -0800 (PST)
Date: Tue, 24 Nov 2026 14:43:51 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, sudeep.holla@kernel.org,
        philip.radford@arm.com, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 1/2] firmware: arm_scmi: Invoke proper protocol cleanup
 on failure
Message-ID: <20261124144351.000034dc@oss.qualcomm.com>
In-Reply-To: <20261124185111.1022322-2-cristian.marussi@arm.com>
References: <20261124185111.1022322-1-cristian.marussi@arm.com>
	<20261124185111.1022322-2-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA4OSBTYWx0ZWRfX66uSDKZD5/Ij
 C91oAO2229MFtos7efj2mo0kisTb87EYB6F1mul8ngXTbWpKv4sHqao2VpAZPY6PovOl9RiQm+i
 tzKMRIZxSjah/TV2GUeTMhN1Exl6y7Y5saY3zkvky6rYSomTE8QJrdxM18CxPaHc98qyAJUe365
 hEMJRypku4kj/bpfoYsELAyhMQnMYdbuavW83Oxfs/3Zl0RmsgKZjgY1nQ0xU4gNOnrYKO5AIiA
 wmAfU1yjByOqvBtK1UKXLhD53U7ZBPlLKdtnMZEzww+rDfyq6wnjZnvWeln1iH0M2bX/Yc/iYOm
 mSjb6xHtoOGChC6BvfbcGrISGS8nMxz2V8Jct5ODWcMHWK7PUe4Ua2BEL5gCwu1ZOvmis+XLPxn
 m3hr3QQgz5/mO1cNK9bvHMnBjVarIxj3JizxTEzTodP39b2JYE6STx1znRYWj/8YQOGTB2jniBT
 kXE6sn+YmgJ5an1uc6w==
X-Proofpoint-GUID: BzwptoQyvXwLwTItpIvAA9yF9uDW_DQT
X-Proofpoint-ORIG-GUID: BzwptoQyvXwLwTItpIvAA9yF9uDW_DQT
X-Authority-Analysis: v=2.4 cv=Zt54uN7G c=1 sm=1 tr=0 ts=6b061331 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=c92rfblmAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=5v6MibOh_TyftPwQeGgA:9 a=CjuIK1q_8ugA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=GvGzcOZaWPEFPQC_NcjD:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA4OSBTYWx0ZWRfX5nIv3SqDksrv
 FVWw1C2p6fIIhHTeNsWFwA29XAqnomcpq55KNlbFxhT7rIbr0F5fcMMEysSDkq2kb//6+zGh0vA
 G+v230RDj5ESMuKsg1pCP7M4ZhmTNvI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240089

On Tue, 24 Nov 2026 18:51:10 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> After a failure in the protocol initialization phase, invoke if provided
> the protocol deinitialization routines.
> 
> Fixes: 48dc16e2e52c ("firmware: arm_scmi: Extend protocol registration interfaces")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-12cc0795-af8e-4d0c-8f6a-780a6728de7a
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

This function is 'fun' for it's mixing of devres, reference counting
and manual cleanup.  Plus why is it responsible for the
scmi_protocol_put(proto) when the reference is grabbed in the caller?
There is no reason I can see we can't hold that reference past the calls
that follow which release a devres group but don't hold anything specific
the protocol module. 

Anyhow, far as I can tell the fix is right but if anyone has the time I'd
take a look at whether this can be simplified.
So with that slightly doubtful set of comments in mind.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> ---
>  drivers/firmware/arm_scmi/driver.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index 05092301db29..2c4424aa0d37 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -2303,7 +2303,7 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
>  	ret = idr_alloc(&info->protocols, pi, proto->id, proto->id + 1,
>  			GFP_KERNEL);
>  	if (ret != proto->id)
> -		goto clean;
> +		goto deinit;
>  
>  	/*
>  	 * Warn but ignore events registration errors since we do not want
> @@ -2324,6 +2324,9 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
>  
>  	return pi;
>  
> +deinit:
> +	if (pi->proto->instance_deinit)
> +		pi->proto->instance_deinit(&pi->ph);
>  clean:
>  	/* Take care to put the protocol module's owner before releasing all */
>  	scmi_protocol_put(proto);

