Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795620264;
	b=5cU1qGPRHrVrZIqYj8ELM8lRp9nXkaycOXKHHYYbTdtThgiqhJpa7FO31f8N8P9CMZuu
	 WSP86VXq/PXhpVoESaPepQWEIFIfkr1e30nfTFXJfenxQDQQ5UbDbUa9zDd6gRct1ulCp
	 o/A2hb/MtplE3nq5CnllZBBcyfORwLQca9U0sEXHPMOtwPZB8emGqeU8edGPEsbZ0YR16
	 qbKeG37+s3Unn5DhXmDbxSCwNFrwUV/Prr1juJfyu9Jr1CAm5NyY6/Bz7hBmFtFmeQXGv
	 Krnt79J9ozbYnkJQkOTFmiV/XNOztl2B4nfWB0P/npdjx+kymm1inUEQGZ71vuGIOAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620264;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cAOpd8pWTb9jYj9oRh4JEDwRl6xgzzqz7YACPIDpZgU=;
	b=rp/qpFOhoXnTQhBMtkCtYxj+WWLmlpUMO11MQTGS+5psNX+cM4CfeMxW/Lkkv6bhtM8V
	 WBWvEqKm4wnJxSA7pjzYzgI8aoOBfHrEV2r7f4VyAn1vWOK+ERKMeG8sc9nx9w0Cp83Ww
	 as8miMI0QVJUvhmVZn1pD7MxrldZni/H4Mdk2m2+0nbvXOtv5P9QfAlD4AgNTubQrwJtm
	 CmNJpcX9amyeqT1ZDwjbBUjIR055UadQQ/ySLeu2mhkvgsJyDlXjn5DJwqZo/1e9exlGG
	 iiO/K4Q7nScUM4K4NYr7a6gOL+6tcXpXcVa6gjgKyo46IFfby/Pg/8nLA1vsOBRsF/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jpbdRQEC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JOUmSRAJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438BD606A329
	for <arm-scmi@vger.kernel.org>; Wed, 25 Nov 2026 15:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 438BD606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jpbdRQEC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JOUmSRAJ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APEM9t32729871
	for <arm-scmi@vger.kernel.org>; Wed, 25 Nov 2026 15:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cAOpd8pWTb9jYj9oRh4JEDwRl6xgzzqz7YACPIDpZgU=; b=jpbdRQECJn9dd0rd
	YCzlMvxKh1E2FuxDCRdZgzLYxR58MASQ/lLJbK7mQZPHj1Gv6CsJ0tKvAJ6xMV/M
	gffkkQJSBTkiChotyI1wk1WWAybtK54prCKnQMFZH+eQ8C9VeCjTQScGYlMh0AON
	GmPvD0irgjac0Z0b+QcJN15xfbB9OBHRPmqm+yD2YYvref173bokKukzcTD7iYIr
	nKr2JqhbWduQYUrgWQQgIHZOcB9rEEmQ24/8vdV4MJ/APNNo2e6fRI6+Iz+0oc8I
	MH4oUuVBaeTRylx1QzrZUteb5v4YJcTw2b8S7RnbKVSkU322pPGVZo5XnxMUZQEc
	e0rN5g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuksh1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Wed, 25 Nov 2026 15:24:22 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b847ab3fd3so5983377b3a.2
        for <arm-scmi@vger.kernel.org>; Wed, 25 Nov 2026 07:24:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795620261; cv=none;
        d=google.com; s=arc-20260327;
        b=muXjvYaCEd8UenJ91fbnD+hM21miGT+4U34AJp8AW84t4uwi5LEQzT+BmpmwGJv6ts
         IYyGWdK87bFjuAesA4761WqVgom8ADd4aOiBt8+xK6qFRsn1885SZwTQkn06npn9z9JB
         v9BX05M5EqaOw49ex0zJJEIjbYFI6oErdLedkeRmw3yzUIANKFN+94G2WvYVGoLxWUcw
         Z0ojEzyItaMW7XJjK++KLwzxWnlhOyVn6iUS1IuHsG/rP3+tT0WQVHCABLylZ9OalpiB
         g4vZ6ku+aag9r/gf7JUfQ+kvvP/GX5jJLZ8iZhTtt2MBDNlZltMaaF+Bla75gF0+Stog
         bNtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cAOpd8pWTb9jYj9oRh4JEDwRl6xgzzqz7YACPIDpZgU=;
        fh=1gYoq2Yfl7N8LULDp8TyRmeqDLHKCdtHyyoozoatDEI=;
        b=myndK6ovicfRK5LtsTw1K5XRiJRNrejZbnolpyxwWV3yXk+S7SQNr0IVOPxKXIC3ej
         rp9XasPibWufGBS/t7wUI2UNH1mfgrzQz0TKER+6f3SLvZSvOSKQLORfzreO+7P/BMMv
         YZjsQib0U8hs1sTO6tUbmtsPSCEagPdBzvI9gOYXqtfeP0Q9KtLTb1dmKkxWj3q8KYJi
         rlhlkmhbzcOFab6riI8BntWwRDffv/KhBibv4Au8S70eYHmxMV/bn1Hqn4st0O2zpz/3
         ee7TnhueWaEmelXzdwks0yV6TeFR4u+5EhsfQqF0XFl3xmf50Q14gNC+6aIdWFiyL1Na
         Zw9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795620261; x=1796225061; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cAOpd8pWTb9jYj9oRh4JEDwRl6xgzzqz7YACPIDpZgU=;
        b=JOUmSRAJMjCviWfrKPzXLdwZgpvlk6WlhGFfT2z/yHl8Ch3saIBnQJiB2SEPcrTvWw
         dR1l1L8pRR+VfSzGt/GizrZxD5DipQDmF9wkPuhlDPAcb3OZBtCcyd5PZE22o6Yvl5rh
         m48o9IR/ddRF+LFx8PQ+tnr92Sb0q6sY20K0nQzVUPz8Dr8XzuLUFP2Q+HltPpoZzekb
         CT44bBAyzjWyhKvoeNgpg6DRqFJOmbPGY3acT+c1AMZ6Tbs5GchHCQiNqn3y5AFmwTK7
         dk+gJfO4Fam2LVYsWc1R+d4o4Rgf5em9/fKI3iCotf3rYydXPz95cUZaLsl7xAsW7Ltv
         CkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620261; x=1796225061;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cAOpd8pWTb9jYj9oRh4JEDwRl6xgzzqz7YACPIDpZgU=;
        b=WjBmPS3/D0mFmbNJ9A3ifE62jqdWnIPquIj9nL3LUEKAG3+izD1IIaqAN7VbgN6Ppy
         Obm3kgA8+PvTAEH8xo0QQm9ZYwITb/vwGiRh2C6ROo5o3/DZkLBheYoUk0xnV8d9SeHW
         Mtzgyxe9KXPui2aE69ALYU6trwN+AsCcJzQDKlspmQ2elv5y3xfyKJdmvyKy2eplPIej
         x6BSu9xia0NqQLRDKna1XZJUVFyvQrIFXIXeuP3aF7cSYbl/EWOKseO+Qd/Q+VIrt5OK
         ++uH1VT+YM/1aU4SJ2MmK7akAboHlc+uisWWo93p05aiQPk3Ugk+l8CrBTmh8nTets6K
         RoCw==
X-Forwarded-Encrypted: i=1; AL+hErEa7jko6VuNJTS3hfrNCOn42f6wYeq658bstUIpbmJBRluznhRBZonR2V+wbuxlicMgiAEsexI0/w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9jXEILOwkb+GUCmQp7sr6NdJ5zMwFDgPsSMvzOanlmx3KX+5+E
	Ocac+tJ6BrWFcFlso62Hlhe187pYZPBj2HgCOaqdNBLptg48QMKvLVM6+Zu88UHZ1qIViGgKVui
	RwJYk4yPOcgsJuiGB81OEBVR2g+QdGOGgGEOeq9ib7Pg80brjhPdA7RFINz1A8k//12aMuZcaSM
	LK9WxhZG+jRJG5g1aQwge93Yvqgnj0XvhEEVTk
X-Gm-Gg: AZFdTZeYaZEkz4BlCkx9wgNQjZVn9kwIy1a7pPooVvvgEaVJ9ILV4ZN+EspZ2QXiUyt
	EzwbA4vpNP1JpHGEdvKFYFBiqw9T2h9YZB1HVZZxId2iWfUxHm8nOq4SzyAq7VrNo3xW3X0897P
	nPdI75ml+tzEUarYXqz04oGDewpE9TYoitvC4CZ7P6WTQy40b2XlXl57Razw==
X-Received: by 2002:a05:6a20:ef1a:b0:3fa:d354:9708 with SMTP id adf61e73a8af0-4014d35e690mr16693107637.47.1795620260979;
        Wed, 25 Nov 2026 07:24:20 -0800 (PST)
X-Received: by 2002:a05:6a20:ef1a:b0:3fa:d354:9708 with SMTP id
 adf61e73a8af0-4014d35e690mr16693057637.47.1795620260386; Wed, 25 Nov 2026
 07:24:20 -0800 (PST)
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795029012.git.geert+renesas@glider.be> <37ddba45a281d2957effe5773c59022835b6144c.1795029012.git.geert+renesas@glider.be>
In-Reply-To: <37ddba45a281d2957effe5773c59022835b6144c.1795029012.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 16:24:09 +0100
X-Gm-Features: Aa3M54rJMX4qh8HyzUvWFdsjdwQqxq_0OhXrr7tr5X8J3Des22u394yZEZEfoS8
Message-ID: <CAPx+jO9Ao4mR5wq_GTQOegLyYfgf6xpq+zz1tTwU_U7BULeb7A@mail.gmail.com>
Subject: Re: [PATCH v5 08/15] pmdomain: Make genpd_get_from_provider() always
 return on first match
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
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b06fda6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=P1BnusSwAAAA:8
 a=iT_-64JVffYfEt0vB_EA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-ORIG-GUID: 36CrOWbDyg0v32u148jnzygRhv3gO3JX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2MSBTYWx0ZWRfX0UpBPbCF7gEs
 +L1fUoJYoxvuUOcBmPZH7nb6bCRJ8y4KVwyXEUyWFWq8NssBk1v+BcH1qlyJtp0PN13tk0Lsl4y
 BDKKopiK8w2A+k4d5S5eXjIewVdP9RQ=
X-Proofpoint-GUID: 36CrOWbDyg0v32u148jnzygRhv3gO3JX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2MSBTYWx0ZWRfX+u5md9tg+M4s
 d0eqNScp30jc3Dbv/o+4X8dJ1t3/OBnbT6GElZBfXzzHrT/syPqybKfJwSwS5+y5++znQfN7Xx+
 kO36UK9iHQdibA1SOlkrXbJ9iaVwNI3O6+QBsu1EbAj4UazIKZPtpVn/TP6O8A75m8eHjMMHLWn
 CUeN2cJkhwxQDa7jBRaq2BVRocv3fRCB0uk6UKa1MNlun89391cI86aO44fBzqXuApuii7Ghe7M
 TJHeRYK5oFIvijm+jW7VtZepw9FcqlYilaBFoOTkn4pWeACkM3MUL+QJlAXXMf7WPWhLxOcHuBZ
 q2dzT4HcqaAj0JuqY5WAkWVdBsBlgE3xAnGykYOcSwnI6v3xvtBS1p3R9YLNlPqybYnUzRh77WB
 ksBNRNU7Tbn41yXkGED5EYVx/pGCVmgWiKhBV29QSrg+blY/sQdR50sKt1iKG8OtrmJguzs1rpH
 2SDX3biTjK0zbnpXgdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250061

On Wed, Nov 18, 2026 at 8:46=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The for-loop in genpd_get_from_provider() seems to imply that one can
> have multiple providers for the same node: in case a provider's callback
> fails to map a specifier to a PM domain, the loop continues looking for
> another matching provider.
>
> While technically one can register multiple providers for the same
> device node, one can never safely remove one of them:
> of_genpd_del_provider() just considers the device node, and removes the
> first matching provider.
>
> Use the same logic in genpd_get_from_provider() to avoid confusion.
>
> Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Link: https://lore.kernel.org/20261019160545.GC3705@killaraus.ideasonboar=
d.com
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied for next, thanks!

Kind regards
Uffe


> ---
> v5:
>   - New.
> ---
>  drivers/pmdomain/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 964e44c2f78f1d55..ee8075e90852e738 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -3031,10 +3031,10 @@ static struct generic_pm_domain *genpd_get_from_p=
rovider(
>
>         /* Check if we have such a provider in our array */
>         list_for_each_entry(provider, &of_genpd_providers, link) {
> -               if (provider->node =3D=3D genpdspec->np)
> +               if (provider->node =3D=3D genpdspec->np) {
>                         genpd =3D provider->xlate(genpdspec, provider->da=
ta);
> -               if (!IS_ERR(genpd))
>                         break;
> +               }
>         }
>
>         mutex_unlock(&of_genpd_mutex);
> --
> 2.43.0
>
