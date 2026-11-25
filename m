Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632688;
	b=n3MyV1xGSIfdY9f2BoZfqjok2wWWvjihb9nMkQsyPw5FLYoJttaBJwFyHkQB7/nWNlyL
	 snOLNZHPoFkUqVETFluVmOncRGjLqG51ya8ySVK3S611NKhZ7OE2vyOBWZdheC/nvF3Ro
	 RJJnYNu+h4u3AgTgsMb4qQIMZJnm9WCNj31MMu19q9MrulFMxvGDlFS7F90IDDWNbdnfX
	 Q/X5vcVk2az3io89vlBc+Gi51PHJVUj7FJiL8tivG6z0O53pSISjADwafXgWKXljbyxJk
	 oqcmVkzK7spwy+8mdk7qq145rnBkyqAuxo7FdDADvgeNlLldGZSbGkLFQPpptypIvlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632688;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AJn2ZDGnyq8BSK3oyCmPQTCcj4ho7zZBJZRdqJLEXy4=;
	b=Gnz+8TRJogujCpq6tOMdhF45AVQVKdoKiNiq4oKxx+EluXVngSPBBI4NuYjng/uqQVly
	 F8Ao8HtIHJaOr2652ZoCLeF3Mp5VIYuOtekf0aXB6ufs7q87IgZJ7UwZHWf/cvcWbxcwH
	 7ROKYA3O6Vh7EuaycJA2mtaUs3kVJMX8HIfviesYLZXfoW5o9ExuTac8jz+w+b68IbGQG
	 JE6dPLmpPgQua6/8ra8JE/UbdhxxMd7YgVsgLrnKfwFoqVv+hfP3yK88G8wmGBztcvs1q
	 ka35HVvysv5fYLNkTQ49hVSUrR01+aYbmvg4lVk82+2F+1FH9rgCvixg9uWj+tE0EAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jdBZDhC9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716F6606A323
	for <arm-scmi@vger.kernel.org>; Wed, 25 Nov 2026 18:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jdBZDhC9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC4D1F000D4
	for <arm-scmi@vger.kernel.org>; Wed, 25 Nov 2026 18:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795632688;
	bh=AJn2ZDGnyq8BSK3oyCmPQTCcj4ho7zZBJZRdqJLEXy4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jdBZDhC9MNNQz5cBj5Ox8aCyjykW/pq+ZExbTTMM+FY0+K3FycDZODCSoEFvzxbR+
	 tLXpoXa7yhQ1Ej2WkTh/5DrqEIQQi4BVl7n20pxYX20EXxdp1ANX/OYkidY7hiDmD0
	 VIRSZZ94NjDQOhJFe2ezU1Ke8F5w6ALKPnJW7PI1Gz8Zbdtz5GguSHmzlnZe/aA52i
	 RcL5ZCSl58VXMFTwHVsxMupkISaghNqdkP9xYjPP8DVAmAHXvT2JM5uyB2+63MtPDn
	 uZGqI3Tij0OD+Sj23NEXSfWmrrTqB0fF3QGgXyDPn0YKJQwSmHQuzp//rZcTpVfXVZ
	 tZfp/W9RUyS9A==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5be53e5fce1so5638549e87.1
        for <arm-scmi@vger.kernel.org>; Wed, 25 Nov 2026 10:51:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHxRbdZ/o6Q9ZzCeIFHHHkVCsHtn73ESKCHMXjaoGITA9oRtTT9gk4r7ptmGSOvMXXaNCEQzvjmpQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8rw+F06TzDI0VhBMnP7uWjGe19RsEFyi+yey2wbA9khouOWhD5
	Qwe2BzWUmK1Tf4eKdjjGsyPR1MC4XK0d+/zUPxP9q4lTx/VqMVnt8E55YHXzdhPBKmKTyL05Asc
	cJTCkbzlHKSxN493zZloWWet33LuUXpE=
X-Received: by 2002:a05:6512:1244:b0:5bf:d1e4:a034 with SMTP id
 2adb3069b0e04-5c1bc7d025dmr5776024e87.21.1795632686730; Wed, 25 Nov 2026
 10:51:26 -0800 (PST)
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
 <20261123-clegoffic-pinctrl-scmi-gpio-v3-2-d61f039be008@baylibre.com>
In-Reply-To: <20261123-clegoffic-pinctrl-scmi-gpio-v3-2-d61f039be008@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:51:14 +0100
X-Gmail-Original-Message-ID: <CAD++jL=9CLRwhfKTxXRFLmFD464fXDUpVrSBXs=QSgR2wd0T-Q@mail.gmail.com>
X-Gm-Features: Aa3M54plvKbr5Woflkau8kb77OF24_6CaFs-zUvJOIOFslZLDIg88lWvAqwohnw
Message-ID: <CAD++jL=9CLRwhfKTxXRFLmFD464fXDUpVrSBXs=QSgR2wd0T-Q@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] pinctrl: scmi: refuse an inexact drive strength
 in milliamperes
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Peng Fan <peng.fan@nxp.com>, Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 4:21=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clegoffic@baylibre.com> wrote:

> A get of PIN_CONFIG_DRIVE_STRENGTH truncated a value that is not a whole
> milliampere, and a set did not check the conversion to microamperes for
> an overflow.
> Return -EINVAL in both cases instead of truncating or wrapping.
> PIN_CONFIG_DRIVE_STRENGTH_UA still reads the exact value.
>
> Fixes: cc2f90768e97 ("pinctrl: scmi: send the drive strength in microampe=
res")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/all/CAMuHMdWwp4RtKnBpFNJPHdigzrQ-wf3yt-pB=
ZGG9QKs9tcd_Ow@mail.gmail.com/
> Signed-off-by: Cl=C3=A9ment Le Goffic <clegoffic@baylibre.com>

Patch applied for fixes. (Unless Cristian says there is some problem
with it!)

Yours,
Linus Walleij
