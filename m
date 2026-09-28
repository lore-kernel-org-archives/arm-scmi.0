Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07B24F55DB
	for <arm-scmi@vger.kernel.org>; Mon, 28 Sep 2026 20:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790625707; cv=none; b=sDuYJn4d+3kBzJlnVfb9KXcNF90KVW/E13PBQX287KIj1XTxMdlapVvLKEfW4xGdo9gV3+MF1HU9qUhORfxH38RMkcthtk7EWwgTUHmphUQ0C+sGqOY4OPayQvLyw6KA4PudscrGqBf/d59L6cykPqZBYCXzmJsivOh0xKRmcsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790625707; c=relaxed/simple;
	bh=/iK+STxrFlQQCAsY8BhsBiYT3WXI9RE0dOvUPbfQDXc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NjUAHYEeRqObUck7quNLfVrlL5bIeRQMhRYL6CdHgUshDofEKpY1kcxN1wPQ8oeXw+XNFK7tlBCPVoX360qGwRkT/7vwIG+2H4ZktYh3cb+yCEaLRLI26uidpXH+b06mIVn+vT9cSTePpFRzzQ7GhiRClq2VjrEdLyFaBpXH+hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dqT3ZFDL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xjzogef/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dqT3ZFDL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xjzogef/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SHvucW819658
	for <arm-scmi@vger.kernel.org>; Mon, 28 Sep 2026 20:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4RrUHKFuaKv8UnQW6/pIsa4+BcMquRH/ZnAhiAYW2TM=; b=dqT3ZFDLDR68Ysen
	Vc6WeweuzfzZdUlbgDW2RG4LDJmGwnuF0PuLUiqJrCYO2VpOac7sdRmvgBRVLpF9
	Czk3840b3FCXiWmOa0Qbn3M9mG/JXrueWS9Et23ow0DC+D3xKMCO76ubIF+zTvL+
	7EBSeU7J8JG6a+Mws7LVvzItrjSFUm+K54fHQLwKGjf5Em8aR90PE6dBdWz3Dhx0
	FE/MpqUH1fyUAvBE2M+ynHjzlc/nPtI89stX3tqxW2Bkx+UultetHckMdOr3ph28
	E6twKnht6mhdsNOcbq/8Gt7OQN+81txPXzs/NP8VqC9NRxb8mScpgdcmlALWHmN7
	ycLdnQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyqx3a1xd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Mon, 28 Sep 2026 20:01:43 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3441e2b3fc3so2163133eec.1
        for <arm-scmi@vger.kernel.org>; Mon, 28 Sep 2026 13:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790625703; x=1791230503; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4RrUHKFuaKv8UnQW6/pIsa4+BcMquRH/ZnAhiAYW2TM=;
        b=Xjzogef/P85438lRtBbo9liY6ALsUZtbD4C7pbjA6NRSSvC2l3Kv4Gwe7CqK1n194x
         fhhGV7b3DuomvCWtzpEJ2UCrbID0rz8LaqaGeH9uzWXNJB6mScPdB3QCjaSHVECmWvUY
         iKsHfwuVAmlV0MWiql78ubsX2sGDddUvD3Mt3za906oAWDCSRKkbe7qwz18aiC1a9u+D
         901AF7KcznpJma63OOy7totGJeiwfADIZ03SehaBLlo2dgrf5ZYnrH3d6j3v85LCDtzb
         +SkO/laHVqO4gW2+N3ogSTujkQb+cHb6QaP9i2bvszAliNGfU/0ORln7rZoUQw76TqKC
         mGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790625703; x=1791230503;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4RrUHKFuaKv8UnQW6/pIsa4+BcMquRH/ZnAhiAYW2TM=;
        b=n/n8Rb1q++Zr3PjTXfxVg7T9Zf4e5xy+GF/WJRfez7D9l42BR+ONsD8TIxmLv6uFuD
         loebLFLTOtNYLrde4u4IxeBkzgv6/1+bJqoVV4AjmQqUlYfs2n5GeqZ6x5S7n3ozFfyF
         25RJc0s8q6jiOipPNvH0H08RcVOkn3igGpBc3ujptMA8vJ7AHyhhSsN2LW4vtjq0r/29
         5zKwFI9jRQrVyjfGNUUbteOfqlHpFYSTm8MygblmZCFy4JgF5R6f0uAYtp6gtalqOVK+
         CT66GXXBi7TM4aCGGxF9CCRknY8xNf72us69eH+l7/2on42E5WDwsqvMBaa2ZTqzfBRh
         29uQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXive5B7cKoNKFuu3qlRpzN68GmNPKgeAQZxf4CF9b8/anxsvH/GG4uC0Dvet7MNfJb+z8xpalig==@vger.kernel.org
X-Gm-Message-State: AFq9FYJvvAYyWevsA1px2k2WPzWLmG5wzIE/LvbUGkuF4oLzxxH0P2Ot
	XMMq1c2PMYRTG45V4bwHR1NBNMEszEMaUfsv6TOJMTGzuQzBzoNmjpSh1PUcx526AuBXWTfVBYr
	3ic3H9q3XdKZvOTd4cp79eDywbflIUDWa0hPgeJdsBFlex+FUiB6jLcxOTNI4ow==
X-Gm-Gg: AYBFou2tMmB/iPLC3FetSrEU0f9PGF/VkvSQdbAVyg2dpwpvz4bSKR3D+mKP+LKPMKw
	yyyTYGf4so3qm79rIDJWH6FQncGJSuv8ALdp0u+JpJpCp1XoUMQkh2ssJectn8TRRxs6KobYDIE
	IIQJFG5IutvDyk/Q7+7peaIqUfOpZdZYGDV3NGMfjPQY8rMJBad+yBVD9/UDU9qgKTkZAZv8eq1
	DYeyel1l294GHo3hD2RvSKmYmJruCuYl25yf5dwmySph8fpC13RjFtC8QZC4BnJSz52v1R7b1YM
	9RCeH9JfgDybf/3HaVJOjpHcg3TtlVdZ74Nw2ddWVh/aCtcAw4u7jqjKYQwetRF2XwMWlXj8Jjt
	/SqjsmzZzXCpQzFXsQ8qdzQwRdReGieYqyZZmPkP8QLIGCG5CmguptPM=
X-Received: by 2002:a05:7301:8614:b0:33c:b64a:3b82 with SMTP id 5a478bee46e88-3427169e0f1mr8378488eec.10.1790625702442;
        Mon, 28 Sep 2026 13:01:42 -0700 (PDT)
X-Received: by 2002:a05:7301:8614:b0:33c:b64a:3b82 with SMTP id 5a478bee46e88-3427169e0f1mr8378422eec.10.1790625699956;
        Mon, 28 Sep 2026 13:01:39 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3434958c3adsm38154363eec.22.2026.09.28.13.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 13:01:39 -0700 (PDT)
Date: Mon, 28 Sep 2026 13:01:34 -0700
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
Subject: Re: [PATCH v12 06/25] firmware: arm_scmi: Add basic Telemetry
 support
Message-ID: <20260928130134.000019ff@oss.qualcomm.com>
In-Reply-To: <20260920091928.2014972-7-cristian.marussi@arm.com>
References: <20260920091928.2014972-1-cristian.marussi@arm.com>
	<20260920091928.2014972-7-cristian.marussi@arm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA3OSBTYWx0ZWRfX/3BTj4P1NVpb
 LU0bbnNaO8spVPYZlH6l/WZsRENN9E/tfSjgEQb/4C9QcIZP/0Jy8a1HeOnZc9UleAAXbu3gvTF
 V/EkSJDm3nZNYjniv9t4vBeTRVP4gg1kjk0Ubo977Ib8SIpcMa+YmeQsi8OvXY1PmwuZJ0h2VBT
 VzuN9LK5nVUXCaY5VkhaExiXezVinlX3dvFDrEfNScyCpfuyouAOjNPwXuoSwm4v5Jp9dUZVPeq
 YLrSm+iu/U4sTuc3FB52khwAXmFGro8Rm29i6AHPRSukvYKagc2186zHcCkrq//NlTtRNdrR2rl
 3h0ABovT6kQnxK04HqMuy5kDZnIJbRVY2LlonYBrvUGPn2/lVGdWgUvHHTLHZir/V5sop3l/sFB
 E/+SxHqz7X8ktLYEG5sESHrAJbLzkDKhbMI/fk3HEhE2+jj1v36HbkmPuXYKmBKrNf64DGvwi+n
 ZOyQWXwWmUKQJLUvzRA==
X-Authority-Analysis: v=2.4 cv=f7jdl+yM c=1 sm=1 tr=0 ts=6abac7a7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7CQSdrXTAAAA:8 a=xkoatq2HAAAA:8 a=7uP6YkEwRucmSFb--CoA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=CuNAHyPTimGbZf_9KV2F:22
X-Proofpoint-ORIG-GUID: fOc_jhdcUamIxmjq1g7GJ16zsAhfnzby
X-Proofpoint-GUID: fOc_jhdcUamIxmjq1g7GJ16zsAhfnzby
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA3OSBTYWx0ZWRfX7nvU2pSp8byb
 NDZlTTTh6z3W0TauQDgoa0wFbyZm4J3M2IrHdGoLmHDQcCS8MjWm+z96s37xVexZTwDvvLrb6Ul
 VvfZeyvdvN7DICP+02/rxP7Kny7DoI4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280079

On Sun, 20 Sep 2026 10:19:09 +0100
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add SCMIv4.0 Telemetry basic support to enable initialization and resources
> enumeration: add all the telemetry messages definitions and parsing logic
> but only a few simple state gathering protocol operations.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Hi Cristian

As David has called out, this is not an easy patch to review and definitely
would benefit from being broken up into more bite sized chunks.

With that in mind, some feedback inline.  Some of it is about making use
of kzalloc_objs() and friends which probably crossed with your development
of this set but certainly help make some code more readable as well
as providing type safe allocations.

Jonathan

> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> new file mode 100644
> index 000000000000..d8176a7d78b8
> --- /dev/null
> +++ b/drivers/firmware/arm_scmi/telemetry.c

> +
> +/* TDCF */
> +
> +#define _I(__a)		(ioread32((void __iomem *)(__a)))
> +
> +#define TO_CPU_64(h, l)	((((u64)(h)) << 32) | (l))
These macros tend to get a bit of bad responses given there is
not an obvious parameter order. Unless you really need it for
some reason I'd just do the maths inline.


> +static int scmi_telemetry_tde_register(struct telemetry_info *ti,
> +				       struct telemetry_de *tde)
> +{
> +	struct scmi_telemetry_res_info *rinfo;
> +	int ret;
> +
> +	/* Get rinfo without triggering a recursive enumeration */
> +	rinfo = __scmi_telemetry_resources_get(ti);
> +
> +	if (rinfo->num_des >= ti->info.base.num_des) {
> +		ret = -ENOSPC;
> +		goto err;
> +	}
> +
> +	/* Store DE pointer by de_id ... */
> +	ret = xa_insert(&ti->xa_des, tde->de.info->id, &tde->de, GFP_KERNEL);
> +	if (ret)
> +		goto err;
> +
> +	/* ... and in the general array */
> +	rinfo->des[rinfo->num_des] = &tde->de;
> +	/* Make sure the freshly registered DE is visible before the index update */
> +	smp_store_release(&rinfo->num_des, rinfo->num_des + 1);
> +
> +	return 0;
> +
> +err:
> +	dev_err(ti->ph->dev, "Cannot register TDE for ID:0x%08X\n",
> +		tde->de.info->id);
> +

Given the two paths are for rather different ways of failing to add it
I'd move the prints inline and make them more specific. Then you don't need
gotos here at all.

> +	return ret;
> +}
>

> +
> +static int
> +scmi_telemetry_de_groups_init(struct device *dev, struct telemetry_info *ti)
> +{
> +	struct scmi_telemetry_res_info *rinfo;
> +	unsigned int num_groups = 0;
> +
> +	/* Get rinfo without triggering a recursive enumeration */
> +	rinfo = __scmi_telemetry_resources_get(ti);
> +
> +	/* Allocate all groups DEs IDs arrays at first ... */
> +	for (int i = 0; i < ti->info.base.num_groups; i++) {
> +		struct scmi_telemetry_group *grp = &rinfo->grps[i];
> +		size_t des_str_sz;
> +
> +		unsigned int *des __free(kfree) = kcalloc(grp->info->num_des,
> +							  sizeof(unsigned int),
> +							  GFP_KERNEL);

kzalloc_objs()

> +		if (!des)
> +			break;
> +
> +		/*
> +		 * Max size 32bit ID string in Hex: 0xCAFECAFE
> +		 *  - 10 digits + ' '/'\n' = 11 bytes per  number

Odd spacing.

> +		 *  - terminating NUL character
> +		 */
> +		des_str_sz = grp->info->num_des * 11 + 1;
> +		char *des_str __free(kfree) = kzalloc(des_str_sz, GFP_KERNEL);
> +		if (!des_str)
> +			break;
> +
> +		grp->des = no_free_ptr(des);
> +		grp->des_str = no_free_ptr(des_str);
> +		/* Reset group DE counter */
> +		grp->info->num_des = 0;
> +
> +		num_groups++;

Can move this increment into the loop definition.
(also the initialization).

> +	}
> +
> +	/* Unroll on failure... */
> +	if (num_groups < ti->info.base.num_groups) {
> +		for (int i = 0; i < num_groups; i++) {

Doesn't matter in practice, but nice to do it in reverse order.

> +			kfree(rinfo->grps[i].des);
> +			rinfo->grps[i].des = NULL;
> +			kfree(rinfo->grps[i].des_str);
> +			rinfo->grps[i].des_str = NULL;
> +		}
> +
> +		return -ENOMEM;
> +	}
> +
> +	/* Scan DEs and populate DE IDs arrays for all groups */
> +	for (int i = 0; i < rinfo->num_des; i++) {
> +		struct scmi_telemetry_group *grp = rinfo->des[i]->grp;
I'd split declaration and assignment so that you can have assignment next
to the error check.

		struct scmi_telemetry_group *grp;

		grp = rinfo->des[i]->grp;
		if (!grp)
			continue;
> +
> +		if (!grp)
> +			continue;
> +
> +		/*
> +		 * Note that, at this point, num_des is guaranteed to be
> +		 * sane (in-bounds) by construction.
> +		 */
> +		grp->des[grp->info->num_des++] = i;
> +	}
> +
> +	/* Build composing DES string */
> +	for (int i = 0; i < ti->info.base.num_groups; i++) {
> +		struct scmi_telemetry_group *grp = &rinfo->grps[i];
> +		size_t bufsize = grp->info->num_des * 11 + 1;
> +		char *buf = grp->des_str;
> +
> +		for (int j = 0; j < grp->info->num_des; j++) {
> +			char term = j != (grp->info->num_des - 1) ? ' ' : '\0';
> +			int len;
> +
> +			len = scnprintf(buf, bufsize, "0x%08X%c",
> +					rinfo->des[grp->des[j]]->info->id, term);
> +
> +			buf += len;
> +			bufsize -= len;
> +		}
> +	}
> +
> +	/* Expose all groups once all fully initialized */
> +	rinfo->num_groups = num_groups;
> +
> +	return 0;
> +}


> +static int iter_intervals_update_state(struct scmi_iterator_state *st,
> +				       const void *response, void *priv)
> +{
> +	const struct scmi_msg_resp_telemetry_update_intervals *r = response;
> +
> +	st->num_returned = le32_get_bits(r->flags, GENMASK(11, 0));
> +	st->num_remaining = le32_get_bits(r->flags, GENMASK(31, 16));
> +
> +	if (st->rx_len < (sizeof(*r) + sizeof(r->intervals[0]) * st->num_returned))
> +		return -EINVAL;
> +
> +	/*
> +	 * total intervals is not declared previously anywhere so we
> +	 * assume it's returned+remaining on first call.
> +	 */
> +	if (!st->max_resources) {
> +		struct scmi_tlm_ivl_priv *p = priv;
> +		struct scmi_telemetry_intervals *intrvs;
> +		bool discrete;
> +		int inum;
> +
> +		discrete = INTERVALS_DISCRETE(r->flags);
> +		/* Check consistency on first call */
> +		if (!discrete && (st->num_returned != 3 || st->num_remaining != 0))
> +			return -EINVAL;
> +
> +		inum = st->num_returned + st->num_remaining;
> +		intrvs = kzalloc(sizeof(*intrvs) + inum * sizeof(__u32), GFP_KERNEL);

Use kzalloc_flex();
In general move everything possible over to the kzalloc_obj, kzalloc_objs and kzalloc_flex
as it will save Kees coming along to tidy that up later!



> +		if (!intrvs)
> +			return -ENOMEM;
> +
> +		intrvs->num_intervals = inum;
> +		intrvs->discrete = discrete;
> +		st->max_resources = intrvs->num_intervals;
> +
> +		*p->intrvs = intrvs;
> +	}
> +
> +	return 0;
> +}




> +/**
> + * scmi_telemetry_resources_alloc  - Resources allocation
> + * @ti: A reference to the telemetry info descriptor for this instance
> + *
> + * This allocates and initializes dedicated resources for the maximum possible
> + * number of needed telemetry resources, based on information gathered from
> + * the initial enumeration: these allocations represent an upper bound on
> + * the number of discoverable telemetry resources and they will be later
> + * populated during late deferred further discovery phases.
> + *
> + * Return: 0 on Success, errno otherwise
> + */
> +static int scmi_telemetry_resources_alloc(struct telemetry_info *ti)
> +{
> +	/* Array to hold pointers to discovered DEs */
> +	struct scmi_telemetry_de **des __free(kfree) =
> +		kcalloc(ti->info.base.num_des, sizeof(*des), GFP_KERNEL);

kzalloc_objs()

> +	if (!des)
> +		return -ENOMEM;
> +
> +	/* The allocated DE descriptors */
> +	struct telemetry_de *tdes __free(kfree) =
> +		kcalloc(ti->info.base.num_des, sizeof(*tdes), GFP_KERNEL);

snap. You get the idea so I'll stop mentioning this.

> +	if (!tdes)
> +		return -ENOMEM;
> +
> +	/* Allocate a set of contiguous DE info descriptors. */
> +	struct scmi_telemetry_de_info *dei_store __free(kfree) =
> +		kcalloc(ti->info.base.num_des, sizeof(*dei_store), GFP_KERNEL);
> +	if (!dei_store)
> +		return -ENOMEM;
> +
> +	/* Array to hold descriptors of discovered GROUPs */
> +	struct scmi_telemetry_group *grps __free(kfree) =
> +		kcalloc(ti->info.base.num_groups, sizeof(*grps), GFP_KERNEL);
> +	if (!grps)
> +		return -ENOMEM;
> +
> +	/* Allocate a set of contiguous Group info descriptors. */
> +	struct scmi_telemetry_grp_info *grps_store __free(kfree) =
> +		kcalloc(ti->info.base.num_groups, sizeof(*grps_store), GFP_KERNEL);
> +	if (!grps_store)
> +		return -ENOMEM;
> +
> +	struct scmi_telemetry_res_info *rinfo __free(kfree) =
> +		kzalloc(sizeof(*rinfo), GFP_KERNEL);
> +	if (!rinfo)
> +		return -ENOMEM;
> +
> +	mutex_init(&ti->free_mtx);
> +	INIT_LIST_HEAD(&ti->free_des);
> +	for (int i = 0; i < ti->info.base.num_des; i++) {
> +		mutex_init(&tdes[i].mtx);
> +		/* Bind contiguous DE info structures */
> +		tdes[i].de.info = &dei_store[i];
> +		scmi_telemetry_free_tde_put(ti, &tdes[i]);

So naming wise this feels odd as you'd often expect a put on an 
object to be a reference count decrement and throw away but
this one is all about putting it onto a free object list.
Maybe rethink the naming or wrap it up in a helper with a more
obvious name that is responsible for setting up the free list and
putting these elements into it.

> +	}
> +
> +	for (int i = 0; i < ti->info.base.num_groups; i++) {
> +		grps_store[i].grp_id = i;
> +		/* Bind contiguous Group info struct */
> +		grps[i].info = &grps_store[i];
> +	}
> +
> +	INIT_LIST_HEAD(&ti->fcs_des);
> +
> +	ti->tdes = no_free_ptr(tdes);
> +
> +	rinfo->des = no_free_ptr(des);
> +	rinfo->dei_store = no_free_ptr(dei_store);
> +	rinfo->grps = no_free_ptr(grps);
> +	rinfo->grps_store = no_free_ptr(grps_store);
> +
> +	/* Ensure all of the above assignments are visible */
> +	smp_store_release(&ti->rinfo, no_free_ptr(rinfo));
> +
> +	return 0;
> +}
> +
> +static void scmi_telemetry_groups_free(struct scmi_telemetry_res_info *rinfo)
> +{
> +	for (int i = 0; i < rinfo->num_groups; i++) {
> +		struct scmi_telemetry_group *grp = &rinfo->grps[i];
> +
> +		kfree(grp->des);
> +		kfree(grp->des_str);
> +		kfree(grp->intervals);
> +	}
> +}
This seems oddly placed. Maybe move it to just after de_groups_init?

> +
> +static struct scmi_telemetry_res_info *
> +__scmi_telemetry_resources_get(struct telemetry_info *ti)
> +{
> +	/* Ensure rinfo descriptor is visible */
> +	return smp_load_acquire(&ti->rinfo);
> +}
> +
> +static void scmi_telemetry_resources_free(void *arg)

Whilst it doesn't always make sense, in general keep functions
orders so free follows allocate etc.

> +{
> +	struct scmi_telemetry_res_info *rinfo;
> +	struct telemetry_info *ti = arg;
> +	struct scmi_telemetry_de *de;
> +	unsigned long idx;
> +
> +	/* Get rinfo without triggering a recursive enumeration */
> +	rinfo = __scmi_telemetry_resources_get(ti);
> +
> +	/* Ensure rinfo is no more accessible upfront */
> +	smp_store_release(&ti->rinfo, NULL);
> +
> +	xa_for_each(&ti->xa_des, idx, de) {
> +		struct telemetry_de *tde = to_tde(de);
> +
> +		scmi_telemetry_free_tde_put(ti, tde);
> +	}
> +
> +	xa_destroy(&ti->xa_des);
> +	kfree(ti->tdes);
> +	kfree(rinfo->des);
> +	kfree(rinfo->dei_store);
> +	scmi_telemetry_groups_free(rinfo);
> +	kfree(rinfo->grps);
> +	kfree(rinfo->grps_store);
> +
> +	kfree(rinfo);
> +
> +	dev_dbg(ti->ph->dev, "SCMI Telemetry resources freed for instance\n");
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

Could you use a DO_ONCE() for this?  I'm lazy and haven't thought about
any locking issues or similar that might occur but my gut feeling is
this is more complex than it perhaps needs to be.

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
> +	return READ_ONCE(ti->rinfo);
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
> +	ret = scmi_telemetry_resources_alloc(ti);
> +	if (ret)
> +		return ret;
> +
> +	xa_init(&ti->xa_des);
> +	ret = devm_add_action_or_reset(ti->ph->dev,
> +				       scmi_telemetry_resources_free, ti);
> +	if (ret)
> +		return ret;
> +
> +	/* Setup resources lazy initialization */
> +	atomic_set(&ti->rinfo_initializing, 0);
> +	init_completion(&ti->rinfo_initdone);
> +	/* Ensure the new res_get() operation is visible after this point */
> +	smp_store_mb(ti->res_get, scmi_telemetry_resources_enumerate);
> +
> +	return 0;
> +}


> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index 5ab73b1ab9aa..2850b018da0d 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h

> +
> +enum scmi_telemetry_compo_type {

I'd add some breadcrumb comments to help people find the sources
of these.  My personal preference for enums of things with spec
defined values is to also set every value explicitly.  Makes
it a lot easier to check individual values are right.

Note that there are quite a few more entries here than I'm seeing
in DEN0056F so I'm guessing there is a draft version that isn't public
yet (and I'm too lazy to see if I can get via other routes :)

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

Is this one useful enough to bother keeping?  It's used for matching and as a convenient
location to stash the two subfields.  Maybe just carry both those fields around so
we can drop this confusing fields within fields representation?


> +#define SCMI_TLM_BUILD_UPDATE_INTERVAL(s, e)				    \
> +	(FIELD_PREP(GENMASK(20, 5), (s)) | FIELD_PREP(GENMASK(4, 0), (e)))

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

> +struct scmi_telemetry_res_info {
> +	bool fully_enumerated;
> +	unsigned int num_des;
> +	struct scmi_telemetry_de **des;
> +	struct scmi_telemetry_de_info *dei_store;
> +	unsigned int num_groups;

__counted_by_ptr() markings?  Check for other places this
might be useful. They are beginning to catch a fair number of
bugs + they are a convenient bit of documentation.

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

continuous.

> +	bool per_group_config_support;
> +	bool reset_support;
> +	bool fc_support;
> +	struct scmi_telemetry_base_info base;
> +	unsigned int active_update_interval;
> +	struct scmi_telemetry_intervals *intervals;
> +	struct scmi_telemetry_shmti_info **shmtis;
> +	unsigned int num_uuids;
> +	uuid_t **uuids;

Can you use __counted_by_ptr() that one?

> +	bool enabled;
> +	bool notif_enabled;
> +	enum scmi_telemetry_collection current_mode;
> +};

