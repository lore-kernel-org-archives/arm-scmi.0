Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D90399365
	for <arm-scmi@vger.kernel.org>; Tue,  1 Sep 2026 14:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273109; cv=pass; b=bkg1wCjcGBS28fefDmMBK7XqZINLYJTWuW0y19W2Dxg/gaqd0ZeblkLfbjOxXBwlZkZitoFPWJUgoOdIccMNVYBBdnABuL4zxc9+t6e5orAshQ2nXLMS1iuVM6Vysz26aT7yWFKax8Ghh3yQF2WCkLdd5GOSyMPhscmdM4SuMto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273109; c=relaxed/simple;
	bh=CL+Fm//7PJAuTWNWRctOu0wP9tKrbcMfws3PNuylb8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WGjmer4yIDHft5/9Jh/dh8Ud3u6POaG9DY9KQMeN2DeXv48gzHAiMmIkx6O3FBBUescvlwZzYkOKBbGWB1Ca+lj78KA0guvFQ0krf10jWYla7qPEU1yp0U3bHOC7Y0z2EmKZTf32IldYuU+kctu12x7K1eSGcGplUCt88p3L/Hs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TWKV/Sbg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MHUJpS+J; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TWKV/Sbg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MHUJpS+J"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E9LjK3258304
	for <arm-scmi@vger.kernel.org>; Tue, 1 Sep 2026 14:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PzV75RyAsYZ+frAuiZ8woVoIVYpRn/LT5APqR6Tm2RE=; b=TWKV/SbgV9p0gmBq
	Ix/czCMtVc6C+fPEUJMX/wN5rmWOaY2sWrV8k3FCPsPVdBHPZds82x79UGxpCqCp
	/pVpjTMlX8ruOOfAB4pzE0il1Minieoe88KD9Sw4VJi1bgOh+zoS/6IfzDz5g8KM
	J4padN2WR4QivG/XXxD+bL//mbXyEPOzB4v81QzF5er6+cvoinwDYAqvjPEBlKjb
	fjX5HcnJIoAASFUUS/1g6Hq2e6QJhqKeo3LNE8Ut9OkR3ueWUadOU0OQD4ljSMCK
	j2mGoFWfUxYrnESW4/FvIxt6z6yf87rCmLVgMvOg92INvotvppxD5od8KkAFNDZv
	mmzjXw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdynt09x3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 01 Sep 2026 14:31:45 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e4ef486c7so1123785b3a.1
        for <arm-scmi@vger.kernel.org>; Tue, 01 Sep 2026 07:31:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788273104; cv=none;
        d=google.com; s=arc-20260327;
        b=LHh1rjcJ8TZyM1BCUHlYHY7HOIiHNbw2sK9XMvkaUUWi8xH6P90lN53GuhwNVyf9j7
         pVrrSZrL7h5i4Dyc7PZcoZMrucc7A8nYNXWi9hgu+dxpOqT+Qo9HZOfJcP9OL920Vls3
         3zo+7i7xrthDxLsQ40AAZw3SqPU965VsPBIQ/Nfqwar1wqKNLxugp9cGymoGoOXMGO09
         +AOP6BfTyo9G6Db/97CxOm0E4NQzfBoNObXP+oRNoofcWVTQog9G1O8LGBXz+g7yXVZ6
         IkGbR//oM4VxbWwfwC6+4LKh2t0OxxXwsgLgG0+pn74b/Dk/dLCLf9wDnrjhPDZPH9Zw
         uJLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PzV75RyAsYZ+frAuiZ8woVoIVYpRn/LT5APqR6Tm2RE=;
        fh=XuHnmpmBPtYNdbmK/TrPJ+Kn+K8YfcvdHbDt6KGS4yU=;
        b=B8BHw9BZI0eOeXLWTHpoBp9lhYp8KrCsEXlUA9vi6/kJtrLg+yNZ/TQ1tWEdg24pVH
         lDCYxKjC87CXXusqbSyDj83ynpBSNGpdzYgQqNLVkWPEYKVRdOrZyuvUyxvOY87BdCre
         m0NlUyKjNU0xUrCaL1mrHsf7HU97d475m165h7TVTc4OHx2U0yhHAErLqE1iTG3Wpmgk
         qjJMib15T+RKTF5/BEQRcycnPFXvYNhdXZL22xTzYwd2qHeOtesW2v3N4szK7fiQNzjm
         +TUzM49DlWHDOtNa7bnpLCLoB6Jz73VT3KAXiC5cI1F/cGkUIXo7mmPePQyFLltRg5wh
         jMnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788273104; x=1788877904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PzV75RyAsYZ+frAuiZ8woVoIVYpRn/LT5APqR6Tm2RE=;
        b=MHUJpS+JNG++WoSWrEusvWGQMqlLb+1WmCAkp+miG6kasuPoeE49mS8n7EzTVE2WUl
         s95CVfOFKfNjrElcCawac1ADbMDyc8E32+S0feYuZoYFvsar7b1F4KT8ixYVsoGrEzSh
         6VHSl0jYgm+3WW8E9FjvQFb2czYam8VpCI3nQLMCkz5xAqEgDHkFpfuIQph89MTzBSC5
         E/cfUPjZuZkHiZUfZdXQrFo9OD56US+ILdg8evX8Enajd9ij5XyZLZM/Bs91xmFiG62B
         UJANEaiKgCk3ahQGG3i6rxwj5D+ewO0pdoTwlIGI+54ea5lCe/vO+BTCaZeyBW+Lo2Do
         FSIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788273104; x=1788877904;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PzV75RyAsYZ+frAuiZ8woVoIVYpRn/LT5APqR6Tm2RE=;
        b=kP8bw22NPWWQX2TNbOVWvW0noYBcwuhYVau4theyoTgVTtXRDPU7xksnDftOHYijNN
         uSCzOCtzPSTA0cu3gI6/GWPcVxrwwEqCxOl2dt7PRX8QFyr4EnQdRkq1yBroff6JIuLs
         6brRXSWXgQnKkyuHlYzHIf6989q3P4IYur8LrvqJqN7aAdRhl43iFUPYgWH4XX3dIRFs
         SXepshhBRV9eE+BK7R3zLyCHLkh3HFrhy2m8qQj0fcPlwucZnKkF1oFvt+LGAEpClumb
         QungVIwTUAblwbfDBeS/PTHZ4OsReZi4J7bX6LxJsEbJ4v0rQ6B4yiIeEwOtmZqdFOOR
         W1jg==
X-Forwarded-Encrypted: i=1; AHgh+RrZWFRtq58LPKEb3jFf4Q5f9FN2XLhk5HKwIX2AwuO/4CQXOvjlJstAXKT7xtXnfxrDlu+NQPUvZg==@vger.kernel.org
X-Gm-Message-State: AFuF++luoWZrIUP49U92ZMh4mgaapaAUs5l6ATWa5swvEWUL8ts6ok/J
	vf87joCiMOe68QPx9+BhVgNei6NaaPa44fdmQmAboJZgxUFcgwXUdf7Dk+aJNvI02g5yg7RARHU
	hTr8ObYBIplwkuYwShynfZtCFJRcOG6HBqA4gMQAP/NM2sTOqDTzXGkqJTQIkxtgfbfl+Qk0EUn
	zBXpmr48FL63tRIPbqwDrpcqrrTRH1PyK71I3j
X-Gm-Gg: AR+sD10UUFcTgcrXFSjZGkJFEWqQmVriv/tFpKOV2tuLRm3BqViySHqWtX82lWaz7ot
	e9mcp0JARNnrVeDDRERxqMPV4raL669vwyMhA43dC1B5zso2CRQYqWNXkvgW/NeC8mkj4C6RH/V
	o2/ftBPp5iOWoa1LtPer7MbmOBYrl1bHubnuat8SiECAVu+VbTxz40ZmBRSQ==
X-Received: by 2002:a05:6a00:420f:b0:854:b3d3:8631 with SMTP id d2e1a72fcca58-85bcacec88dmr5179001b3a.12.1788273104253;
        Tue, 01 Sep 2026 07:31:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:420f:b0:854:b3d3:8631 with SMTP id
 d2e1a72fcca58-85bcacec88dmr5178917b3a.12.1788273103642; Tue, 01 Sep 2026
 07:31:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-1-091697dbeb02@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-1-091697dbeb02@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 16:31:32 +0200
X-Gm-Features: AcwNN1WwQtMTDpu5tktdI1Fc85e8Ltr3tWd5G78kHHK2UXE66ekj0IR3sGBbeCc
Message-ID: <CAPx+jO8HQj4PtBScf-w+nQz-9xe+7QxZLMtp=J=sFSwEHVLL_w@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] pmdomain: arm: Fix -EINVAL from
 scmi_pd_set_perf_state() on state 0
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, mukesh.savaliya@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEyOSBTYWx0ZWRfX9KbTN3Gm3Ixe
 c3nZ3cm8swF+oR/vqgY1jHsL5sc4JZHlBe+m8ZcDZzpQJXJBvTHIo1cU3rqKKAga/L9oGXLAlKh
 ZAijLM48SyPMWYVt3A8WR9Tc8sgLXO2YxSyLmTCF5EjS3O1YMbs19/WqUO8hwhRCWkuFiHmIJN6
 tsYuQIDYLX2GVMYDOnbwSiBEbXrqaPji301c6/LRidKgg/norWtLGJB7xtW5ahSy0XtFdPGrb5q
 RH77gzFCJN6TYM7lesH3BhRobIBvPTw64kk2GEx7F/Es0PradZpAnD7qdoyxIVjpqrSk0JokHP0
 qi1hhWs1H1bxD4sIRuodIcwsqS7HaEf0S+QZD3eUtuj8xwRvjI3Y1IcTV1YrWtm3J9ACJOmKQlE
 L2vdy9/K7exF254nz9Vemc7jZ7MlZTuJ8P0Pbym7ekncI3HdoYZWZf5YUgqOY6UkmyIhI7R4SjB
 z5AYMtJD49mjdHr6XOg==
X-Proofpoint-ORIG-GUID: nkQArS3kgRKiebx2Juv2x-ff2u1wtr84
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEyOSBTYWx0ZWRfXyQSDhlyu+opO
 yBPwRoUw/lPGMIdQHHm8b0NVWD7berBSuhZ39GNaNmvZNdbJrlb1bxHU7ZkLxQ9Y58XTEyLy2GV
 2dazKelf8+ih7aYs4FF3xzmif+EJpzg=
X-Authority-Analysis: v=2.4 cv=LfkMLDfi c=1 sm=1 tr=0 ts=6a96e1d1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=iiyz0f3IVUh47B4zfGIA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: nkQArS3kgRKiebx2Juv2x-ff2u1wtr84
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010129

On Thu, Aug 27, 2026 at 7:59=E2=80=AFPM Praveen Talari
<praveen.talari@oss.qualcomm.com> wrote:
>
> Currently, scmi_pd_set_perf_state() treats a performance state of 0 as
> invalid and returns -EINVAL. As a result, devices attached to SCMI
> performance domains can report failures when relinquishing their
> performance vote.
>
> The OPP framework use performance state 0 to indicate that no performance
> vote is required. For example, dev_pm_opp_set_rate(dev, 0) is commonly
> used (by firmware or linux)  when a device is runtime suspended.
>
> A zero performance state does not require any SCMI performance request
> to be sent. Treat it as a no-op and return success instead of reporting
> an error.
>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>

This is already in v7.2. Please rebase your series.

Kind regards
Uffe

> ---
>  drivers/pmdomain/arm/scmi_perf_domain.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/arm/scmi_perf_domain.c b/drivers/pmdomain/a=
rm/scmi_perf_domain.c
> index 3693423459c9..e390f902a444 100644
> --- a/drivers/pmdomain/arm/scmi_perf_domain.c
> +++ b/drivers/pmdomain/arm/scmi_perf_domain.c
> @@ -33,7 +33,7 @@ scmi_pd_set_perf_state(struct generic_pm_domain *genpd,=
 unsigned int state)
>                 return 0;
>
>         if (!state)
> -               return -EINVAL;
> +               return 0;
>
>         ret =3D pd->perf_ops->level_set(pd->ph, pd->domain_id, state, fal=
se);
>         if (ret)
>
> --
> 2.34.1
>
