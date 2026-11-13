Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564569;
	b=X6QRzeYlMqkQFzou/1nCvsi58R1oXT5+RJZ6VAk4haCVCGSug4UJ1LLbySR8H6PabQRN
	 UVw/z7qZYWuvJbDphgMS4vFWmgvQjHE3H15WvwAmM8J6hrrfkuNAJM0kCQDEXL1BUV9Dn
	 c1SDNJTCMVaKrUM6zAtWkwa1X/uNbwOCGjxy0fNoVp2/QYArq5pKh4A7kgKU80DJi+nTo
	 bghZd36y8+8I7oA+reUXs56PbwSyTJnEaXJBEBK2fMjDh8QhVbZsRmyzgaHs3SZLnCnCM
	 9mSmhUai8uLyS9g8rWlOqKKHX/+MgZdH/LpXqFtKkMNwfrpTJSzYm6IGoRKTxb/7Esw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564569;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lHtGW/alZjcgKTPZf6fIR74OQ4JRsfsRwol3QZcsyok=;
	b=p3h5aT5FuUh3I5e8Rx0GteyKArrmu5CnxVYQOGAiE/HtRZGao5faf+CumLC3TZ1EBiMC
	 XDzpI77/0zvup9oUos1Blv/GtOL7o6pAvfQyGvarzN2ua9pgkBIR2gdKkwBhmGJvPDn+P
	 oYVMUTNzv5H8htkAdkH/AuisI9U47vxhizn+628MVJxiqQgOTfc8a0YPoTLDGWxl5HbMI
	 TX/h133P0WKHcjAEqcmoNKTuVpwGC3Uf3+M2VIEaSGfIf3BZHvX7sRuzDXwrrMKVpHuPU
	 pBsX81lVvTipLyadmL2PbXu1ZDnazihiPNtFwLbTQPa3FLsjkRlry4Jr6wAlYtzbl8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gW7UDdEw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E363B606A882
	for <arm-scmi@vger.kernel.org>; Fri, 13 Nov 2026 10:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gW7UDdEw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7334A1F000C6
	for <arm-scmi@vger.kernel.org>; Fri, 13 Nov 2026 10:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794564568;
	bh=lHtGW/alZjcgKTPZf6fIR74OQ4JRsfsRwol3QZcsyok=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gW7UDdEw6q+5j8PL5LPh1L1vrI7/MIoKJeAjSu2NDHrd1buG3qVpd1qYhNaa9PhEZ
	 0uUEqdklHY9Gbm+Ha9sUVGqC2s/1YeeDkfa483PuNbOwjkxP+CuS1Cq7pixdDBXc0R
	 v8QNxCJfMDXzIkIbjr1I/9MdJDOrw5/S0pgMg9lGdK7+71Aqu3QtTLGZtdE5rfj8sP
	 qBFGJ7jZOhrUemFPQdY3GuTbnZ9Tcy0O948NOaWNp92zja8/3HvsEPDwQXwO5lakfG
	 Lp8avRshrUm2G/L0CF6u+KsL4b/b4JItR3lH9LpYwzqjlbuhIzWXdmkjW/xWIb50Fo
	 jehn/M9xrMB9w==
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6b1afdf5196so249521eaf.2
        for <arm-scmi@vger.kernel.org>; Fri, 13 Nov 2026 02:09:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEgMfwGpI7oK4Z21fNzU36glo/4KJwSuPtP170C1KAbiO4sp6P3oLyLNQ+zIXkRt3WQOXCxnLdMQQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8cPUHtO17BtlIB9oblRuSZPZxRF8EdQOl9LDDQEKxQuXgJkmj9
	HWh5Dn4pN/BPhZyDDzVhO713rYKTNX1od0JwF7Dehe1dJ5iJilDCvkL+yggZWdREY82mpabSAbr
	PiMqhF5tFVDUaiD7DsLcP4IHr+nuoewg=
X-Received: by 2002:a05:6820:a294:20b0:6e0:8fc2:84a3 with SMTP id
 006d021491bc7-71ab510c545mr836854eaf.39.1794564567683; Fri, 13 Nov 2026
 02:09:27 -0800 (PST)
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
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-3-52d92843ad97@baylibre.com>
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-3-52d92843ad97@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Nov 2026 11:09:12 +0100
X-Gmail-Original-Message-ID: <CAD++jLkcbCEvBYY3cdfM89kj3r6Nz-KSd25yypqom7TpbM1HHA@mail.gmail.com>
X-Gm-Features: AclHuK8B628wWVXl0NuYQCslLhyar4b72cZPwoixzCfMqUSGPYc6JmsCw2evP6o
Message-ID: <CAD++jLkcbCEvBYY3cdfM89kj3r6Nz-KSd25yypqom7TpbM1HHA@mail.gmail.com>
Subject: Re: [PATCH 03/11] pinctrl: scmi: send the settings without argument
 as enabled
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

> bias-bus-hold, bias-disable, bias-high-impedance, drive-open-drain,
> drive-open-source and drive-push-pull take no argument in Linux, so
> they were sent with the value 0, which the protocol reads as disabled.
> Send 1.
>
> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl=
 driver")
> Signed-off-by: Cl=C3=A9ment Le Goffic <clegoffic@baylibre.com>

Patch applied for fixes.

Yours,
Linus Walleij
