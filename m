Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE049346FDB
	for <arm-scmi@vger.kernel.org>; Thu, 26 Mar 2026 09:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517420; cv=none; b=EMCqdX552VCkvikxEgDKj+Bu/JsGdnTUPtw8px2xbM0JTWVvgR3Zq9lj2Gb6hiOsGM1/zQWuqJxCV0gYsF1Tjhb/kiUPxgCMmzF23b5eQNTRSMwKvNx5viAQCtFnp0ZRHLaGxFEcxQGwefH7ACao+W0zAJ9/hS1M7upRrqTfXv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517420; c=relaxed/simple;
	bh=76P6MTojWxyS09DUsQY26VIzSMM8yABXimmKyWGPyY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OMggd/mqHBmk59VCfC4bUyqDSumt5Dekozp1gg66Fz4AHSTmWQX/ozwBN8HPTvSHRwR8de817QFx2MbSmiI/sH3VbRVeafP0AZP3yGu/SnnjAQ+QNRcZ+kQvP6hCcN7ebeEbVO6oZbqpmFfZ3kUNG9tb7DRrf4GgxMpeGMLUAGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xMzSEWc3; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xMzSEWc3"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so7010125e9.0
        for <arm-scmi@vger.kernel.org>; Thu, 26 Mar 2026 02:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774517417; x=1775122217; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u/1E3XJVA4/n+ORYtOSJ9uubj2svA1SkWoojEpFcseQ=;
        b=xMzSEWc31iIsmPSEPeul0DUvV+oPgXWbgcmonc8IfjZKZ3NO/IhJfMexFI4O3Woq/i
         Ws6k5w/clkjHyVqnH0bcN9gr+Pq+8vsvxSFcSq1e0v3KRgwBYFVx6XuvMinUc1KuTyGR
         eMNPgFB3Kwfe1un3giuikcZJWs/bs3GqngfuK27L7zd3b+9IirS5tyJPMMnVRfa++R8I
         0/FTddAjvXiB82iadERqkeiWOfT2zbTQ5systiIpXOmmpj0BpjHtmEsgaPgcFgg0Y7OE
         gM1LfF4sXMC6Oo+6Kppu0/x2vdalwEefXC3vRPoe6Ye6XFoZqzAG9MZ4oZ85mm4ufJhm
         cCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774517417; x=1775122217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u/1E3XJVA4/n+ORYtOSJ9uubj2svA1SkWoojEpFcseQ=;
        b=Mtv7ZO/xGokxNNkJPVjS+Fn/zB/61BLwZwlpum1OhiewslPxUS6rYWQTa95lpC0uda
         eH45Im6auYHCD1duurJCH6ViTAMhgBQjFrD9AGR/Yr6VQdWQ6+T8EQoKbgId9gJA89Qe
         kUQOyKjth74Ykh2pf/mD4uuJ0r0JznWCzIHwac1+pV+VEzdvnmqRspp9arMG3Fyj1uHy
         8s89NJxL+LvtpQ4xfJU8wqhg33NVrgvoiBqgXLuEq+ldLZSISxGBQxDL8kVPGTzIy/2F
         zmoyg57Tb0oIzatnH8GqdHwqFSnjiW0opvVqwY7yu9sGok1PtacQa0zqezwrhgERrkUt
         ZoVA==
X-Forwarded-Encrypted: i=1; AJvYcCWTLGx2BQRUUC0TtwykS0WqZ1FpPT8YRdmQBpYLBRKvh1dn15i9P/wu49ypsYq7kRb0YRSwBDtvZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmNEAH3Ej1bCl5rpLzfmhi/uWFluoyIGHr9gXkVbJ+gXGBElfv
	ptCPomLLpkrkyNPpso0q0QdEOluZrzmLAESWQAGnN5Pm7QzltceeSthPwvdnZu6AVPMbqnEdF9l
	YpB4J
X-Gm-Gg: ATEYQzxTwFOFllaiK3Q555fWynDZvs6QwqI9jzixSZ0fUL0052dZa4erazhPwhWiYjy
	OxlAzL8zLVhOhGJm6cVhx2b4YijqmBZ8Z4+tPYxC1oDvJQiIVVkx0MEEr+wl0ovIYG5r5q711Qy
	GaYD/3W50ZlU38meZIFIeO3fkB0hbNk6bcetP0afFbsd1JWjLSHhrvKngSvOykW+DnzEfMzz8nJ
	sJU3Zjh8wFL+j9vMb55AWsT7E6iTTsxMRp+7pcJkegTazu0AcFasYElH9Sxn2EEj83jawBxCdTi
	OQy2DONuc5RRncH7eLuJ1xYT9jprjgFKtH1w5OmUr0IGqUHyty3n7W4RfQUeUojgX5qGA/iQ660
	iuN5ygLHWWbLFjetOYf0ao1/1SfUqaqHH2a4tYbwQiwANGS20TyJrIxZ+aRglCOWE98YUFOiBvq
	HInL8TFT4zASJssB1yO59IU5cE/IIc
X-Received: by 2002:a05:600c:3490:b0:486:f8e9:add5 with SMTP id 5b1f17b1804b1-48716042c08mr101023585e9.19.1774517416931;
        Thu, 26 Mar 2026 02:30:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c957b9sm35804605e9.8.2026.03.26.02.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:30:16 -0700 (PDT)
Date: Thu, 26 Mar 2026 12:30:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Tom Rini <trini@konsulko.com>, AKASHI Takahiro <akashi.tkhro@gmail.com>,
	Peng Fan <peng.fan@nxp.com>, Alice Guo <alice.guo@nxp.com>,
	Marek Vasut <marex@denx.de>, Greg Malysa <malysagreg@gmail.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Yao Zi <me@ziyao.cc>,
	Arturs Artamonovs <arturs.artamonovs@analog.com>,
	Anis Chali <chalianis1@gmail.com>,
	Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Utsav Agarwal <utsav.agarwal@analog.com>, Ye Li <ye.li@nxp.com>,
	Valentin Caron <valentin.caron@foss.st.com>,
	Vinh Nguyen <vinh.nguyen.xz@renesas.com>, u-boot@lists.denx.de,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	arm-scmi@vger.kernel.org, linux-gpio@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: Re: [PATCH v2 3/4] scmi: pinctrl: add pinctrl driver for SCMI
Message-ID: <acT8pMQkFd2NKMTf@stanley.mountain>
References: <cover.1773256350.git.dan.carpenter@linaro.org>
 <1048331f5d3c8e0cdbe1542bcb65bbf942a4275b.1773256350.git.dan.carpenter@linaro.org>
 <CAD++jLmfRVGGHH1EqMAeSVHVCr1-s2JPyuY_w=2h35_mKUXj2Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD++jLmfRVGGHH1EqMAeSVHVCr1-s2JPyuY_w=2h35_mKUXj2Q@mail.gmail.com>

On Tue, Mar 24, 2026 at 02:19:34PM +0100, Linus Walleij wrote:
> I really can't endorse it though: with deviant device trees and
> information stored in paralllel in two places we create a
> maintenance hurdle.

Yeah.  Looking at this more carefully, you're right.  Let me do
this in the right way.

regards,
dan carpenter

