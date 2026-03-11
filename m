Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255422BE05F
	for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 00:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773188188; cv=none; b=YAeKKBqYG3Gu/53fE4flB05dusCLYpmtNbWTGsz0pZnE4w4D9YccJCcEKIRCUbtc/OxfEPrloR8Q7Vu6B/SJNbGOFaT6uAiGgC4ljGzf66KvS6qWmCmab47eNIXKEjVtgfSi6CYdhTq5mn+y2d1mhcFu0HTZ9/1TRfGWRN4jc3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773188188; c=relaxed/simple;
	bh=RkQr/oJ5AVva8ppnZ/QxljiNwt7nDUcsbBiCUPkROPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wd3E8n3Kdgb61nFXd+OiDB+KGjD8pLnuoiwI7w+NMIUWMbmiYA9lYYa+oHxOvGHNAAxVUCx1I8Hf6t2mjeyALzEUGV09zLitRepv3EFYMxNJssBFaamiOE7URSDbX6DGBtpgC42YD2oGPAkGn8dPoYppZVgt48Kom+v3vx9BRxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OKa9lxx+; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OKa9lxx+"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b94358796a1so658247166b.2
        for <arm-scmi@vger.kernel.org>; Tue, 10 Mar 2026 17:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773188183; x=1773792983; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkQr/oJ5AVva8ppnZ/QxljiNwt7nDUcsbBiCUPkROPA=;
        b=OKa9lxx+I8PMER7QzgrfnLXUFTwZ+LEnB0LyqNytQbJpnsZEHosPG9sliJTI2lpher
         VpHFQ8nhrgHwN8bnSmyuA/jyDAC/3AlzQ0ZfWsoqk1cz6csf3CIbQpubhaPCsBUBYRRK
         Le828tWYTWnW11RxJ+YijLFEOkOoG3S3rVb3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773188183; x=1773792983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RkQr/oJ5AVva8ppnZ/QxljiNwt7nDUcsbBiCUPkROPA=;
        b=fUko0fjcK7KO2qlRiwrolPYob+PNa1IK7Jz9RLtDlSH02Co46OOstJN6zM4XNys+HR
         +euVo8+VHCg/2dbd5/aCYGj7F0MwuiNtOd2lETRJs+B2vHr955ym0ADE+kn+bGZK2/uB
         ASJX3Lh+8G0MZWB+OY5tvl62Tg/Qy2zYG7S0s6QSUWV3LSOEF+MFf6o1itptmY0SMZsP
         rhsL2s9GNM/16b2Mz4EyAdJAbt8D+9JumlN3oX/PQx+ciBdqXjaqYsN3/85JbguWmQtE
         kx+BvZT3QNGOJTASYgu1BpmCi7diYb4ZijdumnZW4wRzKxUbM6L/mynkZ2oSTUeGgupB
         Udog==
X-Forwarded-Encrypted: i=1; AJvYcCUJszrp1QRyQbailU2QxUQfrGU8EMn8kDx6vVgitAx9yiujD4O7XnMFD9lXUnE0chNIWr+52a3izA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqGRm5mp1CN4/GdL4uIqAnUTfzir0mn6lfptEXvRw41qil6fH8
	b4+HRtfBoSjDNfZ1q/jW1z2Bk/2Pu8un787bVZRS7yrqS6mfxg6RuhVc2s0ea/DmqZ0TVqTgjYW
	AEQ2TlfUk
X-Gm-Gg: ATEYQzz1kgTRpEqMpOvelrXcw2N0pNHgKkgcj3n7UkARjr2ekcMrQCFh3TPjmLkoVKZ
	OwlH3XU+uimInSk4hkSwFVIyWYyATcIrrD4EJsgnqzXQeGaNwI/JGa0oJWMYWdcG+hBcuyiBdYD
	4I64pSHU9ItkLk2Tk8JRPL2bJXwC4H0ZDeDeMhd8MiwqbB9+g1yrmmNOg2SETH85GJWTB7dynIU
	LlZLuyFLSrMcpLSKwflZ94HgQn+cNLgoakdlpJ3R1xanKr+mzRNjgHsiXzPjNeh63lSwJmrpkxo
	Z+Ac/F1f1y+BuatUB/RDLN3VJL95hlouyIfSuv60MZykJziewdmKcqQptBRNuyTMQCl5GsQ2j5Q
	bJP0uTrTYCBK3t5u01dCmkHKb8oDPLDdWENFK2GRQO4AJFmdyuV+CIy98DwI3CHaJeH3Hvhnx5c
	6O+RcCXlEi5BPwt2BXwnKtlXkrS9NGrD4QyiOitgbbP8IOSttxMPxaBqUsdzix2w==
X-Received: by 2002:a17:907:6eaa:b0:b8e:fad0:6c97 with SMTP id a640c23a62f3a-b972e2693a1mr23667866b.8.1773188183505;
        Tue, 10 Mar 2026 17:16:23 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972de4847asm14203766b.21.2026.03.10.17.16.20
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 17:16:20 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439af00d33cso10631115f8f.1
        for <arm-scmi@vger.kernel.org>; Tue, 10 Mar 2026 17:16:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXOPeVCuEWhMXyGGThgu2t+RREgVe6hrX2eUxn+XAEt1uUo07Dz92/7HkNaor2vqFn/Ie/XAnvv9A==@vger.kernel.org
X-Received: by 2002:a05:6000:2913:b0:439:b3d2:3768 with SMTP id
 ffacd0b85a97d-439f81c8cc0mr1467675f8f.21.1773188179252; Tue, 10 Mar 2026
 17:16:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216181002.3475421-1-dianders@chromium.org>
In-Reply-To: <20260216181002.3475421-1-dianders@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Mar 2026 17:16:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VUUNDgcOMjhA3Tiptwm3-s+LiUNeObAoV4tTQbkg0mPQ@mail.gmail.com>
X-Gm-Features: AaiRm50L1dSQfXqKqL2lF5VIOHGsndPMM8bpxj2iTcUPN8asbNOQBrAMfnlkmEo
Message-ID: <CAD=FV=VUUNDgcOMjhA3Tiptwm3-s+LiUNeObAoV4tTQbkg0mPQ@mail.gmail.com>
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

Hi,

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

In case any mailbox client API users want to comment, Jassi has
proposed an alternative to this series:

https://lore.kernel.org/r/20260310234616.334498-1-jassisinghbrar@gmail.com/

Feel free to join the conversation over there. :-)

-Doug
