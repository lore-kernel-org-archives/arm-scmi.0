Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6102F7461
	for <arm-scmi@vger.kernel.org>; Thu, 23 Oct 2025 13:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761224846; cv=none; b=EJr81jWXtcoDIxxQNIlwlIwmj8djquTNQuwgNsh2hkepjjJ2/U5msqU1r/oxJQDZtnR4pLPr7Dh2Z8foy411dMX2QKJwaAy8OKxZhXWnmzq4fFTnyxmADpu8uFgUwWNBdnn/Wih24YEmS5MQJRL+TmfXlvX6ZB5yND1lvEvtgSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761224846; c=relaxed/simple;
	bh=1g9sL1pNrDVYwOAiQV7CDpxqC258lm15lCus2uSGOV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W8akXBi4P8LUP3Nmoqm8q+CAZ4RGWioo/f6TckVe9GI1YdjXku8xqtQMWvyTNr0871LfcCtzD1+EK0bRfTKjUBymT2MWZDOFo4rpLyTUJ+9BQWkftLRwiMnvRpQctSD7GOECHgjZO/K4nszUyaDwcUpfvSRgNv5qqCgywidBnaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-54aa5f70513so211320e0c.2
        for <arm-scmi@vger.kernel.org>; Thu, 23 Oct 2025 06:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761224842; x=1761829642;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lIIdZrvjerU9TUToExl2D/WzzHrGb42zkKRg3dbolEQ=;
        b=ul+vS7ZVYOvjcwOUzU8Hv0Kh/+aLXd9Y27vSh/AMPXzvnKrUErutzGKWEEDl1h4Glb
         zse6seis6YqBNZ1cjENz3Qo0eqdEdCrLxChyQZKs97CHRY/pFyEJd+RAvIvNAKclsNDw
         cVdDiq4xxkXmIhYefv6K5hwhHowhWiPG4GHiDnXFVfu/l4z5wlqEb1ccZDovIG+NMvbG
         3BrY6UQKwUmI1FMkU2PrdSDsohCAAdS9zwrEoI+pNmntMMOLHAGBFfLQUHGtshMX+Lw1
         bt9cLZRQeUV3jw0VDFDPS1dWFnk/wG3/bs5zdHRxtjDe59ErKreDEc/m6VdJTPmA863n
         xS5g==
X-Gm-Message-State: AOJu0YzbcgkQq/zDeUTFbPqEQ0Ncvr26K9VVrJ6cz5CzEyi32HnlB2Y4
	aX5PFHTAKEsrx3+jnaqIIkQxY/0ebcsFt22KjHzUJ9Lr2AgfQDsuMdFwct1vj32P
X-Gm-Gg: ASbGncsdAC8XJl12Lpr/qljRoK+ufHzsB8RIxOgo3D5wkvHcoqY5Mb16+89UF6AJYPI
	rB81ZWynv13iRA7djl9R4vmpXhrUJCw4haEZIV0bx5bon8eVA6vZTRvsFzqr88tkLk9EwBl0IsS
	frAUVZQzcvpmtVMQDsHy8RjJVZBmaG2Y6PaOoM6c6JESR4Temk+3atOuvXB2ZyMEkZ0Aau/zSgf
	5HeSUe5HyrawmpyNvIyIdQifngBuz7Tv+BJ5Wemm9/Uxycziryl4RLhPXMp4cfckvr7AWqofjv6
	RvZY5uzvMBRdPhx2noF7VX3kSlIhV5Bx7NNOCKw6fD5T2uaiPX9m0qevmBic8PyfJW2xCzp/2nb
	dtAe6rcnp73eyiTW0CXTB+Ezyjyt7mbyzT1Xn+j3zAdT1ZXIgLWSbJNu/x0RaaXTj97b4BUlYIU
	b10TZsNWh0YfWrIX7MDehckcLFvb+HA/7J6BAnRT43nmxi2yRi
X-Google-Smtp-Source: AGHT+IF6irqMpnml0OeHbjm+SfTSdlTSxiN84bh2Ov15nrUf6Psq/9Dmhq/+2xDs9/rweZS2OUurZw==
X-Received: by 2002:a05:6122:2a46:b0:544:6d4a:f52b with SMTP id 71dfb90a1353d-5564ed88598mr5967829e0c.3.1761224841781;
        Thu, 23 Oct 2025 06:07:21 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-557bdbb82e5sm701020e0c.14.2025.10.23.06.07.20
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 06:07:20 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5db37a935f1so120987137.1
        for <arm-scmi@vger.kernel.org>; Thu, 23 Oct 2025 06:07:20 -0700 (PDT)
X-Received: by 2002:a05:6102:304a:b0:5d6:18cc:6087 with SMTP id
 ada2fe7eead31-5d7dd6d67e3mr6298079137.30.1761224839798; Thu, 23 Oct 2025
 06:07:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Oct 2025 15:07:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXq=4zb421MnwFvhFT_0K0HM=-LhWKueCHnfaEcGEgSLw@mail.gmail.com>
X-Gm-Features: AWmQ_bk40KChNfSwzFv_aBWco4C4_I0K0e8reqSSxWUwprZ1XtIdssKPgaWL4cw
Message-ID: <CAMuHMdXq=4zb421MnwFvhFT_0K0HM=-LhWKueCHnfaEcGEgSLw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: arm-scmi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Thu, 23 Oct 2025 at 14:37, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document new property arm,poll-transport, which sets all SCMI operation into
> poll mode. This is meant to work around uncooperative SCP implementations,
> which do not generate completion interrupts. This applies primarily on mbox
> based implementations, but does also cover SMC and VirtIO ones.
>
> With this property set, such implementations which do not generate interrupts
> can be interacted with, until they are fixed to generate interrupts properly.
>
> Note that, because the original base protocol exchange also requires some
> sort of completion mechanism, it is not possible to query SCMI itself for
> this property and it must be described in DT. While this does look a bit
> like policy, the SCMI provider is part of the hardware, hence DT.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> @@ -146,6 +146,13 @@ properties:
>        this platform. If set, the value should be non-zero.
>      minimum: 1
>
> +  arm,poll-transport:
> +    type: boolean
> +    description:
> +      An optional property which unconditionally forces polling in all transports.
> +      This is mainly mean to work around uncooperative SCP, which does not generate

meant

> +      completion interrupts.
> +
>    arm,smc-id:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
