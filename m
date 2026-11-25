Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618323;
	b=Hyvhhuw39823/9QBI0OHrixcApKtLnwAEP30UUkrfMAQbh5hlca4a8CzHBHCJ5Gte06/
	 XUkmqAFq8+MPpCEhm6FAiYASrfW02pjzKlMXrioYaXbDNiRQbMTwoLYVaQqSgbd10xVZH
	 Vt0DEg1GtQnJ+seZwXeJfdr7u3yqrQiRvvj/aOWk8UXA4zsAAxvtvi/pdMBO9NnNn+/8o
	 uzNy+1YtXGKxWmAoE+86KotHGCkk5lwzpDQqIUKHm+2LfpAUIeOSWO2J9zqbWpRqRNB6h
	 ubcLzL7wHt1/LqoNIeIRCgWwTZJsDXIpQHVt07TiMd0U86J4QKjbpjCI57HYmiAhhhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618323;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qhCwXvAyXM1RHsJVCIWLLXEAUGswl0Dh6+s1SkrTVk0=;
	b=RHG+PpnmvTMb/QoJnf7VDJ+yBtk8YDLo1M4kZL4961kspQWC/S+sYsSCAyVcWIE1v5Ts
	 hl37o+RAAWNiXKRDg4U0Cjfjq+Mcdti58NH8cPDwLeq5qW7wP4FYRITSTiE/oZgPMMInH
	 nl05e0Lp8hwhYb+4PWNRspSR2m/IHz6IK5PDNMBX86ONFjsxHsKNyyqvnJdN24wR90Try
	 oekqdpCf1eWUDD7HhqlyFzbQBOAPEHQNWCI55xKmRO4NzmXFKrqXP3w7J5SFLuMAlChfu
	 VIXLHgyyFtBmSCZj2iOeSBsxfiLnf9xP28mTQ8S7q1x0HnwrIKKAYZZTBx1v263uCqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0123606A321
	for <arm-scmi@vger.kernel.org>; Wed, 25 Nov 2026 14:52:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0123606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-53644b28706so93125431cf.3
        for <arm-scmi@vger.kernel.org>; Wed, 25 Nov 2026 06:52:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618322; x=1796223122;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qhCwXvAyXM1RHsJVCIWLLXEAUGswl0Dh6+s1SkrTVk0=;
        b=NVMVuYcmvBzt+SljMsg2OpzPn7qL9aLrQNOnA80yEfkhUaZ0GAkBGJsiRo1gnzX5lh
         61nl6hWMNQQE+0DLWz0kbqX3IYI5bzO3H8xYUG0eln1h6jX4IDKpGU17d3QbpD4WsLU/
         2afgb2OPq5Gn+K825s7BTpuCw5qAMtRqJsA5h7J8a0oWcK/U4Cc1OL1zQB18C5gJjGlc
         +vJLMqLUNSI2TSfhfJFQxznt5SyEOSFVL3rMxWG0PcNcPoRMuYekeEREZu8LaqQEosLB
         Hu0KH7Xg8lGq+ZyOTDt4Cj4+QzunuiRqYitYY8e0kk20Dlw5Vj9sRVFg9mL0V3JCFVvf
         tF0A==
X-Forwarded-Encrypted: i=1; AL+hErEQ7wHWlEuAjesA5H7a5rGoVCraBBZ6xdBqr1c5iDWTWMXrWSl8QyX/mLJ4IMSyU2E0QWNWCoAlhg==@vger.kernel.org
X-Gm-Message-State: APuU4Z94kGz8WmpmhjgIzQsuTr/TONojGAbmq2/TDttOlb8hOcubuDZp
	ajC0QyexmJmaDlFD3WEh2C0c5afpL8/4B5pw5AlGCn2SeCK1ksWO4JUniWlIRRvZ
X-Gm-Gg: AZFdTZcP3sLduIMcFUPSkBoVTJX/WB+vJRKHeNtufT37uMv3fXb2qpNdww9r4mmjjqa
	fL3inp/L+Co95alktleouqPNDpYOlYtw/WDKsL1LmHNbD9S2XKRFw/KSh9ZIphY1+ooOJBZyzSA
	hou3iRn/+YGmKbZzYNeOGyTstFb8g5b/FUOSTXDxwaVKrtON+eyORLcrX5VeQsAoa8oXGjXx2WY
	0K+jtbSfZ+djnZIRhYLWQXvf07mI5DdxkMVhPmdnCRFoywA/mU4Lh0nZ+ME9fs0pAz3N+NRY2G1
	rlA15egVgzUC7gS7MpK7e7ZLyamyPVSe9XvgnSs3a8o3cS02vxPDXzsmp3xUZcE8JaBkjKBQZLK
	2Z3JTBotKQ3eEhmTSBn6vD+snFNODlLSNvKTkE2vNs0F8NQSjSubv/e0QeBlO/VNIuKT+qdhHN+
	P8WUxGj+3w6nvmOhYDM/mW2dpKtqYvk/aRc5lgxfJZaM/pFamMW/FD+TC+zKZ5AtdDAq0WUpVAE
	iab7LEfwXn4e6cX0yM+d9/Zb5lY1U4e1HWafM76qcOHpJcIQpILm8Gk5SRnnziiH+B1xGAw/Sn7
	Q3wq6tykdGjg9ddb2I/o3p9BzqIaWBvcb66J6R54jq5rQwD4scpf2rIel/8DEWzsO2Y=
X-Received: by 2002:a05:622a:4c07:b0:55d:34d4:12fe with SMTP id d75a77b69052e-55d76a204acmr317032071cf.32.1795618321621;
        Wed, 25 Nov 2026 06:52:01 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7882ea2dsm157552051cf.15.2026.11.25.06.52.01
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:52:01 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7d2da166818so3506857137.0
        for <arm-scmi@vger.kernel.org>; Wed, 25 Nov 2026 06:52:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEdULkIMkxwAAXwA8VEw+ZghpODaEVTcup0yGnzC+oIPHsgHUY4nHQey6Ty46IOqsDXr5ev36VoVA==@vger.kernel.org
X-Received: by 2002:a05:6122:2192:b0:5ec:7589:f9e0 with SMTP id
 71dfb90a1353d-5ee8af4a3d9mr11210352e0c.11.1795617963345; Wed, 25 Nov 2026
 06:46:03 -0800 (PST)
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795029012.git.geert+renesas@glider.be> <1e9c5ac3-d82b-4af9-9946-0302cadf7404@baylibre.com>
In-Reply-To: <1e9c5ac3-d82b-4af9-9946-0302cadf7404@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Nov 2026 15:45:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX2BEAK27P0Da7Nei=DLaHgTdi=FiC5ZMhVegNuGwM5_Q@mail.gmail.com>
X-Gm-Features: Aa3M54o5mrxb1PGlHbFHaQn6zx-fZm6HZYf4SleH1VTd0nBeXxZvXoTTF6NrZag
Message-ID: <CAMuHMdX2BEAK27P0Da7Nei=DLaHgTdi=FiC5ZMhVegNuGwM5_Q@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] R-Car X5H Ironhide CPG/MDLC SCMI remapping support
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
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
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cl=C3=A9ment,

On Thu, 19 Nov 2026 at 15:47, Cl=C3=A9ment Le Goffic <clegoffic@baylibre.co=
m> wrote:
> On 11/18/26 8:44 PM, Geert Uytterhoeven wrote:
> > TL;DR:
> >
> >     Describe hardware in DT, and perform mapping to abstractions offere=
d
> >     by SCMI in Linux.
>
> A question on the approach
> An SCMI variant DT could mark the CPG and MDLC status =3D "reserved" and =
point the consumers at arm,scmi, while the U-Boot IPL keeps the hardware DT=
.

In theory, yes.

Status =3D "reserved" would work fine for a leaf device (e.g. a network
interface), without further dependencies.

For core components like the CPG and MDLC its different, as every single
module on the SoCs makes use of them.

> Since v4, the series assumes the SCMI ids are stable:
>
> >   - Remove dependencies by making assumptions and dropping disputed
> >     items, to move this series forward:
> >       - Assume all SCMI IDs are stable.
> If they are, why not using them in the DT directly?

Because:
  1. They are not stable!
     We only _assumed_ they are stable, so we could relax dependencies.
     With that assumption, there is no longer a need for the (contented)
     addition of scmi_get_base_info(), which would be needed to
     distinguish among different firmware using e.g. different ID
     spaces.
     FTR, without scmi_get_base_info() we're at the same playing field
     level as some other SoCs vendors that don't bump their version
     numbers at all when making incompatible changes ;-)

  2. That can't work for now, due to limitations/deficiencies of the
     current SCMI firmware specification and/or firmware implementation.

  3. Last but not least, they are not hardware description.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
