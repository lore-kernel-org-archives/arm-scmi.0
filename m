Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794964037;
	b=YUYKapybxQrpV6DztrltBjMJFLzU8dX19Mm2vF4W6tT0xncf4nw0W0rJkCKV5SDGyKlL
	 qaCtJOOQqe/YG56cZmXTQOBKirBRNMEjgPIvKlTCmLwEPjc79F9ID2U+m77Qj12478zLM
	 FAraznzo3ZCVA0hHy8xwKMaUZOiENGxQdsBn48a1OQPVbJqrfVAJohne80KY8myXXNkaT
	 x6ixg4KBe7alQSHX3TjHo+eUMmmC8j+00kLIbTzyXvGApnb5L0ZEPXGzfDMKWJ++5Sp2t
	 WGBQ5j1URsmw/y7vikHcF209cWEDuytSQ2Uf0E7gnnRW1Ir0jOLE1y4Xvr/+Niq1Z6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794964037;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dcTKtXZ3aPkAUgwqxkdywz0p3tJIPpV+oT5Yv4u3o7M=;
	b=43MBgGCGTFRxrfOACVzmdb9Nc7r+RRNjE77aL9OMzwyiA80EYLsp9+bBhJGDKlHuLr0P
	 4XKGjcqeIzjCr8/d5f/yfv96dGX2LiJUCqHnYKoMreUJ1uTLtmcJtx9ZeH5+jgUs99cow
	 h5LtIaEVq1DKuRdy4hBc2yi3wMTWbIbzPZRFkVvIl9YtAiLgL16j8AO3bmO9IJ4BmiVrT
	 F7Xytl672R84gRMhmgjgZW1blQ+FURj/jy9y1LhSmDamjJ3Qu3ZVL1F+2FWu4GKScZCee
	 WI1eeYXSUG8Gt3u4REVX3uQPlEtpsW0h1Z4gSIu5Vu8q1YaZXdP8QLwCKEj7wxW+zsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E0vFrXLK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SnMS6qEU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA00606A32C
	for <arm-scmi@vger.kernel.org>; Wed, 18 Nov 2026 01:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAA00606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E0vFrXLK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SnMS6qEU
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHMf4hW3559151
	for <arm-scmi@vger.kernel.org>; Wed, 18 Nov 2026 01:07:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dcTKtXZ3aPkAUgwqxkdywz0p3tJIPpV+oT5Yv4u3o7M=; b=E0vFrXLKHchFOKxN
	ecQsM1ZRtXi0Ym6SsPb7jY1o5WiKjJH3ZSYYHxZYRHFZ9OI+gjScKS8IUSOxjr9I
	CkRGyFvhUGTsghPY4aYuRNVbbD1wVcdHGTvsFGxwNLIkGrZ0bLc0qPZ4zgXUdTfN
	70LfnKL458QRMf27y/T8m4066XpVDnpSmMezQ6wm9EXdSqkodGPQeLRPtTuU7jDc
	8XQJHvsxD1i6T/bcMZ6xC+pXsA9BM/K1DuNW0G0iznp/wWbxbXLsYD1CIWClOcSP
	1l02aOG641oFsNWQf4zaniM9hf5SlhcMKGaq8QzwvMrJZ0sJlq6JVFNSmh5cnsYx
	o6BmTQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvcggka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 18 Nov 2026 01:07:15 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-14373747468so454261c88.1
        for <arm-scmi@vger.kernel.org>; Tue, 17 Nov 2026 17:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794964034; x=1795568834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dcTKtXZ3aPkAUgwqxkdywz0p3tJIPpV+oT5Yv4u3o7M=;
        b=SnMS6qEUIhsA1ZNPGX2d63ztD0osxhdZTzmcxrGI9jtu2ny83ZBbhlOGPqVAQkdo1C
         +f6PRT4xuyPIPQgNKKchJuV8aP3tsZ8nWfcVGpcs2WTeukTJp2Vv96YhqqLfSjMB/Gob
         eKHIwPJYt9ZTB5p184UG3b1o6N8AMohPRl8PNRJK1s8u9JTz7jnAGiZb39Ta43az5uLg
         7/0X3F8TXWkOIOs66So/KXrvI+ycTnKpwk3CV0kaG+kCstX3+nnGPOJej/3S5UTntmkZ
         bSGeiArNrtHDy/cZ6PgUZILWSxictyTlIGV/PC/yN+ZRs0bJLvAi7O9KEfRIwBFs4n6Z
         X7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794964034; x=1795568834;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcTKtXZ3aPkAUgwqxkdywz0p3tJIPpV+oT5Yv4u3o7M=;
        b=GGQ4dS1HFVZp1pLJ1G2k+AA6/mNdew+WP6hxa1nVTHM1Il0Fw1+gowaG9kGyUVCLI7
         odo6pj/e8uIADZDFvGQZE6NxCtkfU4RLR+cdaDXY9d3rZ4TRbPUNSDcZrdmZ5jRbryK4
         ynCEUrIiYicSI7mRnFHeCXDkXMchn/0MxjZS76Kd2cV8IBwkF2iVUvXVyZ8h1pggBQET
         jKfSE7IlOerZDLRdqhbgb6f7572gfr6j26LgB5Vu0nQZripaA+oEz8yg3jzec7mNfxAN
         z/u6gdLOSCcdsvSH9eZjfH10ejgvDFVznhxYBO2Ym/CY9WEjwQdlNZhEshDmLI2JnTas
         HQAQ==
X-Forwarded-Encrypted: i=1; AL+hErHtK17I1wBP7lwtnSf/zpKaf7hjnUa97uqqNV8WbpyrupK3yaKLA7aEvCVzBh4O9KewSwAjf2qK2Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z8yUj38Ci7CijfivEOSP6djBNWJ3G9UehmzwhSTIknEAYNRbixF
	uIwNc+NiAwAMezrtNIXDJA75qGGTUoBEwDbLwitJbjjQz2TCpQCL/sc2l2GKnE8H50YbAlF3RE9
	CTy6x0HhT71HLMsIwPR78WxDSNXZ4IyTr+wlJDWKrCImLYtgL6hXUNGXs9YstJb6qKPUcHA==
X-Gm-Gg: AYBFou0hveRNNu9Un+K8sk6WQfT54leWXlGjh6Bd+BDq3mYp6TrXpKAKftBs+C/Y+cR
	GwtGTnGPIGziMj1iTPYrINCG/qid9BygX93IEwxXt8rpIB9GxVBGvp8D83OSFaqRQbbHZ2+cpnZ
	PNJir0w0J0LE856Cbm8hSlRbJV4QDsuemO3FcmOruZfk+ZqpbHJZGhOsC46mB48CM5Gw41sJ5pL
	ivsuZZ99OnvPmDepYCidJLZpLsUN8CSvpgpiMIXw0n8/WPYe9Lje/QzM1FD23+/jt5kjjMFcVsc
	5llq3Xz5X6pwHXOssK7Cx2gGau93BON7TpkVLE9H7UZEYh5mgs+BelMtNz6mn9a0q0EpeCmPR0t
	CSPBjsQojZWVJQ+uryjujPOiNjDiPsv6p0g4LdXsgzJZI7qFrc/CTOJdcj3/tTJmwCIyJ3HDQYQ
	Mp4LFTBkTRrcExnmaP67ykaiUL4mQ=
X-Received: by 2002:a05:701b:2901:b0:1b5:10cf:c458 with SMTP id a92af1059eb24-1b543d0daf5mr1270266c88.23.1794964034457;
        Tue, 17 Nov 2026 17:07:14 -0800 (PST)
X-Received: by 2002:a05:701b:2901:b0:1b5:10cf:c458 with SMTP id a92af1059eb24-1b543d0daf5mr1270241c88.23.1794964033945;
        Tue, 17 Nov 2026 17:07:13 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b544830c99sm3101462c88.15.2026.11.17.17.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 17:07:13 -0800 (PST)
Date: Tue, 17 Nov 2026 17:07:09 -0800
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
Subject: Re: [PATCH v15 00/35] Introduce SCMI Telemetry support
Message-ID: <20261117170709.00002088@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-1-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
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
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afcfa43 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=FHltUQ19mvutv370iQ0A:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: Z55XZhPiCYT22-17_NJZ-XiTRUFd894l
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAwNCBTYWx0ZWRfXxoA86d4a44Hs
 TaA1DrG8gFmUaIJoOxiPvEO9caAvX1sm5Ud11y2CHV9v1IozqrhWDctWuxFWt/t68AD/9PJUA96
 BFlqBA0d9BMV/s8A003ppq+xHNzONj8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAwNCBTYWx0ZWRfX98b4/5n7p0Vx
 jw2V0ASrIgTNEUQNfoajQwPVRDidE4Dh9Mbl7p6EodAGDshhmraJAcs3YYZlYry2+Dr6HPVspWS
 gr9lal32LZwR6r33fzF8WG76khL1DW8FcNN0M1mAWltwNEUMwPj8QQI60sU+j66TGGlF72N+8Oe
 W4WucJz8pgQ3qIqUn6cCLwqPFyYnGIspixBacpVunIFN+UD9NcUh7Swv55f1ThEuhh8+UwVEzWA
 QIhs55bZQ03BOcBZspvRx0gTp24Hw0pORK8EBT5o11yEaerLlTXlYOYQ5ZSb6/mrJv26b5hBqBi
 grBFDk1JA5HCj2PD46GErijZt7IABCTI1hwr9M3sS+ivIxIBtTDuikPvcZA1w8LlK72TlNRrbCW
 NBH6v5kNV7TcVA8Pxr2Obo+s9P71jHBWTcoxYKV/B3Aw6G3LDWkZOuap4LLeKRCvO2c8Jv5AGMv
 VbcaOLoY8vH27Md7LyQ==
X-Proofpoint-ORIG-GUID: Z55XZhPiCYT22-17_NJZ-XiTRUFd894l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180004

On Mon,  9 Nov 2026 09:11:46 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Hi all,
> 
> [TLDR Summary]
>  [V15 highlights]
>  - general cleanup and hardening driven by reviews
>  - improved TDCF access routines to minimize lost samples under load
>  - completed ABI docs
> 
>  [V16 TODO]
>   - address any remaining V15 outstanding Sashiko/reviewers issues
> 
> The upcoming SCMI v4.0 specification [0] introduces a new SCMI protocol
> dedicated to System Telemetry.

This is one from the family of issues you find when reviewing ones own
(well LLM generated) emulation, realizing it doesn't match the spec,
and yet works.

This works fine without the required SCMI protocol property in ACPI.
2.2.2 of ACPI for System Control and Management Interface 1.0
Platform Design Document. 111115A 1.0

Now, in here is an informative statement...

Protocols not listed using a property may not be enumerate by the operating system.

But they are... 

So, obviously we can ignore informative spec lines but that is a pretty strong
sentence. I can't immediately think of what would go wrong if we ignored it
- maybe we'd not pick an exclusive PCC and fallback to a common one the firmware
doesn't want us to use?  But if it doesn't want us to use it why make Telemetry
discoverable on it.

Should that be wired through from the ACPI parsing code?

Anyhow, not something I care that much about but thought I'd call it out
as an oddity.

Jonathan
