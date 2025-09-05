Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671842505A5
	for <arm-scmi@vger.kernel.org>; Fri,  5 Sep 2025 09:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757064270; cv=none; b=p0UlmQBkZxAL+E7ejrXGtoEvzB6cvUy9l78U+wQmKx/WRcZwYyCioF6OKcz1M74F+D+Jobg2R5MjFopkKis3jv/eUubXX6UQWpVy8k7zQG14GdhFxzrZ1hhux2ddvgTCx6T422X/a/x4aVa1q2LT5yMd6oBhTtv8j5E7iMlEKQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757064270; c=relaxed/simple;
	bh=cYCiiH3gm9SqbiIxuEfhcs8IFMHPpd2Rxvg3pb29fjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=baYHCBZjrqqdkkAP5CWJ5yHDb0NLBOGKjMIFWOfHua5UWpstoONnbzUAGAjQ7eISgu6FXtczKq5LJRVNKgrzgu19fc4QrqUfJuY1lbc+UvF0RNEXxYA8vhVLDdLbhRRuWBOkIwL4bKDAmBW3jIe4EvNIiq1Ao063palngH21ayA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FvnOCCcZ; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FvnOCCcZ"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-560880bb751so2017623e87.3
        for <arm-scmi@vger.kernel.org>; Fri, 05 Sep 2025 02:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757064266; x=1757669066; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4iBW7toaydLQ7imUc/GfTyAbD/CCBjwzlb8LKJDuO8=;
        b=FvnOCCcZCYVKlWtrCmrQwyHS+BxFOSch5CoDMvesZzbD7K7PjemItF/j3pCcd2pJhe
         42DIn25za9146IAUKAvk0VaL+kfurESR6UuBwAIVfjAFF6Jr4bF2b9aejvf/D839qP2G
         mDTaNRUd+hJoRZbq2sPGTh/rmpc4z/w2vVo9dcnQCCR3f9NmpYW9z+777yCi0UTtGe72
         mNd3VtcGIsTyGO3uXMoOCRG0r/EqUA2fSeTGXbBN696OKkjqHAWH4k80eDIxiQnIETbt
         VkUQMPdENzgZWxjDs+cBbYQVczNgFI3tWMoUQlCCgJC8yGBJRqVCsYJNW3+xZwAuDaOP
         mp7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757064266; x=1757669066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W4iBW7toaydLQ7imUc/GfTyAbD/CCBjwzlb8LKJDuO8=;
        b=cZXJcqvvmofk8MF4ooIPkEssPwhkgaW0PtNr7WkYky19uWdILLjYR0ffVE3Zk5nq+b
         4tKUEExnFTxssz7TnTf3Xs1YS+Yt19yrUW/O8ymsum83CAEkj2KPsCThacZ3Dq0YCHn8
         wwUtqExKPXeH/Ro4QEgi7vhNbWoOlB7r33OzJo0R4LP8jruwacb2Sg6P4PPpRqtjSEe5
         ZtNxWPW98zrGr7k10AZkbV5SF2PQ233xnxkiDvoxwhoQ5NI6YH/4SzZciPF9nsQnWDl1
         gowRs24QAzBBgoCZPNW/Qjn0lDoYlsEG7H3op71RuB1vN10b2ZxV8N9Kdcoi9vTGOrSg
         68Kw==
X-Forwarded-Encrypted: i=1; AJvYcCUfO0KYWt4S3xUuz4mpd2YndGJLkb9ZcMlZUOoUtI2t15MFhmuVpuLgXlVT3oWZBBlMXBr0AogEQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk1Of50CsKm+eux6Mrj20w1Y/kurQNOTaAc/zzHVZsrbENnqgM
	HRlX21yKksxRTsD+NWPpf19+HFEh0G8bTUATy6/yGrkZIJpXj1KTWb0c9+FS+9BjFaeei5P6u5E
	mKY2hYikD+5wy7ZjGgiTUFKEFX5J+JCWZaB426QeLIw==
X-Gm-Gg: ASbGncvMd2hoNB39BB6+NY7txRTLelcuIb67dy6YGwkjxJyO0mV/0XuM2x5iTgurH2f
	eqG94ACFdu5aiNxLyz6STcy5BBV5+V2Itw6qfBlK1FI92wzslgmFou/rSkCdiqXhVP5zLi7nJhT
	PVPZ83svZ0fOwt2SDq1yQcJpZnqbdLjyYNM5wYS7n4SBZGZZjiihc6fAxgWNOWZiS5nq5ADGLXF
	0bGhFdnnAE62qs/WQ==
X-Google-Smtp-Source: AGHT+IHf8M+zGLz7Z5SlYPw0WPpQqAm9QKyvMQ2dhbv1sQOwJcfYvYdYRxdgHr8ORJ09bjn8JpTeTz4W49oHRu491HM=
X-Received: by 2002:a05:651c:4183:b0:336:95e1:9583 with SMTP id
 38308e7fff4ca-336cab04db0mr57663561fa.21.1757064266436; Fri, 05 Sep 2025
 02:24:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1753039612.git.dan.carpenter@linaro.org>
 <6f732f53-7e00-4f0d-82a3-480bc81497bd@sabinyo.mountain> <CACRpkdZ9EHoHiKit+T-ur0xDKMEoN_=TydzTfoggNBQGdra2bQ@mail.gmail.com>
 <CACRpkdY3_ifPsQOTqa2e-kHR24Khy0axrZ=K+vO4OJB+FjdB2A@mail.gmail.com>
In-Reply-To: <CACRpkdY3_ifPsQOTqa2e-kHR24Khy0axrZ=K+vO4OJB+FjdB2A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 5 Sep 2025 11:24:14 +0200
X-Gm-Features: Ac12FXxefXSGz6SnyspKuWNLPpG5rs79kfLCyyMTukP-5craFHKIm7xv9A9F5nI
Message-ID: <CACRpkdaJNK4+Viv+kdZUSXH6r6jRfGt0KixsTuRTP56qwQccYA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 4/7] pinctrl-scmi: add PIN_CONFIG_INPUT_VALUE
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, AKASHI Takahiro <takahiro.akashi@linaro.org>, 
	Michal Simek <michal.simek@amd.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 5, 2025 at 10:31=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
> On Fri, Sep 5, 2025 at 10:27=E2=80=AFAM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
> > On Sun, Jul 20, 2025 at 9:39=E2=80=AFPM Dan Carpenter <dan.carpenter@li=
naro.org> wrote:
> >
> > > In SCMI the value of the pin is just another configuration option.  A=
dd
> > > this as an option in the pin_config_param enum and creating a mapping=
 to
> > > SCMI_PIN_INPUT_VALUE in pinctrl_scmi_map_pinconf_type()
> > >
> > > Since this is an RFC patch, I'm going to comment that I think the SCM=
I
> > > pinctrl driver misuses the PIN_CONFIG_OUTPUT enum.  It should be for
> > > enabling and disabling output on pins which can serve as both input a=
nd
> > > output.  Enabling it is supposed to write a 1 and disabling it is
> > > supposed to write a 0 but we use that side effect to write 1s and 0s.=
  I
> > > did't change this because it would break userspace but I'd like to ad=
d a
> > > PIN_CONFIG_OUTPUT_VALUE enum as well and use that in the GPIO driver.
> > > But in this patchset I just use PIN_CONFIG_OUTPUT.
> > >
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> >
> > I tweaked this patch around a bit and applied: removed the second comme=
nt
> > in the commit message and wrote the docs to be more generic since
> > in the future other things than SCMI might want to use this
> > config option.
>
> Then I thought about it some more. ...
>
> Isn't it more intuitive that we rewrite the curren PIN_CONFIG_OUTPUT_VALU=
E
> to just PIN_CONFIG_VALUE that can be used for both reading and
> writing binary low/high instead of having two different things like this?
>
> I will look over current users and maybe propose a patch.

I discovered that several in-tree drivers are already *reading* the
property PIN_CONFIG_OUTPUT_VALUE to get the logic level of
the line.

I sent a patch renaming this property to PIN_CONFIG_LEVEL so
it is clear that this can also be read, and you can drop this patch
and just read/write PIN_CONFIG_LEVEL instead for the GPIO
driver.

Yours,
Linus Walleij
