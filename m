Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27374524C
	for <arm-scmi@vger.kernel.org>; Mon, 27 Jan 2025 03:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737948761; cv=none; b=bZ/ttFhd/AjFI3SGYiysRGZ9vl282dODjoyFAjtb4e3ES0w8Mw0jPmHeVZ5fCOS9GV9aEA/WDSfSNa4x+RSLskfYS7p4AwWuBPDfTLk+xwss2I5uPTCDoO/z97Sf9vl6zEoGQnk6k+y60V7SWNR6Mr0XnDMtFKONzfxLk8CbWpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737948761; c=relaxed/simple;
	bh=YiJT9WQLqKtxa/sdK0/rOM1AOUebCQeiyhpJpoFR/Tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r4z/pbnf6Vek+Jqa3Yhw4EW4d3NGHRcSTDkoAF6MhgxdAPNf7XlzKuBLI9OaTt9aPoEet31V2jJhUCwi2bLcl7XlWpjVzhcaNvKogddarJCCQQ351ogMWWcRyqV5kp7qtQbfx4WUck/6sknYqxrUdovGR/cgJ/jQPzCSZ9rUMuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZAqet0LH; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZAqet0LH"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21670dce0a7so81606185ad.1
        for <arm-scmi@vger.kernel.org>; Sun, 26 Jan 2025 19:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737948759; x=1738553559; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HSKBdkcHUpmfLPk161Kn0rx+ur3BhotIfl5VOt/amok=;
        b=ZAqet0LHUa30eTqQWmMJWS5o7pqk7XjmbInvdfASe7jTIVmT9RUUZdlfn7AuizIocN
         aw3r9b98/WxEepu6sn8rtapuPvIPTElvnLCh88Q3VE1GuFXFlweA/vm46e7ye17k+nlP
         dDsf2GV1zccoJ952/ojgRt6JW34ce3yD0ewoBKgUv9lQS1VTE7McUY+RfkT4BcS3e2TR
         qX8MEykYK3h67TVidyyBeks8Tt65sJ+9B7ilPoUNG6g9UTPdc5QRG3X1BnyiXlEi6I6Z
         VpmNWvZFs8o4+ndeDosKRiTpf1OkiOr3kj4IYOo2ffxWTzovxRiqWiQW2zxjlHfwUJzF
         c0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737948759; x=1738553559;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HSKBdkcHUpmfLPk161Kn0rx+ur3BhotIfl5VOt/amok=;
        b=aibIaLj4l79n54PeEmxM62IYvO68OGyiNTuK2X+82ujMpiTaeRTwc86pCoHO6ad5rj
         Ha57M6mi1J0uF28zB6zVy46V0qk3qx7VN+8AxU52t8/ovbfRwFC79wU0umJ4x6ha427w
         4klCy4D7N6fAm/nDU1kZyp8DAM4uBpel1d3EYPtZO71MMHL/ZnL1wSJTkxmYjkB/CcMI
         +gg7CI5ly8q1g1vnb2wS/7cMijaBI8uVenJOAx94eYfJmbgFkR8Fk4Da5RXtIbjagPsA
         8uf5atb7FGqrNTl/EWMnpLrx5LrbwFjzWMfpzZ2WBQ1xzmGzrGucF2+uWaK4mJKXZ1jd
         4GBA==
X-Forwarded-Encrypted: i=1; AJvYcCWvVSUri10+XgjOc5vD7GM4FhYqOAnWY7EaZbaYYnMh/iM9lfq7VHmP9qUFQafFyG1+rNUaKlJd9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf48GMq2PVXWgeRrNskWaLbsbee4mHlvQhP/EDQEKgtCZMmKgB
	0gckyfjWtVZBvyw8z+0W+s+8xL2K3qJXnsfyRxGJh/GEtAcniJPbash0e3AE9Tc=
X-Gm-Gg: ASbGnctg6Qbq3vWbQ16pTN5mMO8sEQrGYUfcQlmwAXRz+UqHt5a9iiV2Cfh0KFYHNkN
	m21FeAjq7duvqltSkiO/SbtJ9D0Q6ompZMPiDgh6rb0H7Ekn94N0CQ1zIsAXmNoFF6xgMUZsye7
	vIVrLg3mcSDox3i85EyZU2fnvZx5S6xmXgO/sc7NTOZ7hscUrC4j9RTsBYk492NRGMoEEzsgWHw
	ZCbR0q8YMLlrHWDFrWvD8kLLITjR/M793tc+ifvO9HCMO/MmrlCGSE9a/u99mmrUIGgcwE39q5C
	yX39BeI=
X-Google-Smtp-Source: AGHT+IHvgBNK3NhwKI9n5fMBriq7FLdQFhDFQyHQaZNGZxzhpW+eaG60WMmG2z8DBaIbsP1G1cn9Zg==
X-Received: by 2002:a05:6a20:728d:b0:1db:eead:c588 with SMTP id adf61e73a8af0-1eb215ec4b9mr65731325637.29.1737948759394;
        Sun, 26 Jan 2025 19:32:39 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ac496bbd01esm5342591a12.71.2025.01.26.19.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 19:32:38 -0800 (PST)
Date: Mon, 27 Jan 2025 09:02:28 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Hector Martin <marcan@marcan.st>,
	Huacai Chen <chenhuacai@kernel.org>, Huang Rui <ray.huang@amd.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Perry Yuan <perry.yuan@amd.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sven Peter <sven@svenpeter.dev>, WANG Xuerui <kernel@xen0n.name>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Lifeng Zheng <zhenglifeng1@huawei.com>, arm-scmi@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev
Subject: Re: [PATCH 00/15] cpufreq: simplify boost handling
Message-ID: <20250127033228.abeqhrxoprqw5b4e@vireshk-i7>
References: <cover.1737707712.git.viresh.kumar@linaro.org>
 <CAJZ5v0jYSZQKkLN-TO_h0AazhHZtHgpavTnnAscLPYLmjX3LaA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0jYSZQKkLN-TO_h0AazhHZtHgpavTnnAscLPYLmjX3LaA@mail.gmail.com>

On 24-01-25, 12:05, Rafael J. Wysocki wrote:
> On Fri, Jan 24, 2025 at 9:58 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > Hello,
> >
> > The boost feature can be controlled at two levels currently, driver
> > level (applies to all policies) and per-policy.
> >
> > Currently most of the drivers enables driver level boost support from the
> > per-policy ->init() callback, which isn't really efficient as that gets called
> > for each policy and then there is online/offline path too where this gets done
> > unnecessarily.
> >
> > Also it is possible to have a scenario where not all cpufreq policies support
> > boost frequencies. And letting sysfs (or other parts of the kernel) enable boost
> > feature for that policy isn't correct.
> >
> > Simplify and cleanup handling of boost to solve these issues.
> 
> I guess this depends on the previous series?

Yes my series and the boost related patches in your tree.

-- 
viresh
