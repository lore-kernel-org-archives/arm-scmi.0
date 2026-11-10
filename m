Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794348483;
	b=R6D1ZLHVSrxxzlafz85HAniZQPzDCt+WEqqYhsZnbuRvSNsKobHejwX9jobXe/6BjCid
	 wX4IRU8Xnvhftqpdb8Q+QNvC3nygs+2e4X8ntFTUpmuvUXTKZmIG0RQiTmgTCKlWkJLcT
	 zhy90sRKRMaD61hj9c00fm86js/7gzjgZuhkNmOZxL8h6tnER+iL1GhPD8pz915SJfyYy
	 e3mL8x7IHO/iql5hmgYaFSO1kh+8F4iI41+D+F5hD1E4eY05/Z8COvITnJDTmca1f4Cy8
	 wJF9lYnPot1yrKnkjNm95/e9LEfLORps3/ZUlZyvxudI1Qujn+2deF3MYWSE4BQ4QTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794348483;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wFJ1R7uPrqqY5P5JMzwjD2OI5yMoWBhA9w+CZfdg8y8=;
	b=YD0NV8vojI0QGUZ/6rQHpNLDuwzLwPppkax9oo7sqseKw0JO666+L3NLZtJNOtB2xVs3
	 DY5CEQOu8RvbgNtOZLeXz7axJdBaE+CV9JPu8bPs0jSjWFiVzLGK84d/DgEBlvjZAr+rK
	 8QesSs6uo0ektyvBeULL+KPax8LlR8Gbw4ZAonmu5wrS7j3eotrbsoI2GB2EK+gxXqIus
	 dlAOhy/psuVSsNi++giU53cUGLUUmZm8Qlz5f/bHFWhhlwm2eUeOk3MtRvM1tChMX03c0
	 LpUpvIb5TK8M0bmReJWYxGmPz5Wkqov+rI2bMd6iNXzgUeij2GsrrdQwZFk3xYvcRvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c86qyAqV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VMQplxDZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D73D60A2605
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 22:08:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D73D60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c86qyAqV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VMQplxDZ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAJC6Ih709132
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 22:08:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wFJ1R7uPrqqY5P5JMzwjD2OI5yMoWBhA9w+CZfdg8y8=; b=c86qyAqVEQjKRFe5
	Er8KYOzZEgLoic6DIf0SBwpxaNoz94s9EcCc1yjf4dBrtW8TSccPKpcC1gPh4D9j
	k4Su05jYX00KVsMK0jN5Ls0pJvk76SDxOQsx2Ifnqi72HfXTJj4z0L2UM8r7buUa
	34Zsg7bZOzgePJMUK2BEtXIL6mxVahb0YbU3huvR4L8iWrbjZZ4ysH8VR4oKkYLf
	GAQn7SdP5iL+PwtMZR8KhY07k6yTjF3I80Y5w7qPLbjGxgOgSe13wC43l3zvT7ye
	6dly1MOnE9JFQhlpHOruTcaixz6BzWAc2LLekoZW+Z7VOACVqEoYVCFlmVTEd4hR
	gCBYnA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv97c8p0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 22:08:02 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36de26cb4b3so3367373eec.1
        for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 14:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794348480; x=1794953280; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wFJ1R7uPrqqY5P5JMzwjD2OI5yMoWBhA9w+CZfdg8y8=;
        b=VMQplxDZk6oCIhFEWtnJ1FTA3cnZnzA4Cku4/GN3KpNtm72HUpfQbQgM4s52jxr7Zt
         e52otrMCwZ+D8+QWiMBY+AvdQaU0aB+FGTP1djAhiMofZjNkAH+nEJSTwq4TYhxxXkdq
         e0C0xtEVdUNRu5/1s4wFG383AxpmnimOC3UiwUfX107ItnQ1GYYvyeTn7LU0aXcVRscW
         FXwLDaqzTkt5lQ9DPdsPd1WD7db7fgne7C0lwqhUrUCswujEjp4v712HVNBH/OKYZKiY
         Xwt9o84pJj2qQFMgn7Wfbk+n7RH5Cp/WsB/f1LrVrE0u2a0nokFa+8eFsF+Co+NFeV6M
         JFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794348480; x=1794953280;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wFJ1R7uPrqqY5P5JMzwjD2OI5yMoWBhA9w+CZfdg8y8=;
        b=LGuHSgYLf87mQDZQzxQQUNu6PEE4eAfcltIovvPez2yaLzNASP0qN8IjafbkqVTNkL
         /kblSh6HkEMaeYIwUlyfVE7H/PocJsqtSxS2WRKHuNdwZOWknZVlSSLKrjJ4NXJ6UdsY
         Y2hxTGPRVxUYFKHiWcrWAb7oIAReGi3Laxr7HOcykK015jEuHbV7d88EwyOV/ueD6575
         raXmd09MOxbnCT/cpjTBjfdqSEPTtjQCi/gDInH7TJmj00X7KDLrEjsjbM7h+5lOF0MV
         sQaHUSiGwsKZcGrUv1dssiI5bI54KddRrnaIChqETyXc4I7UPWGgWr3wYObxoMjxkpg8
         dIDg==
X-Forwarded-Encrypted: i=1; AL+hErG/GJDTcGZmcdiRNIGq5WoClQjXd3uLCgdYXLj/4ofjji0R93OCoqXR4K/tX6RSh7rtadn9rbQV9g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Sa+CX1oO8Nq3LzhjSUl4XA28FgERloIITRRLF/+5U6fwwj7Q+
	o/XSJ7CUZPn1SFGfOe4cpnXslygCaXhU4z6x20URz5M1nhxG5lHF8TcVzD2qxYlLo9JfhjNBpZb
	aGgBELhfDZNnW0kLqaNKc6oFZnMLVqq0YY4Ft4/MqFhuhEfto5Fgh3kWdsfre3dGm00yA1g==
X-Gm-Gg: AYBFou23mIVtHOWqEfgrjRJDddFr84iE49l3G7j7bXvLZjxhIupmqOMweLXCDwFymek
	RTFEHWP/Tvicwz0bZsFEXEr2mMUKH20aZrOoaL7tzoiS3x3THW/jfppwar3w/fLi++nxGt3Kq/G
	OCVn5sYUm7EtkgQBYU4wUxK+/tHsqCmWGdU31cW12UUIubhqYzH1G34FqWCJLC2mQOQVK2EygYP
	GBbdP7VpvFz7H3EkT53eMgihFXfxPuC62lU2M1bM0kQ1Cli76oOY7htDzpzmNwk/Q+Q09MQpHbg
	FoBvcrTbWP3Im4FRAAtPY3lcSoWafsZOM/oPFVWGVnZ8nqvIpQwxENp2LPoi6QB2WXjz4CSQ8QQ
	adylxjO0zo+QwZYlam51I1ZkGVrTQE6VJSqlNdNlHpbkooxcaiQsDO+yCfDaODb8WW5F1kYozUn
	mHTgHUXuw/5T515HU5N+KrDcxSn+FM
X-Received: by 2002:a05:7300:ea0d:b0:36d:e4c8:8f04 with SMTP id 5a478bee46e88-37686174a2bmr904360eec.17.1794348479625;
        Tue, 10 Nov 2026 14:07:59 -0800 (PST)
X-Received: by 2002:a05:7300:ea0d:b0:36d:e4c8:8f04 with SMTP id 5a478bee46e88-37686174a2bmr904303eec.17.1794348478722;
        Tue, 10 Nov 2026 14:07:58 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375215d8889sm10250365eec.27.2026.11.10.14.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:07:58 -0800 (PST)
Date: Tue, 10 Nov 2026 14:07:39 -0800
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
Subject: Re: [PATCH v15 19/35] firmware: arm_scmi: Add Telemetry reset logic
Message-ID: <20261110140739.000026c1@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-20-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-20-cristian.marussi@arm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA4OCBTYWx0ZWRfX1KLRaWgvZ/Sm
 E4yU0Eh/x71gzO9VPgtNbvB56oo23KJ4yi+az1lfkpBNgDPj2amBZUgGFI7rYDMotsgdo16qGpg
 yo6bL4TwB5gNiSBBwShWRbSXVnenkP/pj1F/FPyTybntg6owCVuz/7/OCh9qUh7h5AgIgD8B2tr
 SPXNcHRESSTxxjM7PbIeEdnudbuFy0gsQ2wh4UFAmpFP74tobt3GxRh0hIhymgNoBPpHNzJeqIi
 NnB4F8yYAIeh26W2s9XlGYv9gxa462kv6rQfTkWYXv9YdF7YyFkHnS5arzJIB+5TayhgJegr1p/
 LKiDLurpmqQPDbjrC7uBtKQki/PUEbe+evgrEazyPwevYS116NfuqBI1QpkIHpotD1HnKWKms3R
 uGoD1OgjQZ1gOVVkwqZm5jWYj7qYFzwZw4VOh/zSB0JVbzqK5RedFLoBJ4Glt/ZWM7CuRbJWDi8
 7xsBsyOJ14A2Q0dwi2A==
X-Authority-Analysis: v=2.4 cv=cJl1IVeN c=1 sm=1 tr=0 ts=6af395c2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=ejotlmTCnjgNnXibSUUA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 1A8jILq3fls8ScD89V36Eu30lBSWSCiI
X-Proofpoint-ORIG-GUID: 1A8jILq3fls8ScD89V36Eu30lBSWSCiI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA4OCBTYWx0ZWRfXwyWffX3gj7ND
 Kod0hNAsEBafYAESDTockpVYIqvk6k0id6Dp/qgxlX0DuYrCSC02wiZB0xjEnQLOBW6L9JCwIrh
 4Ebi4bsf4Hf6xy5Bu5ocJisI4PJ72LM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100088

On Mon,  9 Nov 2026 09:12:05 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add support for Telemetry operations needed to request platform to
> reset telemetry current configuration and data events values.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Just one trivial thing that might be wrong anyway.
> ---
>  drivers/firmware/arm_scmi/telemetry.c | 81 +++++++++++++++++++++++++++
>  include/linux/scmi_protocol.h         |  2 +
>  2 files changed, 83 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> index bf37faf99865..ebad4ec2afda 100644
> --- a/drivers/firmware/arm_scmi/telemetry.c
> +++ b/drivers/firmware/arm_scmi/telemetry.c
> @@ -3969,6 +3969,86 @@ static int scmi_telemetry_des_sample_get(const struct scmi_protocol_handle *ph,
>  	return ret;
>  }
>  
> +static void scmi_telemetry_local_resources_reset(struct telemetry_info *ti)
> +{
> +	struct scmi_telemetry_res_info *rinfo;
> +	unsigned int num_des;
> +
> +	ti->info.enabled = false;
> +	ti->info.current_mode = SCMI_TLM_ONDEMAND;
> +	ti->streaming_mode = false;
> +	ti->info.active_update_interval = 0;
> +
> +	/* Get rinfo without triggering an enumeration, cannot be NULL anyway */
> +	rinfo = __scmi_telemetry_resources_get(ti);
> +	/* Make sure to see the latest num_des */
> +	num_des = smp_load_acquire(&rinfo->num_des);
> +	/* Clear all local state...*/
> +	for (int i = 0; i < num_des; i++) {
> +		struct telemetry_de *tde = to_tde(rinfo->des[i]);
> +
> +		scoped_guard(mutex, &tde->mtx) {

Unless this gets more complex later,
		guard(mutex)(&tde->mtx);
and resulting drop in indent.

If it does get more complex ignore this.

> +			tde->last_ts = 0;
> +			tde->last_val = 0;
> +			tde->last_magic = 0;
> +			tde->cached_msg = false;
> +			if (!tde->de.fc_support) {
> +				tde->sid = SHMTI_ID_INVALID;
> +				tde->base = NULL;
> +				tde->offset = 0;
> +				tde->eplg = NULL;
> +			}
> +
> +			scmi_telemetry_de_state_update(ti, ENA_STATE,
> +						       &tde->de.enabled, false);
> +
> +			if (tde->de.tstamp_support)
> +				scmi_telemetry_de_state_update(ti, ENA_TSTAMP,
> +							       &tde->de.tstamp_enabled,
> +							       false);
> +
> +			/*
> +			 * Unlinking ONLY BLK_TS lines since, per the SCMI spec,
> +			 * the UUID/DE associations are permanent within the same
> +			 * session boot: after a reset has cleared the server-side
> +			 * configuration the next time SHMTIs will be re-populated,
> +			 * these same UUID/DE associations will be re-instated.
> +			 */
> +			scmi_telemetry_blkts_unlink(tde);
> +		}
> +	}
> +
> +	for (int i = 0; i < rinfo->num_groups; i++) {
> +		rinfo->grps[i].enabled = false;
> +		rinfo->grps[i].tstamp_enabled = false;
> +		rinfo->grps[i].current_mode = SCMI_TLM_ONDEMAND;
> +		rinfo->grps[i].active_update_interval = 0;
> +	}
> +}
> +
> +static int scmi_telemetry_reset(const struct scmi_protocol_handle *ph)
> +{
> +	struct telemetry_info *ti = ph->get_priv(ph);
> +	struct scmi_xfer *t;
> +	int ret;
> +
> +	/* Stall concurrent configuration request */
> +	guard(mutex)(&ti->config_mtx);
> +
> +	ret = ph->xops->xfer_get_init(ph, TELEMETRY_RESET, sizeof(u32), 0, &t);
> +	if (ret)
> +		return ret;
> +
> +	put_unaligned_le32(0, t->tx.buf);
> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret)
> +		scmi_telemetry_local_resources_reset(ti);
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}
> +
>  static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
>  	.info_get = scmi_telemetry_info_get,
>  	.de_lookup = scmi_telemetry_de_lookup,
> @@ -3979,6 +4059,7 @@ static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
>  	.de_data_read = scmi_telemetry_de_data_read,
>  	.des_bulk_read = scmi_telemetry_des_bulk_read,
>  	.des_sample_get = scmi_telemetry_des_sample_get,
> +	.reset = scmi_telemetry_reset,
>  };
>  
>  /**
> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index 7177f739f062..012894e1d9be 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -1024,6 +1024,7 @@ struct scmi_telemetry_de_sample {
>   *		    the ones belonging to a specific group when provided.
>   *		    This causes an immediate update platform-side of all the
>   *		    enabled DEs.
> + * @reset: reset configuration and telemetry data.
>   */
>  struct scmi_telemetry_proto_ops {
>  	const struct scmi_telemetry_info *(*info_get)
> @@ -1051,6 +1052,7 @@ struct scmi_telemetry_proto_ops {
>  	int __must_check (*des_sample_get)(const struct scmi_protocol_handle *ph,
>  					   int grp_id, unsigned int *num_samples,
>  					   struct scmi_telemetry_de_sample *samples);
> +	int (*reset)(const struct scmi_protocol_handle *ph);
>  };
>  
>  /**

