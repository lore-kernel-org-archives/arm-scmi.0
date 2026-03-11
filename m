Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EFD3DCD87
	for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 11:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773229861; cv=none; b=Tc3Ay4sFyoKtbHJi/LNWMIJBKOQsBX9B26VfsO/vAEhaRnK0ZNVRE1xj6rwX+jplhIjlQVN0XYA8sf7mqpzzp5B/xfZZj/xBmXIiamMFS6qGrHwqEgDFlk78Nvg/3ajkeL3nrcipqV0Yp4NcisqSul9vfg62m4SeBB1LDimvbls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773229861; c=relaxed/simple;
	bh=Uecr21BaIjAMsFAUZnGkKoaoMnYN11yTcZleCmy3sho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S28wA98c8sFazZFV5966HrC4vrl7MZ+joCOz1k2USt0z0iwzNoQOwZaH8GrPJisrJ4HWe7FZoUEEXaJe5QuZvDacqy7/jGXZ4OS+JDc5oxuWQ/5psBZxPLA3WQMWrvuBOcuvPs7XrK6k7YApyJR2lU/qko3y9t5dzp5NXdmpFLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xytk/hOv; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xytk/hOv"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439b9b1900bso7585222f8f.1
        for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 04:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773229859; x=1773834659; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uecr21BaIjAMsFAUZnGkKoaoMnYN11yTcZleCmy3sho=;
        b=Xytk/hOvDF00hrRb0Yq/EusNd26162BrDBGz2sWnSbsSk/+p5rD5lLSiv2b7PY5urb
         OPxEL64A57Qp3tqmHx6KHpff3lWanqPqOt6l6tPBkP5HHBIgcF2r5XtAqpBxUd/dzQ9s
         j8O0AxVKizDNhSup3trigc0CmMRyu6gMGCNJG485cvPol3UbXCAo0qF7FNjwdwlXG9Jd
         FOJ0RNuKWnPNUOKDCH/SjsV9ui4Ashli+wXyhZGNS13kvud1uCiF6oc+va0QIjDnBv80
         2ufQgvlo4GMbOcKvzWmgaoot/MIUuD4DKlHSPgK0nLM5dT0nAerncHzQYGITENEwUbqH
         /CtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773229859; x=1773834659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uecr21BaIjAMsFAUZnGkKoaoMnYN11yTcZleCmy3sho=;
        b=fef3QPuBDwH/CIElzBbOcwEIK/IAoFT0n+r6xbdMUwsLqK5YRgdr6hiX7lfbBkZpM1
         L47miJPaZl42cmoMBUWeYa3AXDsFO3F9EwIv57EjX4tU/bTNM75pdUIm6vY5uFonU6P7
         U14iXy/T+DLGzNfsA3Z56qsMcTzTp38EITe4pemTvE2fq9ibeeigBHPra4Nlk6jvYMhO
         zm/RHnVORSEtG+6K82djaDUnU5P800+q1vEuAjxB/oPcUexGQO/GazJJVZmIhzzJJuYr
         ldGqpIx62sp7bzGe/nYtAkTiO7BRYxhDqAfQFbO0R5jwVF9CGWtOSOx70fd9gYKmSgTp
         FJbA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ9cbd3oWqxiKc9XFed0K72795HL6xOYLaVEo6t2QNisoF5Enw08oeiUUN9qbuSA+Zj0IMgA4D8g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs67QqCxkYZyYea157JWb5Xn2SCvPsEjuotNvI391qA5x68HmN
	oA5tGYp6EINDo6JjrFyQcOS6DNYEDhmlJeUgXTAOnWy6NWKKeUh2X4jj8hD/bUXRtOo=
X-Gm-Gg: ATEYQzx8d2T3wB25r3rhmKLsmIrRdEu+YmkPBxbo/fLq0OFO0tdzxZ5j5PFsZzH26t3
	Bfkc3wdAY5ACjgyy0AbHYgT4BEvKMXoJTNLAEx8rhX6DWnc2w6zPncXX1Hg+FRUag26r97Q1J4J
	vC5M+gqoMamxY4ZrXObAL3CEVBPTuUATxjpAwoty/INbwPm8hgZoEMGKGHA0X8uDkvRGSNPCyKr
	xDr5JJb2ivBRs8aqqLUm/HoTQQrq2c+TSkmjT2uqBvUL0JRm/bTMTg0HcqCu2y6ppeUkxau/52R
	am9qH8veqddPXXun8I9m5Oa9a3+n6VN8czfcMmULjtAg/S9NZu/pfbLrd2+zqU/x1emnqtVwE+l
	rtENbg31h+770M3PPXVjxjrJ7UKcfA69aRlhxyG60MXiDY2UusW+NUr+QtFG0pV8jmMzIBHMHXe
	uVqlgV32ADcyefMaAWYif+frylNgwlVUg=
X-Received: by 2002:adf:e94c:0:b0:439:cb77:aa6 with SMTP id ffacd0b85a97d-439f8222fa6mr3599215f8f.42.1773229858683;
        Wed, 11 Mar 2026 04:50:58 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f818d209sm5881724f8f.5.2026.03.11.04.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 04:50:58 -0700 (PDT)
Message-ID: <c7d47b6d-caf7-426b-944e-7debb7d69045@linaro.org>
Date: Wed, 11 Mar 2026 13:50:55 +0200
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] clk: add new flag CLK_ROUNDING_NOOP
To: Brian Masney <bmasney@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sudeep Holla <sudeep.holla@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andrea della Porta <andrea.porta@suse.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Bjorn Andersson <andersson@kernel.org>, Chanwoo Choi
 <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi!

On 3/9/26 4:38 PM, Brian Masney wrote:
> Note this series depends on 3 previously-posted patches in this git pull
> to Stephen for v7.1.
> https://lore.kernel.org/linux-clk/aZuK4-QJCXUeSxtL@redhat.com/

There's no tags/clk-remove-deprecated-apis-v7.1 on
https://github.com/masneyb/linux

Cheers,
ta
