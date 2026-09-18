Received: from mail-vs2-f6.google.com (mail-vs2-f6.google.com [74.125.227.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7AB2749DC
	for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 07:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789717612; cv=none; b=GHh2J1s/VXr6UVEA7oOK1Y9jpgDXmwJBEZlH082TRsaIo64l/qvQMfu3MkTP71bIV1FwV5zdljGDNl2cdwLM/+vlKkKd4P7ds0314KqYwthBwQwygmBdPEvOPz9LCpQYO/7AC6J/RGC1iBCxOg05NAi+i+oAgRZEeEkWPtt9H+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789717612; c=relaxed/simple;
	bh=wTlung53wgG0U6uz6ynHrcjwVaYOb0YK4Nvyasm8+go=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n3KWD7FxlL5+BhsTk3DpIPG1OIDrsQ6ixe4SadbNBpgNToWZFX9zUkBPCPub6oIzsZXwPhZjVFIy347fjs6WabJZ6OlAywQCsB/ur7JQ47pML27swld0l3DOa8Ar8xNU7vOEuVafbEsof3e3cdG3OnnKzCQBIHLz79coNtLyJvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f6.google.com with SMTP id ada2fe7eead31-7832e0210adso77585137.0
        for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 00:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789717607; x=1790322407;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y+tYCkkvzZJmFoYOhTQyYw6fM+qA/usgZs/lU8fn+ao=;
        b=hL12CATi2LrpjNsc1MpxmXcGaNx/MDXjvSSDcELHss0K/LaPEKW1PKakxM/9UmLpT9
         xhf90S09qCMOz3AOUS9LkEluU1/dtxLsEurxeMhgWn1x7BXWcs46SVKKc+C//PkpZ025
         1fTOFS91zFQbFWmAiDDD5xI8o00BHOFClq7O/YUhYUX4DdWWFEXjkzAN3FNzHMPLs3dK
         g77tos5wvc9HTgLcvGJJkhFkWnjwanqbec8ABtwXmbsKP52r/jXHBAGQyydaiNTIDvu1
         kntJu/bspUKuJyLpv7DgW5ShQAjeUQHvMnaURAdNLZYTkdx7ChckrWymZANxzhruD6LI
         wq2g==
X-Forwarded-Encrypted: i=1; AKwUvBx0ok6u59/bt2KPDuaNOj9vPv3zOpnarpzSyrEsI0ObN9OzG6H9Ad/KSYNwnExeQGT3qiT4O2bXLg==@vger.kernel.org
X-Gm-Message-State: AFuF++mrmBvKCnJy9tfKL+3WhwBUur4zqkuuwJbVhCsPPWCKgf59y3NW
	IyA+Ze3gP+XeCrY+TrOiggcomrEfEO8hTOpFc0s3jgvzBLPknsXr6bwMg8IxwpWtZVE=
X-Gm-Gg: AYBFou0QJsYb+51xJ3pQuT7MAhzS3KTr9FaUsUJ3zqUXyzcia7/hJFhlg3A25v5na1A
	DuezNvYtX5qiS7RDlOXpCI3OQB4ZwmvH9Imd4Kk+Bhju1WCjfXWj4f8VEx9DMa+81V8P30Y/Ctq
	+1t6joBX631F4MFpHfLHr4T1UZsn9LsRJB2QDOS1DioJIXPT6jjT2V/GmlNA7zFkpjkRpSHTZdd
	LI64R01MNcTpIxjY2shRFl8sgX7meUwcQ4bvpRLTQpD/DrJ0aU9TOsLkOzf40fOkd7SD0N6+PVI
	cQ2du2X8p0sUWqd+NqWHAWuNXCepdabuPVQvv614chcDCX/Yy58D52ieIHaNQ8yC2Fx2RCDMG9i
	wJeX/K5gpgPIzeH5E88ZuhgQLQk26UqZe84fXPo/BQYD9ffFaDdYP1WALOyPkdiA7UKWBl94sFc
	ui1p2MXVQ78U+0K0p8XO1WZhev9K03uSXfPkXwdqJnkuYNkKFs2lmK6giYP2Z75YUd0fF17D+ZS
	YWWJX3Na5Of6PKMMA/w5awojTGhCExFNeGq
X-Received: by 2002:a05:6122:4b14:b0:5c9:a617:5811 with SMTP id 71dfb90a1353d-5c9b8b57f3amr294333e0c.14.1789717606781;
        Fri, 18 Sep 2026 00:46:46 -0700 (PDT)
Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com. [74.125.227.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9b84c80a8sm830310e0c.18.2026.09.18.00.46.46
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 00:46:46 -0700 (PDT)
Received: by mail-vs2-f41.google.com with SMTP id 71dfb90a1353d-5c67e5059fbso122416e0c.3
        for <arm-scmi@vger.kernel.org>; Fri, 18 Sep 2026 00:46:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx6HMG7upxcG2PuxzgBQz3a3w1CQ/CNtVQf8neRN0dqcJYiBDB1iAOzxUStdoyqN1UIyZ95FL4qWQ==@vger.kernel.org
X-Received: by 2002:a05:6102:358d:b0:79f:e8ce:27f2 with SMTP id
 ada2fe7eead31-7a55af2df71mr547985137.4.1789717606396; Fri, 18 Sep 2026
 00:46:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788338320.git.geert+renesas@glider.be> <1d5c56c80291e447208ac8777aaf90ad6f0a4f4d.1788338320.git.geert+renesas@glider.be>
 <20260917221647.GA4038349-robh@kernel.org>
In-Reply-To: <20260917221647.GA4038349-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 18 Sep 2026 09:46:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXCFY7-SEGLjhaO1uCDwsvogc0ocdqSz=1C_gsWX6T_tA@mail.gmail.com>
X-Gm-Features: AcwNN1XFZho-l6FTtqXfFYSmbjO5DpuymjytNtvp4sOSdCdr5EidSrnlACqjwyk
Message-ID: <CAMuHMdXCFY7-SEGLjhaO1uCDwsvogc0ocdqSz=1C_gsWX6T_tA@mail.gmail.com>
Subject: Re: [PATCH v3 04/12] of: property: fw_devlink: Add support for renesas,scmi-firmware
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Saravana Kannan <saravanak@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Fri, 18 Sept 2026 at 00:16, Rob Herring <robh@kernel.org> wrote:
> On Wed, Sep 02, 2026 at 01:29:20PM +0200, Geert Uytterhoeven wrote:
> > Let fw_devlink create device links between consumers and suppliers of
> > SCMI firmware on Renesas platforms, and enforce these dependencies.
> >
> > This prevents probing of drivers before the firmware they depend on
> > becomes available, thus avoiding unneeded probe deferrals.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v3:
> >   - s/firmware/renesas,scmi-firmware/,

> > +++ b/drivers/of/property.c
> > @@ -1417,6 +1417,7 @@ DEFINE_SIMPLE_PROP(power_supplies, "power-supplies", NULL)
> >  DEFINE_SIMPLE_PROP(mmc_pwrseq, "mmc-pwrseq", NULL)
> >  DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
> >  DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
> > +DEFINE_SIMPLE_PROP(renesas_scmi_firmware, "renesas,scmi-firmware", NULL)
> >
> >  static struct device_node *parse_pinctrl_n(struct device_node *np,
> >                                          const char *prop_name, int index)
> > @@ -1574,6 +1575,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
> >       { .parse_prop = parse_regulators, },
> >       { .parse_prop = parse_gpio, },
> >       { .parse_prop = parse_gpios, },
> > +     { .parse_prop = parse_renesas_scmi_firmware, },
>
> This is going to be a catch-22, we can't have vendor specific properties
> here. If we need this, we need to come up with a distributed way to
> declare them. Linker section tricks is one way. Maybe something in the
> driver struct would work?

Quoting myself:
"I still think the vendor prefix should be dropped, or replaced by "arm".

> Can you just avoid a property altogether? Why can't you check for the
> presence of SCMI at runtime?

A system can have multiple SCMI providers, so
of_find_compatible_node(..., "arm,scmi") is not sufficient to find
the right one.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
