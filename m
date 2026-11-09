Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794261703;
	b=QxN8CR1ff90SKG5ISruY/xSJfLS3sSf/n8zH/xI6PKcZBRF2HJgx6Pjy1rEIRe7r2nX1
	 ZdhEkV1QJC+vE8tCYiC05tKdgieEsq7y5Xae8hWfnRTA4iOHHf5FbMWx53CBG1TBXKERW
	 w8x/tXY4C2RVXv0F+kCGi6DsUdAdCt3IeTCTQesHaPT30S2yRXCy+t+k60dBKqOk2Hpjq
	 elHVSNHzbEwLo85CkClTHm00G4qfJQXmWJBhHraG5VE+EaJ+kF6+P1nqHJFDS4QE9c51e
	 1zRtbHVDO/YiWPbWYi+u1MyM+UzumvYrBFzdlHNJS9L3KrUtQ6jSQ4rT6z242pzn9Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794261703;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=f/U5uro6b/Mumfr/eDH65lCVfbkZfC9WhsiSfQqom5U=;
	b=HSp/mESNzkwp8GNsXc8xPBhMCpzy492HJ5brzuu78UFjkBChTOJY+9HQ62JuL9TMSRY8
	 JWIWbRIoAo2qqOiP9szbxLIQlNZmy1nBORwUpqkY1K25vUtqXD5yjQXbj6c16U0fw0GOz
	 BvCzv0TbazKk+FlOIA8xrQr48Cyoi46YBc3gndo2jdBJ9wmPfdyx6lzkohxYi6b0kZAXl
	 Xj6JdNfDLr4rywgxizFTTW4FjPgHyrmQxYftdJoo5jojGDv4ZX06bX3aO2w+FvtQzW3Gt
	 Mw80vYZFxFVADDqlwmqPBuaHZDFGeY/9HHQdfN/W2GVEFSwZuRKH0uKK74iKrBk08wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e7I9DGRY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="h8rrC24/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752AD606A31C
	for <arm-scmi@vger.kernel.org>; Mon,  9 Nov 2026 22:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 752AD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e7I9DGRY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h8rrC24/
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9LA1H61392476
	for <arm-scmi@vger.kernel.org>; Mon, 9 Nov 2026 22:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f/U5uro6b/Mumfr/eDH65lCVfbkZfC9WhsiSfQqom5U=; b=e7I9DGRYOGMiGoH/
	9ZoE29LUbkorsFvZdOvL+TFcpTgfHORVobuEWk8PJboxsm+F8FvRZETRWPJ4cbVK
	GUVRv75INA5Iaq/X7r1Xzf6dJRWOo9+iBHur3dSZZas9h9UER+SReUXSWZ8Hr78q
	KtOSrqyXX4pK8SeVyCc81nDoW1zf29dGDIVRLQuGotPphEf3EEPxLOyA5S+3HUyn
	M12UZx7KDkpAErIIRLsrsH2ntnuxiEAE9bKaiy0HqEeM+ncFOy7/UQhSmviQJCeO
	PysqGDgM7FymmEUVNObbm2pGUmVg5WrmxiYG/aMpAQGJec6AE8vg+3c+e0Gwq3P8
	ZjaCig==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5tbj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Mon, 09 Nov 2026 22:01:42 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36d69ab3c2bso1937429eec.0
        for <arm-scmi@vger.kernel.org>; Mon, 09 Nov 2026 14:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794261702; x=1794866502; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=f/U5uro6b/Mumfr/eDH65lCVfbkZfC9WhsiSfQqom5U=;
        b=h8rrC24/Jk3XFZ9fnclCxBB80fVCabImtkDuqauSxM1hUhaAA9eHf41EPZaZLieNYv
         ew25GWNCuyynoO/JurLVxPESl+zOyx+1S+UoyYGcx4pbY6yHLhHVNRM3YyJvEQR8X5E3
         bDZRebq0OGsL8np4uJ+XuFifrCgPflSd06X6ok5yGCv8FJ0r60w2jLy9l0r4ujiye6si
         w6YstoZ9WH5u9WVd0aaNm1SprrLgFhdLkTj+xLIWc+zYmdPgP4UIbXqlvc+nhJLo58si
         bSmeyAN97qFxdWb+e7DzS7an+DADr6FG2Yn6r0IvntaMPIFwTSId8/6thCFzwGeWBn0r
         caGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794261702; x=1794866502;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f/U5uro6b/Mumfr/eDH65lCVfbkZfC9WhsiSfQqom5U=;
        b=H/zxqvG74EoxQxKsNISLKgXa/Msz00cC7LSzBHPSm/UbJ89jZDXYh9tfprE8OtdhHX
         5RKOWPr390LqoFTuTQYldNbYu7+5ssway2D/dZN8mTnNVYJxcp1wPrim+l6EYX3QPq7B
         Vukm8kazKAZiU43ebf/sEeET0XycmNe+lAn3OH0hC0dJ19a/FV9w7O+DUE0T8WWtuoWF
         asylmsfJvbgpcJVBH3E9PMtqmlKW0yyfkF8JT70PPteK+rFMVNAmwd3n99ZsAK5dz68z
         EY76EIhWUiGu1vswOOhIlPicMihA1UAmkbbWvXBy3Se36SuVwV7ocVIJs5sBIYdTyxVt
         Rsow==
X-Forwarded-Encrypted: i=1; AL+hErGKw7VIxc5v87YZjjLoMEFffRNRVax8hGE3G/eC80OLaCvh/xohYS0AO7+BtKZTtnmSuN12aDw78g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Bqgi+83t61KXsgcsdWUpRn4exIRIa+AFLrDSYXzbDD1bbRwF6
	IjVULsE+nqlQCdQJKOb/D4gD7n+cp4UID3WyxDAlImOs9OpLQd24Cefv45vValCjqqwMpQL/F7o
	JFIyRC/NaD5IaxXUgfFTNfZGHZZG7uN1X0t4se6XyhF+1RlYb6Lkl3ADj9iXT1w==
X-Gm-Gg: AYBFou0QlxQAeeL4j8CMK9dSapvSnGNU02K9DNGJK0vLiV+GpEeNRAainraS4ZxmHKd
	GB3HndFSwTOUnxgbH9phS+fJM9BYcxAe2Njr/GX7i9hP36H9SDhY1BMQdnZU6nE5b02o6DkOhc7
	/azH6BKvPA6DRRQGEQneqqJokDT9iyE35FQ8p9twlkXuWcah7weeuxEo1re14oo0pbFxW/DeGL+
	ZyuY8tftlV5CJznCq59Hp1+cNqU3y/o438lintes6obfQNZn4ZMeJJX8fDBiIl5oqN/jrL9rr2L
	uOC7EkyXBpz9kDdP0aJxe9PK7kzd4whpZZMbWgOqmUvrpe6QdrDfXjzum5NnHWQ1ZYgrmcbKamv
	UpE8gJZyp15J+et5J0NnICOp+FSCz67hook1NnGMsMN59ybPTokGbA8cH1/9krwwpww9LEyqMwO
	9LH7EftMg9eF5N5EjyCzxEI0AnMA==
X-Received: by 2002:a05:693c:6007:b0:36a:1008:5815 with SMTP id 5a478bee46e88-3751c82f248mr762503eec.5.1794261701739;
        Mon, 09 Nov 2026 14:01:41 -0800 (PST)
X-Received: by 2002:a05:693c:6007:b0:36a:1008:5815 with SMTP id 5a478bee46e88-3751c82f248mr762424eec.5.1794261700734;
        Mon, 09 Nov 2026 14:01:40 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751dae6377sm1118577eec.3.2026.11.09.14.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 14:01:40 -0800 (PST)
Date: Mon, 9 Nov 2026 14:01:29 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 03/35] firmware: arm_scmi: Introduce a dedicated
 SCMI Errors header
Message-ID: <20261109140129.00004b4f@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-4-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-4-cristian.marussi@arm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4NyBTYWx0ZWRfX3sAcp++/kE8o
 Gv65Djw73TWgRIZPv283Q4zfm6QgpzpdtDYZ1FepSrqMzdTlipMjhPBGgNOdlWnwtmr+rqIEoA/
 IzigHHSgfv7aA3FJffaSGm3M9DsPSmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4NyBTYWx0ZWRfX71KeD0jbpdYT
 V1ta0ld7nHwot+wymG0QUka+rXigW4OwzuNF0ZHkeHVifMoxhwK9xvZVDarVrVqcYeqH4kgQF2m
 b4rcLyGssGjn/Pqy9LDF+qMFw3hLMEmGEtRoibOc2QZcVpkW8IJWRShY6OcWSgniCCBtl29b/Fk
 Lk/0d+OkR3Wi14VBceTliwPvMG7eAXzL1CTDNfvX35bsWd2kFsi1v/o1xF0A6ZfcSLAbiVpWqsX
 YpjcVxfI3N4IUWtFsiNTiLDzDBm/vSuDDmnb5QcbxXZLLeeK5WHtzh4JdHpAXDCsBmfNJaAN4S/
 IUCXinBSkQmEkqUG5b2eFobmmGw67PTn09d34St7xXNMyOYGE0seRh+7GBS3viUUgdskIOhOdP4
 pez0/Gq2KBiIjr1cnpuQQ1DurkCpCwwLNWvQkS7Lqx64ulHPiCJKld09WQO8YcI5bKLUyI19oYE
 Duu/kFSj7Tggtc4KS7A==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af242c6 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=1uBkIsMKrF2EJPe0UmoA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 01bJEP-7fXaeV0emRtuwRMRE98ZvxfoC
X-Proofpoint-GUID: 01bJEP-7fXaeV0emRtuwRMRE98ZvxfoC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090087

On Mon,  9 Nov 2026 09:11:49 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add a new dedicated header and move all of the errors definitions and
> mapping helpers into it and out of common.h so that SCMI errors definitions
> alone can be easily included in protocol files without all of the unrelated
> additional stuff contained in common.h

In ideal world I'd move first and add the new codes later.
(so swap this and previous patch).

Trivial thing but reduce the patch size a tiny bit!

Other than that, seems like there are enough of these
for a separate header to perhaps make sense.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
>  drivers/firmware/arm_scmi/common.h | 43 +----------------------
>  drivers/firmware/arm_scmi/errors.h | 56 ++++++++++++++++++++++++++++++
>  2 files changed, 57 insertions(+), 42 deletions(-)
>  create mode 100644 drivers/firmware/arm_scmi/errors.h
> 
> diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
> index e3390686fc58..cdd6f887fae7 100644
> --- a/drivers/firmware/arm_scmi/common.h
> +++ b/drivers/firmware/arm_scmi/common.h
> @@ -26,6 +26,7 @@
>  
>  #include <linux/unaligned.h>
>  
> +#include "errors.h"
>  #include "protocols.h"
>  #include "notify.h"
>  
> @@ -37,48 +38,6 @@
>  
>  #define SCMI_TRANSPORT_DEVNAME_PREFIX	"__scmi_transport_device"
>  
> -enum scmi_error_codes {
> -	SCMI_SUCCESS = 0,	/* Success */
> -	SCMI_ERR_SUPPORT = -1,	/* Not supported */
> -	SCMI_ERR_PARAMS = -2,	/* Invalid Parameters */
> -	SCMI_ERR_ACCESS = -3,	/* Invalid access/permission denied */
> -	SCMI_ERR_ENTRY = -4,	/* Not found */
> -	SCMI_ERR_RANGE = -5,	/* Value out of range */
> -	SCMI_ERR_BUSY = -6,	/* Device busy */
> -	SCMI_ERR_COMMS = -7,	/* Communication Error */
> -	SCMI_ERR_GENERIC = -8,	/* Generic Error */
> -	SCMI_ERR_HARDWARE = -9,	/* Hardware Error */
> -	SCMI_ERR_PROTOCOL = -10,/* Protocol Error */
> -	SCMI_ERR_IN_USE = -11,  /* In Use Error */
> -	SCMI_ERR_PARTIAL = -12, /* Partial Error */
> -};
> -
> -static const int scmi_linux_errmap[] = {
> -	/* better than switch case as long as return value is continuous */
> -	0,			/* SCMI_SUCCESS */
> -	-EOPNOTSUPP,		/* SCMI_ERR_SUPPORT */
> -	-EINVAL,		/* SCMI_ERR_PARAM */
> -	-EACCES,		/* SCMI_ERR_ACCESS */
> -	-ENOENT,		/* SCMI_ERR_ENTRY */
> -	-ERANGE,		/* SCMI_ERR_RANGE */
> -	-EBUSY,			/* SCMI_ERR_BUSY */
> -	-ECOMM,			/* SCMI_ERR_COMMS */
> -	-EIO,			/* SCMI_ERR_GENERIC */
> -	-EREMOTEIO,		/* SCMI_ERR_HARDWARE */
> -	-EPROTO,		/* SCMI_ERR_PROTOCOL */
> -	-EBUSY,			/* SCMI_ERR_IN_USE */
> -	-EBADMSG,		/* SCMI_ERR_PARTIAL */
> -};
> -
> -static inline int scmi_to_linux_errno(int errno)
> -{
> -	int err_idx = -errno;
> -
> -	if (err_idx >= SCMI_SUCCESS && err_idx < ARRAY_SIZE(scmi_linux_errmap))
> -		return scmi_linux_errmap[err_idx];
> -	return -EIO;
> -}
> -
>  #define MSG_ID_MASK		GENMASK(7, 0)
>  #define MSG_XTRACT_ID(hdr)	FIELD_GET(MSG_ID_MASK, (hdr))
>  #define MSG_TYPE_MASK		GENMASK(9, 8)
> diff --git a/drivers/firmware/arm_scmi/errors.h b/drivers/firmware/arm_scmi/errors.h
> new file mode 100644
> index 000000000000..707761cd8d34
> --- /dev/null
> +++ b/drivers/firmware/arm_scmi/errors.h
> @@ -0,0 +1,56 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * System Control and Management Interface (SCMI) Message Protocol
> + * header containing SCMI errors definitions and Linux mapping.
> + *
> + * Copyright (C) 2018-2026 ARM Ltd.
> + */
> +#ifndef _SCMI_ERRORS_H
> +#define _SCMI_ERRORS_H
> +
> +#include <linux/errno.h>
> +#include <linux/array_size.h>
> +
> +enum scmi_error_codes {
> +	SCMI_SUCCESS = 0,	/* Success */
> +	SCMI_ERR_SUPPORT = -1,	/* Not supported */
> +	SCMI_ERR_PARAMS = -2,	/* Invalid Parameters */
> +	SCMI_ERR_ACCESS = -3,	/* Invalid access/permission denied */
> +	SCMI_ERR_ENTRY = -4,	/* Not found */
> +	SCMI_ERR_RANGE = -5,	/* Value out of range */
> +	SCMI_ERR_BUSY = -6,	/* Device busy */
> +	SCMI_ERR_COMMS = -7,	/* Communication Error */
> +	SCMI_ERR_GENERIC = -8,	/* Generic Error */
> +	SCMI_ERR_HARDWARE = -9,	/* Hardware Error */
> +	SCMI_ERR_PROTOCOL = -10,/* Protocol Error */
> +	SCMI_ERR_IN_USE = -11,  /* In Use Error */
> +	SCMI_ERR_PARTIAL = -12, /* Partial Error */
> +};
> +
> +static const int scmi_linux_errmap[] = {
> +	/* better than switch case as long as return value is continuous */
> +	0,			/* SCMI_SUCCESS */
> +	-EOPNOTSUPP,		/* SCMI_ERR_SUPPORT */
> +	-EINVAL,		/* SCMI_ERR_PARAM */
> +	-EACCES,		/* SCMI_ERR_ACCESS */
> +	-ENOENT,		/* SCMI_ERR_ENTRY */
> +	-ERANGE,		/* SCMI_ERR_RANGE */
> +	-EBUSY,			/* SCMI_ERR_BUSY */
> +	-ECOMM,			/* SCMI_ERR_COMMS */
> +	-EIO,			/* SCMI_ERR_GENERIC */
> +	-EREMOTEIO,		/* SCMI_ERR_HARDWARE */
> +	-EPROTO,		/* SCMI_ERR_PROTOCOL */
> +	-EBUSY,			/* SCMI_ERR_IN_USE */
> +	-EBADMSG,		/* SCMI_ERR_PARTIAL */
> +};
> +
> +static inline int scmi_to_linux_errno(int errno)
> +{
> +	int err_idx = -errno;
> +
> +	if (err_idx >= SCMI_SUCCESS && err_idx < ARRAY_SIZE(scmi_linux_errmap))
> +		return scmi_linux_errmap[err_idx];
> +	return -EIO;
> +}
> +
> +#endif /* _SCMI_ERRORS_H */

