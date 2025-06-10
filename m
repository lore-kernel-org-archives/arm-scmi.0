Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5988F281363
	for <arm-scmi@vger.kernel.org>; Tue, 10 Jun 2025 08:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543837; cv=none; b=taFanufCQcw2L5LCSKgM4l4FcVMTr5LLqTySc5+FKvT6BuG7EL0Zl3hd0XulFE8ojTq9cQbRZQh4uRPsdtSgpTVF4YxzvPDLJRgMImSbMcING8GfCPFRkAJgz2TandO8P250JJ35DhkwX+kKyBumdzGwc1c60uOf5TjkKXrn7PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543837; c=relaxed/simple;
	bh=e9oAcL+CeR+1HIUcEmYkknHTxdEGJkaFAv1VpnSfaS4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cKboBoDyWGpDAw8GJ3KS3eTX2smHJxQkjRsBCImAWoa4ctroMlxz4/yFs79YS9AsKZAnepQaFzZWkupR8EvUGIppst/SERbUnEj89D2WxDifM4xw8Z7Yadk4K/0trsXzQ/tYsySO/FdBmsIEJKtcd6EHLpPpmjZesdgjzFv490w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uKOm1U0B; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uKOm1U0B"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a52878d37aso865488f8f.2
        for <arm-scmi@vger.kernel.org>; Tue, 10 Jun 2025 01:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749543833; x=1750148633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DBxAXQ4og37PvO96w1vWDExmrp8j/q8vrTsgZLWvYOs=;
        b=uKOm1U0BWkslc8N/6Xqn/4N7/Codl0yzQT6P3p+Ms1hRTgnJ0s/FlGKj1OdtPOFJyg
         1Jc56yyGh350Wz7qkuDulN7TdbcMSU0DyebttwLuuvg/12br+LoTF1ZcMHV7idgC04xD
         5Zq5CLQwzv6Q1ex1KYaHYMOn6W7EMaJgGN5vBXUQzXB0PRfuCxlDBAihw9IxM/807Rpw
         G+il0BFaTA7nsp867EGcUDfwwcdCquOAypGIoeeL4Aocd4EqAES1/wf7UnFTJA4x5nJv
         7yQUtLVbBRxyP7E6LzuOmJ0AxFQqozsd6Oyqv6jiW7+k/tXN8ktk7AoD3IkSik3ebboW
         jUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543833; x=1750148633;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DBxAXQ4og37PvO96w1vWDExmrp8j/q8vrTsgZLWvYOs=;
        b=RkwGVQQak6zszFqTBg0CwVpX/dLW6WPV75pkA7lZ0Fb2SYckmQunBho7X+xlNAPQKK
         CJ4V5IcEmY8zMiXzkTN4ORVVK5tXk+QRVQXtcrdVKT13vEYDtx3Awk3jN4Zf26hIZSUk
         k+zX+NF+RtNQJYDElT+rLWs1bUc6h1MzHlf4EaDPrXWXgT7VQslaJvyKQ6VscD6XX3RB
         CPQzSl24hQ4mP8hCKy1ab4/YzBiPSIjNWO1atFBd7s0JZ07b53WCW/ZZ0AopYxBVDHuQ
         RElBAUKCd57Wsl/UWSJCwWtbvu/G/anyseLocLgjeyDFvJWZ6ZZEHGBAfVS/PEdE0PfX
         3kOA==
X-Forwarded-Encrypted: i=1; AJvYcCUnroYeIe1Q77iH+GzU1bQTdi1V58P+HtEbWpgxK6xdXkk+MpkqeX1sYqmRF1gv12/Z7RAFAlRyLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMxWq14yJ2Mi5ffGcO4Baxgbq6NXned2Gbn5nXs2BBUKdxXspg
	WSLK8Lz4tVbgoS6YZZeppYGVgyn0Y/wKQTx3S5k4EnyZw832d676Hd+1TvLYrY0PTx4=
X-Gm-Gg: ASbGncvawErWD6fgM9mU4ISyEnkPhSTrCUhz5YPuw9snaTy74wbiSQSQbZDAjXXlP38
	NbWAA4qSMMacOWW1b36wqYJqxJJnS7cQFYMnfbKr9PmCHGYhuNNl43Fmd0yLmFNLRFMrpUIPk7i
	wcUPo3sgnNwBiwEROvqbYXw8jnsZlVaMxuYVv4NFfVdV3emvioxiVNLdfqyZCHZWisFBxoxvtLo
	msuRriau5CAHYNYnyhHeO0g/8gdjIv82uFLWanb1Oaplg0ocjLOu3Er4VfehAoLci1euCLCBV7V
	LoGCR6leBV9UuclGeu3QBygEBms0PjVBVdOrT74ror8MvX3Z7T6759eAIuiMsJ67mcbt8AYGCko
	OVYxk0Q==
X-Google-Smtp-Source: AGHT+IFLwwa37CYbsr1MbKfJxcmnYwF2LSIesmoDBnoKTLnOhdfLiZoIbrImjdVOaLG8nyFXNzvzeA==
X-Received: by 2002:a05:6000:4020:b0:3a4:e0ad:9aa5 with SMTP id ffacd0b85a97d-3a5331930e0mr4884181f8f.11.1749543833624;
        Tue, 10 Jun 2025 01:23:53 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532450b08sm11378980f8f.80.2025.06.10.01.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:23:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 arm-scmi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250606-acpm-timeout-v2-1-306b1aa07a6c@linaro.org>
References: <20250606-acpm-timeout-v2-1-306b1aa07a6c@linaro.org>
Subject: Re: [PATCH v2] firmware: exynos-acpm: fix timeouts on xfers
 handling
Message-Id: <174954383237.117835.15219836024392160650.b4-ty@linaro.org>
Date: Tue, 10 Jun 2025 10:23:52 +0200
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 06 Jun 2025 10:45:37 +0000, Tudor Ambarus wrote:
> The mailbox framework has a single inflight request at a time. If
> a request is sent while another is still active, it will be queued
> to the mailbox core ring buffer.
> 
> ACPM protocol did not serialize the calls to the mailbox subsystem so we
> could start the timeout ticks in parallel for multiple requests, while
> just one was being inflight.
> 
> [...]

Applied, thanks!

[1/1] firmware: exynos-acpm: fix timeouts on xfers handling
      https://git.kernel.org/krzk/linux/c/8d2c2fa2209e83d0eb10f7330d8a0bbdc1df32ff

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

