Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DA0317147
	for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 21:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773266015; cv=none; b=YShPDbh3WkUnsto/7TYjtr+03TQ1o3OR8/iLZvdXJTQWvml/skM1/N1GzpsOLINbxS393e9ehqn0zwjtBOXwyY/5JkpoLvAlO+J/CVBHOwcZ3MeCQ+cB9SYbZqJIKHs6xzzC0ECBbrJXKnbi36gC53lM+qCPt6vMyA7RJWqsiSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773266015; c=relaxed/simple;
	bh=4D9rM/c63SAlIWFY7S+unDB5km544PdbdTrh22X4PNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M44DezpFXGDXcpZpZFnRyiyQOekJ2HSTAAbrD9uwrmn/Q2y7ZdIxXhZGkhGmfYhMb+e1hV9lRXAadf+026abbPItJ6v8Ap6AX8U5soDP80LYRuW18ya9pKMG5etAMqCN4QiPXmEsh1HC3/Xko2sNjDK60/H9TJlfuV9rF9ny8FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qx+acuNo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qx+acuNo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF98C2BCB1
	for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 21:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773266015;
	bh=4D9rM/c63SAlIWFY7S+unDB5km544PdbdTrh22X4PNk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Qx+acuNog1x3P67EX3gv7VPiD8ewiC+IiW1E5MRHx16I6jXepxGgXd7Xk/49xb87w
	 VB/ClTQC1GLrenGjILS9zepWUHlMHRu4cppfe1zHIKBJNJXQ8toQDl0jB2dNMT9F/M
	 cdFs3ASSHg9MMjKUyy1WI88nzLvZhahFEQvYSd9eNXp2qxSOGXfB4XmvEAvvhYULmw
	 MDswypLMp95FWdrJk1dvPUhmmwexQfnyQgHovDE1Ub8YQomZxNAq/VVHZ6+Cqdqpb+
	 B3Qifm0U561VGHByLzaNKSdytrKjGGtJch433BGiSPHKgQPqEH0wOyjnDHnJgIh12G
	 +d9SbRIKhJkHA==
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64acd19e1dfso404867d50.0
        for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 14:53:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV4kyQ9yUD6X4NrUHOvWds1tiqBvTwrOrTbJ6Bwj9nwjmE7UiJAgFUlJ2c9JvFeKavqrs9lLxpKJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyTvf0gQui8LQeXMi8im5noH4U+JunsSC5KIqOoWSV2gCQaqhl
	L/N3maYG/azbcAZCtK4dhj53J/8y2qA5H6/wWA4eb5g1jU7g0d3q9Ckd5XF3cPtiBddkeCd/ra3
	3mtPRRG7gU3YzUqCuzZec+ySt48rIg1k=
X-Received: by 2002:a05:690c:6f0f:b0:799:182:17aa with SMTP id
 00721157ae682-79917f6a0d4mr42530957b3.41.1773266014325; Wed, 11 Mar 2026
 14:53:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1773150895.git.dan.carpenter@linaro.org> <58446889d781435424c46bac563483e603d7c0e9.1773150895.git.dan.carpenter@linaro.org>
In-Reply-To: <58446889d781435424c46bac563483e603d7c0e9.1773150895.git.dan.carpenter@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 11 Mar 2026 22:53:23 +0100
X-Gmail-Original-Message-ID: <CAD++jLnh=ei50bm+m23k4NKQZVYVRZP8FuBdm_XmzkogMVsAog@mail.gmail.com>
X-Gm-Features: AaiRm51cR-8gCJdyzlUDaMIodJ8MR_H5Ul1TeF-jzXeyh4Sj2RMDj9T51Mz7yNA
Message-ID: <CAD++jLnh=ei50bm+m23k4NKQZVYVRZP8FuBdm_XmzkogMVsAog@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] dt-bindings: gpio: Add bindings for pinctrl based
 generic gpio driver
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: AKASHI Takahiro <akashi.tkhro@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.og>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, arm-scmi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 8:39=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> From: AKASHI Takahiro <takahiro.akashi@linaro.org>
>
> Add a dt binding for the gpio-by-pinctrl driver.  The driver is used
> for doing GPIO over the SCMI pinctrl protocol.  There are a few
> mandatory properties such as gpio-ranges and ngpios, but it's not
> mandatory to specify the pin-mux.
>
> Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

I think Takashi's original idea is sound now that we clarified
the level read/set semantics!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
