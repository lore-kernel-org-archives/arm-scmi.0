Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794335662;
	b=e26r64Jq+RgKq9yAoNvvFyOviD4qn5/XHzffo09IM1V0VrQBt85A8wBKo5md4qpJyY0L
	 0+OiUXTMeofhzOMFpkNkPaGQbVTbh7Ac9n6musAO3C+xF8zYMJLoU5YtBfS73AvFkwBZS
	 qzKaCQPN1Hgkmvdb8mCno5YiEoQMpsiNKDnBXrXpshnqnO/M93LwqwTVHP0ZqoLzyR6WW
	 MR0TRY67/CDQs7RL+u9gtqjvldBsS8plApQUVqsXouyIp/g9h0Y9bKhNjPsfAAa/W+P0p
	 YRnXL6Ukx4hzzuGFJNq6dJaHu+at/DPBeFCret5apMWVkgrXQU62YY6kHI/mcIgvojg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335662;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xyV7qBNwckqTtIsssEL9NaExu/jjkMlfPFwS4GdvAeo=;
	b=2mzPluaAhPuIgNeIf61CQyJ6m0K9SbuOOg16MmJOekFg4MiJgNoX24MJ1TE7HuYBjTev
	 1rcSqxZ4DBQOFV/zL6RsLSkeFXFnB1496eYf1vwfgtpyTQ67jddt8HCc1MNmgYdUTbyYP
	 Ch+jrO35RIek5IRKY7bHcAeMoLl+ifNREz/mPxbTYmZntnBPKZeceEa2PACV6P+QQ+9VD
	 SSnXYe5mwFdNXU0d7+L9/q2sus4AEtiSD+Jz5BqucX+Jln7oSafS3k2DkMXwmooKWjN9S
	 73r50PWna+bS7btngkEyORrsXxcbCsvBqDvYQL5hrgYF4AJhDFcxLDlV2MrlOIY8yHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SaJ7MQkV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a8rvSV4t;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF46A606A31C
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 18:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF46A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SaJ7MQkV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a8rvSV4t
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF0Cpn3713575
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 18:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xyV7qBNwckqTtIsssEL9NaExu/jjkMlfPFwS4GdvAeo=; b=SaJ7MQkVqcEov/Zp
	G6DNO3M5WaRiQEC2W9C8uSRw8U7nBHky9LwKAIU+gO97H5lyVLGNYcciTkXSPaJl
	bw+jay9tS9q3KPO0pMduEhONBECQDouysnAtsX47aDH1aqTkMMpRe7GDzzqTcfBk
	K2JRFIbkGZk1LTqFyGiedJOKy5CedEtaHKH/CvhUbomoePhT26Za/Oy6S5Pv2A/7
	gsm157jneUh2GCVmKUfk1bvMRBbBOpt+Fk+wMTtZ/chSQbNhYmDxSdIhXsVcLtfp
	oeF1h9KrcqRZ+Ie4BJL1a3P1vdci9K6N9LVFk6ZNWAS7Rrn/JwsNrbeosStDljke
	4kRmkw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huvtdb5gq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 18:34:20 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a5005fd0f8so315167c88.0
        for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 10:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794335660; x=1794940460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xyV7qBNwckqTtIsssEL9NaExu/jjkMlfPFwS4GdvAeo=;
        b=a8rvSV4tBwKLolZanP3Dh+QzmIa0ZyNF5Vjng9T8BHdkIjCWmxasc3ikOp+3NwabS8
         KMVM3VKXOoQ0n560ktwPcFh069yIUEqn6JSOUsFvvCAaU9do3GX1zfj1SCIgz0aPAsdk
         nTcuVnxt/Dfe7DMXqBj9HqyQc70DqU2MsLpt+xjMxAX0g5KVpNEA5G7FKxlsQEPb1ajm
         RT2efSSwUTjY/tihXTbppcDOa49Vfhtibw/hy4W1RB7XLdzbxjmFpwd60XK4p4Jl0sH7
         wsV6mBlXy1JD7aEjsyO8TZoR+Y2d/F29IHBWxNHVUZ0/HXLfHz3sasMhuQo/BDAjQWtL
         Hf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794335660; x=1794940460;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xyV7qBNwckqTtIsssEL9NaExu/jjkMlfPFwS4GdvAeo=;
        b=NBQw9wElgIgVUifShV8oVJ2tbVWf621iISX61AGhuSMUUBDkkhHj04y6aqooTvx6qS
         heMIh+wSzPFpPODB0aSx6ZwKMkPuFU3BktrJIO8R0uHV6r5r5XBR615Re0yCrdkdmhR2
         eOb/zX99dPvGMRiZG13bfQl0oNZT6XXR3snbgvplVqr25eRw0C5Eb4v40WyQQ577z60h
         RH2Wupzpl34VdNHtNKlsnTbecNYX6vnnPdJq8My3k2GvK+FSRvMFNPzJ0aPqJpYEauBr
         Z9owgYtYc2aeRPqnJ4yq+Tw4kE9STspFslw86egaDUVgoL5r+57YRvt4uX98QV5YHkxS
         aYXg==
X-Forwarded-Encrypted: i=1; AL+hErG5pwRnnO2zk48tnqIMvoyDkgTXHplJ6sj2IWAURINPW7NveviYJoq7e5u+4ldZIYPk1eiuxiLqKw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9SFyoq0kF5FGAEiUvA7lXLNbvAzigWQhOqrFrWHULdnrLjUfaI
	tbEixwPn5vOgO7NG5XdxBqIs9sre0PO74L4Fr/c+GvitFpaxxgKpKPC5NeUv0g8qeVW6XzXutP6
	QITVxM3ynIyOGago0EwWRWOiFAXGfT90ICZK7+5XLbXE9okUFpwchvliPDjuW/Q==
X-Gm-Gg: AYBFou2AaTf0+5dvz110s3i+Q4ZqQhUS0F30qIxT3bjUSmjJXL9d2hcDBFbNp8RJEWQ
	ScaddhHGLbQqTwJ/7h25xsfvoeq0SUtOa8ukYQYHYu/8MqV2KHOFAMAhTM8KZ9qf6PLnkP3tSHU
	abnZ2WNd+dJaQLC9XvA8jwMKC0dQt4pMZhfbOQutr466kXivRnbub+Vfuwl9xYGn48Z5P0cft65
	nzKAJY7Hf5LbftB0SKr+mKh0K44bMhRuPYpCc23McqfxMFcfweXY3xIbs2Gi+V+bGPlsz0Knzvs
	VDb70ikbb9E+H4pfVvivSMvszyvT9JMR3YTo2CeXInbodnD0BnTpbw1zf6QpVjalpq4vBr/wkuW
	XDZ6d6gSvcEeyioc/E/BbHV1sXGf/jXalvnO+QhLcT4/wJ3v4cUGgfz0QIiMoYldsI4POnNISe5
	BrK63XcuiKxcb8dVk539XqOVpike8=
X-Received: by 2002:a05:7022:1109:b0:1ac:f84d:403b with SMTP id a92af1059eb24-1b3b6054c1fmr4484109c88.8.1794335659315;
        Tue, 10 Nov 2026 10:34:19 -0800 (PST)
X-Received: by 2002:a05:7022:1109:b0:1ac:f84d:403b with SMTP id a92af1059eb24-1b3b6054c1fmr4484060c88.8.1794335658518;
        Tue, 10 Nov 2026 10:34:18 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm17591012c88.10.2026.11.10.10.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:34:18 -0800 (PST)
Date: Tue, 10 Nov 2026 10:33:56 -0800
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
Subject: Re: [PATCH v15 15/35] firmware: arm_scmi: Add Telemetry TDCF
 parsing for BLK_TS lines
Message-ID: <20261110103356.00003a29@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-16-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-16-cristian.marussi@arm.com>
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
X-Proofpoint-GUID: 26jW7d1TL6U2bOlouDMaJ3FixABT_Nrd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3MyBTYWx0ZWRfX6pRZa7enmUBV
 as4CzrT5BIrjHdbdyATpM+2R3kvN+5Zo649Z8ykJevQ5PftIX0T/JjE965S2zRkkY8uIsbDdi3r
 bIiDzUhFVU6RkxYeZkrBHwDWE6hbunQ=
X-Proofpoint-ORIG-GUID: 26jW7d1TL6U2bOlouDMaJ3FixABT_Nrd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3MyBTYWx0ZWRfXwZyT1z0uZJNh
 LsMbxHQ0lCCjgveEA0GG/LMYHUdtMACcZlFSgHn1f385rF0zWiA1jGDYr6Xdt7SuczGuw/rv4gv
 cNhbkOd2/2oxGPy65HLHtzc6jNnjnhTwC8FYR661q7EEWpaBRvIsDZqnLZ15lpQ3rfYiJTIOv7C
 uS1RDJK5uVrhx51hVyJfh2HlEPi6x1TEqbn3MVzEs5xAgNEOOMOi63gBOa5to52puvlWqOpjDx/
 SHvA0o/5ih8238vqYTW7pthI0o1Xni5hx127ODqpLv9bxRzttOdKUGyDIdvh719VK2IT0kzlSsx
 lJEdDLL1COOq38++DMScscgAp4qboaVRrBydbAQV91L1VJNvb/eJp249PA9LnmyX4I7jd7GwsPy
 5F8kM2ENQkBo/XRTOEfte0sGHL8yJy0BMSO3Gy3s1Ea2pti9EMgR1MmL2Ts1Y1OcRR8IR/McLis
 61qLp9kX6j3TfABrS1A==
X-Authority-Analysis: v=2.4 cv=ArR7T+9P c=1 sm=1 tr=0 ts=6af363ac cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=JRCmi-Q6nD18N7oa2wEA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100073

On Mon,  9 Nov 2026 09:12:01 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add support to parse, track and link TDCF BLK_TS lines to the related
> discovered DataEvents.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

A few minor things inline.  + I think some of previous patch belongs
in here. Getting patch break up perfect is sometimes a pain, but it
really helps keep things logically together for reviewers and on
a massive set like this, anything that keeps the reviewers happy
is the way to go!

Jonathan

> ---
>  drivers/firmware/arm_scmi/telemetry.c | 317 +++++++++++++++++++++++++-
>  1 file changed, 313 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> index 810195889484..e3fbcb1e6ea7 100644
> --- a/drivers/firmware/arm_scmi/telemetry.c
> +++ b/drivers/firmware/arm_scmi/telemetry.c


> +
> +static inline void scmi_telemetry_line_free(struct telemetry_line *line)
> +{
> +	void *blob;
> +
> +	switch (line->type) {
> +	case TDCF_BLK_TS_LINE:
> +		blob = to_blkts(line);
> +		kfree(blob);
The local variable isn't adding much over

		kfree(to_blkts(line));

> +		break;
> +	default:
> +		WARN_ON(1);
> +		break;
> +	}
> +}


> +
> +static struct telemetry_block_ts *
> +scmi_telemetry_blkts_create(struct telemetry_shmti *shmti, unsigned long offset)
> +{
> +	struct telemetry_block_ts *bts;
> +	int ret;
> +
> +	bts = kzalloc_obj(*bts);

Use a __free() here and then no_free_ptr() on the return.

> +	if (!bts)
> +		return NULL;
> +
> +	ret = scmi_telemetry_line_init(shmti, &bts->line, offset, TDCF_BLK_TS_LINE);
> +	if (ret) {
> +		kfree(bts);
> +		return NULL;
> +	}
> +
> +	trace_scmi_tlm_collect(0, shmti->info.sid, offset, "SHMTI_NEW_BLKTS");
> +
> +	return bts;
> +}

> +
> +/**
> + * scmi_telemetry_tdcf_blkts_parse  - A BLK_TS line parser
> + *
> + * @ti: A reference to the telemetry_info descriptor
> + * @bts_payld: TDCF payld line to process
> + * @snap: A reference to the working SHMTI snapshot that will be processed
> + * @active_bts: Input/output reference to keep track of the last blk_ts found
> + *
> + * Process a valid TDCF BLK_TS line and, after having looked up or created a
> + * blk_ts descriptor, update the related data and return it as the currently
> + * active blk_ts, given that it is effectively the last found during this
> + * scan.
> + */
> +static void scmi_telemetry_tdcf_blkts_parse(struct telemetry_info *ti,
> +					    struct payload *bts_payld,
> +					    struct shmti_snap *snap,
> +					    struct telemetry_block_ts **active_bts)
> +{
> +	struct telemetry_block_ts *bts, *previous = *active_bts;
> +	struct telemetry_shmti *shmti = snap->shmti;
> +	u32 meta = PAYLD_META_RAW(bts_payld);
> +	unsigned long offset;
> +
> +	/* Check for spec compliance */
> +	if (BLK_TS_INVALID_RAW(meta)) {
> +		trace_scmi_tlm_access(0, "BLK_TS_INVALID", 0, meta);
> +		return;
> +	}
> +
> +	offset = TDCF_OFFS(snap->base, bts_payld);
> +	/* A BLK_TS descriptor MUST be returned: it is found or it is created */
> +	bts = scmi_telemetry_blkts_get_or_create(shmti, offset);
> +	/*
> +	 * On error processing the new BLK_TS bailout taking care to clear
> +	 * the previous last active BLK_TS to avoid mistakenly binding to the
> +	 * next data lines.
> +	 */
> +	if (WARN_ON(!bts))
> +		goto out;
> +
> +	/* Update the descriptor with the lastest TS */
> +	scmi_telemetry_blkts_update_snap(ti, bts, bts_payld, snap->magic);
> +
> +out:
> +	/* Drop one refcount on the previous active since we found a new one */

I'd have this mention where the reference was taken as then it's clear why
it makes sense to drop one here. Something like
	/*
	 * Drop one refcount on previous active to match with the one take
	 * in creation as no longer need to keep it around for potential new
	 * users.
	 */

> +	if (previous)
> +		scmi_telemetry_line_put(&previous->line);
> +
> +	*active_bts = bts;
>  }
>  
>  static inline struct telemetry_de *
> @@ -1561,7 +1801,8 @@ scmi_telemetry_line_data_parse(struct telemetry_de *tde, struct shmti_snap *snap
>  		*tstamp = 0;
>  		if (USE_BLK_TS_RAW(meta)) {
>  			/* Read out the actual BLK_TS */
> -			*tstamp = scmi_telemetry_blkts_read(magic, tde);
> +			*tstamp = scmi_telemetry_blkts_read(magic, tde,
> +							    bts_payld, snap);

Noted in review of previous patch that I'd just have all the parameters
back there rather than adding these two here.  It isn't consistent in that
some parameters were used and others not, as in that patch magic wasn't used
either!

>  		} else if (LINE_TS_VALID_RAW(meta)) {
>  			/*
>  			 * Note that LINE_TS_VALID implies HAS_LINE_EXT and that

> @@ -1906,6 +2187,15 @@ scmi_telemetry_shmti_refresh(struct telemetry_shmti *shmti, int *idx)
>  	return work;
>  }
>  
> +static inline void
> +scmi_telemetry_reset_active_lines(struct telemetry_block_ts **active_bts)
> +{
> +	if (*active_bts) {
> +		scmi_telemetry_line_put(&(*active_bts)->line);
> +		*active_bts = NULL;
> +	}
> +}
> +
>  /**
>   * scmi_telemetry_shmti_scan  - Full SHMTI scan
>   * @ti: A reference to the telemetry info descriptor
> @@ -1976,6 +2266,7 @@ static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
>  		qwords -= used_qwords;
>  	}
>  
> +	scmi_telemetry_reset_active_lines(&active_bts);

It's only resetting one.  Maybe reset_active_line?

>  	srcu_read_unlock(&shmti->srcu, idx);
>  
>  	if (ret)
> @@ -2120,6 +2411,22 @@ static void scmi_telemetry_resources_free(struct telemetry_info *ti)
>  	dev_dbg(ti->ph->dev, "SCMI Telemetry resources freed for instance\n");
>  }
>  
> +static void scmi_telemetry_lines_cleanup(struct telemetry_info *ti)
> +{
> +	for (int id = 0; id < ti->num_shmti; id++) {
> +		struct telemetry_shmti *shmti = &ti->shmti[id];
> +		struct telemetry_line *line;
> +		unsigned long idx;
> +
> +		guard(mutex)(&shmti->lines_mtx);
> +		/* Drop all remaining currently unbound lines and their containers */

I'd avoid the comment.  It's a _put so should be clear there may be references
held that keep it alive for now. The comment kind of invites questions about what
it means to drop unbound ones here, and what the lifetimes of others look like.

> +		xa_for_each(&shmti->xa_lines, idx, line)
> +			__scmi_telemetry_line_put(line);
> +
> +		xa_destroy(&shmti->xa_lines);
> +	}
> +}

