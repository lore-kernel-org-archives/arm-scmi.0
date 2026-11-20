Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795161417;
	b=cXWTyVeGlUpahny2e+W7BZnRjqXUouLyWd18CrtRPI1ETHOJ6EIQorrk7R51CSYJUrhi
	 OSNv+FxE0dPP5dKC+bOPMpqOLScZzwEICMXD+iuINIQCVmgqY1ZrvtmIeYS7yUZV6PrqC
	 5KbLr2InHhgPGb0X6OGOYn56mJyb5kHwKP049jSAN7VvEmISB+WAFEKSTXiAwqVJH1D9T
	 0T4VxjR8mW2fKooCv8T+Sby095A5tSeJ3vEVFPr3SRpoAjpb+bFSwBBsbN0sPju/SUTp9
	 7P4N4AljMukZW6I7WI8l5QjaEvQr4eWjx4xWt4UmNDTfAshSrgkFh993e6whgJAVh9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795161417;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=VaLwNIkn55D7JevqcpHCVmOWA4zFnE98rOcR5xGlqds=;
	b=qLYZI2iCkdBGYNh9XRouX1/jqOYXdx5ut8u7KYImNVXI2TrDxLqI9Rv2MwWAPfF801i0
	 8MPvOdsXNL/8f8q9BHY4mTaTr86Dxnj6aa8DjZ7lAJHUcYTI9VP1seiy+J0nsEjgzWhJ+
	 0773/J45sJrCFLFKiPh6NYLGEcSwiWHfm8GUocFnZ2zQnnIk4p1zuuyrWGgTnlyc658VO
	 fFLRi9k2yY2HLzJM5Su3Yj4F/TaeRDgCTBa4yu4921whNYOEQWVqRHePk1NJKxWU5ng1y
	 E9J7u5FvXykqgCvgRbVHQL6ZI78rORKOvtSr0in3W/6ybqblSJ9VxZ052gjPJ3YjJLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6711D606A326
	for <arm-scmi@vger.kernel.org>; Fri, 20 Nov 2026 07:56:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6711D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7d2bf046d7fso337278137.3
        for <arm-scmi@vger.kernel.org>; Thu, 19 Nov 2026 23:56:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795161416; x=1795766216;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VaLwNIkn55D7JevqcpHCVmOWA4zFnE98rOcR5xGlqds=;
        b=KQAuM6nMnAxsjg62rRmQLfrXj6CLI02edMgDO0ingx7CasHaT4P2kGiXmwdojRQ0IF
         Z6vuXJvsWxdbmWFgJ4f6hKVnHMo3dXVoeZ95gPUbw0XcwbOJxbK1uEtjSGWP6P5NWfyp
         a+A25d1dNppe/dBhszdSUFAY7iL+EOICfB69z+D3rIcbpdKfepYx+1tT3Vlt0tafkKo9
         6DSU1OoUJiTrffy3TjZwfp3T1ce7nw3eOG4z5i6zs66RFXgQBgJ/AFsyRI5AsxtenELF
         Eenqg+tQFBg3xC/e+gHZ9ietV7RM3uG7FCryF2MSQLEbUgtKgez0oEuEjuimdnOoCtYK
         6UGg==
X-Forwarded-Encrypted: i=1; AL+hErGIKnv28C4loX6TuoIknMzfd64kDpZcr5jcPDxtSwg+f+WWI707mY9gtmDJz5hlSEO2Xg8dyAFObQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8/womin+7e7sujcxRzhhQG3xeAhMuoCo1oyS1qWy7vHtZT/iWE
	sAbRpWsLqcvvufHuDGFwcr3MR02Er676ox84dy2j0fPQmg2qmLrRuzC0EFxILpfb
X-Gm-Gg: AZFdTZerI6dYRQuAdwfKqLDgTD4Su+Sx25KwCGQFSkZnwQaS9n+GicEWRY1zMXwCG53
	J4ueM5BVt2vG5FfSC6pJKgvtSm4FP80Y8hDRo9tsCpqU8WG+S86JsYm4bB5Wb7KUBrzQdBrY7Ft
	HT5xv7JDW529tdaP1845rH0Oz+MrvXPJDVN0FG1TrCEAPiBsDFZh+RFZyrnwp4IcKVeiCN9Kp/1
	1cx4JUWv+CIjY8LAvaE38vcZKjswH2UndcIt+qIZqQ4Kt3SEHMVfJVwEqpOO80v0cbe4dkKS5kF
	H8yGh0xTIEIzEmfaXo4bZ/N+omYxbKlfNM7IT4GPNeHWB0DEJoeR07LxjeHx9lMKMR6aLVRMceY
	cJYT3Xh8Wq3pGnR45QIKRnxCwoJXQ/y5v8ZaL7nfcb6M8yqx6i4bL1Dv8e7fmXzOu6qE4YaU81S
	KgL5bCHQ7GHQm+ce50LPCtRWYAHrjA0uXpDocfYDKY4XJHltqvLf0MN+exUsUjJqU2fY6lzT+RZ
	n5Mh8AMwmzrPaQREuqVZYXiHDzpRQQEAyXYV9AZRWJIR3JqpE77AvCBvHDWs1FAtqX3nMG8vALO
	cFsvkne/l13AG6YRQiQDQN6JYBtw0J4a6FOlXFivZWhah4wfG27GQe7fioGdRAQjnSU=
X-Received: by 2002:a05:6102:1492:b0:7d2:c786:5a98 with SMTP id ada2fe7eead31-7d73937cdb9mr922843137.8.1795161416276;
        Thu, 19 Nov 2026 23:56:56 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e822a085sm2180535137.10.2026.11.19.23.56.55
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 23:56:55 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9950a7530d9so355972241.2
        for <arm-scmi@vger.kernel.org>; Thu, 19 Nov 2026 23:56:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHrn6lHGwSeBGOU0UvixB0+Nq7nhmBa37QZaOFUDo4YqILx9Cw1cVFMvpiOyRmhvaKmLzyVXv5Sdg==@vger.kernel.org
X-Received: by 2002:a05:6102:448b:b0:7cc:26a8:e726 with SMTP id
 ada2fe7eead31-7d739567d98mr1003780137.26.1795161415051; Thu, 19 Nov 2026
 23:56:55 -0800 (PST)
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795029012.git.geert+renesas@glider.be> <cee843b319c9eceba2339f14a134e305a2b05d7e.1795029012.git.geert+renesas@glider.be>
 <57d2cc58-15ac-434e-ab40-7a8a54d93a1f@mailbox.org>
In-Reply-To: <57d2cc58-15ac-434e-ab40-7a8a54d93a1f@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 08:56:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXXS4ZTxLBrZoNycHUzdUp9QsisfA7CcBPyAGw7zTuSoA@mail.gmail.com>
X-Gm-Features: Aa3M54pzvZjiNE5ltwUGvGnHop8D2bVYiqyWJcr5J_J0ppW6-NxZAErFEYs73QQ
Message-ID: <CAMuHMdXXS4ZTxLBrZoNycHUzdUp9QsisfA7CcBPyAGw7zTuSoA@mail.gmail.com>
Subject: Re: [PATCH v5 01/15] clk: renesas: r8a78000: Merge debug prints in r8a78000_clk_get()
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Paul Elder <paul.elder+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Fri, 20 Nov 2026 at 06:28, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 11/18/26 8:44 PM, Geert Uytterhoeven wrote:
> > The two debug prints in r8a78000_clk_get() are very similar.
> > Merge them into a single debug print.
> >
> > While at it, unwrap the (wrongly-indented) continuation of the
> > r8a78000_clk_get() function header, as it fits on a single line.
>
> It might be worth mentioning, that this now also uses
> clk_hw_get_name(hw) instead of map->fw_id .

clk_hw_get_name(hw) was printed before; fw_id will still be printed
in get_hws() after PATCH 04/15.

>
> [...]
>
> > -     dev_dbg(dev, "Mapping DT clock %u to fixed clock %u\n", id, map->fw_id);
> > -
> >       hw = priv->fixed_hws[map->fw_id];
> >
> > -     dev_dbg(dev, "clock %u is %s at %lu Hz\n", id, clk_hw_get_name(hw),
> > -             clk_hw_get_rate(hw));
> > +     dev_dbg(dev, "Mapping DT clock %u to %s at %lu Hz\n", id,
> > +             clk_hw_get_name(hw), clk_hw_get_rate(hw));
> [...]


Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
