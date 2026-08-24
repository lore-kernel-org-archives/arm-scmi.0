Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1794423E9D
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 13:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787578924; cv=none; b=E5EMfsMicOYf5GbRXYxinbUitRyvzPOi5o8dU5+4nXuokQP5JEg6qUHJJMAH+THTE7LchxrSkVHpabPRlxFKY8gkent29MMEJFUcWhtx7psFtz/MkVtWWXfuOppwl661n1bnB52zmG7gxpVfGMGHMG4xXHcHSDSPjlj3DOhvfNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787578924; c=relaxed/simple;
	bh=220sKSJfAH66EhAx6MKsNA3uJHuVRcM7xOCoY8od3n0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fbuA2fjuqVeYXkRhBSqu6UYFqNBpwRixsrILBSZBHrkxxAQeqb1SgYIeJgVmVmy1jRYnOyuWGZhrX/wZRkACxq235+R7vu3Xj0NQTp1N+J5CGJ6SL4cMbez+7DcYjHnSrbLG3zLSVReZGUs1jWtCWYkV4/5CHGXmgqHOtY9vM6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WeLnskcV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OM+pGXEK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WeLnskcV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OM+pGXEK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCuwIB3053511
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 13:42:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4nn3T1t/sB7+ffZyruvK0mZmx5y7OMfO+jTRwc/O4fA=; b=WeLnskcVZok8Wavb
	M2odJvv5d8hV/LD5NQp27uGONnXiEafmZkgE5sg4Sjf62xEqH6D74PlYl0xvO93k
	04Nf71ranEH5xPy5z0e3iywNAYhUMUYubaMk4JJuiaB96nxzuCr2V1j4tDc6E532
	QIvjOdRcqyjgE8N3Q8xqz+MfZ8Kji5dpI9gtXa3WF7BB0cDciV6AQbmcYwLgomM0
	ncmZVxqqqEhympv/jZRilWh5VIj+SUsAw6kEqxFmF9kaMZCtIjahq06Oli8t5Ztv
	dSrGJp+Q9Z56fnRzHeENNT5x3XMjMHLskW9MSF3lk3vyLfyR+sGuaN01L8jXNyxJ
	GVv6+Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88k7k1ec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 13:42:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3954def0191so6124723a91.3
        for <arm-scmi@vger.kernel.org>; Mon, 24 Aug 2026 06:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787578920; x=1788183720; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4nn3T1t/sB7+ffZyruvK0mZmx5y7OMfO+jTRwc/O4fA=;
        b=OM+pGXEKndGdb2eKbWcGMWHrc43pPutKa/fpI70ZTCXh3H0Sb30FMe9d++yGoEImTx
         K0rL4x2lwJ3PvWP+Mpzl9TvKtMA++doIeF/yFovYdEBj26Hcy4AVUiCPoZ4ZCQ7C+yZq
         RK9MWI6aNEMcBpfhENw5lQc1/po4oN1WC86kdJwwhAjpDkN0KdoEi2L4Qh1LGy5gFHCt
         dWefkA0ssQq1mJeBD3dZdx6RWu5ktc7ZsiSYXvD6+8wUWukOCnCDiY5OjIVzN7whRNRt
         LzcRCZhTLzjp5xNUQSEr2oaI2idDO0PBqGxvnWRADzxpevM4SiPCSTaEjS5r64UrQsgQ
         RMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787578920; x=1788183720;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4nn3T1t/sB7+ffZyruvK0mZmx5y7OMfO+jTRwc/O4fA=;
        b=RgBeS+KXi2R7nJIlQGo44TJlmGVcOOIX5WSds/amWbqvFHJa1XXrtljxwyPA5vqc8Z
         I+rhhyVSGA9dYNvAwVovQFvrtcbre+hwQOeAi33Q2ADDGfPtm+4DnpX3COuHEMWLJY2P
         Xf3uETNpnh9PBT/oIdPFJysIeMpl69HsGRFv6jGmDD/mYTuyEc22cv5Tki1DCM1Hv+qW
         6sTaa8P5ZijRVdRsb84zXbqc52kzS/7eloIOeSod7LVpOZ89Y+ySEDwiyklFdcsi1+gt
         2lKnoaM+OxCn/KfdYPo5HJa8ahGDBJwU4GR4ZEI2trFMX6QXKtLCZYGU66DHJQvl8M4t
         jEPQ==
X-Forwarded-Encrypted: i=1; AHgh+RpoJTpoKKPcKhLnTINDHfXkjarfjuiRtLZDAgB2f2W4AqP65h48172MX5iwjNz4t43bZV2v2ZkpxQ==@vger.kernel.org
X-Gm-Message-State: AFuF++k7XOphsfp2j3e8sMC7q7gOsotxfTYeo0yIjQLqxuSpgN89YXAx
	TRF3HijfdBYLaB1kgwFq11HbBGae8+JR1t0vVQQ8zY/zfi9zA2COn4WhOv9oa8y1X9Snfc2g1Q/
	SCSDjBf8DXxuEeSWCvqdYdmfKcMRpjKSPT5vQBF4BfJBciGnYsk/5NhiUHoT5Eg==
X-Gm-Gg: AR+sD10ZYjLFI6KlnuYJ0dHZNXzNc7irGE7fgNagRDvx0n21r7ekq40JktTdvRv/y0z
	pERdytPDytESqkbbwkZolyz3lEcNn6/pCfwclRk+eBUlBUG2w5/i9QQ1qE6LdyLgxIY+6nG51mP
	0CixEeg51sDz81JA7fGaQ1Ch3nH8xM9HTdTEihiT3iaMyHKpvS9jlsHDiMS96dRfnw73EAdpdaW
	OZF3+X5Xb02mYlbAoXxInsm4H+p+V3yXML+IVJAfL3lFnnYRgKp8GR/DjykmMVe3NrzbfFd9qMu
	GQx2bSlDO3RwUOs+C2qehWmwOlOyq+TP02qsMYB3spJ3iIz8dboq5jcYXGt17jyfZCp80v2nisA
	IsfdkWzPvsM0WvwponVUL9ALi4PuKzZcvAP4=
X-Received: by 2002:a17:90b:1b41:b0:383:5a16:bd70 with SMTP id 98e67ed59e1d1-395c39f97e8mr42709374a91.16.1787578920178;
        Mon, 24 Aug 2026 06:42:00 -0700 (PDT)
X-Received: by 2002:a17:90b:1b41:b0:383:5a16:bd70 with SMTP id 98e67ed59e1d1-395c39f97e8mr42709251a91.16.1787578919646;
        Mon, 24 Aug 2026 06:41:59 -0700 (PDT)
Received: from [10.217.218.158] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e42d6139sm10107597a91.0.2026.08.24.06.41.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 06:41:58 -0700 (PDT)
Message-ID: <8af7a34a-da4f-492f-a51c-cc420edc5e6e@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 19:11:51 +0530
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] i2c: qcom-geni: Use geni_se_set_rate() for setting
 source clock frequency
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-7-61171ab1cdce@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-7-61171ab1cdce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b4iCJNGx c=1 sm=1 tr=0 ts=6a8c4a28 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=bL_AZauQwEGehf-WiMEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDExNSBTYWx0ZWRfX2ECYTlpz7rXO
 LwGG77fqBLU8KISCL8EP9hW+8NZz/jdIjtKMv0x86CL6btQbpAySIN37deJCerSjF3ylXC1uzX5
 HzUD24B4eWxOwhM2eowf0r1y+46FpeQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDExNSBTYWx0ZWRfXwXJc6BFKI0tD
 EG58jWOQw9r+2AvYaQNHyDUfGM8M9z5vBwjOS+V/S+Kv3OaiQ0x2R2fYJh3M9gb6iohGyC8+yNC
 DWeXlhmoCFBJGmjJXe7oiOjOTDCLjFvfGMld0i34dqjLfqCGg34iiTTjrXXIlJD1lk25elWqdFI
 n+TTjTeuNfFxMI7lca2BciT+U94+aUSHebfrUIVTtrF7ndc9d/LJtCsqyFdn3G4xyBZzK7dy1rk
 AMbq5zpfzWFnoPP6vrGuCWe4dhoLlNT8D8qPH+Irx6q8AmJGzRVT3oaRGEv40KdTidxO05omuDU
 bzIgYSKEahZyZnwyoGqdC8JG+cDT3hsvVnIbmH69dfPrVpVnZNAAjr6YPlhTdheuFfjIYt8zuEz
 uATxc9dlpTfBwTKJs+6acpDfLdkVaPdn5v1M/uz9r47npf03mLBgmNk7JJwXijPjw4SvwFgQVUN
 rWXG4HLwnpGz/+A3KiQ==
X-Proofpoint-ORIG-GUID: aRsDFe30622i9VaWwhB0STibQRvB7ssK
X-Proofpoint-GUID: aRsDFe30622i9VaWwhB0STibQRvB7ssK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240115



On 8/5/2026 1:27 AM, Praveen Talari wrote:
> On the SA8255P platform there is no Linux clock handler for the SE source
> clock; resources are instead managed by firmware via a genpd performance
> domain. The I2C driver therefore relies on geni_se_set_rate() to apply the
> fixed 19.2 MHz source clock frequency expected by the SCL divider and

somewhere it's 32 MHz also and this may change too ?

> counter values programmed by qcom_geni_i2c_conf().
> 
> Call geni_se_set_rate() directly from qcom_geni_i2c_conf() so the
> configured frequency is applied to the correct device (the perf domain
> device on the firmware-managed path, or se->dev otherwise) without the I2C
> driver needing to know which resources_init() variant is in use.
> 
> Drop the now-unused set_rate field from struct geni_i2c_desc, the
> geni_se_set_perf_opp() usage on the SA8255P variant, and the unused freq
> parameter from qcom_geni_i2c_conf().
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index a23554d101fd..4561e2d235d5 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -213,11 +213,11 @@ static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
>   	return -EINVAL;
>   }
>   
> -static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
> +static int qcom_geni_i2c_conf(struct geni_se *se)
>   {
>   	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
>   	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
> -	u32 val;
> +	u32 val, ret;
>   
>   	writel_relaxed(0, gi2c->se.base + SE_GENI_CLK_SEL);
>   
> @@ -233,6 +233,10 @@ static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
>   				 itr->clk_div, itr->t_high_cnt,
>   				 itr->t_low_cnt, itr->t_cycle_cnt);
>   
> +	ret = geni_se_set_rate(&gi2c->se, 19200000);

hard code ?
May work currently, but if higher frequency support added, source may 
change.

Also you have added in commit message, but add a comment also here.

> +	if (ret)
> +		return ret;
> +
>   	return geni_icc_set_bw_ab(&gi2c->se, GENI_DEFAULT_BW, GENI_DEFAULT_BW,
>   				  Bps_to_icc(gi2c->clk_freq_out));
>   }

[...]

