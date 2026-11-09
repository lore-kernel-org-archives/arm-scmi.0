Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268644;
	b=fF94oBwwJntmorKht3UXpP4GlTjIueTs7e7MW9YkiOjBTXhQr4eouuNHFDQb9OErqK0X
	 EAbSfU4rK7jn/oG/TK3Axsoj6p6OR+sB1AW++xjpECTH410WxarlTvti5kJJ+S3wSGar0
	 NpmL9kmXM4tws6bCYgA6VXc6/Sz+N+mv9t5h9mW+zB6/mzxB071Kp1b2V6xQPPfr9W4X/
	 OFUJwWS6DsbFnMOhChs34BXK5xSIOb5YDG8xYuOgXyOwTt7jt9nUywAAGfYdnpOzKIkoQ
	 XSllWIXTJlZIqjf0wUu1N4kFqR13z11mtne4/4rw7rabjtxY4cNe21bcOrDmmddSSXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268644;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PCyUzlqAB6XNK1tam0Dwe7EWgFWawysxa8qRUG9TL1Y=;
	b=GljpcmuwE8WMzIyU6wtLbbcoZakEM9EKo3pg0CsccIGCgFMErvuCQkGNHrVYOtjfBmb1
	 mqMPJzaeTKpgfuJ1BPRFc5Xd0OGfxpU/VErP6dxbn3WXho9pgMKphII5I8xw1qN6NVoen
	 N/9ixmhsdlG1PLxYQm5I+Q0+2ODB9xfGCWz1UzuS5CtBxs2BHidGIzFJS5FUuEQQ0NCo7
	 o47umjV1oW822mhwl0oR6OUugFyYm5nr1rlfvDOnRhoAialgbwj/YomPxs9YQsFcO0NyU
	 ZrgXf1fs5E3jLobGhZSN9qQf6k6/sUUFUQPH/xJ5sRQHbHChcqt2bUeGM/aHnW7HEng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="P7df/oHK";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="gVv1/uPl";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D85F607181A
	for <arm-scmi@vger.kernel.org>; Mon,  9 Nov 2026 23:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D85F607181A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P7df/oHK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gVv1/uPl
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9LA2LJ2018848
	for <arm-scmi@vger.kernel.org>; Mon, 9 Nov 2026 23:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PCyUzlqAB6XNK1tam0Dwe7EWgFWawysxa8qRUG9TL1Y=; b=P7df/oHKtu/L6AL9
	oqYI7wHDYo8ud+Jllx28MBig/s6ZgrSXgSZD/FmgLmOSw5KhdD0OIUqoIHDM3uhE
	GX4utPRN8O+heRLZjQvIie38noeZiaKYJM2rNyww0+N7G9FxR2/0uxvIbYHjSTP6
	lkHtRnEJdrfspa4LbZoWMf2Y5rIOSc2paYFC4vVRQGNJn0cxWNfvI9SmfEixSX0c
	HH7pwFMAze9twemWpnh7rHEe5nxk/O8tSMu9L8qDMpYnXTsET+ldsCQ1d0mknyMH
	kKoK3cS+h8m8jc8CGvh2/lh9LO2Yfq/NQ5ukTOXIXU9HrKzcNagmnCTiUd8YxLZa
	/MbDwQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg0rvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Mon, 09 Nov 2026 23:57:22 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-37549877380so259474eec.0
        for <arm-scmi@vger.kernel.org>; Mon, 09 Nov 2026 15:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794268642; x=1794873442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PCyUzlqAB6XNK1tam0Dwe7EWgFWawysxa8qRUG9TL1Y=;
        b=gVv1/uPlgCLww/HUdkfYCw4cN6zYD+rQ4YDn/MY//8kQPqwadDyGeFNuprOMHq6GSS
         LxEvlSpLLCJMgXiJJMKaMBXgW5OLUZHUOWsYRljWN0125SoO8R6uDjs1GjEmKPjn2II5
         ogV2D/awHsx86yay6dQ5CBlWq12WlpAdImjeI7FzWaCB20x3Wvjk9sr3WNf0XVZvRcyF
         biUPB/FsdQ+yZDQ7Z0/4dSnvae5NrRPDlv1LPYNJJMJBw0TI9DmMdkUd6x20T2nVLfer
         R2thru6i8VbcpZ2NWWUDC67i0QBz+dqpWGtQ0U9JnnNHDIGJoPidYZEInUdsFaYsouH/
         tW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268642; x=1794873442;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PCyUzlqAB6XNK1tam0Dwe7EWgFWawysxa8qRUG9TL1Y=;
        b=CRxN0KL1N/LVPVBBmk1mcMr+r1DFBq26OnTEAJRmLAbpzKYiu7quBR40nhcG4sgdU3
         iNQIPK7hDLgA7GVOAttQOPzwBtyRxv9yKdKkBxt+gW3arrB8J06fylHPdKOeC6YpNPI+
         ZqKq0J0379eTK71USewKejWd9ncO0Yzzojur8xiJU565SLvvtbC6Ytl46POwCazMkw5L
         4XlVY2ZEjgmANgV4dPm1jbMLGp6y9L5BHaohR/PIFcTks+cxVFwWUD+J7X0LnT2XUYvE
         joGdX6KxnmIsvSLfKaPDVhG2ogXN6hcf83iqtkGKRQWJw22+5dwuQaIMzI93DS5gk8Cx
         lgnQ==
X-Forwarded-Encrypted: i=1; AL+hErGFZolTwbqYk0SmP62xNGNKYBFO7RDwojrNI+YqLDH/UT73cdZhWaVKm5hm1PDEayCWp8zPzAb5Wg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/bJdwSj/Iabda7XSgDaGayzuEowSClVDNFgmmAq8RHWBhPS92T
	StBQvA8tCVPA5I3oyYUSaY23q5PF7u9ozPUiAxNDoUyE4cNF5yipaXB4vO5863OJcVwhVeIVuOz
	hnrWq+LBh0jvSkAp4EzqWFSaZ7ASfeQyGmcJ+eviHCm73uo7elJ37/IRi3prrcw==
X-Gm-Gg: AYBFou2udoUO0eygxAX3+CzMlppYVbzd+AZZlYEu26lMNpAfJXINccAIXoYdMpAwSTJ
	xQd2HIU9gATKtlw2DLl7GX1kfqyCrMFzyo1kv0CaAIPSHe2e7nPRUYYPt5jCJD9IoxrKKU5+2D9
	x2EeWce45V/cgxU98KQXxQXwNSH4+zJNNHT+TzUdLUIZCBQ091kz4vAUa133obbNA6dYGcCrNyI
	p2fBlt2FNcRqi+YtzTgvg+tWaRH3id0Uw9DADCCuBTpX/nFP5MJ2KfuyJa+DlKfw316iqZQUyzL
	F4hxg3hIiwEazyP0u/+C6VP184SrdvlRbQUTeP92j3wIqVoSZ6qQL9zCUG2/MdMlilQT6M9lVqn
	cFDHQqnnN8EiF2PZUS7qCXbsqMKvHBIsMgORYo9odPybx0z3rXmm1VYW2c2E0ujLH1DEF7GxP2n
	qHMgWfCgh8fJUPIvmsJ8Hu/rIH/A==
X-Received: by 2002:a05:693c:808b:b0:36d:d7ec:5e3d with SMTP id 5a478bee46e88-3751fa3d519mr1153101eec.21.1794268641570;
        Mon, 09 Nov 2026 15:57:21 -0800 (PST)
X-Received: by 2002:a05:693c:808b:b0:36d:d7ec:5e3d with SMTP id 5a478bee46e88-3751fa3d519mr1153056eec.21.1794268640929;
        Mon, 09 Nov 2026 15:57:20 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520608b52sm1608728eec.13.2026.11.09.15.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 15:57:20 -0800 (PST)
Date: Mon, 9 Nov 2026 15:57:09 -0800
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
Subject: Re: [PATCH v15 09/35] firmware: arm_scmi: Add Telemetry basic
 attributes enumeration
Message-ID: <20261109155709.000059cb@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-10-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-10-cristian.marussi@arm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA5NSBTYWx0ZWRfX42wxdvGFlmpd
 qsqZxq8wzaZ+YQQm96a2zZa3jKfFbtIW/bepGcWCgEQIQ5GtDDfSciLnLdUGwHl8Xg05X8fjQWL
 b8ZhH6Z7FcE2RWKQZ9V04FcEUj9Me8cvsh9SCWG2FI8pz8899njf4IvNK1qPwRIz9RFqp1fvCsr
 boKxvEHUX/VUHMTxaKNEMSNiiB4vm59I8NpB6LPKIR2Ah2juzWcl04dbw+0EmUZ7XAFglaI/+AE
 CcKeGHM+UqcKtDs1VM6xw77YZMZpBhS7IBs5XPsxSzHkmcUrjj4+PandlD/MaFF6Fl5RUmGnlv3
 MWuxWHB0CR5VUgsFigjL7YCmwYHcBWHAqRO7s8DRrV3Wp+8mH2u3C9AKUNcUV3O7U3SQn3+6dsr
 pEkVPzUcmvvPKszXS6sz5V3UJnAgj3iVcQDdQCx4OXn7Q9URJkNntnRKEEP6jpP/AWNv0cK7kJn
 8SHjMe4qZkzBzkxoZyA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA5NSBTYWx0ZWRfXyLGi8WcAF2Iy
 ZrcCWQyof0YGbxIPXfobIQ30ogHbDWlTewtspbwpHYYW/E6yf7egUcCIMJMkt6RVVLWvdvwSgo7
 qkN223y6zGN8xi9IRfYGEZI7rMmg1PQ=
X-Proofpoint-GUID: 5lDkGlZWWP7Z7S5lNUlrOK4uac-t61Ok
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af25de2 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=FN7pwp8LrHzWrJGgN4QA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 5lDkGlZWWP7Z7S5lNUlrOK4uac-t61Ok
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090095

On Mon,  9 Nov 2026 09:11:55 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add SCMIv4.0 Telemetry basic support for minimal initialization and
> protocol attributes enumeration: expose telemetry instance descriptor
> via a simple information retrieval protocol operation.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

A few minor things inline.

Thanks,

Jonathan

> diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
> index d1f1bde8a7cc..77daedddaab7 100644
> --- a/drivers/firmware/arm_scmi/protocols.h
> +++ b/drivers/firmware/arm_scmi/protocols.h
> @@ -410,5 +410,6 @@ DECLARE_SCMI_REGISTER_UNREGISTER(sensors);
>  DECLARE_SCMI_REGISTER_UNREGISTER(voltage);
>  DECLARE_SCMI_REGISTER_UNREGISTER(system);
>  DECLARE_SCMI_REGISTER_UNREGISTER(powercap);
> +DECLARE_SCMI_REGISTER_UNREGISTER(telemetry);
>  
>  #endif /* _SCMI_PROTOCOLS_H */
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> new file mode 100644
> index 000000000000..23eaac485691
> --- /dev/null
> +++ b/drivers/firmware/arm_scmi/telemetry.c
> @@ -0,0 +1,149 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * System Control and Management Interface (SCMI) Telemetry Protocol
> + *
> + * Copyright (C) 2026 ARM Ltd.
> + */
> +
> +#include <linux/atomic.h>

I'm not immediately spotting this being used.  Perhaps take another
look at whether some of these should wait for later patches
where their usecases come in.

> +#include <linux/bitfield.h>
> +#include <linux/compiler_types.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/limits.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/sprintf.h>
> +#include <linux/string.h>
> +#include <linux/uuid.h>
> +
> +#include "protocols.h"
> +#include "notify.h"
> +
> +/* Updated only after ALL the mandatory features for that version are merged */
> +#define SCMI_PROTOCOL_SUPPORTED_VERSION		0x10000
> +
> +#define SCMI_TLM_DE_IMPL_NUM_DWORDS	4
> +
> +/* An enum listing the protocol specific commands definitions */
> +enum scmi_telemetry_protocol_cmd {
> +	TELEMETRY_LIST_SHMTI = 0x3,
> +	TELEMETRY_DE_DESCRIPTION = 0x4,
> +	TELEMETRY_LIST_UPDATE_INTERVALS = 0x5,
> +	TELEMETRY_DE_CONFIGURE = 0x6,
> +	TELEMETRY_DE_ENABLED_LIST = 0x7,
> +	TELEMETRY_CONFIG_SET = 0x8,
> +	TELEMETRY_READING_COMPLETE = TELEMETRY_CONFIG_SET,
> +	TELEMETRY_CONFIG_GET = 0x9,
> +	TELEMETRY_RESET = 0xA,
> +};
> +
> +struct scmi_msg_resp_telemetry_protocol_attributes {

I like clear names as much as anyone, but probably wouldn't lose much by
abbreviating a little?

struct scmi_msg_rsp_telemetry_prot_attr
perhaps?

> +	__le32 de_num;
> +	__le32 groups_num;
> +	__le32 de_implem_rev_dword[SCMI_TLM_DE_IMPL_NUM_DWORDS];
> +	__le32 attributes_1;
> +#define SUPPORTS_SINGLE_READ(x)		(le32_get_bits((x), BIT(31)))
> +#define SUPPORTS_CONTINUOS_UPDATE(x)	(le32_get_bits((x), BIT(30)))
> +#define SUPPORTS_PER_GROUP_CONFIG(x)	(le32_get_bits((x), BIT(18)))
> +#define SUPPORTS_RESET(x)		(le32_get_bits((x), BIT(17)))
> +#define SUPPORTS_FC(x)			(le32_get_bits((x), BIT(16)))

I guess a local style thing but my normal inclination would be not hide
what is going on here and instead define
	ATTRS1_SUPPORTS_FC BIT(16)
and use the le32_get_bits() inline.  These helpers have lost the connection
with attributes_1.  

> +	__le32 default_blk_ts_rate;
> +};
> +
> +struct telemetry_info {
> +	bool streaming_mode;
> +	unsigned int num_shmti;
> +	unsigned int num_des_tstamp;
> +	unsigned int default_blk_ts_rate;
> +	const struct scmi_protocol_handle *ph;
> +	struct scmi_telemetry_info info;
> +};
> +
> +static int
> +scmi_telemetry_protocol_attributes_get(struct telemetry_info *ti)
> +{
> +	struct scmi_msg_resp_telemetry_protocol_attributes *resp;

It feels like this is in the function scope rather than the if (!ret)
mostly because it has a really long type name. See above.

> +	const struct scmi_protocol_handle *ph = ti->ph;
> +	struct scmi_xfer *t;
> +	int ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES, 0,
> +				      sizeof(*resp), &t);
> +	if (ret)
> +		return ret;
> +
> +	resp = t->rx.buf;

I think this would ideally be in the if (!ret) as well which makes
more sense if the declaration is in there.

> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret) {

Maybe given long lines and indent, this is worth a helper function.

> +		__le32 attr = resp->attributes_1;
> +		__be32 de_impl_version[SCMI_TLM_DE_IMPL_NUM_DWORDS];
> +
> +		ti->info.base.num_des = le32_to_cpu(resp->de_num);
> +		ti->info.base.num_groups = le32_to_cpu(resp->groups_num);
> +		for (int i = 0; i < SCMI_TLM_DE_IMPL_NUM_DWORDS; i++)
> +			de_impl_version[i] =
> +				cpu_to_be32(le32_to_cpu(resp->de_implem_rev_dword[i]));
> +		import_uuid(&ti->info.base.primary_revision, (const __u8 *)&de_impl_version);
> +		ti->info.single_read_support = SUPPORTS_SINGLE_READ(attr);
> +		ti->info.continuous_update_support = SUPPORTS_CONTINUOS_UPDATE(attr);
> +		ti->info.per_group_config_support = SUPPORTS_PER_GROUP_CONFIG(attr);
> +		ti->info.reset_support = SUPPORTS_RESET(attr);
> +		ti->info.fc_support = SUPPORTS_FC(attr);
> +		ti->num_shmti = le32_get_bits(attr, GENMASK(15, 0));

I think that mask belongs up with the structure definition as people will want
to check the whole thing in one place.


> +		ti->default_blk_ts_rate = le32_to_cpu(resp->default_blk_ts_rate);
> +	}
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}

> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index 3f7cc35eb861..f076ce5601cf 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -2,17 +2,19 @@
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

Not seeing use of that in this patch within the header.
Perhaps it should be included in a later patch or in the c file?

>  #include <linux/device-id/scmi.h>
>  #include <linux/device.h>
>  #include <linux/notifier.h>
>  #include <linux/types.h>
> +#include <linux/uuid.h>
>  
>  #define SCMI_MAX_STR_SIZE		64
>  #define SCMI_SHORT_NAME_MAX_SIZE	16
> @@ -828,6 +830,35 @@ struct scmi_pinctrl_proto_ops {
>  	int (*pin_free)(const struct scmi_protocol_handle *ph, u32 pin);
>  };
>  
> +struct scmi_telemetry_base_info {
> +	unsigned int version;
> +	uuid_t primary_revision;
> +	unsigned int num_des;
> +	unsigned int num_groups;
> +	unsigned int num_intervals;
> +	unsigned int num_shmtis;
> +};
> +
> +struct scmi_telemetry_info {
> +	bool single_read_support;
> +	bool continuous_update_support;
> +	bool per_group_config_support;
> +	bool reset_support;
> +	bool fc_support;
> +	struct scmi_telemetry_base_info base;
> +};

