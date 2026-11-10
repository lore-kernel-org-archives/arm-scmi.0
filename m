Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794351719;
	b=S9fcAoBxEyXQSlfqFKKjRqeAIyM6E2MRq8WR3lrLIhJbS2rlrOL2oRETIPb9NJgsEU2u
	 xwy71uLZ59OwFgXqB+g6arrEPHAihcmR+zCi8fYgeR9W480Ci2q4FXmxIqNhHDOkQg3Tm
	 npAPZUyouCZX9RPHsSavq02YAXuWip6l1eEx+Lc2fCasQ4cw7QQH4sIyhpvLpB5qYnRVi
	 u3hjSiiwn/y+vZFiz8EJzYpGsv6sokAm4Ec0a2JhEbt/dYJL6X5uw/E3a2bmnv0zjAeKf
	 xq1RwljZZ7hM/yrTCC33DQdxfPVC1uC4U9PyzugD/WlCgA6yHuv4ETYYzYH6BVT6Zfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794351719;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=x99lRuyCSocza6M3mwe4fqI7W2CsKlaKidC+6RvPLO4=;
	b=vN/agt8PB0VXnwdqT2eiiADt2cLczabp7PJxQ3A3+28uXlK9snOAjVgdS3LTwc3Qht4J
	 mnHQZ0yjPIsauJI0kbd+nkqkfXiESiaCmKeY4WOdfPOA3TSKhdsAOP9X8L0JQXlghtzbr
	 KXJp7niG2UyVcgwInfvy6dVeWk0crjmxVsqBAPdw0gepF/ysILkH5h7uFvecO6ahOjBKA
	 hXTHz5qfL4TRnIWCGyKtywPEAI/q8o7V5WWpWbZ0VFoVSF3DU5G3mP3xjUDKCsPmU8RDw
	 lUZXp2dcaHHeK2ywt9iIOvGdOq73c5PAG1iKubW9kanPrUnvr2zVr+O8CreBTBU88KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GsfkK6HN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J3d8BM2T;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415C5606A33B
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 23:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 415C5606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GsfkK6HN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J3d8BM2T
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMKWtM3060845
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 23:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x99lRuyCSocza6M3mwe4fqI7W2CsKlaKidC+6RvPLO4=; b=GsfkK6HNGbcHCfa1
	KfU1R0dcCTCdE2EVDwx4d767g1MGETijAE0LOpY5jU1I6jk1f2oiM+FT7GSLSAEh
	jPr85T/ME9YsWHiUx5Ta8628FoLd8o1u+mAtGQD+hWEIbs8XMJ4vzurJ5olSaT2G
	tvtbGu1h3xmOP61sHC01yj/xR0MhHZXX+6PHaTBZ0acB4FeczGO6/brYmgvAOv46
	RA8h7TZ8WOgOfLHb3zRccAsPm+bSxAEhEzMmCIpbNKycqul5io3/w0AJ4JyGzWL/
	WJnYmZLgvA6Q46doauKWVEuO9UokSIIC71bsyAGHZhXTGzw6iPSmVOJeMUYSLDFq
	mTmwiw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b30sgt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 23:01:58 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a2af4c8cbaso2092376c88.0
        for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 15:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794351718; x=1794956518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=x99lRuyCSocza6M3mwe4fqI7W2CsKlaKidC+6RvPLO4=;
        b=J3d8BM2Tv2J5sQIF7LdX0nCC90OxoAMeakc6Pdhi/nirdqQP9KQrk2jCrgl4tS1230
         0pNqjGi2JgoT4sYT9f04RXIJKkGaVB5NS444Tuki/3RM4FVwyshC3JmVRW5GgWrpF94T
         31f37oYr2dGR9rB5fo22U7CBHxpyUOe9QqhkEUcqEZq2WhM3nJqiGyn11ClZ7Ta2YVxS
         XVGC989znbeWmwSAboLrfS6Bj8Np4HaBya30IbK5PjekoxVsS4TaXwd8UT8Nr+8knEIg
         3nnPKkZTjf3pQUDVAByggV7p98eoCEVzKNXRc/nY3QxoKkrCy1jYnv42kLUtsWZ5oLHt
         V8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794351718; x=1794956518;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x99lRuyCSocza6M3mwe4fqI7W2CsKlaKidC+6RvPLO4=;
        b=AfCRJrBxIrNWqtHgf4c3/+YJaN+0LfMs1jwVefKlQxZuDjdhoruEyF1jz3dTqyseQi
         jGD3GMGtIsUTkLOt0oIwge/maE0BI8FFwoXmH/INiPvPNvZ/E2dDsx9YGW37JtA3g8GU
         BomxVo3WBODlcHV8P/boXIrWUbtkpEDXhQkFHF4NHyjK68CF/8SU3pWRW2PEQxwtGcMn
         681JTG+uq6a+xpCBu6ph5sfnEOkXaI6SVfIW4Jg2udBgVhnwr22Ojerk+3x5kxq5553p
         gGPurZf2a7rskRZWZrfzwVKAfOQzAI5q4LVkgFhIFT2NuiTxCdRzdqMECHHLgc4gPGHB
         Xl9Q==
X-Forwarded-Encrypted: i=1; AL+hErFZ0m1j+gBXMyFCd7ak5TtTreiT+L+NnbHQTmGUmYRqeVjboAxcTGfsFD5f0St0TcMD927UZdWL4A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/4BEHsLyh4Shf1iMHvlUTcVVk6uS1Dmmublx/haStPUlPB30u/
	T0QaqItXjZlP+TmYpH/m/hElbjnHJ5TY/dVwmHrRQF4AzWMXynBYNqRxrbRqvRozUvUkxpDXeDf
	ocK5vZTeTiIrKYrbEeYEzM+UdsYFmZvjvmYOcVC26arscmgLkulT4ytCQHbvxdg==
X-Gm-Gg: AYBFou2QjPvER6ttvHxcbLJ0vuwZAQ8tjrboLMIDOApvSpyJ/CpouaHnrqhhcRhP6fS
	Q32n2MNW0ShFXbm0ntXsYRpluhuhUVN1p69oFg6TlLGA3yR+eGsWXYokvxsEqn2wDRyZsPU2i5C
	EhXvc69qrnppK1dm7EmqtK3dp6Xkw3hc4SBhAy7qkx45to+kJZQROFcNqp2sAbkdeYO/Gfw7blF
	8cJZZ8a1ROQ+xsWJfUGmyuvjzKZLpw8sdwiawKU99Zh4jEe8uj2mcrAWijTmn+xs7/PgofmrJeT
	WBvQsy1XZCp6KRk4SWTbyutto6bVMqFS8HZ3LjfOLOQl04dNZ2eDhQ2PnKhzIha47NzmNlMENOz
	/KlTTkxBn7UuNyPRAHym7YlslHEOXlMHNXKzNPe10T1CLuPnRNR3T491/jIjbpIisAvdtdIv03E
	BKv3+hJbaILxhDNwYtQJdZ0tpGZCs=
X-Received: by 2002:a05:7022:287:10b0:195:9228:50a0 with SMTP id a92af1059eb24-1b3c035325fmr481384c88.42.1794351717613;
        Tue, 10 Nov 2026 15:01:57 -0800 (PST)
X-Received: by 2002:a05:7022:287:10b0:195:9228:50a0 with SMTP id a92af1059eb24-1b3c035325fmr481344c88.42.1794351716979;
        Tue, 10 Nov 2026 15:01:56 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11150sm13944465c88.5.2026.11.10.15.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:01:56 -0800 (PST)
Date: Tue, 10 Nov 2026 15:01:21 -0800
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
Subject: Re: [PATCH v15 28/35] firmware: arm_scmi: Add un-managed methods to
 get/put protocols operations
Message-ID: <20261110150121.00000c6b@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-29-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-29-cristian.marussi@arm.com>
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
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af3a266 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7CQSdrXTAAAA:8 a=JB04BPaodQz_QRRZ9pYA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA5MSBTYWx0ZWRfXyPjljhTnlp6q
 5hQLcoNliobk02OPrMBx5L8RHH7bbJTMn4aMhnvMrF6w09bJvlO4vYnza/9p9z8/JWCg0BM8edk
 qtiArnm/bNNLQRpcmJwMnramLjKLP1eOamxepYHgpWLbEKV2nuUqU3oSs/xjBt4TcbutF0JQ3zg
 iTS5IF99lVWuEDFirrO6PN8lBCuXEzpWoN19a2bXa+GWSIfPctbNtdKcDv3quzNkIxV/hxKPtNc
 wLPJFJMoihgjOAsU42u1NE49ACKXDjB++ZWgPexdRUUjLlIv+zJuIOpZIzUEoRI5OqQOwNu3z0C
 VnzvSVNCeygjcLMPAAmqVamqvHUq0nOVGxnhKRg+9lBdtC13ImIdOS5ablRWtyDm5Qs4XPlc37U
 gRiLijrWxtMnth+E7b5sctfTscgQFYHx24M6GZGZjhTYxRKldG6bXkZloJLevOzr/NLsmaMV3iE
 C1KdNX5VMt+eNK3+EsQ==
X-Proofpoint-GUID: KpFNFGHU-yevFSSAZzyOnnQoKyPCbLjD
X-Proofpoint-ORIG-GUID: KpFNFGHU-yevFSSAZzyOnnQoKyPCbLjD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA5MSBTYWx0ZWRfXw2E5b6m+YZaZ
 aOLuKAWDp1jXzlg+8miNF080LVAjuOGhI9K77SA/6EkMfU7tOLMABEvPRVmvBAvmH2NwNghkceu
 DpVxkYct5OM25lFJf8WQMhlfg/SVcis=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100091

On Mon,  9 Nov 2026 09:12:14 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add a couple of simple common methods to be able to manually get and put
> protocol operations to address situation in which devres managed methods
> cannot be used.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>


>  /**
>   * scmi_devm_protocol_acquire  - Devres managed helper to get hold of a protocol
>   * @sdev: A reference to an scmi_device whose embedded struct device is to
> @@ -2697,6 +2722,18 @@ static void scmi_devm_protocol_put(struct scmi_device *sdev, u8 protocol_id)
>  	WARN_ON(ret);
>  }
>  
> +/**
> + * scmi_protocol_operations_put  - UnManaged put protocol operations

Bonus space after -

> + *
> + * @handle: A reference to the SCMI platform instance.
> + * @protocol_id: The protocol being released.
> + */
> +static void scmi_protocol_operations_put(const struct scmi_handle *handle,
> +					 u8 protocol_id)
> +{
> +	scmi_protocol_release(handle, protocol_id);
> +}
> +

