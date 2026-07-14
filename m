Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC51B1F09AD
	for <arm-scmi@vger.kernel.org>; Tue, 14 Jul 2026 13:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034983; cv=pass; b=tBsfPlP/I/G6j/oA+RJJsirg1Cr/30CE04UVukuAaZulLmotDVTEqmrNeJdLu43nMTJwMsBCM8Z8hbK8E/Ba0kPTyQqCmV6fWqZuuG6B+54c+uE43XO24gyU8x44rqi0n6P7m3OzteoNqRnrwFO9lVVUf5sl7i56Llwg0FlXEeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034983; c=relaxed/simple;
	bh=Jd5DJDKksYD7YmBkR0dFjXMUrqs3kGnAsls6yHowXHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g5E+NepYULisSrXdEOmN9DQ5dzhiR/BdO8O1ZOiIegladsO7xeN7r5FbpBqw/hFQSt5HqzJIkV/QxoFUnzFT5+bO7uZKNcK9pWJDD9vA5abSHi7jwS3UygyToyXSeF6XUZoB4V0wltT/AKoJOogxiRd6Qx3IR8Vne0HkR0n/4LE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jeDP1noV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cioL0yS+; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jeDP1noV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cioL0yS+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ED3poK720945
	for <arm-scmi@vger.kernel.org>; Tue, 14 Jul 2026 13:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jd5DJDKksYD7YmBkR0dFjXMUrqs3kGnAsls6yHowXHA=; b=jeDP1noVY97TJJm4
	cIhajSXeAsAmHOxUZ5w+rrnFsmDqOKfN4qv1NciKwvl0a9vv59ESqt6/YuJgOXKd
	2U4f3xsKnro776B5eQXUkzzonn9zUj4EjUY0CcmNrVrEgX1hsU92QRCgcXc88Zk4
	AtF76m99A0GiWR0qvmuA/OQHihEj2e1+CtLRE0wEH12PxEsaH+fBoJe1xohiHUcX
	R229DzrrEXb5VIR1CijlNq+5VjsfmV0mgJza7rCEwLCI9oqIAHjuyOO3YurOejU1
	OXk05tjGT7idOG9xzgxgye2BrDtcmOkjjdNsDeOVdRx43SKY0RtvrJ1yvDvre5qj
	UD2uKw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnur2mm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <arm-scmi@vger.kernel.org>; Tue, 14 Jul 2026 13:16:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8e934385db1so77221366d6.0
        for <arm-scmi@vger.kernel.org>; Tue, 14 Jul 2026 06:16:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784034980; cv=none;
        d=google.com; s=arc-20260327;
        b=O1MeFZT3WV5AommZojTZkih0rxrQiB873C4J/gUR79iuW6McTFjzi0TBeX38Z+P7yP
         W6jSmPrVn26Si75ospScwCaN6Wn1f41d2FZlHgi9xcM3VI9C0h3D/9/Y4FkzxuWcMacm
         LOVLf+bvQ5E92hU51McRF40ukaVpnH/YMTMUoBtCOfpBbrvMGxXgdfCx9tXI9K6lP9F8
         z7GiajJVBb+5jsmWWtkngi6cJYS8hLV//SqozHuDl/lZNq0hO93PeYIQxBIlMEEoH7xT
         FwAYfHvv5tHHfXUITkP69IFUl7OFqdvk1T35JS3F636/kEYqpaMyVdsHD5ch6AQrA95s
         ueeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jd5DJDKksYD7YmBkR0dFjXMUrqs3kGnAsls6yHowXHA=;
        fh=AEnbQWUeJ4/Tctg02lIwfJ8QdzSM4n0cOD4SBcfQ9KA=;
        b=DCEHYZseObpn0UKPcwFCGJGkjgb3tzXbxbjKCgonWonH30uc7ykcB747xzTk3E6FHO
         Yy1la4MzkS/frg07KJ9zDhCihHkTTaylAwY3Slq1XpGZ3wX1RuqmryEr4FTgbhCbc4bf
         NWN0yUi4LHhap6pIiSoSAUSLsO5xHkXModuk/gYX6KL1li0xu6NemY3q8XURQBLekRbX
         nrEgXa7XNJcCepUw64AQ+PtAbr4vfF7yMTXN4FFVQ+uBJ7bqMe/iNfJzs8EBrErWVF+1
         gHuPHjNsdNSMWbzUgxIXDen5zV9tES+aY67gQE1eby/oj4R6vSvKMQ57aFDXgNWacUog
         UimA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784034980; x=1784639780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jd5DJDKksYD7YmBkR0dFjXMUrqs3kGnAsls6yHowXHA=;
        b=cioL0yS+m7iQ+Un4y9KPRfCvUwbZxC0xQRu+SZmRcgaQHlaMpOuyJETcrk+xsCydJS
         rx/JXZ0vlPSJ46zxZ/moLbkLzEFFO0TXJ979XZx4o6mPym2i9kzroOI5kygxFEe6Bi5R
         LgVxo61fu3nXasj+kizAbtRICOyjFgRCjtp6XrZ7uzeP0UIS813j7bgUxON3fRhe9zGY
         e7doqxvCPS1+FdTC+4IGTzIMO34POO2/rH3keQo332wYpg9bskUCjm7FIcDtJLzWa07O
         /D1x4xq5YKRCc7P8jD/k0p8unDHZTD20lZwtiaqEydbmFKT/XzVNkmPqitS0BB28LQTQ
         x6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034980; x=1784639780;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jd5DJDKksYD7YmBkR0dFjXMUrqs3kGnAsls6yHowXHA=;
        b=sRWyQA3BRNTeeeNAzSKCMfdMe3gtz/k9jy7sUGVD9qsJqmluoIHl0ptASE+hZevNLy
         IuF3A8fKC7BjWm8m6ld/961DSbt9+lxQeXfmhsQpDUFIJ9BykMU+UUFJCn6+xRTGvwa/
         1oSqgPSGmvtRx4gLzX2P830w1cjYF30vXvPVZgNT6I1LgcY5E6UCiAm2nnQW7lvOf13Q
         ARc5DCUitXEx9hvE9ZWTwUzpX/NhZ6aRmjhKrXhJ+dUl0jVL2KQlmcvJY0aE+1iU9uA5
         hqSEAmMlPo3h/2B+HWY+cH7k8vqdQNwah7DY5prnYXaIN9LWBA1aNyHtwky2Fm/aBiKn
         RVUA==
X-Forwarded-Encrypted: i=1; AHgh+Rp1+jDFI0ywUkeISCGzwWd3xK52o/HPX4KeWxp+FdgrEKEaXlWnh/qbXgYTakHg22938mItJjXDEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiDvc9XIyY4P2gt80iZWm/PRXnrMPLJtSEHkEWoTOWunVmZKN0
	KxdUHsg7zTV1KBaYKZHbwedxay0ZituPp+ruf+e/f/m6b9Wov1OvwaVvlJnJgxzcPimodlAfKbo
	XJ/BoX0A8/QM5XrgCh+Vcx9B1vxPRDrPdFdaoObj3e5JFTAImI+SfoUGZUkQtp8HfSGV0n0PiCC
	nZT6nI9bil7LfFu2GFruLZFo6Yo8UJj0owv40e
X-Gm-Gg: AfdE7cmQYoV73bKt4EKtAiCWnGS2fVPR8Vu+0MNErgl0fWVTB9T++Rz+07TtYbRN64I
	G1+xJmogSKSfEb6b4aDbTKWZ/C+HlIdIzaZP1Jjbziq4K4AB6m0Nb9FKjnrqpFDwRGjmfmJmpZD
	/HS5yM67ocvv4BcOjZiWJSpXASHjE7/7/EwjT98vAjryNl+agcn0K3EZX4k9HAiUwgLfE/
X-Received: by 2002:a05:6214:2689:b0:8f2:67bb:a37d with SMTP id 6a1803df08f44-90747d19fb5mr45880566d6.57.1784034979511;
        Tue, 14 Jul 2026 06:16:19 -0700 (PDT)
X-Received: by 2002:a05:6214:2689:b0:8f2:67bb:a37d with SMTP id
 6a1803df08f44-90747d19fb5mr45879656d6.57.1784034978901; Tue, 14 Jul 2026
 06:16:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d7f7e8c9589d937b60e43168845ab4fda15037a3.1783603600.git.michal.simek@amd.com>
 <ak_Eu_eQKalPMwo-@pluto>
In-Reply-To: <ak_Eu_eQKalPMwo-@pluto>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 15:16:07 +0200
X-Gm-Features: AUfX_mxKzpq6RPl9OYBnCrjfKgjOcnNPKcB_AjUZghzaf78uP1r8iO8ekjIwd1s
Message-ID: <CAPx+jO9KMcxnmt-wT5jaApj9p7s11B6eSG6K08Jt9J=-vXxjhA@mail.gmail.com>
Subject: Re: [RFC PATCH] firmware: scmi: Make SCMI arch independent
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
        monstr@monstr.eu, git@amd.com, vincent.guittot@linaro.org,
        Souvik.Chakravarty@arm.com, Alex Shi <alexs@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Brian Masney <bmasney@redhat.com>,
        David Lechner <dlechner@baylibre.com>,
        Dongliang Mu <dzm91@hust.edu.cn>, Fabio Estevam <festevam@gmail.com>,
        Frank Li <Frank.Li@nxp.com>, Guenter Roeck <linux@roeck-us.net>,
        Jonathan Cameron <jic23@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Len Brown <lenb@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linusw@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
        Pavel Machek <pavel@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Yanteng Si <si.yanteng@linux.dev>, arm-scmi@vger.kernel.org,
        "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
        linux-arm-kernel@lists.infradead.org,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
        "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
        "open list:ENERGY MODEL" <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: UwFew82YXu_AAj-M-zRriW6y3LzA9Fe6
X-Authority-Analysis: v=2.4 cv=E+v9Y6dl c=1 sm=1 tr=0 ts=6a5636a4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=7CQSdrXTAAAA:8 a=K75D1l0-MnsISjLg7T4A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzOCBTYWx0ZWRfX/KMSnqupTBZx
 xF9cb+dFwk2Hj7fwgwsjOYvRZqUdEsM6t34EU+3ht8dgR4SRMuxTACVEDReDc5iKGXWVY+hOOp7
 a+YprRtbwY0lgePR1+uzbj2XOmDG3ANQ0gpiT/6wMDruN6nEXXx/1Pvg9EKFSGesmxBhdOclQ4I
 qDHsC7//9jdn1zceIKwfvWfxzIIo/ccJDtZZv5MocQ/yFcGJuDfcoqLeN+MFzV3i0IW7dx6oUVB
 qLj3OJoHOXnJjiTMEeuu9NiwL2L3721ddEG9gvqZrZASDuV7gcybDK+hvb5tBb6zhpRZVp4WH7J
 TNbXLLrLgTJxwloHWez30iBVLV9OrAn4OXseNhfOptQR88dNli8jDsvWg/BekJZhs/tCOes6R1u
 gAazcu8Bl95kT3CIiGdghuarYtCleTCylA6IceZG0Nq4JVlXJnrHUp5C1hyYhurJOSmBlbqMDm2
 F7DCmmEPj/bemLc8UvA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzOCBTYWx0ZWRfX3WF69qf9mLGB
 eZho0eBVsqd51Eqbul+VNHqguLlUetbn2Nl+RE0MdPwKDKnSs+ufFIx9JdSUbZLrem2t/VEhv2f
 Ryo+F9Rko5F4KjXQhIKSSpenbMI+OqE=
X-Proofpoint-GUID: UwFew82YXu_AAj-M-zRriW6y3LzA9Fe6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140138

On Thu, Jul 9, 2026 at 5:56=E2=80=AFPM Cristian Marussi
<cristian.marussi@arm.com> wrote:
>
> On Thu, Jul 09, 2026 at 03:27:00PM +0200, Michal Simek wrote:
> > On heterogenious systems like AMD/Xilinx FPGA there is a need to talk t=
o
> > SCMI server from different architectures than ARM that's why remove
> > ARM/ARM64 Kconfig dependency with also remove ARM from description and
> > rename folder to reflect it.
>
> While I understand dropping the dependency on ARM (I always wanted to do
> that and test if it worked at all on some otehr archs with QEMU), I am
> not sure about the whole renaming party ? why is needed just for
> cosmetic reasons ? it is at the end an arm originated protocol so I dont
> see it as a being wrong to be named as such even though used by other
> archs...I have not really strong opinion on this...

This is certainly not my call to make, but I have to admit that I
fully agree with the above.

Usually we don't rename files that indicate a legacy platform name,
just because a new company/platform wants to make use of it.

>
> ... my concern really is ... wont this full scale rename simply generate
> a lot of un-needed churn for future fixes and/or backporting ?

We have some git magic to overcome most of these problems, but it's
not always straightforward, I think.

>
> Thanks,
> Cristian

Kind regards
Uffe
