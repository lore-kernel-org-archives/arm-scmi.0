Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30522ECD3A
	for <arm-scmi@vger.kernel.org>; Tue, 24 Mar 2026 13:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774358386; cv=none; b=TO5NhPNnSmhXo7EKm/DyZHjRS9LiC2zhYru35zaKGbgM9z0tDH+y01aBV6vOl+3Ot/C+SpV5NBhN+w1lgcJYTkiRkB6LJwEP6KcZ8bBjbCOLm+m23fHOBTOhTDjTVcoA7aXaIcTAwr9KQvhJyI1vXOmRmPMfOkpyp5MFS+5Ew/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774358386; c=relaxed/simple;
	bh=sUwWBN+L5vBt9MtcOkpmh1ZOM7hZjiguyxrPzePsaKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ENV+43IuApYY+ZuSpBuQr/Z/uhqXaTsbgZKMP6P0bkSUb2qbLd5Nsa8KbCh2dixakFxqZhxb1jD3O2jVSIVpKjWsi+raZzi8P3tNvG/kv/SJDelfXTeFY7uNco6UxZaeHsn9/R/tHMI/Yhb8UT2nS37/zP9H5GwQd4V4XPM47lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZBwkojXH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZBwkojXH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85B68C2BCB5
	for <arm-scmi@vger.kernel.org>; Tue, 24 Mar 2026 13:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774358386;
	bh=sUwWBN+L5vBt9MtcOkpmh1ZOM7hZjiguyxrPzePsaKY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZBwkojXHCEuqyjJnqLbKWotstbK7ZjE2NNZDrmMjagJCAmEJxNPpWr5dnWC2XRb3K
	 6SZ17Qi8wlHH8f1SXfgOg0v77Fz72v/Ztj/3BIccauCldcySJ5fenExVF2mYDMGS1d
	 Beq78vhQTVkEPoYOKV0s1OywqSBalDb88eu956IDIfwykmmLVZPc/fDSEFiD3lwjsE
	 b0wQ075w2rBHV5KKbwAJrPiXp7D1ZnPaJ71oFxmi7t0iFBbVcV4ljGd0ZC9djVhyyk
	 EDZiJ8xyX+nLza+86ZRtpBDgj1mYIhvXwVq6lkyshWuGjmwxPxM06m1dSoISJkr3Td
	 XP26s9Dwqa1Kg==
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64ca423ad53so1410513d50.0
        for <arm-scmi@vger.kernel.org>; Tue, 24 Mar 2026 06:19:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWpfHkeVD9YfSOcWj99AD0kGnk2sRYyviwIQS4zFyraH2S2UvR0LWa139tzASoWD8dOE2E1mwzqBg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg9QlkLG2VMrcUKCrE0NhtYo8VfEHL/PXp3brOj5zmqrY5R3A3
	bu8QCplsbTBWb5oCydgT37s0AKVKtLo+tziZV5jWOakuIQ9o22ORbGJ9ifYNt1fqLqjHyeyMOsU
	RC0lHSYM9HLyQMTLJByyJT8HMRsm3E54=
X-Received: by 2002:a05:690e:1a52:b0:64e:c68:8ee1 with SMTP id
 956f58d0204a3-64eaa69ebe6mr11550490d50.8.1774358385617; Tue, 24 Mar 2026
 06:19:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1773256350.git.dan.carpenter@linaro.org> <1048331f5d3c8e0cdbe1542bcb65bbf942a4275b.1773256350.git.dan.carpenter@linaro.org>
In-Reply-To: <1048331f5d3c8e0cdbe1542bcb65bbf942a4275b.1773256350.git.dan.carpenter@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Mar 2026 14:19:34 +0100
X-Gmail-Original-Message-ID: <CAD++jLmfRVGGHH1EqMAeSVHVCr1-s2JPyuY_w=2h35_mKUXj2Q@mail.gmail.com>
X-Gm-Features: AQROBzD_rVrAsbDukAvkngaYGMUewIR7TXu0vqz0CaG8_h0ydLheVygvbWR3rso
Message-ID: <CAD++jLmfRVGGHH1EqMAeSVHVCr1-s2JPyuY_w=2h35_mKUXj2Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] scmi: pinctrl: add pinctrl driver for SCMI
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Tom Rini <trini@konsulko.com>, AKASHI Takahiro <akashi.tkhro@gmail.com>, 
	Peng Fan <peng.fan@nxp.com>, Alice Guo <alice.guo@nxp.com>, Marek Vasut <marex@denx.de>, 
	Greg Malysa <malysagreg@gmail.com>, Michael Trimarchi <michael@amarulasolutions.com>, 
	Yao Zi <me@ziyao.cc>, Arturs Artamonovs <arturs.artamonovs@analog.com>, 
	Anis Chali <chalianis1@gmail.com>, 
	Nathan Barrett-Morrison <nathan.morrison@timesys.com>, Paul Barker <paul.barker.ct@bp.renesas.com>, 
	Utsav Agarwal <utsav.agarwal@analog.com>, Ye Li <ye.li@nxp.com>, 
	Valentin Caron <valentin.caron@foss.st.com>, Vinh Nguyen <vinh.nguyen.xz@renesas.com>, 
	u-boot@lists.denx.de, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, arm-scmi@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, 
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>, Michal Simek <michal.simek@amd.com>, 
	Cristian Marussi <cristian.marussi@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 8:41=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

>         scmi_pinctrl: protocol@19 {
>                 reg =3D <0x19>;
>                 pinmux1: pinmux_test {
>                         pinmux =3D <0 1 0xFFFFFFFF 18 1
>                                   0 2 0xFFFFFFFF 18 1
>                                   0 3 0xFFFFFFFF 18 1>;
>                         function =3D "f_gpio1";
>                         groups =3D "grp_1", "grp_3";
>                 };
>         };
>
> Under linux the pinctrl subsystem will parse the function and group
> properties and use that to handle muxing.  However, under u-boot the
> pin muxing is done using the "pinmux" property, which feeds raw SCMI
> pinctrl PINCTRL_SETTINGS_CONFIGURE commands to the server.  The
> numbers are: selector, identifier, function_id, config_type, and
> config_value.  In the example above, it sets pins 1, 2, and 3 to 1.
> The linux-kernel ignores this pinmux property.

This whole thing is a bit of a hack and shortcut to make hard things
simple isn't it?

The information encoded in the pinmux property is identical to what
is found in the function+groups property and that is why Linux does
not use it.

Also device trees looking like this will not pass validation or be
accepted into Linux, as it is not part of the official bindings, nor
will it be, so it creates a necessity to maintain forked device trees.

If U-Boot want to do things this way, I understand it: it does make
the pinctrl default set-up simpler, especially it makes the code
smaller and easier to write, which is something bootloaders like.

I really can't endorse it though: with deviant device trees and
information stored in paralllel in two places we create a
maintenance hurdle.

Yours,
Linus Walleij
