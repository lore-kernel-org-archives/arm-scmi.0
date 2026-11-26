Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695323;
	b=Zqb+6aqBNsFOY9Ye8V0eTOvoy9cJK77Ui/+RDJCw+/jGyTfIRUeXyjwI2Z2oplucYhFx
	 6LwTqGZ8TMX19buShw9Do52Zj1b5YuoICfxGc2LLVTh3+IBMsLEg1oAn1edO2rRE3mTkg
	 O2EmTR1yowUJgMDTAgvNEsBzY+I9IB9746wojI3q4+893tgN4RWk+YZeVYhMYENAMC8+9
	 eC6nqlXBtYsfHu9UCc9sNdIsYU+7ZjOkN5iBZY6RPz6ccKtBJ0v9DAkNus0QP8uV4BRqc
	 ORuXuRbpAplWOOf7cwxdBBh8WzoTrXLu5q1bco18famlwEOHhh/f78orJaa/3eM7+YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=N7R2bspuSN2vTU9KXTd+Gs5ucj/LrOjxnprdX2nps1A=;
	b=akNuXQzK34121NU4Ivnafq8QxrSN9rn0l9ddhqordvCvyNtg52ckhEEsQ4NKgEIhAiM9
	 vk/3GUkpx+UH45+xzBv/23FFStbOPF1UiU7arTqBJkS++iFYx8rUsxYX0HKA2bkRDYlJR
	 Z5CaFdOR2CHlmZrYyS3ThiVyhPFsY15kTzFrFkk5b8c3VaHqX3hORtpCvi/46CBx7w2g9
	 7di2vTjRfVdRi4jrMbgjlPeb0jf7GCXU+tXGW8IvmfBCJKBHIud1rK4ap0OKtZGUymaLC
	 TXvCNQ9IxCfzJK/iNEd+Y4Z2mgHczPsisaMnlj/jc3ae19SUiqa4PYVO7/eUeF3YIGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=FwRjmudW;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D8D606A321
	for <arm-scmi@vger.kernel.org>; Thu, 26 Nov 2026 12:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7D8D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=FwRjmudW
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so70877525e9.3
        for <arm-scmi@vger.kernel.org>; Thu, 26 Nov 2026 04:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795695321; x=1796300121; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N7R2bspuSN2vTU9KXTd+Gs5ucj/LrOjxnprdX2nps1A=;
        b=FwRjmudWL65oLgTj/u0S7HQX4RFS3WnOCzEmmUj60oHwEXRK/tuKkJNusyKZlWK1M9
         Q3OWtaUEnyPQMKwdLfw/GSnHVTtxYsSTBID0lVsgQ+7Q7IR1flV5EeGHRZeXIv4a3g0u
         Qa23F7gHKt5tLT3NTo5Ox0mgBBDrx/nxvTvTh+tjKsv4tzk67N/YeWXxxPfyt6pWUUBg
         2Dfyjmgf30+RljnWLlu996rmkIJJykXjPdfyAG1Qt2Ml1kKCIByWel5t5wtqUFcyDadF
         30t/r9Humb2RC7ljW6BOWSF5sZaZnLBTgR0GHu82jg405d1/psWuDQyX3zYU4ZDWOxL9
         2czQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695321; x=1796300121;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N7R2bspuSN2vTU9KXTd+Gs5ucj/LrOjxnprdX2nps1A=;
        b=Fxgn4gkyaVwqxg0tMW2j2XmK5mrmoHlVi/VRA/yjYZlQUgJskgPe36/A5v8fFDexZM
         b+GwahYPQYO2Ub6x054FvCkyx4JiCS/GMXcLXw3tQSIiwP4hLm6nZazt6twmxccZQDaM
         AURx6eDsk2lpM2W/EuApDVl+JXv5PjMSpoa8np+/SPghirCQ8I895LqhqLhI3fx63Q7X
         V5tk9kFyFtk7o4p2Px7pHMgpAT/ujC+mY3zy802G+t/nBybdPXxdput6OdzBRjpX1WEJ
         WIogukhITRXuigdg+382xwT2qyz5KP1irUhy8EcCkcyYA1GA3QvU4kUR0DYw7miVUYlc
         qWTA==
X-Forwarded-Encrypted: i=1; AL+hErEQpz+bNSqPjhwqw/2ope56ZGoEsl+nHFTzVzw1b/Q+Mk1JOgNGM2/3bcWz2JC6Qaq51Oef5AVhoQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/l5FV4tWZTAzqVy8nOOm2k+lbvTeXQrkvFN90ra32NdlKESUkr
	1wEg5qYZApOg7H+ACScMDt41AUZndQS0QWFYG64O/Bhq1wdj4r9BIaH0chF0elhu6d0=
X-Gm-Gg: AZFdTZfDTh0TiNKezkeM3Ifmp3KVJzNgl4qKkl1eAK5dH4uIWvgLKACU/NuC784V4sS
	Mz7wCNPOevCtlT3lcmb8e3tXZXAnXWP3Hky463ZA3hxLR6Dcere3q+pFJfiq4aju/BmTN/tY4PP
	jVQ68eLQQwm9u9QGx12OksZrJ1WO3z3ZAC01bGnSbbwwMGHtoOG1HbDVzLEuFYJ6kSnJ4Q5bGuN
	Cnj78zc9nz1nJppSMy4iXRVFWpc8IW9NZs4yjNGpHHkMcbTJZq+Q7wj2XRaTh3boU6mHAAJWRys
	Y/F1yoyHVnDJgguuOjzhdj9Z1ndm8IFLx8g1peXkC1DITZeqNt7OIUoKC1ThfWFQsKHyb465AFa
	TemsJBURvKVl3VUf+BerSgI4YrAmCUzRJ7qvZE+XG1bsHUSm5CogNfJkBG3a0FghhcXuUTfw5Ai
	Ai1Q0dZROUWb7i46S+4PJglpcJ9IcSM96MJX25qMlt7z80/Ic5gFZmY+1UK5FICRS5ZRZQPelQc
	tHtaMxMxqrksqwXa3DjWA1tr3lFFonw0meO8GYMKszZjkdvUX2RVlJtUf0fs2hcFbZX/EsfhXjR
	ACQCHcISBfnDxtEOnWkCtLiaggyvhukMfRXeRHLXhK7R1ho6J/M+vyhY2dcfe4ujMWuB6GozSMZ
	mV+aCVfnBLR3pitRAiqILDHpqU/u9upG8N6D4SCrbsKMAQpkqXcfrJpIK80UB1y3piQ==
X-Received: by 2002:a05:600c:3b91:b0:4bb:7e4e:de53 with SMTP id 5b1f17b1804b1-4bb8881059bmr507224745e9.12.1795695320857;
        Thu, 26 Nov 2026 04:15:20 -0800 (PST)
Received: from ?IPV6:2a02:842a:9b20:d01:a06b:e180:2ea9:f6eb? (2a02-842a-9b20-0d01-a06b-e180-2ea9-f6eb.rev.sfr.net. [2a02:842a:9b20:d01:a06b:e180:2ea9:f6eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906c089dsm349451575e9.1.2026.11.26.04.15.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 04:15:20 -0800 (PST)
Message-ID: <bc5f0035-08ba-4813-9bda-9b2ba68f3680@baylibre.com>
Date: Thu, 26 Nov 2026 13:15:18 +0100
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/15] R-Car X5H Ironhide CPG/MDLC SCMI remapping
 support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Paul Elder <paul.elder+renesas@ideasonboard.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <cover.1795029012.git.geert+renesas@glider.be>
 <1e9c5ac3-d82b-4af9-9946-0302cadf7404@baylibre.com>
 <20261119234759.GB2324725@killaraus.ideasonboard.com>
 <19c3745a-6308-46ff-bb37-3acc88fe22e2@baylibre.com>
 <awAqqg6F2Z1t55x2@ninjato>
 <d94ad9ca-afdd-4301-a69c-0bbad5b334fa@baylibre.com>
 <20261123103633.GB2959742@killaraus.ideasonboard.com>
 <fc13a7a8-b825-400c-9ea0-ceb2670dc478@baylibre.com>
 <20261123160550.GA3050935@killaraus.ideasonboard.com>
 <27796cff-eef5-46ce-8079-93a0a8d40db5@baylibre.com>
 <20261125221502.GD3581@killaraus.ideasonboard.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Autocrypt: addr=clegoffic@baylibre.com; keydata=
 xjMEafx9bxYJKwYBBAHaRw8BAQdAtc85GIwDXLz0rh9thWXC80Lji0otVDVncXT4qaS4j1fN
 K0Nsw6ltZW50IExlIEdvZmZpYyA8Y2xlZ29mZmljQGJheWxpYnJlLmNvbT7ClgQTFgoAPhYh
 BJjMiHuM4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsDBQkJZgGABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEH6EW4KtCh6Tt+sA/jVC35rY1npFlOy7YnncTdrID8Qf855JA78IzXgvzpGp
 AP9FkuuT80m66PP3DvgYX9kVnG17mSDKO0+v2W18v6ZgCM44BGn8fW8SCisGAQQBl1UBBQEB
 B0DMwF4u//aQyzsFlO8rPJ/cqsAuPH80IeIA3HOEo5mlVgMBCAfCfgQYFgoAJhYhBJjMiHuM
 4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsMBQkJZgGAAAoJEH6EW4KtCh6TdSgBAMDS0MiWCivt
 LjzZc9bs+P/xdXywUjDKq3lpQGJ6vZ0GAP9vI6DnN7vwVK6jt6/+0aBGkog5Ura9+WwRFEdM
 vLfPDQ==
In-Reply-To: <20261125221502.GD3581@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Geert, Laurent,

Thanks to both of you for the answers, I reply to all of them here.

On 11/25/26 3:45 PM, Geert Uytterhoeven wrote:
> Status = "reserved" would work fine for a leaf device (e.g. a network
> interface), without further dependencies.
>
> For core components like the CPG and MDLC its different, as every single
> module on the SoCs makes use of them.

Right, an SCMI DT changes every producer and consumer node, and they would change again with each firmware version that changes its ids. If I were to do it, I would handle those changes in a downstream tree, as SCMI does not seem designed for several firmware versions with different ids on the same chip.

>   1. They are not stable!
>      We only _assumed_ they are stable, so we could relax dependencies.
>      With that assumption, there is no longer a need for the (contented)
>      addition of scmi_get_base_info(), which would be needed to
>      distinguish among different firmware using e.g. different ID
>      spaces.

I think this is the real problem, and it is not specific to X5H. Ideally the SCMI firmware keeps its ids stable, and to me it should even be mandatory.

>   2. That can't work for now, due to limitations/deficiencies of the
>      current SCMI firmware specification and/or firmware implementation.

Which ones? Can't we work on improving it?

>   3. Last but not least, they are not hardware description.

They are firmware ids, and the arm,scmi binding is made for them.

On 11/25/26 3:52 PM, Geert Uytterhoeven wrote:
> This only focuses on the IDs, not on different abstractions offered by
> SCMI.
>
> The latter leads to the need for changes in (many) DT bindings and
> drivers, to support the same hardware blocks that are already supported
> without SCMI in the same and/or older SoCs.  How many different DT
> binding variants, with corresponding more complex handling in drivers,
> are you willing to support for the same hardware block?
> The remapping driver takes care of this in a single place, avoiding DT
> binding and driver changes all over the tree.

Agreed, the ids are only one part. But most of the other differences on X5H come from the firmware (missing clocks, zero rates, reserved resets) or from the missing clock domain in SCMI, so I would rather fix them in the firmware and in the specification.

On 11/25/26 3:55 PM, Geert Uytterhoeven wrote:
> So we can't upstream DT, until we have stable IDs for real?

Yes, that would be my take, to avoid glue code based on the firmware version.

To me, development firmware is the SDK, made for development, and a released firmware is the one that has been fully tested, where no new resource or missing id is discovered anymore. As you wrote to Wolfram, "We are still discovering missing SCMI IDs for some resource", so I think the X5H firmware is still in development.

I was also always told not to upstream something that is not mature enough, as your cover letter says for the firmware. So why is it important to upstream the DT before the firmware is mature?

On 11/25/26 11:15 PM, Laurent Pinchart wrote:
> It's not a matter of "in development". Software is always in
> development. Don't get me wrong, I agree that we should minimize
> breaking changes in SCMI firmware, but we can't avoid them, or even
> minimize them enough, without a QA cost that nobody seems willing to
> pay. Where's the stable SCP firmware for X5H ?

Linux is always in development too, and it still keeps its userspace ABI stable. I think a firmware can do the same with its ids: keeping them stable is not a QA cost, it is a rule when adding resources, append only and never renumber.

The open-source SCP firmware I am developing for X5H is public here: https://git.gitlab.arm.com/clegoffic/SCP-firmware/-/tree/renesas

For the SDK firmware, Geert's v5 cover says one table covers SDK 4.31 and later, tested with 4.36 and 4.39, so the ids v5 uses have not changed since 4.31.

Personally, I also don't like to see version numbers of firmware that is neither upstream nor public in an open-source project like the Linux kernel.

On 11/25/26 3:55 PM, Geert Uytterhoeven wrote:
> Zephyr has less complex software abstractions than Linux, and
> might not care about DT stability.

Yes, we are lucky on this one :-D

On 11/25/26 3:56 PM, Geert Uytterhoeven wrote:
> I understand that can work on servers with N CPU cores, N network
> interfaces, and N storage controllers, where you run multiple
> virtual instances using the same DTB describing e.g. a single CPU core,
> network interface, and storage controller.
> But not on an embedded platform with complex I/O...

To me, X5H is an Arm platform like another, not a special case. NXP's automotive S32G, which also has complex I/O, already uses SCMI ids in its mainline DT. That is why I would rather handle the firmware versions with the SCMI quirk framework, the same way for every platform, than with a special case for each SoC.

On 11/25/26 11:15 PM, Laurent Pinchart wrote:
> We have two options to deal with that: either we handle that instability
> in every leaf driver, or we handle it in a central place. The latter
> seems a much better solution to me.

Agreed on a central place rather than every leaf driver. Where we differ is which central place: I think it is the SCMI framework, with its quirk framework, rather than one remapping driver per SoC. A hardware revision is handled by the driver of that hardware, but SCMI is the same protocol on every SoC, so its firmware versions are better handled once in the SCMI stack.

Anyway, I know I am going against the common view here, and maybe I live in an idealistic world. I truly think that one SCMI platform should have only one SCMI firmware version, but somehow several exist here. Do you know why the old SDK firmware versions are not simply fixed and updated?

In general, different SoC vendors seem to face the same issue, so perhaps it comes from the software development process around SCMI servers. That may be worth stating somewhere, or even directly in the SCMI specification, for example that a released SCMI firmware keeps its ids stable.

As long as old firmware versions are not fixed, it changes how the SCMI Linux framework has to think about the product development lifecycle: how can we handle several SCMI server versions without a set of device trees and without dependencies inside the drivers?

My first idea was an upstream interface in the SCMI framework, used by tables maintained downstream. But that does not hold, as an upstream interface needs an upstream user, and I am not in favor of adding one for this.

So I would rather keep a set of atomic patches downstream, one per firmware version, built on the SCMI quirk framework, so they stay easy to rebase and maintain. This way upstream carries no development firmware, no extra device trees and no version-specific code.

This would also follow the comment in drivers/clk/clk-scmi-oem.c: "impl_ver-specific behavior should be considered a bug and handled via SCMI Quirk framework".

> The way to go in my opinion is minimizing firmware breakages *and*
> having a remapping driver. Those are not mutually exclusive.

Agreed, they are not. We only disagree on where the remapping should live.

Best regards,
Clément
