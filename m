Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794276480;
	b=O2DJ70MAJzdVwkw7fE3R69mC+KPgBwA2kD0LBKwLNPGysRLeV6Tna2xJ4h6iXDUDzwsP
	 Sz09EzFmbTJpMEdgsZvz1P+oud5SscA23kQ75hIiX9CS8hrHPp8oo9D39HbpjIDIIqE/V
	 MvwURWe4685cGqMj2LaE0pnLQlOL/hydGSmAatGPVeUFDEzy3SpX9YhxGrtC6bciO6ZG4
	 QaxAKoySdRg7fdKhKUwI9y0Ety+neUUuU2tyWS9yed3lZc6vyX0i315J/alB9SW7edzyy
	 M5IFXYKeO93V5QmIg89gfPTjKDxiw2MjYCEmDw0DTBjxcVA9x99fTdkpAqOshTbNoKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276480;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Gzh0jbXLioqQjgqKAH32s/RDc3mnON1vZDCgrDAnmOU=;
	b=Fuo80G4r2DW8qMWu9mx+zj5KKZSBcfAIjusa6C83/MtjLdCLn95h6Emg10+VxqbK+t0e
	 5T0/fC1/PpaefubqhRrElTwrBiiepq+yZtBJvyYJyszRVNCSknitlaN/yYwALXu+1C775
	 +XrL4oMDoek8tH4q4cmsinFfrxEAhpL4kJYGcw5w8j9pZRhH9ocA4H9q23lR2cy2wXSZF
	 1clMiaSD2LDw56EWMP78g9LuiVJnje5Dk5XedD+3vklqdK80dHbEa0eTUTYaww91P1C/s
	 RqPMC0VdR5lqMHVIbpaA48XFayaO5vyTiY+Z3gw6pqgOQGERAviHgpareVlNojqjQaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mm9NkHN6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eLPLNYtj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7763060A2601
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 02:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7763060A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mm9NkHN6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eLPLNYtj
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0jLR31854102
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 02:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gzh0jbXLioqQjgqKAH32s/RDc3mnON1vZDCgrDAnmOU=; b=Mm9NkHN6Zj756Mhy
	mSX1hHZcKC+vcG5YLjqGOa5t+mJxEXGCK2zfLfPBDmsxiQ/MehoccxiCria080oN
	bkYpObyiygb/TnV68u+OOYaB7iUT8Pw4YhuRBzmKlsr/f77wsfV1xLGoyuofOE1Q
	cvPjEyxsUZIk0sN75d/r/oeeFh6MjrQjf9VXbTId3lTOa7lnOdjJW1X4Szua5bfI
	fmI6n6BYE4hnUWF4ev35kGreXzpT0OOnI8Q7ei5nAdXJmd+h9Bzdl8Mq2QCnilyS
	zIOJL297SWPq0u7MMzRQCwqfnj+AmPyWPLa/f+nlKeJv1mGyhDIejbJtB2R/ahBZ
	NpRV3w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2metu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 02:07:58 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36d1353fdcdso813624eec.0
        for <arm-scmi@vger.kernel.org>; Mon, 09 Nov 2026 18:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794276477; x=1794881277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Gzh0jbXLioqQjgqKAH32s/RDc3mnON1vZDCgrDAnmOU=;
        b=eLPLNYtjfhShMTjdtQSuobm+92iNjNjsMgpwcCQiWSavcphETKxVUYkLrUMVGHcCFT
         FhlZBH7wm8YaE/zrgBzRweWDXogYcRbLPHceaVDFR5yrBgo6wG8Rz4Xllyp4uNfk2Hqw
         0gpGtcUjDkWyg+FJ9Y0WvHKoQXqwzvQYsH/U/JLCAFG11m8htLTAD2NvswRs6qoRJW32
         z/JL2ZTTmsGA6T9s1lsJHLFuvxUh9GFIm6TWwmzSrbRW6MaJqmvLOPXn5Zaqcl1PpNf8
         wj+PX/VCs0GZicIp2nSCeEc8Fajo/KH7yjYUbczOJXR9O9hkNITlU0pukwt2FF8WxXrf
         dF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794276477; x=1794881277;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gzh0jbXLioqQjgqKAH32s/RDc3mnON1vZDCgrDAnmOU=;
        b=Gzus4Zie0ndTCt9oCId5+kv5FseTrANWxp5b1BYtzWq+o4cvxU1x1wsOnWbZgD5w+3
         EjepqMSxMKVy+xj8Zg2ztN84SxT42Xzx+4bZDHfqQ8u8ToviuZNV2LrCSqP+9/WwGoz+
         EPk8QqK67ucFkSo49lMzW70oXJ/AvY8liQIZrYNdioUCkTZctPkUiv+WOzkqhLegcng1
         amErlyhxhXkHQmWnwA4lgiS6QWw4qfB2alVh0v+BeVvDYskQRm/L9iZBJaLMJyxb+YL9
         lKbQRtOuU0IwMd77T1Fl85nqgXccNVHs/1To8M9sId1URqTT0OIINTTEB6V7505KeIY0
         wtEQ==
X-Forwarded-Encrypted: i=1; AL+hErFVNtKKC6eOEYrGx2UGUoxo92X2fHoZzsuNiXCxmtQxFwNPNJ1dl2NTJ35ylJbhOQuKOHI12DYlRg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+OQW6wtrKDIJxsLoFu41NAkbEdhnf0y/mVg60a+N2G+jPyXscH
	8diOlQKNQ5YlCXnf8CR7JNg/4xjMkDbAnyTBRfAxlrqTC5kfXMPbusLmqR5kdj7ObmCbP+rFhEd
	KNSjH/IlcJIYmz1dHDZ4OdtVfAZLbXLS9bywCnfbmdaryG0v0t2VI4t924aqY5g==
X-Gm-Gg: AYBFou2hcqdcbAPxReIKqHojv9YK+mAB7Qh+c4iHjqTjKc5rRdTGyM05j7muduf9jBE
	+79DWVb5mJReHy3xF+hH5q7u1jSxgEl5tQ6qbZRFGFVStl+M2kp2QWqrE4IYsYzl3zHl7PACqi2
	b9Zia1EmlKQoHQH1/fdE5P+6ovBPm04dH19BiGxpngZt7vPKT6n5+otKIj4R4kjcdwNZr/dD7g9
	3JtUKBtfh8+gRqqIoSzWyDaKGjT73IVUFJXFnG9y6BtYfn1c4FnQSU0UDpRkX+FPauMC4z7y922
	aee6lD5oArN7gicfVuXP+tSTPhDndh3bueVmnVZOVIhyJHsJoTAJgWbDKD019mCpLswPATM75r6
	pBSqMxKU750CmnNIJVqtMgKdThzhb2nqKVI4pHgsNp7wH5OCwi7q01f6+80C8Er+ECwlQ7Kw7AK
	+sLhA6M5jhVv0+VAIVFOnWXju/ig==
X-Received: by 2002:a05:701a:844d:20b0:18c:e014:6f1d with SMTP id a92af1059eb24-1b3b5fa29b1mr1724893c88.1.1794276477146;
        Mon, 09 Nov 2026 18:07:57 -0800 (PST)
X-Received: by 2002:a05:701a:844d:20b0:18c:e014:6f1d with SMTP id a92af1059eb24-1b3b5fa29b1mr1724846c88.1.1794276476426;
        Mon, 09 Nov 2026 18:07:56 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm3158465c88.4.2026.11.09.18.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:07:56 -0800 (PST)
Date: Mon, 9 Nov 2026 18:07:50 -0800
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
Subject: Re: [PATCH v15 12/35] firmware: arm_scmi: Add Telemetry update
 intervals enumeration
Message-ID: <20261109180750.0000150a@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-13-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-13-cristian.marussi@arm.com>
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
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af27c7e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=M8WuIlgHp6E56V_sPrAA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwOCBTYWx0ZWRfX0i9JEElwi6oM
 fiUjavtj1hUgg7u6F7YPuGr4m7USEvM3qsWt6Yj6DBoJj1TVT7Q+Yw6tI3TmMRdXfaXUoBi5Gya
 8ZlnuEQHaAnLO++J5aAOUddZw2OCU6GlrRRPIVc8zE2y7tLZUUYNFh4+ZhyrDexv1/jPp8Kf7jv
 dntyNdIxJlXyi3nD7b2CXKXzuLTV6WB20JlNJCzSbT80MN62WR63CvB7KO1HaV1pYInqWpreK/e
 JMqJsqpBM8CZNxIlMgSiCKoOIhI0q5Ge1ysgIZ6T9OBrIp9qsWFf4og6lc3tVp8Oq+fPNGag0Ei
 CMzdNhbQN6gxxzrDCeCOLobq053ZPzAY9s4Kvk3J04mBtO6gcKC1haeL+aTC6OqY6Kfd0uAv8BA
 /Xi5MEDX3vJw1JNGK6Kqhtl0xOxECVpvTscAI9yzwYQEJFoLKlWpe62MoGRNKtwp6LjkWiBEgbO
 SJ6JBbogKBqlBcVH2Qg==
X-Proofpoint-GUID: J1kK225-7Cxt6H_ccGNDfX21XHv4vxIy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwOCBTYWx0ZWRfX5wUH+jtRZv7Q
 nUf+HLE3yRkfNTldkE/Tm3QBZpLgCeimqoDK8ktIT5BoHS/teMhnQcFeqCOQQMtCc+kQC1ZlRDX
 jG9uJVdaW/uZNaOKqle7AGBTRKGHDpI=
X-Proofpoint-ORIG-GUID: J1kK225-7Cxt6H_ccGNDfX21XHv4vxIy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100008

On Mon,  9 Nov 2026 09:11:58 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add support to enumerate available Telemetry update intervals.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> v14 --> v15
>  - removed unused dev reference in interval parsing
>  - added missing initialization of intrvs->grp_id
> v13 --> v14
>  - splitted out of the old Basic Telemetry patch, contains the
>    update_intervals enumeration routines
> ---
>  drivers/firmware/arm_scmi/telemetry.c | 198 ++++++++++++++++++++++++++
>  include/linux/scmi_protocol.h         |  21 +++
>  2 files changed, 219 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> index 9944506652f5..e57534c93b26 100644
> --- a/drivers/firmware/arm_scmi/telemetry.c
> +++ b/drivers/firmware/arm_scmi/telemetry.c
> @@ -92,6 +92,21 @@ struct scmi_msg_resp_telemetry_de_description {
>  	struct scmi_de_desc desc[];
>  };
>  
> +struct scmi_msg_telemetry_update_intervals {
> +	__le32 index;
> +	__le32 group_identifier;
> +#define	ALL_DES_NO_GROUP	0x0
> +#define SPECIFIC_GROUP_DES	0x1
> +#define ALL_DES_ANY_GROUP	0x2

For previous defines like this they have followed the value they are in.
So I think these belong after flags.  (That fits with common practice for
this sort of thing which is why I looked).

> +	__le32 flags;
> +};
> +
> +struct scmi_msg_resp_telemetry_update_intervals {
> +	__le32 flags;
> +#define INTERVALS_DISCRETE(x)	(le32_get_bits((x), BIT(12)) == 0)
> +	__le32 intervals[];
> +};
> +
>  #define IS_TDE_TSTAMP_TYPE(__t, __ttype)	((__t)->ts_type == (__ttype))
>  #define IS_TDE_TS_NONE(_t)	(IS_TDE_TSTAMP_TYPE((_t), TSTAMP_NONE))
>  #define IS_TDE_TS_LINE(_t)	(IS_TDE_TSTAMP_TYPE((_t), TSTAMP_LINE))
> @@ -693,6 +708,176 @@ static int scmi_telemetry_de_descriptors_get(struct telemetry_info *ti)
>  	return scmi_telemetry_de_groups_init(ti);
>  }
>  
> +struct scmi_tlm_ivl_priv {
> +	struct scmi_telemetry_intervals **intrvs;
> +	unsigned int grp_id;
> +	unsigned int flags;

Given these are fixed size, maybe u32 for each of them just to
make sure that matches up.

> +};
> +
> +static void iter_intervals_prepare_message(void *message,
> +					   unsigned int desc_index,
> +					   const void *priv)
> +{
> +	struct scmi_msg_telemetry_update_intervals *msg = message;
> +	const struct scmi_tlm_ivl_priv *p = priv;
> +
> +	msg->index = cpu_to_le32(desc_index);
> +	msg->group_identifier = cpu_to_le32(p->grp_id);
> +	msg->flags = cpu_to_le32(FIELD_PREP(GENMASK(3, 0), p->flags));

Need the mask?  It's valid but I'd expect the protection on sanity
to be at the point of p->flags being written rather than here.

> +}
> +
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
> +		intrvs = kzalloc_flex(*intrvs, update_intervals, inum);
> +		if (!intrvs)
> +			return -ENOMEM;
> +
> +		intrvs->num_intervals = inum;
> +		intrvs->discrete = discrete;
> +		intrvs->grp_id = p->grp_id;
> +		st->max_resources = intrvs->num_intervals;
> +
> +		*p->intrvs = intrvs;
> +	}
> +
> +	return 0;
> +}
> +
> +static int
> +iter_intervals_process_response(const struct scmi_protocol_handle *ph,
> +				const void *response,
> +				struct scmi_iterator_state *st, void *priv)
> +{
> +	const struct scmi_msg_resp_telemetry_update_intervals *r = response;
> +	struct scmi_tlm_ivl_priv *p = priv;
> +	struct scmi_telemetry_intervals *intrvs = *p->intrvs;
> +	unsigned int idx = st->loop_idx;
> +
> +	intrvs->update_intervals[st->desc_index + idx] =
> +		le32_to_cpu(r->intervals[idx]);

I'd go a bit long and put that on one line.

> +
> +	return 0;
> +}

> +static int
> +scmi_telemetry_enumerate_common_intervals(struct telemetry_info *ti)
> +{
> +	unsigned int flags;
> +	int ret;
> +
> +	flags = !ti->info.per_group_config_support ?
> +		ALL_DES_ANY_GROUP : ALL_DES_NO_GROUP;

Why not flip the condition and reverse the values?
This thing is weird enough I'd add a comment or rename them
to be more helpful. ALL_DES_THAT_HAVE_NO_GROUP for example.


> +
> +	ret = scmi_tlm_enumerate_update_intervals(ti, &ti->info.intervals,
> +						  SCMI_TLM_GRP_INVALID, flags);
> +	if (ret)
> +		return ret;
> +
> +	/* A copy for UAPI access... */
> +	ti->info.base.num_intervals = ti->info.intervals->num_intervals;
> +
> +	/* Delegate freeing of allocated intervals to unbind time */
> +	return devm_add_action_or_reset(ti->ph->dev,
> +					scmi_telemetry_intervals_free,
> +					ti->info.intervals);
> +}

>  /**

