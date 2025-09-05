Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E12D2D0636
	for <arm-scmi@vger.kernel.org>; Fri,  5 Sep 2025 08:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757060848; cv=none; b=Gd4TyhHlm+0QL2MihDuagm7GwvEsmYQpIbY9bRzppSSS9kIP5oHxHZ/XJqi7DRjbPhq9XLAd6Z6YdmJvzKtbUi39mJ7OROz1zb7InnWsplEAtxsklF51JPgjt6+YA4uUD+3kMCuH9QAgmWytCi9P2pNIooUYHMxRcmZG8Kti8ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757060848; c=relaxed/simple;
	bh=d50XR8Ek68VTj9Ma+5BQ3aLpOanjEBi3fnEwSp3JWkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CsaqGd8fV+urQLl06N1fPNW0MGfIq4cdui484BawooSpkSAfj1XmBpW1OHD4gvKrawqQ6jDWy7zdMx/2EOsj77SDH7O+RKnFNOC9HQM37XEAeKaEb1t2YNjYvnJwgLEegiSQaFGDlHTryfHBA9SXpirVvaCVK4JbkAc17l+jnfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tph8Y3dQ; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tph8Y3dQ"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3381df3b950so7250711fa.0
        for <arm-scmi@vger.kernel.org>; Fri, 05 Sep 2025 01:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757060843; x=1757665643; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HT51jpt+Z9rLQOZ4eY3k4SmSZF2os0NLvUCHbQ66xmE=;
        b=Tph8Y3dQkmS46e/hCZScFw+INv+3CP9okpqXVVmSVn+Z+DlvybG+/xlLEfsHWscrIQ
         maBNKpoZqwgrbX6j2Pbjfyjt6o2bJEUuUAeZXR743O5ixmh6+KlQqzukuzNOd7kUVvnN
         TkEojreIYS1S9TAnGzM/bCMiOLOP/O+MH5fBLh8ULq1U7WZUY68MFrpL/Xf2IJAJVdCG
         hyr6l76Vz0sUIXTUYYzfcElU+zJcQ08FJTtEHVCrAq30BaJMe8Qt0zH7I+e7n8G+Pxtz
         00swWK08MM/AdZPPbmrgE+c5ZcwvkALrKzBwmMbMu9SZC6b2OO+8UDb51NqyD3NKau6q
         oQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757060843; x=1757665643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HT51jpt+Z9rLQOZ4eY3k4SmSZF2os0NLvUCHbQ66xmE=;
        b=LkUp1armg+KqOr1eXZiVEupifSvoOeAFcnP6qA3dtGkrWKDPldyIz+CFN5B5aVKv8z
         2M74cxQ+aoE+cr//qWKebUDzFKr82lb9LDtD+uhdEC3STqYoVFwYwo3Oy8acH8FOyXcr
         ecwZHV4wvnN+qDuY0gh4JZ1GrnR0Qt2kVS8Y3C5ntAnAuCTXwVkW5tBuE7a1kkRQdEW7
         QY7wsClYdvM2D50lbY1V2UxIkUy2MhgEpZxQwSZh4tkUB5Q3ufO5uXxI8YRq2jf2mQoE
         zMerdonN/jln8zXhHUKOaRUqmabKEivA2ziDHrAkM4+6F7LFsW2e0pKE2KVWJotwcFLo
         FZnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXblI+wx1KKQmYMNNRfkNyKP66vmWKOaii/grEZsxyctg+6scEsY7CEL13LZEc2FGBX18vxRCNIBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgfQnTbRGvzu6mQurTLWNWevaJsxal6EUp9zAGSK9J1gl+b25v
	SJeixaWpkoW7DvZuCNzhoBUQ/iJOp5qmSl8c/MYTeR4RhnxkDzV2sOEj5lvVXcihbsKf0s5APjt
	wCr/eJhzszz+gOwbln8ZUt+YIBZllhUpUzp2GzqeRWA==
X-Gm-Gg: ASbGncsw4X679GatWcRR55cHahNTHsk8hQ4YM5M8b9UZrZOItJdVRFqm2dXnD9AtVRv
	B4yi6aUvDKTwxX+Lb5rzTZL/dryN26WtdbYFvY5kxEXyXXn59YNaVMr4oFsCcndMqCN6RrlCj91
	IJDVw8vBy7r/zuNwln0bpEn3JokFELSfFUbj1j1Hm+AeNTHyoUHkwA+Fh/95p4/4eq93OPfFTlq
	ZB1As0=
X-Google-Smtp-Source: AGHT+IHgClXJUzKdm6E0qr03i75G/PjSbG8pXmI/SkiwOzOUXWPeDlRcSIjt3v/vZ2+YkFRuc2QKV+aPlIPjoSHluJM=
X-Received: by 2002:a05:651c:198a:b0:339:1b5e:17b1 with SMTP id
 38308e7fff4ca-3391b5e19femr3818851fa.38.1757060843564; Fri, 05 Sep 2025
 01:27:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1753039612.git.dan.carpenter@linaro.org> <6f732f53-7e00-4f0d-82a3-480bc81497bd@sabinyo.mountain>
In-Reply-To: <6f732f53-7e00-4f0d-82a3-480bc81497bd@sabinyo.mountain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 5 Sep 2025 10:27:12 +0200
X-Gm-Features: Ac12FXyee60oY8WOLdfjOHFd8MRN0v_dxWT060-4JQvkwWFEV5hFh8euv1Jxz9o
Message-ID: <CACRpkdZ9EHoHiKit+T-ur0xDKMEoN_=TydzTfoggNBQGdra2bQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 4/7] pinctrl-scmi: add PIN_CONFIG_INPUT_VALUE
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, AKASHI Takahiro <takahiro.akashi@linaro.org>, 
	Michal Simek <michal.simek@amd.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 20, 2025 at 9:39=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> In SCMI the value of the pin is just another configuration option.  Add
> this as an option in the pin_config_param enum and creating a mapping to
> SCMI_PIN_INPUT_VALUE in pinctrl_scmi_map_pinconf_type()
>
> Since this is an RFC patch, I'm going to comment that I think the SCMI
> pinctrl driver misuses the PIN_CONFIG_OUTPUT enum.  It should be for
> enabling and disabling output on pins which can serve as both input and
> output.  Enabling it is supposed to write a 1 and disabling it is
> supposed to write a 0 but we use that side effect to write 1s and 0s.  I
> did't change this because it would break userspace but I'd like to add a
> PIN_CONFIG_OUTPUT_VALUE enum as well and use that in the GPIO driver.
> But in this patchset I just use PIN_CONFIG_OUTPUT.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

I tweaked this patch around a bit and applied: removed the second comment
in the commit message and wrote the docs to be more generic since
in the future other things than SCMI might want to use this
config option.

Yours,
Linus Walleij
