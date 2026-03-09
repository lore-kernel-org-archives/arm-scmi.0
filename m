Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EB53DA7F8
	for <arm-scmi@vger.kernel.org>; Mon,  9 Mar 2026 15:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069930; cv=none; b=U2GbCldmeGeO7m+q6RcLOuTPnVSe37HuFNCupCy01k2wVwOwQK/X+n8+0DJeliDVx5a1UiPzqoEOaMbkYFvyhRiS7/A+vXcPnyLNZ8VbN2xJNLbCA0IEgagqpF8Wdkbq6/f756E4eURMHzM9n2+tOCVmsqowVf4ZrAebMNVyQJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069930; c=relaxed/simple;
	bh=fLdlgK54rTn34EKZI8AHzVRLbm2SJ8RTjlamikvXF3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sALPwUFMX7ZdL0W/hBg8aQG2S1g2Rq4qWGlzT5cvL8V/MRC9J9XTOgYlhdAaJn22qZ/ZA1H0U5G0qptXSQmqHFJJIcEkUX2fJIAAw8WzTWMeAgMdKn+V01JGi7ZVkxzav7xM/8SAne/bF3UMJphStvWace+Iw37bHLxWi5cocwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jhBhD312; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jhBhD312"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a12cd0bcd8so6156103e87.3
        for <arm-scmi@vger.kernel.org>; Mon, 09 Mar 2026 08:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773069926; x=1773674726; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKq8ulzy5MHQKDxfFMVcrLftpi/uwWVl0kgu6a2rhEE=;
        b=jhBhD31274pYpr3Qg2ynVKQMJgA+IFGCLfCAKabFMmhe9FAWUhluReLFzwqSd15vwN
         Dp+cxUj+r8OPpb/zl+TcEc2/FNIqLoM0RkVHcqbMJxPLyPFjbq2bY4U3Mrn0dvy+obtT
         j7cesz01199ABVVOsoPAPUR4ZbO/8f9tej7hM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773069926; x=1773674726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xKq8ulzy5MHQKDxfFMVcrLftpi/uwWVl0kgu6a2rhEE=;
        b=jJAznQikmvbfqtatxDJKGsodElcqJsW9TNSHS/C+F1X57ux++lvgqTaWTaFXLXz8Bj
         amOacWVOSgmDI05pY3Iz5aEULYVXhpzFJl7kxsCdI724ZnhQBwu/li9wfsGYBjbGK2mA
         SZ/sF0VpJyWk38gBBaiGL2pAl/+A+wvI/hps+ipKCwOGxLPkmQr3Ys87LIVfvl4Ejwoh
         s1uHAaaPJQRla5t/qfJ3KRnM6fcxKLpDxomWXkl3+w0GMi3xm4AiOBweE/V1xulDTPX3
         Aw9S2NnVZa6POLQpxjs5C1+oD+7nTBOKFCWi3T27E0aSiXUOapFxEvEukfvPjeggWHm0
         +ZPw==
X-Forwarded-Encrypted: i=1; AJvYcCWF0a+TlL8ZYNSk+k2vqMu+HHIic1ZQHyap9+FHn0qII3mHFOIE9UgY73fZ683pCSTlovg+B1hB3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjIKiHn/NMXz4u45KHwCAiLEABXqAKDaDVkHZfBotsXExLDJrB
	5NiDObQm1RY5JwFw/+G9gwrOHhTSskUhZKE/4a6vgWEr4/DIU/AsY1AEJ80kVbNw2cz6J0tjA4s
	ohlmOP+sd
X-Gm-Gg: ATEYQzwcBXmauWKgTaxvw58RB28It3s2GmuKEKmHWmbu8/sPmpERLgqJmXGPpe+E6oC
	VuIKoQAp9Jr1MJAkzPbsqnkcmfq4ES0jTgk5BeMhHW9vakJMnPEtK732/TbHZLDfyYIJpjAcjqG
	zx58AN53FYhHaGfIR3lB4rrRInGq6A20pLhFcqLmTObY7Ioi4zoLanLZqo2cV67ilmGFDCQmJ5x
	3fgxVAegrJ/syPcxRnNLjWLLhXl9Pb1JN0FcTqqZqcbA7L2K1yAV+bHhR4480TGXjhbyEdjhE7V
	ppeR4zJRUdEo5AhmQH7dj8KVVsYRbbbdwITp2/pvkUbgiwUcIiQB1KLNlJjZ0jHl45z1UoelwFq
	E3KpUtC6s7ZxCHGua3Jp/X6m1BpVyERV6JizL00ZKOpd+rCpePoPQppHs5luJ+OZEB4LccLx4+2
	y0rHQO69gsbKuwDTUACQIBmSsRmVA8cMcfrL5i1x/zxX87XqENuDVKAwqJebMAnA==
X-Received: by 2002:a05:6512:230d:b0:5a1:476f:bbcd with SMTP id 2adb3069b0e04-5a1476fbedbmr1775490e87.44.1773069925900;
        Mon, 09 Mar 2026 08:25:25 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d08cba4sm2145992e87.83.2026.03.09.08.25.25
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 08:25:25 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59e5aa4ca41so4844966e87.2
        for <arm-scmi@vger.kernel.org>; Mon, 09 Mar 2026 08:25:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWLccBr7ogI3Qn+jUMX0kh99N5FzIPLP+04G3ghYq6SxmvW+yaPY61KZPTQrXFAmHa7JmAJdbn40A==@vger.kernel.org
X-Received: by 2002:a17:907:1c2a:b0:b96:dcc0:2e19 with SMTP id
 a640c23a62f3a-b96dcc03e2bmr431706766b.56.1773069586848; Mon, 09 Mar 2026
 08:19:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216181002.3475421-1-dianders@chromium.org>
In-Reply-To: <20260216181002.3475421-1-dianders@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 9 Mar 2026 08:19:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XosP+rpT7w1Dcr=Xu7K8MCnA-=hndCgvsdwRAeVXuUdA@mail.gmail.com>
X-Gm-Features: AaiRm52PitiYzwSf40xttz_JauQBZgQS8kA13tji_SRNQ2F75XcOox36FcsJy20
Message-ID: <CAD=FV=XosP+rpT7w1Dcr=Xu7K8MCnA-=hndCgvsdwRAeVXuUdA@mail.gmail.com>
Subject: Re: [PATCH v3 00/15] mailbox: Stop sending NULL mailbox messages
To: jassisinghbrar@gmail.com
Cc: Frank.Li@nxp.com, Santosh Shilimkar <ssantosh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, andersson@kernel.org, arm-scmi@vger.kernel.org, 
	cristian.marussi@arm.com, daniel.baluta@nxp.com, festevam@gmail.com, 
	imx@lists.linux.dev, jay.buddhabhatti@amd.com, jonathanh@nvidia.com, 
	kernel@pengutronix.de, konradybcio@kernel.org, krzk@kernel.org, 
	lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-tegra@vger.kernel.org, lucaswei@google.com, marco.crivellari@suse.com, 
	mathieu.poirier@linaro.org, michal.simek@amd.com, nm@ti.com, 
	rafael@kernel.org, robh@kernel.org, shawn.guo@linaro.org, 
	sudeep.holla@kernel.org, tglx@kernel.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jassi,

On Mon, Feb 16, 2026 at 10:11=E2=80=AFAM Douglas Anderson <dianders@chromiu=
m.org> wrote:
>
> As talked about in the first patch in this series, passing NULL as the
> 'mssg' argument to mbox_send_message() ends up causing confusion and
> quirky behavior inside the mailbox core. Despite this, there are a
> number of drivers that pass NULL.
>
> It is plausible that some of the drivers passing NULL may have been
> taking advantage of the quirks of the mailbox core. Specifically, they
> may have been taking advantage that calling "tx_done" wasn't truly
> necessary for NULL messages (it was a noop) or that NULL messages were
> passed onto the mailbox controller right away without queuing.
>
> This series introduces a new API call: mbox_ring_doorbell(). The new
> API call tries to mimic the specific quirks that were helpful in the
> old behavior and it's expected to be a nearly drop-in replacement.
>
> There are some subtle differences between the new call and the old
> behavior, but it's expected that all of these differences are only for
> cases where the old behavior made little sense. The description of the
> first patch details these differences.
>
> The series attempts to convert all in-tree users to stop passing NULL
> for mssg. As per above, there are some slight differences in behavior.
> If any of the patches are causing problems, they can safely be
> reverted while debugging the problems. Eventually, all code should be
> converted over to stop passing NULL mssg.
>
> Changes in v3:
> - Suggest mbox_ring_doorbell in the warning message
> - Updated patch description based on Cristian's response.
>
> Changes in v2:
> - Instead of just documenting NULL, introduce a new function
>
> Douglas Anderson (15):
>   mailbox: Deprecate NULL mbox messages; Introduce mbox_ring_doorbell()
>   ACPI: PCC: Use mbox_ring_doorbell() instead of NULL message
>   firmware: arm_scmi: Use mbox_ring_doorbell() instead of NULL message
>   firmware: imx-dsp: Use mbox_ring_doorbell() instead of NULL message
>   firmware: tegra: bpmp: Use mbox_ring_doorbell() instead of NULL
>     message
>   irqchip/qcom-mpm: Use mbox_ring_doorbell() instead of NULL message
>   remoteproc: xlnx: Use mbox_ring_doorbell() instead of NULL message
>   rpmsg: qcom_glink_rpm: Use mbox_ring_doorbell() instead of NULL
>     message
>   rpmsg: glink: smem: Use mbox_ring_doorbell() instead of NULL message
>   rpmsg: qcom_smd: Use mbox_ring_doorbell() instead of NULL message
>   soc: qcom: aoss: Use mbox_ring_doorbell() instead of NULL message
>   soc: qcom: smp2p: Use mbox_ring_doorbell() instead of NULL message
>   soc: qcom: smsm: Use mbox_ring_doorbell() instead of NULL message
>   soc: ti: wkup_m3_ipc: Use mbox_ring_doorbell() instead of NULL message
>   drivers: firmware: xilinx: Use mbox_ring_doorbell() instead of NULL
>     message

Just checking to see if there is any addional changes you need from me
on this series. It looks like it's -rc3 which is maybe an ideal time
for this series to get some linux-next bake time? A good number of the
patches in this series have Acks from maintainers so they could all go
in your tree, I think. For those that don't, I guess worst case they
just don't land right now and I can re-post them later. ...or if you
think they would be OK to pickup that would be cool too.

Thanks!

-Doug
