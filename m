Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099639;
	b=ersqJWtigRKp5lIHeL1i6YKwpAQB14EPE8s/pQzmVu/827++MaAPshKVGLTi7L8tEkKl
	 QpJdCH4ynLg8cCJZC+GnrEvg/Xcuge3UVRHZaGrE7wt4Gl/BttpmtWPq1/fbODUsP0V+z
	 0t4HDJbS19XYZug98IB7Y56YNP9NLfUMJsMqgSazSh478WbJeTvhEU5BsZCT4iC0OnZ7r
	 XSRDnT/xPDr5tfM40lx0WwNavNw1+pmjndGDpdt6Js2cmpqD/3S9alhKEoGHjUpWnQfsr
	 fmaYxRWz/3nILNk7hO68Z5VuknjJE9a7f+LkgcpWCbhyewV0K9Y6kbYamSzmCy/aQtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=vITMaRYl8N/4FX6Ub/CtOdFIyxibL9pIfaPhRC74PEQ=;
	b=txK41vHuTS8OIUvGq6OS4v9CsJCClQ44nbBdvYZxQVWqSGgYGjqIvRqzbvxKYhKb1dUu
	 NqQ4eSQ5yxUvsDZt0+EwnfIXtccK97Dwe8Umw65aurfDLdG36t+DMmgeb9rjLamITDyDi
	 BiYQV4YWxroGjtr4XgkoFZ6oxMd2naXU4DuSD2f0rmlRQlW0kMGMqZxzpGAYQGZkPSyZ5
	 kG7vboPZzoDux5ub/tvqbO5s7uU6q1QJDBjNIIPprJgdD5OCKBnWCxXnh+8vTu2Gf8GWJ
	 9gor6VwHNUZVGMyObc7kPMGyleMOSDsGsflcxLBPKqhxEuXmalKp38V+wzjl327n9rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TrJluSdU;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013B9606A325
	for <arm-scmi@vger.kernel.org>; Thu, 19 Nov 2026 14:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 013B9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TrJluSdU
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6ba12b00c76so903608a12.0
        for <arm-scmi@vger.kernel.org>; Thu, 19 Nov 2026 06:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795099637; x=1795704437; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vITMaRYl8N/4FX6Ub/CtOdFIyxibL9pIfaPhRC74PEQ=;
        b=TrJluSdUX+LCPAOrAOhA6LjHqBXkXzXdZYzjMx55+3fdDm8qXlIDbcwPLeFn5iEV8L
         81q7PJ6vKUHawD3zzMlIVK3s0qlUxABF9nlbI1HhyjHFLneVa4qFHXHBTQ30Wd2+GFaT
         N5U8a7+EgH75s8BGxVtnefpvkPJZTUdEf4siNc2UfCxyTzsphHLg2wBwxKJih/LDuApL
         eWknL1aAzPN20X8Bum1bME8KDVnaD0j71ulUclw9QS9pjmPRMYD1rEO0Cg7cEQJUz7M2
         /E2vbBN1hhBaN1oikSCwHN6vsJoji+hAK43fX4HYQaXsr2i5I4wC+SL3M+HaQAYn82fy
         hy+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795099637; x=1795704437;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vITMaRYl8N/4FX6Ub/CtOdFIyxibL9pIfaPhRC74PEQ=;
        b=PuFk2ZQnXXjkAbFiA0U/xr0jtXAiPGyEL/WzOC1f//u2aJTXZXzDJlSlF5+dk7kkQa
         K95hH98WxgbuJOuB2uUG7LAQzirxb7evWzgvqJVKukokASwSRSmpzySaWCBHlVXX69Dh
         jMAfA+Wqz4j9/CpaqD3EzTM+jXWxf1oxpcNuey1R3BKBzJQ54cMSdZCVcE7afsRQdWqE
         k0Id269cU4eO0YnOOJEHdUfNavqCZy6l/bOMEdijiOvJUrf+Q5y/bt2wkWrHXrBMpxji
         n6CQ2ZT4CWoPSu1Eyzv057dIbIDz8P0DRdmw5+xP44oSU26fw/V85jdsx43VVXf1cMWJ
         k5lw==
X-Gm-Message-State: APuU4Z9O1vuT07l7fQiFVnssxRBpGDiVyd2tuw7kFtahsCvtpny1ncj8
	Xp3X0L9c7JZmXPPJ5So9bhHC83ARqp/VnOHKug79q4l2QZ8MP2Y/he/PDKViOENoUsg=
X-Gm-Gg: AYBFou2vZOftaeyrsB8PLoozqhmlljItyMga3+5QCGKc1X5A57ivTwa2xPSPU4O0Vun
	72DDnYRxCco+U5ILG6/feVMMMnSlwczHQiUo0mXUkJdc/5PT7fDOFug/GcaGI5tKGL8dNbvO6k/
	yj9Km+z8thPuCBRO2EP1OCNKgVYAP7JNPS7v1Cp/vSP2vDDtqBAs2TPmTNGDeOfP44iR8tx9r/e
	EzWGpOpqKA/uzYfMO7ta7EjhDrRTcabfrdEppOSJZA3z8QpHzllW6zZdhL3jr/ePxkJjn43JKyj
	2wbisVUjTGegwgzr1mnP6mQWgcGxDeZCAPBPFmngwC4jOFoEkJaVqbBW7kkHVMpJZBWEWAhlEZr
	EMQJ871j5+3xqsf49b9Sc2GSW5fOPv3k7DhcbEZCjqk8K23QU77ocdkFgTOBCQsI+IlsDASajo9
	3wqThWAK9z4BibkhhFnawyMCajvvnDsOu15SisuTnKPecFVqSUI/CWUkWwdkpz1cVOid0DIwvAK
	uJ186CISwld5swDOeIokvxnGXkOOb6s0gATC6qDe1LL354gRmx43Tj/1TdOY46GgWLktk1s8Tiw
	2A8DZ4x61Ob6biKv4HkJ7RJpJdt9Si+WD1KQrEzlSOLNi7uba6jTampiIQ==
X-Received: by 2002:aa7:c7d5:0:b0:6b6:ea98:2539 with SMTP id 4fb4d7f45d1cf-6b9095b57admr2564430a12.6.1795099637250;
        Thu, 19 Nov 2026 06:47:17 -0800 (PST)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b88993e08csm2579854a12.6.2026.11.19.06.47.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 06:47:16 -0800 (PST)
Message-ID: <1e9c5ac3-d82b-4af9-9946-0302cadf7404@baylibre.com>
Date: Thu, 19 Nov 2026 15:47:15 +0100
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
To: Geert Uytterhoeven <geert+renesas@glider.be>,
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
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Paul Elder <paul.elder+renesas@ideasonboard.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1795029012.git.geert+renesas@glider.be>
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
In-Reply-To: <cover.1795029012.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Geert,

On 11/18/26 8:44 PM, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> TL;DR:
> 
>     Describe hardware in DT, and perform mapping to abstractions offered
>     by SCMI in Linux.

A question on the approach
An SCMI variant DT could mark the CPG and MDLC status = "reserved" and point the consumers at arm,scmi, while the U-Boot IPL keeps the hardware DT.
Since v4, the series assumes the SCMI ids are stable:

>   - Remove dependencies by making assumptions and dropping disputed
>     items, to move this series forward:
>       - Assume all SCMI IDs are stable.
If they are, why not using them in the DT directly?

On partitioning, the cover letter says:

>   - The clock, reset, and power domain IDs are not stable by design,
>     causing DT incompatibilities.
>     SCMI requires that the ID space exposed to an agent (i.e. Linux)
>     starts at zero and is contiguous.  Hence any change in system
>     partitioning (Application CPU core vs. Realtime CPU core,
>     virtualization, ...) may mean a renumbering of all SCMI IDs,
>     implying a massive change to the DT.

SCMI do not mandate that renumbering. The ids start at zero and are sequential, but nothing requires them to cover only the resources of one agent.
The firmware can keep a single id space for all agents and restrict per agent what each one may use, the rest returning DENIED (SCMI 4.0, section 3.2.1).
For virtualization, the spec has the hypervisor grant each VM its resources this way. A new VM then changes permissions, not ids.

With a single id space, a software configuration only changes which nodes are enabled, so one DT per software configuration, a base DT plus an overlay, is enough.
If managing many configurations ever becomes a nightmare, tools exist for it, such as Lopper from devicetree-org [1], which generate one DT per execution domain from a single system DT.

That leaves the missing clock domain, which is a gap in SCMI itself.

[1] https://github.com/devicetree-org/lopper

Best regards,
Clément
