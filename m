Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD383EC6AA
	for <arm-scmi@vger.kernel.org>; Wed, 12 Aug 2026 08:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786525094; cv=pass; b=BOOqE6+xm695NhsV9WOB3lHqwTN40fRpjSZ6LBh8iEbOhRuHaHzu2tjfimvngk1puXrTVYLnYCrOZjeXpvb8Vs6V0ibD9pzHmSIt90EqFLVFCcRSiO/87pSru8P4VpF0JXyNZZrE7XATUIqHJsF6+7Tj0vaPruLtkoJ+R1llGKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786525094; c=relaxed/simple;
	bh=J0DBJDhPyKi4K64Ojy6y17lBqGHCMu6qO5alVMzFIw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ELKzkMWl145TFnPKWJG99ZmGC2P2d8KAT2jBoVysY376UwETdZw1E9C0eVbAiq7O4PlaBCZSA58WVghZIou7mjv8SIPLNlP7yDz8vf3rWwvMkFU9qqhZycgRMlukgD6nx3IUEWR/BNsXoqlOx53lLcTr88Yo9kIc8QWMqnkXVgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GLN4Thzw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=grKDoszE; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GLN4Thzw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="grKDoszE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C8Z2BB3848686
	for <arm-scmi@vger.kernel.org>; Wed, 12 Aug 2026 08:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nFA0x3tEHcygP6g65ynR4Scuteb+g36sIUIIXpRnoqc=; b=GLN4Thzw5ppeE/wd
	AoM/dI436IbDimGs9DiOG5iPm7qlx7v6S7ZCsWR5VkX6AqY1pmkxpxFieue1OfwE
	uP6toMsp9mFWD4H8oo74JxFN9Uy2fTTcpLx3+PPSNqpAoRyV8on7fVC/V9hGkHEU
	jNl3i7/7rzkLABjCcbrgPjKcje0Byp9mHuIMQ21dnkMxYoMpUj6/sCSoshoJ0mGv
	sEebEGKjtdgAeNtkyZD6m5oYasD9OiE0K57Zn4jMExI5k71q7lRgP8Sfv0tp4RZA
	GkKGzEYPkJUm+7KevEH3JBqjtx7o6eEWMvOhpmg7vQWgQw50tIJngXLdC7yGIGsn
	jqnT/g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g08j5k11d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 12 Aug 2026 08:58:12 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84c4cd31b51so2049143b3a.0
        for <arm-scmi@vger.kernel.org>; Wed, 12 Aug 2026 01:58:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786525091; cv=none;
        d=google.com; s=arc-20260327;
        b=RqYHyUjHjdnmBygtzM4TFvMXzqQRb3PkGFGVww+NcC8IyiAuz11bZ/vXO9Ly+5zok9
         WDZdFsSTeUkG2xUI+lqcnhvvnjOnvrvSE1ee3V3Jgl9T7nKKHDAKxze9cPmIvzeFqqGt
         Qs66eS+PuAprIKQ08XnK78liJqdsghD8esmQ2510SuNhLMXRbVW1USiQwwNLyvuJv+Y9
         mJGaAyZeAbzAE+y+yUI9esd1Gan1yqaKNRyCfaMAUXfqc2Y42vs8bxczoDHuLIw4mkFb
         MkQfbEQ2oJrgltr0rXHuw6RKMSpFokeisLATtAZjtmh32LnD6Z64MnmVItgR2TKPoUtw
         ePxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nFA0x3tEHcygP6g65ynR4Scuteb+g36sIUIIXpRnoqc=;
        fh=kv7wIWirQ24ZVhwr952hCd14fHiKE2IHZ57IQ1RZ4fE=;
        b=mgz5bC4/H+IjL+gWFMdeZvVA2ckfO+A1ewDRtD+qH0XrZ1tn654m3v+muPpjpwdEq3
         T5tL9xsC2WC2CWXHII4X3geiu4QVNxH3jyv/xfOblneJRJUeBlPNrrjW9kolKSa1PG80
         JL4HXzL4j5MnP1lWGh3nmNLzL5q+MeXygCVJ5nZAwLOoZ/v3ObKrwWTrqJsZMVDas1s5
         R9foIOO4hiMet4IgDhEOasuZpBzL0WOqp4PePMmF5LVLQFPjzOviXGj9URNjHKqnLMtb
         Ll/TmVcwSFQOFj6usgZmREmgM3naW3ggUpK2NEOxyrY/ucgBzD0Hd3Xzl0lAXbmPZk0Y
         ZKaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786525091; x=1787129891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nFA0x3tEHcygP6g65ynR4Scuteb+g36sIUIIXpRnoqc=;
        b=grKDoszE4bHmiPL64Y6bp+0dIoBtk18FS4gYbk2RaWfNjKoQgbD5gN7YTKEdfUJSOL
         thFuj6H/U8RRHtEi8X8Pp39QgOo9tilaU3Ejw2VGlOvC+YKU4lMAWtzepYjXupybn620
         b4462p3hpwAZw/KIu8iNAPDX5qZBYARjnvMp4EVp4qrgMX4/ScMr5VtkBNaZYndxMOJq
         +Ur1Eo/EJdUc/Q1NjW6VewWS+iqW3T3sflf6w8MEnziw0h4adAK2q3bfTBCgu5+rwf6Z
         sqRvJYWUNIEF8e/h0D6dQUQJfvbR1A1wSNpP/hI3MJMb+0DzxKcgIQIqAmDi2ZCPRKwd
         tezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786525091; x=1787129891;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nFA0x3tEHcygP6g65ynR4Scuteb+g36sIUIIXpRnoqc=;
        b=EhysBpCGCBBaO5PZjYccmVGC6Gua5KnbVq/W1RsR6ydR/t1WyTH+e+M1SY+C/LAUSy
         KULsCdZ+mxpRh6/RKEk14AHiStc+PGS64z2BZRSlO8+6CG6TEO8/41SFin9W3NYXM3ls
         JpSg3x9aZDZuAcMptqmMdtUxBOVKR+xyM+ofydAoYN5BPQjN8G+HkgoJMVyyWFhZ4BWI
         3CbkHjia59KqLcxD0i8JnnO+Ar338uYcdIBGzG1D8xN/iZF8N0bpLeHwU+PSFpr4flxX
         DKxpsO+asgYj2taNzri8E4rdJ5Ng+H9ZeuoPsH2KAT2wkj4n/cQUAa5xAEsvMSkrhNlW
         d4CA==
X-Forwarded-Encrypted: i=1; AHgh+Rrj+eb9kwsMoUF1phicLfQpTxPxQdYo9SmUjjqvjWwCny/N5KFQIWHGyq59jL3tX0RiDh3MvKxo0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeC1cTKQG2xqUCdnNYdNl1vxFDht+QpnSLSdYmvOpqTrwEh4U5
	tUuP6R4AkRsom6C2YOsCfryqXY0E+yGcIAQE9RIULOcPI/9Zlr/GDoykmevbYma9f0AKcjPh++3
	puTgNlS8hNgRedmwfK/1mLGZfHD17/eC+KrGolLNnDOm3J+e3fFBJrrmEZj4O/D8X6DIGeoSNhM
	U8HGaEBulV5jSxviuU0aUA/R+MYpvzYk3UOSvf
X-Gm-Gg: AR+sD13yL8AcuIqmik8qIGb3slR2I1zyvh7onVmXB0gEqfChGEXgutkaK8mvx1s2+gM
	8fX5VpWfRFWykXjGcEJCql6jkzicI3Cc3pGjUZek+diKbftSkAtZLEdLiImQRcD3e3M2+rcA0Fq
	TeU/9JRjQYb77CpvPtEO9sNeBKowB48snFyg4g8IL5kZ6oYjPwlt+VhD5jIeAoBnpZLgyx0OQX5
	ifo7djAYrElRICGJw==
X-Received: by 2002:a05:6a20:3d1c:b0:3c4:1916:9d44 with SMTP id adf61e73a8af0-3cc3f913cbfmr3419266637.16.1786525091117;
        Wed, 12 Aug 2026 01:58:11 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d1c:b0:3c4:1916:9d44 with SMTP id
 adf61e73a8af0-3cc3f913cbfmr3419211637.16.1786525090708; Wed, 12 Aug 2026
 01:58:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-1-61171ab1cdce@oss.qualcomm.com>
 <d5d64ea3-9c6f-41f5-adc4-9923381d732b@oss.qualcomm.com>
In-Reply-To: <d5d64ea3-9c6f-41f5-adc4-9923381d732b@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 10:57:59 +0200
X-Gm-Features: AUfX_myh6JDkLkJD-gnKUbWgAMFmmHbyR3eCYV8kAAVu1iWiCFaF1Y5_s5Z16ro
Message-ID: <CAPx+jO_-1tZfZcjae9shyWcKPsj0fM1SvRzC9_JVOvJr--EeuA@mail.gmail.com>
Subject: Re: [PATCH 1/7] pmdomain: arm: Fix -EINVAL from scmi_pd_set_perf_state()
 on state 0
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA3MSBTYWx0ZWRfX5GgSwDhVdyI9
 EN+EeM/B4dviSEZlrLcQwthSVAXRu8JI8StGgdUXFuMKhCy+vMUD2/17JFVv7lBvR2+G+1aRjS3
 mt3S4D/B3juoTtF5ME2NjCn4MdTkZo4=
X-Authority-Analysis: v=2.4 cv=evHvCIpX c=1 sm=1 tr=0 ts=6a7c35a4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=4tH4gHCIEoDemCCG4kIA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: Ixvg0w0Uz0xRHmu3mhCtUNdOsvxlitxD
X-Proofpoint-ORIG-GUID: Ixvg0w0Uz0xRHmu3mhCtUNdOsvxlitxD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA3MSBTYWx0ZWRfX1Ck0Bp0AgE73
 yGHm7NRMkp/tbgDnNZy7ePXfTFcEFMeoSBEeWQhLVQT7bu+/eGj6i77MgOWxM6zcrTFiJDo4L9q
 m4jH0sUn1XdiD1RZBmWdlEXcdHI3PFY2WddTKx/lwq8EtGkedamL8i0Vd50txDFgqQS1ePAh4gR
 5ZBsySmaGCToUVVXPUsLwr0dqh5LgrEj98qnvBjeix2I6n63cnQ9ZekjKjfEFWjHgAP3pBfDtts
 oohQ5sAp+/CnH3Qk5kevbElVFfI+3cGFJqE8ScBzXQ5RWsOMJ4EL9m//yH30DhFQUryg0jCizC1
 TZpM+OVAEWOrwv/nIIOof127F3kPAhN/55a9pY6y8TVLNpxjcznbGJrQbsF7zLP3zAEzBcHLMbE
 vrHQK9bZzS21m9uP7tc/7oRf8GzfnsylqAsANatxxd8tHXjD9P1WwrVjqBwzUHWyK9SQHHe+AmH
 A/irnn96/v33IDmiDZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120071

On Wed, Aug 12, 2026 at 9:24=E2=80=AFAM Mukesh Savaliya
<mukesh.savaliya@oss.qualcomm.com> wrote:
>
>
>
> On 8/5/2026 1:27 AM, Praveen Talari wrote:
> [...]
>
> > ---
> >   drivers/pmdomain/arm/scmi_perf_domain.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/pmdomain/arm/scmi_perf_domain.c b/drivers/pmdomain=
/arm/scmi_perf_domain.c
> > index 3693423459c9..e390f902a444 100644
> > --- a/drivers/pmdomain/arm/scmi_perf_domain.c
> > +++ b/drivers/pmdomain/arm/scmi_perf_domain.c
> > @@ -33,7 +33,7 @@ scmi_pd_set_perf_state(struct generic_pm_domain *genp=
d, unsigned int state)
> >               return 0;
> >
> >       if (!state)
> > -             return -EINVAL;
> > +             return 0;
>
> Won't this cause an issue to other drivers ? how are they going to take
> action based on changed return value ?

I think it's rather the opposite. With the current returned value
(-EINVAL) the driver doesn't really know what to do. It tried to drop
its vote, but that failed - so what can it do?

Moreover, from genpd point of view, this fixes a real bug as the
aggregation for the performance state becomes incorrect during runtime
suspend/resume.

>
> Remove Acked-by due to this till i give back.
> >
> >       ret =3D pd->perf_ops->level_set(pd->ph, pd->domain_id, state, fal=
se);
> >       if (ret)
> >
>

Kind regards
Uffe
