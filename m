Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445247;
	b=2ZCba+AI2Ds1hdN9FJcQX24PNKQ2Gq47F7FL5ikrBGrOJpYySGOTQjFnVOogo8hUCQDQ
	 8ufZnXT4h5iMSQ/Wsy+RfVt5fpbH37FB1dDfCbJ7RiiRk2GGliTqcFKUjZ9iIQO9TAweo
	 RVj6ZZ/XNqrAdjbhRne3EQycwkNPXhfFRop4/yZuWTuCGHwwSM434NPAlRYv5YDOBQzxZ
	 V1PD1YR1CT+BO6m8ytAngPNRz159O8OUwSU+IZbVrefWNgM8qHbOjVN+MUj2lfBqm0qrw
	 JaIvBpo1+xvueCV3wZIFrzxVoeTRWVV7nEFWeeEYZpc8eufWetfPf/mZ9pnJ5n5cmzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445247;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=L47P3Zpg3RMSsu5NECVxz4OxMZT8bD2P1rs9Ujh18GE=;
	b=Ixnp4VCt1z3HlAdhTGwQJhXR0K7+be/tHGKRCikAWWi8jp/16lcdcsAMFS90gaRLwtpw
	 o9v8r0dpt2GkRT0/wNm4iW2Kjh+qhEPGj3mNYjpxuTD5EXXi1Y3ycxVfbQulZome7Ip3o
	 dyvotxCDw1o/WETFXjAqOVdH+//ymSNHrZy9ZimPcF1nhF8Ncv+i8+ZLPxLnXaZ9fkYDw
	 6mxuh/z08/lTUg3mk2XuduYchAKqnX0jvjqmyWVzIOsRWRpryeQU6g7jCHY/BnSnCefBi
	 WlePZ7bifIsQB/UJ0pSfQ0FaqPBA1Y9p5Ib6PL3yllQyjO5Z/qtDmetgkmH1Cg76isw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZXOYYKIj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WLPnpNon;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267CD606A31C
	for <arm-scmi@vger.kernel.org>; Mon, 19 Oct 2026 21:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 267CD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZXOYYKIj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WLPnpNon
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JJJsK53103231
	for <arm-scmi@vger.kernel.org>; Mon, 19 Oct 2026 21:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L47P3Zpg3RMSsu5NECVxz4OxMZT8bD2P1rs9Ujh18GE=; b=ZXOYYKIj2T/Npqpv
	PnkgJ7GEH1Tqih+lwDXBB4G2XecFMot/BMs7ml6A+WSxz3cQ6iaQnqVOr2mfZe3I
	1CQoPkhjBC9V7ugFQfEJBQz+jU3VMqUE3+Zqozukg3EHlMXASVBvPV98XRw/vz4M
	8tSSx6bOSW2/cRjDAZlOaOY9B4sIP8h99EGCo0IzCWEZxbmwXGQ9YTtDY946AYkr
	y73qdWbw54Q5ehuaCPxISXwGCwIzczaoTRMzyIFEI0aw8p87spYDxn4pCex4nNcD
	UULwrygIBy3iuQ1h3IMMS/v8Y0fKetMJH6d88FTI/zZI+ak8JvtKTp2iOSKE1Ca1
	pL3W3Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdr4q0pcx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Mon, 19 Oct 2026 21:27:25 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3552883bd19so7015829eec.1
        for <arm-scmi@vger.kernel.org>; Mon, 19 Oct 2026 14:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792445245; x=1793050045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=L47P3Zpg3RMSsu5NECVxz4OxMZT8bD2P1rs9Ujh18GE=;
        b=WLPnpNonhF7t/zCjlIhMUosjhpzYRk3/XeCF18exNUiBLbuXPToJRx81pK8n1lQN8l
         fPV/qN7wwcozJBA/dsy1NQx2b6dUh281ukn5M6aImMoJjsnIiZJJ0Hy11gAydBDPpGwL
         Yi/NcYnXBDt89Jhuw4Vf8rKRUtSYwaVH6i6OOekoqqON7XFNnJJLaj83dD+3ITkXaWU2
         FnWtDZD9uuuQ8fU0zlo2gPdUzPrqT1wnEobP9mFZvxY4uaXRTuCnVeIEvMf9PdJfUk02
         lasPSEFr9n/QJFvXPn8qfwTO9FJ9vk5FyaLm7PtLaiqnP+ISR8KFESaxbZLSONt4Bf8N
         nKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792445245; x=1793050045;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L47P3Zpg3RMSsu5NECVxz4OxMZT8bD2P1rs9Ujh18GE=;
        b=Ewaz+Q0CwqIRGABWI5DH/8NZFk1tdojz/DKIqZOYzWYkvX6uQf7B1/4bu3UE27SOcu
         2nC5fuigf6uqEDKDWKjprYvAaSw8Gg1J0U2SuAonkU96+7CVcXVsI7Om5Mpq8sc7YTUe
         fPclN565yIvsCG5dprhtK92daG1RF800r7LMr4NI6rH+Xb/ed9AYmdXdTXQMYVfZK0Jl
         317EG+7UsUzjveh82bIoJaaz7JAFFKIUajDolbDE1S0dKVv6Xr9LB4DrzYKzSKOVe931
         EnoZRKMJYJT2FOnOyJjBeWdeuk6Uzyx1HA8+8puWggl7MR4ttkbMC7e3VbwVk26UF2C1
         g/7A==
X-Forwarded-Encrypted: i=1; AKwUvBxzuLE4o5LSG9WTSJuSoHtK7zGB2skO2VuM0wRmHIasaIT3s/b9JpnDeyWLBowyclCNIIfdu6N4Nw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKDLbsehm6VR2Y+6KQyHeWwBFT/ZKDxFbc95ja2Vzb6E67F/P+w
	owdUMA5z8/9/jdjssrbSd3ak8chEXDzzfkzu6PHxqeoTMNR6ledQP6PsBfi9WH+99xIbJZpsSGb
	Q/6p2ipaiZ25Loq1/5eVDA1897y72S1Y9JAmZZzWkR/efL99ntQbJMhrup4I+7A==
X-Gm-Gg: AYBFou2gWZnm/ITXpN5AnvEaXbZg/q2jQtgTzR+o0Kf08G33wuYx5HPztQQdN85J47Z
	BaOVqcju7zOICZ/mh53TqJsKPJMeNv2KRyI1BKUYraQb3NgGs7R3jNP6Zjc1Ocx248PSGYh4hXc
	7kasD1oqOE8Wwtf6AF8AQCKeQmgs7RjvEf4W+Xt/fsmItQKmx4dzDa873TwjRiDm5gHGys8DT+a
	DHe/ZilMApfKQugh51aXMMf6IqKZej+5e6AeBcgH+tizr7b2EE4OF353u8iimHGSE7/hQPpU6wJ
	fd8pKFcgcNxmmkQT2jtdqL0sWgYVK0F8Ie1Dy7ApfdEcCjCwNFX3eS0Gk3kvOesLyW1X8mKGEle
	njsI/vozzsCLnGx3gU+y1WWjnXmpXxwGKj4O+Z3WHkA==
X-Received: by 2002:a05:7300:768c:b0:35e:a117:8fd8 with SMTP id 5a478bee46e88-361a18603d7mr18625586eec.17.1792445244475;
        Mon, 19 Oct 2026 14:27:24 -0700 (PDT)
X-Received: by 2002:a05:7300:768c:b0:35e:a117:8fd8 with SMTP id 5a478bee46e88-361a18603d7mr18625532eec.17.1792445243837;
        Mon, 19 Oct 2026 14:27:23 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819bc569sm33491810eec.11.2026.10.19.14.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:27:23 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:27:19 -0700
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
Subject: Re: [PATCH v14 07/32] firmware: arm_scmi: Add Telemetry basic
 attributes enumeration
Message-ID: <20261019142719.00003b78@oss.qualcomm.com>
In-Reply-To: <20261016185553.2794459-8-cristian.marussi@arm.com>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
	<20261016185553.2794459-8-cristian.marussi@arm.com>
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
X-Proofpoint-ORIG-GUID: U3d_dPF7KPU6EyUmWsuy5wJtCeX3ylG7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA4NSBTYWx0ZWRfXyKJd6h9XQJqc
 4mkJkWU3Ju/XsPJywRZ/uY8s1Fra4n/DvmMHynx0L0RePUF+HE+j2hR4E138qBsaTws5xHNhnGI
 Y+1Wn+ydUF2N2w6Ugcn/8cYcBIjFN+4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA4NSBTYWx0ZWRfX9W/mOCSZ4Iyv
 EsGgokhrNftQLRNeushx61YyvwVf4xX6HgPyf21YqU4k+TGqEL2gXfu3wDHYE/PDMf+ySS4PE4m
 IAc1fCAXNse3mVv5HaU9GBy+JA1IIKlb+83JLkpIr95+WkEepp1jWJBhbPLWKvzzOd0UwTK9P+k
 TF2l6UPv6XqmuL3MZtiaR7veFIVnEHR+IAY1DU5U9+HNVE3Piqtvqv0ZOMsto1laYpLr/Uns9Or
 sxBChGU5O24P7POv3KBcwAaGDHdusBEpU9W4p63ETD1wVJj2yHkHHUpXH2k2cufeOI46I4pjsan
 IlF/mTiVRRAo9yCISC/FDCkbNsPYGusA+IPsKc8CFvq5+Kv7qWxMBgEHuz9AQvNsK85TU0Z7+oV
 8Wo+gTCah9KC0saZj4uWSk5jVi4aoC5aYTKzdGA40ovMpXe3wzEHM26S/A7G4KKDfM/t+86s3K2
 TVAcmpYM96H4H9bHbIQ==
X-Authority-Analysis: v=2.4 cv=aqsnmiZV c=1 sm=1 tr=0 ts=6ad68b3d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=T7b44NXcgtRVRp_EcVYA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: U3d_dPF7KPU6EyUmWsuy5wJtCeX3ylG7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190085

On Fri, 16 Oct 2026 19:55:28 +0100
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add SCMIv4.0 Telemetry basic support for minimal initialization and
> protocol attributes enumeration: expose telemetry instance descriptor
> via a simple information retrieval protocol operation.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

A few minor comments but nothing I care strongly about.
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

>  #endif /* _SCMI_PROTOCOLS_H */
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> new file mode 100644
> index 000000000000..32f6f8d1106d
> --- /dev/null
> +++ b/drivers/firmware/arm_scmi/telemetry.c
> @@ -0,0 +1,148 @@

> +
> +enum scmi_telemetry_protocol_cmd {

Perhaps add a comment on enum scmi_common_cmd containing additional values
that apply to telemetry.

> +	TELEMETRY_LIST_SHMTI = 0x3,

> +
> +struct telemetry_info {
> +	bool streaming_mode;

I'd bring fields of internal tracking structures in only when
they are used (even if that is just setting them).

> +	unsigned int num_shmti;
> +	unsigned int num_des_tstamp;
> +	unsigned int default_blk_ts_rate;
> +	const struct scmi_protocol_handle *ph;
> +	struct scmi_telemetry_info info;
> +};
> +
> +static int
> +scmi_telemetry_protocol_attributes_get(struct telemetry_info *ti)
> +{
> +	struct scmi_msg_resp_telemetry_protocol_attributes *resp;
> +	const struct scmi_protocol_handle *ph = ti->ph;
> +	struct scmi_xfer *t;
> +	int ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES, 0,
> +				      sizeof(*resp), &t);
> +	if (ret)
> +		return ret;
> +
> +	resp = t->rx.buf;
> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret) {
> +		__le32 attr = resp->attributes_1;
> +		__be32 de_impl_version[SCMI_TLM_DE_IMPL_NUM_DWORDS];
> +

> +		for (int i = 0; i < SCMI_TLM_DE_IMPL_NUM_DWORDS; i++)
> +			de_impl_version[i] =
> +				cpu_to_be32(le32_to_cpu(resp->de_implem_rev_dword[i]));

That dance is a swap as data is stored le but UUID fields are be.
Maybe going via cpu endian is fine as would be silly to have le32_to_be32()
so it perhaps has documentation value.  Fair enough - I argued myself around
with agreeing with how you did it here, but left the discussion for anyone
else who has similar thoughts.

> +		import_uuid(&ti->info.base.primary_revision, (const __u8 *)&de_impl_version);
> +		ti->info.single_read_support = SUPPORTS_SINGLE_READ(attr);
> +		ti->info.continuous_update_support = SUPPORTS_CONTINUOS_UPDATE(attr);
> +		ti->info.per_group_config_support = SUPPORTS_PER_GROUP_CONFIG(attr);
> +		ti->info.reset_support = SUPPORTS_RESET(attr);
> +		ti->info.fc_support = SUPPORTS_FC(attr);
> +		ti->num_shmti = le32_get_bits(attr, GENMASK(15, 0));
> +		ti->default_blk_ts_rate = le32_to_cpu(resp->default_blk_ts_rate);
> +	}
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}

> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index 5ab73b1ab9aa..121c83e1c6d8 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h

...


> +/**
> + * struct scmi_telemetry_proto_ops - represents the various operations provided
> + *	by SCMI Telemetry Protocol
> + *
> + * @info_get: get the general Telemetry information.
> + */
> +struct scmi_telemetry_proto_ops {
info> +	const struct scmi_telemetry_info __must_check *(*info_get)
> +		(const struct scmi_protocol_handle *ph);

Why __must_check?  Be a bit crazy if no one did anything with the
info they just requested, so that seems overkill and doesn't help with
the long line.

> +};
> +

