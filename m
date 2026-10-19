Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426555;
	b=nWv75fBdVP4l/pZb9/arWvxRuey7WmksJCKRYLPFsZH0ZbqeLr9YNagaslSTKUzGaWbV
	 iBTzayMKZjc+X5PXPaANFfAet/Xm/xzaAH4a2v3KmQGw9kq0jIJq+BaGAupuGdMZCSmCe
	 +Q/5bmo1nPhsS/20RCyVeAYC0ZgfOEAlUmklQyMHsQSX5SOPKmoPu0kUPGU0lQUCAIcyP
	 Sji/pW2KJJ4JFexcTFPRODeepFkg6KK2pxvmSoeLMIXklPwIyKZi2FusGhRqe1RPyyF+q
	 /mRunrmmOCA4tyidVV87HJeqW3URnSvZyGE2+z25NY/ZmkD9XZ48XQD7OKnCGLAfJ2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426555;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=VNVvlFmAYqdL7e0NbR8n4mhG40CW5PlDGJg9XCAnokY=;
	b=R6pvnvc7Hfz45co63xPDH1ovuUCGy55pZmKKquBuK7I2bWNpk+K60EzvONyGXUjP4HKC
	 2vBKFsQODKu3EYdJFRyFfmnoMqpVMJgIpqqKwNHeWhmzJR01jA9rprxpZcf4Btt2Fq1kO
	 Q1DHQOdKx5cYdZaiPn6mgWyy66eYyt37Yg/dBbAzk5igaKPCHu89XPzrO1F/BdR90DEoJ
	 GyBvVNP4QmMY8/za2ZuL8VS7vrVqVAoN3WmWpvmUpt328BlWJR56jCfV80khbwFLZifPN
	 zRsiSfW8EhDDh/X+uiPBuMgbso/DyVWYoBsv0o+gY6iSnSGSsN88VWIVlWdRYOs2yOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01A5606A31B
	for <arm-scmi@vger.kernel.org>; Mon, 19 Oct 2026 16:15:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F01A5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c40e30c26a4so458687866b.0
        for <arm-scmi@vger.kernel.org>; Mon, 19 Oct 2026 09:15:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426552; x=1793031352;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VNVvlFmAYqdL7e0NbR8n4mhG40CW5PlDGJg9XCAnokY=;
        b=T0CmWlwJGrqE9to8hoCfViIifL5d9QCZBZXF1zToYVYzTJQpV4nvmaha7QwNpNt9mI
         1xVgRpOPiEJK433nvV+RJfg7a9uURwsPV77HaGf68p32lj39pr0rOfVpz8Tm0jny/1jk
         qIpUIKNLLdAy6zbRm3ZUHpCkl4RORldKnQCEZNENyWlXm6oit/rQPxeX+M010lZjflGU
         qN3timCg4Zyj67lH2A5t+vYvQJo8zTutXJq50Ff0wRCcVrOdGeBPpyabqIy3AkGxj+BR
         X5BF8A5T4GPcFnIml+oAs8i0AKOB+aooQysX2Z0650juZZT//BZdOT7o2vZlbar4/slz
         dIqw==
X-Forwarded-Encrypted: i=1; AKwUvByQdB5zjPWz02UpuD4nMXxGkqt0FZ2nA7B1aVu2zbP0wqbCf83kpJFa8+TJ0Ac0FGQomOBEMuqaRg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKWqjzJYW9qOy4wbasM62Mlns63KjVk9tgT80SW8kDCWntPBl4/
	w7mCuTP67+48OUc8ww9ZhZ4Mxk0VtBarLuIN/fvsoqjHvz1WvOHfoAuU3bzJ/gtoJKA=
X-Gm-Gg: AYBFou3zMAWqigTMoW77BAjBsXiTnpWVoCEjE2XTOOIvQBnHeN2NnS4ysvQ8VEJsSvz
	IflPse3jj3FaHSVC9QRAUKsQA1OtAtCOMUBaVQOkPi+6+6raYD7NaTFEjsiAVzYDUjh/UBL1tjX
	7eTrRaoffaZeq8E+K/jVBmYcT4hI5DwCvUMmmU6iZNdLWsG1m0ZZqaAZ06VKfrNI2kmFWr94nAj
	Jow2QlI4Kq5m2kSJss2aNxlVFwJ/bDEkv3zRKkF57W8xFDykeb9HZ3xaMZSyvlCzE7/W1Ncrf6E
	hyQwxO/U7iA6FxAnMQohk9i5XX43HfLap8nvtrx/BfoOCOWZaxAspnS6n2NeRueOIGRuvlYIuS0
	yTgwlSgHXHQsTm052vCtGvF+HYduoDDH9Hzm3Jjk5F9E1VOjnnYpM4HihoVYRNamNX21I0TINno
	YiIUz6agNFTbUI4MRyjBXXJmTc4X7EttcIc/kCkIBECLlOYI21yylblW1TI87pYt00Mt5Cg2Zns
	BNAVVzUxnjEcpSQZokF39kMO3agk5S12BgLglJ1i9+OUAB73oyOQHgYscVuC7+wCAxTY+bKfl3H
	ErJ6lI07COH8FEk1BA==
X-Received: by 2002:a17:907:2d94:b0:c42:4557:452c with SMTP id a640c23a62f3a-c4245574af6mr452142266b.8.1792426552073;
        Mon, 19 Oct 2026 09:15:52 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c03bbsm364388466b.64.2026.10.19.09.15.50
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 09:15:50 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c169ae1cb26so542840566b.1
        for <arm-scmi@vger.kernel.org>; Mon, 19 Oct 2026 09:15:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxNCGQ30T/WwUdCklXym5b1k+rkR7S+f9ddH2sR5TZp4+GEXLrfkwGG28zZL7erZ4+aj6VUoJCcmA==@vger.kernel.org
X-Received: by 2002:a17:906:99c2:b0:c41:825d:ed8c with SMTP id
 a640c23a62f3a-c41825dfa20mr602336266b.26.1792426550419; Mon, 19 Oct 2026
 09:15:50 -0700 (PDT)
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <c38d744c09dffff550a9b882051c211b572b8daf.1792163045.git.geert+renesas@glider.be>
 <20261019155619.GB3705@killaraus.ideasonboard.com>
In-Reply-To: <20261019155619.GB3705@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 18:15:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXDgc+NMFQ2HgkngsvyhVd1+yEgnk3DQpyVmVUQ_aLvEA@mail.gmail.com>
X-Gm-Features: AclHuK_Wqb_TY8SIlHzico7Y9pGZs0pikimfidJslyUcM_WsFGAezgyxmzAMr2w
Message-ID: <CAMuHMdXDgc+NMFQ2HgkngsvyhVd1+yEgnk3DQpyVmVUQ_aLvEA@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] clk: renesas: r8a78000: Add SCMI remapping support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Mon, 19 Oct 2026 at 17:56, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Oct 16, 2026 at 05:55:41PM +0200, Geert Uytterhoeven wrote:
> > Extend the Clock Pulse Generator driver for R-Car X5H with SCMI support,
> > to remap DT clock IDs to abstractions (clocks) offered by the SCMI
> > firmware when running on a system with SCMI, and SCMI support is
> > enabled.  Take into account some peculiarities of the current SCMI
> > firmware implementations, and fall-back to fixed-rate clocks as
> > replacements for SCMI clocks that are not available.
> > Support for bus clocks used by serial, I2C, and SPI devices is included.
> >
> > This lets us avoid putting SCMI IDs in DT, and allows us to use the same
> > hardware description in SoC DTS for systems with and without SCMI
> > firmware.
> >
> > For now, it is assumed SCMI clock IDs are stable, and match SCP FW
> > SDKv4.31.0 and later.
> >
> > Suggested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/clk/renesas/r8a78000-cpg.c
> > +++ b/drivers/clk/renesas/r8a78000-cpg.c

> > @@ -94,6 +113,21 @@ static struct clk_hw *r8a78000_clk_get(struct of_phandle_args *spec,
> >       return hw;
> >  }
> >
> > +static struct device_node *scmi_find_proto(struct device_node *scmi, u32 proto)
>
> This is the kind of function name that looks prone to a namespace clash.
> I'd name it r8a78000_clk_scmi_find_proto().

I deliberately picked that name, as a suggestion for a future common
helper ;-)

> > @@ -145,7 +184,46 @@ static const struct clk_map *fill_clk_map(struct r8a78000_cpg_priv *priv,
> >                       break;
> >
> >               map[i].fw_id = map_in[i].fw_id;
> > -             map[i].hw = fixed_hws[map[i].fw_id];
> > +             if (map[i].fw_id >= FIXED_CLK_OFFSET) {
> > +                     enum fixed_clk idx = map[i].fw_id - FIXED_CLK_OFFSET;
> > +
> > +                     map[i].hw = fixed_hws[idx];
> > +                     continue;
> > +             }
> > +
> > +             scmi_spec.np = scmi_clk_np;
>
> This seems to be safe because a NULL scmi_clk_np implies usage of the
> default map, which only contains fixed clock offsets, but that makes the
> code a bit too fragile for my taste.

Fair enough, I can add a check for a non-zero scmi_clk_np...

>
> > +             scmi_spec.args_count = 1;
> > +             scmi_spec.args[0] = map[i].fw_id;
> > +
> > +             clk = of_clk_get_from_provider(&scmi_spec);

... but please note of_clk_get_from_provider() will return -ENOENT
in that case.

> > +             if (IS_ERR(clk))
> > +                     return dev_err_cast_probe(dev, clk,
> > +                             "Failed to get SCMI clock %u\n", map[i].fw_id);
> > +
> > +             hw = __clk_get_hw(clk);
> > +             if (!hw && fallback != map_in) {
>
> And if the above is correct, fallback should always be different from
> map_in when fw_id corresponds to an SCMI clock.

True.

> What issue does this catch ? Should the fw map contain a fixed clock
> entry for clocks not available in SCMI ?

Originally it had entries for fixed clocks, too, as the firmware
restricted access to several bus clocks.
Recent firmware provides access to more bus clocks than before, hence
I figured it would be better to use the SCMI clock when available,
and only use the fixed clock when the SCMI clock is not available.

> > +                     for (unsigned int j = 0; fallback[j].dt_id >= 0; j++) {
> > +                             if (fallback[j].dt_id == map_in[i].dt_id) {
> > +                                     enum fixed_clk idx = fallback[j].fw_id - FIXED_CLK_OFFSET;
> > +
> > +                                     map[i].hw = fixed_hws[idx];
> > +                                     break;
> > +                             }
> > +                     }
> > +                     if (map[i].hw)
> > +                             continue;
> > +             }
> > +
> > +             if (!hw) {
> > +                     /* CLOCK_ATTRIBUTES is not supported */
> > +                     dev_warn(dev, "SCMI clock %u is NULL\n", map[i].fw_id);
> > +                     continue;
> > +             }
> > +
> > +             dev_dbg(priv->dev, "SCMI clock %u is %s at %lu Hz\n",
> > +                     map[i].fw_id, clk_hw_get_name(hw), clk_hw_get_rate(hw));
> > +
> > +             map[i].hw = hw;
> >       }
> >
> >       devm_kfree(dev, fixed_hws);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
