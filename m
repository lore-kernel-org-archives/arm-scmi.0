Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794352725;
	b=UExfwUK4Fi3jgceboL4ZuTpEbXNjRN7iM6HhBnwhfi1/R71wYrJ0Fs/bgKZcOAKtQv2b
	 WNg4lyYGk+wmRAmnT3tC9b3N0er0NSXzfJEa0VzDsseZM4v0WkpbIYmEOc0HDVTbHbkZq
	 muN+5djBVoE5CJrB6Hr40Qy0iNj+iZGelZppwLwN/8N8ZXH5pbraif4KCTwMYjg2dpfsm
	 ncVQaDiejqOJpzug8h9B27bl86kxDe9Bl8Y3yu6OwdykHSAnGu3YPHfxD27s8pqGwLyZP
	 a0hd7g91iY2aq/VFXs1NssenyBW/ivoArSdNZ8F47h50KVOFIshlROCqYdkmerI3GkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794352725;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2B5465+J93nF6xCLEsT3nPxNqfsXSEGghlx5MhkIPjg=;
	b=UfmxBlkKG7yhL+NV+PrOGUQkEck5H5dpy0CLQlr6dxyt0x6/1k7FL7jbE+hfGMcDBqLo
	 9+LkEyBB2sYL6vj//47ViC6Z70VDyV2P0xvUZvRBG7Jp1CtxwuseRqzy4ALIc/mtlABy0
	 uOlcLeJhrRmM7hXPBxKAGS4B2mObsIzR9mZygK7BI8Y+IblNN6Xy0Hy/xM1oEA7ZL+d0Y
	 7iFVdciywZkB6NQzoNadDzUPhL+IW6zJGzG6d2d4NNK6pdvxzohJWGUrbI2SHohSQCvxL
	 +lpebFjkulUdBGwV/NC0xH0VN/x/rt9cqUIlKmnP1S7ebxlgJxr0CLRn5Vezf0UvtLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U5ARn3aK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Q+iy/jSQ";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715E5606A326
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 23:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 715E5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U5ARn3aK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q+iy/jSQ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAN8jTS570229
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 23:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2B5465+J93nF6xCLEsT3nPxNqfsXSEGghlx5MhkIPjg=; b=U5ARn3aKRc/0s/xT
	AP3e7rZRyL9xmrEKJQDNOv5f2Dy1phwrmPipC2LpK25ZXhc+O7OiFH9cfPdcEmOg
	3oa/+DPEAHZEREiCESwy9fZmD7CMj5vQQvLXvS+xbLWfDmJ2EaCHy1c/3lbrtcno
	T+1RwunzOgV8WykCpRE8ZUVh9NXXxNIo/09UIOrLiO3B1s7qVkhG5uMjR3vYKH16
	Yl+5F4ccNw9XnJN8OJ76Ymbjcvjbge9dpZ/Mhj225hJiMOGn5B0vAtiYDQltKELU
	j/NhFqXvmRlfenWzP2BO2TmK74e0Tun9VfmOLhSOH8v/tLw284SnXYqSR4x+4Hz3
	NKb0Qw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvcpeg10q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 23:18:43 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so5839634eec.1
        for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 15:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794352722; x=1794957522; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2B5465+J93nF6xCLEsT3nPxNqfsXSEGghlx5MhkIPjg=;
        b=Q+iy/jSQ2VYCWRaZKX7F8nhaZoUKeyge5fDs7HyinTznOJ3dA10hNAlm6GUjty6pOf
         pSHIsV5a+yb8ncyIgoLL4gGkhYXCqmGPhbGgd7QwF35+cJOd0TFfYYXIAjtTZFH2cP59
         TYBkZbH/rNjpaheQt3ND4O6198boLziwmVQf74Ek55eZMKNuzkeae5EOwhU8dlYb/WgO
         BoOvJ3nYMdtnW2ycp7L3VYF7T3pfKx/86eVNUaiLD94FHlKStygPd78U4tHn472TwIK6
         TVAttQihXPSd5BdS8qrR9pRMST3hgOuMHVA3GnWCaEN+dOALsdLrvFPet5ugOG9vsNUv
         jnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794352722; x=1794957522;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2B5465+J93nF6xCLEsT3nPxNqfsXSEGghlx5MhkIPjg=;
        b=b/CyB5fokg/L1Tv0uS26mvxKp+cQOyWb+F6fM8/P9EHqnVKX0TwwW5QR0GMsgkP7gJ
         LDyhQe11ImfPxbvQI4ejuDtR2JsuAFIH00IO3OYNOWS8TGxx+BwTNPKwrSd5hFS7+V+0
         6TuzV5m4moPvTFg5ZhKgYmZuNafDOOrgSln2FFKQPNlZgD2TtiM2jFOOGIcNGOiE/YpZ
         dzThp8s8RweD77OD1xh4RQKuoQwmSyUMqQf+l6LIC3F57uW++HljnEOL0aKk+Kz8Hs/8
         7Kpvlb8t8PgDh0e6phCir4i5O/HwMwxxk0zj61bALYW1PmPUKpp8GIsd8boEsWU8CxtG
         rtEA==
X-Forwarded-Encrypted: i=1; AL+hErHS+KdUPFr5kHwFxOyTE96JnVEpiPcuoDyizj/WIdp/VoHzCW+R5K6YQGfgySRC6KgW5VaDI2edvg==@vger.kernel.org
X-Gm-Message-State: APuU4Z81CFtxt/3+w7hLCsRqq1LVdyUsZTcLflmmM5759IdCKGDt1iAL
	ewxQTv0TlWo3mDJ8pN4kKUEkKdgRl76+f3Wcm1VetfJfO5Ak7y+8GLkm6Y1XcFfAuIF70Ql+afk
	mQYjR2dA+6l2K+IhkYCWIJwvsWK9bT5VMOe7uEFa6qotv9XMErj4XekRJgsi06Q==
X-Gm-Gg: AYBFou1Ac9uzWJyLHsAJgUuw4NGRAzZ5HGmnfnlKkrcYOAIiihgWa5ZntXpMTVv0tsv
	dW3EXjJcQ0kaZHsV4Rir0qakird7gl9VlJeQujO9Yb290HfAVVlTGEY2ZLjCorkcEp4Da9+vnS4
	Ju2xnC65QdJWv0aHiifpgw9BU/f+Hzjij4nIoHBa6JSVCis+/Q5Kknmfnhr10baOnqAzOD0S+Xn
	gjdnhNfbw431/kswubf9ld1xUy2+WpnPF5PT6BmUsDBlxmaDnS3FYayQvWaoX+CfgoMEaPsQ8zg
	bc/MRUjlyRaA1M0KRLum2eF8NadDWFTr1FFAD6HMXMGLiizDxMC/8Rgoy2crFAM2sniaJVoEcxO
	ivkLbhXSWTPj4cwCf8zmNs1U9XMm72PNB8DMXOnLlrAMh+2dzNC0Cpuq2POdD1tyHCi0XfcL6ra
	VqbXSbKnO+3W++0AuRuAFkE9FaHZU=
X-Received: by 2002:a05:693c:80cd:b0:36f:202c:48 with SMTP id 5a478bee46e88-37685d728d6mr1283751eec.14.1794352722259;
        Tue, 10 Nov 2026 15:18:42 -0800 (PST)
X-Received: by 2002:a05:693c:80cd:b0:36f:202c:48 with SMTP id 5a478bee46e88-37685d728d6mr1283708eec.14.1794352721742;
        Tue, 10 Nov 2026 15:18:41 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm9454656eec.8.2026.11.10.15.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:18:41 -0800 (PST)
Date: Tue, 10 Nov 2026 15:18:11 -0800
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
Message-ID: <20261110151811.000001e1@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA5MiBTYWx0ZWRfX2Ee39cJi5MSP
 Pl2BBh9wuEldLLDnh/Ir2aEpnYm4nTcI03F6ZXtVMIZOy+HQoKMV0jL1h4H+Ud2gEGP8dQIakCb
 8VDF8tdqzHxzg2AnVnR+g8OeZV7fo5YJeVdVe9Mp8Y7K/s0pAMlTWWc8aWMSCHCvR5N57o9nwKQ
 ZZpPj/CJ+1vRgDe4rgWF+Nd8TYAdVBbsprsiCgZI6BJMreoEfsdXCf/+W6c4Syed0dSBk4mfkfg
 rSOt9v6IFZ7J5nryCRIbBazFVXyLJieB+VrXLdKTFv98UuNEqS+CLnEU7Was59rnMvRuI3dhFHP
 el2NNHWsKoj4ziZtesqYXVCN7XxKyhm7brugAEcg0sOhBjJE5Yx+KsGHwZ0Y2arYgqwj7egkNW+
 5KVtDF35ZIdC/Fszw+lmsYTtbZOfm/VtM11gAtJ36JXYhCnmzMDWjWYB4QU2KNFJWh+XR2AXwLZ
 O1sdaPwhIj2McLx2rPQ==
X-Proofpoint-ORIG-GUID: xWPN0ANdnd-ESQvAlJY28AkhcYRRrDdE
X-Proofpoint-GUID: xWPN0ANdnd-ESQvAlJY28AkhcYRRrDdE
X-Authority-Analysis: v=2.4 cv=RfAFmFtv c=1 sm=1 tr=0 ts=6af3a653 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7CQSdrXTAAAA:8 a=SRBWjgdl_vfv6kPYSD0A:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA5MiBTYWx0ZWRfXzFKVKIYsIP4o
 uCsj1u/Ui+jaHPIgjFb5OE7ncvDcpXVxAAsLpM485FK9GrganDKZ7crqHEGZdrEMCBBsXlsA7dM
 sJQ8Ba6WSN1OZAb2xk58wctkEiWx4f0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100092

On Mon,  9 Nov 2026 09:12:14 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add a couple of simple common methods to be able to manually get and put
> protocol operations to address situation in which devres managed methods
> cannot be used.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
I was kind of assuming you actually use this.  Where does that happen as
it's not in the obvious place (patch 30).

Jonathan

