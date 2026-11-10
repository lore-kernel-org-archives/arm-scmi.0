Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794334588;
	b=hK4enQ5UrO1FL2ao3e+c0OmnL0lsY/GHf5BdJ58MNxj/XOfFDz1jDvT4k73LA8XaFxBy
	 aBy4KBQ+c4iCuf9IRjPvTQt7dLd4rmgLGRnBhC0HiZUkn3HQuz2O5Qdo5/SDItqgB/T/5
	 iE/nEL+n3yxvAf8/l7ZjCgcOLqZIlAdBAP8WYkMCo2FqoSVzvv5i5rRPCMAHUT8155rJG
	 s7P1ASVspk6snm56cDuTEr4xjoEQb9W3oZdFXau3hJ43ngVRxnLMGOGPeGREwSgO//2Md
	 GrhE+01I2CkFf8BRc3MJR5inIW3k8b9/AgTTG5p25MUKaePSd/wKCtsrgi0DxZZYPfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794334588;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VO93PVJK8N20kSJ8Y8aLKtAdeQuFzyl/QHyYJLrhnZE=;
	b=de/CeTrnNkzQiyea2IVfYr0br1IJ94XHxXvoLVo1+qjHH1tAI1n3dLvmHMZGayeKqkE/
	 Z1BBPYi1Zd38kkVA63IfsYAg9btNsJCXI3gFyUro4fyQavHFGa3H3zVuF3k2Nhwqskh+e
	 RtZBNx6/URTUwtWCXpgh0z5OR6mH8faStG7xW9nSRg4C+WecEeh3MRuiG0/glWBuFG+P3
	 btEuWzl3pWDF6EOt2N/DeMOEIj6PfT5jWVKrOXduM3J8nL0ywxafP9J+bWuOC8/zNj31n
	 wuZh/RjDusKNfE0YjY/Q1xnLXADquWFartMVqXGa0leL7DD5XKmQZlyZe8QDTzVuW5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cCO1F9pm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WuiKfCa4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5666606A33C
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 18:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5666606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cCO1F9pm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WuiKfCa4
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAH5joO2900763
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 18:16:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VO93PVJK8N20kSJ8Y8aLKtAdeQuFzyl/QHyYJLrhnZE=; b=cCO1F9pmNXglHVyo
	m0dKMF0RWd9HYZdwi7eny+dckLXwbKyXlsDNPnPk3dAChOf43YSU0wVjVmmHwnok
	hPW7KfRpdYjTUpd2tc7vjmul/73NM8tExNnSJ4dEy4kYTxri+TQABVqRWmFo8tLS
	ZfxwgUE96RjJxLXB6kghyAIux5jwFJGvZQVSYziB2dBX3T+fGpGQBwuN+srY+JIB
	EYvTGKnO1RFYGL5a/q7tqnv0AjEsFSBHaCZsrZrqjjPp/gg5GEiL+KblbuKguxMk
	blNpYnJvUS2KoID0cz5tWMqcKYhdB/mskAEDxUNfji/Asv7HpPZdcW9yBdc3jIbK
	etxX8Q==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv7c5gav6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 18:16:26 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b3ae17c536so2491838c88.0
        for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 10:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794334586; x=1794939386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VO93PVJK8N20kSJ8Y8aLKtAdeQuFzyl/QHyYJLrhnZE=;
        b=WuiKfCa4Ga8RBhe2Zb3iOLV314qOu90dft5930F2uZ2iGDT4paydaeRiq8Q5Xp1KlM
         1LA/iIYf37iksfDyvG3LwiSkWN4wkiXD7o52uiBjBuLLBnYw4S3ujndxCZXnmuz2b4lw
         HoRpf/pIqR0YPtbcp6hQQmeVMAVHEQCTNQdY2xPERbrUZc05DiuvL636sImCL9QBeVJy
         evgLjlvO9QHpPMRkYxOqCIDiwPlPX2RJ0X01xql5BijoUJBaWFOisGoUqarWpphIGp8i
         +LyuAW6VY/K0LorXfdRZ1kwyrmanmKgQZIQA3o6W2mCDvJObe2aGPwd8eI8znx/nDin7
         jFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794334586; x=1794939386;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VO93PVJK8N20kSJ8Y8aLKtAdeQuFzyl/QHyYJLrhnZE=;
        b=162p6gN04JimnrecIL2uThYbcJ11J5g/Se76MyD8zHkrKny/egf/uo7OTvPoyPxAvB
         tqBKVqV1wkGDk+ub9cs/sWh6FlMa3DtzCv44oo127/umtglSUdrEPUhRuk1MzdgO/QAG
         1tOYmrm0KjL+6BcocoOmLdz+LL3GiN9+joXaWrhpD+eiU/c9gZLre7UOWhJviPk8oLp2
         wIv9zgFx5SutqibcefRiOY52rGu+ZWOcFX6+xJelIkvCjofsF+aPmK4XwvldC3+xdDm2
         Et1a4mIJJGexXvph92hH+MOT8s/AvdrNdOYrYo5D36h0iQt8M8Y9kVUskOWaXSum1AGD
         8STg==
X-Forwarded-Encrypted: i=1; AL+hErG2jrRdCit9rt7Dl0u5JZUOhdFwE1rE1yITi3Qopf7yn6nyEYOlmW40sPXuNv+68vXR8quVna23vQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/YW8hEwUy/hxmiDLqXOqQnkA+T5CGYzACnZt64RsdujiK7tSQH
	WDg3lR4p9QWd9eyi/EPskxWHNEXNDqT+MacppMm8evoVeLa+gPuZstV8gvyjOwHfqwvH8AfjD/D
	AUuxPGCG93Ny1lKc6jS6T2eqdL5vrfFhNFDDJfeVBB5iELMJoUmPzBy+xl2xmUQ==
X-Gm-Gg: AYBFou2PdWQSB4HkpsFCeXduIyAIo4V4FSyAehXW0yzKRen35w4HaCKlgH3HyUz+hl5
	kMfYEaiqYBlpnVKNG+L20PILUjUrZIzvXI7+NxrMnjevZtIOgE6f2uTdeSFCWKCjLoD8K8zDhDp
	lbxAKBll6esmqcM0PXmLmCuOAxUMYyXeMBbORbomS8G5YNLC5T8ROLX4oxuodYLssVvuXgfcJa7
	oQtOg2hL1WaQobYJ9qczGZ51fRUqgTtJb2NKrjBobLoTe2vUp+8LXLoEVFnjBWAEjqdD8jmwARt
	5alIi0onW+ux6vkX4MBQbQ4GowB966cTDmuyVNKp4Jf5mJjNcnKfR92rCrp8G2pqVmMpfFv4XZJ
	EDprRQlBNPkPrxoWk0UI6+sB34+6SCT5YqL36OQ8dcdM9G658HGS5/AxabwvcCvuGKlFdE9U1od
	Q1hEbIWeLelB9B98FjIe7nqXEpm5Kw
X-Received: by 2002:a05:701b:4511:10b0:18d:5ef2:1644 with SMTP id a92af1059eb24-1b3ba7b2e07mr2079049c88.30.1794334584961;
        Tue, 10 Nov 2026 10:16:24 -0800 (PST)
X-Received: by 2002:a05:701b:4511:10b0:18d:5ef2:1644 with SMTP id a92af1059eb24-1b3ba7b2e07mr2078975c88.30.1794334583856;
        Tue, 10 Nov 2026 10:16:23 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b20c55sm7416264c88.8.2026.11.10.10.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:16:21 -0800 (PST)
Date: Tue, 10 Nov 2026 10:15:52 -0800
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
Subject: Re: [PATCH v15 14/35] firmware: arm_scmi: Add Telemetry TDCF areas
 parsing support
Message-ID: <20261110101552.0000711e@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-15-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-15-cristian.marussi@arm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3MiBTYWx0ZWRfXzIKBh5zYFTgE
 g2MK+CeHcJ/J09IBOwbnbE1GNJNt+IC5HlF8SVquZ+sfdcJgu1EYCT/0k8h2k/UvzwH/tZbVdWP
 b81WAkmu2gMbrmbAuk2FMxxaDIh35KdUuOlWy1VHqflZf3w2EL0u1Qkht6+CGyPO2FEsu2FTETW
 z+Kg69jiyivUtmtBqcj+e9lsvs7q6mq7kamDg/hHgl0mC/lfsYAxWWOH/9OKsuO0UnZL74ArtpG
 w6aECn71HqeWf1c5WDT+0qElct9CBQeML9TJjN+sQMbnqd3EYiGVfrzmmD9kdQ9Kt3ZNvFhi1l0
 8tCpvPwjjXKOXDGn+JfegVK44znKbwiPAKRSsL21sHnZa2ictYnjcQph/S2qoCqjt4XYGkkO/Qf
 IJ0bErS9JmXy9uCWxV2zdyVEHcf+BXQ1ocQIO8XKyKqpZDFTW/OJzHtPsLhoN/41EapMXZMlLrC
 aVM9vb5LsG0CjPYDPhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3MiBTYWx0ZWRfXybhUjmVx1bVG
 LaxT9tsOnA9iz7+ckYBlhV0pZwWCD3u+A1Iz4RrPyaqhh4i43w7IpkZeDaxEB8geYk0qlI81rWW
 BLsDSnHv8t63LKY2MHLfBhz7bW2st+c=
X-Proofpoint-ORIG-GUID: GFqX5XFbkVseFv4FgW-_rtDiJWFSajnl
X-Authority-Analysis: v=2.4 cv=eq9KXYpX c=1 sm=1 tr=0 ts=6af35f7a cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7CQSdrXTAAAA:8 a=xkoatq2HAAAA:8 a=zGxvY66N2CaWy6YS1qoA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=CuNAHyPTimGbZf_9KV2F:22
X-Proofpoint-GUID: GFqX5XFbkVseFv4FgW-_rtDiJWFSajnl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100072

On Mon,  9 Nov 2026 09:12:00 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add logic to scan the SHMTI areas, parsing the TDCF descriptors and collect
> DataEvent contained in TDCF DATA lines. Ignore TDCF BLK_TS and UUID lines.
> 
Main comment on this one is various unused definitions at the top.
I'd push those to where they get used so that reviewers can see all the
relevant material in one patch.

May involve a couple of forwards declarations that get replaced in a future
patch but I think that tiny bit of churn is worth it.

> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

> ---
>  drivers/firmware/arm_scmi/telemetry.c | 799 +++++++++++++++++++++++++-
>  1 file changed, 798 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> index d9f1a3e3468e..810195889484 100644
> --- a/drivers/firmware/arm_scmi/telemetry.c
> +++ b/drivers/firmware/arm_scmi/telemetry.c
> @@ -14,21 +14,29 @@
>  #include <linux/err.h>
>  #include <linux/io.h>
>  #include <linux/limits.h>
> +#include <linux/minmax.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/refcount.h>
>  #include <linux/sizes.h>
>  #include <linux/slab.h>
>  #include <linux/sprintf.h>
>  #include <linux/string.h>
> +#include <linux/time.h>
>  #include <linux/uuid.h>
>  #include <linux/xarray.h>
>  
>  #include "protocols.h"
>  #include "notify.h"
>  
> +#include <trace/events/scmi.h>
> +
>  /* Updated only after ALL the mandatory features for that version are merged */
>  #define SCMI_PROTOCOL_SUPPORTED_VERSION		0x10000
>  
> +#define SCMI_TLM_TDCF_MAX_RETRIES	15

Add a comment on why this particular number.  Even if that's 'it seems to work' :)


> +#define SCMI_TLM_TDCF_RETRY_GAP_US	1234
> +
>  #define SCMI_TLM_DE_IMPL_NUM_DWORDS	4
>  
>  /* An enum listing the protocol specific commands definitions */
> @@ -125,6 +133,158 @@ struct scmi_msg_resp_telemetry_update_intervals {
>  
>  #define _I(__a)		(ioread32((void __iomem *)(__a)))
>  
> +/*
> + * Define the behaviour of a SHMTI scan defining what information will
> + * be gathered and which Telemetry items can be updated.
> + */
> +enum scan_mode {
> +	SCAN_LOOKUP,	/* Update only value/tstamp */
> +	SCAN_UPDATE,	/* Update also location offset */
> +	SCAN_DISCOVERY  /* Update xa_des: allows for new DEs to be discovered */
> +};
> +
> +struct fc_line {
> +	__le32 data_low;
> +	__le32 data_high;
> +};
> +
> +struct fc_tsline {
> +	__le32 data_low;
> +	__le32 data_high;
> +	__le32 ts_low;
> +	__le32 ts_high;
> +};

Some of these defs can wait for the patch that needs them.  Then we can
sanity check them against the spec with the parsing code etc.

> +
> +struct line {
> +	__le32 data_low;
> +	__le32 data_high;
> +};
> +
> +struct tsline {
> +	__le32 data_low;
> +	__le32 data_high;
> +	__le32 ts_low;
> +	__le32 ts_high;
> +};

> +
> +struct telemetry_info;
> +
> +struct telemetry_line {
> +	enum tdcf_line_types type;
> +	u32 last_magic;
> +	unsigned long offset;
> +	refcount_t users;
> +	struct telemetry_shmti *shmti;
> +	/* Protect line accesses  */
> +	struct mutex mtx;
> +};
Follows from below, I'd keep this for where it is used.
> +
> +struct telemetry_block_ts {
> +	u64 last_ts;
> +	u32 last_rate;
> +	struct telemetry_line line;
> +};
> +
> +#define to_blkts(l)	container_of(l, struct telemetry_block_ts, line)

I'd do similar for this to uuid.  Effectively put a placeholder def
in so that you can introduce this stuff with the code that uses
it.

> +
> +struct telemetry_uuid {
> +	u32 key;
> +	struct hlist_node node_ht;
> +	struct hlist_node node_lst;
> +	uuid_t uuid;
> +};
> +
> +#define to_uuid_from_uuid_t(u)	container_of(u, struct telemetry_uuid, uuid)
No uuid usage in here yet... Push to patch where it comes in.
I'd be tempted to use a forwards def for the struct for now and replace
it in the patch where it becomes meaningful.  In this patch it's just
passed around as a cookie that is never set.

> +
>  #define IS_TDE_TSTAMP_TYPE(__t, __ttype)	((__t)->ts_type == (__ttype))
>  #define IS_TDE_TS_NONE(_t)	(IS_TDE_TSTAMP_TYPE((_t), TSTAMP_NONE))
>  #define IS_TDE_TS_LINE(_t)	(IS_TDE_TSTAMP_TYPE((_t), TSTAMP_LINE))
> @@ -220,7 +433,14 @@ struct telemetry_de {
>  	u32 offset;
>  	/* NOTE THAT DE data_sz is registered in scmi_telemetry_de */
>  	u32 fc_size;
> +	u64 last_val;
> +	u64 last_ts;
> +	u32 last_magic;
>  	struct list_head item;
> +	struct telemetry_block_ts *bts;
> +#define BLK_TS_CHANGED(t, s, o)			\
> +	(!((t)->bts) || (t)->bts->line.shmti != (s) || (t)->bts->line.offset != (o))
> +	struct telemetry_uuid *uuid;
>  	struct scmi_telemetry_de de;
>  	/* Protect last_val/ts/magic accesses - MUST BE KEPT LAST */
>  	struct mutex mtx;
> @@ -228,10 +448,24 @@ struct telemetry_de {
>  
>  #define to_tde(d)	container_of(d, struct telemetry_de, de)
>  
> +static inline bool scmi_tde_has_tstamp(struct telemetry_de *t)
> +{
> +	return t->de.tstamp_support && t->de.tstamp_enabled;
> +}
> +
> +enum de_state {
> +	ENA_STATE,

See below for comments on this being confusing naming at best.

> +	ENA_TSTAMP,
> +	ENA_MAX
> +};
> +
>  struct telemetry_info {
>  	bool streaming_mode;
>  	unsigned int num_shmti;
>  	unsigned int num_des_tstamp;
> +	/* Mutex to protect des_enabled_mtx */
> +	struct mutex des_enabled_mtx;
> +	atomic_t des_enabled[ENA_MAX];
>  	unsigned int default_blk_ts_rate;
>  	const struct scmi_protocol_handle *ph;
>  	struct telemetry_shmti *shmti;
> @@ -251,6 +485,27 @@ struct telemetry_info {
>  static struct scmi_telemetry_res_info *
>  __scmi_telemetry_resources_get(struct telemetry_info *ti);
>  
> +static inline struct tdcf *snap_tdcf(struct shmti_snap *s);
> +
> +static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
> +				     unsigned int shmti_id, enum scan_mode mode);
> +
> +static inline void
> +scmi_telemetry_de_state_update(struct telemetry_info *ti, enum de_state state,
> +			       bool *current_state, const bool next_state)

State is a bit vague for naming.  Lots of state in here that isn't enabled/disabled
Maybe can come up with something more specific?  Also two states, one of which
is called STATE and one of which is called something other than STATE is really confusing!

> +{
> +	guard(mutex)(&ti->des_enabled_mtx);
> +	if (!current_state || *current_state != next_state)
> +		atomic_add(next_state ? 1 : -1, &ti->des_enabled[state]);
> +
> +	if (current_state)
> +		*current_state = next_state;

I struggle a bit with understanding this function.  Why do we pass in current state given
it should always match ti->des_enabled[state];  If it differs and this
is doing some subtle form of refcounting then I think we need more documentation.

> +
> +	dev_dbg(ti->ph->dev, "Telemetry des_enabled[%s]:%u\n",
> +		state == ENA_STATE ? "STATE" : "TSTAMP",
> +		atomic_read(&ti->des_enabled[state]));
> +}

> +static void
> +scmi_telemetry_tde_cache_update(struct telemetry_de *tde, u64 val,
> +				u64 *tstamp, u32 *magic)

To me, passing magic by pointer indicates that this function will
update it.  Whereas the use here is to indicate whether to ignore
it or not.   You could mark it const, or break it into a parameter
to say if magic is ignored + magic by value.

Either way this got me a bit confused as I didn't understand why we
went to effort passing in magic at the callsite below then doing nothing
with the value.

Anyhow, just a small thing so ignore if you like.  I may just need
more coffee.

> +{
> +	lockdep_assert_held(&tde->mtx);
> +
> +	/*
> +	 * Update the cache only if stale compared to the current
> +	 * sample, so bail-out when last_magic >= *magic
> +	 */
> +	if (magic && !scmi_telemetry_tde_cache_stale(tde, *magic))
> +		return;
> +
> +	tde->last_magic = magic ? *magic : TDCF_BAD_END_SEQ;
> +	tde->last_val = val;
> +	tde->last_ts = tstamp && scmi_tde_has_tstamp(tde) ? *tstamp : 0;
> +	if (tstamp)
> +		*tstamp = tde->last_ts;
> +}
> +
>  struct scmi_tlm_de_priv {
>  	struct telemetry_info *ti;
>  	void *next;
> @@ -1196,6 +1480,510 @@ scmi_telemetry_de_lookup(const struct scmi_protocol_handle *ph, u32 id)
>  	return xa_load(&ti->xa_des, id);
>  }
>  
> +static inline struct payload __iomem *
> +scmi_telemetry_payld_offset_safe_calc(struct telemetry_shmti *shmti, u32 offs)
> +{
> +	struct payload __iomem *payld;
> +	unsigned long p;
> +	u32 end;
> +
> +	/* Check if accessing payld->meta is safe. */
> +	if (check_add_overflow(offs, sizeof(u32), &end) ||
> +	    end > shmti->info.len)
> +		return IOMEM_ERR_PTR(-EPROTO);
> +
> +	if (check_add_overflow((__force unsigned long)shmti->base, offs, &p))
> +		return IOMEM_ERR_PTR(-EPROTO);
> +
> +	payld = shmti->base + offs;

Use p rather than computing it again.  Sure it needs casting and __force but none
the less using a cast of p will make it clear the value is the one that
was just checked for overflow.


> +	/* Check line boundary */
> +	if (check_add_overflow(offs, LINE_LENGTH_BYTES(payld), &end) ||
> +	    end > shmti->info.len)
> +		return IOMEM_ERR_PTR(-EPROTO);
> +
> +	return payld;
> +}
> +
> +static u64
> +scmi_telemetry_blkts_read(u32 magic, struct telemetry_de *tde)

See below, I'd bring full signature in here even though the actual
implementation isn't until the next patch.

> +{
> +	lockdep_assert_held(&tde->mtx);
> +
> +	return 0;
> +}

> +static inline int
> +scmi_telemetry_line_data_parse(struct telemetry_de *tde, struct shmti_snap *snap,
> +			       u64 *val, u64 *tstamp, struct payload *payld,
> +			       struct payload *bts_payld, u32 magic)
> +{
> +	u32 meta = PAYLD_META_RAW(payld);
> +
> +	lockdep_assert_held(&tde->mtx);
> +
> +	/* Clear returned values in case of errors */
> +	*val = 0;
> +
> +	if (tstamp) {
> +		*tstamp = 0;
> +		if (USE_BLK_TS_RAW(meta)) {
> +			/* Read out the actual BLK_TS */
> +			*tstamp = scmi_telemetry_blkts_read(magic, tde);

The signature of this changes in the next patch. Given it doesn't do anything
with the current parameters, it could not do anything with bts_payld and snap
as well and therefore reduce churn a tiny bit.

> +		} else if (LINE_TS_VALID_RAW(meta)) {
> +			/*
> +			 * Note that LINE_TS_VALID implies HAS_LINE_EXT and that
> +			 * the per DE line_ts_rate is advertised in the DE
> +			 * descriptor, BUT we check anyway against buggy FW.
> +			 */
> +			if (!HAS_LINE_EXT_RAW(meta)) {
> +				trace_scmi_tlm_access(tde->de.info->id,
> +						      "SHMTI_BAD_TS_LINE", 0, 0);
> +				return -EPROTO;
> +			}
> +
> +			*tstamp = LINE_TSTAMP_GET_RAW(&payld->tsl);
> +		}
> +	}
> +
> +	/* Data is always valid since we are NOT handling BLK TS lines here */
> +	*val = LINE_DATA_GET_RAW(&payld->l);
> +
> +	trace_scmi_tlm_collect(tstamp ? *tstamp : 0, tde->de.info->id,
> +			       *val, "SHMTI_DE_READ");
> +
> +	scmi_telemetry_tde_cache_update(tde, *val, tstamp, &magic);
> +
> +	return 0;
> +}
> +
> +/**
> + * scmi_telemetry_tdcf_data_parse  - TDCF DataLine parsing
> + * @ti: A reference to the telemetry info descriptor
> + * @payld: Line payload to parse
> + * @snap: A reference to the working SHMTI snapshot that will be processed
> + * @mode: A flag to determine the behaviour of the scan
> + * @active_bts: A pointer to keep track and report any found BLK timestamp line
> + * @active_uuid: A pointer to keep track and report any found UUID line
> + *
> + * This routine takes care to:
> + *  - verify line consistency in relation to the used flags and the current
> + *    context: e.g. is there an active preceding BLK_TS line if the DataLine
> + *    sports a USE_BLKTS flag ?
> + *  - verify the related Data Event ID exists OR create a brand new DE
> + *    (depending on the @mode of operation)
> + *  - links any active BLK_TS or UUID line to the current DE
> + *  - read and save value/tstamp for the DE ONLY if anything has changed (by
> + *    tracking the last TDCF magic) and update related magic: this allows to
> + *    minimize future needs of single-DE reads
> + *
> + *    Modes of operation.
> + *
> + *    The scan behaviour depends on the chosen @mode:
> + *    - SCAN_LOOKUP: the basic scan which aims to update value associated to
> + *		     existing DEs. Any discovered DataLine that could NOT be
> + *		     matched to an existing, previously discovered, DE is
> + *		     discarded. This is the normal scan behaviour.
> + *    - SCAN_UPDATE: a more advanced scan which provides all the SCAN_LOOKUP
> + *		     features plus takes care to update the DEs location
> + *		     coordinates inside the SHMTI: note that the related DEs are
> + *		     still supposed to have been previously discovered when
> + *		     this scan runs. This is used to update location
> + *		     coordinates for DEs contained in a Group when such group
> + *		     is enabled.
> + *    - SCAN_DISCOVERY: the most advanced scan available which provides all
> + *			the SCAN_LOOKUP features plus discovery capabilities:
> + *			any DataLine referring to a previously unknown DE leads
> + *			to the allocation of a new DE descriptor.
> + *			This mode is used on the first scan at init time, ONLY
> + *			if Telemetry was found to be already enabled at boot on
> + *			the platform side: this helps to maximize gathered
> + *			information when dealing with out of spec firmwares.
> + *			Any usage of this discovery mode other than in a boot-on
> + *			enabled scenario is discouraged since it can easily
> + *			lead to spurious DE discoveries.
> + */
> +static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
> +					   struct payload *payld,
> +					   struct shmti_snap *snap,
> +					   enum scan_mode mode,
> +					   struct telemetry_block_ts *active_bts,
> +					   struct telemetry_uuid *active_uuid)
> +{
> +	struct telemetry_shmti *shmti = snap->shmti;
> +	struct telemetry_de *tde;
> +	u64 val, tstamp = 0;
> +	u32 de_id;
> +
> +	de_id = PAYLD_ID_RAW(payld);
> +	/* Is this DE ID known ? */
> +	tde = scmi_telemetry_tde_lookup(ti, de_id);
> +	if (!tde) {
> +		if (mode != SCAN_DISCOVERY) {
> +			trace_scmi_tlm_access(de_id, "DE_INVALID", 0, 0);
> +			return;
> +		}
> +
> +		/* In SCAN_DISCOVERY mode we allocate new DEs for unknown IDs */
> +		tde = scmi_telemetry_tde_allocate(ti, de_id, payld);
> +		if (!tde) {
> +			dev_err(ti->ph->dev,
> +				"Cannot allocate TDE for ID:0x%08X\n", de_id);
> +			return;
> +		}
> +	}
> +
> +	guard(mutex)(&tde->mtx);
> +	/*
> +	 * Update DE location refs if requested: normally done only on group
> +	 * enable.
> +	 * Note that all the DE location information is relative to the
> +	 * original SHMTI device-memory area, NOT to the snapshot we are parsing.
> +	 */
> +	if (mode >= SCAN_UPDATE) {
> +		u32 de_offs;
> +		void __iomem *p;
> +
> +		/* Offest is the same in the SHMTI and in the snapshot indeed */

Offset

Also, drop the word indeed as adds nothing useful


> +		de_offs = (void __iomem *)payld - (void __iomem *)snap->base;
> +		/* Validate location before update */
> +		p = scmi_telemetry_payld_offset_safe_calc(shmti, de_offs);
> +		if (IS_ERR(p)) {
> +			dev_err(ti->ph->dev,
> +				"TDE 0x%08X updated location invalid - shmti:%u offs:%u\n",
> +				de_id, shmti->info.sid, de_offs);
> +			trace_scmi_tlm_access(de_id, "DE_LOCATION_INVALID", 0, 0);
> +			return;
> +		}
> +
> +		tde->sid = shmti->info.sid;
> +		tde->base = shmti->base;
> +		tde->eplg = SHMTI_EPLG(shmti);
> +		tde->offset = de_offs;
> +
> +		trace_scmi_tlm_access(de_id, "DE_LOCATION_UPDATED", 0, 0);
> +
> +		dev_dbg(ti->ph->dev,
> +			"TDCF-updated DE_ID:0x%08X - shmti:%pK  offset:%u\n",
> +			tde->de.info->id, tde->base, tde->offset);
> +	}
> +
> +	/*
> +	 * Has any value/tstamp really changed ?
> +	 * Note that, if the magic currently associated with this TDE has
> +	 * NOT changed compared to the current SHMTI magic, nothing could have
> +	 * been changed across the whole TDCF, including any relation to
> +	 * BLK_TS or UUID lines.
> +	 */
> +	if (!scmi_telemetry_tde_cache_stale(tde, snap->magic))
> +		return;
> +
> +	/*
> +	 * Parse data words ... only for the sake of updating TDE cache,
> +	 * any error is logged by ignored.
> +	 */
> +	scmi_telemetry_line_data_parse(tde, snap, &val, &tstamp, payld, NULL,
> +				       snap->magic);
> +}
> +
> +/**
> + * scmi_telemetry_tdcf_line_parse  - Line parser
> + * @ti: A reference to the Telemetry instance
> + * @payld: A reference to the payload representing the line to parse
> + * @snap: A reference to the working SHMTI snapshot that will be processed
> + * @mode: Specification of the scanning mode
> + * @active_bts: A reference used to track the last BLK_TS line found
> + * @active_uuid: A reference used to track the last UUID line found
> + *
> + * Note that @active_bts and @active_uuid references are propagated back and
> + * forth from the line parsers to keep track of the nearest active BLK_TS or
> + * UUID line found in the SHMTI areas and, while doing that, such descriptors
> + * are refcounted and tracked in the xa_lines XArray indexed by @payld.
> + * BLK_TS and UUID descriptors are dropped when no more linked to any DATA line,
> + * during the normal system operation OR later on when the protocol is
> + * de-initialized following a driver removal.

Is this description premature given nothing writes active_bts or active_uuid
yet.

> + *
> + * Return: Number of QWORDS consumed from @payld by this line parsing; note
> + *	   that buggy firmware could return bad, out of range values, so this
> + *	   value MUST be carefully checked for SHMTI boundary overflows by the
> + *	   caller.
> + */
> +static int scmi_telemetry_tdcf_line_parse(struct telemetry_info *ti,
> +					  struct payload *payld,
> +					  struct shmti_snap *snap,
> +					  enum scan_mode mode,
> +					  struct telemetry_block_ts **active_bts,
> +					  struct telemetry_uuid **active_uuid)
> +{
> +	u32 meta = le32_to_cpu(payld->meta);
> +	int used_qwords;
> +
> +	used_qwords = LINE_LENGTH_QWORDS_RAW(meta);
> +	/* Invalid lines are not an error, could simply be disabled DEs */
> +	if (DATA_INVALID_RAW(meta)) {
> +		trace_scmi_tlm_access(le32_to_cpu(payld->id), "TDCF_INVALID", 0, 0);
> +		return used_qwords;
> +	}
> +
> +	/*
> +	 * Problematic lines are ignored, their information discarded, and such
> +	 * issues are logged, but the scan process continues.
> +	 */
> +	switch (LINE_TYPE_RAW(meta)) {
> +	case TDCF_DATA_LINE:
> +		scmi_telemetry_tdcf_data_parse(ti, payld, snap, mode,
> +					       *active_bts, *active_uuid);

I'm going to assume that *active_bts and *active_uuid become non null as a result of some
future change and the odd current state of code here is just a result of patch break up.
At the a copy of the pointer value which is NULL is simply passed in here I think,
so no updates possible.

> +		break;
> +	default:
> +		trace_scmi_tlm_access(PAYLD_ID_RAW(payld), "TDCF_LINE_UNKNOWN", 0, 0);
> +		break;
> +	}
> +
> +	return used_qwords;
> +}



> +
> +/**
> + * scmi_telemetry_shmti_scan  - Full SHMTI scan
> + * @ti: A reference to the telemetry info descriptor
> + * @shmti_id: ID of the SHMTI area that has to be scanned
> + * @mode: A flag to determine the behaviour of the scan
> + *
> + * Return: 0 on Success
> + */
> +static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
> +				     unsigned int shmti_id, enum scan_mode mode)
> +{
> +	struct telemetry_shmti *shmti = &ti->shmti[shmti_id];
> +	struct telemetry_block_ts *active_bts = NULL;
> +	struct telemetry_uuid *active_uuid = NULL;
> +	unsigned int qwords;
> +	struct shmti_snap *snap;
> +	struct tdcf *tdcf;
> +	int idx, ret = 0;
> +	void *next;
> +
> +	if (!shmti->base)
> +		return -ENODEV;
> +
> +	idx = srcu_read_lock(&shmti->srcu);
> +	snap = srcu_dereference(shmti->cur, &shmti->srcu);
> +	if (!snap || !scmi_telemetry_shmti_unchanged(shmti, snap->magic)) {
> +		/* MUST drop the read lock: refresh calls synchronize_srcu() */
> +		srcu_read_unlock(&shmti->srcu, idx);
> +		snap = scmi_telemetry_shmti_refresh(shmti, &idx);
> +		if (IS_ERR(snap))
> +			return PTR_ERR(snap);
> +	}
> +
> +	tdcf = snap_tdcf(snap);
> +	next = tdcf->payld;
> +	qwords = QWORDS_RAW(tdcf);
> +	while (qwords) {
> +		int used_qwords;
> +
> +		/*
> +		 * Bailout on any error since we are processing a supposedly
> +		 * stable snapshot at this point, so any further error is on
> +		 * firmware-side and NOT recoverable: this would mean having to
> +		 * drop the remaining part of the scan results after having
> +		 * cached the initial good snapshot: log this down below.
> +		 */
> +		if (scmi_telemetry_snap_overflow(snap, next)) {
> +			trace_scmi_tlm_access(0, "SHMTI_OVERFLOW", snap->magic, 0);
> +			ret = -EPROTO;
> +			break;
> +		}
> +
> +		used_qwords = scmi_telemetry_tdcf_line_parse(ti, next, snap, mode,
> +							     &active_bts, &active_uuid);
> +		if (used_qwords <= 0 || qwords < used_qwords) {

If you hit the second condition here didn't you just overflow in the line parser?
Should that be prevented inside the parser? I think the only way this can happen is
qwords is short. If that is the case I think all bets are off and bale out
with no idea if the line was safe or not - ideally detect that in the
overflow check before parsing?  Maybe I'm missing some other reason that that can't
happen an in practice that second condition doesn't happen.

> +			/*
> +			 * Stop scanning when qwords inconsistent; if the last
> +			 * line processed was sane in itself, though, keep it
> +			 * since we anyway previously checked for overflow.
> +			 */
> +			trace_scmi_tlm_access(PAYLD_ID_RAW(next), "BAD_QWORDS",
> +					      snap->magic, 0);
> +			ret = -EPROTO;
> +			break;
> +		}
> +
> +		next += used_qwords * 8;

Is next always aligned?  If so could use a u64 * instead of void * as it is always
manipulated in qwords.

> +		qwords -= used_qwords;
> +	}
> +
> +	srcu_read_unlock(&shmti->srcu, idx);
> +
> +	if (ret)
> +		dev_err(ti->ph->dev, FW_BUG "Inconsistent TDCF. Scan aborted.\n");
> +
> +	return ret;
> +}
>
