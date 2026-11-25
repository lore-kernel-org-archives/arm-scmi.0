Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618793;
	b=cR01kYc/sVLZ/ZoXTWdMbq53uwSChwBaV1pkoN7svP2R6WT2p+0itocGaAOiqo/4BYni
	 C4ByiKNnxd+x7oWUvZFKvQnL9PLOTw+JJ/hNQSpw/uoYL4vpmjEfW2VGbXheeOPXSVqbM
	 FEWR4gb2d4XSgPGJbb0ZdWzX8cUylDzkzttgcyU6wtugrUtV3xz0KiKE8sczO9Bg5z4sn
	 afA7XnQklDOOI/a1rtGc9IDHOmUsDrz4biAqgRRrhXE3YMmXyYYBl59nC7uHLBmapjM45
	 UB3wDuYXDIo6rQXnbfh0OJpDupsjKuSs4GjDBXtuveGGlkkobqA3eUGnjRha0nSgyIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618793;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hlkk4xXsXyEvb1D9H1K80LoXoGwa5zP1sGDEDxlcUog=;
	b=CPgFIeQvhIOjJeH/CExGz0ufJryqGFp9UtUmx3f+wFKAZfip8dpqQPxJSFtuVShiiQqa
	 mmXxOIrPmkxgudOtXSXrP5xzlN1+otLHmdpnwpivb0sSf+/IydiCbfwt/CtCueFYcEaeU
	 flghvcmK/jh1alRU9WsY4olgZeS0Wi9f6Tja35xQ+7hGcDTBdQgqWowqUwbWSu4U1ZU5s
	 cK87aZKTkoFFktKUt6JVf/sKiDKE15yMOb8mxE+uDayZQXE4z+F56TgU3Iqp4xCwMQqcY
	 iv4jc4GZzVRq1xj2JKelgYcANf+O5rxjAtL6UqGF1Pc13lBwRkTBAu8M/MZJ50ehNUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E63606A33D
	for <arm-scmi@vger.kernel.org>; Wed, 25 Nov 2026 14:59:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34E63606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-55ade1de0b4so68375931cf.3
        for <arm-scmi@vger.kernel.org>; Wed, 25 Nov 2026 06:59:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618792; x=1796223592;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hlkk4xXsXyEvb1D9H1K80LoXoGwa5zP1sGDEDxlcUog=;
        b=tWUH0zIWLwO/Fcey72oGsrB/nOD1G1qZYAY54IlxDRyKctz93R5SYIQ5EIojopt0U8
         32MaKaVsq1kdy5DVJ14/NdyyQJCcvG2HYt8dTP15NaOjt6+Tlf2AqYEpb+4acy6UNloY
         2beJtI0VknGaTv5cyXDv5PeoxVwf28FbyVS2xR186S3IDkH3o+4zOOp0x2qwTFgAsDyG
         A8Fq+Fb3S0GfJZOSYbMg/6KQrM6CImNXxsN5NRv596Ai9VWoAzw9qmAJLkT/AWWESIyy
         +fzkidXwGvIfRAd741M5KXLiCa0Dk1I6emIvW60Kbvs+9LmuGDjIHv1XteQpQlM1DKAp
         1/OA==
X-Forwarded-Encrypted: i=1; AL+hErHmkbqmhg0dHTpsYWgxsyde55n5opLMfUdlac9eveCUa2mIFJowvdTAmhFJOg2wun5rLounULU96w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8FI/ilv4d01FMh3a749k1DIrsQDIOWQ1P9pCJLGfXMlRcHxyxu
	49TMIkQ1oAm5bD+Pm27MDAHK5vaNz4kndebPnWmsy/8/8buFDDsIai18Tt9f0U1K
X-Gm-Gg: AZFdTZd0L5/a/b3JQAsGz3kQKqHwrgpyvX1KdeTJEjpi0249Qzf7v2Pfq6G9WRPZ1K3
	S41V6qYnwEMzCbYELzs82603mLAeFnjuxeSbRz+mySwVAGmCz/XGtXKYjrju9WfcS6F5LNS3ffJ
	CxABSQ3kVEfeeFXVwybIqwAv/A14EbKkVaTy44nMkXPnP/Uoy0WZqeWEesA0j17WJrdvgR8BPP/
	LemEduf3ZAl3s/9faSpsYubCXaZPo4u3+G5sGWmK2yT7eWywaPqN8NvCryZy3lzM3UT/rkz/Gfg
	LUDFjkDsIrHAQpnjQIBROenRu15F5KzCahm65J1h51Qdaxts6eptikJm//C0eErbEUFOea2Dw+X
	FhE9frX8qCjn4CUw105gfzYUQ0nhFr7X4S01tV0ceCUkpybx9ezflI/SgrKjPGOrl0L8eKYaQap
	zGdgYyHKuh08Xwy2LmUjantQHMpam7eDc0B2M3g/koM/FGnhFQWygODvD5RkQViORk+OG4QApUH
	YPPSasRP3MzF2cUSMKvV1s9/5JgFo64xRS07Hoo60z2az4D8HtzaR075TeLSmu8FwmP/7C2rADP
	rPle96lUJaKhQ4/+vGm+6S+PvRk1oMIvxYezHqWSoj17YM466K7YvK2uYuDvx7Eiuq9v8Zs=
X-Received: by 2002:a05:622a:2586:b0:536:5696:165e with SMTP id d75a77b69052e-55d7698ee3emr328321011cf.2.1795618792041;
        Wed, 25 Nov 2026 06:59:52 -0800 (PST)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com. [209.85.222.173])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213515f467sm162261116d6.41.2026.11.25.06.59.51
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:59:51 -0800 (PST)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-943e8d35f74so582843485a.0
        for <arm-scmi@vger.kernel.org>; Wed, 25 Nov 2026 06:59:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE3kqHc9b4TF6WjgHr+2Uw3bCVHsMs117gHcyFQ8+WPWW5XfTITwgV4KNXGYFfs+sxp4d16Apujmw==@vger.kernel.org
X-Received: by 2002:a05:6122:1784:b0:5dc:d0cb:7d74 with SMTP id
 71dfb90a1353d-5ee8adf3de4mr9944668e0c.2.1795618371669; Wed, 25 Nov 2026
 06:52:51 -0800 (PST)
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
 <20261119234759.GB2324725@killaraus.ideasonboard.com> <19c3745a-6308-46ff-bb37-3acc88fe22e2@baylibre.com>
 <awAqqg6F2Z1t55x2@ninjato> <d94ad9ca-afdd-4301-a69c-0bbad5b334fa@baylibre.com>
In-Reply-To: <d94ad9ca-afdd-4301-a69c-0bbad5b334fa@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Nov 2026 15:52:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX71k95powpC9qNiKdN=wRCYyYbvOT=EYmExE_2W8u3GQ@mail.gmail.com>
X-Gm-Features: Aa3M54re5ZNPOW-XITDy6yDteWVZ0ZL2EVGMi9yHMlXJRb9PY-Nvu_jZHjCd6J4
Message-ID: <CAMuHMdX71k95powpC9qNiKdN=wRCYyYbvOT=EYmExE_2W8u3GQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] R-Car X5H Ironhide CPG/MDLC SCMI remapping support
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Paul Elder <paul.elder+renesas@ideasonboard.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cl=C3=A9ment,

On Fri, 20 Nov 2026 at 15:33, Cl=C3=A9ment Le Goffic <clegoffic@baylibre.co=
m> wrote:
> On 11/20/26 12:10 PM, Wolfram Sang wrote:
> > Yes, this means the driver is then tied to a specific firmware version
> > because it only has this mapping. Not nice for a user. But we didn't se=
e
> > another way moving things forward for now.
>
> I think the DT is that other way.
> With the SCMI ids in DT, only the DT is tied to a firmware version, not t=
he drivers.

This only focuses on the IDs, not on different abstractions offered by
SCMI.

The latter leads to the need for changes in (many) DT bindings and
drivers, to support the same hardware blocks that are already supported
without SCMI in the same and/or older SoCs.  How many different DT
binding variants, with corresponding more complex handling in drivers,
are you willing to support for the same hardware block?
The remapping driver takes care of this in a single place, avoiding DT
binding and driver changes all over the tree.

> If a release that changes ids is already out, it needs a new DT, or a qui=
rk for that one release when the DT cannot be updated.
>
> The hardware stays described

SCMI IDs are not hardware description.

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
