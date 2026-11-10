Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794277622;
	b=P1pAEP4Zj5/0QzdVwnB0SMb4XJYxNZlt2jYhmysWjLOrKzbXF6lGHySAJkdRG+Iz8jNf
	 FUaJMPFYP7R5zLV5amrFcxvAPg1nOPsgjBrO57QfQBf35LYF1anocVEL/QJ7xluOewGM8
	 PWAMR4UIxAJWp7Qnxo2ZN8xj6bKeN1mSkfezSayiCBmMnvXuI9HDxYeJ1ENW8KwFKlLZy
	 HlgmqyQykSCpO+tupCjN3yQMOJZ/k33NXLpK38CEP06nLXBUGaHgslL0c7TIj2jjTnG75
	 dGaPX3Fo3PzS2BQCpF0enPvE4ap5lsWj5rQm0w3B4IJh/voMKGQ5RywnP3gW5w6ru3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794277622;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FbT91i0c5l/KVk+5M9vrjlRuG1+3lI13/QVZcwyokHQ=;
	b=LAEu05H3+ldOSFJ1pTtyX7R8wC4hRkxgDY/tnHyQHRUWGNtJLF+GHcSyL9yDXylr5mWd
	 rCR0EY8763sir+n0qpMg/FQAtmd4eFuzFr8YKE0n5XB/5DvLMes5bi+ysLf6XyqWl15v1
	 gMCCzxS/QjvCzNFvVj4JdCnQB/0vM2RTZSZ3WCksmSMluUHe/Q1xZuw1d1h0ISVPmq+1M
	 ilqvjGq5Mti77e7TS1SbC0r68owvj9Fict/iG1W4Q7eyghv6CkdVaEtA/dLzH3ps1CNmc
	 sZu3eQhS4xbQFfGlPwu6kL6LgGS6ZI6th3BTzrbH1MHgw7El59iPVK69Lhip1qPvP9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I9EMFaMW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jeAFw7uL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7493F606A31C
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 02:27:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7493F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I9EMFaMW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jeAFw7uL
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0j72e764334
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 02:27:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FbT91i0c5l/KVk+5M9vrjlRuG1+3lI13/QVZcwyokHQ=; b=I9EMFaMWNtXPYRVj
	L2ts+ZenQ+6nxmUJleNtxEjnkHz3rezskY13a1f6Ez+LRG/wi4LpA+bZj24W8Fwo
	1ijJPzgdw38fMJ1QWN3QIxzttF7uPkpeSW+/SRSD6ncdocrklwIhvPQX7FWz7kyC
	w4Jky8HN+OLUKq4ylqg8FrN0MEGZI6u9FuTXt5Cz4tTulb3IFLKZnZeIxNdQrpJU
	RnhfKxU5N/Bk+uZl8OxuB0dOc2cceLkzXktKRvwKv/iylCDprODwPPWP5QsOtfEM
	/kNYe8W57yTImchU58JQdpk3MHzm5zvkgrDHSQr7IuebKMbqfFU/SeRnfi92IlBl
	GW/ksQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkgybd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 02:27:00 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-37549877380so427787eec.0
        for <arm-scmi@vger.kernel.org>; Mon, 09 Nov 2026 18:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794277619; x=1794882419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FbT91i0c5l/KVk+5M9vrjlRuG1+3lI13/QVZcwyokHQ=;
        b=jeAFw7uLdCxOnVuJR0L6VFhV2e7MM1ia3jxHJXv3/GO92zyHW1d10+G9gjO0De61oJ
         tY2rEny4IbWXmsuZwb7+tO54JQrKe96LVvWi8vRtyuZTO6+Qmq41S6VOxgXFejyQBHGf
         K/9bPmOgSpOBUghNaXWLxek0LNk6HHM0kSjRF9gTP8hE8mk375NECgKpZXdX8cXahMLx
         d2H62h+ZE2INiz+sgDpRoNnFpSR7YdthVmVyF1rgsPeNm9TT5Acu/qCz009MayFkAwMA
         QN4SB8mOuzuK7Fw6J7FTElWBBxStkMmDHJtDmZC8CYULTiMV/Kwjj+3DWk/g5hNvHuyv
         aVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794277619; x=1794882419;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FbT91i0c5l/KVk+5M9vrjlRuG1+3lI13/QVZcwyokHQ=;
        b=lC6xIbobe2eeLPCmy0ZATrBrdocQ4ue28KPwNYcOc2qzuvh8Alq/TyN2CoS20HFDP4
         OnfubT//ZC/G0h2a76IKNLiNPXh/ZC6CZFgTt6Oe7YOjFVQOX166F7IN/SlLsQYlBSwv
         jHJTqrQ6hSaKW8WRBhg5uM0hrPokey4lBntKozVuXsF7Rj9/IS1ZisFXL/MnRi6pk3YT
         pUXqgAFK/mhBhz2NOHokJrAsV6rUqsmZ/AmUW7W+FPOdOIB47VBPlEKuFuz2LZlN3c9r
         OHGJvFvu6xWWxUwYIh1XlyQpwVOarlUe7w/38wuM4YzxVlyDsCNFiMdjzUws1BTvBeBf
         Ifbg==
X-Forwarded-Encrypted: i=1; AL+hErGUnGNkJaZpkt+YbmAv4RjpgOsZju09W2U2IaiBQ9FY1cdyVeIhhacNhzOHkmRupZPQUmX0LysZbw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+mQM7UzsZygVDsuNhBwULwhZXQ0wS0LE4vYEzaB+3v5JlTVa2C
	YvmPbdS9tE3SRadJMTGeQayR+TjaIIL1pWVsBOCHBXbEQeNPpMxBEOuSpezNWmj1GzhoWviuu7/
	cy7fla3p7InGj6zzeAxQIgt73dHIacBqm8vAJc7x8CuGODKitM4uzfB5cUKWhqg==
X-Gm-Gg: AYBFou2es4Dxh3ICvgAXW+LcuGET9mrrR74oUGmPdIOmD896r52djeCq4uV3lTMv2WV
	zHmRou82KitvWLBEjulwhI2GH/l+MJoV+gEjc5upALQ17NrMep6f346UpCfxQ4gy5BK48GIygKq
	5AZtxGmqrqoJCQIS96L77CeE52zJanxFXh4pxB1lThUIqeOaYSWF/8u2I5HcEWbTVA7m2Sz9y8d
	fSYaz2IdRRgKZZXDHnpK0PwX0C/N9emEOUZcS9Jkrzrmx4y7iCvhmOSwRpVhClVL0y8DS5QDwJo
	EH8YU4W8ESghXzB1erKEzhy9/KF50lG8q0/CNDjdpb/iLRV43pm0HbnwIdsAvH3rmvjJmTpTMwL
	pSlhS5wRdrjqt4DenJOyQ8l86f4p/PC4AV9a4yghTMFHJgS7AAnnjO1Cb+tR6CWuDLaV59Jcu1i
	YTh5mgdFo5myoZauQbzAGUMqm4Bg==
X-Received: by 2002:a05:693c:41cc:10b0:369:ef63:ea95 with SMTP id 5a478bee46e88-3751ee7c792mr1574062eec.6.1794277619055;
        Mon, 09 Nov 2026 18:26:59 -0800 (PST)
X-Received: by 2002:a05:693c:41cc:10b0:369:ef63:ea95 with SMTP id 5a478bee46e88-3751ee7c792mr1574034eec.6.1794277618398;
        Mon, 09 Nov 2026 18:26:58 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm2466798eec.8.2026.11.09.18.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:26:58 -0800 (PST)
Date: Mon, 9 Nov 2026 18:26:54 -0800
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
Subject: Re: [PATCH v15 13/35] firmware: arm_scmi: Add Telemetry SHMTI areas
 enumeration
Message-ID: <20261109182654.00003f6d@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-14-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-14-cristian.marussi@arm.com>
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
X-Proofpoint-GUID: drLLLVkSF4TIlOpwUNiiTqc_bBnCxMH0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwOSBTYWx0ZWRfX59OKH9I74vA7
 abtmL0WokY05zRu+YKpp1U88TRpz8CUwS5Udlp1Pl7f1vLGn1h1QxJj8nfte9eUW/zOPNGZRQkl
 vyhED3i+epwJZsnbmpM4VLSCTjolN+8=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af280f4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7CQSdrXTAAAA:8 a=UCLCd_48klQTlnfJctoA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: drLLLVkSF4TIlOpwUNiiTqc_bBnCxMH0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwOSBTYWx0ZWRfX2Ao61CcvvpsK
 daUT1juyURh7ajq2Do0CthZrYD7cqSEoYCC0Wh8mf2DmS/hcB5OQ4Frt9UHo+/ahWrOUBeQL4qb
 I088U3nUgO3QbjjBbBrwkJ0/V4eSK4y5lMHfueQMRHOeSch2pmERilSzFm1bVRCMRekHcnLVLUZ
 vyby8mGRgRn7fZCx4FTZLUwCD9PtN50gmtb7mlw/dgkACDdFIWzFVDJO7UDh63vXcKm+JsKKZe+
 AcxhxDFTKASAXVQLCI28NYIr1KAPow1oEAIZa5vF12WADOmktrAJgIp+GPXb/wTUsmmlZ9F0azj
 naoDxOf6eFbkONSdWbtnRN9l8lDe+3ZNAi7CM/F/FmOR7zMX/fNN/x96NpVgVImpHU9yAFCN38y
 VWRFcbFLLxN864JGtizrut7BPnl+qk/rtYkDpY/OnCk0Wcm3lg9CnwslUnZIspqoxAllucP8QWn
 h1G0UlSspAQGbDGtrTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100009

On Mon,  9 Nov 2026 09:11:59 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add Telemetry support to enumerate SHMTI areas.

I'd be tempted to leave the local data structures like snaps to
be introduced only when code actually uses them.

> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> v14 --> v15
>  - fix prologue/epilogue endianity fields
>  - rework SHMTI initialization and allocation
>  - add snapshot suppport data structures
>  - added alignment checks on SHMTII length size
>  - fixed error string formatting
>  - warn if less than expected SHMTIs are enumerated
>  - improve memory area sanity checks
> v13 --> v14
>  - splitted out of the old Basic Telemetry patch, contains the
>    SHMTI areas enumeration routines
> ---
>  drivers/firmware/arm_scmi/telemetry.c | 312 ++++++++++++++++++++++++++
>  include/linux/scmi_protocol.h         |  59 +++++
>  2 files changed, 371 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> index e57534c93b26..d9f1a3e3468e 100644
> --- a/drivers/firmware/arm_scmi/telemetry.c
> +++ b/drivers/firmware/arm_scmi/telemetry.c
> @@ -16,6 +16,7 @@
>  #include <linux/limits.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/sizes.h>
>  #include <linux/slab.h>
>  #include <linux/sprintf.h>
>  #include <linux/string.h>

> +struct scmi_msg_resp_telemetry_shmti_list {
> +	__le32 num_shmti;

Add a comment that this is not actually the number of shmti. 
Not confusing spec name at all.   Maybe just put a pair of
extraction macros right after it like you've had for
some of the other similar cases and that will act as documentation
that not all is what it seems.

> +	struct scmi_shmti_desc desc[];
> +};
> +
>  struct de_desc_fastchannel {
>  	__le32 addr_low;
>  	__le32 addr_high;
> @@ -107,6 +121,72 @@ struct scmi_msg_resp_telemetry_update_intervals {
>  	__le32 intervals[];
>  };
>  
> +/* TDCF */
> +
> +#define _I(__a)		(ioread32((void __iomem *)(__a)))

Is that really worth doing?  I think I'd rather see some long lines
with that expanded out.

> +
> +struct prlg {
> +	__le32 sign_start;
> +#define SIGNATURE_START	0x5442474E	/* TBGN */
> +	__le32 match_start;
> +	__le32 num_qwords;
> +	__le32 hdr_meta_1;
> +#define TDCF_REVISION_GET(x)	(le32_get_bits((x)->hdr_meta_1, GENMASK(7, 0)))

Outer brackets needed?

> +};
> +
> +struct eplg {
> +	__le32 match_end;
> +	__le32 sign_end;
> +#define SIGNATURE_END	0x54454E44	/* TEND */
> +};
> +
> +#define TDCF_EPLG_SZ	(sizeof(struct eplg))
> +
> +struct tdcf {
> +	struct prlg prlg;
> +	unsigned char payld[];
> +};
> +
> +#define SHMTI_MIN_SIZE	(sizeof(struct tdcf) + TDCF_EPLG_SZ)
> +/* An arbitrary upper bound to avoid crazy allocations driven by buggy FW */
> +#define SHMTI_MAX_SIZE	SZ_64K
> +
> +#define TDCF_START_SIGNATURE(x)	(_I(&((x)->prlg.sign_start)))
> +#define TDCF_END_SIGNATURE(e)	(_I(&((e)->sign_end)))


>  	/* Mutex to protect access to @free_des */
> @@ -878,6 +960,211 @@ scmi_telemetry_enumerate_common_intervals(struct telemetry_info *ti)
>  					ti->info.intervals);
>  }
>  
> +static int iter_shmti_update_state(struct scmi_iterator_state *st,
> +				   const void *response, void *priv)
> +{
> +	const struct scmi_msg_resp_telemetry_shmti_list *r = response;
> +
> +	st->num_returned = le32_get_bits(r->num_shmti, GENMASK(15, 0));
> +	st->num_remaining = le32_get_bits(r->num_shmti, GENMASK(31, 16));
I'd move those two into defines above, just to document that num_shmti is more
complex than it seems at first glance. Also for general consistency.
> +
> +	if (st->rx_len < (sizeof(*r) + sizeof(r->desc[0]) * st->num_returned))
> +		return -EINVAL;
> +
> +	return 0;
> +}

> +
> +static int iter_shmti_process_response(const struct scmi_protocol_handle *ph,
> +				       const void *response,
> +				       struct scmi_iterator_state *st,
> +				       void *priv)
> +{
> +	const struct scmi_msg_resp_telemetry_shmti_list *r = response;
> +	struct telemetry_info *ti = priv;
> +	struct telemetry_shmti *shmti;
> +	const struct scmi_shmti_desc *desc;
> +	void __iomem *addr;
> +	phys_addr_t phys_addr;
> +	size_t len;
> +	int ret;
> +
> +	desc = &r->desc[st->loop_idx];
> +	shmti = &ti->shmti[st->desc_index + st->loop_idx];
> +
> +	shmti->info.sid = le32_to_cpu(desc->id);
> +	shmti->flags = le32_to_cpu(desc->flags);
> +
> +	ret = scmi_telemetry_area_check(ph->dev, "SHMTI",
> +					le32_to_cpu(desc->addr_low),
> +					le32_to_cpu(desc->addr_high),

Same as before. I'd do the build of phys_addr and len outside the
call. Keep it to checking validity as it's name suggests.

> +					le32_to_cpu(desc->length),
> +					&phys_addr, &len);
> +	if (ret) {
> +		dev_err(ph->dev, "Malformed SHMTI ID:%u. Abort.\n",
> +			shmti->info.sid);
> +		return ret;
> +	}
> +
> +	if (len < SHMTI_MIN_SIZE || len > SHMTI_MAX_SIZE) {
> +		dev_err(ph->dev,
> +			FW_BUG "Invalid length for SHMTI ID:%u len:%zu. Abort.\n",
> +			shmti->info.sid, len);
> +		return -EINVAL;
> +	}
> +
> +	/* SHMTI base phys_addr SHOULD be 64bit aligned by the SCMI spec */
> +	if (!IS_ALIGNED(phys_addr, 8))
> +		dev_warn(ph->dev,
> +			 "SHMTI ID:%u is NOT 64bit aligned (paddr:0x%llX)\n",
> +			 shmti->info.sid, phys_addr);
> +
> +	addr = devm_ioremap(ph->dev, phys_addr, len);
> +	if (!addr)
> +		return -EADDRNOTAVAIL;
> +
> +	shmti->base = addr;
> +	shmti->info.len = len;
> +	shmti->info.phys = phys_addr;
> +	shmti->info.offset = shmti->info.phys & ~PAGE_MASK;
> +
> +	ret = scmi_telemetry_shmti_validate(ph->dev, shmti);
> +	if (ret)
> +		return ret;
> +
> +	ti->num_shmti++;
> +
> +	return 0;
> +}


> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index f38ca2f8099b..b7b8bd77b37d 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -830,6 +830,57 @@ struct scmi_pinctrl_proto_ops {
>  	int (*pin_free)(const struct scmi_protocol_handle *ph, u32 pin);
>  };
>  

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

Die 0x1d is in the version I'm looking at. Perhaps a comment
for specific version of spec used.  I'd also
be tempted to assign every one of these as it makes
it easy to eyeball an particular one vs the spec.

> +	SCMI_TLM_COMPO_TYPE_RESERVED_START = 0x1d,
> +	SCMI_TLM_COMPO_TYPE_RESERVED_END = 0xdf,
> +	SCMI_TLM_COMPO_TYPE_OEM_START = 0xe0,
> +	SCMI_TLM_COMPO_TYPE_OEM_END = 0xff,
> +};


