Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6573BB9F8
	for <arm-scmi@vger.kernel.org>; Mon, 11 May 2026 10:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778497030; cv=pass; b=JD+NxYKNwKF/TSYDTAprClS4de19JM4434yPmcLzy7k1uuteS49PZb6d0WUZENFaSeZEJQMj42vXSV2XM8VSkwqT9Bf63Tk1W5HUIKO6Fi9NPtADASkUVHKlu9bJgEnAVVsg/k17MXPCuZXnq6FaMdcx6ccAdrickpa1HJSTTGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778497030; c=relaxed/simple;
	bh=vTJLEVLprN0YEUXOPQmVZfla90xDkYrYmcqtfv4q/AU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hgwZvO+Ky6ilEFLiMy47YIbXDwntGuH2HXxvubzrcDoSFOHaFSW7Oq3vkJwa1rixqrjLehNwoBCK9SKWWYxubN6ahyuZ/7CLKRxtPJKQjdDgc1gf+BkX52XeVnQ894zPFRQHZBJVEoOGpiWiwsQ4Z2lFWU7Ho/gGQaCwNS5PKxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UeSDOZ5e; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UeSDOZ5e"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a40502e63bso3685675e87.0
        for <arm-scmi@vger.kernel.org>; Mon, 11 May 2026 03:57:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778497027; cv=none;
        d=google.com; s=arc-20240605;
        b=O6S2bctj7GTnCJ/jwQAY6ZfOcXvG3pa57kewDtdEg3j3nlEutkiSkXhGh0b+gb47Fi
         bOJEdq+45uSOY8IeKqHXPH7OZWbxpMzXQMOLp13AsdFYYoJ6DkLaVCQS06Yfb8z8ZVlC
         r4f3al7mldY/OMMfukFz6H4g0INCQaGb90tjhfEt9PLWs8I6A/WFD/+rj+hLqbaSEjNu
         P8x8+hrXEydL06dJ6rmW6/fhENlO6MXTJkVn3HTwbNO8T255Op9/p6QeXELEhAiA221X
         PQJ6GvyXTQ5Xa9zZ2jLJSswcWg3o3kvk0c8NJHBVq6YMl28XfalfdW3G2yjqFd/em/Tm
         GYtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UNgY87VaqJb6Z7Z0eDu16xO5cNHcZbmgVwEFK0s2B6M=;
        fh=ZT5nl936WGpNUnc2YjoR4CUKzoHUb17nhSztX/tM1h0=;
        b=JsbhcbVOuzc2TxHrZ/0Ag+LdfsUGEiaJcGNyaAiJ4kaz0cdSk3I7RXpL3V/nm+Zj65
         izmUW3Ok1k8kJu2QOlI8brA4EyT1Em+niF4IRr5vNGRbPtpEgR3Rpzf1YGx/sTF92sdJ
         eRzFDPFqOiSo0fVbG1Oi2PziQA+rf/fnkDTgj9mvsuEjlYL8kvwVEJ06s7v5B3g/5fyp
         pTV7zqsDLd1mkx6opUUIzQ+dRT0qtc7DcLGkyX6eyRTMMcDuhObuZFyC+BRReIJmLWaT
         dKrgKj+zlpXqZb2hy9Yx2vD9iWU6jimEC4SxlC7rtaHyut9+/vFdvntQ+miRY4zc5tWr
         SKBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778497027; x=1779101827; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UNgY87VaqJb6Z7Z0eDu16xO5cNHcZbmgVwEFK0s2B6M=;
        b=UeSDOZ5eeT/pq5FepKDmyABTPObEM6q5ig+jAD4OkOLjS6W2CrM/eZJqLA3GguC7RR
         8sLFvgbFYZ/E1DVTxkA+8JEVKVLhi/gvNKeVcduidmJ7uGlgk8dy3T3K2Dgf6xz3alcz
         370NvSkutIyKaEOMcBuJ7MjOyGMuVtoABjkUiEGz4EyoJ/YdSOVancm0s2hqneqwm4Hq
         qC/ojsoiYOYfALGSaIyUGHZZvI0U/7jCsZjkk0luHT+7KWq4vOnAZ/esNVmie95+Dd7T
         FANeuoXsGYdEmP5JkB/cDIRd1Hxq2WdsjseAQ5tmnmRrN4wneWRbxGHjgvMFbNjzMc1e
         RfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497027; x=1779101827;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNgY87VaqJb6Z7Z0eDu16xO5cNHcZbmgVwEFK0s2B6M=;
        b=DkjswckK9t7bWbKaybEg668ukfqZHsticslotgvgiBy3eDAszwn2IbQ2MPLvyJ+ooi
         +YZsgbjoqOYPLoo+/C6kCbWTq11SqlyjFzOwlYlAByGQB9iEowBxaW2UYb82rAaHrySz
         ezLdMFKvYrUN1BOJaS7Sgnz72s1vrW/dg9hbNesBHPpi4HVqQLnvOFUdv1btdHRfxzUG
         OEv3/7pJUdiWPlLHTavfxWYSGCIVl/HI6e6j52j3pRiClGRaPPM+qmPaYRDTxUj6mwMX
         11P/1tiTE2EdcxdosnO8NPYVJqY4oYQjbuH15NpM3Psfzsl9mz7l1PbgAquU9m+eTCI0
         l9Ug==
X-Forwarded-Encrypted: i=1; AFNElJ9Q1MFAUoPDk8rNmHbBYAXJfph/0GQLKHXS+MqnD/qyIGFf0xCKFw8xYH3a/GxIuK+l0cB6hupG8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpcbQWrPlPGoRyfq49jYSh/OeWmngu9V14s0+/Ip5N4vNiGYYh
	7FPfhlwv2ly2sCPLNBuEUmZyEJ0QvEu2sxH1V6ZbrK9lPKwjM3hsmOQSp1OiJBgdquiAwlIyVeg
	2VewKLG2TZZNezwHL+Pu4ViKC3BlfQH0taMetZRfRpQ==
X-Gm-Gg: Acq92OHlxi09qrSkxmqCfG7h3t0g6PhDkENRZZVIc93bICFGFUVlQgywyW3hlsJ4pX8
	EXAc8EfwwsGKbTL4nNSYpg+J6JQfUhwQRd2oxzs8wiSPqwvIYkJepwH84oy98bHVV2f4prj2dGU
	Xy3kDmBwMDGwYiF07NUtw5nXyFVXxpzmRsIm3w9GCqyCVlD7tZTGfp/521Rv4E+FcEJOivFHCOr
	JJ/9mrLqpg7h1+JdICE68BXObevNsaYADNB6i1QlmWpzyxN1MwpT49jNWQXSsWd5TzxS4z9DZK+
	x8A/I9AoaDXutuPLx0mbuVzH4Ghxlw==
X-Received: by 2002:a05:6512:3b97:b0:5a8:837b:3d62 with SMTP id
 2adb3069b0e04-5a887ae201amr7135423e87.9.1778497027226; Mon, 11 May 2026
 03:57:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-topic-lpm-pmdomain-child-ids-v3-0-c2c40bef238c@baylibre.com>
In-Reply-To: <20260420-topic-lpm-pmdomain-child-ids-v3-0-c2c40bef238c@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 11 May 2026 12:56:30 +0200
X-Gm-Features: AVHnY4K5Fa8XIOuKEc9fwP0nNsU7-2i8Jr2vSBdRJyGo1uaG2J7xzeVbIFlyyOo
Message-ID: <CAPDyKFr4TdLP825VrpC+gELKOnHHFK=oZ7x8HWQaKFox8Ur0Tg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] pmdomain: core: add support for domain hierarchies
 in DT
To: "Kevin Hilman (TI)" <khilman@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Apr 2026 at 01:51, Kevin Hilman (TI) <khilman@baylibre.com> wrote:
>
> Currently, PM domains can only support hierarchy for simple
> providers (e.g. ones with #power-domain-cells = 0).
>
> Add support for oncell providers as well by adding a new property
> `power-domains-child-ids` to describe the parent/child relationship.
>
> Also adds the first user of the new API: the Arm SCMI PM domain driver.
>
> Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
> ---
> Changes in v3:
> - cleanup return codes for add_child_ids()
>   - < 0: error
>   - zero means no child domains present
>   - > 0: number of child domains added
> - arm_scmi: adopt to new return codes (only <0 is an error)
> - Link to v2: https://patch.msgid.link/20260410-topic-lpm-pmdomain-child-ids-v2-0-83396e4b5f8b@baylibre.com

The v3 series applied for next, thanks!

Kind regards
Uffe

>
> Changes compared to initial RFC[2]
> - dropped RFC
> - rewrote the parse/add function to use iterators/helpers from of.h
> - add a remove function for cleanup
> - use child domain language instead of subdomain
>
> This idea was previously discussed on the arm-scmi mailing list[1]
> where this approach was proposed by Ulf, and then an initial RFC[2]
> implementation was made.  From there, it was suggested by Rob[3] to
> use a nexus node map instead, which led to several more versions
> attempting to implement that, culminating in v5[4], where Rob and
> Geert then had second thoughts about the power-domain-map approach.
>
> Therefore, I've gone back to the approach in the initial RFC[2] to use
> the child-ids approach.
>
> [1] https://lore.kernel.org/arm-scmi/CAPDyKFo_P129sVirHHYjOQT+QUmpymcRJme9obzKJeRgO7B-1A@mail.gmail.com/
> [2] https://lore.kernel.org/all/20250528-pmdomain-hierarchy-onecell-v1-1-851780700c68@baylibre.com/
> [3] https://lore.kernel.org/all/20250528203532.GA704342-robh@kernel.org/
> [4] https://lore.kernel.org/r/20260122-pmdomain-hierarchy-onecell-v5-0-76855ec856bd@baylibre.com
>
> Changes in v2:
> - dt-bindings: fix warinings from make dt_binding_check
> - scmi_pm_domain: switch to dev_err()
> - pmdomain: core: fix locking around add/remove domains
> - pmdomain: error unwind if any children fail to be added
> - pmdomain: fix node reference leak
> - pmdomain: ensure power-domains and child-ids properties are same
>   length before iterating
> - Link to v1: https://patch.msgid.link/20260310-topic-lpm-pmdomain-child-ids-v1-0-5361687a18ff@baylibre.com
>
> ---
> Kevin Hilman (TI) (3):
>       dt-bindings: power: Add power-domains-child-ids property
>       pmdomain: core: add support for power-domains-child-ids
>       pmdomain: arm_scmi: add support for domain hierarchies
>
>  Documentation/devicetree/bindings/power/power-domain.yaml |  34 ++++++++++++++++++++++++++++++++++
>  drivers/pmdomain/arm/scmi_pm_domain.c                     |  14 +++++++++++++-
>  drivers/pmdomain/core.c                                   | 167 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/pm_domain.h                                 |  16 ++++++++++++++++
>  4 files changed, 230 insertions(+), 1 deletion(-)
> ---
> base-commit: f7b88edb52c8dd01b7e576390d658ae6eef0e134
> change-id: 20260310-topic-lpm-pmdomain-child-ids-e3d57ae57040
>
> Best regards,
> --
> Kevin Hilman (TI) <khilman@baylibre.com>
>
