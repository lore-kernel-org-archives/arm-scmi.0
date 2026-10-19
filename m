Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792442101;
	b=AR8EcILPN4ja5gkZfut4eUcfHS5YeAOg+wYHL5Ae5BX+3LgZQnXSCOtxVHkcRXheZp39
	 BVgWu0VgBjpxQzvz5YF8jZeCMvJlxIdIo1TYGpXF0g4iqCnTllAAtImFepGAbpM48yFjF
	 XBBUul6l48M2/U1w6YUeW+12x58vHCnEOlYBfpSUmtoJgUA76UURTOiII9+oWZX5vDoSA
	 S8XpkmUwoSTzcaY6mVMrgGUujQ2UElx+xSs6O6Pz+82Fz72tXM7UvEzeAsfUJhoZ7g0WM
	 IyhTgVxO8E96f93hB9xIpCBdKKa3b6y95VvnNgcIkfxsHydUrvlmAZhRt7QEVVDmnfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792442101;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fxpI/j7tSygFqEOcpnrDp2XkhyVuL60i0HFuGyDuJN0=;
	b=KgqWFbDpws7gATGtlt6T7HtqIpqmJjU06jyKESZoemoZ2vXrVWEWOBgcpP5BsweF9/mQ
	 mMxGULMjcrhnAAQ3FW4E4zsNVagiCX3sh4ATbwI9I5v4R+6dNXnWFapRcQ8vcepI/XdMh
	 kvM58oHBxx5dH/Yg5g9I8oS/eSci4s9CkDr6YpXxOgLEP8giC6BfEuTo3qHrkppoV7MJ+
	 u0SSVP1y0ErG4VTLB6bMz5LEBKLedH2K1c+zce7m2441amfhea8ZYVtAdlI/xIp4Q51jI
	 h9NNaUGsTQS/k1LMddUrw+FpRMOX6nyWUD6xh+S06bFw0wG4/jJ39r6cxKD4599EBUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a48FjdXZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bMrzkhMb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41811606A339
	for <arm-scmi@vger.kernel.org>; Mon, 19 Oct 2026 20:35:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41811606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a48FjdXZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bMrzkhMb
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JJK4Mk2157746
	for <arm-scmi@vger.kernel.org>; Mon, 19 Oct 2026 20:34:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fxpI/j7tSygFqEOcpnrDp2XkhyVuL60i0HFuGyDuJN0=; b=a48FjdXZqNLtjTFD
	iyc/k0OfwXT3cpSVDLRUGRko5vq6AuZVieFgGNU2Yv7ocQQ9ARRhlC16fynBejck
	NAkck9VFRxTb8BtGNbgKiy6lfCF/OIg3W4i3UbSbOislRk2FK4XaVAJvrrE1BS1l
	MCEc8dDHCfv4BDykfD/qinKWyFygbfoO1SEpZde9j4nCRECqW1qLjOvsFDFa7bwm
	n01RV4pK02kAnbEcnD84ZQA16lVDqu9rNl1/2R5UqWYoZOiEheVeFZDjXx1PTEE/
	1hnhrh1a+TjCOd6+zVwpHnzA2EB0RUwUx4Dx1Qe7HbRCKPPkace9fz9NkVrKls1b
	rfFPyg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf65k5xt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Mon, 19 Oct 2026 20:34:59 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so5424677eec.1
        for <arm-scmi@vger.kernel.org>; Mon, 19 Oct 2026 13:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792442099; x=1793046899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fxpI/j7tSygFqEOcpnrDp2XkhyVuL60i0HFuGyDuJN0=;
        b=bMrzkhMbYN0Jau2w4HqkH2XXtRi5Q0LnaaAs3po182YjBnfwMgx2JDfcuDC/excmmI
         tGDnJtMaVc7gJp2WmCXc1v3E3zljZpz1KtYt3dArusGzfTonFU528h+LokoqEFvJ4yfT
         29w7oX6TAcsBGBhIqvVYN2PcxzR1Azr25Vmy1MecD+7yZCEc5ArHT9t25AYuD0j5w/u1
         i5hzkjdGgQDj1PUmhyGBafea6sILD2Tfdzl0p3IDJ8hzTOm1LktG/vb0GFx41Okfwiov
         Gqy4Fu1TZkA5Y/ipE9opZ9z0wbQFU9GZJK7B9TfV2bBMysRQSaeeyTWwF5iyEuzoaXfI
         a1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792442099; x=1793046899;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fxpI/j7tSygFqEOcpnrDp2XkhyVuL60i0HFuGyDuJN0=;
        b=SGEMMuJTT92LGGPZBjfqHEAToySnuN9kaG/YxHyHSHdVefnoHo5zYMRftl5ufTECTg
         8Qs51q9tjcPd0fSrqwpYyVMz0XXVyhXP+oDQV0GUovkWHNo/qmjunzZwYVZs9zHGrj2Q
         oZdEybqjgze+aPg3OGTgEbt1ci3+zyeM9Vc5azzAQ4hipianbZVG/EeDpZA8Kkjthap9
         r+lBCtD7d1N2mNgPUhZwu8NNtTA0KR1ZZKgV/ckqWHJqwK5f8C71yH4bnE0QIxEQEqNL
         gcA7ew6eg3icMxcyrvkwzGbuzEdx6aeiPQxswGnDkVNzH6PGa7hKaOvCR9R3yS04Dbho
         oqEA==
X-Forwarded-Encrypted: i=1; AKwUvBxGlVGZA1QbZ4LSNxn+aYmbdlUOu4QNkW3dYO+v2J0qU9ohmbGOCx0TGCug3PzB/BwF6UBRxebTbw==@vger.kernel.org
X-Gm-Message-State: AFq9FYImQ43/7hKacueN3orAgtQngKdotGKLgUrpYtgpISzSoxsCOaG6
	HxCS2YBq1PDhWtE93JHzbIcdBQE3lD3XTcTj9ftiTJZqOPrX0JwfAn/ilvQMdzMZ+LtAeFR3Jkw
	R8oxQARlSH8EaEMemY4OTFKaTN2ll1lmWFGs7Uso3azPa/QD3sqBkXfFn5Isz2w==
X-Gm-Gg: AYBFou3bXisz8yWH5JD0WMGQH/4JQjEZTWgu5ydWmUrZKDMsrchgUm+HqtwFbEI1Y4P
	8N2A2qVkCU9UJbLMR11tW2j3Q+P+BLr89l22Jv8xpZLSTbrrJA5E7pEEueUjQBv33fjL8RAHUbX
	LjYpa2TP/9CoBYaA6/fc7OVipZxNlxmCUgIKhYsWaEfoKlbfixz0K0WyFG//KFIZPygwODZp0YI
	bs3bwA7ua8+rvR5e5+FhOkZUE8tjgMKaGp+pVjUIZUVlnIMvSHLdozRfGPfsI+zoAxxJF1/T9CM
	RmA5FGb5LrBZGbTNBa8TnjsuKAOteYuk4IMSqaMPSe8vfyOdlG8d1nUoENauyc2g6ZSPgAZtqDi
	WkRQCPwv6yhwRUvF00hvEU5RKX4XKiY7Mwtim2EkHRE8=
X-Received: by 2002:a05:7301:6447:b0:359:2729:1797 with SMTP id 5a478bee46e88-361a224d1a7mr15667645eec.30.1792442098727;
        Mon, 19 Oct 2026 13:34:58 -0700 (PDT)
X-Received: by 2002:a05:7301:6447:b0:359:2729:1797 with SMTP id 5a478bee46e88-361a224d1a7mr15667603eec.30.1792442098201;
        Mon, 19 Oct 2026 13:34:58 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a79c7sm34045005eec.18.2026.10.19.13.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:34:57 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:34:36 -0700
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
Subject: Re: [PATCH v14 01/32] firmware: arm_scmi: Add new SCMIv4.0 error
 codes definitions
Message-ID: <20261019133436.000035ae@oss.qualcomm.com>
In-Reply-To: <20261016185553.2794459-2-cristian.marussi@arm.com>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
	<20261016185553.2794459-2-cristian.marussi@arm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA4MiBTYWx0ZWRfX4W/vVPmnMYGf
 XU1vu70qI7VxAuF30Weo0Dml0vWgD1/EovVAQW5Q4i8x/ijx5vXS+HbWr6lx5WRdJNyLpNkE1OI
 fwPZeEx6gYPegrCWQdcfwZ/DWnp/kZs=
X-Proofpoint-ORIG-GUID: UT9SzK5hIDiMeWkrgX6VPLKGHPFRfxVY
X-Authority-Analysis: v=2.4 cv=Y5ptIReN c=1 sm=1 tr=0 ts=6ad67ef3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=g_d9z9Baj32627wmS2EA:9
 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA4MiBTYWx0ZWRfX1wWLKMMjgLAK
 rXOAfFxjq1lzQo2NsioYvkVHvLKdFSLtLt7rsCxbHnhkxzTDSAsSv/h45kXfsF+fYjGVfjw76Yt
 hCZiv7YyzlBV+jE3R9wsLDeGV74IHwJ1km5BoG16pHSK2oIRR+HdrbxpPYw3lKkv0Gfpb0YDL6N
 O96nealnhrOd01vbvHxRd9uFncyXGBae5H8lPexXUj3y9qIR3RqVuk48wVxD0n1Ta4GbHe3I1n/
 TNcgL421+tUcgHFa5T9KVwQCxGp0L3sF86bruMP6GGLbe21QbIC5x2sT8fnG7X3kO2zfy3cMhO6
 GOXS4vrKWiD8rSb/0OXA9UTKC59RQJwcRgDx1hefPMaq2Pl8WvZX4Uf668xEC6Gzi6v82xN7Ugm
 4ny6MJoL+lHpVXpYynQ8DLZZ3HtiSm93OhRsDYeslWbNbiD27qoyFrgkdgyMV6p5F/1M1NR4suA
 xpbkDPWX8ZJgu8wWCPQ==
X-Proofpoint-GUID: UT9SzK5hIDiMeWkrgX6VPLKGHPFRfxVY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190082

On Fri, 16 Oct 2026 19:55:22 +0100
Cristian Marussi <cristian.marussi@arm.com> wrote:

> SCMIv4.0 introduces a couple of new possible protocol error codes: add the
> needed definitions and mappings to Linux error values.
> 
> Note that SCMI_PARTIAL_ERROR has to be handled specially, so it needs to be
> distinguishable.
> 
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

> ---
> v12 --> v13
>  - use EBADMSG to map SCMI_PARTIAL_ERROR
That's a stretch given definition but I looked back at: 

https://lore.kernel.org/all/arK7kLlrg491EsMf@pluto/
and appreciate the problem of running out of error codes..

Guess it is the best we can do,
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

If you do a v15, maybe capture some reasoning in the change
log or the patch description itself.

Jonathan
