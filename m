Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794457822;
	b=TiWGMeqKQy3VjokHDQofuxZdKitmLcXPsMcoR3FfuyMVGL5j1rRetQlOY8Sze6hVnW/J
	 9FnYwWk4mKuW42ULwgmdgmAszMBx51nHVFASMEe5GLF6LjpbH+Ss6Tr7W8zWq3ll2Rg9r
	 8ru2e+E/EGP9vvWJLp0IEH1L5ztBmUxxcAKbFqH1nUtN7vZfVgkplXD9zlG5YE+Z7E3EY
	 nwh96UWjYFvaKtMyBmP8E3kKaHcLTQj1GqHiQKQN8lgbC/u6Dmy5qCVV45XkD7jyvI1W7
	 wdSsO4Dsvo1XTo5+xniRCn/HTyLd3mtkxkA1WL6YCZwW2Y5xaXjML/v/8Fwami2+VWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794457822;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zo53EQpUg0jWnHvwx/8Z+Iyb9X/XpywIVlFbq8/332k=;
	b=JdOlN71R2+l5tNrV8HiGNO30cFi9xp3oWJwwAEPYaPe5ebQlWZ3LAdpVz9tAJxUsaUy8
	 cehoUStEvYtGE13hDvzMhFmD1FMqIOH6gm4/Pkck81bjsebCghOIhqptuZBwECBcNZJze
	 /gWmezBgH1/pGLsY2OI3Nrz2PQ+/a2AkhgCxRuFYzoYampg/2Mv7Kuc1NMg57wtIYtOMg
	 eZRIMrdmfwrNrdI4I7g6U6NzhHOZiGXRD3EZDPkZ5HrjBVoME6u9Gokfpqb/VZjfyQo3Q
	 F89hotebkA4I/Fs/YjhvBSmh8EcP3Q5V4xMzS1ubR0IdNNBa3RE0A8baTkAv/PtKHHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pswg6HdD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XgtBl6UU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EE8606A31C
	for <arm-scmi@vger.kernel.org>; Thu, 12 Nov 2026 04:30:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89EE8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pswg6HdD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XgtBl6UU
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2aWRX1475396
	for <arm-scmi@vger.kernel.org>; Thu, 12 Nov 2026 04:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zo53EQpUg0jWnHvwx/8Z+Iyb9X/XpywIVlFbq8/332k=; b=pswg6HdD47FUDh52
	oBdstQdQmPzqZoDfnsLVUQkhDmuqumK9WAGLA0qD+js7fngSxDth9PNvL6KHjjzt
	sR6ppFEGfdpTKsX4bFQx2FWaNjaJ6aFty6JJRXbR48b4uds93geUlJVqadIXh52b
	mCmoM2BSvmeVsTtJxPIBS0KXz5oyWR3hSJ44pv4dFiA3gw3eFeN/s1zz0mSXLtXQ
	Lvmbh+H5CQIG+2zvxPF4ikFXpfYekR7UBzNDMeCuep+PBTMPcqiof7ganY4OIWpU
	n30ajMI8Ca7UgJxOdRpxlQalowv0ABEgPYDjZ00tv+nZG90cDYUwqcZ4dpybgmiQ
	rUEgxQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvtymtmau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Thu, 12 Nov 2026 04:30:20 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so3045187c88.0
        for <arm-scmi@vger.kernel.org>; Wed, 11 Nov 2026 20:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794457819; x=1795062619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zo53EQpUg0jWnHvwx/8Z+Iyb9X/XpywIVlFbq8/332k=;
        b=XgtBl6UUE7fDhQp+6BhX9mz7rko1w0JN4FPddIWpj1WHAc6FRETmz3E3VX6ygIe9/2
         xsQ9p/rqNVtWZMxQLdu0LoT2Z68piTE4fdvhY4ODDS79hcscClEhoJgDSbI/V0Zizkod
         rqXQt1OFBxyMkWGuFer5B710euqDm49CfnxAGtlMg+HZLCvPbaMejFBm72V7VX41EZry
         Y3eAtuzNfMsMZal6b6RYw3Ern1lbRXfbPjtH849Gsa1ToPWz1RY3cf0+2jgBjsllaJXE
         RB7ogCpH3r365cEQKY9D+jEZl9PQC9HG/eopOVWFiVM1PQTB7lMFNEIB56Zzcwo6Xvz9
         GwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794457819; x=1795062619;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zo53EQpUg0jWnHvwx/8Z+Iyb9X/XpywIVlFbq8/332k=;
        b=ZHJ6x7giND3Gn4LUgW8pXH2MxpdlPnzzmDHhAUGdR5pBXgPu51qF2KZt5H+6mOlicS
         7cXONkRqSHnWJpPTeqF7suf8ld9EoitrBz9hx9nq+qa0uqX5LRp/EEX9gffbZOiLjTSA
         ENiIIDJiqSwNLR+KHGsop8EOhbFOMhsMyYve+UECw6n3taBhlJGPeZH5fUgy1HqwkJvc
         CU8ZlkI+dGE3FML2B/ZaI09UBRx6udpPl79/6QArDKKz9GpVrqV5yelEAgwN2p+xPPPv
         J4yIQ4UByKsTMUMBEpLdGAvKy22fEij1OITRksfETmiD8AZ4ytVdj/dUJs9FOBnu69kl
         Z7xg==
X-Forwarded-Encrypted: i=1; AL+hErGcCNfpGY9OblC4lWxVBrurz/YypFjPa2vaW9WxA3hJBuh+d1CjYVYmR7WfQpSd83eOHy2zdEX2LA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/7pisGdizxouOIg6qTy8QV+hOyNQWawLlzGgoCD4LQrFydtUg2
	KQ1WvN43aMOchN4bQssazUAL293BOGJOz5JL/vvY/dkYAHyqO0UXGPRWDXkH2SOPS5Pb83oVMLj
	lXFYqysx7rqZF+xH5Qvu7ERpLY+fXBaIZPCkLPoR9Dm9PsTVKcnSueEuvKey6Uw==
X-Gm-Gg: AYBFou1mKAumONq3P814mRi84Iw5oRP18pkcFMpN7oCMBWXnfq5ozCa+5R8Y2vt/0YJ
	3cJSKRXYWmmkSZbnFWxcA929ti4DvkeCGNTASCVIVIIr4W+4teNBZ/R5PEwIF6ecQEsRsfvgoEW
	N+u30G57gzy31zUJKpySzRHCOfpgU6+iuD1+PB0auyRk2YEaLLSeMDTbxKgqmZdgJKhYkR+hQKP
	JC42+9GlnWwa7GBvd3EblrmWbzkkPuXPxrssgKD19q/MNULGYRhh0/lpk4nquvjsnWBrjTZMAn2
	1HnZyCG8Tist7j/DkVD9TJddop70CcdhrMQR5sRqnd9KYOMGN1T/m7+khz6fGZVwolbkcmewXxG
	Ds8q3Rjnx08b35bnd6whpYnnJm1c467vuGB4FvoTp930ikC2uPucyL7KGT758x6/hwzQQS5GYgc
	HHAnt72S8ZbzxWDJFbO+Z5SHDs/Dk=
X-Received: by 2002:a05:7022:7f01:b0:1b2:42db:8a54 with SMTP id a92af1059eb24-1b3c030f6e1mr4080440c88.23.1794457819057;
        Wed, 11 Nov 2026 20:30:19 -0800 (PST)
X-Received: by 2002:a05:7022:7f01:b0:1b2:42db:8a54 with SMTP id a92af1059eb24-1b3c030f6e1mr4080408c88.23.1794457818345;
        Wed, 11 Nov 2026 20:30:18 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890584sm23163630c88.3.2026.11.11.20.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:30:18 -0800 (PST)
Date: Wed, 11 Nov 2026 20:30:03 -0800
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
Subject: Re: [PATCH v15 18/35] firmware: arm_scmi: Add Telemetry DataEvent
 read capabilities
Message-ID: <20261111203003.00007e46@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-19-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-19-cristian.marussi@arm.com>
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
X-Proofpoint-GUID: hv8uoeisqyOL0k8d_Ev_XzfhCsH80Cfx
X-Proofpoint-ORIG-GUID: hv8uoeisqyOL0k8d_Ev_XzfhCsH80Cfx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxNyBTYWx0ZWRfX35j860kzz0tN
 1CRFktopHrMZN9bLEPSsMhiIxI3HVKXf9jf7jvQNCvs1wPIc/H74ntrr/Qc9tQeqruyo60vNybk
 n2cVEdq2yiesCzzbyPFpu3TDYKzAOonY9tfVc2aq5jZWlMRXBYIuGnBVjgbcZop94BKfHxyy3Eg
 rsArx3Dn1UOxGQ9Za61LaQsiPRx01BwqxDdyfbCvJrEV2v7gyWntRhZmwCS2AAONYHZ/EvDBC7U
 hRdpK7GPhiflWq+VKgtYtkfMYTokYnzCTbxwtqS2S2VX6t4mLExLFsmt0eyl6HCBVs3stsDbDic
 rW8FUMXAwbYPR18t7E/YzOFWa0MpG90M2iBxds+nH3B/Xi7q/xrxrCfRAABbU/mKRi4hVowU1SZ
 s2ycKRyL4IuFXZPFIvQW96w1YFOg0g3eztLobyvLh74s/e1Ty+6NCZoeLy04dOlDGKo0xEo2fmH
 hm7FBqH3c5XPF5jkqVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxNyBTYWx0ZWRfX4WfBZ4xW9n4F
 ZvGpgyV8LexSAviLA7b3YcOASydoLmzYNaB2OI76NcSTxzvF89dsRXBKk8JHlzArNuxhiw94jTE
 Dq801Y/UxiDyzWwT2cDJbinvljT8i5Q=
X-Authority-Analysis: v=2.4 cv=Q4BHcI2a c=1 sm=1 tr=0 ts=6af540dc cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=bWY2Rz8DxC4JnhDb7tQA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120017

On Mon,  9 Nov 2026 09:12:04 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add support for Telemetry operations needed to read DataEvent values and
> timestamps as single entities or all together in a single bulk buffer.
> The returned values are effectiely retrieved from the platform only
> when strictly needed, i.e. when no fresh recent cached value was already
> available.
> The DataEvent values are fetched transparently from the platform origins
> using the proper synchronization and consistency primitives, directly from
> the SHMTIs areas or the FastChannels memory depending on the configuration.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>


> +static int scmi_telemetry_des_sample_get(const struct scmi_protocol_handle *ph,
> +					 int grp_id, unsigned int *num_samples,
> +					 struct scmi_telemetry_de_sample *samples)
> +{
> +	struct telemetry_info *ti = ph->get_priv(ph);
> +	struct scmi_msg_telemetry_config_set *msg;
> +	struct scmi_xfer *t;
> +	bool is_group;
> +	u32 control;
> +	int ret;
> +
> +	if (!ti->info.enabled || !num_samples || !samples ||
> +	    !ti->info.single_read_support)

Trivial but I think if it's not supported we should return appropriate error
to indicate that rather than -EINVAL.

> +		return -EINVAL;
> +
