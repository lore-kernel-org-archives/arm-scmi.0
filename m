Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792452510;
	b=uh0n7En6OILqpVh+h8pariPSuYkOXRFdxXYPGqEP9IKzRPgQ1FDpN2odxJFx2IxLIX30
	 0IpqorByTGKOyT0yaMowJn1Gms6683+JLsim+UrVpLOz2K6dcAblFYVw9GzERVViYi49/
	 dtd27VDfK+9+PLcRu1PV71zrATXm7jl+ozuSfYk0zJW+/osm+P7PFI7DFprO9KzB565EQ
	 YNKc5B9HbXNhMrplLUe/jDFiwaArz8XADFjIARUlAXZHirM1UPZBADVJR4LL8/3sCVp0M
	 6diNCFi5xAF0Ml23ROqf2FEUGH+DwieBfpnat7O6XoAdkw8mcSRCPQoD9Qwa5SzaJPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792452510;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=U5pRca9e23eaEVokSuHNFqxKx9CROeMF4ga+E+EvS6Q=;
	b=yoVWKFNGG4KE4Sr0KV+GxLLsc4jyY0z9lakLAaowprXmWRZL0Ki/Pft8FJAgQp1MsVz+
	 DKkgyzzxsB4dx98PO76x8PETa7OqrxNlh+Gv3K1oJmN5ADNMyiecqJLF67dxvUy2DiyLA
	 71J23uvcCgvs+ICWo+yubCRO1Vs8lvAmv57JZFlv3egsflSD95/tXNI000ojpAYmbnxD+
	 4V2Qzk9DN3xY/sOJN3C8zjtEaXo4bXsc0iJ2eXlCMML1aCr9NB9QJD72//lYCYFAx1DqB
	 4ng72l86Ak8eEGrM+w9VSRgT1n9iXGooXACEGZfK/EyRjp8rXq785eIyPhYiaKsadRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EeglTVp1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="igrFuS/O";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EFE606A32F
	for <arm-scmi@vger.kernel.org>; Mon, 19 Oct 2026 23:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34EFE606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EeglTVp1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=igrFuS/O
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JLZPtE792173
	for <arm-scmi@vger.kernel.org>; Mon, 19 Oct 2026 23:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U5pRca9e23eaEVokSuHNFqxKx9CROeMF4ga+E+EvS6Q=; b=EeglTVp1JI9p+wYC
	dEofWuJLBeVH9U/HheI8gR8aKWYYNOMHm2RotZjhs1oR8aw19ynFawS8hTF/fZB7
	CvozLfenzXxoJoKpOLUrLecVjpOjfpy4hbueIjG9YaxMVxq/SqZe6zB1XTKhST1m
	WdoZVtBPXni95Z49XKjZ0MU4NIckz/oPwMgcax+GqUGcXgcECMQuc//DM74ry02e
	YTHipbdtx+OfViD9c+flsvB1p8IFSjQLda6g56uUvYzIk2IP+xplWOv5EFJ4KpRh
	EggdlHX5lBRSmCWT+2977JoUlp73tWURxx15UbqhRKw8hHjpNkE0NWFTk6MAOunA
	Ly3bvg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3fbp1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Mon, 19 Oct 2026 23:28:29 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1665200f4c2so3741244c88.0
        for <arm-scmi@vger.kernel.org>; Mon, 19 Oct 2026 16:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792452508; x=1793057308; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=U5pRca9e23eaEVokSuHNFqxKx9CROeMF4ga+E+EvS6Q=;
        b=igrFuS/Or77Zo4J1Ubd5cpwl782IjlYHB2Vl7Gk3f49mX0/CaClB3HSZTlXSObwUh1
         WHmqU6cIhhd2Hza5LYiHS6HwJ6ErWfmsnyrziukILaGypBH1zsPAj2IW92pO9Ncz+5y5
         hUHC6c2pk5DTu1kJr+kMNmFtqdkJYsCU7hE2tg1d8KMFe0O8PI/X8sWhNqCKG47jmWst
         4mP5gwQNY7btWNWOJ8YGSSR+fBiDaxS5E+Wtr0OaUF5p9w5GHboagh7hthfmEEq+jUCM
         CEIqPk1LwbgncjnG3yfUbvvvSPYbdFo1z3SrVJ4dAB8e6NAZkkZs+dJxX5SuLYg5RH0T
         fdHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792452508; x=1793057308;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U5pRca9e23eaEVokSuHNFqxKx9CROeMF4ga+E+EvS6Q=;
        b=q78nqbEGLfkm1mNA3WG0lpDaiB8nTXsE+6Pmcf6Dx0T3rboPTGyCUGDHtFEBu15eDT
         XlnUsSz/HU90ZDs9Z/yrZEmZMGC3eGQydrplgoFHna6VEU2NLTYnPov0ZAgqPklKQpqY
         S2k1OB0XYLgXP+hkKSrDNDoNm7j+74y2Jv9UDhoUMdkdJcxpSrZ9VV4lWoHuD7yh05kE
         Qushhg8nvO1SbmbIH0I5UMgNDg2bTW2XKi1orMxS7qll5mvCAaVpe/AGJnzcTeLulkhW
         Yn1XiSbjyxRoD+yb++Pq1nef11IGNpBIYOiLJEYk1YgQvnZjnsl+qXSby99k0o210IVL
         FsEg==
X-Forwarded-Encrypted: i=1; AKwUvBwSRIhndJ6KuBNebfyZPwA2zCkTqU9BTBFtpYxy+pcdKzEiIX9525So6gCgNdkZMe7VZ193brxjhw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIdr4THT1zTQ3lMUYOOMGqb0RKtxg2DfFRfZg3wGzEthJw+3txJ
	OFd43gzi1zUMQmVGzGJIOBIZKpHfmZLa8reAzafR0ikb2nqjksih474Asu3MQoWbXXEMwffIzoj
	rxhOAzpibfjoxdda3IFxNAV+G+0ZpuMSY6rOb0YpbSWCBfarDum09P7IJ0aDWLA==
X-Gm-Gg: AYBFou2afT+EuNnKrt6Pn5BL5SYhLosHb3eTgZHAP7zHPSrSLikN4bs4pNevi7m/gyN
	nmZp4DSXa7SDlmlDnTceJYheDYoyLeFzXDyujR6MPkuvPY0WTRRbBHCgOLcPuzZwNsI/xYFffoo
	kLSQ8bd3g+fuRfsxTPrXaBpyhEhfakPbANXp3qjr0KKWdABum302mquEYjnT9mkEkqsJY6YmiOV
	mvIgLKwB3vN1oAB9wnEEM67ReWNKQa6flBNrJupeKerE8zRtYpryZx/RuLmnhc/UKDs7hAbkKD2
	+eW2L4mYL8sceaN3rwxQyQc91ZXwMIGlU7W7853zhQsrgaXopqgiPqJf1G8QLDGA9RCgv4POUl1
	YTfvVfcI/Ps6E8RwcSTbv7hnPn8xnzA3NM5GPz954Ekg=
X-Received: by 2002:a05:701b:2910:b0:14c:efa5:ee7 with SMTP id a92af1059eb24-1851160d0f9mr13032425c88.14.1792452508155;
        Mon, 19 Oct 2026 16:28:28 -0700 (PDT)
X-Received: by 2002:a05:701b:2910:b0:14c:efa5:ee7 with SMTP id a92af1059eb24-1851160d0f9mr13032382c88.14.1792452507287;
        Mon, 19 Oct 2026 16:28:27 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b1722asm33320678c88.1.2026.10.19.16.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 16:28:26 -0700 (PDT)
Date: Mon, 19 Oct 2026 16:28:23 -0700
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
Subject: Re: [PATCH v14 08/32] firmware: arm_scmi: Add Telemetry resources
 enumeration
Message-ID: <20261019162823.000069e4@oss.qualcomm.com>
In-Reply-To: <20261016185553.2794459-9-cristian.marussi@arm.com>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
	<20261016185553.2794459-9-cristian.marussi@arm.com>
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
X-Proofpoint-ORIG-GUID: a7Dj5vsKd16wUMpiE1QzNBOIM7e7vvXh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA5MyBTYWx0ZWRfX5lxe0r9PRHZK
 40AAVTtf7IELDEH9FEuExK9rdQKp/W7YeJF83msqbPaeRMlO9Zfl52M0T2uAhNi70DZ+gS3X1mm
 x5eLriMMFdrsvyDtdCFUKG5bPQO9MinIhKiD42YkZOMQd2pFeC6CktuJPrSJYNqDpwvS2+DTeD7
 I3cn9jH1t8PF80UwWlex9+iGj/EpYabodxiTQMGdT8FkfgE8BjSS/egsBcQD/AidtG0wIGmXJLL
 sESsA5EAHP9LmdT+NGtwWbxQTssMx0B+MweEh9yjYDADxG6Wv1dNmqd8YJmz7x5ErzHxV7s/5fy
 91VCGCJh6pTGq5E4jqnRAgG/Q66oo0syNlzHRqGjgvQho2aZYOJsp/3c4KdRd5St3tSjGLRtpp3
 fTT9uowwuYI+L53qJeIb1HkVYmbfyWIx9E/y8AICnG57ThHw9VR021grdgIfHoLsmAZ133Q23k0
 /52ZTBbmNvM7nl6j6ow==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA5MyBTYWx0ZWRfX5Dd0UKbj7jrW
 KCUztgeEafqNYaBjvAYdKfQzXdtKi6jDwnAyKzb2vaJsKP7CwLpdVU/cRxxtdyLFpR+uYF5VW3j
 bCUpkm3f2jBU5ikBNmmD81mU1wvFkS4=
X-Proofpoint-GUID: a7Dj5vsKd16wUMpiE1QzNBOIM7e7vvXh
X-Authority-Analysis: v=2.4 cv=OaANnRTY c=1 sm=1 tr=0 ts=6ad6a79d cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7CQSdrXTAAAA:8 a=xkoatq2HAAAA:8 a=mqPLNF9SDdbUu0IS1PwA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=CuNAHyPTimGbZf_9KV2F:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_06,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190093

On Fri, 16 Oct 2026 19:55:29 +0100
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add core Telemetry initialization routines in charge of basic allocations
> and DataEvents enumerations.

Needs more about why you have made key design decisions in here.

> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> v13 --> v14
>  - splitted out of the old Basic Telemetry patch, contains the basic
>    instance allocations and the DEs enumeration process
>  - renamed some fields to more strictly adhere to spec nomenclature
Even split out this remains challenging to review.

I've asked for a few comments inline for why certainly structures are used
and stored in arrays when they look like they could just be directly embedded
in each other.

They tend to surface much later when you add the userspace ABI.

> ---
>  drivers/firmware/arm_scmi/telemetry.c | 633 ++++++++++++++++++++++++++
>  include/linux/scmi_protocol.h         |  38 ++
>  2 files changed, 671 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> index 32f6f8d1106d..87ff75805935 100644
> --- a/drivers/firmware/arm_scmi/telemetry.c
> +++ b/drivers/firmware/arm_scmi/telemetry.c
> @@ -8,15 +8,19 @@
>  #include <linux/atomic.h>
>  #include <linux/bitfield.h>
>  #include <linux/compiler_types.h>
> +#include <linux/completion.h>
> +#include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/io.h>
>  #include <linux/limits.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/slab.h>
>  #include <linux/sprintf.h>
>  #include <linux/string.h>
>  #include <linux/uuid.h>
> +#include <linux/xarray.h>
>  
>  #include "protocols.h"
>  #include "notify.h"
> @@ -51,13 +55,189 @@ struct scmi_msg_resp_telemetry_protocol_attributes {
>  	__le32 default_blk_ts_rate;
>  };
>  
> +struct de_desc_fastchannel {
> +	__le32 addr_low;
> +	__le32 addr_high;
> +	__le32 size;
> +};
> +
> +struct scmi_de_desc {
> +	__le32 de_id;
> +	__le32 group_id;
> +	__le32 de_data_sz;
> +	__le32 de_attributes_1;

Maybe de_attrs_1 is enough?  Would shorted a few lines!


> +#define	IS_NAME_SUPPORTED(d)	(le32_get_bits((d)->de_attributes_1, BIT(31)))
> +#define	IS_FC_SUPPORTED(d)	(le32_get_bits((d)->de_attributes_1, BIT(30)))
> +#define	GET_DE_TYPE(d)		(le32_get_bits((d)->de_attributes_1, GENMASK(29, 22)))
> +#define	IS_PERSISTENT(d)	(le32_get_bits((d)->de_attributes_1, BIT(21)))
> +#define GET_DE_UNIT_EXP(d)							\
> +	({									\
> +		__u32 __signed_exp =						\
> +			le32_get_bits((d)->de_attributes_1, GENMASK(20, 13));	\
> +										\
> +		sign_extend32(__signed_exp, 7);					\
> +	})
> +#define	GET_DE_UNIT(d)		(le32_get_bits((d)->de_attributes_1, GENMASK(12, 5)))
> +#define	TSTAMP_SUPPORT(d)	(le32_get_bits((d)->de_attributes_1, GENMASK(1, 0)))
> +	__le32 de_attributes_2;
> +#define	GET_DE_INSTA_ID(d)	(le32_get_bits((d)->de_attributes_2, GENMASK(31, 24)))
> +#define	GET_COMPO_INSTA_ID(d)	(le32_get_bits((d)->de_attributes_2, GENMASK(23, 8)))
> +#define	GET_COMPO_TYPE(d)	(le32_get_bits((d)->de_attributes_2, GENMASK(7, 0)))
> +	__le32 de_attributes_3;
> +};
> +
> +struct scmi_msg_resp_telemetry_de_description {
> +	__le32 num_desc;

I'd add a comment about this being a few values packed
together to just avoid someone saying __counted_by_le()
is appropriate - the name rather suggests it is!

> +	struct scmi_de_desc desc[]; 
> +};

> +
> +struct telemetry_de {
> +	enum timestamps ts_type;
> +	u32 ts_rate;

I think some of this is not yet used and it would be better to bring
elements in only when we can see how they are used.
The ts_rate nested some layers below is the one initialized in this
patch I think.

> +	bool enumerated;
> +	void __iomem *base;
> +	u32 sid;
> +	u32 offset;
> +	/* NOTE THAT DE data_sz is registered in scmi_telemetry_de */
> +	u32 fc_size;
> +	struct list_head item;
> +	struct scmi_telemetry_de de;
> +	/* Protect last_val/ts/magic accesses - MUST BE KEPT LAST */
> +	struct mutex mtx;
> +};
> +
> +#define to_tde(d)	container_of(d, struct telemetry_de, de)
> +
>  struct telemetry_info {
>  	bool streaming_mode;
>  	unsigned int num_shmti;
>  	unsigned int num_des_tstamp;
>  	unsigned int default_blk_ts_rate;
>  	const struct scmi_protocol_handle *ph;
> +	struct telemetry_de *tdes;
> +	struct xarray xa_des;
> +	/* Mutex to protect access to @free_des */
> +	struct mutex free_mtx;
> +	struct list_head free_des;
> +	struct list_head fcs_des;
>  	struct scmi_telemetry_info info;
> +	atomic_t rinfo_initializing;
> +	struct completion rinfo_initdone;
> +	struct scmi_telemetry_res_info *rinfo;
> +	struct scmi_telemetry_res_info *(*res_get)(struct telemetry_info *ti);
> +};

> +static struct telemetry_de *scmi_telemetry_tde_get(struct telemetry_info *ti,
> +						   unsigned int de_id)
> +{
> +	struct telemetry_de *tde;
> +
> +	/* Pick a new tde */

Not sure the comment adds anything as function is well enough named.

> +	tde = scmi_telemetry_free_tde_get(ti);
> +	if (!tde) {
> +		dev_err(ti->ph->dev, "Cannot get TDE for ID:0x%08X\n", de_id);
> +		return ERR_PTR(-ENOSPC);
> +	}
> +
> +	tde->sid = SHMTI_ID_INVALID;
> +
> +	return tde;
> +}
>
> +
> +struct scmi_tlm_de_priv {
> +	struct telemetry_info *ti;
> +	void *next;
> +	size_t rx_len;
>  };
>  
>  static int
> @@ -99,6 +279,221 @@ scmi_telemetry_protocol_attributes_get(struct telemetry_info *ti)
>  	return ret;
>  }
>  
> +static void iter_tlm_prepare_message(void *message,
> +				     unsigned int desc_index, const void *priv)
> +{
> +	put_unaligned_le32(desc_index, message);
> +}
> +
> +static int iter_de_descr_update_state(struct scmi_iterator_state *st,
> +				      const void *response, void *priv)
> +{
> +	const struct scmi_msg_resp_telemetry_de_description *r = response;
> +	struct scmi_tlm_de_priv *p = priv;
> +
> +	st->num_returned = le32_get_bits(r->num_desc, GENMASK(15, 0));
> +	st->num_remaining = le32_get_bits(r->num_desc, GENMASK(31, 16));
> +
> +	if (st->rx_len < (sizeof(*r) + sizeof(r->desc[0]) * st->num_returned))
> +		return -EINVAL;
> +
> +	/* Initialized to first descriptor and initial payload size */
> +	p->next = (void *)r->desc;

Can p->next just be const?  Would avoid need for casting here.

> +	p->rx_len = st->rx_len - sizeof(*r);
> +
> +	return 0;
> +}

> +
> +static int scmi_telemetry_de_descriptor_parse(struct telemetry_info *ti,
> +					      struct telemetry_de *tde,
> +					      void **next, size_t *rx_len)
> +{
> +	const struct scmi_de_desc *desc = *next;
> +	size_t payld_sz = sizeof(*desc);
> +
> +	lockdep_assert_held(&tde->mtx);
> +
> +	if (*rx_len < payld_sz)
> +		return -ENOSPC;
> +
> +	tde->de.info->id = le32_to_cpu(desc->de_id);
> +	tde->de.info->grp_id = le32_to_cpu(desc->group_id);
> +	tde->de.info->data_sz = le32_to_cpu(desc->de_data_sz);
> +	tde->de.info->type = GET_DE_TYPE(desc);
> +	tde->de.info->unit = GET_DE_UNIT(desc);
> +	tde->de.info->unit_exp = GET_DE_UNIT_EXP(desc);
> +	tde->de.info->instance_id = GET_DE_INSTA_ID(desc);
> +	tde->de.info->compo_instance_id = GET_COMPO_INSTA_ID(desc);
> +	tde->de.info->compo_type = GET_COMPO_TYPE(desc);
> +	tde->de.info->persistent = IS_PERSISTENT(desc);
> +	tde->ts_type = TSTAMP_SUPPORT(desc);
> +	tde->de.tstamp_support = !!tde->ts_type;
> +	tde->de.fc_support = IS_FC_SUPPORTED(desc);
> +	tde->de.name_support = IS_NAME_SUPPORTED(desc);
> +	/* Update DE_DESCRIPTOR size for the next iteration */
> +	*next += sizeof(*desc);
> +
> +	payld_sz += scmi_telemetry_tde_var_size_calc(tde);
> +	if (*rx_len < payld_sz)
> +		return -ENOSPC;
> +
> +	if (tde->ts_type == TSTAMP_LINE) {
> +		__le32 *line_ts_rate = *next;
> +
> +		tde->de.info->ts_rate = le32_to_cpu((*line_ts_rate));
> +
> +		/* Variably sized depending on TS support */
> +		*next += sizeof(*line_ts_rate);
> +	} else if (tde->ts_type == TSTAMP_BLK) {
> +		/* Setup default BLK TS value at first */
> +		tde->de.info->ts_rate = ti->default_blk_ts_rate;
> +	}
> +
> +	if (tde->de.fc_support) {
> +		u32 size;
> +		u64 phys_addr;
> +		void __iomem *addr;
> +		struct de_desc_fastchannel *dfc;
> +
> +		dfc = *next;
> +		phys_addr = le32_to_cpu(dfc->addr_low);
> +		phys_addr |= (u64)le32_to_cpu(dfc->addr_high) << 32;

Does
		phys_addr = get_unaligned_le64(&dfc->addr_low);
work for this?  For me that would provide simple documentation of
the maths.

> +
> +		size = le32_to_cpu(dfc->size);
> +		addr = devm_ioremap(ti->ph->dev, phys_addr, size);
> +		if (!addr)
> +			return -EADDRNOTAVAIL;
> +
> +		tde->base = addr;
> +		tde->offset = 0;
> +		tde->fc_size = size;
> +
> +		/* Variably sized depending on FC support */
> +		*next += sizeof(*dfc);
> +	}
> +
> +	if (tde->de.name_support) {
> +		const char *de_name = *next;
> +
> +		strscpy(tde->de.info->name, de_name, SCMI_SHORT_NAME_MAX_SIZE);
> +		/* Variably sized depending on name support */
> +		*next += SCMI_SHORT_NAME_MAX_SIZE;
> +	}
> +
> +	/* Count timestamped DEs */
> +	ti->num_des_tstamp += !!tde->de.tstamp_support;
> +
> +	*rx_len -= payld_sz;
> +
> +	return 0;
> +}
> +
> +static int iter_de_descr_process_response(const struct scmi_protocol_handle *ph,
> +					  const void *response,
> +					  struct scmi_iterator_state *st,
> +					  void *priv)
> +{
> +	struct scmi_tlm_de_priv *p = priv;
> +	struct telemetry_info *ti = p->ti;
> +	const struct scmi_de_desc *desc = p->next;
> +	struct telemetry_de *tde;
> +	bool discovered = false;
> +	unsigned int de_id;
> +	int ret;
> +
> +	de_id = le32_to_cpu(desc->de_id);
> +	/* Check if this DE has already been discovered by other means... */

Maybe mention what 'other means?' as not locally obvious.

> +	tde = scmi_telemetry_tde_lookup(ti, de_id);
> +	if (!tde) {
> +		/* Create a new one */
> +		tde = scmi_telemetry_tde_get(ti, de_id);
> +		if (IS_ERR(tde))
> +			return PTR_ERR(tde);
> +
> +		discovered = true;
> +	}
> +
> +	guard(mutex)(&tde->mtx);
> +	if (tde->enumerated) {
> +		/* Cannot be a duplicate of a DE already created by enumeration */
> +		dev_err(ph->dev,
> +			"Discovered INVALID DE with DUPLICATED ID:0x%08X\n",
> +			de_id);
> +		return -EINVAL;
> +	}
> +
> +	ret = scmi_telemetry_de_descriptor_parse(ti, tde, &p->next, &p->rx_len);
> +	if (ret) {
> +		dev_err(ph->dev, "Malformed DE Descriptor - ret:%d\n", ret);
> +		/* DE not enumerated at this point were created in this call */
> +		if (discovered)
> +			scmi_telemetry_free_tde_put(ti, tde);
> +		return ret;
> +	}
> +
> +	/* Now fully enumerated */
> +	tde->enumerated = true;
> +
> +	if (discovered) {
> +		/* Register if it was not already ... */
I guess this comment is really about the whole block including
if (discovered) (for the if not already part.

If so move the comment outside the if.

> +		ret = scmi_telemetry_tde_register(ti, tde);
> +		if (ret) {
> +			/* DE not enumerated at this point were created in this call */
> +			scmi_telemetry_free_tde_put(ti, tde);
> +			return ret;
> +		}
> +	}
> +
> +	/* Add to FastChannels list */
> +	if (tde->de.fc_support)
> +		list_add(&tde->item, &ti->fcs_des);
> +
> +	return 0;
> +}

>  
> +/**
> + * scmi_telemetry_resources_alloc  - Resources allocation
> + * @ti: A reference to the telemetry info descriptor for this instance
> + *
> + * This allocates and initializes dedicated resources for the maximum possible
> + * number of needed telemetry resources, based on information gathered from
> + * the initial enumeration: these allocations represent an upper bound on
> + * the number of discoverable telemetry resources and they will be later
> + * populated during late deferred further discovery phases.

This could do with some comments to give us a hint why it needs
to be allocated in so many different allocations.

> + *
> + * Return: 0 on Success, errno otherwise
> + */
> +static int scmi_telemetry_resources_alloc(struct telemetry_info *ti)
> +{
> +	/* Array to hold pointers to discovered DEs */
> +	struct scmi_telemetry_de **des __free(kfree) =
> +		kzalloc_objs(*des, ti->info.base.num_des);
> +	if (!des)
> +		return -ENOMEM;
> +
> +	/* The allocated DE descriptors */
> +	struct telemetry_de *tdes __free(kfree) =
> +		kzalloc_objs(*tdes, ti->info.base.num_des);
> +	if (!tdes)
> +		return -ENOMEM;
> +
> +	/* Allocate a set of contiguous DE info descriptors. */

Why do we care that they are contiguous?  That might be the case
but if it isn't important then don't bother mentioning it.
If it does matter, then say why. I think it's not needed
until patch 28 and that's a long way for a reviewer to look!

> +	struct scmi_telemetry_de_info *dei_store __free(kfree) =
> +		kzalloc_objs(*dei_store, ti->info.base.num_des);
> +	if (!dei_store)
> +		return -ENOMEM;
> +
> +	struct scmi_telemetry_res_info *rinfo __free(kfree) =
> +		kzalloc_obj(*rinfo);
> +	if (!rinfo)
> +		return -ENOMEM;
> +
> +	mutex_init(&ti->free_mtx);
> +	INIT_LIST_HEAD(&ti->free_des);
> +	for (int i = 0; i < ti->info.base.num_des; i++) {
> +		mutex_init(&tdes[i].mtx);
> +		guard(mutex)(&tdes[i].mtx);
> +
> +		/* Bind contiguous DE info structures */
> +		tdes[i].de.info = &dei_store[i];
> +		scmi_telemetry_free_tde_put(ti, &tdes[i]);

Does this call actually do anything other than take
some locks to zero stuff that is already zero?

> +	}
> +
> +	INIT_LIST_HEAD(&ti->fcs_des);
> +
> +	ti->tdes = no_free_ptr(tdes);
> +
> +	rinfo->des = no_free_ptr(des);
> +	rinfo->dei_store = no_free_ptr(dei_store);
> +
> +	/* Ensure all of the above assignments are visible */
> +	smp_store_release(&ti->rinfo, no_free_ptr(rinfo));
> +
> +	return 0;
> +}

> +static void scmi_telemetry_instance_cleanup(void *arg)
> +{
> +	struct telemetry_info *ti = arg;
> +
> +	scmi_telemetry_tdes_cleanup(ti);
> +	scmi_telemetry_resources_free(ti);
> +}
> +
> +/**
> + * scmi_telemetry_resources_enumerate  - Enumeration helper
> + * @ti: A reference to the telemetry info descriptor for this instance
> + *
> + * This helper is configured to be called once on the first enumeration
> + * attempt, when triggered by invoking ti->res_get() from somewhere else.
> + *
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
> +	struct device *dev = ti->ph->dev;
> +	int ret;
> +
> +	/*
> +	 * Ensure the following initialization can be called only once
> +	 * from one thread of execution.
> +	 */
> +	if (atomic_cmpxchg(&ti->rinfo_initializing, 0, 1)) {
> +		/*
> +		 * When initialization is already ongoing in another thread,
> +		 * just wait for its completion and return the fully or partially
> +		 * populated rinfo.
> +		 */
> +		if (!completion_done(&ti->rinfo_initdone))
> +			wait_for_completion(&ti->rinfo_initdone);
> +
> +		/* Ensure rinfo descriptor is visible */
> +		return smp_load_acquire(&ti->rinfo);
> +	}
> +
> +	/* Note that this code below can be run only once by one thread */
> +	ret = scmi_telemetry_de_descriptors_get(ti);
> +	if (ret) {
> +		dev_err(dev, FW_BUG "Cannot fully enumerate DEs resources. Degraded system.\n");
> +		goto done;
> +	}
> +
> +	ti->rinfo->fully_enumerated = true;
> +done:
> +	/* Disable initialization permanently */
> +	smp_store_release(&ti->res_get, __scmi_telemetry_resources_get);
> +
> +	/* Unblock concurrent threads that have been stalled */
> +	complete_all(&ti->rinfo_initdone);
> +
> +	/* Ensure local rinfo is visible before returning it */
> +	smp_mb();
> +	return ti->rinfo;
> +}
> +
> +/**
> + * scmi_telemetry_instance_init  - Instance initializer
> + * @ti: A reference to the telemetry info descriptor for this instance
> + *
> + * Note that this allocates and initialize all the resources possibly needed
> + * and then setups the @scmi_telemetry_resources_enumerate helper as the
> + * default method for the first call to ti->res_get(): this mechanism enables
> + * the possibility of optionally implementing deferred enumeration policies
> + * which optionally delay the discovery phase and related SCMI message exchanges
> + * to a later point in time.
> + *
> + * Return: 0 on Success, errno otherwise
> + */
> +static int scmi_telemetry_instance_init(struct telemetry_info *ti)
> +{
> +	int ret;
> +
> +	/* Allocate and Initialize on first call... */

That comment made me think that this was a singleton in that
if you called it a second time it would fail. Seems that it just
allocates whenever it is called (which happens to be once) so
I'd drop the comment as adding confusion rather than clarity.

> +	ret = scmi_telemetry_resources_alloc(ti);
> +	if (ret)
> +		return ret;
> +
> +	xa_init(&ti->xa_des);
> +
> +	/* Setup resources lazy initialization */
> +	atomic_set(&ti->rinfo_initializing, 0);
> +	init_completion(&ti->rinfo_initdone);
> +	/* Ensure the new res_get() operation is visible after this point */
> +	smp_store_mb(ti->res_get, scmi_telemetry_resources_enumerate);
> +
> +	return devm_add_action_or_reset(ti->ph->dev,
> +					scmi_telemetry_instance_cleanup, ti);

If you can make it more obvious what this is matching against in the above function
that would be good. Normally that is done by putting the setup and tear down
next to each other.

Might be better to split it into two callbacks so that you can couple
resources_free with resource_alloc above then the other bit with whatever
that is unwinding.


> +}

> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index 121c83e1c6d8..018427daf55f 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -13,6 +13,7 @@
>  #include <linux/device.h>
>  #include <linux/notifier.h>
>  #include <linux/types.h>
> +#include <linux/uuid.h>
>  
>  #define SCMI_MAX_STR_SIZE		64
>  #define SCMI_SHORT_NAME_MAX_SIZE	16
> @@ -825,6 +826,37 @@ struct scmi_pinctrl_proto_ops {
>  	int (*pin_free)(const struct scmi_protocol_handle *ph, u32 pin);
>  };
>  
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

I'd be tempted to put the pointer first though perhaps
it is acting as a separator for the bools?  If so I'd
use a comment instead.

> +	bool enabled;
> +	bool tstamp_enabled;
> +};
> +
> +struct scmi_telemetry_res_info {
> +	bool fully_enumerated;
> +	unsigned int num_des;
> +	struct scmi_telemetry_de **des;
> +	struct scmi_telemetry_de_info *dei_store;
> +};
> +
>  struct scmi_telemetry_base_info {
>  	unsigned int version;
>  	uuid_t primary_revision;
> @@ -848,10 +880,16 @@ struct scmi_telemetry_info {
>   *	by SCMI Telemetry Protocol
>   *
>   * @info_get: get the general Telemetry information.
> + * @de_lookup: get a specific DE descriptor from the DE id.
> + * @res_get: get a reference to the Telemetry resources descriptor.
>   */
>  struct scmi_telemetry_proto_ops {
>  	const struct scmi_telemetry_info __must_check *(*info_get)
>  		(const struct scmi_protocol_handle *ph);
> +	const struct scmi_telemetry_de __must_check *(*de_lookup)
> +		(const struct scmi_protocol_handle *ph, u32 id);
> +	const struct scmi_telemetry_res_info __must_check *(*res_get)
> +		(const struct scmi_protocol_handle *ph);

Similar to previous. I'm not seeing the value in the __must_check
markings.  They make sense when the return value isn't the data
just asked for which one would assume would always be used.

>  };
>  
>  /**

