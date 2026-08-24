Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD05390205
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 21:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787605508; cv=none; b=P+sYHP7S8piwvmqmMf8i0dDKKq1JBQKl4GH+azmqZaz5qRq112CJIQFzJ6oBbZI7NCFpSyN/ws4yCFwTdMc2tX4JXjjD20jdx8jfjc83w9mHh6jDwdEp94wmuO9WyPEHRzUf2GXm8mrpFimvcXwKKFsDrTzmciu+acbxV+zZDjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787605508; c=relaxed/simple;
	bh=KlJxc/73Za/tL4QF/6j8LrFHxkyNqTyno9oNxMFSMng=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BG4n4AYqPKe2CbgGDnfH+rsWzddsQ49b6Zs5FqxSWiA4Sw+iPNe5CpKIUpCWjgfBIHgCtJERlRmeESbLxfmgxyf4Ah8JZW7ze8fDYBv4sJ2/tBrS0/jnUt+7T+zabYUn2y55IZ5PLWFqkBltsGURsuTxuAau9On4glL5v76NG4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j5Wg91Ai; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VK7ylde4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j5Wg91Ai";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VK7ylde4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OJHaZH3416909
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 21:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dY4LDVqEdH5RNMCgK81yobfpThMPmEumfnbZe+5z5us=; b=j5Wg91AiUCvpf9z0
	GCHp8sZbfASpFvC3YB8g6D0OzFR1sTydswybv9P1aMHb58BL//s4J69OvusczLkj
	dA6ljc9/XfzBWbLQ/FAgwrTEXMTofgaX39asu2cXvk3bg/8BcZUCHZh8WXVyAE5T
	OqIA3y1ZjFhFzdPbeeMKqTZGd49UaGDotjaqBCkyuSzX4IbamOmBCyqNUKsUDysY
	beHxoWNdCDcufAZzic1AaJApJt299P4NdhzkNHJixAScQb4un3cd6spCTW63vKWE
	YZCu0M89kd5f/a7uyoDw4i5+PaVVMUmC2L7viwJ5JbMGiNuv++Lr0aEjH/JvbWzU
	tz1ojw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8t3drtyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 21:05:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccd1958e8fso57641335ad.2
        for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 14:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787605504; x=1788210304; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dY4LDVqEdH5RNMCgK81yobfpThMPmEumfnbZe+5z5us=;
        b=VK7ylde4joyzo1Z6asm12O+YkGN5bBGyFlc4pxoeGh5P9ienT5bO97/NaylZ8Y3BQv
         POen2i1d9eBghD7mTq1oKSNe/XW/cyccxNH7h1C8vdi7QNrRQxrpUbv9LX4a3/R+IYgk
         WGTfb/A6MKeOUHXI2/695RUTe4O/4kNC3Z0FgrrWGw2CZGD4rg93LyJ1iUT9ppESA+u3
         aMwDAfLSMPFVSstdSME7RgT3W/GOTwOp/r3b4Mtjr+7byUgPxn/UMcO9PhGT2lnEEMKT
         hteONA1y2ZauNVe9DdVCUk1EgOuc3m/qhindKphDJdaI+8Ng1U8T+ntJG2Jt1TVsdpSe
         tMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787605504; x=1788210304;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dY4LDVqEdH5RNMCgK81yobfpThMPmEumfnbZe+5z5us=;
        b=HcKlX/LDjDNs7PeUEkgJlWRj7DZuA3XsF1MHdP3JE9B5OtHAWeAs+jRS1if0J0q9+2
         tLxWLfnWG9Gg8WlvFOVDeVOxA2e5xlFwjdhnVpjP/RBkkQ47z7XKMMTwtEYFK1HAMXVR
         1PKROQIj1gBV4Ls32PkhJhuPkB09ulunDkhqe1lEwPE2/NY7386mbmmhqruoVOKfrcSO
         qG1/Vi7wCGtxqoFymN0aVU2aOfOj18ww15v6qt/kcngiDCWR1N43p50rJNMpfYAhoB6R
         E4Ifx1t6IJXMBichlplGRw35YkXMes6vL4M5vSmRnxKFkGOC3c6ruMioC5t6YqqMt1e7
         ieAQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpvx+0/wm1/+hYG5KrC3zRYpbZD3dvLDKFxR+QKZsuH/SwsTyrMQy0x7yEHzcpi0AYk/3mwjY70VQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lwhRrrHPPEGnRBKWzNCtNm7Agbl5tpi3Jh8uKd9gYdXUjqehQT
	Vg8cNIBoENunUr+yPo67M8zSYQH4yQUAhBT/wjNd74pKZLUzNjr8dnP7Le+zxWfGr8MKvhI+6+B
	6HSXzz5FWA4i7+U08lNSg9toYZ5jyPw9YtGRK28jQ+TlhNzBpfFC5cKMwo99LJQ==
X-Gm-Gg: AR+sD12mQ3+xeBTESa4O/4+C/81F4QPgTLyR7b4JsHmpz+ySrBhqu744WIBCrGusFng
	eXOEEm/WoeHBoqA40ldVWCl2+ViTqiZ+c4zEpVHr4/1/PQgqPfGnJvyp0g/xEVsNd+TSkhxpc7+
	o6dloULg/vtFxmQgExSPBRA8TsNOjCUYjUyi4JzMDAJtuTQTO2457DaLywDbxYRgoWNn+B7dMqF
	uC9J3rGzbNU6AoLEk79vIWKt8462X/eLzwZZevf9DdBW0vmc6Spk+e3YXR9WRLBcq1v//fPzCfq
	IxYlCO5M449UD5yt6RctvPyMHheZVy+dWehsdrUOn3QBzZgVkVsAMqTkmeejvcmEkh5BYN32WLx
	IlCI1FmXRPV/d2Dz8oGmA00M9LA==
X-Received: by 2002:a17:90b:5745:b0:380:f389:447b with SMTP id 98e67ed59e1d1-396464ce7bcmr3158196a91.11.1787605503950;
        Mon, 24 Aug 2026 14:05:03 -0700 (PDT)
X-Received: by 2002:a17:90b:5745:b0:380:f389:447b with SMTP id 98e67ed59e1d1-396464ce7bcmr3158126a91.11.1787605503492;
        Mon, 24 Aug 2026 14:05:03 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1418619d6ecsm27307004c88.14.2026.08.24.14.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 14:05:03 -0700 (PDT)
Date: Mon, 24 Aug 2026 14:04:58 -0700
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
Subject: Re: [PATCH v10 06/24] firmware: arm_scmi: Add basic Telemetry
 support
Message-ID: <20260824140458.000072d3@oss.qualcomm.com>
In-Reply-To: <20260815232604.3730754-7-cristian.marussi@arm.com>
References: <20260815232604.3730754-1-cristian.marussi@arm.com>
	<20260815232604.3730754-7-cristian.marussi@arm.com>
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
X-Proofpoint-ORIG-GUID: aoDTjJZgteqXOH_gWEbzz09VzYbQ78tk
X-Authority-Analysis: v=2.4 cv=OLAXGyaB c=1 sm=1 tr=0 ts=6a8cb201 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7CQSdrXTAAAA:8 a=y3yABLib4jnuYGgama0A:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: aoDTjJZgteqXOH_gWEbzz09VzYbQ78tk
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDE3OCBTYWx0ZWRfXyAhGzB0Lkkdx
 CQxfXih76qmAv6a09EA+xsWgo+Maslk6gCx2kGwz/gPhnggonlepq4lF1IA8tpgt6XhJePvDa2R
 fCeujvMAgNlkJbFPuRfSuPYOQqN+Z/8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDE3OCBTYWx0ZWRfX1I2V6wKjER1k
 J7rEcvJQ/p7RK30XusKl7S3xH8XyfEB4i7haAunebZsI+V5nWAxQ6C+mKOoBQnQt6rz77/ACDwT
 uZcBn3aBG6EXlp/gRMLLHCiKR/G4lScEXneWMUBxp76oKLdNcn4BDAq5SGQSXcysQUi05xXbPOn
 Yk3/CwAg6t2aVwfdhAXU7wlsYIHQWy7UdJKmE+Qu+lDn9O4/CFVDbrCGXLb7TNrFEDm1q9ubmJu
 C0GRC9uVlNLuatdBXaNCBBBGPLdJZI//uk+MsNmQQyjJrasGi3CQ1oY9zVnTohgNRAuYQL0ieMo
 Ifj3/4K0JV8j85AyK5zvOVEfPBkU2hxntiCSQQeIBIJU2Y7DKJaDvxQvgD1qWL0bX8nVSwGx+xv
 cMtCnmnpt2crMa7xzeIHSk5GNUusOKzkBpMgmNprItzZYsCZvFeT0TVuKrvnALWi8gH03+wuzAt
 aZeISt9m8x8w48Cp1Pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_06,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240178

On Sun, 16 Aug 2026 00:25:46 +0100
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add SCMIv4.0 Telemetry basic support to enable initialization and resources
> enumeration: add all the telemetry messages definitions and parsing logic
> but only a few simple state gathering protocol operations.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Obviously this is huge. I'm not going to look through it all today, but
some quick comments form the part I did look at.

Jonathan

...

> +static void scmi_telemetry_resources_free(void *arg)
> +{
> +	struct telemetry_info *ti = arg;
> +	struct scmi_telemetry_res_info *rinfo = ti->rinfo;
> +
> +	/* Ensure rinfo is no more accessible upfront */
> +	smp_store_release(&ti->rinfo, NULL);
> +
> +	for (int i = 0; i < rinfo->num_des; i++) {
> +		struct telemetry_de *tde = to_tde(rinfo->des[i]);
> +
> +		scmi_telemetry_free_tde_put(ti, tde);

		scmi_telemetry_free_tde_put(ti, to_tde(rinfo->des[i]));
Seems resonable to me and avoids the need for the local variable.

> +	}
> +	xa_destroy(&ti->xa_des);
> +	kfree(ti->tdes);
> +	kfree(rinfo->des);
> +	kfree(rinfo->dei_store);
> +	scmi_telemetry_groups_free(rinfo);
> +	kfree(rinfo->grps);
> +	kfree(rinfo->grps_store);
> +
> +	kfree(rinfo);
> +}

> +
> +/**
> + * scmi_telemetry_resources_enumerate  - Enumeration helper
> + * @ti: A reference to the telemetry info descriptor for this instance
> + *
> + * This helper is configured to be called once on the first enumeration
> + * attempt, when triggered by invoking ti->res_get() from somewhere else.
> + * Once run it substitues itself in ti->res_get() with the simple accessor
> + * __scmi_telemetry_resources_get, which returns a descriptor to the resources
> + * that were possibly discovered.
> + *
> + * Note that, while it attempts to fully enumerate Data Events and Groups, it
> + * does NOT fail when such enumerations fail, instead it simply gives up with
> + * the end result that only a partially populated, but consistent, resources
> + * descriptor will be returned; in such a case the incomplete descriptor will
> + * be marked as NOT fully_enumerated: this design enables the kernel to deal
> + * with badly implemented out-of-spec firmware support while keep on providing
> + * a minimal sane, albeit possibly incomplete, set of telemetry respources.
> + *
> + * Return: A reference to a fully or partially populated resources descriptor
> + */
> +static struct scmi_telemetry_res_info *
> +scmi_telemetry_resources_enumerate(struct telemetry_info *ti)
> +{
> +	struct scmi_telemetry_res_info *rinfo;
> +	struct device *dev = ti->ph->dev;
> +	int ret;
> +
> +	/* Ensure local rinfo is initialized */
> +	rinfo = smp_load_acquire(&ti->rinfo);
> +
> +	/*
> +	 * Ensure this init function can be called only once and
> +	 * handles properly concurrent calls.
> +	 */
> +	if (atomic_cmpxchg(&ti->rinfo_initializing, 0, 1)) {
> +		if (!completion_done(&ti->rinfo_initdone))

What's the logic here?  This waits only if others are already
waiting. Why?

> +			wait_for_completion(&ti->rinfo_initdone);
> +		goto out;

return 0;

> +	}
> +
> +	ret = scmi_telemetry_de_descriptors_get(ti);
> +	if (ret) {
> +		dev_err(dev, FW_BUG "Cannot fully enumerate DEs resources. Degraded system.\n");
> +		goto done;
> +	}
> +
> +	ret = scmi_telemetry_enumerate_groups_intervals(ti);
> +	if (ret) {
> +		dev_err(dev, FW_BUG "Cannot fully enumerate group intervals. Degraded system.\n");
> +		goto done;
> +	}
> +
> +	/* Enumeration was fully successful, ensure this is visbile */
> +	smp_store_release(&rinfo->fully_enumerated, true);
> +done:
> +	/* Disable initialization permanently */
> +	smp_store_mb(ti->res_get, __scmi_telemetry_resources_get);
> +	complete_all(&ti->rinfo_initdone);
> +
> +out:

labels that just result in returns rarely add to readability of code.
I'd just return early instead.

> +	return rinfo;
> +}
> +
> +/**
> + * scmi_telemetry_instance_init  - Instance initializer
> + * @ti: A reference to the telemetry info descriptor for this instance
> + *
> + * Note that this allocates and initialize all the resources possibly needed
> + * and then setups the @scmi_telemetry_resources_enumerate helper as the

sets up

> + * default method for the first call to ti->res_get(): this mechanism enables
> + * the possibility of optionally implementing deferred enumeration policies
> + * which optionally delay the discovery phase and related SCMI message exchanges
> + * to a later point in time.
> + *
> + * Return: 0 on Success, errno otherwise
> + */
> +static int scmi_telemetry_instance_init(struct telemetry_info *ti)
> +{
...

> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index 5ab73b1ab9aa..2850b018da0d 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -2,16 +2,18 @@
>  /*
>   * SCMI Message Protocol driver header
>   *
> - * Copyright (C) 2018-2021 ARM Ltd.
> + * Copyright (C) 2018-2026 ARM Ltd.
>   */
>  
>  #ifndef _LINUX_SCMI_PROTOCOL_H
>  #define _LINUX_SCMI_PROTOCOL_H
>  
>  #include <linux/bitfield.h>
> +#include <linux/bitops.h>
>  #include <linux/device.h>
>  #include <linux/notifier.h>
>  #include <linux/types.h>
> +#include <linux/uuid.h>
>  
>  #define SCMI_MAX_STR_SIZE		64
>  #define SCMI_SHORT_NAME_MAX_SIZE	16
> @@ -824,6 +826,184 @@ struct scmi_pinctrl_proto_ops {
>  	int (*pin_free)(const struct scmi_protocol_handle *ph, u32 pin);
>  };
>  
> +enum scmi_telemetry_de_type {

There is quite a bit of stuff here. Seems only related to telemetry
so maybe a more specific header makes sense for just scmi_telemetry?

The same applies for some of the other stuff already in this header
like the sensors protocol elements.

> +	SCMI_TLM_DE_TYPE_USPECIFIED,
> +	SCMI_TLM_DE_TYPE_ACCUMUL_IDLE_RESIDENCY,
> +	SCMI_TLM_DE_TYPE_ACCUMUL_IDLE_COUNTS,
> +	SCMI_TLM_DE_TYPE_ACCUMUL_OTHERS,
> +	SCMI_TLM_DE_TYPE_INSTA_IDLE_STATE,
> +	SCMI_TLM_DE_TYPE_INSTA_OTHERS,
> +	SCMI_TLM_DE_TYPE_AVERAGE,
> +	SCMI_TLM_DE_TYPE_STATUS,
> +	SCMI_TLM_DE_TYPE_RESERVED_START,
> +	SCMI_TLM_DE_TYPE_RESERVED_END = 0xef,
> +	SCMI_TLM_DE_TYPE_OEM_START = 0xf0,
> +	SCMI_TLM_DE_TYPE_OEM_END = 0xff,
> +};
> +
> +enum scmi_telemetry_compo_type {
> +	SCMI_TLM_COMPO_TYPE_USPECIFIED,
> +	SCMI_TLM_COMPO_TYPE_CPU,
> +	SCMI_TLM_COMPO_TYPE_CLUSTER,
> +	SCMI_TLM_COMPO_TYPE_GPU,
> +	SCMI_TLM_COMPO_TYPE_NPU,
> +	SCMI_TLM_COMPO_TYPE_INTERCONNECT,
> +	SCMI_TLM_COMPO_TYPE_MEM_CNTRL,
> +	SCMI_TLM_COMPO_TYPE_L1_CACHE,
> +	SCMI_TLM_COMPO_TYPE_L2_CACHE,
> +	SCMI_TLM_COMPO_TYPE_L3_CACHE,
> +	SCMI_TLM_COMPO_TYPE_LL_CACHE,
> +	SCMI_TLM_COMPO_TYPE_SYS_CACHE,
> +	SCMI_TLM_COMPO_TYPE_DISP_CNTRL,
> +	SCMI_TLM_COMPO_TYPE_IPU,
> +	SCMI_TLM_COMPO_TYPE_CHIPLET,
> +	SCMI_TLM_COMPO_TYPE_PACKAGE,
> +	SCMI_TLM_COMPO_TYPE_SOC,
> +	SCMI_TLM_COMPO_TYPE_SYSTEM,
> +	SCMI_TLM_COMPO_TYPE_SMCU,
> +	SCMI_TLM_COMPO_TYPE_ACCEL,
> +	SCMI_TLM_COMPO_TYPE_BATTERY,
> +	SCMI_TLM_COMPO_TYPE_CHARGER,
> +	SCMI_TLM_COMPO_TYPE_PMIC,
> +	SCMI_TLM_COMPO_TYPE_BOARD,
> +	SCMI_TLM_COMPO_TYPE_MEMORY,
> +	SCMI_TLM_COMPO_TYPE_PERIPH,
> +	SCMI_TLM_COMPO_TYPE_PERIPH_SUBC,
> +	SCMI_TLM_COMPO_TYPE_LID,
> +	SCMI_TLM_COMPO_TYPE_DISPLAY,
> +	SCMI_TLM_COMPO_TYPE_RESERVED_START = 0x1d,
> +	SCMI_TLM_COMPO_TYPE_RESERVED_END = 0xdf,
> +	SCMI_TLM_COMPO_TYPE_OEM_START = 0xe0,
> +	SCMI_TLM_COMPO_TYPE_OEM_END = 0xff,
> +};
> +
> +#define	SCMI_TLM_GET_UPDATE_INTERVAL_SECS(x)	(FIELD_GET(GENMASK(20, 5), (x)))
> +#define SCMI_TLM_GET_UPDATE_INTERVAL_EXP(x)	(sign_extend32((x), 4))
> +
> +#define SCMI_TLM_GET_UPDATE_INTERVAL(x)		(FIELD_GET(GENMASK(20, 0), (x)))
> +#define SCMI_TLM_BUILD_UPDATE_INTERVAL(s, e)				    \
> +	(FIELD_PREP(GENMASK(20, 5), (s)) | FIELD_PREP(GENMASK(4, 0), (e)))
> +
> +enum scmi_telemetry_collection {
> +	SCMI_TLM_ONDEMAND,
> +	SCMI_TLM_NOTIFICATION,
> +	SCMI_TLM_SINGLE_READ,
> +};
> +
> +#define SCMI_TLM_GRP_INVALID		0xFFFFFFFF
> +
> +struct scmi_telemetry_intervals {
> +	unsigned int grp_id;
> +	bool discrete;
> +	unsigned int num_intervals;
> +#define SCMI_TLM_UPDATE_INTVL_SEGMENT_LOW	0
> +#define SCMI_TLM_UPDATE_INTVL_SEGMENT_HIGH	1
> +#define SCMI_TLM_UPDATE_INTVL_SEGMENT_STEP	2
> +	unsigned int update_intervals[] __counted_by(num_intervals);
> +};
> +
> +struct scmi_telemetry_grp_info {
> +	unsigned int grp_id;
> +	unsigned int num_des;
> +	unsigned int num_intervals;
> +};
> +
> +struct scmi_telemetry_group {
> +	bool enabled;
> +	bool tstamp_enabled;
> +	unsigned int *des;
> +	char *des_str;
> +	struct scmi_telemetry_grp_info *info;
> +	unsigned int active_update_interval;
> +	struct scmi_telemetry_intervals *intervals;
> +	enum scmi_telemetry_collection current_mode;
> +};
> +
> +struct scmi_telemetry_de_info {
> +	unsigned int id;
> +	unsigned int grp_id;
> +	unsigned int data_sz;
> +	unsigned int type;
> +	unsigned int unit;
> +	int unit_exp;
> +	unsigned int ts_rate;
> +	unsigned int instance_id;
> +	unsigned int compo_instance_id;
> +	unsigned int compo_type;
> +	bool persistent;
> +	char name[16];
> +};
> +
> +struct scmi_telemetry_de {
> +	bool tstamp_support;
> +	bool fc_support;
> +	bool name_support;
> +	struct scmi_telemetry_de_info *info;
> +	struct scmi_telemetry_group *grp;
> +	bool enabled;
> +	bool tstamp_enabled;
> +};
> +
> +struct scmi_telemetry_res_info {
> +	bool fully_enumerated;
> +	unsigned int num_des;
> +	struct scmi_telemetry_de **des;
> +	struct scmi_telemetry_de_info *dei_store;
> +	unsigned int num_groups;
> +	struct scmi_telemetry_group *grps;
> +	struct scmi_telemetry_grp_info *grps_store;
> +};
> +
> +struct scmi_telemetry_base_info {
> +	unsigned int version;
> +	uuid_t primary_revision;
> +	unsigned int num_des;
> +	unsigned int num_groups;
> +	unsigned int num_intervals;
> +	unsigned int num_shmtis;
> +};
> +
> +struct scmi_telemetry_shmti_info {
> +	unsigned int sid;
> +	unsigned int len;
> +	unsigned long offset;
> +	phys_addr_t phys;
> +};
> +
> +struct scmi_telemetry_info {
> +	bool single_read_support;
> +	bool continuos_update_support;
> +	bool per_group_config_support;
> +	bool reset_support;
> +	bool fc_support;
> +	struct scmi_telemetry_base_info base;
> +	unsigned int active_update_interval;
> +	struct scmi_telemetry_intervals *intervals;
> +	struct scmi_telemetry_shmti_info **shmtis;
> +	unsigned int num_uuids;
> +	uuid_t **uuids;

I'm going to guess a __counted_by_ptr marking makes sense here.
(I haven't checked!) I won't bother calling out other cases, but
looks like there may well be some above.

> +	bool enabled;
> +	bool notif_enabled;
> +	enum scmi_telemetry_collection current_mode;
> +};

