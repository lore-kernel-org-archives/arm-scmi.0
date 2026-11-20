Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170593;
	b=igDSjaciVt1h7xrSK3u989LkSeyPB5pKTcxvh1tRBWbZzqql6Pv9Ytq1WN5J59tOlOXH
	 YnQjrCFbTWuGgOcV6UcrdJfHTj52QKZNwo+7M9JviXn7lNS3AhcE2+ZxlrpFLEZimEVYa
	 zMj4/z5ozCi/4QMDKHsvVwaY6SzTlWcvbKBQ0qEItElebu20DOFPfmnWHFrggQdwujMuo
	 D39iQZn+xn7VpFDVIMa8AiDXAOmLS0q/ziuhe3n2V8JrTmSOAfJvG92FKNtyDLCNaT/zP
	 ix1NThll8G6z+x5KM/VBnWezLM//eTnGNeynyMAJ05Ki0NTE32ohmsvld0bx3fF+n3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=YECa1p9LzdYXA7zGnIWZNUD0xhZVO826hfzpFJvQccs=;
	b=jX3Puw6vX7EANFrePbGcWvFdTUO5jFK6lqUB40pRz4qlZzDxSAp4tz1Sv+E7My5/qhNx
	 Gy7ygnJl++6E6z//m++nHs/h649V/UYzN2c98CgcVwLb7rNeGalyu2maxV9EPld1WGIuk
	 fJIeeuKbP63z6BpxE9CAhkwe8wQt87KiL7pMYKGW4eN+1vm7fIn/QMa7osvTLavcAPOrL
	 vXWZ+aL9P4oxGJkLAB6b8LTQCVTj3RerlOvoGem16Mt0Z2ND0u6Yg/Bxniixc/QQV7b/2
	 6wa3VlpgLixki1JkpsJCZOPTkgKpj+nC98PdlN16lIhaQzIxOYmSsvzJEIalemsHwEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=emnnzxhh;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D869B606A331
	for <arm-scmi@vger.kernel.org>; Fri, 20 Nov 2026 10:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D869B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=emnnzxhh
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so8450225e9.1
        for <arm-scmi@vger.kernel.org>; Fri, 20 Nov 2026 02:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795170591; x=1795775391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YECa1p9LzdYXA7zGnIWZNUD0xhZVO826hfzpFJvQccs=;
        b=emnnzxhhSXC7pOKVR4XJxY37JOLjOZChOAK8ys6839gghkzDP+P+c5pUqMAdfQBI8u
         AEHGxP6PrOmX6taHKNBIJJC5V/mEyzoX0UK2Ne9gWuY3HPn53Zb/5ETmtXitq0LlHZA6
         PLcBn6cQcLYaOEiRvWhqaGoNM/bMkhIPn/xxaF+NV2e++aJJiQ/yqseiqE3UmEx3eK1+
         ij775jpfZ1RUph0D6QJHxszrkgPkYhm4N+7mWb2I3KzT6yBo9OKyQVgSglqI1Q93UQ3B
         LA0EMG/ZrARNzVVucMAgbJCyu4tY5crfyGbBhh0vFBEgPBa/v+rKxcsxsaJAIj7/cE8w
         cBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170591; x=1795775391;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YECa1p9LzdYXA7zGnIWZNUD0xhZVO826hfzpFJvQccs=;
        b=KlbWBFN8UiEV5DOJ+ApcPSiKZt+43i3mal6FEHOKFDPWr5IGgeEV9LoWx0u0bJrBUm
         dqpIETFs4+1raQbFOdwDY6aq1pTFfTuwKBNui6JMOHQMz9C6f/9AKSqwT0pZxdnK8HO1
         lwxXk4xcb6LAGQM/6pMZP8wuGn/50D5fyNOppABctRvooR8to3V0H75r5kEtRAtQwTRM
         TKO1W7WHjFVNIydt+P3UEy2lXiyY1EePL6hf2ZZhSjzfPPVKgwIxvWMboPMbZVqLPdFQ
         bFyoWtHcQxYFcUVNsIAp+4fqBJy7Da785MOiMZBY4s9jjIkrtqxSkYaCRTT4plCHp6Ff
         T5yQ==
X-Forwarded-Encrypted: i=1; AL+hErGlMKW4EvE8l/59A0YoVlRWpZViudogXO74MOcScskbzdaPmgNOhdvnEpd3PguZOGUW7+FABl3B2w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8YoAJBFrgr6WsAdgU05no4vEmZ+wdLd9QABh+Em6uTBNdWMXur
	xS3oX+g+frmJv5G5HVXqftRsMv+pkCUVmkyULW72UXf55M1YQrV2A2VahTJoq1WU6Uw=
X-Gm-Gg: AYBFou3oJFnw/MRyb8qwhq0UJDwLiKRex+PIEj22pcOnwK1HVQeuMBadw9M02Llmm/+
	9G3Cr+FyH2l5stelQ0PsJb2NxGRk9aVvnGJcsc/rA5LTCCIjujbCgPuOFR0CiTKH87x+23dDdRz
	U6EAXFm9eURnw2q8c86dsU2EXHAPersFjv8Gy7bJmFIDu+fL+J23OPyfpOawoqaHagTKp3Lyrmc
	RiuvrYRbpR9H8J7B4zBGSHiCYYgFWXq4kNw8p5V5FE/VfU+ZLE2zLgv5X/l8CRmSWqG9+YS26Fi
	Ij4mqBF7x6eOZXhBc4b/7hkyyE0jW54lJZ3JBpKlvHJXT4xpzI9TMDTjjmBV6kn5jUIvM3UsOHu
	D/W+ImofE4rBPKpDWB9Ii/kFONfRDHoHA11UzrmJOVWYqgH/AI6q0O+xn0t5m9QPO8TTquTrz5J
	14sL5gFt2MM7rWULIdaU+SXVY8SnaT0esk3TylOZ7gAbBWwy/at+08TkDNPe1hkJlYBY0yblLwz
	+Rrxb6pMEQB61PQIk1n1pVITXsgga0Q33VL5x+Y1yHCG1zp/4KyS0YSfwGw5FSaDWaTGSxERKZG
	ng4uShockvOZY2zMC3HPXLqhJuB4K7JZLbHkaxCjZKSD0HnL/9NKM8LJ5w==
X-Received: by 2002:a05:600c:64c8:b0:4bb:605d:8e92 with SMTP id 5b1f17b1804b1-4bb8881e767mr51613175e9.32.1795170591115;
        Fri, 20 Nov 2026 02:29:51 -0800 (PST)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm65912515e9.10.2026.11.20.02.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 02:29:50 -0800 (PST)
Message-ID: <19c3745a-6308-46ff-bb37-3acc88fe22e2@baylibre.com>
Date: Fri, 20 Nov 2026 11:29:49 +0100
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
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
In-Reply-To: <20261119234759.GB2324725@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Laurent,

Thanks for your feedback !

On 11/20/26 12:47 AM, Laurent Pinchart wrote:
> As far as I understand, the assumption impacts the mdlc and cpg drivers
> only, not their DT bindings. If (or rather, let's face it, when) a
> firmware revision later breaks the assumption, we will be able to handle
> it in those drivers without affecting DT.
> 
> I don't like this remapping driver much, in the sense that I wish it
> wouldn't be needed, but it seems to me to be the best possible
> compromise given the instability introduced by SCMI.

I don't think SCMI itself introduce instability.
It only defines the protocol, and each firmware choose its ids.
Could you tell me what you mean by instability?

For development firmware, Geert's cover leaves it to vendor trees:

> This list deliberately ignores ID instability and the need for SCMI
> quirks during development of the SCMI firmware.  While upstream Linux
> must only support sufficiently mature firmware versions, vendor trees
> (e.g. renesas-lts) may still want to support development firmware
> versions.

For a resource that hangs the platform when Linux uses it, the SCMI server should deny Linux access to it.
Until the firmware is fixed, a quirk can cover it.

Best regards,
Clément
