Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362084035CB
	for <arm-scmi@vger.kernel.org>; Tue, 24 Mar 2026 15:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774364841; cv=none; b=JRawAXINyI/eXY6DVdKrc8QRR9yzXyGpEAZxhzruqN66TniQRRbLv6fRni/z2uJsctRjdX/hBBHRw2X9txtzLvVfe8xhS604/YK33wqnGnsrn6M+Y5I8X3goP2bwkfFLDtpF9Vb5Lyv/yK6tJhTy/5IjLEou/HR1dlLIbiUoh68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774364841; c=relaxed/simple;
	bh=Q04xTA47YRKeBfrjPIYFQ1qHCYl+rBBRZENWaoTJKQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aU6aWtge5m8Ylmhccn4ec28e+o8+3LEAr2sWrz/9Fgk1MUdJxQq8C7P8g4drQrxO8GaBdQdcY7B0zB3o7tmY6EVoYum6OoGtniayn45ZdrORtDiIzC09RbtoLyLVRZMfKmof2c195ORKRQhyob//0qc10tdeB9JLSE+hHxGkd54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WPYgVs1v; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WPYgVs1v"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43b41b545d9so1410840f8f.2
        for <arm-scmi@vger.kernel.org>; Tue, 24 Mar 2026 08:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774364838; x=1774969638; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P5ZdFYh1bLXmKv/xLtFTZBUW421AXSY/+eTav2poOSM=;
        b=WPYgVs1vvlJxrW66Dv7qlUt66UywnTrZCBQSndwjltVBxvl5tShGCI9OFgTwCSH3gt
         X2IsrfLQ4aT6Lg2Y671cSJQnKKIy/h2OYhtJrqxj+j+z+wDJvbWBxiUU+JgkkbkcVpVs
         XtcfaMSIEjogdtVFD+BSwIqo+4ykm61hctBuqKWOosihwRd0A0TYbyx7tRs7UUx8iA+m
         B/abbvqNiGcpJvWFHqbLXoM5S6oDEpF6ATVu1u4rQXDvj7yJUcuwIcVw/mbElTQ5RPLJ
         N+sW9jy+BLtVrNDmLQPa3PoCJfZxE+Qzy4ecoEEo/QK6RoisU3fsbslcyuaET9UKMwGl
         7AJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774364838; x=1774969638;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P5ZdFYh1bLXmKv/xLtFTZBUW421AXSY/+eTav2poOSM=;
        b=SmqMywpncBnO9T2M7adm33m6Y1t3lHEByWNZfiUEZdaDUQA/yqpxpVxiWnRkCz/8X6
         gU3R+c1ujbbJsEZNv66LpvlqBQ/YJoO3OYcxx6v06yrPvHhF6eRwtHetpM+JM4st27Qo
         aC99oUfS73yTlDnkiyx0rlCfcxmAt0B77Wz7M9bl7VgP+n8qZuIpVOzPqziFbjYQ2sNW
         aHS8U6W3W4G5RNHzHGup8Z8rYvmWCPZGyP+EJZesUhw/QD5rCwg1h+u3TAQXausFL/tJ
         Kyw1PJu3YfdrCBbW/1wytuFSpqjeQtEALbXfbrARwYWxnVHPi9O1/JA3kowCGa7XWgJr
         DkCA==
X-Forwarded-Encrypted: i=1; AJvYcCW+qZG17LPEtEKEfJNqaYj8o04tH5EdeBK+RHpycwDu2c2peyuIQU7mkmH85RNACNaFMgAr4FL3KA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk8qdsiSsk8iZMZfCZB1W7ZszWVcaQaIuyv6RTVy6c9bykh4CW
	m3J1Vfm/lcNRHlp0/cJv3HZeIk+50A0yeuQipWM3nmNpNn7lvrWHVJxyH+dEhwgehPg=
X-Gm-Gg: ATEYQzxNOdlmPPL5k78Pgc+jmIgjzuuM2r98f8XadFGarKO7MB7LNfkCXBmMChBEgak
	kv0UpB477U/qFaCh5SZWEz5FkrVcY1KJeSK3N+5/dR+s6/v6+Zfr1pdQ2p94oeNZeBuBKFTzfQV
	Mcj9NN5pKcFoEZkxLwOif9MF6maIJ/51/xVaOE/1XFcIyfrCb6n61YOD6I7S8anokS36KTguKFN
	mRDPTxwLvCLCSfZZMUQDdycFztQj/z42Cq4+ISbl8MwZ1kBCCa8PK3tpxhK2KFbbJkt2mn/umgA
	aMcz4tZFnI9j0oxg0edxGFCkgn41EDYZTGOaUjP6tc6GnoVrSXu9gkras59kyss0hf8mPoASdRI
	37rNqjTa1h5q3HTVM/PXOuAEc7Ie+esM2BlORa5GaT1WQuBXWnkuKOThI16wzqL+DQ6OykyUwMu
	9wKm9V0n2WZj/eknx99W/jnlAaFu39
X-Received: by 2002:a5d:64c6:0:b0:439:b4dc:1e1e with SMTP id ffacd0b85a97d-43b6426493fmr24948925f8f.29.1774364838270;
        Tue, 24 Mar 2026 08:07:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470393fsm39839147f8f.17.2026.03.24.08.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 08:07:17 -0700 (PDT)
Date: Tue, 24 Mar 2026 18:07:13 +0300
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
Message-ID: <acKooSHo_FB45nYH@stanley.mountain>
References: <cover.1773256350.git.dan.carpenter@linaro.org>
 <1048331f5d3c8e0cdbe1542bcb65bbf942a4275b.1773256350.git.dan.carpenter@linaro.org>
 <CAD++jLmfRVGGHH1EqMAeSVHVCr1-s2JPyuY_w=2h35_mKUXj2Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLmfRVGGHH1EqMAeSVHVCr1-s2JPyuY_w=2h35_mKUXj2Q@mail.gmail.com>

On Tue, Mar 24, 2026 at 02:19:34PM +0100, Linus Walleij wrote:
> On Wed, Mar 11, 2026 at 8:41 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> 
> >         scmi_pinctrl: protocol@19 {
> >                 reg = <0x19>;
> >                 pinmux1: pinmux_test {
> >                         pinmux = <0 1 0xFFFFFFFF 18 1
> >                                   0 2 0xFFFFFFFF 18 1
> >                                   0 3 0xFFFFFFFF 18 1>;
> >                         function = "f_gpio1";
> >                         groups = "grp_1", "grp_3";
> >                 };
> >         };
> >
> > Under linux the pinctrl subsystem will parse the function and group
> > properties and use that to handle muxing.  However, under u-boot the
> > pin muxing is done using the "pinmux" property, which feeds raw SCMI
> > pinctrl PINCTRL_SETTINGS_CONFIGURE commands to the server.  The
> > numbers are: selector, identifier, function_id, config_type, and
> > config_value.  In the example above, it sets pins 1, 2, and 3 to 1.
> > The linux-kernel ignores this pinmux property.
> 
> This whole thing is a bit of a hack and shortcut to make hard things
> simple isn't it?

I'm not disagreeing with you at all, but handling the default pinmux
property is the only mandatory part of a pin controller driver in
u-boot.

regards,
dan carpenter

