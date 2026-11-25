Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618057;
	b=hJ9xy9gxV/VjynH0QuF8LM4BidoRhFg4LiSr8LmEPgYOpDVsttJdC6/XPC8j8izmMljm
	 WOhRgSrLZLTp5hPDJd2aubDTKtaOBhg+h3AGCX+22Sck/CeFtJPkPlN8rXIXBfXfZTS0O
	 Nc5JiqLnyS+74NtWHRauOrOhhYB85ACloCte7e3xAZsZOZpNtRjrq7mQx3Zn51GFHlhUn
	 XkdD+vbMhO36T2b1pkAR/8RsJPYzl+evQmJcDgg6P7LgBjvVxWbQgPG2MeUcTTSjxhSfR
	 cBhTuqeMXK8ldf6LI28jyR9tEVSDcqSOIgSq/nNZvWIAt4nVcHUYVbSDx2Qmq1pV5vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618057;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=jyTslH/h8L0C8HCIteQbCN/1sF3Ppecw+tHudhxEPjo=;
	b=ow0Y8+teH1ZSBzpj5gf+RiQtacvnrOw93GZyH+h/skO8TFfbZ5UYFRrSZivl8Uj+gTje
	 1OYzCIH9YLjIf9otzW85NeZDmoapOKtKIiKFRdn0k8W4Y+FeUEKbFOcoSuSpCpwk7FXBg
	 4Y2bUYPVSS5Q+zY4OFnjtkGnxvOH6uMs3Z6diMGFkr9L17Ht4vNVXx109NFlMQJZ27gID
	 fiSNA+ZQPDHEhRYxk+H8f+jKD+WkYJk8CQhEMEq83g2r9+Ipd9d3FDnVreJad+yW9A5ZV
	 OF6l78GC1tQENUydSXMnfTM/iojxya39oK5Aaf1/0vXKD5i/BK4dmmkx4EC1/qg9eIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F05606A323
	for <arm-scmi@vger.kernel.org>; Wed, 25 Nov 2026 14:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25F05606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-94999a08973so540756085a.0
        for <arm-scmi@vger.kernel.org>; Wed, 25 Nov 2026 06:47:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618056; x=1796222856;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jyTslH/h8L0C8HCIteQbCN/1sF3Ppecw+tHudhxEPjo=;
        b=gIKYcL8Yx31CtIPpwwe1HLuajQ5UuUtw8CzC+Jyha5EftwPZmrXFL2xZwCmw/dYlYa
         NQwO/zBNqOw5iIUnYBBc3UoPosgZuXiI9vKz5iRy065nV0JGgd6kWhyYu+ZgAfq9yGuu
         zxX1GXtm7X1/uelA8YuO8gk3Vc1LAiSZOMIuzozdq6Y1MH1rS56x75GAE6CtdEuar7A1
         bfvCjRfvcTre1vMILK6U4qBzLCTjwuLHyQ0XeIN/p9xtuE3LaGrJDxf9eCZMjbmVy7Ve
         5RylxmbTTn3BLl83n1+jnOYogHlTKK/Kr5s5ho464K504VkUNJWQIChAran4rddYBAea
         IUCw==
X-Forwarded-Encrypted: i=1; AL+hErGa0CAdyFrIMXbOzSf6iWxkHdIMVBWLTmdFpPXpPLlgTIEnVr9EOaK+2gcY5OBxgPj0MhTaPe4tnA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+7cRdEumYdceFT8a1yDU2aVsY7fYGnSZuOpJ8+5kSidiqlELYG
	Dum4+OjGtjfdEssSB48bjEDhwpQLkhL91zHZk6/+rwWaeZKXTgiKnQonFlQ/ludl
X-Gm-Gg: AZFdTZecujeCHJw5EHyAgs1OJT9hgPnudbjdmUZVqBTR0hqg+Dkd0UIb6X2ooBtGILK
	WiYBKMPVJ56N20xiMf2zAy8Loyxqg2D2jHe+ftfEILcbPwQJJ8LUBXmmG8JRu/AFFafUif9egAe
	NWCAGGguBOAhwttpfBvMOX+3tUWd01Ub+wYDWRCbfQjsKPBY3FCm/zolmQoagO1rQgknTRpxhi1
	wkTS8Oqq7tuD4yDSE6gfoyCZdMLaQcDRL4iFlY1tw/FsBbvgMlGaM2V3U+BRm0yPlZ5vWrFuArz
	Qi6G+ui5F4ngBmFlkleEQHj88Fcd6JGc9ArC8dKJXjURf/FroNGH8H/v55WctnOIxmzuacIyIzB
	TYfRHs3JMQF5FRVmNsVWjpSRohrqF9YmhD/M8q3paNGFnCB2ZaqHDWeWpRU68j+ouJc7EcpxI05
	X+YUzM5QkeI3a8VDmPatGVwsFR7wAJwbmE3q1gjJ3odSjV+amSkfoaQMzJeY78p4gsh6dFpQMIl
	vyuYliU7DetXtXkUFjsu+aBjw8EApot1W2RqIqqhy89VOxu1uPlWJlKQifTI9xX4QVxMLrpRBab
	vaWX0GGclPLxQ8d/k4jAzIUqrsGyj/eH9LAkLaX5rTkdlSdmTS20YZiU8VBxnY+bbm8=
X-Received: by 2002:a05:620a:4404:b0:93f:19fe:e6ca with SMTP id af79cd13be357-949ba9aedf8mr3207313085a.43.1795618055733;
        Wed, 25 Nov 2026 06:47:35 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb031601sm1325839885a.6.2026.11.25.06.47.34
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:47:35 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-99e0b1ee864so2159253241.1
        for <arm-scmi@vger.kernel.org>; Wed, 25 Nov 2026 06:47:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErExIQXgA0/wXKDgCOyqXhHrvOpB61kxGFuze1BhiXCSJNHodc6gwxJlNbsoDQL5WCp6y5NmDjPlxQ==@vger.kernel.org
X-Received: by 2002:a05:6122:1daa:b0:5ea:389c:520b with SMTP id
 71dfb90a1353d-5ee8af0b136mr10546236e0c.8.1795618054600; Wed, 25 Nov 2026
 06:47:34 -0800 (PST)
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
 <awAqqg6F2Z1t55x2@ninjato>
In-Reply-To: <awAqqg6F2Z1t55x2@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Nov 2026 15:47:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWLn444XFOUV75J22dNSnMkcjefusMomnp1dqRe3tsggg@mail.gmail.com>
X-Gm-Features: Aa3M54pxTFdlXtNPAY9vlRQdDdU5I_xDDti_PqZ4BrybSMWjBRbxoSvFUUiO_NA
Message-ID: <CAMuHMdWLn444XFOUV75J22dNSnMkcjefusMomnp1dqRe3tsggg@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] R-Car X5H Ironhide CPG/MDLC SCMI remapping support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
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

Hi Wolfram,

On Fri, 20 Nov 2026 at 12:10, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > I don't think SCMI itself introduce instability.
> > It only defines the protocol, and each firmware choose its ids.
> > Could you tell me what you mean by instability?
>
> Let me try to reword:
>
> In the past, we wanted to support all kinds of firmware. Sadly, each new
> firmware introduced different IDs here and there. So, we came up with
> some stable IDs ourselves and mapped them to the IDs per firmware. This

For core clocks, we came up with our own IDs, just like in other DT
bindings where there is no simple mapping to hardware.
For power domains and resets, the IDs are derived from the hardware
documentation (register and bitfield indices) (augmented with a few
power domain IDs that have no simple mapping to hardware).

> is a n:1-mapping of firmware IDs to our stable IDs.

Unfortunately this is not 100% true:
  - There may be multiple SCMI IDs corresponding to a single physical
    resource,
  - We are still discovering missing SCMI IDs for some resource.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
