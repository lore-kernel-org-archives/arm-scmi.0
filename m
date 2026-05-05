Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A276B421F05
	for <arm-scmi@vger.kernel.org>; Tue,  5 May 2026 12:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777983479; cv=none; b=qBtah0avo0mTfEBnhDlWKDTbq6Uwhfo1OeYwBBtq7v7f9Gf8Pr4gEGb/tUYreCE1dGECPo/cAzjLlG3Msxg3uEE8DEm6SYvo1qxaKnWO981Np1cWen/jCfdyqCm1/EbzMbpvAdd1vYxBieEC+Qysxo5E+5gqEPp1ZOqZvuufA9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777983479; c=relaxed/simple;
	bh=l/41ncjvsWNG/pOaCT3/ej2L9B5PHEMsEQj3Jxazb6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cfdnSrIMps6oA+5jHLUisI7PRe6lyONFsTivNkbLDe33RDI1UEz1mGKiPTwzBSjsRvwoFgx+a5SGUF3VuspbDipEHJTF6t+TT7K0ZY2ct6diHSrA0SZXjOeFmffipaWseKNqa7i2qDIX5uLrFq/CJveDitc5geZLeHv+rxrImYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-944168e8c5fso3068714241.2
        for <arm-scmi@vger.kernel.org>; Tue, 05 May 2026 05:17:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983477; x=1778588277;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mx10RFm2VbKGi60P1ByLYAwwUUKZhzhPZIKANt76f2M=;
        b=TaXFjM7mKY741cOlnA5K3q7uAlNZ75KHmRjreWkl9aV1siNPxHqwtwkltwbzpePUbb
         7jiJ+ippf2JJU+cpj6WNTNevtVKwrUwUNNX/RoHjF5fuLWlEtJ07yrLnfFFpEYU41ZlZ
         HTNNkKpDoHnZoURIRETqERHo1oZsaxwiTx6ZVN/IYiVJqSeg+f6RnTVJhkvIi6MaYVu1
         jnijTjeam6SL6JkUoPk+6WYnDFKFqZMagn7vLqf5760nkGV733Eo82a3SCIg6fL9eMBe
         jC7S7UH3obCKr2PvyV5atFG1OY2dWLoVJXerMObn4+iWxobdrfJL3C9zkvAQTuz+31SS
         yQjA==
X-Forwarded-Encrypted: i=1; AFNElJ8zW5D35ketyDVPsQhmotwyNEuD3knNlWX0sRv41pSmHNeIfe77RE6vnNfDfGxRZYX1uygoQYOT2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZE3tNKMlBzisxPpVUPcrkAbSg5cIRk88czAFwQr949+iQXDOl
	7r0BPliKSPlA5PBO1u7ky3aiSEDVQusPL96ZlwymDbDM8Cm9e6YBBahCO97FlpOs
X-Gm-Gg: AeBDiet1uBeGxX6E/XOcVhmPaYbPe2Z7TCzU4qW2LX+cV/Ao1geTebzKiOQ+3tbxlxh
	Fv2fmIG2TmZEZrIwY2jSUEceV4fPdLguCyg6MKIPGcAauGkKPVKMh4AcPEkpcpOZ6OToDQrhGyf
	itnt/Cv0VZijq9jkgRTHZR0X7kVjnU8JupIQQMtHEkdUXzbQ9V9ditOVVrl+0H6J/pyqo2OwA7X
	UBLORcbJUAJ9RFL7dxIlrmOPe/AOEiXosGZmh+IkmTtXo+uJcoF6P9Wqe/210BRrcL3l0nDuOlb
	5BDY9mZS9hDMCAJ7/tS9USlj7uwDTV0A5CgsCByT7bs+9FhIyrM3l2GnGThz0HELLLiF9IFnUp6
	8V9X6sIejwR9TOvfER15y1TmVxhsYLCUUqNPdzJJCTpptCbdXR4rhnMG3Boq8ywlbULE4CsaLFQ
	lYE2gFqueiSXVLG8YBrfwXRXWA4+ziGO6lilyFpLX2RdLjn3TU7bVY8SaAEiT+F1MYH2d2VlxPk
	MU=
X-Received: by 2002:a05:6102:4187:b0:610:92a1:15c5 with SMTP id ada2fe7eead31-62f59302e44mr1280855137.31.1777983477513;
        Tue, 05 May 2026 05:17:57 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ce0b63bb8sm6992276241.12.2026.05.05.05.17.56
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 05:17:56 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56a86f0a23bso5278566e0c.0
        for <arm-scmi@vger.kernel.org>; Tue, 05 May 2026 05:17:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9hIZbY2nFV5DXZhPsWmzaPvXfCZmMpib0YKUiD3GyMDS972BeRImF0YeewhS2TX5BpDMIDQU/2ww==@vger.kernel.org
X-Received: by 2002:a05:6122:3c44:b0:56f:7c7e:f33a with SMTP id
 71dfb90a1353d-57547fd53a0mr1268108e0c.0.1777983476537; Tue, 05 May 2026
 05:17:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428201522.903875-1-cristian.marussi@arm.com> <20260428201522.903875-5-cristian.marussi@arm.com>
In-Reply-To: <20260428201522.903875-5-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 May 2026 14:17:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUF1dW0hR-UZMVVqTnpWbMcv1D41jfL_4rEj6Vzj9wGSg@mail.gmail.com>
X-Gm-Features: AVHnY4JwQvUlXCNsMN5caeA9aMIeCzl1Epu5sphmxX2UtNuOS2ulpV9OaCHfntE
Message-ID: <CAMuHMdUF1dW0hR-UZMVVqTnpWbMcv1D41jfL_4rEj6Vzj9wGSg@mail.gmail.com>
Subject: Re: [PATCH v3 04/15] firmware: arm_scmi: Simplify clock rates exposed interface
To: Cristian Marussi <cristian.marussi@arm.com>, sudeep.holla@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, philip.radford@arm.com, 
	james.quinlan@broadcom.com, f.fainelli@gmail.com, vincent.guittot@linaro.org, 
	etienne.carriere@foss.st.com, peng.fan@oss.nxp.com, michal.simek@amd.com, 
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cristian, Sudeep,

On Tue, 28 Apr 2026 at 22:16, Cristian Marussi <cristian.marussi@arm.com> wrote:
> Introduce a new internal struct scmi_clock_desc so as to be able to hide,
> in the future, some of the needlessly public fields currently kept inside
> scmi_clock_info, while keeping exposed only the two new min_rate and
> max_rate fields for each clock.
>
> No functional change.
>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks for your patch, which is now commit 83fd9d34b6b75be5 ("firmware:
arm_scmi: Simplify clock rates exposed interface") in scmi/for-linux-next.

> --- a/drivers/firmware/arm_scmi/clock.c
> +++ b/drivers/firmware/arm_scmi/clock.c

> @@ -457,14 +466,14 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
>         flags = le32_to_cpu(r->num_rates_flags);
>         st->num_remaining = NUM_REMAINING(flags);
>         st->num_returned = NUM_RETURNED(flags);
> -       p->clk->rate_discrete = RATE_DISCRETE(flags);

This removes the last setter of scmi_clock_info.rate_discrete.
However, it is still used until the next commit cd73d1bfaa8d34bb
("clk: scmi: Use new simplified per-clock rate properties").
V2 did now have this issue, as the patches were ordered differently
in that series.

After both commits, there are no more users of
scmi_clock_info.rate_discrete, so it can be removed.

> +       p->clkd->rate_discrete = RATE_DISCRETE(flags);
>
>         /* Warn about out of spec replies ... */
> -       if (!p->clk->rate_discrete &&
> +       if (!p->clkd->rate_discrete &&
>             (st->num_returned != 3 || st->num_remaining != 0)) {
>                 dev_warn(p->dev,
>                          "Out-of-spec CLOCK_DESCRIBE_RATES reply for %s - returned:%d remaining:%d rx_len:%zd\n",
> -                        p->clk->name, st->num_returned, st->num_remaining,
> +                        p->clkd->info.name, st->num_returned, st->num_remaining,
>                          st->rx_len);
>
>                 SCMI_QUIRK(clock_rates_triplet_out_of_spec,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
