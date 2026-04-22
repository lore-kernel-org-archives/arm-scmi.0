Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5227C372B3C
	for <arm-scmi@vger.kernel.org>; Wed, 22 Apr 2026 22:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776898121; cv=none; b=afcKZZWAOHNwiII7/KKwHd5W9jzqKxPhkIEe88n7ZzxMPlxSVf/i/rUD3TPoPrhyS5Ww3ii3hU44ZlOXnGj0FxpeCG3tiiUaxOW0Se5aHPTyFGdr2J3oYAu3/js+IS626TMlcvLZ10oHVsgo4T0zLhe8t57jY49Ohbnsns1hwqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776898121; c=relaxed/simple;
	bh=NRWSIj1awYbKDb7XDOAYoJaNnOVQ29rl0pbbuAh0CXA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Vhxn77BmXpTDnu6HbdM4GTMMnFPdC3mA0XMif2R/tLQ+9afQz5e26BwdOMxXc5yachAKp62bfGaqGS3TWsKVKafXgobgIeJz+4dNCSAXoPQQPtaSiPxaJvAykyf6G/Xeqe3pRk+tpSypQiyWqiyWwN955/CrAlJpqPPgKMQI0Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=xP0Kzkm4; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="xP0Kzkm4"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82f1f6103afso2831725b3a.1
        for <arm-scmi@vger.kernel.org>; Wed, 22 Apr 2026 15:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776898118; x=1777502918; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4qI6kGELEoPNIDxXAqpiIcX3kz3Y96gemHsRdJV8MIo=;
        b=xP0Kzkm4cdE8FArVwyURRIHBqxgKXjsZXcCImcT9GabegLK8BxG5yXw7MeEN+gWO7c
         2iJgGQFINJgAKN4BIjv2ysJkJXWZlOQxbXwci6oucu29d124FfVSkzHu8hXbi/VexCWw
         hjwhyIsDf6MUPD82KchjGOPlF86Z5AZ0DIdldkzm/ImvFY5UnGqprIWIN/8ggT8MHI7x
         C7bkUNY/zv9Slh+EsjBw7mM+szwXkfl5dyNd+ipkpHdIFjyG3Dc2g+IoVn7132uP1t7O
         wXQk5Z9aE5FO4TfJFxv4BHrYkyNiuRepGZURqK7AOiZEUE8x6Gx8H0zBwRCrirocoUvd
         v4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776898118; x=1777502918;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4qI6kGELEoPNIDxXAqpiIcX3kz3Y96gemHsRdJV8MIo=;
        b=mfWHRDSOimwCBkxnOSinWFaMydwIhXfGcSu3tTqVurG4GIureCdCaJMr/llZmsV2UJ
         iR5Z4+ljl5FY5pFVWHonOOrQoTAqfzvQuLpR0N5GyuedoLZyjq9e5oDtOHv8cOT6hI20
         0tBEf/IWK8mO7UOLlXLb5kIY8bSyJUijDuunAQB5CM7kaHAQQNdgC1wJaITY65wDvdQn
         17JKi6OzDA/9rCxTlOj9V6Oq7I/PX7EM9XhksqJmVRCJ+dMBUqKVpDDkST7FRYY1MROR
         83jlziR2cOMJo6u17VGN96gVhcy+tJm+uiYXMU4kerc6WvX+ME8eYyLJwf0mRSTBBFXJ
         1+AA==
X-Gm-Message-State: AOJu0YxyCfkLv1p/bovvRejADig29ygdywLLgdIpyiJHvjNOQ55cghXB
	kidNh74yl1S5xfLsSGX3Em2DIvNRftfhCPJY+ZdPRKUloBGIamn45S/Q9dgLGs6B1T4=
X-Gm-Gg: AeBDievgkv3pTzriKeQ7fr9nNjofOfIArhrTdvziE8FWGePY4Pkc6pFcVRrYdkCArub
	x7eCqADuKe1nESLYhQnsF+PVVDrPJHcZYQP/hXn1YHQ9Y1SN8TZm5a0w2jmoLb95HpOScoZIMgX
	0lH2fZHewZhV6nVpPwC2lAZeN7AY5YnUTtrCuakMgSLw4p+EK/rYmfCNIXrn8+FRZXczNxH1qW2
	ep6Hd1IJAnC4vn60eLH4nY1ejGS9+7WN9GXWLlJuY0bhp5cqIXMJ2g3Mr8kOj6VQlADm98j8zE8
	WVkqdoz65Kc03SFDvnLIDpzdqIoyEvtAvbrogJMh6MnSX4twDnRZtRiB0tnv8qVuYo154f5hQzF
	SKnvKKe9tE6MlfY+7iD9q/KyD54HRGdOZ1JK4MILHm4iChcqnhexbs8BUWOU2LsV12qKJyNZ0Yh
	6ylrKPTCeOS/QWyAlt3MJ9QRl9MSUnmw==
X-Received: by 2002:a05:6a00:c8a:b0:82f:98c:1465 with SMTP id d2e1a72fcca58-82f8c8fb258mr26682792b3a.27.1776898118539;
        Wed, 22 Apr 2026 15:48:38 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec04448sm21836313b3a.55.2026.04.22.15.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 15:48:37 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Sudeep Holla
 <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Saravana Kannan <saravanak@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Ulf Hansson <ulfh@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Marek Vasut
 <marek.vasut+renesas@mailbox.org>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH/RFC 00/14] R-Car X5H Ironhide SCMI CPG/MDLC remapping
In-Reply-To: <cover.1776793163.git.geert+renesas@glider.be>
References: <cover.1776793163.git.geert+renesas@glider.be>
Date: Wed, 22 Apr 2026 15:48:37 -0700
Message-ID: <7hcxzqr4qi.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Geert Uytterhoeven <geert+renesas@glider.be> writes:

> 	Hi all,
>
> TL;DR:
>
>     Describe hardware in DT, and perform the mapping to SCMI in Linux.
>
> The Renesas R-Car X5H-based Ironhide board is the first Renesas
> SoC/board combination that implements the ARM System Control and
> Management Interface (SCMI).
>
> This means Linux can no longer perform various system operations (e.g.
> clock, power domain, and reset control) by accessing the hardware
> directly.  Instead, these operations are abstracted according to various
> SCMI sub-protocols, and Linux has to send messages to an SCMI-compliant
> firmware running on a System Control Processor (SCP).
> More specifically, the R-Car X5H SCP FW SCMI controls access to:
>   1. Core clocks and module clocks,
>   2. Module resets,
>   3. Power domains,

I'm very curious how power domain hierarchy is described on this SoC,
because one more issue to add to your list is that hierarchy cannot be
described for power domains in SCMI.

I know you're aware of it already, but just FYI for anyone else
exploring this space, I have a series[1] in-flight right now to address
this limitation of SCMI so that we can at least describe this hierarchy
in DT and the pmdomain framework.

Kevin

[1] https://lore.kernel.org/linux-pm/20260420-topic-lpm-pmdomain-child-ids-v3-0-c2c40bef238c@baylibre.com/

