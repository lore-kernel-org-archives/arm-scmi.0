Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795562439;
	b=P9ikcHAms1p2CALpA45SwO30yj5mke5mLYL1Y/9darXlWb6MqwUzfrXxbvsUohy8fpvw
	 Mj1FhEMFXMMaBUUkr36DZlOw1VCpEXxlCHUVrHc3p/8BtSfY+8CQwi3sdRxdQB0U0kzAq
	 DJzZQDZpUjd3nCVV6x7NEN5O1mEv9IKXtwojlSwAp+IcffqH4F8+A2P7RSIyeBhRBigYc
	 VefmFX5zt0aooqXMDSJI8J9o/r9I9wiN7nc4ROXSG2myyP7aFfgDK4sxgbEtTxCq+irXd
	 3KFc4nAwWZ+0snDHH9faGY/l6iYYsusi1agcNDkaNvxzIbcBIjAo7GZO4Ka0B0Ifh7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795562439;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3KO/odQMQ92hZWqJbAKzDNnQu530XOIkKjxzw7TZv+w=;
	b=PU/GdI+UYLeuzqIrQx540aGm0Np/h8OhpY0M7PsPdZ4lb03fCU80u5q6Smj7Q/ZkWpG8
	 p7zpZYBL3Z2LT0MrmAKxWHgCGfdZQjcAMLMrc5EgBnceyAhbd9v8WbIXvaNhmD/t8MUU8
	 spM7nP7dufgfLmA5VHURFwHc9RWDkN9MnfC2X+yK9l3DKA+VfboicBqB2YI4xwFs7HxtB
	 FXgjHVg8VYU6nqfr6ZRbX6SGkozxS7I8tdIpZZk0f3Mwo73Pa1219+0bm+Q2Jurf6p2Kd
	 +9Tw2sZBaX7ky0l1fTXP7H89gGOtvz2xw0pYmfuvUs+aX7tFnOjVPFC4xlBGj6RzvSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iNbkNY9Q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VLxVR8fu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52E1606A327
	for <arm-scmi@vger.kernel.org>; Tue, 24 Nov 2026 23:20:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A52E1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iNbkNY9Q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VLxVR8fu
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMb0va886649
	for <arm-scmi@vger.kernel.org>; Tue, 24 Nov 2026 23:20:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3KO/odQMQ92hZWqJbAKzDNnQu530XOIkKjxzw7TZv+w=; b=iNbkNY9Q/L04JZ4G
	qETJC5rbd2pOWstVW0EwhXf5Ov0ejz4I4599gNgWU6w8oujtEEyhnQNYGp9qg95L
	dKgb2950z6WGts8R20qztvZ2B8Yvh9stSS2vuMx8mFmxCJwAOdVmrVz/WA+I7PgS
	fFhuyV54KA86XN+tSTVqexwp39o9V4FXtg3G8gNbZso1sepp7RCHPiDg7Z166KMQ
	OvbgNXxE6b6/5RAcz1eOeOKunNoexRixz5JXnStp1rYjcvclYN47h3pficNheSo0
	cCmQLYB/wrq0lvxhi+ctEUt6fN46bQ2oVrZFa386e0YZiIf4L7Fu1d1pn0+XE2NL
	a4S5qg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rhcasp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 24 Nov 2026 23:20:37 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3425098ae4bso5940117eec.0
        for <arm-scmi@vger.kernel.org>; Tue, 24 Nov 2026 15:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795562437; x=1796167237; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3KO/odQMQ92hZWqJbAKzDNnQu530XOIkKjxzw7TZv+w=;
        b=VLxVR8fuqbOfiMdFrEJfyk1GAaDT2nFPRenygO8Zx8z5a5ioX4yrSuaJAhyJECOZ3Z
         PipYTCKp+aYCosb9GGM7tyLQ/jQ1UAKbtZUhp7X1tC0ZHhbPb2SBAkxpEgg6odSsQzNz
         nQrUPYHDbvn5BLvwTX9YeAptmGO779fEzkHGrp/ZMEDC+rgEVwUKiPIEbV9+SHEtvVUM
         zd+NvL+C5BTqtOhVAk/DXnH9qMbSUvTqJslvgRQn9JFq/aMi9Q70kbvvum4lqU4+Ux7e
         bZXZ0Udgp1NT0/kpz+AkWCPB0lXSwvXO8m7Ner+7irlEFVj8Xwqe1XQRQw1DLD26K1Ja
         QrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795562437; x=1796167237;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3KO/odQMQ92hZWqJbAKzDNnQu530XOIkKjxzw7TZv+w=;
        b=uVfG8qpzVtB46UoA4KFCw763bsDM9RIn2hx4vSK/U83LKV6l5xpBpLCI9Jn5duefYS
         VXQjaUREgghVTGk3YlJoQcFRnZOdyo0ff/5SUYLwGanit6IxYwWH8DZZo539lR6LSUnT
         URGieBiKrKESucezzQFHxvG04uBuNrXBdsxRMF85Vk67vsZmx7Symowa/OGrbdFTW8n8
         GHocyTAFSyCr8YizrCKjp0XtQAkv+j4wLuRHhTGsnIZC5sI6lw0oVKFtVr+B161Zkg1q
         mzB3hc4DoCriaYffIXEbygDYXVqyFsHx0t2Ad9+J4Ajt1twGq0EfLCQqeThudT2WgU2q
         zlQw==
X-Forwarded-Encrypted: i=1; AL+hErG321sLqFMDJTEKvB7jNMOPjWs26pQnW1qORt0a7UUXTbP1m/zwh2/78Ens2igKQ4tdPAmvkbN+uQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8EbQReGrr0q6yK1197rJn4Sl98tlnz5edM/Ud+9+JsIirVpEe9
	sbqA+D0HaxluCcJXbnCyoo7BqI6Q5s8r6LqX54z2BikPHdpjVhDOvo+bXT1PpprHwlp9unb4Tnv
	+mI5ji8Ooqyie0fMIumYAr3LRmNPcjckRaBClXcuYGdBgZl1CBLL5Os43ZnSb5Z2mxUBZZA==
X-Gm-Gg: AZFdTZeNIlhVSUaX0+odSY2j45CDNr0Zq/YFzno9xH7ABDvijEp2hkEXT2hweAOaf2J
	Z+MVCUzzB7fbzo1i7RbSRiyawk47bUtkecSNVze4HzARhuqipMTwtDMzC0/nQkE3D6Xhgi6xHWE
	paUmrs3D2iyPxKsYkyDjZepmmx4UK89SPzPLAXDEVWQpQ4r2gBAdacqmE7jXhpNY5OiPMm+fVLZ
	XXhjX3ZaFaOJ0QpfhEAutehoVLrSE+z511x11wyClV1qXxl1nhyC09teC5M6HBTm6U7Rd+7dPEp
	z4Pd44KAvnsImZbYsORZZFz1xZ1k5QiC1FYk5n99F1mm6QAJzpeBYN29YMbLkvgtSe/UffL+PVR
	T8Pq9I+/CeIj2CfCzZOW6C64eBUNaRm17rlN2VaVYTWRBkfHH5hIT8RD6ZnsKtnd2Wr9lnB0TPV
	SqmwYQVSrHdDe3ohraOyMgoaqIlTAu
X-Received: by 2002:a05:7022:5f19:b0:1b5:51b4:85aa with SMTP id a92af1059eb24-1b5524b5a93mr14548254c88.12.1795562436829;
        Tue, 24 Nov 2026 15:20:36 -0800 (PST)
X-Received: by 2002:a05:7022:5f19:b0:1b5:51b4:85aa with SMTP id a92af1059eb24-1b5524b5a93mr14548210c88.12.1795562436093;
        Tue, 24 Nov 2026 15:20:36 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm55096295c88.14.2026.11.24.15.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:20:35 -0800 (PST)
Date: Tue, 24 Nov 2026 15:20:30 -0800
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
Subject: Re: [PATCH v17 03/34] firmware: arm_scmi: Make Clock attributes
 size deterministic
Message-ID: <20261124152030.0000438d@oss.qualcomm.com>
In-Reply-To: <20261124194841.1147072-4-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
	<20261124194841.1147072-4-cristian.marussi@arm.com>
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
X-Authority-Analysis: v=2.4 cv=BKkmP1QG c=1 sm=1 tr=0 ts=6b061bc5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=jNwuLTo9DzxMKENvP54A:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA5MSBTYWx0ZWRfX5qHjIBD4ClY+
 E12+qZBa3JdIXSR8MgLXtEVSs8gwFvAtcbPnw0Skl2BPXft8m1CqS2z4XwPKZIA39cxBrWxC0sV
 60iD1+pv9ekRfsNcDoCl12l3qpaaGc4=
X-Proofpoint-GUID: Flfm0Slu7kYyu6nBSqqTARr4L0JcVNTP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA5MSBTYWx0ZWRfX2ksUH3YLfnrb
 dXKQMAZ2vf/jFV7JPCHsWKotiBRYCcPy4uwDh+G4W3RrEKayI92paXAYybf1HtFBr5DpcUOUxTG
 vFBjrztGb1M7BaCjy09bIdmOnZLMwpmTl3AEBP6P4ujWUf5fplKx1HD8hLHEtYI9H1ecIRy7N0H
 pB9w5USUUQAmcIpcmdRh2Sr9ebzIsKbGJ3OfB6aDPq1qcZwAtE7gqFYgiALIHuTY09U0reOws5O
 S4crEuMf6oufDXGPEQxW20aMKfgr+g4CEMYktFzF36QPRd39364bi3fcF5eeQikyFA5fVUgRahQ
 +7bsqs81YvcCuf3brmV3DpOnaPmvsp9I9sRUj5KEPeP7xBpZ4/3gv+379nZXcOdF9yfI14IzAN1
 9eViudXxwIHgYEqkAZVp377CFgKLH3O8WhmuCzEdnFytDmUxt8MUhLc6V+8nPwQGek+ZGQ1PKt4
 ebulz6928CHAFUxrSTA==
X-Proofpoint-ORIG-GUID: Flfm0Slu7kYyu6nBSqqTARr4L0JcVNTP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240091

On Tue, 24 Nov 2026 19:48:09 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> SCMI Clock protocol CLOCK_ATTRIBUTES command varied in its reply payload
> size together with the specification evolution.
> 
> Between Clock version 0x10000 and 0x20000 one trailing field was added.
> The current implementation used the maximum possible payload size across
> any protocol version as the rx_size paramenter passed to xfer_get_init:
> such solution works fine but inhibits any possible centralized check on
> the size of the received reply.
> 
> Size the requested reply strictly according to the expected protocol
> version.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

You could use offsetof() so it doesn't matter if yet more fields
turn up later. In practice though you'll then have 3 options so this
code will change anyway, so meh. This is fine.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

Being lazy I didn't check old specs :)



> ---
>  drivers/firmware/arm_scmi/clock.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
> index 6b5d50b35a48..ed93970c3b87 100644
> --- a/drivers/firmware/arm_scmi/clock.c
> +++ b/drivers/firmware/arm_scmi/clock.c
> @@ -362,10 +362,14 @@ static int scmi_clock_attributes_get(const struct scmi_protocol_handle *ph,
>  	u32 attributes;
>  	struct scmi_xfer *t;
>  	struct scmi_msg_resp_clock_attributes *attr;
> +	size_t rx_size = sizeof(*attr);
>  	struct scmi_clock_info *clk = CLOCK_INFO(cinfo, clk_id);
>  
> +	if (PROTOCOL_REV_MAJOR(ph->version) < 0x2)
> +		rx_size -= sizeof(attr->clock_enable_latency);
> +
>  	ret = ph->xops->xfer_get_init(ph, CLOCK_ATTRIBUTES,
> -				      sizeof(clk_id), sizeof(*attr), &t);
> +				      sizeof(clk_id), rx_size, &t);
>  	if (ret)
>  		return ret;
>  
> @@ -1002,12 +1006,16 @@ scmi_clock_config_get(const struct scmi_protocol_handle *ph, u32 clk_id,
>  	int ret;
>  	struct scmi_xfer *t;
>  	struct scmi_msg_resp_clock_attributes *resp;
> +	size_t rx_size = sizeof(*resp);
>  
>  	if (!enabled)
>  		return -EINVAL;
>  
> +	if (PROTOCOL_REV_MAJOR(ph->version) < 0x2)
> +		rx_size -= sizeof(resp->clock_enable_latency);
> +
>  	ret = ph->xops->xfer_get_init(ph, CLOCK_ATTRIBUTES,
> -				      sizeof(clk_id), sizeof(*resp), &t);
> +				      sizeof(clk_id), rx_size, &t);
>  	if (ret)
>  		return ret;
>  

