Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564475;
	b=h+jObCfAW6C0bhocrjbmATNczLDp511H30j5sGs821oUrFl4foneDS7wPqWOZG07OnTs
	 w9vxjsFyh+BoCDyD47RNzLq+yvkSQoD6CPsnbvVEOlDUUYWThSMwg9PJvssSjVu5nIT0I
	 54G+OBsfISopiLidgnfoBMfyRPYLrJyzLTlxjtmiLERMMTwzrCGjl07gn96QWJBPtp+ZP
	 /0Zr7mbzsCHsIbKSjgU4S35K9y/aqqoaRS79psalssuv1EiuoGvkSjQQ9TP6aGZ2nNXdE
	 L1T3infq1Xzy2dL3PQnTflhaMY/Q5BBVV+XtrglwOn1omR9nJuqMtyqrRV+8XM54plA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564475;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=S0XA8lNxZ3R3GHk2klTObywwFs3Z7RSzUthP5GZiX6o=;
	b=5a4iBLHg0wq1s1cGJUyWNGKzrw8whku5LUQuofOtz1a2R3hwfxqVWY5uxf/ItM8sieb+
	 vggzlDRHUEAkR4q53FtA0Arf0DVqlZtkgxZOTvDb5sDuQmNqxQdY8aJQTZV18D+9Q+/4O
	 1/1pcr7FvP/w4br0iapedd46arGmaOrXDiOnQTeMVpe8d4yEiTaI1amm2WIMwuB3nuLna
	 /PueLozRGO09ZYoFSkfG4qUbhctEQWUK9PiVMVmvzrjFbWO7BnR8jim3O7yH48CzEuK91
	 fn74wFUs2+6mveMpGHNR2ShS24IIhvoPaPXbp2qSj4Zkpp0lbYxMQy2cLfVlM7/DQwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QB5z+R34;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91ED0606A32D
	for <arm-scmi@vger.kernel.org>; Fri, 13 Nov 2026 10:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QB5z+R34
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 311BD1F000CE
	for <arm-scmi@vger.kernel.org>; Fri, 13 Nov 2026 10:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794564475;
	bh=S0XA8lNxZ3R3GHk2klTObywwFs3Z7RSzUthP5GZiX6o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QB5z+R34JgjSKXfdTuQQ4z5Vl3JWBLQzBFWeEA6acYvWfibhM2Rffli/kvKZux4vr
	 MYh8+DiEPhITQf8jKKKz9vDQQ85fvRos4R7RZkzlBjyxhUlkHAgy0OSfr2SFn5c+Ww
	 S4z7xJqcTzwnh86Gm7zTVOFPrh+KSN/vdKlOa+T9t/TWDrPQ4h2xQr1FmXNwUqUyOl
	 2X9yIEHKT9wjquLxU2vag5N0nS+K0iVjdAkr/IaACUbpFSr0dnZRZtnO2x+NkM98v5
	 d4zfoXbk/7ZWF1eF3UTKkTvs1uzp6Z74ISEzKGLl/Ct8OVqU2MHngWy07ePd3k6Tsf
	 yf927Q1beTwRQ==
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6fe4372c5f3so973398eaf.3
        for <arm-scmi@vger.kernel.org>; Fri, 13 Nov 2026 02:07:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHtJXHSffGPvPOAQ3rOWOTaMQUDURJ13JTNUiVawUHd6iZ7TOUMYuwZ9X1l54rS0qrnybonUHXulg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/fKCRr8Prpmctic7HfKa0tE5pmJzGhGQs4LXOK7ciwENkI69I0
	ZKjbbvpbdKEhraJxPD1jAKWsYRpWItR+f4rA2V8weS6BB/fn/37vZ2+V9Ti6JhOEVurPXcAXIgh
	gysPqVBd36bT9AvRQqP9Mjr+GNtOBPO4=
X-Received: by 2002:a05:6820:7084:10b0:716:c53c:3f4b with SMTP id
 006d021491bc7-71ab52797f9mr747028eaf.88.1794564474160; Fri, 13 Nov 2026
 02:07:54 -0800 (PST)
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-1-52d92843ad97@baylibre.com>
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-1-52d92843ad97@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Nov 2026 11:07:38 +0100
X-Gmail-Original-Message-ID: <CAD++jLkjbHxbJ2-p4oe3ecdpdC4Gh9fTiufkrvKBzF+bfz1HNw@mail.gmail.com>
X-Gm-Features: AclHuK-a3uoEAZFrK5h2rEztceybIFl9qYaKDq9CCMUyZ6HAOHlDJiKihMms9VA
Message-ID: <CAD++jLkjbHxbJ2-p4oe3ecdpdC4Gh9fTiufkrvKBzF+bfz1HNw@mail.gmail.com>
Subject: Re: [PATCH 01/11] pinctrl: scmi: send the drive strength in microamperes
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Peng Fan <peng.fan@nxp.com>, Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 4:58=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clegoffic@baylibre.com> wrote:

> SCMI gives the drive strength in microamperes, but
> PIN_CONFIG_DRIVE_STRENGTH is in milliamperes and was sent unchanged.
> Convert it on set and on get. It is the only unit that differs: the
> debounce is in microseconds and the pull resistances in ohms on both
> sides, and every other value is a flag or implementation defined.
>
> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl=
 driver")
> Signed-off-by: Cl=C3=A9ment Le Goffic <clegoffic@baylibre.com>

Patch applied for fixes.

Yours,
Linus Walleij
