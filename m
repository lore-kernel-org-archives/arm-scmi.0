Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632765;
	b=wwej0wBGD+r8HIBq9wBKUfMsmTUQyMzoT0jLKXUlEsjgooYE7VBBTledKMfQRDn4vURv
	 JKa1xlgFg8d88Lhb4NyvXFFR+ox/GE6/dSfPPwUdwfgsm+1nYDQUo7SNzOq5vQJu64RbJ
	 9RBEsLjLJFlMKDLq4UAOT37P3tbqlbxr5uV0bjp8msVpqLa+OSJwZleXG2F3Do9xd88sj
	 mb66n5/FW2IEwIRPFC5cGa6jCMnQ+dcJtjfKW2fA9D+PVHW+trxbztlsz0iGf2CG1d5nI
	 5/Y+GEpXBEuyom/B0egWf5K4jT2Z6nFRgl4fmHdW87XuP/BnZMDJpavL9/Qz5Ki32iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632765;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5Io0n1UM01FxM2YuoZdeUpAUXrSxW1m5V/EllWFPRYM=;
	b=JW5VQgeYs1iUj5uBOCawQ3eL1k6TeQf/Gt1LrCtE0cVCqAJFa6OHrHSFIS+b/WntOsUb
	 cfoUwRqUF64v/MUyGSP6Hi4W7lp0VElsgQxBTft75MDiHipSTr3viD93gEmbytofOPOtk
	 8NVWVDg/4jZJOHvST/zZu7Dm6iT+oq/wn75mAjYV0Iv20cnQhZtHCRnaSfhpnGV/xcPJP
	 rn62Lha1GsRdKHrh0pMjvG3uj3NstfKqrYmd0ZucR/PCrhVQ6zCNO24i1s86TdYLGdE2w
	 dU88C5A6KD8yJghJqMzcEnpFfg5En6+krEVWYCSiNfz/XrTcGsBp13OyC98WsNmhzIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SNImb11Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC483606A321
	for <arm-scmi@vger.kernel.org>; Wed, 25 Nov 2026 18:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SNImb11Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56A471F000EE
	for <arm-scmi@vger.kernel.org>; Wed, 25 Nov 2026 18:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795632765;
	bh=5Io0n1UM01FxM2YuoZdeUpAUXrSxW1m5V/EllWFPRYM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SNImb11Qh/3b5Ium5CpmaPgPI2mW9SNS4hZxLcJW/z2GMrUd6mP3pUUEnfAj7GHUd
	 iEKYBQDo+EHJXn6ONIU7H5CYk8GyA93WA3xv6eZaqQcW3ut9KaZcFtERH9b8hZXOzw
	 A1SrKwbevpCWFx2RpXu0NBXb9oPM81Xw/FWdUuWMIovl4jBacH7Lot6mNzFF11nmL2
	 k+XF/A/e5PGs40zB8yCgiwH0l/vBXTrXvy4+TzibyY67iMJ39mn2wdkjbaINNfKhgj
	 RjxvhxhKiZxJjDRJKvpGDkukrpQopYqwZYoZqcw2b2iUn3Q4vThmcNHF3W8W8LdPVQ
	 ryCXAaaa8T7UQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c15ccd7fb5so3797221e87.2
        for <arm-scmi@vger.kernel.org>; Wed, 25 Nov 2026 10:52:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFVgjXgBsdrfvkvy+BPPoHLwbxj08on6nm6RwKaj7SRVzhO3qWzL2ukRiVV7buG1Ze0tIjLLLjyUQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9JsAN+e7+vvG6M1g8+ZCIO9TkQf8i7EGUbIEDkKUtK769rtNEV
	YsUkGUaLbXk82JaARvbyGAZh6AKVwAt/psjWQ4gllBbYxCRv2cm8f0LhpyDwCST2vgBWyRpE85e
	0EbkVoEaRgMgRpwTPoQhvEEokdtEfx54=
X-Received: by 2002:a05:6512:1042:b0:5c1:4bd4:9913 with SMTP id
 2adb3069b0e04-5c1bc662a16mr6789010e87.5.1795632764129; Wed, 25 Nov 2026
 10:52:44 -0800 (PST)
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
In-Reply-To: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:52:31 +0100
X-Gmail-Original-Message-ID: <CAD++jL=GRrzWy9p43FqK4WXDiTVpP_0n8sxj698csiCaA6mJ+g@mail.gmail.com>
X-Gm-Features: Aa3M54q07dB3zIMCACk22nx6jx_t6LUDnGDJTlh69A3EwVTfFUig6AKIR2eUh48
Message-ID: <CAD++jL=GRrzWy9p43FqK4WXDiTVpP_0n8sxj698csiCaA6mJ+g@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] pinctrl: scmi: fixes and GPIO function support
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Peng Fan <peng.fan@nxp.com>, Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert@linux-m68k.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cl=C3=A9ment,

On Mon, Nov 23, 2026 at 4:21=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clegoffic@baylibre.com> wrote:


> Cl=C3=A9ment Le Goffic (10):
>       pinctrl: scmi: report an off setting as not set
>       pinctrl: scmi: refuse an inexact drive strength in milliamperes

I applied these two as fixes, waiting for someone else to pick
the firmware patches (or ACK them).

Yours,
Linus Walleij
