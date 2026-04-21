Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7BC3D6470
	for <arm-scmi@vger.kernel.org>; Tue, 21 Apr 2026 14:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776783474; cv=none; b=drQNFwPLPx8HOKXmeT5mbTZOFbLs3eKb7zS3q6aLE9Y6AxvnZsmADxCd9cPvWW8YGls67KfH6em1HflV6OMlthsKnXRuxBgCWXnUHr7be7+hCSQrE0PWglwWcYopLnBwY4CQ8Su88LESIbp/MP9lCXKf2qf6Qf49JNdRYJ/29NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776783474; c=relaxed/simple;
	bh=sI4tU695bTV6TvPOEAsLoW97lOBDjDwkIEx1VlCb8sU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OhWRuYHBUR1l+zOgpZMbnfEfIDsCeUOrUybv5+WduCLLeFTzqT8r8o8LJvqcQ12o9DTZudvnutruT24cMgKQ6MewL0Nk9X9U47ryTMgvtvW02K2GpVIVVot2ackRb5ObuuXXs0/9QaQtXL8wvvhmFBjGX+7z8JyU6qMpi2qABvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=NqmGB8xJ; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="NqmGB8xJ"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82f8bf96b46so2138955b3a.2
        for <arm-scmi@vger.kernel.org>; Tue, 21 Apr 2026 07:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776783472; x=1777388272; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5mjuJmdvwe7PzDVz8q3vHSG4MYXWlbBcdt3fOBIwOXE=;
        b=NqmGB8xJ5atxCZ6ANMHcZ7HWjhaOT3MghDb/266say1LCjumu2ASpVKA/Pxfo/Rm5e
         05qcXey7B4aDxUZazeYqcCzdSuZWfmwJoMGW5zH7lHuDCfuUk/Zu4ggFgGCGovFw0ViZ
         d6qn8KbDUlenmVvUQVFq9LetKA0Fqp1+Z/+UTi7PdBtS8RRt+sedLQss22HSnbvX8/+z
         YECJ30Ulk7L9QqlpbnANw4T3qTuM9ZDQvdvCiE+Tr72LUJ/zSXAE/iritYuuCX82OsNm
         SVlqAk1ypEtCF2TvfNHdKV8GnfBpH//mKlUHvWksvJ5MMMWtB8R3u2SHfS3zsExQOzQZ
         SY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776783472; x=1777388272;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5mjuJmdvwe7PzDVz8q3vHSG4MYXWlbBcdt3fOBIwOXE=;
        b=sEnNRAIV+zMV1CPo9Gi+z7pFSyc+oj6EXKePI7YPc1zBEvpiu4yUGYsUHxR6j7gTXc
         DOEeDRMm8KL0c5OAzQ3kKLI4Kc/unDPanoNU3obXbcePHWp9NNJoQhH2WEmGMjPlW6kQ
         8gi3C/RYxRWTvSn2Zncp0DRVAevq6Ldud91A7NdifnpQkrvWMnfY5DFsrluhHxBchxlL
         v3OH/Dfob7q9Ok/BlbPd5PYdmzaZAY4bj+4CEUtIT4rjQVdG5aiMo3nmbkbKaQSCtiC0
         CxSbFsC8wtZbeRH7MdrRRk3IhNgrNxuIN6uodXACHb8kKky7GZHF4pWWx7+4JbsQCpLS
         mBWA==
X-Forwarded-Encrypted: i=1; AFNElJ80/zKahfe+Ny3yyzoJwDAj1jDKQZ9XJdkHZ0Jx0fPC0dtAa9LUUPos8sqrzWUbEa8P/sGpf8hffg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmGIGTBD5y41nnwexRipttqeCfaTykqYzWh6ffQVqW0dWRshUh
	ChQMeXWYPAAvVI5JrUm6IG2EO5KowQFvvBGr2S51KfE3byJ0u2jwBk3OUJ5rj1bVJaw=
X-Gm-Gg: AeBDieszekqM+zSMeBzECWv6LzpyEX2BPw5zeCzlvWsmcHXvT3PfSBhXGCfOGSrpim5
	ARGENSPpML95wGO8HZcXH6P0jVHKKrq7xO9SPD04dqOK59EAWOTSALVyHjn3uuBhquekpLzday0
	HU/4EcBtPSqHebkdcgI7V1A0K8yL6xbvR0FI4q6EoGNnlSHd5g3H9Fq4GZZSNBLDe0WgaxhzSKE
	eEpaMhFrbzLhr9KnSD8PT08qhFDxZ18psufCh+6XysW1lAGkwjYMGZj3gY3Ht5kHj4L/3OykqFy
	00asdE01bjqmTZqCQN6Q0kIJMhHqHrqEd2Oy1/pFvbion8SP6fjh5V0aX8v9i1bQODGkh5PWMmd
	Fj5GhLZcHZuQVhA+oD4667NUVNQr4PfszICxNZZ7MS6p+KwjsjrgDIoOXg4dJQeznO2xYJjZJK9
	ntkBOksn9cY2yjtez5dIbSuQuoItxKiw==
X-Received: by 2002:a05:6a00:3c86:b0:81f:40e5:34c2 with SMTP id d2e1a72fcca58-82f8c8bee9dmr18805718b3a.32.1776783472262;
        Tue, 21 Apr 2026 07:57:52 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9819fesm14280551b3a.4.2026.04.21.07.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 07:57:51 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Rob Herring <robh@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: power: Add power-domains-child-ids
 property
In-Reply-To: <20260421134949.GA1045294-robh@kernel.org>
References: <20260420-topic-lpm-pmdomain-child-ids-v3-0-c2c40bef238c@baylibre.com>
 <20260420-topic-lpm-pmdomain-child-ids-v3-1-c2c40bef238c@baylibre.com>
 <20260421134949.GA1045294-robh@kernel.org>
Date: Tue, 21 Apr 2026 07:57:51 -0700
Message-ID: <7hh5p4qs28.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Rob Herring <robh@kernel.org> writes:

> On Mon, Apr 20, 2026 at 04:51:17PM -0700, Kevin Hilman (TI) wrote:
>> Add binding documentation for the new power-domains-child-ids property,
>> which works in conjunction with the existing power-domains property to
>> establish parent-child relationships between a multi-domain power domain
>> provider and external parent domains.
>> 
>> Each element in the uint32 array identifies the child domain
>> ID (index) within the provider that should be made a child domain of
>> the corresponding phandle entry in power-domains. The two arrays must
>> have the same number of elements.
>> 
>> Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
>
> Missing my Reviewed-by.

Oops, I thought I had grabbed it with b4, but I didn't.  Sorry.

Kevin
