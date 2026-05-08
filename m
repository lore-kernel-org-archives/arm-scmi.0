Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3278337CD52
	for <arm-scmi@vger.kernel.org>; Fri,  8 May 2026 07:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778226899; cv=none; b=aPwHRtEChZLCIL3FmBFZ3hQSj1HjIoq8PMo+x5weZ3UyA8Ccyt9EsfcBJ3k/cnJR6wUBrNB1YWx+ciR1xx2Z1zh5TFWIJnDF/qR9TZbP3hTUj2DB8IlYUf93+iedmvO420HOHpXaKsNuSrDfvLJClMBAKwdbOy6A88njRgjoaZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778226899; c=relaxed/simple;
	bh=pk3moMq1FKy0fl1HwB0CJkZy44+CQqnu0oNoBum5fLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IRHDMHQVbnvf8AdW6O89F0qrkfvhiNUiIkE+k7u9DtfNY1Hq0D1k/I7QLRPtVIEFqkpmUWDdzKdSAypQQmxyIVQrdH5i/y7c2IoL/CCX/MGFM+bpgcKErCjwkuDgQxlrjC3tQHErVigARW47k8N+sqhBkbEa56apQaR7mKM58/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-365eecc5885so1612924a91.0
        for <arm-scmi@vger.kernel.org>; Fri, 08 May 2026 00:54:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778226897; x=1778831697;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7FZfZV6lWdmpc+MfoLFhi38NvgPEcuF56xNXrAqxNBA=;
        b=fYx2XhTnM+XGmM+vvtu+vfsb67c89RqqxPBR0/hX+UTYMV3eH2GeDWf2vzpN1kdXUE
         0fseNkDe+LzCSVFY7Wj8v51ap677CKbnWm8Fqg2kz34uroB733U9b+6e7hn4cXC4g1Rd
         mWBpmr2v9sVE05R2fWu6MRV18s+tTcn1pa3DKKcWQClpKWNtlja1LqjHXUnS53gkJJ7d
         QXWSMTixMPqwKPfGuM0OldK5sPh2E6+N3yLge0GJKdEtZ0bF3Xp7mlt209UYkVuv/UtS
         eEF6QB0krMJAd18niBqxtocU2P2SjkHGMZJy68Z5he2X9vAIY8hjLUPs1FfLUvsbJxpu
         gsQA==
X-Forwarded-Encrypted: i=1; AFNElJ+X61BhYVKzfXD1X3uKzVLe22x45u8a+667iAy3GVv7Nma1ZhakMT7AltFXdUxzujeDIIuf6TWsog==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgnWE9ZofxhPfsbQDxw4MeZLPQgdhhtRkGs6Ttb7AC4bKkyxhi
	fD+6yeANL4zh/IIFeydgWijt+rLcwDXeLeUyODOQR9hPug7qIczCCzN+SX2UoOXKD5Y=
X-Gm-Gg: Acq92OHbPU/OAJq50cJZ9fwumtRUfgrNznIkezaCP8gbPXLsoUuL0mUkHQLoAt80wQq
	pExvvBW4XFWE6ZQYNFx0DjhXZQgt+MgalQjWyQhsV1cKCZc5jYummWUbADYKkjm/edS2bD9WzJD
	+BjWSzBOHNEo5WUSn4ebTGlVa3n2uG+VzId88YOzR8FOrqJH7H7LsdEKHqRbrxDNCQj51PABhXc
	9l7X0PwStFLDxp+A9FJAQOHIyH6fQbFQJEHY3WbzpfuiNnKITELUAp4TAW9VsW1Hy+AmjcLVHI9
	Uujq+gBrVX6d6QuDdJuZwoVbKZTaKBnNsuNFzS1hZ38aWzib51y6coufPJKXCC+OAFC75vHYZDj
	FPXj9R9TBxWuNWCkTihhT1DJ8Irj0quQ6ZIgWauoLoYHpJTJaEc7imlYw/Rmq2+hqBwVNec4ydi
	YwN1st6wdY0c3dCwMBU4A5eVNj/IJZtrfrFo9MzHQiarXvzoDHhD+ZM2k0hWa/VwiTEBmPYVB9g
	4w=
X-Received: by 2002:a17:90a:d88d:b0:359:8de8:1229 with SMTP id 98e67ed59e1d1-365ac670f45mr12613838a91.21.1778226897380;
        Fri, 08 May 2026 00:54:57 -0700 (PDT)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com. [209.85.215.175])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3664db38592sm1758796a91.13.2026.05.08.00.54.56
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 00:54:57 -0700 (PDT)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c8173b2af32so1213240a12.0
        for <arm-scmi@vger.kernel.org>; Fri, 08 May 2026 00:54:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9IdIuon2f8+nvYXCyM0vPvSwfR+IL1MiA5A6NsTMT+0u1N/ifKiv0J8/lGJD1nfc1Ow/HnXfMY1g==@vger.kernel.org
X-Received: by 2002:a05:6102:8499:10b0:631:28c1:155c with SMTP id
 ada2fe7eead31-63128c11e98mr2184841137.7.1778226445710; Fri, 08 May 2026
 00:47:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <053c312d07445517d8f9c84bfe3cc8fb72d4cd9a.1776793163.git.geert+renesas@glider.be>
 <39879eae-39dd-4b4d-9469-d238cd7d120a@mailbox.org>
In-Reply-To: <39879eae-39dd-4b4d-9469-d238cd7d120a@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 May 2026 09:47:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVumfXkBtxzVBY27SRngHG2eOoWP+cgbkWQDNDkAW1mOg@mail.gmail.com>
X-Gm-Features: AVHnY4Jrjqq6M3ZL6uO54VIlKGFRT3YU3BSC7jZzhSUGnVnDGxRcagGSeBzeNKo
Message-ID: <CAMuHMdVumfXkBtxzVBY27SRngHG2eOoWP+cgbkWQDNDkAW1mOg@mail.gmail.com>
Subject: Re: [PATCH/RFC 10/14] dt-bindings: power: Document Renesas R-Car X5H
 Module Controller
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Thu, 7 May 2026 at 23:53, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 4/21/26 8:11 PM, Geert Uytterhoeven wrote:
> > +  '#power-domain-cells':
> > +    description: |
> > +      - The first power domain specifier cell must be either the Module
> > +        Power Domain Gating (MPDG) register index (0x00-0x3f) from the
> > +        datasheet, or a Power Domain number, as defined in
> > +        <dt-bindings/power/renesas,r8a78000-mdlc.h>,
> > +      - The second power domain specifier cell must be the module number
> > +        (0x00-0xff), composed of the Module System Reset (MSRES) register index
> > +        in the high nibble, and the Module Reset Destination bitfield index in
> > +        the low nibble.
> > +    const: 2
> > +
> > +  '#reset-cells':
> > +    description:
> > +      The single reset specifier cell must be the module number (0x00-0xff).
> > +    const: 1
> Just one more question -- the power-domain-cells second cell and
> reset-cells are always going to be identical values, correct ? If so, it

Yes they are.

> would be nice to keep the description: aligned, and maybe even indicate
> in the description that those two values have to be the same.

I thought that was obvious (but apparently it is not)? The descriptions
are identical, except for the latter not explaining again what a module
number is composed of...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
