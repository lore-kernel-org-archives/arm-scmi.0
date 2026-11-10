Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794351287;
	b=K5lSxtsT8i/m4YalCosv+7HjrBd1lz5QKPNBSzaPeO6tvE9mMkSbuQM0aO8f5vy+bNJQ
	 YA034RShrpE7srz6zen115FpJfIa3nwF7HXc0suO7ln0tj/qu+V93c93jKLV/VEpBpmDY
	 f1Yl0GFcvdSIqwG9WbwGfuTKGhk3wU3bF6fdJRjLTqk7teFnbCI+Tzl+9eHdDk7LL8HyO
	 wgOT6EYmwz0dFVjFWWOV3Ig1KqY2Rv1f8c8w2kza26jog9NqlA0KuX6FkXZU7A/UVee8i
	 IhTmBZKILPhkcrvR+zzOXUKMGEWd+zSbAvhxPp9mZRjDGQJJjaL4aQd8Z0Egs0MnWRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794351287;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vXuGtK5krbBCur3qg+VgvLf8G+IVJJVcv2zNy5XnaUs=;
	b=mVrkQhoYx2B2Ru6neVmarX2oF0i2WE/bbBe0hfeCbCYMli2Oe2oIqPOp2QCe43folJyp
	 obKFixXcw1o9adkyRXSpFWJEA9ipiI4vynuaH+mazAhljTAv+HtICb7IXjmL9XRMfNnRJ
	 zhK2y0EfFDUl0jjungcQjt4y7OxfB5DLriBNSGOs9LQo3c8khb88zTkSn1vmTw5MGP6Z7
	 /f7TgXm8q6H4PdqMZcI30xGqw5+FuuJSn7pP0EuaB7S6geE192Ext4qAFmEEntmjRe6q2
	 DXHc8S92A601N4b2gtwKd3T9LFPFWAV1N3dSQI5p1/Hgkb60KhMHqKLLCdWLLvIfc4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E+Qn7Uey;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fmj1hNU9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3FF606A326
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 22:54:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA3FF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E+Qn7Uey;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fmj1hNU9
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMKkh9152673
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 22:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vXuGtK5krbBCur3qg+VgvLf8G+IVJJVcv2zNy5XnaUs=; b=E+Qn7UeymNps67d5
	wrvFa7hBA91ezSgAP2Nj1NnYtcT0IIJBDCANmprLkW0s+C9UUyAivV/UM5EHTJKx
	raR4xn46utCvdckjtofqC/oGelTlmcFImAnqpr1Jbop3njDt/xgeGVTamzdN2TPG
	3FhHoZPSrRELKajEZ2IWF0X9N3DI4P8k+i7WHCuLatQgVv3jJtAEKcAXe3xwrCFl
	DZHcz+CUF8A/ddXTDcul0jZcdmk/mkOSVwWfJt9R5U1SBBF49J/RqfnYHRsmF93l
	e4TZ0MeWzzEE/SlQ6qf40ZQRru3/kL9KCBjMIim/Ib0eT1MXOIm+HFjqkMtFEIoA
	rN8qRg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hux84bpea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 22:54:45 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36ecd5db581so3778066eec.0
        for <arm-scmi@vger.kernel.org>; Tue, 10 Nov 2026 14:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794351285; x=1794956085; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vXuGtK5krbBCur3qg+VgvLf8G+IVJJVcv2zNy5XnaUs=;
        b=fmj1hNU9AOcj3v0oFUpHsQIxu5hhOTrTCxToJVL+QfjoTCMrvnmTwRjxixIJXqmKnS
         Xnr3atkeabDtwkPgay2V9BqIThRtDNKt7ilewROnHfcd3v26deR5o0MSOtmVV7VsIt+i
         ON2eBt9iSN2qEjBF70hrDIlZIniXR9Q7WHNbDHiEEF9P0akd5EP95QgqXv735osjgRf5
         XlQMKkG03Vel5lKdWtDKrKe2U/knEFP+nELut26ByL+Kx5qj6hRrrr6h+jkCtVOgrJe6
         TesanRQ1lzLtDtsKyOODiI/JPO9jHW7RjZt/V6cWR01Ih82mOH5btHQU00ZOuacIYWp/
         R1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794351285; x=1794956085;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vXuGtK5krbBCur3qg+VgvLf8G+IVJJVcv2zNy5XnaUs=;
        b=f7lbv1wNphPyNomaHbgpQAUL5D98YF4t6mf2wDwAh01bX59iPhkzgMChZCxz5SvUyz
         QlRmu0bf0n/lbE7JOJwlzS2a7BhjNQQ6z2HCYN8DR+/KqO55cXIBxpd3p7w+n+Gw3TFN
         tFLTSiINIYsEnGed+WaJqY745d7UqryS6mYDCIAIQkY/G54d+0VjuysEGIR0g3tzpm9/
         J8r3flzPr4fdpEB9uH4IAL+wicy2xITbVagaZgdXQkVqgmvm6WfY3E5Tym1PXj5tj8hp
         9mgJXWCOsUU0cQFg854AK8kYS8MPvmCc87GIW7RiLoWTIEfJhwYI1Ld7GmGEWZWzDJhp
         r80w==
X-Forwarded-Encrypted: i=1; AL+hErGvjC81QX4XqJLL/V2aBZDheRv0Wjfg6nPd0uD3UckG83/QAKbBBQaQrv6nOIsQm6Eq3M/xFA8ViQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/EwwgygTRUd9NOhRaxYJUgPiOjAk//e1U68azeo4aZyLINcdvH
	MrlTLs7AcDrXMGoK+l17q5bjavDE+Nt/FMOaZl9Pz8+tgLgwwQtfGWEnOaY9UeADt34+gC6Q6nf
	N1ZpoFUYpll4Pbmt9JyJfbPpJWN5Q7W5Wzlg9/YFtjkVDJveNKgzjETHfwjichg==
X-Gm-Gg: AYBFou0KPILbK1QirNF4NzfEeYi8RrmHM8H+seFY7G7yObgeNfLUym9z5v3pPM+bBMZ
	3MwG0cJdGwiLtpIGtAA2d7MIAFIcChBUDNiOJAa7n25T1E2pRPULGDDug6vK6JHLImdeDMQM8ve
	sd9vsCN+ISk2lZogWMHdFzKLBnhy9lR37hEJp2i1CpoCWHU8ubVgPQ+pU3Q/pBCBnf8U1JRXd8a
	xBqf14Q1tDPpkX4Znm+Q1UjA+2Fh+nEIf1bS5Kh+kGG+4PqvWWFjZyhHuuYGdz1cF9E4bTQ/HuW
	gy1nKP+ecyJLpccGZjwLq92zL8Dm26pTaBwRwOX6WvvWUS452o9GSbfXxBmVbcjfs88F2SnnBs/
	SZ1pRYOG5D31TKdDCSGTvicRB566IxK7ZkWYB99Z+VWpNXd3h2zcgSxLArj8O211D1dT+zRYMqR
	Tn0YGg4hLPVCNLyI7ia239M0h6RiM=
X-Received: by 2002:a05:7300:51c3:b0:351:207d:bff4 with SMTP id 5a478bee46e88-37683b487admr1199211eec.4.1794351284571;
        Tue, 10 Nov 2026 14:54:44 -0800 (PST)
X-Received: by 2002:a05:7300:51c3:b0:351:207d:bff4 with SMTP id 5a478bee46e88-37683b487admr1199160eec.4.1794351283882;
        Tue, 10 Nov 2026 14:54:43 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfe07dsm10131788eec.20.2026.11.10.14.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:54:43 -0800 (PST)
Date: Tue, 10 Nov 2026 14:54:21 -0800
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
Subject: Re: [PATCH v15 25/35] firmware: arm_scmi: Add Telemetry debugfs
 SHMTI dump support
Message-ID: <20261110145421.00002a62@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-26-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-26-cristian.marussi@arm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA5MSBTYWx0ZWRfX7mWu+ZKPoN1y
 /FTw8iSZIh3aYzwXs4oPkYNhIIGW2j/KQu7HGbJEN3Qptw09BZE8z6AbqiTM2Qaf+zs16ZibDzp
 w6CBYBWYD/h6+bdmtvdfv9Eo4x3mYWH3Qb1m9Tm6sxTV04R4tkMIAQbb88qvYiXOxCpj2lGq/oy
 7gf+0di7z8sduaXZ7AMipThsEUzyY77s4ZBgCwYdYT4M4kkkaE25LwLNZIHDADUL22HpiKgLTgc
 w30F0pAdPo5x5WhdUpwgjNJ4YeJFjmcXiMgUjJv4VZm8BOn7TdU6Mv8+ZwbRQiq3itU5l1hwm2+
 mpDQ8+MuKPfSYJjVp28Lo0HSaAZaaJG3cFSz/JCpSe3tLEXIQw2DTymFcrszgOpiePNDNDCfkoi
 +ccZAuQwI5ERecOU11DMBNEeqciKOoabHRR7iNPBnJVQCaIgnxZQlf/2EuJTFQSBL3wA1G8RUOi
 IS9Cx8o+jiZ2kIAcVjA==
X-Proofpoint-GUID: l9b4ObKOA4gGYPcsmPJm1ZfMSlkmC0mZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA5MSBTYWx0ZWRfX7OpLIQ8KEknP
 kyA5hDUd/7v2Mfa3drED4DQ3PR8rX6MDfcci540qcSsREo0CmtKk7vRwzPvZVhDnp/CmfVoTsA+
 v913r9OqoLwq2gmJCkPalt3pFjuRfWc=
X-Proofpoint-ORIG-GUID: l9b4ObKOA4gGYPcsmPJm1ZfMSlkmC0mZ
X-Authority-Analysis: v=2.4 cv=JNSuIMKb c=1 sm=1 tr=0 ts=6af3a0b5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=CKzkSn0JwAB8-U6WE24A:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100091

On Mon,  9 Nov 2026 09:12:11 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Expose one debugfs entry for each discovered SHMTI that can be used to
> dump the related SHMTI in binary form from TBGN up to TEND markers.
> 
> No processing is done kernel side, beside using proper accessors for
> device memory.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Seems fine, one trivial inline. I find it hard to care about this
particular option though.

> ---
>  drivers/firmware/arm_scmi/telemetry.c | 103 ++++++++++++++++++++++++++
>  1 file changed, 103 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> index c21700bd1b43..7582fe295a23 100644
> --- a/drivers/firmware/arm_scmi/telemetry.c
> +++ b/drivers/firmware/arm_scmi/telemetry.c

> @@ -1683,6 +1694,91 @@ scmi_telemetry_enumerate_common_intervals(struct telemetry_info *ti)
>  					ti->info.intervals);
>  }
>  
> +static int scmi_telemetry_dbg_shmti_open(struct inode *inode, struct file *filp)
> +{
> +	struct scmi_telemetry_dbg_shmti *sblob;
> +	struct telemetry_shmti *shmti;
> +
> +	if (!inode->i_private)
> +		return -ENODEV;
> +
> +	shmti = inode->i_private;
> +	sblob = kzalloc_obj(*sblob);

Use some __free magic then appropriate no_free_ptr() after
it can't fail any more.

Trivial but might as well.

> +	if (!sblob)
> +		return -ENOMEM;
> +
> +	sblob->shmti = shmti;
> +	sblob->buf = kvzalloc(shmti->info.len, GFP_KERNEL);
> +	if (!sblob->buf) {
> +		kfree(sblob);
> +		return -ENOMEM;
> +	}
> +
> +	mutex_init(&sblob->mtx);
> +
> +	filp->private_data = sblob;
> +
> +	return 0;
> +}
> 

