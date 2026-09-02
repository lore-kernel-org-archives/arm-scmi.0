Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6DB42252E
	for <arm-scmi@vger.kernel.org>; Wed,  2 Sep 2026 23:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788391879; cv=none; b=gHlsaooUiP+E0W6IFW36oMUXQR4nfcbJFZKRBo0DvWg8XVjVdNKP55qCT57C9Ov88K7DQflvxkYN+nB2wFnAXPk1fvb3gpHHmK2uzLxEH7TziFaDww3sJtoBCJZw/zS1Bl9sLIzX6fkSdFESo5id6m/RmmCeIjoVTbH3rk7AB6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788391879; c=relaxed/simple;
	bh=N0yb1t2vCGYnUQnmitMaYk52Z6VoPuXFkSk4MQOfmVM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dXQnmLOmzcFs2Rya80nOFCHLhK7iWdFatdL+wG575BPQrIOLZHufYfI0KlrTEP5muGKts8JQI0qc6VsLBGCQrEWEbX3+r/sOjDc1z/vrhyqtdx2pJdR6Ep7kRankJfK5Qex+mQGgre6hvBBK6EM/NB021678DI8/HHOWKQ8fDhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AkyMYLsI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HhAazNzR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AkyMYLsI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HhAazNzR"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682NHgXL3435182
	for <arm-scmi@vger.kernel.org>; Wed, 2 Sep 2026 23:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mKKR4HTFazCmqDjGZwCQpnxxG6aHYng7ce+aC01HqDI=; b=AkyMYLsIPX80W3c2
	UcMtM6MtTW/RC4O7AzOxiaGw0Mj05RGZWRhOCWGTRMvcHVx8dxMLRZX9dipdY20K
	ALzbDKQKe6fUmNkpbpB6X+Has2ZZ2uFUn4MHNoWtFf8UZeKoVwaxYv8XKYv0guFn
	rRsgC9X3AOeBjUXsHw9v1hkvEUUDJZLZDxflsYwVgLXsNB7jP2XcYe9pEUMCFte3
	ODfvnlFEAoIXUKbbXacK5SiJsKN3JVxDmg6expCl3lfX9WHIdGjafziwZnrB0Jma
	Otj9TfCb9Y5wipIA68YHCp1di6F9kFdjvGNjfP4coHNeES5Kb6Q58s3eDtQrRJ36
	5RxHMw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy3mry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 02 Sep 2026 23:31:16 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so2289437a91.0
        for <arm-scmi@vger.kernel.org>; Wed, 02 Sep 2026 16:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788391875; x=1788996675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mKKR4HTFazCmqDjGZwCQpnxxG6aHYng7ce+aC01HqDI=;
        b=HhAazNzRcM0b45pM0jrXjeoob5saAWNXq55nTIpzynsgXj8OtW8j9qx/0FKgmBv2bE
         e2TUd+eLfdZTR0e+dvVgxoeX2CKA1A+ZvlxywyLy3kRpcjTT2/6PciRKeQTAJLEYprUc
         YdsMBJJsPsP0yllBtrkMmenoixvOv6zQlVaQw/EYVal/A9+XMNsCpvBik5yoS1WO1QkU
         z5UD5rpiAy1Fbn+ZVwSGida1gishHtumO1TFcLn8/1qYtlh+HI+vk2yl2fKbBhej6dYd
         o04fVitGUvbFkMBfq4cWhQuP01EGyaHpC7ZR7dfJY/HTv0KTgS1vdpR92treFEfE344f
         xtpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788391875; x=1788996675;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mKKR4HTFazCmqDjGZwCQpnxxG6aHYng7ce+aC01HqDI=;
        b=i1KgkY1G14bAqq9FbNVgbsytLA/J1w0zvjum0YlB5pzgoeVZokFgV5WVstEt+sEXEv
         QvNwXGk3G2TeiFZkv8J45diNc1S9dG7xJfyKrVG+bLfk3ZXiBXteM6tWKpgHL7KkNwdg
         6S6ipLCf2OS3WiEFOGnOp6IPc/Wg70PrYjZHNvFoquNxVJcJEmO67K+xTOw4ClHxyACJ
         28m8N4dAN2ZPPepv3FmEHklb8JZAURl8oSQGrr/cduAl8D8DzOu4Le4GNwogzoGZbJ24
         cIHnj5UTBrWVck7nLpUzEXUKK8rg32SEP3kM5blhRkvB+UYOIJ88MSpw1bnV29XxXH5W
         Y23g==
X-Gm-Message-State: AFuF++lWDiD5IdbKFu6psFjrzAGW+J+1Yd9scVDiTSvWKE1bxLsRBGX4
	q6A48FwWFCdrrqfyu0j4VtKtd0AhDJvhr37msCS7rjZIIhvY6E7db7dnCI2Xt4MJbQnVTdDaBNU
	i49kucHyFWZxcMKBLZDTdTAqm3K/jcs51fqn0gjUDo8N4nhfUOglSu2VG4FHbPQ==
X-Gm-Gg: AYBFou1ksgW3DdbPE2twTyAAicBB4SgFx0hRBm69Xr6/ecib35X6ElHJRmNA1mXRKsY
	DPwx+/fNqLAaVgp9qhp0d96889GFHfNkJcqitwW/Ps4yqZTOT3bxPLZ4JF2bozyVLlwlYQZ+Zr6
	s1w7SdUzca6A9KgjljN2jfwHxk4KEkrsTTurbjTO05rhynu2yNrdLT73VqsXr5qpWcWdGInchZu
	vESfgO5k21PGvFcMxqOJldTLPa7aCq8Pqc2C7bbfAl6Kvg/HjoaKmfsl6E+puZHsuT4ETH61M+b
	8ToZju1x08mpxZKl6YZbH5RwOu0mx+XiGUu//J1UgDPuQybyqLDkuEio/8BtSn2sHiAbz+eLl85
	JwEEa7DutJO7jkV99/sQ6bohUxOk=
X-Received: by 2002:a17:90b:1e04:b0:38f:57f0:1f5d with SMTP id 98e67ed59e1d1-39aee16ffd9mr10385527a91.15.1788391875223;
        Wed, 02 Sep 2026 16:31:15 -0700 (PDT)
X-Received: by 2002:a17:90b:1e04:b0:38f:57f0:1f5d with SMTP id 98e67ed59e1d1-39aee16ffd9mr10385466a91.15.1788391874730;
        Wed, 02 Sep 2026 16:31:14 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325534c324sm1379359eec.5.2026.09.02.16.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 16:31:14 -0700 (PDT)
Date: Wed, 2 Sep 2026 16:31:10 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
        Breno
 Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 9/9] firmware: arm_scmi: Validate PCC shared memory
 signature
Message-ID: <20260902163110.000054cc@oss.qualcomm.com>
In-Reply-To: <20260902-miniature-bullfinch-of-agreement-4e15fd@sudeepholla>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
	<20260813-acpi_scmi_pcc-v3-9-cb6b88b4ebb3@kernel.org>
	<20260824132450.000045ca@oss.qualcomm.com>
	<20260902-miniature-bullfinch-of-agreement-4e15fd@sudeepholla>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a98b1c4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wEqXFAteuqzos8D3EDgA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 4voX6QUCo12J8dMFvP_wy93LN8XDUtY6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDIwOCBTYWx0ZWRfX5oNuVQJv2iJb
 wP18K3AXRQJQlBtfIs0h4ndghlHntbh/H0Gl3Cwi2KKv+54TDoVoHrDJ+H2TwYqUSkM+R5/WAFW
 ivoPBm+C+X/78CAGnDB0BNtA5xJ8A2M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDIwOCBTYWx0ZWRfX4H70n+lFpO3D
 kpJ04vbOt0oaIsExNN1/NGZOObo6ostWF/Aq+SWo55sAA+6nGLnsJM3vr3gWqnGf/q44zjBiYWk
 F1w1FO+HyjmoT/pc3SsEu/qygJD8MkMC0ZMg0vu7LnJrdfmILFxnJBRlbpRf+iKoBmTYEazzQWn
 Fmkcvb5cZuTy5t6dQZ9hBQheDD1GZUDpSTuYylk8i2g3Uz5ZcoZVtL8dZIKhYcrvcSS4MOInlvI
 6KdA8yw49k03HPdBK8tEkNh88ePaLi9F+E8J64zQZvZDWhq76RHdyvkMvAoCYe7lx3MYa5mi27S
 HYmgcq4ZLhe8ADAVtj4nREBHFqqd6Au2RQwqxjeuDiHLTiXJSv2U6jepKy8bxlxEYLd4JAn5PHh
 h58wbmLfcXsr64BhjI4rwKOlyKf0BNOnUSFwYio80fYYUoXpvpd4q/i51OSnt3D9qrbzVhwGqGO
 gsb97yMk2fYKmjeN/Dw==
X-Proofpoint-ORIG-GUID: 4voX6QUCo12J8dMFvP_wy93LN8XDUtY6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_06,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020208

On Wed, 2 Sep 2026 09:25:19 +0100
Sudeep Holla <sudeep.holla@kernel.org> wrote:

> On Mon, Aug 24, 2026 at 01:24:50PM -0700, Jonathan Cameron wrote:
> > On Thu, 13 Aug 2026 12:33:04 +0100
> > Sudeep Holla <sudeep.holla@kernel.org> wrote:
> >   
> > > Validate the PCC shared memory signature when setting up an SCMI PCC
> > > channel.
> > > 
> > > Reject channels whose shared memory signature does not encode
> > > PCC_SIGNATURE combined with the PCC subspace ID, so misconfigured
> > > firmware is caught before the transport starts using the shared memory
> > > region.
> > > 
> > > Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>  
> > Interesting there aren't more checks on this in the various PCC users.
> > Question for another day perhaps.
> >   
> 
> Tried cleaning up all but some platforms like Hisilicon kunpeng complained
> it will break their platforms. So added a warning in the core but I want
> to enforce stricter check here for SCMI PCC.

Fair enough.  I'd be tempted to check in core and add a quirks list
for those broken platforms but meh, not my problem ;)


> 
> > Seems correct to me.
> > 
> > Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> >   
> 
> Thanks!
> 

