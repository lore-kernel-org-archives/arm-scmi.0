Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795604912;
	b=TT23wDzxzlq9wCZnfaKmMKalOaohSvjc4Gg6xum6ie+ePs+xg+K8PLflNry+/ml8CuAU
	 lCiYMwhTUmWCBGrqB8X/Jk0lUDaJ5EbY8MtUz5A9+cQ9NQrfm5sAwbO8RWzJGzHViDNcT
	 qB0MSqz+Lz3CJsHEQEO8GQEVEKBSv+trTCsRNJ2XtR7Pj2Cu236UMZ3BUkSsTiERJMP5M
	 njpQb4nSJFedaVF8pE9eNi3yLdvRFjwU8rvCZIvv3Kd2jXLPtQTKWK8v/FPW4a29tGL2Q
	 WPppNDtSOvS7dVvr7D4a6L8phxmP2bHePL0vjYZ0L1xGiwkXv4QwoIL2mrn4gefVdcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604912;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m7zUToUS1+7RVlBq8lg0DAY2VTgGDQHEGVuEzMquWAQ=;
	b=hmHNvTYsV8nkcgxI/6YpzS39LbWucldLMt9rXIf6+agTD8oE7tfOKQPDO9jVbonbGP3T
	 9RxXVd1sbNeJvIAxPDK9Dlna211vbPwWdCokLGBDtSY4Xqgp3du/OV+KyL8kvUz6Ir2lB
	 y01FWNB5fejMlxZFRPinMk7D8r6IoszGWle6yleMykCh14GYZJo/Xsf3lygbTqah3nOaY
	 P1wqqZz5F3SHSXmPunYn+jvxUcn//nSzifemgbrkxSn5Bg3YI/k9YhJ42rIux+WOEDThK
	 lqxbXF5XTXj9VcTqtP487XeER79Fn+hXRhbd3hrGem6sq3ofeF6kvvV5vwZJnd4rVXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nc9uQR+j;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JooTsSeq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A9B60A2603
	for <arm-scmi@vger.kernel.org>; Wed, 25 Nov 2026 11:08:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53A9B60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nc9uQR+j;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JooTsSeq
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mTNh4034187
	for <arm-scmi@vger.kernel.org>; Wed, 25 Nov 2026 11:08:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m7zUToUS1+7RVlBq8lg0DAY2VTgGDQHEGVuEzMquWAQ=; b=nc9uQR+jLwGYfJ+v
	wCrebLA8CUnPykqKns+CQ2yrRQX7mBdPXHCMWPqrppNP4EEqU2xz/ZDxv4GlaaV4
	diSFgLYngeA848CL7VUmP79lf0CGvoFe7HMV9ryXoUlJgFCDYVA+vY5YqMNHvOzp
	AP64yguW96k89HPWqInNVzFmbAczwLCAuNLpnN+AtB/co6g5xKucvRnn7YHP17Tt
	nsxQo16Kb9HnPlxBxSSD/axvQB25PQ9cB8UzYqupv/HjZ1aliLqhuH91v4Qctbk2
	zFH/QuxXH5D6PfcOI6atlTGFW72NTj/SQ4NkYR6bvlOtcKnV3kbeDY4jlT8UZFVN
	H9JRJA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbjf0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 25 Nov 2026 11:08:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b41f4ca1bfso4457275a91.1
        for <arm-scmi@vger.kernel.org>; Wed, 25 Nov 2026 03:08:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795604911; cv=none;
        d=google.com; s=arc-20260327;
        b=qvnWQNmKVnPGmWqGP/ErvyIjcjwBBzTtrYRzv05lW5lABH59KCaF1vzHluISVGlyu7
         O12oq2qTBHbs4tC9JduwXaBNuYlogG5nxWCdx5u45je3XMHA13/v/cfMbO5RYA6DAPTg
         fOyr/RRw6ghB3Pu8j3FYIZaJpxfQI3nNV4Dc4SJ9j1tKRjsKhQneQczFKvs4YYuQ6Scd
         9GeRSluz5bRXnfWdENyK2KzGFhRghElUAaDCQPsD73yuUa29tGesaY+2tTJ7T0jKztK3
         Z57CzYa1boEu79HocQyt9NvBNXnwnfvuEZdOdDLGU2XoSUQNupTAP2oYZZgmIR1Gijbz
         VIvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m7zUToUS1+7RVlBq8lg0DAY2VTgGDQHEGVuEzMquWAQ=;
        fh=nk6V33TU74/EIash1kwTUKYF4oxoHqGfKg/anh9Xuhc=;
        b=HxL/rWrsfJUvQ4p1kW8Kz/Ocv3W8F0Wgz72JmFu8HQACMgcIEfkrZD4MpBSKu/5psm
         mmYXfse6CX7xduxUukWukrozJuErQfEh5ui2LEIa8kAA7KpkKs4MP6/SeWZmSdlxIbMm
         Q3my8Co+D/NPbtmm45mF1M86Oag63rbSWdEHhD4yfeJJ2R04cD3TSApUbGmyQPRM5EoY
         Bll4kwoS3enUMUn7exa3VUOqQWJ535Si3NVgKu0g4CKz5o3oYoMAKl4jdzhD2ch8PvBg
         VY3OnkEDbr67BUwYaYgxkdGXmaZVdJnGiBuDG46M3QFXnd/IBGKBw5F9orQ+DWtib9q/
         wCtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795604911; x=1796209711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m7zUToUS1+7RVlBq8lg0DAY2VTgGDQHEGVuEzMquWAQ=;
        b=JooTsSeq2RR1X9kQ7o0BsZFsA8NkAkFKzubTfUrfxs0AoHK0J6gRp/ranL0IYd4DTh
         qTFPTwolI/JQcnvGSgmo+MEX93AyyL2/zTlaOKAMWqGXXu/OU/+e+Nml21uA+/7i/TW3
         AdMpSpQ6HS+75nLtv4n1XMi0n4knpbPsOUxLp7zi+/cFhxR+qTBbpB5FWeoW/wz+mo1E
         L/TIjfPa4lOEIjrqRusrw/DGKvaaCaUSlWcHhH60n6vEOlahEwY4nM7VlyNTUMmgjtSb
         bJhUa4rVDCDmrO92JSSelxDCxWetV8Y/S+s0qvhkkRctw9hA8CuSIPoGQoLr5wa4JDyS
         nBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604911; x=1796209711;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m7zUToUS1+7RVlBq8lg0DAY2VTgGDQHEGVuEzMquWAQ=;
        b=EiYBN9U4dbVORu6n+O2DtoSnV1aWs+sRo9QXuZTdU6XQ0IAmgpAUbbN12AlpFBHb6Y
         6JPYC8+vhwGa1Zgf6AQThXULxmxl56ze6JOdeNnpEtm2YTpINqacKCI8Z9YMX4Ca7trN
         6EkvF0YTtJG0FRGX+Sh4YQFySlsN9ClBcc/GXpss+xFT60Nt47hWV97XWlO9Ub0BzLrs
         woLoqniNoIf53I4CP4fW6MLQCd65dtlBagv/XnSMsABLChCSYcbQq94fbKWNV69YlM8z
         AH0L0bjUeI7mrkGMMRri1aICEbep2UNAXwh6zK8clWrYQdMm33Ypx+f1DOw+vb3E1APP
         hcPQ==
X-Forwarded-Encrypted: i=1; AL+hErEf2KiDZ1+r0fvT3wID2hQsfY7V3ko4l+fHfBjHXUmICk06xrRl8XuKTbkWefK2JFwgxC8GXvfmCA==@vger.kernel.org
X-Gm-Message-State: APuU4Z94PT62d3bGLdfNWs3LIi48zx07ewIOY8b1tA5aBs/WSwwdofEW
	CzLpIu9qS/dYNoNsIe7pnWQdS42V5DMeIv8t68Qlo+vuV8p6eOX9Ja7kX6LGbEqPI5xfaXwTyus
	K+uZh35MlmeJKBFyv2rjow5EomvQErkr7aguSJQrnqghc9rGsrGNMClCRyH7i8vf99Ft5PvoYRy
	Y/zfZcD3SrP2yesgihYa74kabRo7NOUS0m1mhy
X-Gm-Gg: AZFdTZfvAoTLp4mhN57iKTXq95o7I7tiA4nHaurMM5eY8eNuhARdegQoB6rVCZvAgez
	hOkZlI/Zpo97NDyQxFTmFday46hjL7IjsTdPDaslNIJcG07qaz7IfU3zcU6wAIX/thaoYFdKJqv
	J4+ZG9RNykSeZZZk0N1zECuw68OyAaIyoyW5VShDTH5qQaD0Y+s4F+Mnl4Kw==
X-Received: by 2002:a17:90a:c10e:b0:3a8:13d6:f740 with SMTP id 98e67ed59e1d1-3b41c911c91mr17608610a91.22.1795604910727;
        Wed, 25 Nov 2026 03:08:30 -0800 (PST)
X-Received: by 2002:a17:90a:c10e:b0:3a8:13d6:f740 with SMTP id
 98e67ed59e1d1-3b41c911c91mr17608576a91.22.1795604910256; Wed, 25 Nov 2026
 03:08:30 -0800 (PST)
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795029012.git.geert+renesas@glider.be> <16bd6b25711f0e5a4a8ff7484ad3acba83a2a2fb.1795029012.git.geert+renesas@glider.be>
In-Reply-To: <16bd6b25711f0e5a4a8ff7484ad3acba83a2a2fb.1795029012.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 12:08:17 +0100
X-Gm-Features: Aa3M54pwdhQzxCyuIzV30L5QTtG5r_OlDFzkU_dedYyzSv3GvUcS-vx6Qv1tWoA
Message-ID: <CAPx+jO9F6MkwODVi10HkGNYCTJHG_0vc8Bc3FMs4go2q9+=_JA@mail.gmail.com>
Subject: Re: [PATCH v5 09/15] pmdomain: Make genpd_get_from_provider() return -EPROBE_DEFER
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Paul Elder <paul.elder+renesas@ideasonboard.com>,
        =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX5kDY9tjzLqhB
 IiFVnVXamRx3QESYTU+evJ4WHvwZCjjC8a+eXN5l6Hxr42fqQvuud6w4L2tUEesFw704akjmQ9W
 lWQRMxz61RH/7sOkzHfgIZb0EVehpAU=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06c1af cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=LDBv8-xUAAAA:8 a=wQiWHD2DouBedGx1vnwA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX1eSyAHluxGUp
 U0e7rGKK3AQYwQrZBsJ/REOY6ftwvHjHRDgi+RFHyT2RHRbEBLTP7INssBpo6sKRt5zSYJ3SUoP
 16jpuNTkLyEGMaacp7y5Rnm8uk0J5NuTxQjkNxeOKuSDsCLqLXiNcyaLOn9MpwvOPxMQ+nBrrlB
 A9bGptC2XI/9CoAlAaxU2GGNrJtjvUfmtwxrubGC31GLD1/1h35+jA5BSxsu/Lr4Topjt35v2GR
 SBto3MNkKGkjuu7E5njVyVCtI6Ufw8ojIIoS+9g4HUAxqPbDB8KY9D98itwJmwfRPqVoPEHH4xd
 7pcaukI2O0wuSR+97aZUtNLxVDVGcFo0vPCmEVoiFoKyvAT38e++fno4u5Is7GkTipcsHOfhRQB
 wF4YIO52j2OzX3gxHKGJD5pvwgor3aRmI+kTIEcu1U8xtkDvzx8jv6OOwxVtJ6uxYur8uy1iw6Q
 VjS6lvOe+lsIYs54soA==
X-Proofpoint-ORIG-GUID: DLWXg6P7WpVo8VKMloEARY1oTJ_zjV-9
X-Proofpoint-GUID: DLWXg6P7WpVo8VKMloEARY1oTJ_zjV-9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250044

On Wed, Nov 18, 2026 at 8:46=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Unlike provider-based look-up functions in other subsystems[1],
> genpd_get_from_provider() returns -ENOENT instead of -EPROBE_DEFER when
> the provider is not found, thus not supporting probe deferral.
> Currently this is worked around in of_genpd_add_subdomain() by remapping
> -ENOENT[2]; other callsites don't care about the actual error code.

of_genpd_add_subdomain() isn't the only caller of
genpd_get_from_provider(), hence this would change other behaviours
too.

In particular of_genpd_add_child_ids() could suddenly start returning
-EPROBE_DEFER, which seems reasonable to me. My point is, please
extend the commit message so this gets clarified.

Otherwise, the code looks good to me.

Kind regards
Uffe

>
> Fix this for all current and future callers by returning -EPROBE_DEFER
> instead, and drop the no longer needed remapping code.
>
> [1] of_clk_get_hw_from_clkspec(), __fwnode_reset_control_get()),
> [2] Commit 18027d6f392ee8d8 ("PM: domains: Make of_genpd_add_subdomain()
>     return -EPROBE_DEFER").
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> v5:
>   - Add Tested-by,
>   - Clarify that all other callsites should be fine.
>
> v4:
>   - New.
> ---
>  drivers/pmdomain/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index ee8075e90852e738..c242807f62579e5b 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -3021,7 +3021,7 @@ EXPORT_SYMBOL_GPL(of_genpd_del_provider);
>  static struct generic_pm_domain *genpd_get_from_provider(
>                                         const struct of_phandle_args *gen=
pdspec)
>  {
> -       struct generic_pm_domain *genpd =3D ERR_PTR(-ENOENT);
> +       struct generic_pm_domain *genpd =3D ERR_PTR(-EPROBE_DEFER);
>         struct of_genpd_provider *provider;
>
>         if (!genpdspec)
> @@ -3276,7 +3276,7 @@ int of_genpd_add_subdomain(const struct of_phandle_=
args *parent_spec,
>  out:
>         mutex_unlock(&gpd_list_lock);
>
> -       return ret =3D=3D -ENOENT ? -EPROBE_DEFER : ret;
> +       return ret;
>  }
>  EXPORT_SYMBOL_GPL(of_genpd_add_subdomain);
>
> --
> 2.43.0
>
