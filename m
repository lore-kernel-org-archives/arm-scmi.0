Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794261445;
	b=BooR+bwOvfH/kfgdZjTGQ5R/S6adBanCDEfQhXXOsH2OvqCoHwoj6w8gcwjZh4wmrc/c
	 PTHcIlo9Xp5dphNmwossGLPPl3nCouwgflUSPbTjnNleCX0h9zL1xl497X8SbBaSTsB3F
	 x3FOwOzgLldCIae1+cXWP8xEgTV14poVA6+2s8aBeg27p+yvVBT2wSOxmHCAfHVl2Nvo3
	 Nya6Oq6PdNrHGRZx4AMHXf+CME8xFITe1USu0VkWVHX2cweIInbLnRG+Rnla6znDzHFMO
	 Kn8R3erxdFv63hjzwwZ0cmYmGiBqS0uTwO0VIikvo+A5LfmrZr/JAzBI/i4ZE/pe6SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794261445;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=b7DxPMnLAGx59NG4Xr4LnCuXJDUvyj4OcVD3Rep5gdc=;
	b=J9KAPDe9CFddzWUUTebrwkBjE2pdOLtV/XyFU9xmqrBlOAfvhkXR8Dx4FbVB8bUm2KxJ
	 rBHpMfwFoIZsV6vONu3vYDxH2lOoGsIJvd8VkaZAoK/OBoHUgV2RpoFrPmSLPPTnjbPbL
	 KffJjGv/mDs7iThX6e3v4C/FQM4y3Po15R3zNhUx9IosuxRQxOzF+LpuI0z2OjqgOJh/O
	 /o1plM9ltD2BMf/rfl26JkBmsGCC+lNfMf+p8lTarzN3DHGO0R10RU6dVR5rKOZE/6qHK
	 /NHcyuFHApxxe5CKPZ2CGklMoesa6h2ec5WVebvlT3nifAOcLSNdR2vdZ/309QCdjKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e1VcI6mF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="bROBw/Ff";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96A6606A326
	for <arm-scmi@vger.kernel.org>; Mon,  9 Nov 2026 21:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E96A6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e1VcI6mF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bROBw/Ff
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9LA2H62029889
	for <arm-scmi@vger.kernel.org>; Mon, 9 Nov 2026 21:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b7DxPMnLAGx59NG4Xr4LnCuXJDUvyj4OcVD3Rep5gdc=; b=e1VcI6mF4e8vaywo
	BP2JNRCIqHssN0C8xO6Zctry3jEKmvteqTjRhEneMmvzz90PUDh0+aSacce9EAYb
	SBGo+9EwmJ8YIEDQGxJ3CE1I4ob3yG3mlEbFtk0ViV7XnQF4VHVoHxbK5t902JfG
	CZLg6z3J9gD3zgrCNMw5RQCM3rrHuyONQDtVSbxmfsSjBvoJZu3wi7H23A/8iiTr
	36EiWJ7SEqEcIJ3zXD2H/J2HIj84nVWDfhJoe/+7KxczykChI0kU176cMMYJMdNj
	kXFBVWZj4l0DCSZ7sxIthy9ceHbhEETDizISpnPuCTfZ6I3AHjKOcpQ9QwDIEtd1
	dV5NaA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hufx81nkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Mon, 09 Nov 2026 21:57:23 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3ae17c536so1281969c88.0
        for <arm-scmi@vger.kernel.org>; Mon, 09 Nov 2026 13:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794261443; x=1794866243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=b7DxPMnLAGx59NG4Xr4LnCuXJDUvyj4OcVD3Rep5gdc=;
        b=bROBw/FfMK8VwRDHkxTvvnAvfeP9mwtDx9xXEWSiFLlTEWtzxNqMGHzLWpgWnIlL66
         E1uZUpUcCcJ3tCs8thPWdQKL8DKCA3txpmnU0SXqHXZdxaNS7b7+dmtpaA7ggvas1Vni
         ezBRGqMCcDgfsSExFw/JkkQnBFJtymjyn+4AUlTYoIzScjeNmZDhisQBmV0Bmh13fyRo
         AUovlx3Hkrx2s2dXdU9TMHTT2nZF18tQ5kelA8RaMBqKAZfSEHAVzmqZvsPZ6ogK6iAh
         U8/33gjFY/uXcztsLEIQXx1KTdBJZht8SOt07EXLmnrJvtmUpM+KucNSMX3Nl9KX4EE7
         7YmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794261443; x=1794866243;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b7DxPMnLAGx59NG4Xr4LnCuXJDUvyj4OcVD3Rep5gdc=;
        b=G5yFwP2gDyprmGIbz7IrPAYoQeT3+EXeY0J2teSUdQEyIKTcmkbCzagCH1UVIhcqgZ
         ZaZh8aXfXfm8LFYI41DHMP2EKt1mKIygHdL27fYUyapbaJpIGhMuHcrn5N5lGN3jTrZw
         rWwTsrHDxoGHQHVFr/xazAB+BHa8niEcOd78ARFZYoSHhLLktxmqMO8yXyTxTGLft/2l
         JE8JjmtgYwP7GEHdeI0ORlGn9Zr7efIqL90oluztQKBfZ0FxTw44nG79rL8KjwJO6Zv3
         VG5WEM2ctrpN5nMlnyOMDnozelIcf6axtMtyNPqvWVcHH/w4AYucJZQK7ey4vXNTLjRq
         KECQ==
X-Forwarded-Encrypted: i=1; AL+hErGg7CdINYC/cTgPiv/I2ejxibCc1pWdRc/olRZ9uvzNub6sQuE7+4TMt83FsilN4AJYx2ZE+M6bNw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/cwzDXEKUaNawJ7S3+mO8LKWYrJzuURd5Vs8x551cRpIwFs7hM
	4qcj4ue3mZFvYqPNXbHTfeb00hW2UkiqHK75ExcBkF/PNgvjD/RwxRhjHzDz0rEweufTejjVbYC
	0lsIzk6gjTJqyF5S6fjMmijNUPG+6khWJTljqRN3I43kGlJqotDHHK+1uuv4Auw==
X-Gm-Gg: AYBFou3XnCkrkBisMEDz2oi3w+RsUm93hD2mznDx76xRo7p2fT5S4b2IzdNayJcXkAM
	uD6HoV9Drdam2SxKiUF9OqARdiWYHVgt7WYVB8pKp9e4u6R/rGXES9chD3b0tfzbL8eZYVZNvVL
	kuvAmQ2IRJLCOH+BIZ1AePA1OeAi261lmoOybX9V4Y8Ulc6n8SnGvACDtnvv2TZvyd2uV7mMBNc
	ns9vKsxWaf3n08discmHo9Pbll/Q6SK6LhMi6J4FCMxXHkFUz4YZGkZPFWdS1JYfgTfCqiFixFc
	UjxtTxbacc4srvmjQgUjBsrjmr1Bh+ISLVEKphgkRn8QXW29UdlSy9dIps9nRT7+/VQ3K1giOoj
	dvknT9ysTaVX/jsERpD9Caq8G6I9hlMEk1bXBEwth4b0gmSFShx9ckOv+L+PGHzNdckYGz4+VTl
	9Im5rrBJmBzRZaOxxli3kPSfMd5/Y=
X-Received: by 2002:a05:7022:170a:b0:1b2:40be:a929 with SMTP id a92af1059eb24-1b3b6037813mr817970c88.14.1794261442608;
        Mon, 09 Nov 2026 13:57:22 -0800 (PST)
X-Received: by 2002:a05:7022:170a:b0:1b2:40be:a929 with SMTP id a92af1059eb24-1b3b6037813mr817919c88.14.1794261442019;
        Mon, 09 Nov 2026 13:57:22 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9e03sm2048895eec.23.2026.11.09.13.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:57:21 -0800 (PST)
Date: Mon, 9 Nov 2026 13:57:13 -0800
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
Subject: Re: [PATCH v15 01/35] firmware: arm_scmi: Harden iterators state
 parsing
Message-ID: <20261109135713.000049d6@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-2-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-2-cristian.marussi@arm.com>
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
X-Authority-Analysis: v=2.4 cv=AbYkjHXG c=1 sm=1 tr=0 ts=6af241c3 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=TxbN916H7FYpum8SNwIA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: Rly-GRt0SMyT5-5TpJMAgbd7vYtMgoyG
X-Proofpoint-ORIG-GUID: Rly-GRt0SMyT5-5TpJMAgbd7vYtMgoyG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4NyBTYWx0ZWRfX+kIjXaEHO+Wv
 3dZdm4Ls9sGueBUEFqwiedb/mniPCGgmcXl+6XNdyNqRnFg60PpRzbeoe6FSq9ZponBe9jS0ugp
 UsSNI31YMGv2nEK4GW48aIPV+jY46mg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4NyBTYWx0ZWRfXzOoZ2TkcTs0O
 9vKYp8EcU5whSqjICUrhf5/8A99xB+yek4ng0g8tpBgp+IBdlryd1SQP/cVjybkmCg80aaxwbQU
 6QhK6IoBn9n2TD7SLsYSeTUGaHgz2Okx1GXm6Ti3fVgG6N1TdDqljSmGmBrHPTb85QOFuGnclUf
 hCAc10yLMgPik8Hvvb2bymgmnEwF3oG10HYIQrIBFXYf9wjXXZeztzPBoY30rPtt3cvR6Hl+Hwb
 QDzfEwO7r/0i3PVaAHu+bSQ8QXO/PeT7IHEBMNE8GaQuyiNnStZbZ/yPC8Tie9/BP6q5q/6TY57
 3IcMf8Tf+0J7oYCzWh2OwREH9vae9wgRDSjFdKjoGKzByoAA/H7waDyynz0OASyz9opo23xSvJ6
 AjROiQCs2QCfxy4mV7oO5Bt++ClpMixtxnxSa3xEfdjVUCsST4WDtfFc6yn/0wh+eWjw3ArYG0V
 WXrI/aVZnpWsalwTMXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090087

On Mon,  9 Nov 2026 09:11:47 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add checks in the core multi-part iterators support to detect generally
> malformed and incosistent multi-part replies.

Spell check patch descriptions.  inconsistent.

Otherwise seems fine but I'm too lazy to check all existing protocols for
that minimum size!

> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
>  drivers/firmware/arm_scmi/driver.c    | 10 ++++++++++
>  drivers/firmware/arm_scmi/protocols.h |  6 ++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index 05092301db29..55d9cc487916 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -1873,11 +1873,21 @@ static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *en
>  		if (ret)
>  			return ret;
>  
> +		if (i->t->rx.len < SCMI_MULTIPART_REPLY_MIN_SZ) {
> +			dev_err(ph->dev, "Invalid multi-part reply.\n");
> +			return -EINVAL;
> +		}
> +
>  		st->rx_len = i->t->rx.len;
>  		ret = iops->update_state(st, i->resp, i->priv);
>  		if (ret)
>  			return ret;
>  
> +		if (!st->num_returned && st->num_remaining) {
> +			dev_err(ph->dev, "Inconsistent multi-part reply.\n");
> +			return -EINVAL;
> +		}
> +
>  		if (st->num_returned > st->max_resources - st->desc_index) {
>  			dev_err(ph->dev,
>  				"No. of resources can't exceed %d\n",
> diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
> index 8583159059e6..b295006ef1fd 100644
> --- a/drivers/firmware/arm_scmi/protocols.h
> +++ b/drivers/firmware/arm_scmi/protocols.h
> @@ -33,6 +33,12 @@
>  
>  #define MSG_SUPPORTS_FASTCHANNEL(x)	((x) & BIT(0))
>  
> +/*
> + * Common minimum size currently required by all the existing standard and
> + * vendor protocols.
> + */
> +#define SCMI_MULTIPART_REPLY_MIN_SZ	(sizeof(u32))
> +
>  enum scmi_common_cmd {
>  	PROTOCOL_VERSION = 0x0,
>  	PROTOCOL_ATTRIBUTES = 0x1,

