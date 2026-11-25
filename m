Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.142
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618641;
	b=rBjelykOTNMMj8pQ0ACuw9ku4T8Qhw4R6oklwuLCHE/R2DQWjGlK0K90J+j6LAffsusC
	 j8hq8SxOoMKKLxKFO973uHq8ke76F0n43ayX9fmpNXOktWKPHje3Qcb05v3IMKYowuBza
	 xcri+fd+b8DNDdmzbgmGNzHX8oVrhXa8eC0aXQ2cO498k6tJCpe/BGOAIH/cLVHvIWuoJ
	 bT2OUsckgsNO80/G4cHCEDZbdygtqMEmgAgS5bCV+kTghkxd7eQa62dOS7PTwXtd+wMu4
	 Thfrn4/vK+ZpwXw/9cVMMeeMY+Iam0OyBpM60NFeSg1CTQISNU7Q9FpLAJZSBaL5m9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618641;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=iVkP4rDEQ7/EdCZ1IUGDhyjDM8nQB2s5/WPSMzgN9SI=;
	b=jw2aio8s5BJAMz2sfinsaPmeX9OQoIfpCOEnUxyBr2yPsGiqJ6R2D56KbeDms1LTmurB
	 74VSU33nK2w46pFNVfzQdBInJpg+shCkdvPT5pci7S8mmTtr5HbJ7HxvwRBav7YQv0Xob
	 49RB2O1PcrTFWL70S8UJgi4JniIBYQRAP/jMxwk6zVWVUemrAfW7onAuT2X9WkUHgJ8r+
	 6htAbb0jfYQ0wrcuKcb2HHNmifjjr9Jp5vHX1FqUSd9ufuUbmm6I1DEqJOhX+HVHOaf8s
	 /o3lE9f3Yp4gqJDiwXMPpIgZaKTBavG8+PSdMHXVB3T4MC2s7re/iepfS1rQ67aijoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=glider.be;
	spf=pass smtp.mailfrom=glider.be;
	dkim=pass header.d=glider.be header.i=@glider.be header.a=rsa-sha256 header.s=fm1 header.b=YNpyvxop;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Dr7JKgcc;
	arc=none smtp.remote-ip=103.168.172.142
Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5AE606A31E
	for <arm-scmi@vger.kernel.org>; Wed, 25 Nov 2026 14:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F5AE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=glider.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=glider.be header.i=@glider.be header.a=rsa-sha256 header.s=fm1 header.b=YNpyvxop;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Dr7JKgcc
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailflow.phl.internal (Postfix) with ESMTP id 6331813810BC
	for <arm-scmi@vger.kernel.org>; Wed, 25 Nov 2026 09:57:20 -0500 (EST)
Received: from ams-imap-13 ([10.64.2.33])
  by ams-compute-02.internal (MEProxy); Wed, 25 Nov 2026 09:57:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=glider.be; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795618629;
	 x=1795622229; bh=iVkP4rDEQ7/EdCZ1IUGDhyjDM8nQB2s5/WPSMzgN9SI=; b=
	YNpyvxopUJAaFvfcE6BEEuS6jDLRbLCWRmiwpIWshkl/pEPD7bYjCwWthqOkC+uN
	8Hfuh9grjQI58gIZIA06zmI6T0EeQaBpyUoFqarRJ6BvXoChAcprZU0217zpKJEv
	VLSdoJDIeXvsVJ1Y4w+KW1OddwRxddtfPw+D8HjLApDf+WSmMZPIbH686687Xn/p
	uVgd1GW298GSU7unwpz9BO+yr8BHvgY9DGIIajH6uX/UDs6YnKOXPCKrpDWlqgW9
	mGQODFuD9+DMcPrjJIVkuiXPClA3k4W7UDQzQWn/c4L7+t2yRyz3/aqoVF8+gpAz
	WS0HOvWszdxml/I3GLv92Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795618629; x=
	1795622229; bh=iVkP4rDEQ7/EdCZ1IUGDhyjDM8nQB2s5/WPSMzgN9SI=; b=D
	r7JKgccgEDo0gJ9bqhDvIRfWrlwoxkSKR7yDYk43pBG667ZienLl9e74uonEpEng
	aRcxdxoAsQwEp539rpg32cj/onbjoON91pqF2jRUYlk+UnjBs2AeVs+x0TnXEBPh
	bGPk6BrDqRIkqV1ZYuOfxB1zgAjxsS0WOK2UfUAQYQxsi8HWqVGYj1aZ7poxwsIz
	oyRXdSeMHqHm6vhcZlAUUq1k1ANm1BArvHgJxZbIW1mSOmmBQ8qsS4aEgDcsf21+
	Q8j+8q6gHoIlkvso+5ee+lKiCT5Pvz6TmzcNj9n9x7G7EgfRReU56BE+bpdltl9G
	jjv0yox+i2gDl6KOIZLjg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=glider.be a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795618629; d=glider.be;
	mf=PGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg==;
	rt=PGFybS1zY21pQHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:Q7epW0ELGDHzn0cs/aU3GIL8jyDE8Guh89H2XY3EMlXC97E
	90l8yd5UCRw4t7Znxmulb7w0Gx7Jtikz2RrUckmgYyReS8azv2m4VPaV6CjFFmj8
	c91YbXGv2mfvQBGyNxGWcC/5l5YKpWSUCIkBx2oAlAMKnwivmadHV2K+7NZO6gPq
	AOjYwFL4wKrwt0W7ZzlVqRFh5T5iiHYBjV6EmPnWPCtVMlAxxzxayEfjXqOgZSBu
	XAPu0oaKSQJo/sWRcwk5kCYRLXkaviB1JRjyYhnAwWmmbLI1qLQBAkp/86Uoljvt
	yTBmFjpdeHZYsacjizoY25YVAc6QQcQ0WTwZ9VQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:ay1chTJ85YWyid5Zm9dT3a0OQOaSLwIXzawSdjOdQTI=:B6CPTVA9o5nt1bPkZey1vU+8Dht/LmmRYtHTp5hQjO0=;
X-ME-Sender: <xms:PvcGa_VV0j6E4kmmVtQX_w_ub25Bp3sSSJRwHa2PZc83v7sBrvRtSQ>
    <xme:PvcGayaLM0jBM2tCCMfeYqnWY5uW9_PfxOiu5-dCtXa6dRnhn6Dan9n94oUQO1d3J
    V20XnNrziXIr4OAlTzahtVRvy8Tv3vGQwzr0HGhvPzxu3BSzFCrKVSZ5g>
X-ME-Proxy-Cause: dmFkZTGA2Uh0AMBdrBEHqmMMMWz13VchEc7pGA+gzkINl2ErebF02siO1gHL6d+lGmKk1P
    rNXAHunhQDy6ErfvBXm4tmlhmz+xRl/lVRfy1K5sAwh7A1K/7AWARHWutEt7sdOYZLv2nZ
    ENBgjuoe0X7WtYFtbYYPiEDEvQGgXfj0ni7KzAnb9lXishaqrRlq+GJugQfFV6PEVmBSOR
    I8DVN+hTwb/FHDvfXXRBvtpkQW6iB46Hs0B7z11PqSL26qdCiu57vmDcgMe5MB+4chseeC
    kcBfxAI6/Wh571fn6DxCe52Tj56Li7YDxZ1mzMlBp8IVwmCr6yt4vFLYUvggqjIHyZ8HCC
    xEnNtTZIQhcszT8xCBxPYjrcWTzlRF4FqZMDv01P2Im5iNYICWgK/pzHOsgEOareOHLySW
    6d/3UAFGSQ8LhZIiobHorxC0wTfs0saYnWcPDzlWXy0rEmRwaNuZ+sc+Ykbm/HreXAm3E/
    JpYnZliIFT1dux+iYtVtRPxHVlNaUT/5GRptfi1Sku0x1Knvr1RU9USfRRFO8npm/es1lh
    rS3njSYjpqLwAsjbJT01qcuY+GL8EcHEG4f0FRwCPGw8NP6kuxLoG3NrpdK4WY7w9zEXit
    DxeTmy4rvkzabFBtMPu1Bcc98YMcHwhZWxpiT8mm7ctJOVtVi1563Emp8wag
X-ME-Proxy: <xmx:QvcGa58pY5UkfYlCCObGu7PpuFKqCCVMBLD2jag1DbFXW3ncQSIHBg>
    <xmx:QvcGa-7lVDCTcH1A-C5t3H1s1lSP_HgsLM3vLScY_Gu_42zaLeaDXw>
    <xmx:QvcGa3ek3BpLGq9BTJHctjdYks9sh8Tgb6M0A8FrhINraigv_SkMyg>
    <xmx:QvcGa210tPeV_9Ac1YJwE6l9QYjo0uYxoVg6eqE_pgDVlHmcsBkLqA>
    <xmx:RfcGa0W3_mF4e-qP3gfPKLEwacAGNEZFNqGcuvQ3xBuMx9YKMLeBoQV8>
Feedback-ID: ia0f84a9e:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 21AA0F8009C; Wed, 25 Nov 2026 09:57:02 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AwlvDh2-Hwo3
Date: Wed, 25 Nov 2026 15:56:41 +0100
From: "Geert Uytterhoeven" <geert+renesas@glider.be>
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>,
 "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
Cc: "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Stephen Boyd" <sboyd@kernel.org>,
 "Brian Masney" <bmasney+clk@redhat.com>,
 "Jerome Brunet" <jbrunet+clk@baylibre.com>, "Ulf Hansson" <ulfh@kernel.org>,
 "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "Marek Vasut" <marek.vasut+renesas@mailbox.org>,
 "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>,
 "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>,
 "Kevin Hilman" <khilman@baylibre.com>, "Vinod Koul" <vkoul@kernel.org>,
 "Kuninori Morimoto" <kuninori.morimoto.gx@renesas.com>,
 "Paul Elder" <paul.elder+renesas@ideasonboard.com>,
 "Sudeep Holla" <sudeep.holla@kernel.org>,
 "Cristian Marussi" <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Message-Id: <511fd100-e3ce-4f47-9d47-22c6532c3ef5@app.fastmail.com>
In-Reply-To: <27796cff-eef5-46ce-8079-93a0a8d40db5@baylibre.com>
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
Subject: Re: [PATCH v5 00/15] R-Car X5H Ironhide CPG/MDLC SCMI remapping support
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Cl=C3=A9ment,

On Mon, Nov 23, 2026, at 20:09, Cl=C3=A9ment Le Goffic wrote:
> On 11/23/26 5:05 PM, Laurent Pinchart wrote:
>> I have yet to see any vendor who can provide 100% stability guarantees
>> for SCMI firmware interfaces. In theory, sure. In real life, I just
>> don't buy it.
>
> I agree that while an SCMI firmware is in development, its ids can=20
> change between versions.
> To keep the ids of a released firmware stable, I see three rules:
> - an id always names the same resource, ids are never swapped,
> - an id is never dropped: when a resource goes away, the firmware keep=
s=20
> its id reserved and denies access to it, as SCMI 4.0 section 3.2.1=20
> describes,
> - new ids are only added at the end
>
> I think upstream should only support a firmware that follows these=20
> rules, with its ids in the DT.
>
> For firmware still in development, I agree with what Cristian wrote on=20
> the RFC[1]: "fix your firmwares AND/OR apply quirks in the meantime".

> [1] https://lore.kernel.org/r/aekXUvIPb8nkhdKu@pluto

Oh right, that response also included the mythical selling point for
SCMI:

   "SCMI server is supposed to be that one entity remapping the IDs in
    the background if the same IDs happen to be representing different
    physical resources across a number of distinct platforms"

I understand that can work on servers with N CPU cores, N network
interfaces, and N storage controllers, where you run multiple
virtual instances using the same DTB describing e.g. a single CPU core,
network interface, and storage controller.
But not on an embedded platform with complex I/O...

Gr{oetje,eeting}s,

                                                Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m=
68k.org

In personal conversations with technical people, I call myself a hacker.=
 But
when I'm talking to journalists I just say "programmer" or something lik=
e that.
                                                            -- Linus Tor=
valds
