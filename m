Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C334C8FFB
	for <arm-scmi@vger.kernel.org>; Sun, 18 Oct 2026 13:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792331524; cv=none; b=J+6C/WShqny+ovkb08TtIcRZeH+xuta1ys7S8QQyLDpfbSVXGZwJqDF2vYd+xOynxeClUstxBEkyN6gQOekBG9tA4dGNwa5Y/Q6bEKgWqVowm8AIscRsZjSUYwfTWScA85mPUlruUKt/bF2nUM753FcQMDqay/4IWYKwqb0Bvho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792331524; c=relaxed/simple;
	bh=rCFulCS196Fw/DBDyF9OMjFHIxiu7hy/WMzgUHoLoLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YhbVjv5NplMN1izrxe3fUvtkewKYo/mQAFKuUaCxdvApbnJAsYut30RYslYn+2KNBz2yKSPtPBeuW7RMZjNojhZ5aqQ7QUgM4c9oRKo3UmuTcXOSKb5i+XqWshbwyhGyIoOsQNKU2+JGXnwjkIBYt7TeoD0xTKH4lXsYNHgBkmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-99061e2171cso382013241.2
        for <arm-scmi@vger.kernel.org>; Sun, 18 Oct 2026 06:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792331520; x=1792936320;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fhGyumamsbJwvfAtfGydBWyfBrT9VHxtfq0yzwmUVgA=;
        b=2CjmHDI9PXx4840AfMbNfDDpLEEjIUccCT9/uNaw5Vj4MROpPNdlIqi3fhMXy8iV4w
         sFSnD+mYCNWeJ2GWSGvzlMstjLCdaAjW7wBEHNeUU8377u3NHiT+A16fUe2pAh5zBmNs
         z7J7pegs7BGeVjkYW0l766s1CYkJ90AU/SSfEhRxcyMPFVKuaCAhJL0FPQ0yjKZrzSDj
         gOgHzbrQTu+wQUZ0k4Sn7q7tmvVfTvRCxHAn4cz874Z/unK4B0d7hxLRKDsml3vnRcEU
         0lXiPeoQDpURiF3WsXKUqGHqd9B1W5xgwfSjb5j3/adWgppwOzU6nMYIJ+Xb545PV8sh
         n/ug==
X-Forwarded-Encrypted: i=1; AKwUvBzbY+ZHZHW7PKID5Mj5QAYjlDDJWAWU1iBoMxfG94Ye5FkfdWhkhk/2u9OmrLqIjCYx0gYA/nhDvw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJXiQM1VyxgVnUfBlVYbMtkCASKhhs2lrqodaA0WmQpBsHTAXgN
	Pl3hSPj59LWfrYhOpbagBNf5RY4IW8U2wyDHqvJ940kTWr2cFLbZxeFmnzWxLo1T
X-Gm-Gg: AYBFou39hKiDoxnzYvX5WZ2mOwSkMiNej2dgDQKtrKQqeOIFV7+49KmARjPtyA59NzV
	meU0K/oAg2bP7XrDNWVUJPw74kvOSyI9b0jTkyzLBYI1Pc0XMawVeDQeqoZf8E70lRjL7+ecyii
	nea9SAvPuZdsjwX8rQL7nJRauDD6HxOjw3WiHhp9PiVvuQpjpvJFPK4ptXiPtjQErR/VIo4vDKE
	4keTjPOnqmqqcItcW/UJ21O2aYHepGtxvZ7ZwmeNyaTso9hhPdffcTa5gUfmdiPAlmqfatbxYsP
	Nl2FZtENd2iZ5+FDDtZFO1hXiP+vtt1cNj3/H4CVsjReJlgu/DFWRNobJMdNaR0F6ItVT1o3bnp
	qwNDd7yiRtkeIc4/mzl3oOpO6XPstzFqnP9gWGsCuCWMhXJ+QIkpdHNZ1jiopCk8Bn6CAzTfLdS
	WBOQX4dafT5BUl0IRJoeuxlabFrSa9BARMUnC5BqKpnfgFDDvN3rvVIK6QJ07ajhQvQ+jzIPX/O
	cvRGToCzN/a3jVEADmzmKLqdD9azsJKQUpHFIi6ZBzcz9I=
X-Received: by 2002:a05:6102:549e:b0:7c1:bc57:c7f5 with SMTP id ada2fe7eead31-7cc369817aamr1371761137.12.1792331520062;
        Sun, 18 Oct 2026 06:52:00 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990835c253csm6522103241.5.2026.10.18.06.51.58
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 06:51:58 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7907f01e487so119974137.2
        for <arm-scmi@vger.kernel.org>; Sun, 18 Oct 2026 06:51:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzRqTxBgXE7FllKcZnvfG1W53wvD4/MXhKe5AtvIzodG73i8bF2IkDVor8qFQVY3v+5IitRIBVAvQ==@vger.kernel.org
X-Received: by 2002:a05:6102:5249:b0:7cc:2a3c:9a33 with SMTP id
 ada2fe7eead31-7cc36b49079mr1291606137.34.1792331517781; Sun, 18 Oct 2026
 06:51:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <1d7da50cfb58232c6dd4c4afefb938fd7e62fdcd.1792163045.git.geert+renesas@glider.be>
 <51d8ba05-76e5-45ab-91da-3c6cb02505d7@mailbox.org>
In-Reply-To: <51d8ba05-76e5-45ab-91da-3c6cb02505d7@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 18 Oct 2026 15:51:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVzX8fd4NDQi8ow0m+48g8p-LBHMysFi+fOqp1oDtT8LQ@mail.gmail.com>
X-Gm-Features: AclHuK8HjL2MgNJEhgQ8UPYzZV_qfVLea-QA-Rw_khapKdsDEf1HaCakMPT5y5o
Message-ID: <CAMuHMdVzX8fd4NDQi8ow0m+48g8p-LBHMysFi+fOqp1oDtT8LQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] clk: renesas: r8a78000: Add clk_hw to clk_map
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
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sat, 17 Oct 2026 at 19:34, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 10/16/26 5:55 PM, Geert Uytterhoeven wrote:
>
> [...]
>
> >   static int r8a78000_cpg_probe(struct platform_device *pdev)
> >   {
> >       struct device *dev = &pdev->dev;
> >       struct r8a78000_cpg_priv *priv;
> > -     const struct clk_map *map;
> > -     int ret;
> > +     const struct clk_map_in *map;
>
> Super-nitpick, use reverse xmas tree ordering here if there will be V5.

I believe that's already the case. What am I missing?

>
> >       map = of_device_get_match_data(dev);
> >       if (!map)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
