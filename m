Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794351044;
	b=0h2CC/6y+zfFZqTBWQdSvE10So8L3eoVk4DTFtXvlvtUTMazMLoa0OSNRJ+XGFeYengH
	 S47qVwSUbFmleuxNpnaov5VjW4mx87EjUtaveUugs/ItelkM4fncLs32TNZh1Is8aCxgk
	 TTLGo/1YW34G1QA5NFy6rQVa1Up3KjDOf1/gqVjOYvY1lrDZnbX4P6Oi91J5E+u5MIhob
	 zJC6wS2/NvHT3VkoZFrCxMc5LwV46veNYyNWp3sqABO0MoYvny/utGExj8YW8/06ipnVK
	 CRdP6DAePxLyQhvbr+ZUWKO5Tbs9fvwQ7facJE6/zVxgl3wH5RnQX5NjJDLXQw0ZQBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794351044;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uVC61jJFB75Gmb5fdaFJWW1deGVGa7rOIiH4PEtL2io=;
	b=FHGajIqlNFhx9Go8OWAGZtWKGM4pze20DfA5BYf7r53bCMB+dJ7oKI9veG9U24nx7JQ/
	 eAKbrOnYmjL0o+fGhmGQMXreu6Ori1eRp/B01zK8AGgeG5RsE1oBusIPk+19ao8tXfXnF
	 0BrZLF+xNUgCUvkHk2z53MWugXMJ0e4qmFpyFuXp3K+GH7BBEr7gb/0TQCR+KgXgEpJmG
	 83Zshr1GVVOXIcLI2hQlFvqhuZNOI50EDjs7rhZIRDhqGYj5BAZGiMeLBn4WD+pWLxsD3
	 abDfvddYe5jFdnu6dCmOtZgYm4Pz6zMhtuNcNXx7Z86MXBsV6Ku3YXgprcwRRi9uzvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F03OaTtb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MkVooa+B;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227D9606A321
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 22:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 227D9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F03OaTtb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MkVooa+B
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMKfIe1113756
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 22:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uVC61jJFB75Gmb5fdaFJWW1deGVGa7rOIiH4PEtL2io=; b=F03OaTtb6bYFL8gL
	Ve7hnhc8Sw7J0rgs/T0of/qgvB9zty7yK88MG/KqmyKo0fjNPIy36RKq7bY/h0rG
	MII55Veey/4m0wpHYvZf0j5eeLFJCNOWB1o3CPl1bb34Fnemsi4Z6WD0rQMrEwvw
	9gIwmD/8TzFtFpGBdTZ7Y96/syKYW/wlm6UxZrj4MOSAxu/4TQrpvd/cGMEPAh0K
	21fLl/KpycU200fyM9amctc50JpVd6OQqWDTvmqrGWpt9CIgk1FLTZtKWimUyhfo
	RIwN1s4FdtEL4yX9mUPXOzSt/p93knQ36CorLFfZScmNxTuMk7pkHzOX5z54iQNa
	HEmvkQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv97c8tgk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 22:50:42 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3b5b49cabso2189830c88.0
        for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 14:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794351042; x=1794955842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uVC61jJFB75Gmb5fdaFJWW1deGVGa7rOIiH4PEtL2io=;
        b=MkVooa+B1Vm3Wr3BM2XKK2zM3uor1j/dKCfzqpZ4uo1DtS+Hs/JTzR2ICrTLNy47jG
         JiNillRotSWb3Sy6CzJ/J1hh0rBi1Wnk+PrAj1C70sl1VlDUAohTZtk2HOVQdojymOWA
         YCVasoc9M3UyDLFnohPUtMOl/onJDkFdfFrZ3SRhoQ1yKz9qtjCy7lP2OV3B9BsbaoP8
         mHzxrebx4m7Xp97gCXENGJ17EuE3QsnFXCrvQWz1c+JyTewVqsfRhW+g24BymPbQd6Sj
         QKZXfMxyzx1zLDarH7wnv7r6mvAhUmrnHC0wkNds6X4CypXifaouWAK5hX/M3HVVhgUv
         hb0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794351042; x=1794955842;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uVC61jJFB75Gmb5fdaFJWW1deGVGa7rOIiH4PEtL2io=;
        b=gr3m+C6XZk8OKetXSPWe6RQ0NBFG4P3RlBDpM2R/sTpebIza2uOI+0QSf6+tCdw5mi
         0RgGvkGi5wUdoRICtSSlyAQ/sbdqD+OeKcnPtaijz4oNu91VPjivnwH0riphj+7dqQAa
         HGWgf58+rt/0q72eD6ymV/hK921OF+GPwgY1lJVhB4avn2GsQ2XcBMSMYb/TNss2vHTU
         /9UR/pzIBuM3OUrvwS7ZJ9RPAz2iWMAD9b4CeBl7hx7faUT4wjjdZCwylIlDFJhM8HPZ
         3DxGkRMFss2db+pytMuPfRPzT3NoBrCW1RTBIAuT1GG8IjXh25Me1gIaqQG+tuL84/T6
         sGZw==
X-Forwarded-Encrypted: i=1; AL+hErFUoJ3oe1xr7FAehMaMSJJ3KN5L22Of9H++Z92vnd05+4PaZDodn1Jk+siWVFuIyEarkFWZXNJlbg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9f6BR/LeqMetf4dvoN+7r/2IWJrmBOsiWl2FfIqWDycCtwUXWU
	RQGc6QPuiU9QrcAjLxle31+YDId+me1h13aRkMtawkteg671f8ZgRdM4ldxW5hVqvXuzky4QhLU
	ysoVjIZ2LNlyvcAqMGCMshYIOQTdUmKdo/rOs/VKJVu3QR/aLveE0ieJ6zO+vmQ==
X-Gm-Gg: AYBFou2oYzKZENM5qL9zbB5C6bmmfrRlSKPIthlF0JqPhq3IgA5FkaKEHjeAR5HCIAn
	jezv3wVOsG7oWocm7DcH2pIj7Jz9gOyojMOkdcB38eve/GmFOo9dZNcGxGJYUcOITCYRYgZ+18P
	83LyGFgLgbnqms6Zu3LMuqgJ0oqoaxHX9VoJfR5hhlHbAjRzVIxqhhkTHFs72EIZnINqYWU3LDS
	vyHZzfxOhdgmiKhUlY7utYPhdKsy1INPAi1eZgsrBa9xPzr1BoLlex4ofgpBY0dqwh2gGSjJF0e
	OgzlRTajtfuPlBimRU8sE4VbmB2EDixI4S5ehN9cU5Q/P2Q8gjb3IVgFEbVc6/IDmsY7mDMp7PQ
	uRzeWe+/8Q5URCw5SCkmol67bfUZiok+Gg2wwDJObFOYX3nBjmmgy98yT3aP2JIix+S+JtPchbj
	9KfnfPTsWgLjDUUkx3xfIDeOB43sQ=
X-Received: by 2002:a05:7022:1184:b0:1b2:6b1f:1d89 with SMTP id a92af1059eb24-1b3c0360627mr424910c88.36.1794351041479;
        Tue, 10 Nov 2026 14:50:41 -0800 (PST)
X-Received: by 2002:a05:7022:1184:b0:1b2:6b1f:1d89 with SMTP id a92af1059eb24-1b3c0360627mr424866c88.36.1794351040724;
        Tue, 10 Nov 2026 14:50:40 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm10023483c88.9.2026.11.10.14.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:50:40 -0800 (PST)
Date: Tue, 10 Nov 2026 14:50:15 -0800
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
Subject: Re: [PATCH v15 24/35] firmware: arm_scmi: Add common per-protocol
 debugfs support
Message-ID: <20261110145015.0000712c@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-25-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-25-cristian.marussi@arm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA5MSBTYWx0ZWRfX4FJy3n2GRYaX
 AQfOnogw4nkv1PziGhuU9IJujuxvJn8x3BCwa4Q2+IZ8wkwB0o68wkkG9b2SbG95Z7KTRl6zN66
 v2lqA2ee7SWY9Wk2+3R6NIn/+rS9hnASn3O2EF2xPFkevVKi/B7kgYPPUI4VarEoRxXEEt5z00D
 tPhxzVNavbPk6Uqt1u6QyBmhrqUx0wkkewp6vFMvq/VTv/WSh3E5t1lnR3A1kvPVHt3xEyy+bYC
 SeyHEVFNlEecJYMOxFZOLh8yXMXuJEPi2V2c40R7n0GM3U76b1mntUbiKFggLDeWU9I5BjC/wud
 97wznzug8pVQPlonNidq3WrhjYNAV5SHpI0L294sXhWVLBayLLhG8z8jL2qou6UstWHnYxUmFUb
 YYpu18K2tgO1jABUHmq8rirOMWTb3TXStNrehLY8xHBRYln7CAmiRCLKLd2gLaQi5GkVOOdO1Fj
 ZdosXpZh72Ilk5bfpkg==
X-Authority-Analysis: v=2.4 cv=cJl1IVeN c=1 sm=1 tr=0 ts=6af39fc2 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=43dFeItomYT0VcnkQewA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: S-wdopvM_Dn5muW6z5xzg9XzuYS5xMBr
X-Proofpoint-ORIG-GUID: S-wdopvM_Dn5muW6z5xzg9XzuYS5xMBr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA5MSBTYWx0ZWRfX6BA3gK3rokMu
 etYFqACnJDhlojTleOeK8Wco99lG8+e0Mah0y1Avpr8Z4Icr+fZPKO6EGJ0STNYIUFWpUVyFF5b
 t3yfAl7Eyx3noEd+wEgd+77VyovLJNE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100091

On Mon,  9 Nov 2026 09:12:10 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Allow interested SCMI protocols to register their own specific debugfs
> entries under a common per-instance and per-protocol subtree rooted
> at /sys/kernel/debug/scmi/<N>/protocols/<PROTO_ID>/
> 
> Expose a helper to enable protocol initialization code to get access to
> such per-protocol/per-instance dentries in order to be able to install
> their own dedicated debugfs entries.
> 
> Per-protocol debugfs support is configurable and default off.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> v14 --> v15
>  - fix debugfs_remove_recursive call-site...was too early
> v8 --> v9
>  - avoid NULL deref on DBG cleanup path
> v5 --> v6
>  - bail out of dentry_get helper when SCMI debug susbsytem failed to init
>  - remove stale SCMI protocol operations
>  - add a preoper clean up of debugfs when protocol init fails
> ---
>  drivers/firmware/arm_scmi/Kconfig     | 14 +++++++++
>  drivers/firmware/arm_scmi/common.h    |  2 ++
>  drivers/firmware/arm_scmi/driver.c    | 42 +++++++++++++++++++++++++--
>  drivers/firmware/arm_scmi/protocols.h |  6 ++++
>  include/linux/scmi_protocol.h         |  1 -
>  5 files changed, 62 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/arm_scmi/Kconfig
> index 783c24a20e29..f506c4d1d96a 100644
> --- a/drivers/firmware/arm_scmi/Kconfig
> +++ b/drivers/firmware/arm_scmi/Kconfig
> @@ -69,6 +69,20 @@ config ARM_SCMI_DEBUG_COUNTERS
>  	  such useful debug counters. This can be helpful for debugging and
>  	  SCMI monitoring.
>  
> +config ARM_SCMI_DEBUG_PROTOCOLS
> +	bool "Enable SCMI protocols debug"
> +	select ARM_SCMI_NEED_DEBUGFS
> +	depends on DEBUG_FS
> +	default n

default of default is n, so no need.  By all means add some text
to discourage distros from enabling it.

> +	help
> +	  Enables per-protocol specific debug features, where available.
> +	  When provided, such per-protocol debugfs entries are grouped
> +	  inside a common a subtree named by the protocol number and rooted
> +	  under a per-instance 'protocols' directory.
> +
> +	  Such per-protocol entries subtree structure is freely defined
> +	  within the related protocol code.
> +

> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index c1f503c6e72c..8a4664165a64 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c


> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index 585eb3a4684e..ed3eaa1482a3 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -1164,7 +1164,6 @@ struct scmi_handle {
>  	void (*devm_protocol_put)(struct scmi_device *sdev, u8 proto);
>  	bool (*is_transport_atomic)(const struct scmi_handle *handle,
>  				    unsigned int *atomic_threshold);
> -
Unrelated.  Scrub for this stuff before sending new versions. Saves time
all round for a minute or two sanity checking.

>  	const struct scmi_notify_ops *notify_ops;
>  };
>  

