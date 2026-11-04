Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798081;
	b=46z7UTg7f+PhVsoaj0KB9hvHC9NI7zc2nWlSfOn7Acl5J+TCTppAdrsc1QyIHsnEBHgr
	 NfK3QI0pA5tghC8/Wnx4iR9BCQ9kI5+EWeSdDkW6hUvvQ6udom21xzzujCcQumpwMkoWn
	 gXummEC89SjRL0/Ojs0m2j202Po3KKja3PLpIKjlYrBHAbE5IE6x7kL9jlGxaK/ySeYVh
	 0u9mNcdoMfRbkCEneEWC8grCoQI4fnpMdKqyy9C7+WltOw6zdqtR2i3zE3KJq+M892W8C
	 RVskazCWEtT1moolcJTkEU102t1+IciYLcq3wnjazuiI7kjsa92gAXYfE5NRvme9HMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798081;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/p5+Pyk6coILlORdcQBpVHNHSFgdC438Pn8Lrp7EWZ4=;
	b=3sQsBr1OyKfsUSs+I4KA4RXu2ln3H0desbtH0KpcZoqiCZxs376ciWjxKACypsHkZw49
	 S9JEEI/54D9a+JfMCRNSuQyy3Pnjp0xsNwaNlzY2dSX8i85m/3CQDu2Xo2Gakx/7jJlv8
	 QeWjVAUKkFS+R1Cly22l3Ju0BmFevdUT3RP7s8SSeIs2IBoYWA6OBinEV6zzz74V8Wppm
	 HYwB3YS8RuLRXoFwJ8ha3tCkSBe2V5RqZiBFUQhyGxGTjij0rpLR2k8DsKEDRMCRmxkHV
	 yslEvZgFb/qRKE8g04ZRy5wx85SumJI/zZHQQuuL3Hnn3hU3TaXTuTGpPBjYUfsYNjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PSwVh+0e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECD3606D809
	for <arm-scmi@vger.kernel.org>; Wed,  4 Nov 2026 13:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PSwVh+0e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C14331F01579
	for <arm-scmi@vger.kernel.org>; Wed,  4 Nov 2026 13:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793798080;
	bh=/p5+Pyk6coILlORdcQBpVHNHSFgdC438Pn8Lrp7EWZ4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PSwVh+0eCTT+b5fCxey1CsR0b6m5BP0NC9rEWv/qGoVAp7z7b/X1baMHbpDnRhHw0
	 1IlSHrcLAlVsg55IpOJF5Nkvf2vaGC/fHZEyKH+Don9up9zSqgKV37V5nainUewRr1
	 tAyK+1WI3fZ/i42mU5cbzo+HvC/82f7rkN3yxsVGBPX5SeP8DXJpSKARcrEvAMNSv1
	 RLgoTtiG3rPcDWuwk0+yNZkdNee1OkZ9GCZo58XY+OQNfYVWhHMw4oNuRfTNNgiFs7
	 4AkeoxFWz8uacgEWDIjPHFeVRqn52p+Yr5AhY/9vo5pidgnseQ+ftRBNMagtn2p8xU
	 Pbq1Di/rgQkDA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be4fea434bso1619635e87.1
        for <arm-scmi@vger.kernel.org>; Wed, 04 Nov 2026 05:14:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxNEaMeY1k1K1TAbyl7SiXiC0ZFYhpI2N/kClewr+JyvvAJhc+LE3erUZ6Pnv6vxzkFw9SAbSDqPA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/0ZX/0tQsLTTvPrykzpVkJFJCjeLEPB4MmA1KefGtZmC/lsRng
	pPOBWM1ryGisBAjRWZDQMOpEl7SXlvob2B91pQJulGAXtXphICA1eWo+YNVU2vyWV1MBvP1E0FA
	gieEppKhhoBr+bQ8G2/FOlWHIH4zHckQ=
X-Received: by 2002:a05:6512:3d93:b0:5bf:ac46:c5d6 with SMTP id
 2adb3069b0e04-5bfd956d81cmr4929046e87.12.1793798079384; Wed, 04 Nov 2026
 05:14:39 -0800 (PST)
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-a210-scmi-v3-0-ee6b31580808@iscas.ac.cn> <20261103-a210-scmi-v3-6-ee6b31580808@iscas.ac.cn>
In-Reply-To: <20261103-a210-scmi-v3-6-ee6b31580808@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:14:27 +0100
X-Gmail-Original-Message-ID: <CAD++jL=5SypKyjwb71hT2pzTZ3s9qi62JG_EevyjTjGgTZiE8w@mail.gmail.com>
X-Gm-Features: AclHuK-6MXT5O-NfPKrU9YAGzhqKyzaaZr6RTIvrirwYp92eUVqCIspXmcEerPc
Message-ID: <CAD++jL=5SypKyjwb71hT2pzTZ3s9qi62JG_EevyjTjGgTZiE8w@mail.gmail.com>
Subject: Re: [PATCH RFC v3 06/17] dt-bindings: pinctrl: add Zhihe A210 pin controller
To: gaohan@iscas.ac.cn
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
	Jassi Brar <jassisinghbrar@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, Inochi Amaoto <inochiama@gmail.com>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <me@ziyao.cc>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-clk@vger.kernel.org, linux-serial@vger.kernel.org, 
	Han Gao <rabenda.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 8:45=E2=80=AFPM Han Gao via B4 Relay
<devnull+gaohan.iscas.ac.cn@kernel.org> wrote:

> From: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
>
> Add a binding for the AON, PERI1 and PERI2 pad controllers of the Zhihe
> A210. Every pad is muxed and configured on its own. Functions of the same
> kind share one name unless a pad can select more than one instance of
> them, as with the UARTs.
>
> Signed-off-by: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>

This LGTM, just waiting for a non-RFC version and DT bindings review.

Yours,
Linus Walleij
