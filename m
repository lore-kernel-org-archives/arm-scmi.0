Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA0E388E42
	for <arm-scmi@vger.kernel.org>; Mon, 23 Mar 2026 09:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259917; cv=none; b=MjSqu8vZ5787t1VMMdJ+uKWSmSer6ttlk5Li9JaSiytng7fmrhxUzN0/ED+fnZ3u4TVwhXJTlX02elauU7A38sNn7BfSuMcbFLnGfpn/ZmG+Gdsx99Ut9rBt/uVIvpvE+YywezUfb5VD8pwRVhTTYxxZdLwKscti6XpgSdpGOp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259917; c=relaxed/simple;
	bh=gp5lHYOOO+4yiL81Ex+mUjPO6eOH6Qpek1Pg4LH9pn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cR24Oz/BtP2i2HlOJM+n2zMu5n17rRnC94jDQ1rxzbff4wJTvsbmJCWpa4sY4UOdJ9kzL2/xBkiB//CMJbvtY+mbW1AqoTiIBng/32i4Q+Op3qAojfuMWEGX1mS3+OnHhLB8cnYpAeSLoxT+lzN675sOMuuoMKCKZ2qET0UyQy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VWW3SvkU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VWW3SvkU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5E9FC2BCF7
	for <arm-scmi@vger.kernel.org>; Mon, 23 Mar 2026 09:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774259916;
	bh=gp5lHYOOO+4yiL81Ex+mUjPO6eOH6Qpek1Pg4LH9pn0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VWW3SvkUU/yv0MRfe4JmE2kDnaToOtuQIqVsqIHLlw1gxOEQZnC41Qs9VN1Fc1oJ9
	 gZDJ5sfIfYKcJTLJ5JeqReZiBl3bIiXD38ViE8+3a4gohu7VXq1D7sBk7a8lgnAUfQ
	 L9yKrN/IVtB8JHgkJE9cqEmGLNngzQwHR2FHSPPM3Df2xlt7L9Zxv5ACpcNAUKgJu2
	 wDiGl2zqDMenBTlCZwUjgw8cr16ywBiUI87mWmMTDnrZMBzvkphzDMhR8OxYxVWG0C
	 LhGAx21DF/nen2mwblfGCCt6EEq4CHO5fPYCAVUwtdQnPcl0WTEU/HWxW1mKGry3Ng
	 LYCPB3T/IreCQ==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38a3066b68bso30257861fa.3
        for <arm-scmi@vger.kernel.org>; Mon, 23 Mar 2026 02:58:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWGa4VP7ofl5iUlReUF5frGtmhmmwbVPqHeR0+569psCNjAQzAxpX0IkXoDsYptk5BgfBt1ozcFWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOU4F3tqD6YjWFZGN5Oy3nC80QN/67LVsRYTS/82aMgYoqtwkO
	KscUd5ZYCktTbkTD1wxxgjjSxBFItDOsy6kb60fguo5W3yMTGqDRs6UKeNY12UaIJNPL+JQGrKF
	zweqAWFB+8AJJLRnloSuGXmceiLvw7E2/qgrYkzc84w==
X-Received: by 2002:a2e:9586:0:b0:38a:1a50:d843 with SMTP id
 38308e7fff4ca-38bf9747572mr29235411fa.36.1774259915139; Mon, 23 Mar 2026
 02:58:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1774087290.git.dan.carpenter@linaro.org>
In-Reply-To: <cover.1774087290.git.dan.carpenter@linaro.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 23 Mar 2026 10:58:23 +0100
X-Gmail-Original-Message-ID: <CAMRc=McyeeEaagvkoU3MDAof_N_e+f-sVwCDak5Y7F5cQZd-7w@mail.gmail.com>
X-Gm-Features: AaiRm52YzNP-I9uAP5hlyzM8oeYE45CPVBux1vZ_-ak3oMBioBxm2gy2IoiTfBM
Message-ID: <CAMRc=McyeeEaagvkoU3MDAof_N_e+f-sVwCDak5Y7F5cQZd-7w@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] gpio: introduce a gpio driver for SCMI
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Linus Walleij <linusw@kernel.org>, AKASHI Takahiro <akashi.tkhro@gmail.com>, arm-scmi@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Dan Carpenter <dan.carpenter@linaro.og>, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>, 
	Michal Simek <michal.simek@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 21, 2026 at 11:13=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> This basically abandons my earlier attempts and goes back to Takahiro
> Akashi's driver.  Here is the link to Takahiro's patchset:
>
> https://lore.kernel.org/all/20231005025843.508689-1-takahiro.akashi@linar=
o.org/
>
> v5: Addresses Andy's cleanups to the driver.
>     Adrresses Krzysztof's comments about the dt spec file.
>     And almost all the subsystem prefixes were wrong.
>
> v4: Addressed Andy's comments about kernel-doc
>     Addressed Rob's comments on the spec file
>
> v3: Forward ported Takahiro's patches and added some fixes ups to make
>     it work on current kernels.
>

Once ready, how should this go in? Immutable branch in pinctrl and
final two patches through GPIO tree?

Bart
