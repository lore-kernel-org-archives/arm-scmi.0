Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794349562;
	b=FgHYu9H5jhj6PGkYSu12MrC/1YhAC3g0+iNvVpyRn78nWnAmR72TVPOhgXN42T2hXewm
	 Ui2rTiMtTqR27jWCeI9Iaov4vJBeLztYp0uR0Ohv3YkB6op3wWvt1YpiKncPVWlwXL3lv
	 KKd42UdbGQhUy4xc/ZEdp/HYFW/puYaXxSylcFTv97JhtcMHN89qZ6nAmvDzZGUhnfjR3
	 Mck7bAoSTlYbTLLgUwW4N9K7qNh0Pikm6JpSWwuYGIr2goRiYjMJIuxF3nFmdBTAjiRVO
	 C5jZtZ+cOwMDJh9XiWmWAHp65yJyyeSR/B1aV4WpzAkp50XxkOP95uitFSWu3rRSlwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794349562;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QTCujI8/h5TPqkOtaoAlRquKFa3ouHL2s5oDMvSTaAw=;
	b=fIbTAH2RXOEWuArGiGCv8kmfK4aVHCcf6fjtb03fJeyUBHdLOpyQleep+k3aaYaSjmLl
	 F0e8rMaD0AqdrriCiKRRtdrNojdsgxcJRDnLZJMIXAQJpMjhhu7lltOxW1eb9EfHMQK7P
	 8fkusoh+0Sdn60F3qF7lQ2u1vMaHmx3jL3x5WmpoEzN8v3rZpC4IyHrjTsT+jKGZdhbQv
	 ssTK+dPPj1JvcGdKyTjxFJZt7O6O9A7tZysngjATmtSzKakk51/u4VI9H/SSY76/5Nawb
	 mqF8eWoeCCJMC4HxQSgNiWFU0JByOQNGxPr9Kb1NnMSJrZ6SbP7e5wkvX8JsGl357Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cp+tOSd2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oi5KJafi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F9A606A321
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 22:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42F9A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cp+tOSd2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oi5KJafi
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMKYns4155405
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 22:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QTCujI8/h5TPqkOtaoAlRquKFa3ouHL2s5oDMvSTaAw=; b=Cp+tOSd2a9k0ul7T
	vbbqZ/ZYAIXNkqtpV7NyDiLxrJZo5UvfJis9hgKgbbEkHjXnMVFbJBt6kTdQT35q
	qHSE8LuDyqRdV9S12bpuGe9NhSNZmJxVLnN1rFRYlcEn4NsmnzF3USEEL8SVRg1w
	3YAWqL2CmzcNRkH21bzGbGRaTDDsv9JFq1MXeadHg0fo/hKUW9g3ngngLp0hgZ6X
	HPfY8zl8YEkdgaJUsDnz/1gyCbiAuEA0ha4x8ghZi6TA88EUigyOLcP8ffglbS+C
	1y8amHKRD/WvcGcY+2DZ0RD/7/RYeglLY4gpoEggIy5UOHDApuAgX3S8qjWXb8ho
	D0npxQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huucp49cu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 22:26:00 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f26e6abe9so4103031eec.0
        for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 14:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794349560; x=1794954360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QTCujI8/h5TPqkOtaoAlRquKFa3ouHL2s5oDMvSTaAw=;
        b=Oi5KJaficyGinXbpw/lkjiyId/8VgaSRLFgmA27CJiGGCn/mm2fE2HL3pNDGv5YlPh
         JZN9ZxYLkPOhTh8sQXHBgWnj0eLoJBuBftMef9b6ShsFOfMZx7I8EIUE3VL/gmI7Fv5b
         v25aNMJz+kK7TjAXDrLP8Wu9XnUbHoEoy0RYWCR4QM1Gl5nlJ33Wb28nHCWW/frkRMll
         vi9/0hL+Op2MjnByZ6vpsMIIntZMshf3A9aZ9qbTm6ybpzVegC1zDlwEw64hwG3vXFsJ
         csftzerKefpmgKwk/3dEnuHC9qqTh/G6yNKCYe6hYRtrKCKRACSlfXVUTPTqHGrhZrhv
         lxzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794349560; x=1794954360;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QTCujI8/h5TPqkOtaoAlRquKFa3ouHL2s5oDMvSTaAw=;
        b=eM2qrtbRLNomuza7h0ULhdxblfvJmAYDEmyh7K2UT72afjw9pQ2wiKwEmk+/xVlkqW
         ruwqqJL76fayepk17GPya8z07P5Nr1xqfoXe4npVojHfWJp4nziOvWni5AHlwg7VNdTE
         veEaTtMD7QeselyVevmLawkIEMWoiyNpcOfMYN+/34FRG2vtl97/TD03uTXJhHBzuE7a
         5eoSzaDPKB5SMvdqi8yJ91/Eb+9EVr2jlYEnjeh6VCszHqAUQS6sSMnojkdlCdh0b4ap
         xvNhY1KE7cMDxXimRqK4z55Mwkr71+Pb0iHxnMJVzrpwMKhihF+mM/hOl4F2VZBdjkwn
         l/Mg==
X-Forwarded-Encrypted: i=1; AL+hErGOCgoViNIoXvw1HutAQCffyXV8CRTTYWTc3Qx0GbcJGwr4n/YPY4gdINFKOWXMaJtAVzAHdi8z+A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8dK9TL3c8VYD/eKzhTkPVW2dG4a2h1gR3MU/MW/gwmmuLfe72W
	q/K1Si0ej9JJ10l3280ieEodqU23FEqK8OVHheMFUMVLk5gT1cuuhNNfV682l6MhmxKfotG6HYb
	O8PN9V+8oqU/0V99Uz5HDflg9L1r9AxTpP7OAWjCj2WA7DV1BW1b/oU44ey2tP4Wi/9huYQ==
X-Gm-Gg: AYBFou1U6DgiXXtqWAn2bZDz+ib5BUtOa8fvIo+w5QZdK5s14sMHlGhbuhTh4lNCQv3
	Ntv/VuyS5DCzMBfETR7c7muckbzaAp79rjWNDDz0AKYiNmaCITdXKQt1K6rLFpsPRNvzuese+d9
	GDDvCTQ5nbTk8m8hz4SVF8v/TtecPcdkw1aWLCbzCHdqE9pBROn6MAqn174r0OxwhCJkfBhgsrZ
	sR6EswoDPaDNCwC+ricxZxsYomUIm4rHNLhMhGCUDZWDibNuMO4o7w3CDhsl1euDM/lL9Rtz+8D
	S6TQhB970hoAu34tS3NYA37dvUgBJk7y53TcgRjnzIsSISeGAB3SLlZAfDFTHPwrMzbtOCuqnMy
	x36qr/RyYsSpOjTTeLeK9ZElXvoKy0dLWXVcJevZWAJyRyJhu79QKLpxyTFfPsTJzBa4PFJaP2m
	dbese4/1L5zzeQIb07PtYexJjgDfo=
X-Received: by 2002:a05:7300:6a8f:b0:360:e2e6:f849 with SMTP id 5a478bee46e88-376861732afmr893474eec.28.1794349559582;
        Tue, 10 Nov 2026 14:25:59 -0800 (PST)
X-Received: by 2002:a05:7300:6a8f:b0:360:e2e6:f849 with SMTP id 5a478bee46e88-376861732afmr893440eec.28.1794349558946;
        Tue, 10 Nov 2026 14:25:58 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfe07dsm9981992eec.20.2026.11.10.14.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:25:58 -0800 (PST)
Date: Tue, 10 Nov 2026 14:25:35 -0800
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
Subject: Re: [PATCH v15 21/35] firmware: arm_scmi: Add Telemetry boot-on
 support
Message-ID: <20261110142535.000034c8@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-22-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-22-cristian.marussi@arm.com>
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
X-Proofpoint-ORIG-GUID: JdB-mbt51wtMPlgtgruK541VLmL0wrBI
X-Authority-Analysis: v=2.4 cv=U4oHnuru c=1 sm=1 tr=0 ts=6af399f8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7CQSdrXTAAAA:8 a=xkoatq2HAAAA:8 a=vwVg_fRgSUVs-176lKkA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=CuNAHyPTimGbZf_9KV2F:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA4OSBTYWx0ZWRfX/0lOR5ZAUY6P
 zIiC8/cnT+x0rwICqcmjylYtumy6pt+iCs79O9515MqFYcNeX1Wq1sqhOC75ciowwqrmfOa2fTM
 TQBKQRx8l6hIuypD7lYcxXZvuxfZbA4YE/Woij7hyMf7b2GC2mF0IWDstvskVDAc96G5xjKxA0Q
 ZYWO6DAgZTlwqyNvHEduP3nkBoG656N6OYUffmTIDWiy6yAv3BBKV38eslVZT5t8X4MLhZY3zor
 2UDLD+Te12AFOuajdLvEvCRgMwnom8tm1DYaxNCF4qLRRnvwt8Kz7E1OXn1zkSC+UWQSz6KzkN1
 RxZ2D9I5R4pdNeK9YWj65X7pm3UNzccd2YvIOWfg3mmiscU2huoNkgM+JXufmoZqsTUvSlLmjWO
 SLjKCBh9SOgmg48Ag0YMK6wyWlVA0wpWbJKKqJOjU3FJKv+xWxSiNBISGzYhl/jMXpm275xvwF/
 biQuvZ5cM+cqG2vJSWQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA4OSBTYWx0ZWRfX63UUNuX6ghlq
 sDhvtsybgY/U2wcvzatGkMwbCCLM3bl1vEm3nAMCnnkhrdbTW1SuTfQCXMG1MwnBRzRYMID9p6Y
 3tGKkXJX63jwXLaT9xOc7hG6BNvJctQ=
X-Proofpoint-GUID: JdB-mbt51wtMPlgtgruK541VLmL0wrBI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100089

On Mon,  9 Nov 2026 09:12:07 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add the initialization and discovery logic needed to detect when the
> platform SCMI server is configured with telemetry enabled at boot and
> perform all the needed resource enumerations to keep the kernel telemetry
> subsystem state aligned with the platform boot-on configurations.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Minor things inline.

Whilst reading this I'm kind of on the lookout for things that maybe
could be pushed out to a future patch set just to cut down on the
rather large reviews needed on current set.

I'll address that separately when I get to end of the series, but
maybe this is one such thing that could wait.

Jonathan

> ---
>  drivers/firmware/arm_scmi/telemetry.c | 287 +++++++++++++++++++++++++-
>  1 file changed, 280 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> index 918067e225d5..2322348f98c9 100644
> --- a/drivers/firmware/arm_scmi/telemetry.c
> +++ b/drivers/firmware/arm_scmi/telemetry.c

> +
> +static int
> +iter_enabled_list_process_response(const struct scmi_protocol_handle *ph,
> +				   const void *response,
> +				   struct scmi_iterator_state *st, void *priv)
> +{
> +	const struct scmi_msg_resp_telemetry_de_enabled_list *r = response;
> +	const struct scmi_enabled_de_desc *desc;
> +	struct telemetry_info *ti = priv;
> +	struct telemetry_de *tde;
> +	u32 de_id;
> +	int ret;
> +
> +	desc = &r->array[st->loop_idx];
> +	de_id = le32_to_cpu(desc->id);
> +	if (scmi_telemetry_tde_lookup(ti, de_id)) {
> +		dev_err(ph->dev,
> +			"Found INVALID DE with DUPLICATED ID:0x%08X\n", de_id);
> +		return -EINVAL;
> +	}
> +
> +	tde = scmi_telemetry_tde_get(ti, de_id);
> +	if (IS_ERR(tde))
> +		return PTR_ERR(tde);
> +
> +	guard(mutex)(&tde->mtx);
> +	tde->de.info->id = de_id;
> +	tde->de.enabled = true;
> +	tde->de.tstamp_enabled = le32_to_cpu(desc->mode) == DE_ENABLED_WITH_TSTAMP;
> +	/*
> +	 * Guessing that, if a DE is reported as enabled with timestamp, it has
> +	 * to support timestamp: NOTE THAT the timestamp type (tde->ts_type) can
> +	 * ONLY be discovered later by  DE_DESCRIPTION.

Extra pace before DE_DESCRIPTION that probably wants to go.

> +	 */
> +	tde->de.tstamp_support = tde->de.tstamp_enabled;
> +
> +	ret = scmi_telemetry_tde_register(ti, tde);
> +	if (ret) {
> +		scmi_telemetry_free_tde_put(ti, tde);
> +		return ret;
> +	}
> +
> +	scmi_telemetry_de_state_update(ti, ENA_STATE, NULL, true);
> +	if (tde->de.tstamp_enabled)
> +		scmi_telemetry_de_state_update(ti, ENA_TSTAMP, NULL, true);
> +
> +	dev_dbg(ph->dev, "Registered new ENABLED DE with ID:0x%08X\n",
> +		tde->de.info->id);
> +
> +	return 0;
> +}


>  static int
>  scmi_telemetry_de_groups_init(struct telemetry_info *ti)
>  {
> @@ -1163,8 +1417,13 @@ scmi_telemetry_de_groups_init(struct telemetry_info *ti)
>  		}
>  	}
>  
> -	/* Expose all groups once all fully initialized */
> -	rinfo->num_groups = num_groups;

This reflects on patch 11, but using num_groups here was rather inconsistent
with all the use of ti->info.base.num_groups.

They are equal as it was a santity check earlier but I'd make a change
back then to use the ti->info.base.num_groups to assign this.
Then more obvious here that you have the write change to this loop.

> +	for (int i = 0; i < ti->info.base.num_groups; i++) {
> +		/* Expose groups once successfully initialized */
> +		if (!scmi_telemetry_group_config_lookup(ti, &rinfo->grps[i]))
> +			rinfo->num_groups++;
> +		else
> +			trace_scmi_tlm_access(0, "GROUP_LOOKUP_FAILED", 0, 0);
> +	}
>  
>  	return 0;
>  }

