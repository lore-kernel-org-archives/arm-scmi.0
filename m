Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389AE2F43
	for <arm-scmi@vger.kernel.org>; Tue,  8 Apr 2025 00:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744071803; cv=none; b=tIFKvn1B2W41RJuZFXrQ2JyW1N+ohGSYYpAACX4gGxRW2a2by25ZK0wrRRfpNWDnKXSbNf5vBpS8/L2DNCIGSagyr7b1sSGs8VBhbRg0csH4wsMS7D3xGeDOwRKpKTv+ippcL1qzwSctSprYRmArx0FWUK69ubQwcLveyPUE3QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744071803; c=relaxed/simple;
	bh=ouIomqyx/7LCKmpY4hDD5EkkxS9+SnX8cGowOWWEpk0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=h1/ELJUUsBfNdj791b0YD2aJyYj9vLwf/C4r79kEOZUJDaEfO5K1TQusdNUtzfV9Co7otpNR+mhOijjWonpJGwmnhXAZh6wyzLR4jaME+LjjA7cNWoWvADuWPFFfnv0QnzEFZPrHUf2uv+P3q3+EbujNB6+Qn5zLB3i06OSTCeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22548a28d0cso68479545ad.3
        for <arm-scmi@vger.kernel.org>; Mon, 07 Apr 2025 17:23:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744071798; x=1744676598;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XbhOTi4aXW0WOqTc6xfbySmStx3aI/FhVLl8UDRj7Sc=;
        b=NHt5XDMguJwN3DfoeLy2KIcTEmvnP4gwtwCS7DfYVLKYoKGbIICZBg3OGjaTG8Hyhc
         HlHHsK9rsqh4GFe9At257nxknO5K+rCdwF4x+U5hRVPoapygGtJneJebQnv1whtUR1kQ
         4VZO7hwuE8lS2sBqdcSPpTkAQku09VGt1KyB4NPrElGu3iM+nxz87rEOuoxvbRhU1d/K
         GIAogYm6nzN/+K2VZHj/uKo7EzQNfAJz1kywPRfHnD9VI+rH/GYsbGnd7R9NdG2H5cMy
         mRK51DmjDe95IBCMQiaudfS70WsxzW50BAvPuV8GASNT/Ty92XICskcazBB+ijqcd/T6
         SQAA==
X-Forwarded-Encrypted: i=1; AJvYcCVobfCcrrDqVV9RhrXHW5C8d1KBHomBiq7SYuavSesHdD3ucwDxSXvCdxOB/oP4J/x6gG3tDYA8ag==@vger.kernel.org
X-Gm-Message-State: AOJu0YwINiH9YPAAyZdnXuwH5Mc3Vtd//W/vYwEH5qxusHlRVDGBahP2
	aouPQLMnoFtE+OWoRQz8jcOoAI8/HC10ljzpF07jZ3iLphivdrvaS/McSctRH9c=
X-Gm-Gg: ASbGncsgw3EpzrGzhI5fkhKqTSWCwcmsvfKz5fr2SfGmAKt8nnHkhqnSt5+FAzrzD1b
	vpXiPgzICTs3bG1ajy0/TM1C85airkJrmaLXySZMJ2Z3Wnr6Sox1Z41JSARvtfJ+LF/kJfUl8Ig
	Ek4GQBIDxeBga8R9KsmoXkt2pvv69HwXAptRDiYgCx/6aLNGN+hyTtCDsoc/At2/nUCf1n3Dz6s
	4iGOv6DPUZIsZ6dcXgBRz3urp+oUO69F0HF1fUAuRVvLhDrk8guqdupsiNzsIGhIOUHdkMZ78Dk
	G1oruwza1kYys7DNae5NHvJCoLIgBjAu6gy4CS5KbO0=
X-Google-Smtp-Source: AGHT+IEfbVpQr7n3Rek4JwLzMB1Jhs0NtY0BLMo+44//Fm0/Ybd/+gL88i1Pnk/RYLQd2OQ5PIwp4Q==
X-Received: by 2002:a17:903:3c44:b0:223:4b88:780f with SMTP id d9443c01a7336-22a8a85bd97mr202207985ad.17.1744071798463;
        Mon, 07 Apr 2025 17:23:18 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229787776adsm87876715ad.247.2025.04.07.17.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 17:23:17 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Souvik Chakravarty <souvik.chakravarty@arm.com>, Peng Fan
 <peng.fan@oss.nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>, Vincent
 Guittot <vincent.guittot@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Peng Fan <peng.fan@nxp.com>,
 "cristian.marussi@arm.com" <cristian.marussi@arm.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, "arm-scmi@vger.kernel.org"
 <arm-scmi@vger.kernel.org>, Chuck Cannon <chuck.cannon@nxp.com>
Subject: Re: POWER_DOMAIN_ATTRIBUTES in SCMI
In-Reply-To: <81580b24-e11c-40c4-a709-5ad0feab8841@arm.com>
References: <PAXPR04MB8459E8D1A82DE43C08B6C26788FE2@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z7Rjyy7_Jg66vqCf@bogus> <20250218130823.GA17099@nxa18884-linux>
 <CAKfTPtBd14wM2st62m3tnkQOZgBTUmxpjZXghMVff-Yg7wCVDg@mail.gmail.com>
 <CAPDyKFq9QHw==2WqcThC5mjMy8ALqmZ_hKxt2QsZJ1q-qixLfA@mail.gmail.com>
 <20250218163146.GB15753@nxa18884-linux>
 <Z7aZPt5a0P53VL1N@NXL53680.wbi.nxp.com>
 <81580b24-e11c-40c4-a709-5ad0feab8841@arm.com>
Date: Mon, 07 Apr 2025 17:23:17 -0700
Message-ID: <7h7c3vh56y.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Souvik Chakravarty <souvik.chakravarty@arm.com> writes:

> Some quick thoughts below to keep this architecturally consistent.

[...]

> There are 2 ways to wakeup a device:
> a) The device is powered by one or more PDs, one or more of which needs
> to be kept ON to trigger the wakeup.
> b) The device is powered by one or more PDs, but none of them are
> required to trigger a wakeup. The device wake is derived from an out of
> band logic which is kept powered ON (either transparently to OS, or via
> another PD which does NOT belong to the device).

In the case of TI SoCs, it's (b).  In fact, most of the IO pads on the
SoC can be enabled as wakeup capable when the SoC hits certain low-power
states.  The bits to control this are part of the pinctrl settings for
the each driver on these SoCs.  So technically it's neither the device
nor its power domain that cause the wakeup, but the external pad, aided
by some dedicated, always-on hardware, called "IO daisy chain" in the TI
documentation[1].

Kevin

[1] c.f Section 6.2.3.11 I/O Power Management and Daisy Chaining
    in the AM62L TRM for b bit more details: https://www.ti.com/lit/pdf/sprujb4




