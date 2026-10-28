Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793177819;
	b=EcCFX491xy1G3x4KSTZi2QWH6ppG1aRrtcDxxywPM5o4kFb8hsMNJR+w7XjIPYez4snq
	 Uya4YA1zsibiH6rXZu8n8xlS+rHWyf/rwUQz6cXaYSpA5wJDuGNy/xxewRBab5yf8wetR
	 tKcQGjL0kjMiXimh5IC3ykTOgliOO16aC3gitEYdoGE1xCTM/3MBuF//d/GIue8enjDV+
	 LxKfHwgXkKlUJ2jCTTZF8iHVpZ/xgsQYQ0Zmvtl3FPgcCiWAllNTJnzm6Ik4c+H70W5EW
	 uTwkYyx8IcZlIUhQU5m6FjscyOLO8U1Eq8Yo4GeDlXFmyMHBgYg/BqEQMxx/F0g9Bbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793177819;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fgalwktVNpsEZDXGOqK911Twumi/NQcKln8PLWf3Upc=;
	b=Sz0J8p0tT6R7HKhPUai5Zs98wnvHjsYgqjxYI/PgFJTTO3sGIpk6Vh2i4dYvmT7QERxC
	 4SN46dSMFqGS6gRKgO5u9VWQR7PiDBb0u/eRBjpzY4PQoZH7bBS9A/F9f/gW0JF9+Jo+V
	 L5g1H5rw1y/4Q8lziQ/BmG2LWC7wugMiFUH8CH/pylRwiSTZPKX9Ds/s2e+4kYVEqInAn
	 rHrkaNcdQ70tFweCJTK5Vp3Mv98glTf3VxDzNy45Gww/p3aPueC23/HcucZch9E3wnflr
	 RM0CQjhMDa0XeufxnSsS4dlikLdX5hhPYgUL88t5a/zjgAbVOjhw9NqOGTdrOMmFksg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jSLeQyh+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B14606A323
	for <arm-scmi@vger.kernel.org>; Wed, 28 Oct 2026 08:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jSLeQyh+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF7741F031E7
	for <arm-scmi@vger.kernel.org>; Wed, 28 Oct 2026 08:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793177819;
	bh=fgalwktVNpsEZDXGOqK911Twumi/NQcKln8PLWf3Upc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jSLeQyh+qbLVAO1mKWtTM/FDtPOtfpuK0/TbyiQhG6Pyhhgqbm+9yJLiA+gvtMk6Y
	 XRwh/kHVNx1E951l++GqPTOjkCGLNVRBkMg2qYwe+w/3zSirIOA/OhffiXnHrXNHMu
	 lpDhOD3tXZTGPVfzVAuViiF41Hg4tcIPRYCqFambRRjovd9Fn+xEV0drLdUpyyie4l
	 KxkIUECOIY9Kuq0JQh0GPq424UE6Vc7+ubguSS6v1/H5N1XlOlNAsGTw0NIM4q1Ant
	 sO6NFq+vSrMS7aQEBea5lv48G6CEQs4G+03u5VNMw5xEBL3yHi2nEpPGHwvXzx2L3e
	 WGqq7iHNJmNLg==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ab01c46697so4938321fa.1
        for <arm-scmi@vger.kernel.org>; Wed, 28 Oct 2026 01:56:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxg1cXuR5AEcj8WtPqIaVvhJH93IksTCHwlrRSHjJguWAlwsnPJxYPI8A5Jgn/IJFN4SW/Q8kjd4g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJVgZTG+VFn0JdfL64ItW/3c8CCPQBwE2d4yq0AxA4rYT7zAskc
	7Xb8K/CGGF2zgJntnM8bv8I07So+4XBUW/IjOfT1+6foC6CqyLW1QmyPQ+9LGPABHZ40/svVGyj
	SkUtTyr1ZfuWAFVCJXQCkSndcHUttlKiSS6Mtm4fN5Q==
X-Received: by 2002:a05:651c:150d:b0:3a6:58f7:da9a with SMTP id
 38308e7fff4ca-3ac9cfcc25emr3279141fa.27.1793177817298; Wed, 28 Oct 2026
 01:56:57 -0700 (PDT)
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn>
In-Reply-To: <20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 28 Oct 2026 09:56:44 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mc0rznLufJz-KVY_d1nDU_wpMM8E0bho7KJCfG6Xn01SA@mail.gmail.com>
X-Gm-Features: AclHuK9mMPE05cIDjki8s1mLCHmR3I47pX_uEOr7Y0FdJXyzRik8jx1n3BBNXe0
Message-ID: <CAMRc=Mc0rznLufJz-KVY_d1nDU_wpMM8E0bho7KJCfG6Xn01SA@mail.gmail.com>
Subject: Re: [PATCH RFC 00/18] riscv: add initial Zhihe A210 support using
 SCMI clocks and resets
To: gaohan@iscas.ac.cn
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
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
	linux-clk@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 4:37=E2=80=AFPM Han Gao via B4 Relay
<devnull+gaohan.iscas.ac.cn@kernel.org> wrote:
>
> This adds initial support for the Zhihe A210 SoC and the Melon Pi V1
> and V2 boards. It replaces the earlier series [1]. The way clocks and
> resets are handled changed completely, so I am posting it as a new RFC
> rather than as v2.
>

No, please keep the numbering. You can add the RFC tag and still post
it as v2 retaining the changelog. It makes things easier to track.

Thanks,
Bartosz
