Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794349018;
	b=yBZMP8GTktspTX1ez5APvrBnJDLosJEo8yTGSb95szFA1Nfq4gbysz1hrpVW3fAMrhPB
	 W3inW2QjFog8Thi1RlCbCINKj12pHXIMloDquBCnuJcfFY/tjkuZVTVV1BcCdyXCluGIS
	 2/AQ0EUZP9uYLMsovEJ/yc1zJlbdrpyUmfhkz7nN/umMP+NOrWIUwu8OfIwqZ1rlVCDaC
	 TPo24N3KBEuM2KYrNPwzM483oNRvBuWv+wETIYaijELjSO4K+qvcve3736o4JcsqUZWEP
	 0ICvDJbLFARETvOBBt6Zv3OrbLXPOlDwHnZxk8FQXHVeIfJ/NN7J1quXOE/DY1K5yyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794349018;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FUZnEGtOvAy/yLf/+pZo/7+n9ai2uJCe5ZMlXQokoWQ=;
	b=ilxSZnptktYBbXDp2yj9lF2QGUxdcbgDo1YG7UCSe1fTCTOQanPTHr70SJLMHUHqTvo+
	 IOtdRXYr2enjOrDx/5lZ2o4hwIc9BYa7Ld3lmEjPdvjIyWsYDCX5YaGyngjhZr3cWVbYF
	 EFSRYoGffww+/ajiJmtodL0RwJQ/JBt79Z++F4acepRCK5DYKMxmIgWhoh8mp9ZpmV9Kb
	 uTEv/1e5z7Q+Gy4q5BfZyRwXd8xilGVEjIFhba7o5KPMJ7jgBKgjG9qotCcaG1YNfljfh
	 b7mec4nd4Mso/2VUam2fOyBlTveIFxT14AXl1oePx7mN52NK5B0eRCyuJ26Pl/zIAmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="nx/d+cZC";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ORr0YSav;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9BF606A325
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 22:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A9BF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nx/d+cZC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ORr0YSav
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAIopTp015165
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 22:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FUZnEGtOvAy/yLf/+pZo/7+n9ai2uJCe5ZMlXQokoWQ=; b=nx/d+cZCnnl/B+9q
	V54paZksVqJtSnFLKo4838giNrvuCpWcwAmzEZ80aIGmS8kg3Dai9eZK2iG9Pbp1
	QNG7JAmSsLF3RDVrBWG5Ua+9VdeZNrF5Wce5zBre7pT9pkzkNuDau2lC23hvQQVh
	1kXPtf6xc9MIMXBYZsE3e8dIfg2/R7mSa2WNeWnns7cgBEc8aZaAubuhoaAR7ACJ
	ytlxPs2EpzTu6oOr4PL5YGcJxIeFlXSxKVPVQO16zM3vfG1ykCQx8N5J7BVCZB0t
	b47mNg2GpgIimO/GwcMiL4pOuN2VKLeq/P6Dx+N6j9ZmrLLf/EJ9zXLPGauTVs3O
	3MgAsQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv03cu4hb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 22:16:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad53f538d2so1984262a91.3
        for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 14:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794349016; x=1794953816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FUZnEGtOvAy/yLf/+pZo/7+n9ai2uJCe5ZMlXQokoWQ=;
        b=ORr0YSavgXHZEA1KhkDFmcOUtc6MXJV/SmoRIoae5ZRjrHidDH26Yn250P8+9FhW7Z
         ZEHbBxlHdODATrH2n+mVjwU4ENEBOuvd0+NwUAS/++imG00wr1WJeaeRuzUtuWLSHvo7
         IMZVUnzMb+PHKRGpDPD8CdNLWMR3VwAHshebDHKHOATJnGbw5pYRL8OMITstyMj21AVP
         yMCilfa90Yfoi3XalbDyvJ5oj4wG81fXrmJRW8WSbIAxwrn0FNeabXcm1b1q470nECAX
         8edclmY6kqXluZoh/fdZBHeh1tMX6YCljojmXRpVwjJQNrc+dxCFyJvb3SN/ER+SE6VH
         tGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794349016; x=1794953816;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FUZnEGtOvAy/yLf/+pZo/7+n9ai2uJCe5ZMlXQokoWQ=;
        b=tQrSFtYOhMSSdU0/xRLh7tVGI7lG7h13zW7U2dVaq7kAooK/Rb5zHW/qZk6J1Pj77G
         ioLwRh4kk7L+Gd+M+DN1xF5aFEabY+cOvCahneeFPlMdqsCQm9UDjtsFEzvTdqsAYmpX
         T1Vu2fmNCkZkWPcVMLTQTjGQ2EShDxt03gmI6IfRFgYLsL2zRMhMzlp5TBERWsGGKesF
         DO9xs/JofPyivcg23kwt1BmmUfdo7odXXl/CJelFTqXt3RStmY47HW3uFBYszqC+KQlE
         L5p6S8EU5pwpySFH2fzmkJo0R2IJVJ2TeoEYlXbRz6FA1Y5P9VWdbq5ibrN16K0Kn3Lz
         Fj+A==
X-Forwarded-Encrypted: i=1; AL+hErHTljwQW7387bo+k4j12EO3N5cn79CqWiXHmNO/KVBpx/DAoTGFPSdxvY2rHWofvhRrW80VyFsWRw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8zimdxBxwOTsjM135Z15ZpMAxb0EYN5Eu/5BpcmZsW0PCH9lk6
	4cceokklJYearyOf/gD4rluuap70qKZZ+YkvnE2rTl8ZK/gN2O/P0KmHlpZi0tb/CDiR2Djd3vF
	+18AwQ5e+DExvuiPQIVRh7PJuVRAEKfR9RFyspgT779k8vFudtTdYiZjF9haJBw==
X-Gm-Gg: AYBFou1TtiDir9an0nwhvVVRbnMNek9OgWxX8meUK9K5cZIwLXNVNXHhGWL5cMxi+Qf
	hjusljyVA8XK7XAcMbSqS0YT3AoqL1QrN8Ca3XFF4jQRfvZVbBZbVp588AsUkWSfq6yevnLjV2q
	glgGUK9xJ6zDi4UXN0dCKN8iZUj7gV70x02cCwvE9WyedFF5LTGfiB1roKr8wl/3cLRDjxeOQBZ
	J8KYC9spzoeHIKarB+xWtwvkdNX+wclwqkwzpqxP3PQgkxwo8UCHLs05k5rAJEjHJDTUaxx2zEO
	WUOA+1jfDDQshYLjl0YJ8kMkyylnfE4wFiQ+ZDVzRYRPX5SefEFZIsmliymtOtpzn0pCQGf6ac9
	PS49Wf1rxRiC8UST8WRDa8CXWLoxBvW4eVzaRcO8s7NhLKOmFQUK3Wp+v9dgHISm+Py4iN70cpq
	Tj/kOfLkhjGP8p4HzgT+R68WHq8ak=
X-Received: by 2002:a17:90b:164a:b0:3ac:9259:122c with SMTP id 98e67ed59e1d1-3b182f5a30cmr317139a91.40.1794349016235;
        Tue, 10 Nov 2026 14:16:56 -0800 (PST)
X-Received: by 2002:a17:90b:164a:b0:3ac:9259:122c with SMTP id 98e67ed59e1d1-3b182f5a30cmr317114a91.40.1794349015717;
        Tue, 10 Nov 2026 14:16:55 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bfb58dsm18363973eec.18.2026.11.10.14.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:16:55 -0800 (PST)
Date: Tue, 10 Nov 2026 14:16:35 -0800
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
Subject: Re: [PATCH v15 20/35] firmware: arm_scmi: Add Telemetry
 notification support
Message-ID: <20261110141635.00005ca9@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-21-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-21-cristian.marussi@arm.com>
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
X-Proofpoint-ORIG-GUID: CcQdokktOBQQpBtzq5bhAUwwJBFwo27N
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA4OCBTYWx0ZWRfX3WWaMgPuk1Un
 gShKxE1Hb4smX8WqX2cSuI7bxNzPybx+yv5qw6Rm+UG99jKi8V9c6iCZ0OkRlkLZGC0RAQJ9c4C
 2+G4xrpfRbzYwLRhqTL4oTxJQGAZEI4=
X-Authority-Analysis: v=2.4 cv=FuiQbGrq c=1 sm=1 tr=0 ts=6af397d9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7CQSdrXTAAAA:8 a=iaZMxDlvdvNhGf_iel8A:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: CcQdokktOBQQpBtzq5bhAUwwJBFwo27N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA4OCBTYWx0ZWRfXy3vnOtlmXXZC
 jdpB1DhtTGgSfxrgkvufxwd9xr+x2XBa8+DVsmbitudRD23PEYFHzJq8r5yrQ98KxZV9EBfqkat
 PIN2mQtu5CWW1dCpaGpBIK+/5ERoEBsKx4n1Xa36Oav3juX15SMQBvXYZ9MQRg50nH78nq9WxL5
 nONYR9bfzNJXKbhg41AL8HSJNU2QC3DB9WjOggtm8tLdUQ8NEzJMeP2ywtJ+pXuqVQm8+nJyGH5
 rKgSZyPKVrK1lQSCwkUoOENJbl87LkFMF/jWG6Df40oVml27Lf8VKBufcnWBnXBzKUWB0EaTtDv
 YJL66x9oA+1PB2x1/73LKw7pg93Y0gNu7UjVi47u/4XfIktYZy7k7sTocXmmxaLhEPysr3KtYIl
 WMFwmCSMXr9wCsl0mCLToUBbd0r3Of+DoUpzowF6/8jVSiTX5z0AvXhGHZDS8qJe0IDdJJrxrOD
 qA8V5XIG75kDfIXz+fw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100088

On Mon,  9 Nov 2026 09:12:06 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add support for notifications to Telemetry protocol and register an
> internal notifier during protocol initialization: any DE value received
> inside a notification payload will be cached for future user consumption.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Trivial things inline.

>  drivers/firmware/arm_scmi/telemetry.c | 184 +++++++++++++++++++++++++-
>  include/linux/scmi_protocol.h         |   9 ++
>  2 files changed, 190 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> index ebad4ec2afda..918067e225d5 100644
> --- a/drivers/firmware/arm_scmi/telemetry.c
> +++ b/drivers/firmware/arm_scmi/telemetry.c

>  static struct scmi_telemetry_res_info *
>  __scmi_telemetry_resources_get(struct telemetry_info *ti);
>  
> @@ -3831,9 +3843,9 @@ scmi_telemetry_msg_payld_process(struct telemetry_info *ti,
>  	while (next < num_dwords) {
>  		struct payload *payld = (struct payload *)&dwords[next];
>  		struct scmi_telemetry_de_sample sample = {};
> +		u32 de_id, meta = le32_to_cpu(payld->meta);
>  		struct scmi_telemetry_de *de;
>  		struct telemetry_de *tde;
> -		u32 de_id, meta = le32_to_cpu(payld->meta);
>  		unsigned int wlen;
>  
>  		wlen = LINE_LENGTH_WORDS_RAW(meta);
> @@ -3874,7 +3886,6 @@ scmi_telemetry_msg_payld_process(struct telemetry_info *ti,
>  		}
>  
>  		tde->cached_msg = cacheable;
> -

If you want this, figure out which patch to push it back to.

>  		sample.val = LINE_DATA_GET_RAW(&payld->tsl);
>  		sample.tstamp = HAS_LINE_EXT_RAW(meta) &&
>  			LINE_TS_VALID_RAW(meta) ? LINE_TSTAMP_GET_RAW(&payld->tsl) : 0;
> @@ -3882,6 +3893,10 @@ scmi_telemetry_msg_payld_process(struct telemetry_info *ti,
>  		/* Update the cache holding the TDE mutex */
>  		scmi_telemetry_tde_cache_update(tde, &sample, NULL);
>  
> +		/* Link notifications to Primary UUID */
> +		if (cacheable)
> +			scmi_telemetry_uuid_link(tde, ti->primary_uuid);
> +
>  		trace_scmi_tlm_collect(sample.tstamp, de->info->id, sample.val,
>  				       "MESSAGE");
>  	}
> @@ -4062,6 +4077,148 @@ static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
>  	.reset = scmi_telemetry_reset,
>  };


> +
> +static int scmi_telemetry_notifier(struct notifier_block *nb,
> +				   unsigned long event, void *data)
> +{
> +	struct scmi_telemetry_update_report *er = data;
> +	struct telemetry_info *ti = telemetry_nb_to_info(nb);
> +
> +	/*
> +	 * PARTIAL_ERRORs are reported as -EBADMSG and related lines,
> +	 * marked as DATA_INVALID, will be properly skipped by
> +	 * scmi_telemetry_msg_payld_process.

Doesn't matter much given it will still be 3 lines, but inconsistent short wrap.

> +	 */
> +	if (er->status && er->status != -EBADMSG) {
> +		trace_scmi_tlm_access(0, "BAD_NOTIF_MSG", 0, 0);
> +		return NOTIFY_DONE;

>  /**
>   * scmi_telemetry_resources_alloc  - Resources allocation
>   * @ti: A reference to the telemetry info descriptor for this instance
> @@ -4488,7 +4645,27 @@ static int scmi_telemetry_protocol_init(const struct scmi_protocol_handle *ph)
>  
>  	ti->info.base.version = ph->version;
>  
> -	return ph->set_priv(ph, ti);
> +	ret = ph->set_priv(ph, ti);
> +	if (ret)
> +		return ret;

Can drive this change back to original introduction to avoid a bit of churn.

> +
> +	/*
> +	 * Register a notifier anyway straight upon protocol initialization
> +	 * since there could be some DEs that are ONLY reported by notifications
> +	 * even though the chosen collection method was SHMTI/FCs.
> +	 */
> +	if (ti->info.continuous_update_support) {
> +		ti->telemetry_nb.notifier_call = &scmi_telemetry_notifier;
> +		ret = ph->instance_notifier_register(ph, SCMI_EVENT_TELEMETRY_UPDATE,
> +						     NULL, &ti->telemetry_nb);
> +		if (ret) {
> +			dev_err(ph->dev,
> +				"Could NOT register Telemetry notifier\n");
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
>  }

>  struct scmi_power_state_changed_report {
> @@ -1342,4 +1343,12 @@ struct scmi_powercap_meas_changed_report {
>  	unsigned int	domain_id;
>  	unsigned int	power;
>  };
> +
> +struct scmi_telemetry_update_report {
> +	ktime_t		timestamp;
> +	unsigned int	agent_id;
> +	int		status;
> +	unsigned int	num_dwords;
> +	unsigned int	dwords[];

__counted_by?

> +};
>  #endif /* _LINUX_SCMI_PROTOCOL_H */

