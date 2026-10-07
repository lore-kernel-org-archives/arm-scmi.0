Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55ADE38B12A
	for <arm-scmi@vger.kernel.org>; Wed,  7 Oct 2026 06:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791355752; cv=none; b=oWBYx2IDO4kCO71cvUNYhR2u/k9eVxlyDt+QHNw6N8M2jvmWmjjdda3UxrMu99EpJql48NoCmBdkUMX9Z7F1II8ITC4NJPUfEJsnksq42xteBkuBCrJdmyJ595X6jnXJ8ts0yvpQ5gEWaz0mqaN4G6a7Cup+Q5Yg69tfiKwpTa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791355752; c=relaxed/simple;
	bh=kVXuH7H4PDcskImrivyP/VtzUO54yTkMmhV+cSg/PdA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I0ytS6tilHMfScrPT7v9qlJeU5ZxQyFXW7dw4rbsI++/U2B65OfpBCxy4w5VslmRLO/VRD6z5XoiKFemGa0n3pj+Q9oqmMWunByioVrMsI4T1wiHa92Q8sxYVepn1Zy1H9NwxRo1yYblKAenEBeQfX9TalLn53l569WUsgZWrLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dg/APZQ9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dg/APZQ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA4771F0089B
	for <arm-scmi@vger.kernel.org>; Wed,  7 Oct 2026 06:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791355751;
	bh=kVXuH7H4PDcskImrivyP/VtzUO54yTkMmhV+cSg/PdA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dg/APZQ9ejy4HmKPDmWJ49DQjYI8eWTCX2U9HoU5cpY3x9Rp89PIqyA8NLJL0FwtJ
	 GMzK4tUOwWk49yYln+oGbbud0wd+E1ne0Fmx4u/kimPS1vwfpbRml7GQ+ixnK3WLy5
	 adZ7iVP2QncNkxmIKC3Dhq6N3u2YYx+tYwo97iXjIw81UJ7iupGbyvfRCJaeqOgE3+
	 VTVO/i9lEVYeS//KnuemuoJQ9Bhbgdxg47sJreGtLXkIMBl+Vr5niUOqlFYNtkozg9
	 mGCFqSQyXN8Tou3REIxsoHqM2zX/h5J9SJoWUqMbRVurUKh76v8oQHNBpM1OPIMfQC
	 G4LuA1C3AaIVA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bcb4f23ddeso2507040e87.3
        for <arm-scmi@vger.kernel.org>; Tue, 06 Oct 2026 23:49:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz8sd0cklzrxFdZnnWLDf5rclnvoBoscyV4lJdzvP4xDQWcKVedalEGcG7+km0K/87mSKY/g2AM+A==@vger.kernel.org
X-Gm-Message-State: AFq9FYJwbKu7Ka3SAwidhjQOixb4arHm5UnU+e6oSZypPTXf6+FoxHzS
	ha1q5KydR5DmN6fkIkJ0GZhdDsP0PzmxhM4gbkRXFoKo6aYcMb+Sj5K3h1HlAr/ZNCQRn+L4qk8
	FJVBznGaPeJ1Yl8zaD6cCtE67P/5NoP8=
X-Received: by 2002:ac2:51cb:0:b0:5ba:3443:aa2e with SMTP id
 2adb3069b0e04-5bcd06dde9emr392580e87.21.1791355749772; Tue, 06 Oct 2026
 23:49:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917-scmi-pinctrl-generics-v2-0-3eeee364257f@oss.qualcomm.com>
In-Reply-To: <20260917-scmi-pinctrl-generics-v2-0-3eeee364257f@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 08:48:56 +0200
X-Gmail-Original-Message-ID: <CAD++jLkgBKDvbxsnhsBE_Qqs6TA8how4J2jvKm=tdpx4P+4JdA@mail.gmail.com>
X-Gm-Features: AclHuK9LebUk8FXXJTxUAdYqh6ANC6YbZR1Kg-AkYL0dvrplEgSlwXOq9S4AtEE
Message-ID: <CAD++jLkgBKDvbxsnhsBE_Qqs6TA8how4J2jvKm=tdpx4P+4JdA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pinctrl: scmi: Replace get function and group info
 with generic callbacks
To: Alex Tran <alex.tran@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 12:56=E2=80=AFAM Alex Tran <alex.tran@oss.qualcomm.=
com> wrote:

> This series refactors the SCMI pinctrl driver to eliminate metadata
> getter callbacks to be replaced with pinctrl and pinmux generics
> provided by the pinctrl core.
>
> Previously, the driver implemented its own get_functions_count,
> get_function_name, get_function_groups, get_groups_count,
> get_group_name, and get_group_pins callbacks, which required
> maintaining driver metadata like the functions and count.
>
> The pinctrl core already has support to store and manage this
> topology in the pinctrl_dev via its own internal radix trees.
> By registering functions and groups at probe time using
> pinmux_generic_add_function and pinctrl_generic_add_group, the
> driver can delegate group and function metadata management to
> the core.
>
> Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>

Patches applied!

Yours,
Linus Walleij
