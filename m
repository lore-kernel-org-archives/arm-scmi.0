Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE04A1D86DC
	for <arm-scmi@vger.kernel.org>; Tue, 19 Aug 2025 05:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755581453; cv=none; b=Qz0aUSRALG2RHpCZqjDLt6HBgzmh1jKz6N0An3srHs3UOBIxTw/9ysVlGbLv3zd7qtexyYxo1XwQcMcR1DQWX/bxCV+nZ0f9L3f8YmxwTRVuLaITWwbRokOc9Ub0JRHYPuEwjCJ505gAHFA5iPAvY7gpYNuR52jzCGuUfH7CYVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755581453; c=relaxed/simple;
	bh=oNuneXdZUlONgY1eNYoigbQuliKO+uoIkFsryOlJJn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n+VM1alq30l52YpWEM4wT17Udu4LZK6baxUboE7a6ys9WmFmdFB35APyHG+ADDp+6WSAK+tKfLY+o0NWtdS/ZSt2grWfm7fs5kyzsS13z1qoD8eRNYwIqlzSsxcKzay98eiZvBQUu6yHl4qtLnoDRhSuYChhvWDLAPcmpHFIitY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hnbZ3Fic; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hnbZ3Fic"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b4746fd4793so1469463a12.1
        for <arm-scmi@vger.kernel.org>; Mon, 18 Aug 2025 22:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755581451; x=1756186251; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NHADKkUG74H8DgiMJwyJ3n8CdyNUxQbiZqR+ru3KJ5g=;
        b=hnbZ3FicBWQkEZAt8mqK0GO8hIz5fuWZI+2XtjjQJsU+s8siymP4u9x+Kw2j4jsTsV
         XGpef7JJks/GdnRk2Y0Gfg/QBDTt1S/wnEFzsrKh4QDgfuD483t8Mfy2yo9cjEAkdwqI
         3ldddc0U6qxYys/0iXaxysfUZtR6TdZGVOl7DURwIc8qBPNnacSf1K4G5SB36hSrPh1t
         W3LsLyFCoh/Wb2cxNZWdA6YFPtUvYnPRpkHy94lpDX5HitlBdYwLlFFI3zUe+HMu9Hmf
         vdTCkJzxXtUVQhBFttkYEmxw3pNckby1XpUta9yUN4FsLk6FsTJhzAdCnAtBOL+vBtec
         B3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755581451; x=1756186251;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHADKkUG74H8DgiMJwyJ3n8CdyNUxQbiZqR+ru3KJ5g=;
        b=Lt/olvtvy/xqzPdjz9Rzbg9j5gjADHhWM5nTV1tib/R4pzhVWh6CYmDEhGXAip0TZf
         EDYxb/k/wuNlTb4Q9TWo4HntjR1IJsnNaHoe140ZYLkF6lKiLdott7Pi3O0b1Jr5JWRe
         xZ74QIIhrHknkK7U5uaWIZxoaVcSPbs2CXYV7n2PZthvwz5trunXcmyF9e7xVlVtgSMG
         F3JYi5fdDL4jiLgFEw1PQWz1GyeJSuMv2wiFexuN8DpTsi4kKDyM3rM1JYu4xdajndur
         r7YuFKJUibnKzgltV4BH6xSF0vB+EduQw2LNWMRo0f7nLid6MgDwk7GNIoT5aJKiaDGk
         tGdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRq9CFY29V045E/c/JQ+zy/JUpYxM7tjvasAoOpAqTXGwbOPi45yydiMaNA7mDWqxkG8oQLjjq4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYf/7VMYpFdhGEFiZwfAAHBsiu4mRyhlebgpFL5sGGYu2u+MkF
	nNYRbE8M3yPOFEdDINCNGKEy48BpUS5URH2JzPu8K84eGbOtcyTgmKXccmfbhpXSsEg=
X-Gm-Gg: ASbGncvWOmdXuRb81FK+QBXexp99ZfruSnbwzRWQnYuILDaycQZY4WvItqDnH+6kuR5
	4M+LocpCdZ32/ECaBBbCiVhNaLQoU2QnfDM/XdNWcs8k+M4KPCxVyDTdGU8wsVp+KpzlP57MsWR
	SEQFTDGsbt8iO64N6egZpZtY8fGSSUctyJeib5clOdyW26C5+801kjmbjNkkezgXwLGqPO4rKJx
	QjzrW1ZJdujdmjuaz1dJ0qAHi14PtB/NdFXckWgQx4MdLOblUOx26xCth0/tZHAfd/bK59KmjD2
	2MD2t6hkHcR/9SMeq/n5FEeaN3y/0Cj6FtBEFBMP0vuTB5USqwX/6mM9Y4pWubXBI9lp7ZkLga/
	iGyoNBZY9LreKMh+VE/lpZeUVsCV6CGhv2Z8=
X-Google-Smtp-Source: AGHT+IERt6oCE4RMNflHw7TCKFgdRx6IB0LQJLR9mIihyCp5VdPHl033jFifzhuL917Po4PZMKKnDg==
X-Received: by 2002:a17:903:290:b0:243:38d:b3c5 with SMTP id d9443c01a7336-245e04ca7bfmr18923145ad.47.1755581451291;
        Mon, 18 Aug 2025 22:30:51 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d50f55esm97139685ad.82.2025.08.18.22.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 22:30:50 -0700 (PDT)
Date: Tue, 19 Aug 2025 11:00:48 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Mike Tipton <quic_mdtipton@quicinc.com>,
	Peng Fan <peng.fan@nxp.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v3] cpufreq: scmi: Account for malformed DT in
 scmi_dev_used_by_cpus()
Message-ID: <20250819053048.t3dfmyu2xqd4ypef@vireshk-i7>
References: <20250818155048.551054-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818155048.551054-1-florian.fainelli@broadcom.com>

On 18-08-25, 08:50, Florian Fainelli wrote:
> Broadcom STB platforms were early adopters (2017) of the SCMI framework and as
> a result, not all deployed systems have a Device Tree entry where SCMI
> protocol 0x13 (PERFORMANCE) is declared as a clock provider, nor are the
> CPU Device Tree node(s) referencing protocol 0x13 as their clock
> provider. This was clarified in commit e11c480b6df1 ("dt-bindings:
> firmware: arm,scmi: Extend bindings for protocol@13") in 2023.
> 
> For those platforms, we allow the checks done by scmi_dev_used_by_cpus()
> to continue, and in the event of not having done an early return, we key
> off the documented compatible string and give them a pass to continue to
> use scmi-cpufreq.
> 
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> Fixes: 6c9bb8692272 ("cpufreq: scmi: Skip SCMI devices that aren't used by the CPUs")
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

Applied. Thanks.

-- 
viresh
