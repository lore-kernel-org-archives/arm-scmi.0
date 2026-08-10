Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81793F4DE0
	for <arm-scmi@vger.kernel.org>; Mon, 10 Aug 2026 14:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371577; cv=pass; b=UI+xc6Nm030gDRGuL0eubvY4ZcYK2T6Xum7NFVE/d19HCmpsClfsWtx+tCtG4RkwJl5L52VeQNEQwJ1w2zd+KWFA4U216b5yr9J/aLoR/RMvBs4JqKCvWx2hFRoK0b6w+O5EVPp7NxOhDrGXC4+yQ8Xytlr+j6hrHyHv0icVlRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371577; c=relaxed/simple;
	bh=n+Ksvu/zVWPobgx5KX7GBu9XwArpcsGtQQ3SBCwrIrY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kKDhc8Kd+31w7jSryB+U6ROiJ+EZwUxTHmgynGyuIMeI0RTqD2mlZuVQoSN3SFjcV/pwOeGgmLIIIUhmtNrTPik2avtvt6UqXQVuK4gL192GsiwO6hxdkjrZPAXynv3t8OYMJujT/9TXgYCxuqpObjnMDrFnrxiTyNj4SCAUBzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ev1TpKH3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UCSWrhxp; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ev1TpKH3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UCSWrhxp"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACj2br1650439
	for <arm-scmi@vger.kernel.org>; Mon, 10 Aug 2026 14:19:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TV2EQ2xg94/gFwpPmqRGt0+RWBXJJXwWFz3sZUe92ds=; b=Ev1TpKH3ebEU1fy8
	g+4xebhPHPUNEgczi4RSZlAAra5Cj91TiMJid3WIyK5/K42u1qxUcjk7uUCBQHoM
	D8o21YcfVK1/Y97choME6/qa7CdDIhuHrlaVEOIr7xgiuVzpWUQGLsJRHjecc0X8
	5OmdKvdY1UX2SdEE6NQg2yuWzpmvtnJjOYPGFJ+VOPekQ4vxFoORjT1aoxhP7vvV
	YYapTAPpjm+7JFbvSNZqrR5jaeN6QyO+1y8HV8IIM1yy0lsfCMSKDFY5nXQLSOGp
	AE5sKxscyBtkwJygu9QY3Z06kIxGDzYvIbVbErm3jiF7vYdIQvt+b22j8wAU+yxK
	2sR7gA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8vhhxsf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Mon, 10 Aug 2026 14:19:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d7886cdso37966121cf.1
        for <arm-scmi@vger.kernel.org>; Mon, 10 Aug 2026 07:19:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786371571; cv=none;
        d=google.com; s=arc-20260327;
        b=QHorsvWKmb3nS85K/mPpsuO2KeyT4Pgkhnrpm4JMlLkKNHJ/0vdU0verpCz4aPRi9N
         O+26DEpmRvD7/4YSvFApfDAtKB1QIUjqQwGavXLFCuGdSekYkPKU7HtrL4/yb7gII/N6
         Bnf3aBA3j6IXSVlhU+AvPFJ141z1KFP388IxV40LfZIDVW4EC07rkW6n3syy6KLhJX/m
         TZC+hFQofggk8PMeBnkMxL0Vsg7NqAeWcc8FEJi9R0tc1Bg3s2sRyJaf49DBB3rjX6Fq
         QcOdlcJNEnSo2ZPs3AmPyYz1m+5d0Ch1SgBmHNmVF016fz+vqg/mAw0an6cIff9su2j1
         A+6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TV2EQ2xg94/gFwpPmqRGt0+RWBXJJXwWFz3sZUe92ds=;
        fh=2HcOgTvr3sBkUVu9YlCvJjIGD7sS0TYtiO5NI5rRCOs=;
        b=ERjxef8MH2kxWXAEVtlM4PfTxD+sp4cszRIsFDYqZMADOYLjnoE/c9CEIKOwAIqAes
         l4cy8rQtNf73lXki8rrp4mGZA6OTGXz5dLhWSv5Yzl07VDph3TkBD15JJRc4J7Gf6PIn
         c02eDmfCbM8Iv6MfpAQZ8IM8BDprVkBOvGJhauKcCvBcBxvY4WvnI6iDS5uVAHQ4YXVy
         fh9FpGRpsF41ismP7nRjNotTaVefAJLU3ItbbIFe9FiHw7Txawxxv6hocP1rcaMIQgNN
         rqIbKb5IZ/KJAUCdqO7gPlLu5dmj5wEm9TSNAstynZ6qR5ix9rCnqv3siIlcwDFiE1nl
         3ZwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786371571; x=1786976371; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TV2EQ2xg94/gFwpPmqRGt0+RWBXJJXwWFz3sZUe92ds=;
        b=UCSWrhxp/54c1zxxL6Rv0OqpS43JyRPPHsFf/oQkkHaUQOuChZcrIFqUkWKg3p9f5s
         3n4EjZXaclrirDAZiiexpY/RjB8zKPSQYceo8AasR3z1PQpPvEgeb0fxo/isuIARZGnm
         JhV0uTjMlissRcg6nvjGHn721k/7qrEus1jbl/ZKMYBsYZcn3YkpDdAHKnek8QKgqNDG
         2HlvGa0bplBCE8/Lbm9A8Vhn1apQQQeEqh2E39dnClzQrj/Q/mIPMfcWawvUE4/FK8FV
         wbhn/Gfw8Ko3WABUL6XQI7uUaMwyxTUDlYcCAcvIbaVT3mJuzdGNj2EvffndKF/R+km7
         4bzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786371571; x=1786976371;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TV2EQ2xg94/gFwpPmqRGt0+RWBXJJXwWFz3sZUe92ds=;
        b=A6WELFnMwmj6A7+63iiYU9IJGV6vEgAiCJvU/eGX+3nTpzmrF3CTex2wxuX17WqB7q
         3MY8j2VNsW+3iORN17JLv+qlNGvbSP9HhMN2jeUNBsEyNcsLsX7rDLZ6jb6y0VZfBInl
         BSsaNfjwBYuGTknlKhd2Nsdr6ZvUAdl5TIs/nu/5SPmOw+13xims1i0mP0TzPQF3gTwq
         9aFCcZPJuPGULx0rG+1lqQUnzHnr9irKCqa4RO/Is3hRUrV9mv+xx7OBxqPIT4nuB6sF
         uxEvcsU3fpeddXjpJvekTkQ4xdbvCiKu5F9vJ+4PysX2PxE/wkQWX2Gr/Z7Sd4uo1jph
         MDgw==
X-Forwarded-Encrypted: i=1; AHgh+RpMLIfGxDqqrzSIYTjpOPrINZ6B050N0rtB/gswuultxtvuCRKxQrXlrp/60Y61N8Et7GmH3CpHRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9s04fRqwc+hEEKHY+bFK8lK/rAOVsKJTiCREWVIdKYe2vBZ1n
	DRcUJ4rnAI945hO1ER0mHXmKSxgAkITFF62aPn3zlbuzvYHcpUhFsFh+yiSMBYe/SW3vsh+nLQq
	AbLEUcYfwfxOA+xt2uggPrBBSBxHAqf9LOZoNIbFfNXRMdv0b6v1RwjZ9ci4PS5NtxpMT74Snx7
	LKf+JTJ3V+7iUl3+x+WsXsA6ne3Sk6dWzEoNdG
X-Gm-Gg: AR+sD10HBAeEByzTlXoEFSH2SziE7/AmC4wasQ31mguHjvSsmJLDv5M4mSgK6TIW1a/
	Kd/nl2tY3LDDInz7Fuy6wpVQ5eAllMsly0D//UDrAC8Aj4Lp/16ARG7gL28iqr1tJjJl6riX2DZ
	1TO29PlVWFhMVy93qHxU80kkTiLix57vtw/SY1NzsTO+QzBJAmgi7W3KqNlQ==
X-Received: by 2002:a05:622a:4c8d:b0:521:8ef0:b4e0 with SMTP id d75a77b69052e-52d4bba4201mr24352901cf.17.1786371571074;
        Mon, 10 Aug 2026 07:19:31 -0700 (PDT)
X-Received: by 2002:a05:622a:4c8d:b0:521:8ef0:b4e0 with SMTP id
 d75a77b69052e-52d4bba4201mr24351481cf.17.1786371570441; Mon, 10 Aug 2026
 07:19:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-1-61171ab1cdce@oss.qualcomm.com>
In-Reply-To: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-1-61171ab1cdce@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 16:19:19 +0200
X-Gm-Features: AUfX_mx3R25JFulSxbPIMFamz2pIVHYPn9K-rVq3DlUVa-mxAozC_itBBx8G2xk
Message-ID: <CAPx+jO9MZTsDpofZ0fR7FxJbrfuAV+soqN3x7ttK-F7o6MkYmg@mail.gmail.com>
Subject: Re: [PATCH 1/7] pmdomain: arm: Fix -EINVAL from scmi_pd_set_perf_state()
 on state 0
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
        linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=MMtQXsZl c=1 sm=1 tr=0 ts=6a79ddf3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=IN2mYG8luz48gvOoqwMA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: FYoI7ZNVm5PcRIQV0G4KHaGUfB7LYH5u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEyMyBTYWx0ZWRfX+sfGux8TZk0b
 MJ0W41hL6P4oAOtZ0Apz4OQ4Z8lv+VYP4uBaoooZPt0Y9z3NtPn9+Mk+vCtpn1+qe8rhzdv+M6d
 YfpKazv2sUYQUavE5AS6b5qtrcNmgDnXFK8ZvvmWWuVkzP8WDjNMkgfUkA0mJ3fSSk6HVWfmeYv
 kpet1QDHeVZ8+iQEvwe8zKaX1BJvz+5eY9jYZW+KDFOqJirnUQ/izD6Mtb13cI1R3AT5MO8Km/h
 HH4zWWWMVfralszVYatA0E9ftD9bgR2C+gO805Z24wxvh0Q4IuirC/IwG/nacHeNpWcuf93TOR5
 xwl3EteNp3vBm0+dUWfNIQIz8pLON2eXZdjKtSwqpSg3/i4ofokmvzo+MYJHDJtoid4KAQd0wMp
 zKelV0yuln54/EBKunx98Px0HGpQiZ0qmPRZAjiuDibuYhUUyj4dFVTOx6XkNK1D4usW/1cR4Wm
 73otYjttn5T2GeE5RAw==
X-Proofpoint-GUID: FYoI7ZNVm5PcRIQV0G4KHaGUfB7LYH5u
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEyMyBTYWx0ZWRfX+F2fXBdVcDYN
 EXjYFEwLRAjLF+Ezq9DzdyGudlEkkcX2Yzojbi63zMgSDiJMAm8JJA+148vAC+TMexw7B4xndqy
 aqHLhLQBwy+Q870Gx2QG7IQFqpXp4Vs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100123

On Tue, Aug 4, 2026 at 9:58=E2=80=AFPM Praveen Talari
<praveen.talari@oss.qualcomm.com> wrote:
>
> Currently, scmi_pd_set_perf_state() treats a performance state of 0 as
> invalid and returns -EINVAL. As a result, devices attached to SCMI
> performance domains can report failures when relinquishing their
> performance vote.

Yes, this is indeed a problem. I recall that I hesitated when deciding
what was best here, returning an error code or 0.

The reasoning I had for returning -EINVAL, was that I didn't want
genpd to believe that it actually succeeded in setting the performance
state to 0, when in fact it didn't.

However, except for the problem below with the OPP library, it
actually also screws up the internal performance state aggregation in
genpd, potentially leading us to running at higher state than
necessary.

>
> The OPP framework use performance state 0 to indicate that no performance
> vote is required. For example, dev_pm_opp_set_rate(dev, 0) is commonly
> used (by firmware or linux)  when a device is runtime suspended.
>
> A zero performance state does not require any SCMI performance request
> to be sent. Treat it as a no-op and return success instead of reporting
> an error.
>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>

I added a fixes+stable tag and applied this for fixes, thanks!

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
