Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6B527BF93
	for <arm-scmi@vger.kernel.org>; Fri,  5 Sep 2025 08:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757061105; cv=none; b=d02McEsM2+pTP2aVmAPsoTvFqXVturP9l95Jb2R932toUVeXdTKP+goqGdAJ+uCjHXCJQq/gs7Bh20icFpbGU9XmSuHBpnQjXN5OceG4T95ceVSH20MehlAW1jRsdvtH6SINMfONiJcNwT1GcJTvJz4swNT/bjk1Q97l4LeSC4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757061105; c=relaxed/simple;
	bh=Cqt9y5Sd8p1bw7JwUAV6Zf77Tsf7orn/JfVBQl95338=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EyWxWIipnKteh6HPq4AsYzCDOWKOdndgkQp9eNUZ6WXHyjQfb+I685j6RHFOdy1JXA+uEg4aNxQ5t/cNeYKqy+IyqirHzl9AVmXB8FdFleeRBI7BLr2WIYHcPKKJdD6fP4zWHtACE/QfrZIYbqH3YOuOCpEa0ZPzxRycQ4tgt5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aP3mZzXq; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aP3mZzXq"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-336ce4a8bfcso15935021fa.0
        for <arm-scmi@vger.kernel.org>; Fri, 05 Sep 2025 01:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757061102; x=1757665902; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9f+++oJEJogx7iunr2Qwd9nxHYBvpJqjgZ7eo+XnEyw=;
        b=aP3mZzXqbuXN6P0CrCqMWEhnbpuDcTCN748SKuhKIDSYlqbHc9DIi7/afmqqShYQUb
         vMmZe2/GXwv5yz1Nu+KnmbSwFub3vo+DuxxBOdaHkvM9eQR3kfH3A3WnWRC86IG7hP2t
         lw5y5QX/Eh7NEKFk/QHVaEv2gZu3LmEDDg9LHE3CDSMpQzjiB9c/Z0g8lkCTYeFTWedX
         4lz1rEAlZ8aWo3oUe9lhqkFZ2KISzWCL/1xzLDiXiTAO1XtDmSUWDZnKx252u4UbFUrp
         t8T1UuaydpPZw2YNInHEbPZFS482MfzN0EfjBdMo+gqe6uNg6R9EVRDOTsufCn3dELIv
         /JPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757061102; x=1757665902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9f+++oJEJogx7iunr2Qwd9nxHYBvpJqjgZ7eo+XnEyw=;
        b=DbaOT31uWwriGkTodsAftQc5HeS+wNlN1SaCjFXMSdQ+c7CI8D2/pL8uew5mScxVIY
         VnaBC5NkYRqpUMZziQu/w+0upkMj3SsRO/r1QHv12qEDs9pDuyIFMF+NFeD+ZYlYcfeb
         QVjwAyc+1vQfYl+xEDEPNxM6rbvYBjwPcdjbg59eWuzg9g/r9641gBb9f0mHyWNHd1EL
         ywmtwt1phybyr1Y9y4oRTyPV8HWPcpTe7gJVH+yQHn4cLeECdl+668k7U+UwjRpszHst
         NMPKw1dwsfVkCgGEYP0f4y6XZrFpNWwqjkG5ltoK9vbKPfW1ZtIHDndwgIv0whKhlrNh
         4Fhg==
X-Forwarded-Encrypted: i=1; AJvYcCVb+htShZux11ZP64mAhRVgdln/zVUppM7KVrM7aMNf8drFpRhZ/qx6ddrGdSGNPt6sxJYAFUlrrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdiT/io7XW4NO8ESylKoODBRS1kJV4JFgJ5jwH15VYpJzDTIZu
	6pmAMMk7O3BAKBVf3TvX9Dm4rSsnRFwWcXHw42nU6vI4rnNtO/6TtVEDfa2nm2baid+Enk14SxQ
	x7Z045nEIfh4SdB4tv6jMvx/tLHhZmhBqabDauYbv9cqWyUMCF0Rz
X-Gm-Gg: ASbGncv9VOZLsQfB2WckJPjX6eFbSbq0J6hY3riJKTLhinLjgE3nUy6s8Sn+Hg0tIO3
	o8Z8I3c9AL0nbkjADjuy4qq1VXh/wgE8k6sq5/MUCzlIjK+jQUjag7yPFdX2wWwI7iDf1udHGhs
	1fYACYBjZwr7qVoKNBHlQsXDU1CaahI+vBhqutNmxYHifwkRENfKu+4NTxl0pbaiD4Uwy17Sg9/
	70UaXuVXqERuYObCw==
X-Google-Smtp-Source: AGHT+IHp+LpzTnlm/ik4qcZ3pH7JoklV/VwhpQ2B9YB70/pzgPXeMXc+xQDV0rAGZGWmglV837F6DBjwLozLyJEQpSM=
X-Received: by 2002:a05:651c:503:b0:338:3d1:60a7 with SMTP id
 38308e7fff4ca-33803d165d1mr29380981fa.38.1757061101675; Fri, 05 Sep 2025
 01:31:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1753039612.git.dan.carpenter@linaro.org>
 <6f732f53-7e00-4f0d-82a3-480bc81497bd@sabinyo.mountain> <CACRpkdZ9EHoHiKit+T-ur0xDKMEoN_=TydzTfoggNBQGdra2bQ@mail.gmail.com>
In-Reply-To: <CACRpkdZ9EHoHiKit+T-ur0xDKMEoN_=TydzTfoggNBQGdra2bQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 5 Sep 2025 10:31:30 +0200
X-Gm-Features: Ac12FXxg4bL_8E-D_W-eOel8gQZzsIXFhPs68sNRK9cduffuB3-nHYnzZaiCCko
Message-ID: <CACRpkdY3_ifPsQOTqa2e-kHR24Khy0axrZ=K+vO4OJB+FjdB2A@mail.gmail.com>
Subject: Re: [PATCH RFC v2 4/7] pinctrl-scmi: add PIN_CONFIG_INPUT_VALUE
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, AKASHI Takahiro <takahiro.akashi@linaro.org>, 
	Michal Simek <michal.simek@amd.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 5, 2025 at 10:27=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
> On Sun, Jul 20, 2025 at 9:39=E2=80=AFPM Dan Carpenter <dan.carpenter@lina=
ro.org> wrote:
>
> > In SCMI the value of the pin is just another configuration option.  Add
> > this as an option in the pin_config_param enum and creating a mapping t=
o
> > SCMI_PIN_INPUT_VALUE in pinctrl_scmi_map_pinconf_type()
> >
> > Since this is an RFC patch, I'm going to comment that I think the SCMI
> > pinctrl driver misuses the PIN_CONFIG_OUTPUT enum.  It should be for
> > enabling and disabling output on pins which can serve as both input and
> > output.  Enabling it is supposed to write a 1 and disabling it is
> > supposed to write a 0 but we use that side effect to write 1s and 0s.  =
I
> > did't change this because it would break userspace but I'd like to add =
a
> > PIN_CONFIG_OUTPUT_VALUE enum as well and use that in the GPIO driver.
> > But in this patchset I just use PIN_CONFIG_OUTPUT.
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>
> I tweaked this patch around a bit and applied: removed the second comment
> in the commit message and wrote the docs to be more generic since
> in the future other things than SCMI might want to use this
> config option.

Then I thought about it some more. ...

Isn't it more intuitive that we rewrite the curren PIN_CONFIG_OUTPUT_VALUE
to just PIN_CONFIG_VALUE that can be used for both reading and
writing binary low/high instead of having two different things like this?

I will look over current users and maybe propose a patch.

Yours,
Linus Walleij
