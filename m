Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016741F8724
	for <arm-scmi@vger.kernel.org>; Thu, 23 Oct 2025 13:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761227931; cv=none; b=Mro75tNbGNQCKSvhefW+DIL73TaUGGPFx9Y+jIkv8HJz3Phr2iF8wq9fuuMCWc54GFuwvVfCMn88bPS+kAxIB8A0SJdPN/6U6g4tPTPCiPvMjYfnqFQvlGCL8jqitSDTvOQndcZL1o7QdCivsANiUnGDjJLqVtn09NBbj0hwa40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761227931; c=relaxed/simple;
	bh=70l9t4VdfE1npK3VaiMwUNG+xoIszb0NPTKI/djYJrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qbEsVOWzJS3mS7SHMfKP//2uMJrnf/Krw5wyLeV2YInWAhS6LHR3dpVpFwwahqglN4+RahS64ZItBU4TxoS2DxwICqhPtXxeeO8lriR9AKXrAcxwFBdxerC7TNELFtLF/QKZj5tBLrnO+cpC+HGqOG0Dulrx015aPKUSmhFTH7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5db1aa8c93eso425979137.2
        for <arm-scmi@vger.kernel.org>; Thu, 23 Oct 2025 06:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761227928; x=1761832728;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LHznA4IxR0ryi2cJoCEHN+kBwQ2XKkkZXeR8LA/d1QU=;
        b=I/ZO9AoxEPeKxfOAiLmZeJb0+cItwgEUrz0JjrDX1mvOAXMjYdvzpOlRLmN0DQZmGH
         qS2hvelySkh2kFON0aOwfyipaXq5GjQvJMOVmZQJW6rh74VqrOgxV75H1KCp0I1z4nqn
         UyTglrPCo8VWXXpl8Me/V3CyM4OuiKO1b73blL1WARowbsVA4utBUpjU+DzvVZTPHiX3
         yyOO5SGh/Qodr9d7UqDjfr7vVzXnkq13YLMEXRwoHLfnKpr49XnjMPN30ajmhzPoeRNX
         tNlRFwcG3HbrB0bVHPtxcuNC5wifsN6N4Eww1+W56+YKUH9JSecXsOmWKpNMPMHiezz0
         kpNg==
X-Forwarded-Encrypted: i=1; AJvYcCUxxKLWdbLAw7l6VcHIwR0VIl8yIDkGlhI2q8/lCjtTpS5GGeAN+W13Sm1wflz+u8cHGDHNAh9oFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZfLxUg/w3sGZO1SGxoa2dJT4JmcEqRGctyMBxny77XsycawpL
	pZTE7Dcc8j0G/W4g1a90cJRkO5NfBN9MKP8UZq9G2Gqm6skcNaZSGFm1PbKn6nUt
X-Gm-Gg: ASbGncuJrg3d9ecsUSfVWElMmF6DcLv2oipnylZjUltmDgFeG0i7GikBCm7uNpaZu/p
	ZsKCIwAoEl1+JAZBK7CbUicG5v/r5t+qaPLiJdpj108IhP/lGTssAOqJpC23Vg8eu0aFUEiHdOh
	p39XlG+TXJpRBOtbfZBPBSu3SQ3Hr8f+fi+VeWkapARup60cmPLkeiLNoIN4bZHluxyN2ny1RLl
	2wip5JrG+FmL9umGQ37TH2UuA7IsZWEdQ8PfaNI16jFCRcTqDgGDbW/Zyj9znXazJfF52WpEpwT
	wun7RiK0Yw76sXx7rbe4gglJdkDQTvCuWcNT1BQ0j6g0tcNbcqa6tfCvt2C6qwn0YmGyJqMMGpP
	MSbeK2v0RlaQXDjnPDaPqu8St3GAuwWoG58XfKOxgW/WataCnVdWE5Rz2k+hkRIu44Pu0JyAbNf
	j4uaNyNknxw5faDgJwpzinLWTtHaJ3mr77MNMCewZvynjEqFN6
X-Google-Smtp-Source: AGHT+IHey8ZBZZRMvisNELKGQeH39L4ts07VtQ2l/ehnqH2FpMnb/JsSbvkhH1eMk5dszHKIWS7qhA==
X-Received: by 2002:a05:6102:290e:b0:5a1:ea0:f56d with SMTP id ada2fe7eead31-5d7dd6d937dmr7869793137.32.1761227927721;
        Thu, 23 Oct 2025 06:58:47 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5db2c7c93b7sm881091137.4.2025.10.23.06.58.46
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 06:58:46 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9310a7b2668so255277241.3
        for <arm-scmi@vger.kernel.org>; Thu, 23 Oct 2025 06:58:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXQ0ZiKp+gMU3Wg9v5wAbI6jipqa8nS58GiTYJST8MZTmSzD6r7hmUu37/9xhxPmlsn1Bky2l+uJw==@vger.kernel.org
X-Received: by 2002:a05:6102:c09:b0:5db:3935:1636 with SMTP id
 ada2fe7eead31-5db393518f0mr253967137.26.1761227926239; Thu, 23 Oct 2025
 06:58:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251009-clk-ssc-v5-1-v5-0-d6447d76171e@nxp.com> <20251009-clk-ssc-v5-1-v5-6-d6447d76171e@nxp.com>
In-Reply-To: <20251009-clk-ssc-v5-1-v5-6-d6447d76171e@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Oct 2025 15:58:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU-UkzLnrPpBVyMH0DtgubxE_spUYbxtpO+5dmkFFqdcQ@mail.gmail.com>
X-Gm-Features: AWmQ_bl-Wzz5qd5CCY2fSVugSIzDYGwiZQethxZEtHbYBjXjOaCfH3VbWwjwxpU
Message-ID: <CAMuHMdU-UkzLnrPpBVyMH0DtgubxE_spUYbxtpO+5dmkFFqdcQ@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] clk: scmi: Add i.MX95 OEM extension support for
 SCMI clock driver
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Sebin Francis <sebin.francis@ti.com>, Brian Masney <bmasney@redhat.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Peng,

On Thu, 9 Oct 2025 at 05:49, Peng Fan <peng.fan@nxp.com> wrote:
>  - Introduce 'clk-scmi-oem.c' to support vendor-specific OEM extensions
>    for the SCMI clock driver, allows clean integration of vendor-specific
>    features without impacting the core SCMI clock driver logic.
>  - Extend 'clk-scmi.h' with 'scmi_clk_oem' structure and related declarations.
>  - Initialize OEM extensions via 'scmi_clk_oem_init()'.
>  - Support querying OEM-specific features and setting spread spectrum.
>  - Pass 'scmi_device' to 'scmi_clk_ops_select()' for OEM data access.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/clk/clk-scmi-oem.c
> @@ -0,0 +1,103 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * The Vendor OEM extension for System Control and Power Interface (SCMI)
> + * Protocol based clock driver
> + *
> + * Copyright 2025 NXP
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/of.h>
> +#include <linux/scmi_imx_protocol.h>
> +#include <linux/scmi_protocol.h>
> +
> +#include "clk-scmi.h"
> +
> +#define SCMI_CLOCK_CFG_IMX_SSC                 0x80
> +#define SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK      GENMASK(7, 0)
> +#define SCMI_CLOCK_IMX_SS_MOD_FREQ_MASK                GENMASK(23, 8)
> +#define SCMI_CLOCK_IMX_SS_ENABLE_MASK          BIT(24)
> +
> +struct scmi_clk_oem_info {
> +       char *vendor_id;
> +       char *sub_vendor_id;
> +       char *compatible;
> +       const void *data;
> +};
> +
> +static int
> +scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
> +                                const struct clk_spread_spectrum *ss_conf)
> +{
> +       struct scmi_clk *clk = to_scmi_clk(hw);
> +       int ret;
> +       u32 val;
> +
> +       /*
> +        * extConfigValue[7:0]   - spread percentage (%)
> +        * extConfigValue[23:8]  - Modulation Frequency

What is the unit of this?
According to the code below, it is in Hz, so it is limited to 65535 Hz.

> +        * extConfigValue[24]    - Enable/Disable
> +        * extConfigValue[31:25] - Reserved

Center, up, down, could be stored here, I assume?

> +        */
> +       val = FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, ss_conf->spread_bp / 10000);
> +       val |= FIELD_PREP(SCMI_CLOCK_IMX_SS_MOD_FREQ_MASK, ss_conf->modfreq_hz);
> +       if (ss_conf->method != CLK_SPREAD_NO)
> +               val |= SCMI_CLOCK_IMX_SS_ENABLE_MASK;
> +       ret = scmi_proto_clk_ops->config_oem_set(clk->ph, clk->id,
> +                                                SCMI_CLOCK_CFG_IMX_SSC,
> +                                                val, false);
> +       if (ret)
> +               dev_warn(clk->dev,
> +                        "Failed to set spread spectrum(%u,%u,%u) for clock ID %d\n",
> +                        ss_conf->modfreq_hz, ss_conf->spread_bp, ss_conf->method,
> +                        clk->id);
> +
> +       return ret;
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
