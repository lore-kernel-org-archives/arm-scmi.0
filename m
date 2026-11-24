Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560888;
	b=YQzohbMOL1HqiUmLvF8C/nCIFtRnDB8agWC3WEKmmUHXo7Og7sHdqHN7CXkYhom27VCC
	 uwX1gMXNeRuVhexZNA3YN4wM6fqI90Yxi98EAi3CPfq0ymeTzFuhEjG0S1VE1Mb5ZyGFt
	 Bd89iFR08CYAFjgMcX8U+PLH8DAWlh17+wjqmiN1vw1ZBYFRU3K0VDfMEIGD03GD4p/MK
	 yqNlN2vxY2znp6F7qiBgW+Kk03Q8JQuY7Lm5uw10We+fsp/rDS/YIFPUpSeNiWDLeHpj9
	 LLgWWUtMH/7h0ZAVJ+hcPHAUqplSh5hjDtEOgWH/FPBKfbduJZYdvKZ/oW3aQ9SUzBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560888;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=l4/M2/wWZQuAVqM9S5XjAM6gpmtHGY7fJh0chq5o+b4=;
	b=C7QVarT4sq9/x7ji0lJ6NTtNk8wV712Dfg1j7B6RFabdCDtpA+/iq6KeQddPXLevjtRf
	 o5+cy8SV9oiDLWOW/EsbQ9VP9zK0w3C5a1X3pWs9nVluKVEQIcv5RHMTWXD9StqQBoUN2
	 o4aA0hDkKfRp4a/LZYmyf8EPKS+J8YeFO199btoLow5ztKmhoPzBKTVts5mFyLd9yGzAj
	 2g4R8o9e2t4j5N5QYF9cQ+f4qJ+R9D36I1HLg4O69Lz15FBRAOWmepkZt9bJBa+SCVYUX
	 8HdiIcxDvO5yI9N8/0uV9YDKF1wO8CdI/8YQxa4BqJHOdo626GaBb6INP2MkB5nl9hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="V/w7y3um";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oses93L2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C40606A31E
	for <arm-scmi@vger.kernel.org>; Tue, 24 Nov 2026 22:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15C40606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V/w7y3um;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oses93L2
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMb0ME886652
	for <arm-scmi@vger.kernel.org>; Tue, 24 Nov 2026 22:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l4/M2/wWZQuAVqM9S5XjAM6gpmtHGY7fJh0chq5o+b4=; b=V/w7y3umcyAD9MIl
	VnL1ez7G5fhzewN2uskuv0SPL+7FXEazH4JzJmpVog2kulJYMyAgFa1u4PSpwAqZ
	oSm4VFbgDw6HEaVCYuj1DCfsMAfS7/vVEpujX7FmskO6h3wndc/zLWmCKC2xl4G0
	WRwJFY7/UAOcxMedPFycyUpcPX8fCiTIR6zp1Tddc01VOInHgnV1crSNkNDaUUi5
	UFlOrKHu4002kc5CsA41Z/uS256uKowa8Byk7CyjX6jc03JgYrHj0Q1warQWIs3R
	LlmEUMerP84BYiKvXumNjvkGCgwGY7yq5Ifw9tudErkV5hlAmHonniuUO4yE539K
	tWoLGQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rhc8xa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 24 Nov 2026 22:54:47 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b511ad8a2eso1328561c88.1
        for <arm-scmi@vger.kernel.org>; Tue, 24 Nov 2026 14:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795560887; x=1796165687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l4/M2/wWZQuAVqM9S5XjAM6gpmtHGY7fJh0chq5o+b4=;
        b=Oses93L2JMO5dpD3s4NITc1NBlis4TbqT8IYENTNYIgsvUgRv2exX069rGaj3GPkAJ
         /+mC260/t9SfZ2wVnh1brZNqemaOmGzJqgpNckpIjGBX+FSFRZLq9KRqrs6DSIkYbTUw
         aG25AkT8PM0phEWzeD7dWvzFlf+bHBQsL/b7QstRvrNu+pGlkWYqUfEYDWFGMHSyvH7k
         18rRZzRwp5f+5yvqXH/I+1AtBh8Uj/5Z7pV4J7tL1FvV31xPsO90n1WaIN0PC1jpckME
         FPUHRwssyMM1srtPVOIVSa0QZAMyKQF8HwYOHTUaYiBrgb9FdGz1ws00NM2+ED1I01+t
         V3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560887; x=1796165687;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l4/M2/wWZQuAVqM9S5XjAM6gpmtHGY7fJh0chq5o+b4=;
        b=cnck6tI5dVedS749dwyt22IlA99rGSm0/hc+42DuYOIi8VcnS1lnZAkDBPcDJpl/70
         2wHD5F+aTC5FIp83c8WAXrOFOWwXL2gwFQw01BksTYSYxAYkAzfgANTp7kqaMQqoH1m1
         Um5bFUX9MO+EXIo4HdxQvC2FbHmko6JB0PivUiA9RKWpUlOwkvWkP+U0PfC0dc/UGx2x
         LTjo505k1FY50coYgrcBR/Mcx5OT8yNuhrlNJnQQkLA9d0vEINqjNIaQJw/Bg1vcEISb
         r1grHnkD/2+Zhf9kkSFfhd14KqgD4e4Ao5I8lk9f9w3+76p3IhFlwgdjeLnTPxgE7L21
         fQOA==
X-Forwarded-Encrypted: i=1; AL+hErGh4MtMavbCJm328nivp9chS00V7Wniy3jq8w5LcTcWcX6foGQlwyDBOndeHsdNmkO3OfxONPSTPQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9IUk5pCD4YwYuOIC2KxfxA63MAEpt9JuL3qlYQFW3sbdpZma49
	apyAaa1F3XSbfzc4aQv+O02XH+pQ81APH2m+ouWcs4vae5EsVCIG5FeQTIKrjMJMVHF5HLv4aGF
	IzvfgRilIS/O7jfGnygfbNSEyLB6DzedctxIKEezacNaPbPyH09w+OI6yxgQpQw==
X-Gm-Gg: AZFdTZd5qBE90lOvAtkPwt2SqPmvFngh1PWX7GecYpCtxxlgkmfAMLyyLtdrX8TCEu9
	gLxvQm/TkEFNRlFp5jWtAFBUbpJcoRJdaO8fbl2pv1h6uafVrwECzDJKs3/bP8HbJ2V3S8XICwa
	dp4Ej3n967CEA6Wq6J6fab+ADjXpgxjFBcuNPBESepGrXeZfkc52TutH78JxeWl4GMdZpcDZQhd
	6Am/+JLCt84P4FcAytrxFKtGlU/BJk0Dc6ifFua8CKbZYjnwrmRpq/Y7+EYPqX0/I2yIMkhzgTO
	6QjG0bzTzGOv7xpA3+pVrHF3uMgqmWS86PaMmYE3GpMXAPj+9yGSpuTfTmLguf9burP9K/MzyCV
	IhWNdGAu58H9h1+V8rQGTU92H9bD8lfhSHwuWoGWzNOI55YibSGxztGzA+SH52jmow/ivnYyL1B
	3rImTK6ufPLtahYi+3m2p5o7auZeb8
X-Received: by 2002:a05:701b:4550:10b0:1b5:337a:6456 with SMTP id a92af1059eb24-1b55247eff6mr15710287c88.5.1795560886621;
        Tue, 24 Nov 2026 14:54:46 -0800 (PST)
X-Received: by 2002:a05:701b:4550:10b0:1b5:337a:6456 with SMTP id a92af1059eb24-1b55247eff6mr15710269c88.5.1795560886049;
        Tue, 24 Nov 2026 14:54:46 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm38075587c88.12.2026.11.24.14.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:54:45 -0800 (PST)
Date: Tue, 24 Nov 2026 14:54:40 -0800
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
Subject: Re: [PATCH v17 01/34] firmware: arm_scmi: Harden iterators state
 parsing
Message-ID: <20261124145440.000017c5@oss.qualcomm.com>
In-Reply-To: <20261124194841.1147072-2-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
	<20261124194841.1147072-2-cristian.marussi@arm.com>
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
X-Authority-Analysis: v=2.4 cv=BKkmP1QG c=1 sm=1 tr=0 ts=6b0615b7 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=But-FDUsNSCRHIe_eGIA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA5MCBTYWx0ZWRfX+5z64nFpogaM
 Dhzii1/allOOHQn+3K4F3c8DFyFyPDY+X0PuVjRp8OZ0GnufvGBXrikFpcmOqER894sXrK27eOv
 hDHNJ+YT/aYenNapwtOvs19jGd1JI50=
X-Proofpoint-GUID: S7NUyQg2WUp4jczxKhh5LDAI8MjeZrMG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA5MCBTYWx0ZWRfXwvAsOj5+MW2f
 8qiR0/aU7oYW2e1xtWNR7jcwv0dxSfmuqCfuz62Wo43Q3MTjo+rMyBRcLE7ixRKYUYkZaecFrJK
 mJTkR0f3bnRQCAC4eqbeUzGjuSaJEWOC4IZok7CazoRKpAbMSqfhX4gvba5aO8tgnn0A/WDMo+N
 rpx6WvPktSVC42CwaaX0Pv0ao+rtqH015Vq0l5X3V7+PJX9TexbDHOfbKSDZ4+TBcj1cqTPyFBh
 DyCLSEDpsmm4MrQzOia1c1HdKcb/aGm/mHUDI4FVt432LdTPHWAdoMiGXzxBokMeHHkX/s9ktrs
 F3snHRAxpy6SBXs9IrUnNgiHPiHGNf+WyYMRuJnaMAuZ1o4B/OU9UQMKlu+HrMkfF+wJMzQe2JU
 DuZ56VZS+9t+pI7Qu9gy1CcMgAzyyINB55CIgGF+masDOeQbjSgJACvd9zBntJV7v4Nr4aYrb0Y
 5a7/4NJntPzqrjTvNEg==
X-Proofpoint-ORIG-GUID: S7NUyQg2WUp4jczxKhh5LDAI8MjeZrMG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240090

On Tue, 24 Nov 2026 19:48:07 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add checks in the core multi-part iterators support to detect generally
> malformed and inconsistent multi-part replies.
> 
> Fixes: 36b6ea0fc6bc ("firmware: arm_scmi: Add iterators for multi-part commands")
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
You answered my question on this some versions back (wrt to where the magic
size came from).

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
