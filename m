Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DA820C03A
	for <arm-scmi@vger.kernel.org>; Tue, 29 Oct 2024 10:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730198920; cv=none; b=JPrrh2jAeW4TMbmDgv483Si6VGudUCi1A9UDxNcP7Fd+7+fTyJXzkNECvrngeLNC894UKaeweRYW1YwGmdJA46ah3h3ir5Icv4f7K2RbYv4Wnairj1Upap4kQM4VEUnfdZrxjJ08h5iENjDpRmhYLKC4x1dgr47zwBpAgc3cpeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730198920; c=relaxed/simple;
	bh=Ef6rSGdcB4pNv+XMpkpVm3OXC1vH2qvCEhT5aPx0DlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LqrabHCMQx5h74tBW0kv7RLNw+SOXtv0MZNDNT6LAJUcAEs+fHLdLoRJ1nWFqo6f/FhUWfhKGgNj/VFTvZRbjhlpNP0r3lYP4TbWD7haW1TOgPV3+37chmCwvjffBupIzYxsq415woKqjE///Wu5DK1CHLbCOS2SbKoAmjK7uHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FtAmSWaf; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FtAmSWaf"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2e2eb9dde40so4219596a91.0
        for <arm-scmi@vger.kernel.org>; Tue, 29 Oct 2024 03:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730198918; x=1730803718; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vRrbPHfeegy8R64aDXV8yu/tytzXgWtCc/rMoTdaxjo=;
        b=FtAmSWafQDj9A7E3UvajxwdryWbIoFzT37Vv1V4+pnsF/mKgUfDcRyVbVmRhWHETNQ
         gTHjqaHKg/QCzp57HL57z4PC5BYqiAQQyGcafshYyQWc1kw1e3vZsxLDp2uEO72/iXxv
         dV3Xp5M+dB+Tqg99faPK6wt+nIptNseCebAbJoKBlPfVxzglqy1LgiFpwfjYiYlyKUWC
         5/tUQ7Av3QtUnaHVJZFBQuhL7MY0kNZmnX3L9gCex4qTBDoXckYBaVDQAYDVNAPKdu2Y
         yfS1vVG8s1Y3X9cTAsKMfnEOBu//DbOG5z5Rk2NoHdpiprDHWjztfW7P9HlYZZ74qWeH
         t8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730198918; x=1730803718;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vRrbPHfeegy8R64aDXV8yu/tytzXgWtCc/rMoTdaxjo=;
        b=b5eP9nxTVyUpQMeKTH5i7mjZjZKx0xadVCYL8+UORyvFPPrJCPF7aCz1WuBxiK1JCD
         hS060AP0FLOSY5AnYe/1OkSGxBm3SgwwpycWp0T78n5DQhi3fIqaDZKjnQ6tbfXuIgdW
         rQlrFWJyCmHNADc/Z+3Kf54XYvqmM9UUZea3jZ/vBtzRXLuqhB4hEfOWC2hWC6gUoQIe
         VhrMCnLS+ysL5+KzfvOCnkxc2VdU+BHhGvNEEs8t9yiXpWuj8LaR4DqxxnADw9QH7hl9
         8x1ClShkIaCClLDwox+573r9PXtwGCgnM/jiBJWWBRioDmHJuPkUgHUeFdgpfJzFFXD8
         tWxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTitQdqKP/qCgdhZKRYwvHUEdDwkfvYjEXFYU5ciMYsXjh3ma7bFJJ0G2sNooAUYKSXlXGoQYN+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1ELAHSq80C2qrsA4bxb2W1kIDvZpg4IHjdch9vDY5Xr8wWQO0
	ufp7a5wqZ9ax4RV13y2LK9bWgg373NEtAHArXoMAVMJJclK5Dx+GkiqsrV5ZzogoYARHqHle73w
	oBUYwduuy4/Q1hgfbyeim89ZkctOurF5ZrZia6Q==
X-Google-Smtp-Source: AGHT+IGU8LlTOUW3W1myGoYMFOEjvi950LwtiXf0pbNMAYAIGL7Mlkl72qQyFpYACYrgfwbakwUSyQeSO0LIXxh4K1o=
X-Received: by 2002:a17:90b:4c8d:b0:2e2:c40c:6e8a with SMTP id
 98e67ed59e1d1-2e8f11abed7mr12757295a91.26.1730198918003; Tue, 29 Oct 2024
 03:48:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c5fdc171-0dc7-4c38-88e7-fcf9de7cbec2@stanley.mountain>
 <ZyCuAKfqRnuFdAwC@pluto> <CAKfTPtA4VwUhiuwm7u-tm=iLFE3m365+-Z84tg6hAse3oMkxMg@mail.gmail.com>
 <ba9cb437-43e4-415d-853b-7847d091c512@stanley.mountain>
In-Reply-To: <ba9cb437-43e4-415d-853b-7847d091c512@stanley.mountain>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 29 Oct 2024 11:48:26 +0100
Message-ID: <CAKfTPtCMR6QC8kBARjnRM35mGZP882RqmykCyqrA7gXsfAXXmw@mail.gmail.com>
Subject: Re: Question about identifiers
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, girish.pathak@arm.com, 
	arm-scmi@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Souvik.Chakravarty@arm.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Oct 2024 at 11:30, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> No, no.  I've implemented that.  It's just that I had just implemented unique
> IDs for everything instead of 0 - nr_pins, 0 - nr_groups, and 0 - nr_funcs.
> This makes it easier.
>
> What I wasn't sure, was how to add the SCMI identifier to the device tree.  If I
> want the 5th function to handle blinking lights, I think it works like this:
>
>         firmware {
>                 scmi-vio-backend {
>                         compatible = "arm,scmi-virtio";
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>
>                         scmi_clk0: protocol@14 {
>                                 reg = <0x14>;
>                                 #clock-cells = <1>;
>                         };
>
>                         scmi_pinctrl: protocol@19 {
>                                 reg = <0x19>;
>                                 scmi_gpio: gpio {
>                                         compatible = "pin-control-gpio";
>                                         gpio-controller;
>                                         #gpio-cells = <2>;
>                                 };
>                         };
>
>                 };
>
>                 leds {
>                         compatible = "gpio-leds";
>
>                         led@5 {
>                             ^
> This means the SCMI identifier?
>                                 label = "blink-led";
>                                 gpios = <&scmi_gpio 0 0>;
                                                      ^
Doesn't this 0 mean SCMI function(-gpio) id 0 ?

>                                 default-state = "on";
>                                 linux,default-trigger = "heartbeat";
>                         };
>                 };
>         };
>
> Let me re-work my test program using the correct numbering scheme and then I can
> test that.
>
> regards,
> dan carpenter
>
