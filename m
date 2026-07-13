Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C254935A387
	for <arm-scmi@vger.kernel.org>; Mon, 13 Jul 2026 11:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783940771; cv=pass; b=Bx+tyZhjcWJ49HyoM4mJaRZWOIYO5nlzFR523juW6zoos1VWizheQ+v++igdQ9SPm0gaEWRYOBvd12ME/XX5kp0ee2kv9+OAef+b+w9dQS/jmzDuaeTyXbg4Iz/18ulW++Rd4JWfrTlaGnboz8W+8MWmAnvcEl6INoXo5+o9qJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783940771; c=relaxed/simple;
	bh=wU4adGyulZDWHqdEHT6S2Ub0gI9p8fXNMrbZKLgyLEg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mq9ARex1Z5b4WYT/rInGb+bfbxk9dp0Bh+lSMG9dPGml8eeD5z2JkEMwzcjehIMQLnI9wemsrrqlIL7oCUqSUk3CSsd+fyJZnvDJb+axoOp1thgzTPeknowys6g9DAGvttdh+d6fFQLA89pAKRsAqKyoPOh+64my5bnp9/YMS4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DxuR6f/b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LmE7iWGl; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DxuR6f/b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LmE7iWGl"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D7Ykj3794223
	for <arm-scmi@vger.kernel.org>; Mon, 13 Jul 2026 11:06:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kvqsLA6Mvt2zukd4+gfC9bRp1ifbJzmUNc+eEGzl1K8=; b=DxuR6f/bxOGO5KQB
	RZ/enNONz0Rdsd4+l1m31TX0ZtALLxRB2aZZ4Bvwlq9otL0CjXf/HxHi+EeJ+DGS
	woR5CIoZx3YpXBtO0ZjEUFav2Ih1xlYDg5ps6CJ672D/7yb8iIDc9Nw6olArMEHV
	HFsPQIxyZAzd4upN/mTsvRorElOr6ov8OmRtOK1E3b2upECnWP02bHAN9sBFQ5pP
	XntXO7Wkgc5T7ENe+2f3GxoX5n/BA5J1SWLQLV6d37F/sG4cRmdHS+slqQgLEAeP
	KuSI2ENJKzSPaK7VL23lN3pbrN/RdCerPnUzXEudqwmP7e7QG1DsJwAxPHbIwF8N
	zKPiKQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcurn0r48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Mon, 13 Jul 2026 11:06:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1e6f602cso60409271cf.3
        for <arm-scmi@vger.kernel.org>; Mon, 13 Jul 2026 04:06:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783940768; cv=none;
        d=google.com; s=arc-20260327;
        b=K7yz6B0Y6JLjMB/4DJL375vAejyfjVtiKwloPj+vJ6zwQAoA5f7ePEB8p1hN+NmEVc
         F296BxmgE5qKZYXUFdHIoDiwnL7ctmqFUY0zZSSDPHIXoiplkvMFmOFRKbOys3kgtNuQ
         7p3dxLFzo/+Av6/STxn1E45pOJfA74ZQrhrl3XLCofyVZqo+tW6s3GdI7QOTXFZWwetL
         JDoMAs7yjGWZ9Gt/ymuJOWAOg1z6L8E74fbCPH8h3XVlKBpQnYLlBsbXAx1XkGFe4B8i
         Zm8XAZzk8HtyHYa47NwYJSOMcs9rSnL7FnY2xDbhNVomGTV8MdxvxOAnp9j319BzOUVz
         eArw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kvqsLA6Mvt2zukd4+gfC9bRp1ifbJzmUNc+eEGzl1K8=;
        fh=7dr/AqezdG+F90obJmicx5nH0g6sw6YDYmW2TztE4tQ=;
        b=XserbF686TXkCmK/3a6H5w81lUTvb2ozA5IUPLJHKWZxbzGGaA1XOZyqw6oG0BBtzz
         CqBWSbFCubArhaeVoxYJyKwzCCaW887Z6AytprVMXbp1EffngaY+HA9OO4VQZopY9ZoB
         fa66XQogEDGlLqftsBKB/uwwgtnbgxtkd8/qPnU7cCDNHfkqysWCQoOTSgHzumz7cC1B
         lEU9UISaYK1NuDZZaKrvyB1ot0eKnOjd1C1iXYvpt22Mqs3MB9jpUE06RwWyCOjb1rik
         eGe/83RqlwMQxPsyvjHqFDX1Le9Ev4mm5RgUobg9+MTXso97wdB3BbCCAV+5hasNKdbK
         /Cgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783940768; x=1784545568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kvqsLA6Mvt2zukd4+gfC9bRp1ifbJzmUNc+eEGzl1K8=;
        b=LmE7iWGlMxYq1/UTi1S9nF1y9EB/rVelkyDlBjWbjlJlhH1hFlCxFD2K44xZDKdcFL
         OTd7vhvKxJrzStHYB07h4zrUwy5VVZmaudJZmjVBqJ7AJhs5Ia06oqJMECU3Sy4fbB+F
         ewIy5i7xjOnpVB8VUgfRgGGlSpTIXLxJyx4wFrQZKvzrPf8jObxUpIfnRwN+Ahqwq6u0
         Z+m97txg0L5ORpLoqNJgC64mGgNaYNDbMHcTDa4v9HaatSq30DGhxynWnKRPL5RCnXDR
         aa007lJe3Mk2Rs9eVtO1INIF1IjPURb30imVK/XzYscj8IY/jwYGwrlK4K46RG2hPrcK
         IgWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783940768; x=1784545568;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kvqsLA6Mvt2zukd4+gfC9bRp1ifbJzmUNc+eEGzl1K8=;
        b=aJNX6zFzGkP6BH7M7iW8Swk6VWyJu+baHRlvVE7vb140L02pe0DqlPVfr6LAeptqsi
         BewsGGyNNDtSC1NJUWqNAvOf9LpLdSTNGlM0pZns8INLZ8PMz1qIL5BjkypFm8qLX/V9
         y9S24cqqaP1MwxYsgEoPsrpjbQ+BUy4CaZCqyJo/re735UpeGeYgmlCXdfsw21hdvzsN
         MlPh0jnSeCdIDZNPmBqSt6vgwNBHgUzBbqvB5R08JAnua/BbM1MgBbIDCaU5Zbbuf+Si
         96JtAka8yhT550XbOl+IdWFcFu4wvSFb+Tihgvbjq/Dtv8d880qDkdr6KEmqvXyvBHsy
         QWCA==
X-Forwarded-Encrypted: i=1; AHgh+Rq81fGkKjI/VbeEeympKBlpBDwAPoUd2CUbI/fZ6ZsIM9o/nR5R1YZ/LjCBVZ8oYuWGbAFvkSR7Yg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yybr77wrPAsTNludQnyir/NQPTLO3ONKIN8fohUM9PnsDAPnAyK
	dBS9XQkMFMd/304lWisj5sVxLXylF6hxijjB0diLEmSbnT8kEK/OpsV36CmSHr+swVvhuy2iJJD
	b1ezVd1T12yjo+2gJ4muXuXEnJDhzDJz/allRYTsO1p86BYLtcPbdTS6n9NC5U0/oiF2OvToplV
	9vRAJH1QgmlcXv9K8uG3Lqick4n9f1awd5w6kO
X-Gm-Gg: AfdE7ckCpcdWtamz40wVp8grnrDSVS5jdYRp5hNTIBsXvJ18KWwkN2/4o66Z2X9WOmE
	ZHafJbw6igFNjvfyDYokiFfwVmRFHfYbn5NLp6itz1Z8QJfyP8zo8gzljy43gZqv2GiJgU21dwl
	5/Uwsyj2tBs6Jw3arri1IXT8Aw4/3qc71ShI3TNGGmFxFzmWBGsoCoJjWWVBlIFN30VU3h
X-Received: by 2002:a05:622a:4cc5:b0:51c:7b12:1210 with SMTP id d75a77b69052e-51cbf34c183mr86772311cf.78.1783940768076;
        Mon, 13 Jul 2026 04:06:08 -0700 (PDT)
X-Received: by 2002:a05:622a:4cc5:b0:51c:7b12:1210 with SMTP id
 d75a77b69052e-51cbf34c183mr86771971cf.78.1783940767679; Mon, 13 Jul 2026
 04:06:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a9a082c25e4bda4d73b261eee951efecab20612d.1780499882.git.geert+renesas@glider.be>
In-Reply-To: <a9a082c25e4bda4d73b261eee951efecab20612d.1780499882.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:05:56 +0200
X-Gm-Features: AUfX_myYmQelNutM8s1zx4fXjQ-IQeu5ofDTxXjw8xb17nMcZM8N1mjOg1nEQTY
Message-ID: <CAPx+jO874b1EbcPF609NzZMCXaXQidA==eV1sgZzMde7VbvXKw@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: arm: Grammar s/may needed/may be needed/
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: Z4VdWc9_mZNzDbYJoPK9aDm4az8cXPxb
X-Authority-Analysis: v=2.4 cv=IcK3n2qa c=1 sm=1 tr=0 ts=6a54c6a0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=hUYxl28pOwIGcUTX8NUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExNSBTYWx0ZWRfX/B9rOQ4kHTKr
 gXUttpycjsDP4Yl85Omc5ROM4a5OFhdpWncx7mMm4gZkXcI4cHT6L5kP7BW2v9FJBGIkPzl3w2q
 RGl3jDtrNAiIXZAAWHb4CRbFUAb5VhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExNSBTYWx0ZWRfXwNiwH51rccMM
 QnmZ8b6lK9iO2XrJvRRZccqVXvgykmrQGnENdioEfgew1+3x/yVz0Uh3SFbLkF33doAsrWR21tM
 l9Udd5k5VCyp84T9QBGycwfSfbh8aatXJKUQFSlBiNmna4LtWgKeiuOzM+elbGKYeHiMixKI/SX
 1P4k08yXCKe9gBmSze8nx6kh7/Xk2UPUaDXtJ7dLDZeksoekTAhCof5z4/f1oEYhweZkEInuQjP
 E/VxF5f24/V5M6BvNRfYPx2OVBt/24GbecEj9uNUvqFjJUF/OungG+RWmaB8A9/ABtRfeinplBa
 sZnVEOIhAPUe4vlMgoZX9x2DyaLDtBSnjM32CJWvxe9kQ9ApNidCsnBngkO3qIREW/367m/esyw
 0DaKrs0Qkm+h5xuOo5JzJDZka9xDpYj5a/8Eiv+n6B6oiMiUuRiEBQR/+wrUwcytZfipzd0+026
 YC4pu252QNK+T+hCN1A==
X-Proofpoint-GUID: Z4VdWc9_mZNzDbYJoPK9aDm4az8cXPxb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1011 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130115

On Wed, Jun 3, 2026 at 5:23=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Fix grammar in the help text for the ARM_SCMI_POWER_DOMAIN symbol.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/arm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/arm/Kconfig b/drivers/pmdomain/arm/Kconfig
> index afed10d382ad7f66..ba0b190a63d6bb18 100644
> --- a/drivers/pmdomain/arm/Kconfig
> +++ b/drivers/pmdomain/arm/Kconfig
> @@ -21,7 +21,7 @@ config ARM_SCMI_POWER_DOMAIN
>           enabled or disabled via the SCP firmware
>
>           This driver can also be built as a module. If so, the module
> -         will be called scmi_pm_domain. Note this may needed early in bo=
ot
> +         will be called scmi_pm_domain. Note this may be needed early in=
 boot
>           before rootfs may be available.
>
>  config ARM_SCPI_POWER_DOMAIN
> --
> 2.43.0
>
