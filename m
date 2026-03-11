Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264BA29B200
	for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 21:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773265714; cv=none; b=l0sNZZdQMPXba6bcOHjiWrtIjP5uAnW3oJUrTHCDiQ/mlVovodPeNqR6jO0bzG260Ds/qrsOJE1IomPVmaonuPilt2Vv1naCUuKKDS7zDPE217RcaHU/dVu452wzHlIZJxEz8YlciR4kalfo2/l6anudGBXmr88/cBXHYfCnFq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773265714; c=relaxed/simple;
	bh=4d9ICQgMGn737lFng8zTzekpH62ZVrTTn7Jw6FV4RTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eYn5rlzB8KPFMhFDa6FyJX3LfqyILYFVPVSt2yZ8XOz21Jzoy/t3YYdwUw5jv58mMykAt/orpPOG44r+w5Sjlx+eIKcNDY2uYVF0ef3L9E9Sv1wf3/ql5S4TS1WSZUY7VcTSJnkZo05K6CWd4+uBR0wlGhOln7Al5bq91sg4AO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aux41JIa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aux41JIa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C23AC19425
	for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 21:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773265714;
	bh=4d9ICQgMGn737lFng8zTzekpH62ZVrTTn7Jw6FV4RTI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aux41JIacmvDLeMC6HzvPVxav0Spw3zjyoVHDO8umpElfELTYLNrEYkCLvX1fe/un
	 jtWhYXCBEvUXkWSgMMX8y2LZicAb8t99OZEwFQ/YJkR/yMfQASZCPbyNHQ5SDZ4NQ2
	 9JmtQXxGb3V9nO8P6vQjbXpHaNVgfLPhkc9RVraID2cv0ngW3iAXOw4yxoTTOJSEP6
	 UK9OD+a2KFfpFIxs9eiGynufn06l3BDJUjSVYuaMKMEQTHuS8FYiMqDm3sw5fb7FEg
	 xDM1RVE/90txtbvJxgU/ea9Egk6p0KfJiHlJG/TWEZasm+p+8Huj0x73b6TFKw3xrY
	 geA1r/WPHwtlA==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-79800183233so7020107b3.1
        for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 14:48:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXurL2MvODGGXj5hE+WJz/SfTlf2y5r9L8+geEHFms/02ngPhddbIVy4ArmD0b2wRCHYA7h6I183A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhP/Yf0rwws3Wr65gDGiEN1Y1jkibSPW3/nm6SkM4lYzXhUg9R
	KRw0DK75u0uPK6dYISANXQtUzVG5do+zUBiOKLzBJFE01J2d6ZY0goOLjZI5BeViIS2oi8kVHLL
	5gl5EN5cZggwPszirnP7jSTAcdDeCrfs=
X-Received: by 2002:a05:690c:c4e9:b0:794:f400:2bfb with SMTP id
 00721157ae682-7994758407dmr13266347b3.26.1773265713464; Wed, 11 Mar 2026
 14:48:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1773150895.git.dan.carpenter@linaro.org> <b58462e99ab76971d94dcaf973bc947c7ddb624f.1773150895.git.dan.carpenter@linaro.org>
In-Reply-To: <b58462e99ab76971d94dcaf973bc947c7ddb624f.1773150895.git.dan.carpenter@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 11 Mar 2026 22:48:22 +0100
X-Gmail-Original-Message-ID: <CAD++jLntWDu8V_55DOeaqQpY9EXXwszM0j_uOrpm+-nPF+vScw@mail.gmail.com>
X-Gm-Features: AaiRm52tePKqRlepUz7lGoGWkNcLkq24xiJuAqlewG6WVEATyHcSNtsT4I-t3rs
Message-ID: <CAD++jLntWDu8V_55DOeaqQpY9EXXwszM0j_uOrpm+-nPF+vScw@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] pinctrl: Delete PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS support
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	AKASHI Takahiro <akashi.tkhro@gmail.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 8:38=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> The argument for PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS is supposed to
> be expressed in terms of ohms.  But the pinctrl-scmi driver was
> implementing it the same as PIN_CONFIG_OUTPUT and writing either a
> zero or one to the pin.
>
> The SCMI protocol doesn't have an support configuration type so just
> delete this code instead of replacing it.
>
> Cc: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
