Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794341255;
	b=jx55CyNpDGIn8QtqEOEBQ+phAa+bU455SxZBa3wH7lduDUEbpv5aaXHQMPkARM7/+/yK
	 OEmcyqWwsJ0+iCgvOMlDDaTAE5n8V2Iv0XzG1T1YFNSbRKbPJbxr8JLI+kTcbRkW3lVqK
	 Wbwwftn1wVgkqNBwjLKCjVIjBEXfraxQFvxOboOvgJq8t7A3rJArmnE/Z9QDhML8MmpA6
	 +2NNcD/Vcj1QzAKCEwXLp9cUha4NF3njT/NmibWCCokmqSVV/E6Hwb2Jq4NxjeE29HJQv
	 0xRIubrl8S1vCCqxvHeemhGgz49jn3Spy8DuUlpmwgzW7w1GGLtif3rXKYHUL8mE2Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794341255;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mPIzV8gKEEjQbLFg3pcsAJeVEQeLM6Xyl87XSN+E9gA=;
	b=cel5+GJsesEQS/PRD7EH0Ha2PPP5PgjmpYuGiAOYIqZfvRGNPm54VmVmdUf8C5adIVzh
	 ERE2VnOhLfEoyZgOdDBpQyFLzFoJWLUaXS+zfH2B+UXK6TiH4YXzz0PuXyESIrV4Y8zr4
	 H1mAns2oPbbMArL+8Q5vdFCdPLUwlGAhVydUoHXqgYPMP2Z/6I6zevPw7AxD9Z8ZAMark
	 bzCNXWgiTuwp+0bg8Bcg91bUizoGzx9UqILY7vEeSzursHM/Zk5Z8jRsefLew8Fxs9CcF
	 kA/Wkam1nCWTLQnS403Hq7pHtBQgD0Xc04Dpc5cF0WTLzqTZbhU0uD6jy1cPdK4/baw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IXgKbapi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="GqRr/cgb";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4A9606A32A
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 20:07:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B4A9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IXgKbapi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GqRr/cgb
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAIoYH33264602
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 20:07:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mPIzV8gKEEjQbLFg3pcsAJeVEQeLM6Xyl87XSN+E9gA=; b=IXgKbapiZZ6s9GV3
	f+Bbv8kIcfs5lVMVFbopNN4iJDqT2XbREw6RDUpC1phcUUy2GkmU2OreXm1D/K61
	JaMPL5GiahOQ/0j5tGbdTHrnpuLowlvVBuL9l3daJA3qIq4IFTS+sLu2/c2TSjnr
	iygrfFCZBsIXPSBCVKrLH3orC6+A/Qra0/hzWN/RYd3uLu6uCCjA/kA+fgubIYRF
	E0WmPDJz8P3od9GbmUhjrFSGO8mzoD45TzN6RP5Q9Tnf0nSSuJJkDEKQ+szfoIkD
	FZ0rlrWxPAj1O/uCVDMqYL3t1ygtz2pZIgyOVGqkppjbteNkQvztmzriwWFwnEht
	Pj8CXQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyw4apg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 20:07:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-370230d93efso4601539eec.1
        for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 12:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794341254; x=1794946054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mPIzV8gKEEjQbLFg3pcsAJeVEQeLM6Xyl87XSN+E9gA=;
        b=GqRr/cgbYsAZYscSBX7ZlDSypRFxSDfc7HU6jtmZv8xXeFq9rfHVinoHIi4z9aOivs
         Dy1crV/y8an8uKJxCOQiByk0RYSKYTsjQgF6LDfBJJzMqMYNrZAddUwCSlE5ejQ6PO3R
         2dbTUh4JMCMSMZMsRen9jCz6H8dqpVeowcqkHHHl880plft5KfIlaJk/rar32+Qifz4F
         3g9D1jney/PHABk2lrbRRGYBO+PI9mt0mrOhkJ3XPpev+cxEPt82WwErENsXYmxH4m/U
         qVKnxbM90pURRHszTKvCrnknCNjzIcugBGRe45vWHNfTauf+TJ52iz3xF0BEg1mI8wca
         X/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794341254; x=1794946054;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mPIzV8gKEEjQbLFg3pcsAJeVEQeLM6Xyl87XSN+E9gA=;
        b=BTrUUcR7FETyDskXFMIVo/LsdaSxmtoVdhqV8X9VnKG7D9e90GRvE2qNTgN2VuWeCe
         hgmK9Nss74qkycev/Kzt81k75vPmGS3LrYZ0lc4usbONolyvgfOMGkzaHMqYp3NcQo4A
         3itGwYB8LjOTOufbDEMouTgjP9OL6eF/z7DImBSWFcbxVFlipZMRKrIjKl2wTrkcExnH
         tnn6k+Uy24mQdcaTIPQvFHnup3jKXmn6wk08au4CNslcHwRxBgtExEj+p00vpLzsgG4n
         cyNT/66WRMhF4BfDZ2FYzpwGpuAuSujA90dHV9LYkjIibb/oc0cOE3AH6eqxDWYkn9SW
         //Mg==
X-Forwarded-Encrypted: i=1; AL+hErFs78gPqc7WvuYqVFmedfdzxkxFap2pjpMMFxlv1Pb72Ewn0plLGtNn2mwQFbSr1667PJ376DRd0Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z8LbYoKICdLrpbhb8nTY7fzPuvbYobK/5Xl3xeogXfXyO2Bycli
	1bILLHt/1RKZ3so9uDChZEnIvZ3lJWafA+mthGx201lTqtxir45DS0f9L4BVkS9SDXMWAcpPcaM
	8VFfcnPb0i+QDI4WtrWhtCX1+iUyVazvyUkG3LO/QxjFl6APQmYTw1hmMzEZzBA==
X-Gm-Gg: AYBFou0aIh71vN1qN6z/0yEWiYiktEeM0XnUEyBkM+SmuvMVeS/esN7sZmvcZnmmoYy
	Sn1eH1Ps5V4xyZV2a0gDacMEnrTOirZQNliISnIFEuNMsq6ZfkM0d84Nse02nzoBUOq5hmG3pCS
	NtfNE0Htf1Ofn3pyRpXJcwpUtbx9YmAVTGirn0lsh3vRKpjw2b1Rcd088PeJnlarCPNfWXzmXFi
	tu+WDn1RfLG7StWgX5qyZTMysTEqCV7eW/AV4/WnbDrQjNASQ8BBTk3XdmI6FkgzYvGcdnALYQo
	Vd2rFbRzMqbQmGUVX2pzagzD8GexN11NJ7XUnyj/r8TZj9IYrv6yznr2YAa24DnyWLx3/Mz6Of+
	FKhKZoSj8G97hCF6DkJWB7udutoRLPZg/dGfV2+VVID2/d6AAOsnZfZTSv4Ez/rFPdqfBG/pksV
	7EurRs6q3UE9YGnk8sH0Xx51RqTTkh
X-Received: by 2002:a05:701b:4588:10b0:1b3:2692:2274 with SMTP id a92af1059eb24-1b3b618d57cmr4809349c88.40.1794341253377;
        Tue, 10 Nov 2026 12:07:33 -0800 (PST)
X-Received: by 2002:a05:701b:4588:10b0:1b3:2692:2274 with SMTP id a92af1059eb24-1b3b618d57cmr4809283c88.40.1794341252580;
        Tue, 10 Nov 2026 12:07:32 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3766146551asm1260936eec.1.2026.11.10.12.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 12:07:32 -0800 (PST)
Date: Tue, 10 Nov 2026 12:07:08 -0800
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
Subject: Re: [PATCH v15 17/35] firmware: arm_scmi: Add Telemetry
 configuration operations
Message-ID: <20261110120708.000059b4@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-18-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-18-cristian.marussi@arm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA4MCBTYWx0ZWRfX4s20HkSCXWT1
 8AhCZooQh+63MvBzzEbU0roBri/lQQ4Uc+loj6l4LZ+jC/e7iIEHS5mmz1GDL2gqEUgmgDifF+7
 oGwG1QLAB/OOHfajQLst/2LwaWDer8H5xJoUZFr8gxFOIK6wrWbhLvYc1Qi8w33LODpIlxJRFLs
 gWCtxcQjbP599caH39HNZtotov4fmKlerqRjlutoHBT4O8efgplvEz/h60j7KwaR2lYb1zYJQ/0
 TaP01nAf5yl1dPOAi8ff3EeIgDk9yX7XO206gEPVLzu2GC7sJvrRev0+cw7847x/ts7oyUfp9R7
 PtkLyBIYiR1wC37fnS1AlCiRNLUDtVKWCyyE1MV/bGLG+avcS7bQpXYWCz6tHzBu0N+kZ9fM2uC
 YpVfWccrFxUFAk7cWX+zKcvGEwi/ujOYfBAqnzCL3VPBHZUvXYwl0JofqYIB8DXPVyAFG0Dg+kc
 aiVSx4aaKIXhEo0X09w==
X-Authority-Analysis: v=2.4 cv=Ee1d0/mC c=1 sm=1 tr=0 ts=6af37986 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=7CQSdrXTAAAA:8 a=C_PHm6f9Ewz0PqJoia8A:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA4MCBTYWx0ZWRfXyKFvrrHBDAQG
 mX70X5xoccQxVVGkO1YFqyqucUtHT42zUnlG+rXmNoV+rAIVB2Z5LpTRJpcmyoATCKdl8ONpByj
 9pnG69s/1UxGPDT5Q/rhbF3JJ7m3pus=
X-Proofpoint-GUID: ttAlvj25pHAvJWIT721cx771BcnqDIHt
X-Proofpoint-ORIG-GUID: ttAlvj25pHAvJWIT721cx771BcnqDIHt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100080

On Mon,  9 Nov 2026 09:12:03 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add support for basic Telemetry configuration operations to selectively
> enable or disable DataEvents monitoring.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
Various comments inline.  Includes a suggestion that some
__iomem pointer specific overflow checkers might make for
neater code here and in earlier patches.

> +
> +struct scmi_msg_telemetry_config_set {
> +	__le32 group_identifier;
> +	__le32 control;
> +#define TELEMETRY_ENABLE		(BIT(0))
> +#define TELEMETRY_MODE			GENMASK(4, 1)
> +#define TELEMETRY_MODE_SET(x)		(FIELD_PREP(TELEMETRY_MODE, (x)))
> +#define	TLM_ONDEMAND			(0)
> +#define	TLM_NOTIFS			(1)
> +#define	TLM_SINGLE			(2)
> +#define TELEMETRY_MODE_ONDEMAND		TELEMETRY_MODE_SET(TLM_ONDEMAND)
> +#define TELEMETRY_MODE_NOTIFS		TELEMETRY_MODE_SET(TLM_NOTIFS)
> +#define TELEMETRY_MODE_SINGLE		TELEMETRY_MODE_SET(TLM_SINGLE)

I'd just put the FIELD_PREP inline. It is self explanatory on only a char or
two longer..

> +
> +#define TLM_ORPHANS			(0)
> +#define TLM_GROUP			(1)
> +#define TLM_ALL				(2)
> +#define TELEMETRY_SET_SELECTOR(x)	(FIELD_PREP(GENMASK(8, 5), (x)))
> +#define	TELEMETRY_SET_SELECTOR_ORPHANS	TELEMETRY_SET_SELECTOR(TLM_ORPHANS)
> +#define	TELEMETRY_SET_SELECTOR_GROUP	TELEMETRY_SET_SELECTOR(TLM_GROUP)
> +#define	TELEMETRY_SET_SELECTOR_ALL	TELEMETRY_SET_SELECTOR(TLM_ALL)
> +	__le32 sampling_rate;
> +};



> +
> +static struct payload __iomem *
> +scmi_telemetry_blkts_payld_locate(struct device *dev,
> +				  struct telemetry_shmti *shmti, u32 *bts_offs,
> +				  struct payload __iomem *payld, u32 de_id)
> +{
> +	struct payload __iomem *bts_payld = NULL;
> +
> +	if (!bts_offs)
> +		return IOMEM_ERR_PTR(-EINVAL);
> +
> +	if (*bts_offs &&
> +	    check_add_overflow((__force unsigned long)shmti->base, *bts_offs,
> +			       (__force unsigned long *)&bts_payld))

This code has quit a lot of checks on pointer overflow and many need
some ugly casts. Maybe we can have some local helpers for this?

bool check_add_overflow_iomemptr(void __iomem* start, size_t off, void __iomem **out)
{
	unsigned long _start, _out;
	bool overflow;

	_start = (__force unsigned long)start;
	overflow = check_add_overflow(_start, off, &_out);
	*out = (__force void __iomem *)_out;

	return overflow;
}

or something like that?

> +		return IOMEM_ERR_PTR(-EPROTO);
> +
> +	/* Check SHMTI overflow on returned offset */
> +	if (bts_payld) {
> +		if (scmi_telemetry_shmti_overflow(shmti, bts_payld)) {
> +			trace_scmi_tlm_access(de_id, "SHMTI_OVERFLOW", 0, 0);
> +			return IOMEM_ERR_PTR(-EINVAL);
> +		}
> +	} else {
> +		dev_warn_once(dev, "Received BLK_TS with zero offset.\n");
> +		trace_scmi_tlm_access(de_id, "BLKTS_WITH_ZERO_OFFSET", 0, 0);
> +
> +		/*
> +		 * Find the BLK_TS immediately preceding this DE payld by
> +		 * scanning.
> +		 */
> +		bts_payld = scmi_telemetry_nearest_line_by_type(shmti, payld,
> +								TDCF_BLK_TS_LINE);
> +		if (WARN_ON(!bts_payld))
> +			return IOMEM_ERR_PTR(-EPROTO);
> +
> +		/* Calculate offset of found blkts */
> +		*bts_offs = (void __iomem *)bts_payld - shmti->base;
> +	}
> +
> +	return bts_payld;
> +}

>
> +
> +static int scmi_telemetry_group_state_set(const struct scmi_protocol_handle *ph,
> +					  const bool *enable, const bool *tstamp,
> +					  struct scmi_telemetry_group *grp)
> +{
> +	struct scmi_msg_resp_telemetry_de_configure *resp;
> +	struct telemetry_info *ti = ph->get_priv(ph);
> +	struct scmi_msg_telemetry_de_configure *msg;
> +	struct scmi_xfer *t;
> +	int ret;
> +
> +	/* Stall concurrent configuration request */
> +	guard(mutex)(&ti->config_mtx);
> +
> +	if (!scmi_telemetry_remote_state_update_needed(ti, enable, &grp->enabled,
> +						       tstamp, &grp->tstamp_enabled,
> +						       true, grp))
> +		return 0;
> +
> +	ret = ph->xops->xfer_get_init(ph, TELEMETRY_DE_CONFIGURE,
> +				      sizeof(*msg), sizeof(*resp), &t);
> +	if (ret)
> +		return ret;
> +
> +	msg = t->tx.buf;
> +	scmi_telemetry_state_message_prepare(msg, grp->info->grp_id, true,
> +					     enable, &grp->enabled,
> +					     tstamp, &grp->tstamp_enabled);
> +	resp = t->rx.buf;
> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret) {

So this is doing the out of line good path just to keep the ability to use
guard. I'd be tempted to not use guard() or use a wrapper function
just for that.  guard() magic is lovely but only until it makes us
write harder to read code.  The challenge here is we can't easily
do __free magic for the xfer.

> +		/*
> +		 * Update cached state on command success anyway, despite any
> +		 * possible later response validation issue: once the command
> +		 * has succedeed keep our state in sync with HW.
> +		 */
> +		scmi_telemetry_state_cache_update(ti, enable, &grp->enabled,
> +						  tstamp, &grp->tstamp_enabled,
> +						  grp, NULL);
> +		ret = scmi_telemetry_group_state_set_resp_process(ti, grp, resp);
> +		if (ret)
> +			dev_err(ph->dev,
> +				"Could NOT process GROUP %u state response - ret:%d\n",
> +				grp->info->grp_id, ret);
> +	}
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}
> +
> +static int scmi_telemetry_state_get(const struct scmi_protocol_handle *ph,
> +				    const u32 *id, bool *enabled, bool *tstamp_enabled,
> +				    u32 *sid, u32 *offset, uuid_t  *uuid)

bonus space before *uuid.

> +{
> +	struct telemetry_info *ti = ph->get_priv(ph);
> +	struct scmi_telemetry_de *de;
> +	struct telemetry_de *tde;
> +
> +	if (!enabled || !tstamp_enabled)
> +		return -EINVAL;
> +
> +	ti->res_get(ti);
> +	if (!id) {
> +		guard(mutex)(&ti->des_enabled_mtx);
> +		/* Returning the all_des_* state */
> +		*enabled =
> +			(atomic_read(&ti->des_enabled[ENA_STATE]) == ti->info.base.num_des);
> +		*tstamp_enabled =
> +			(atomic_read(&ti->des_enabled[ENA_TSTAMP]) == ti->num_des_tstamp);

Ah.  These are reference counters. I had misunderstood that earlier.

I'd add some docs for this function though as isn't immediately obvious what
should be returned if these don't match.

> +
> +		return 0;
> +	}
> +
> +	de = xa_load(&ti->xa_des, *id);
> +	if (!de)
> +		return -ENODEV;
> +
> +	tde = to_tde(de);
> +	guard(mutex)(&tde->mtx);
> +
> +	*enabled = de->enabled;
> +	*tstamp_enabled = de->tstamp_enabled;
> +
> +	scmi_telemetry_tde_location_update(tde, sid, offset, uuid);
> +
> +	return 0;
> +}
> +
> +static int scmi_telemetry_state_set(const struct scmi_protocol_handle *ph,
> +				    bool is_group, u32 id, const bool *enable,
> +				    const bool *tstamp, u32 *sid, u32 *offset,
> +				    uuid_t *uuid)
> +{
> +	struct telemetry_info *ti = ph->get_priv(ph);
> +	struct scmi_telemetry_res_info *rinfo;
> +
> +	rinfo = ti->res_get(ti);
> +	if (!is_group) {
> +		struct scmi_telemetry_de *de;
> +
> +		de = xa_load(&ti->xa_des, id);
> +		if (!de)
> +			return -ENODEV;
> +
> +		/* Filter out unplausible timestamp requests */

Rather than error out if we get one? That sounds fragile.

> +		return scmi_telemetry_tde_state_set(ph, enable,
> +						    de->tstamp_support ? tstamp : NULL,
> +						    de, sid, offset, uuid);
> +	} else {
> +		struct scmi_telemetry_group *grp;
> +
> +		if (id >= rinfo->num_groups)
> +			return -EINVAL;
> +
> +		grp = &rinfo->grps[id];
> +		return scmi_telemetry_group_state_set(ph, enable, tstamp, grp);
> +	}
> +}
> +
> +static int
> +scmi_telemetry_collection_configure(const struct scmi_protocol_handle *ph,
> +				    unsigned int res_id, const bool *enable,
> +				    const unsigned int *update_interval_ms,
> +				    const enum scmi_telemetry_collection *mode)
> +{
> +	enum scmi_telemetry_collection *current_mode, next_mode;
> +	struct telemetry_info *ti = ph->get_priv(ph);
> +	struct scmi_msg_telemetry_config_set *msg;
> +	bool tlm_enable, *current_state, is_group;
> +	struct scmi_telemetry_res_info *rinfo;
> +	unsigned int *active_update_interval;
> +	struct scmi_xfer *t;
> +	__le32 interval;
> +	u32 control;
> +	int ret;
> +
> +	/* Stall concurrent configuration request */
> +	guard(mutex)(&ti->config_mtx);
> +
> +	if (mode && (*mode <= SCMI_TLM_SINGLE_READ) &&

This first line checks if mode is in range of allowed values. 
When would it not be?  Feels like a confusing thing to check here
as either of the next two conditions required it to be specific
values that meet that requirement. Was that meant to be an out
of range check?

> +	    ((*mode == SCMI_TLM_NOTIFICATION && !ti->info.continuous_update_support) ||
> +	     (*mode == SCMI_TLM_SINGLE_READ && !ti->info.single_read_support)))
> +		return -EINVAL;
> +
> +	is_group = res_id != SCMI_TLM_GRP_INVALID;
> +	if (is_group) {
> +		rinfo = ti->res_get(ti);
> +
> +		if (res_id >= rinfo->num_groups ||
> +		    !ti->info.per_group_config_support)
> +			return -EINVAL;
> +	}
> +
> +	if (!is_group) {

Maybe this makes sense in later patches, but for now, it looks like
you can just flip this condition and combine the else below iwth the
if (is_group) just above. That is...

	if (is_group) {
		rinfo = ti->res_get(ti);

		if (res_id >= rinfo->num_groups ||
		    !ti->info.per_group_config_support)
			return -EINVAL;

		active_update_interval = &rinfo->grps[res_id].active_update_interval;
		current_mode = &rinfo->grps[res_id].current_mode;
		current_state = &rinfo->grps[res_id].enabled;
	} else {
		active_update_interval = &ti->info.active_update_interval;
		current_mode = &ti->info.current_mode;
		current_state = &ti->info.enabled;
	}

> +		active_update_interval = &ti->info.active_update_interval;
> +		current_mode = &ti->info.current_mode;
> +		current_state = &ti->info.enabled;
> +	} else {
> +		active_update_interval =
> +			&rinfo->grps[res_id].active_update_interval;
> +		current_mode = &rinfo->grps[res_id].current_mode;
> +		current_state = &rinfo->grps[res_id].enabled;
> +	}
> +
> +	if (!enable && !update_interval_ms && (!mode || *mode == *current_mode))
> +		return 0;
> +
> +	ret = ph->xops->xfer_get_init(ph, TELEMETRY_CONFIG_SET,
> +				      sizeof(*msg), 0, &t);
> +	if (ret)
> +		return ret;
> +
> +	if (!update_interval_ms)

Flip logic then it's visually obvious that if you have it you
use the passed in active_interval_ms

> +		interval = cpu_to_le32(*active_update_interval);
> +	else
> +		interval = cpu_to_le32(*update_interval_ms);
> +
> +	tlm_enable = enable ? *enable : *current_state;
> +	next_mode = mode ? *mode : *current_mode;
> +
> +	msg = t->tx.buf;
> +	msg->group_identifier = cpu_to_le32(res_id);
> +	control = tlm_enable ? TELEMETRY_ENABLE : 0;
> +	control |= !is_group ? TELEMETRY_SET_SELECTOR_ALL : TELEMETRY_SET_SELECTOR_GROUP;
> +	control |= TELEMETRY_MODE_SET(next_mode);

	control = FIELD_PREP(TELEMETRY_ENABLE, tlm_emable ? 1 : 0) |
		  FIELD_PREP(TELEMETRY_SET_SELECTOR, TLM_SET_SELECTOR_ALL) |
		  FIELD_PREP(TELMETRY_MODE_SET, next_mode);

With adjusted defines is clearer to read than via the defines at the top of
file.  I'm never sure why people feel like wrappers around FIELD_PREP make
things more readable - I want to see that this is building a register value
and what goes in what named field.  The macros like TELEMETRY_SET_SELECTOR()
obscure that.

> +	msg->control = cpu_to_le32(control);
> +	msg->sampling_rate = interval;
> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret) {
I'd do
	if (ret) {
		ph->xops->xfer_put(ph, t);
		return ret;
	}

Even though it duplicates that unwind, I think it is worth it
to avoid out of line good paths.  Or just don't use guard and use
a goto.



> +		*current_mode = next_mode;
> +		*current_state = tlm_enable;
> +		/*
> +		 * Enable streaming mode when notifications were explicitly
> +		 * requested as a global config, not on a group.
> +		 */
> +		if (!is_group)
> +			ti->streaming_mode = *current_mode == SCMI_TLM_NOTIFICATION;
> +		if (update_interval_ms)
> +			*active_update_interval = le32_to_cpu(interval);
> +	}
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}

> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index 3973779c0aba..ce35734d2249 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -888,6 +888,12 @@ enum scmi_telemetry_compo_type {
>  #define SCMI_TLM_BUILD_UPDATE_INTERVAL(s, e)				    \
>  	(FIELD_PREP(GENMASK(20, 5), (s)) | FIELD_PREP(GENMASK(4, 0), (e)))
>  
> +enum scmi_telemetry_collection {
> +	SCMI_TLM_ONDEMAND,
> +	SCMI_TLM_NOTIFICATION,
> +	SCMI_TLM_SINGLE_READ,

Given these are called out a 0 1 2 in the spec I'd assign the
values to them just to make that association clear. 

> +};

