Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0062C2AD3D
	for <arm-scmi@vger.kernel.org>; Tue, 10 Mar 2026 03:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773113048; cv=pass; b=rMjIhatgrWbH5N1xRJVFeKwwSPG8A2+m/RcIlolRi/uLQS5ZaS3c8Mj7Kh5u4kAvDiuiq+AJAMvzdmtHvIBGo03q9GvLktfyngdXzZmnuM9tKZPL59+IIC30EySQTO6TR4wP4on9xHWQMOk5XSA9D9WHFesbPfjVciKTucHFXMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773113048; c=relaxed/simple;
	bh=Lcr5dVXyCC6NuA15tJ5l/HwAKYVsMmOxotK4MXcexts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ixE4jjMLNpEQNKTWxBmNr8SY/mc2bB0A0N6omJmB2Pe4EIFGgxsyrbMVrSKFtSeKjwUDMJRhJFKQ1+shh1nhq5EAUiWX6QstN3akE+gR5XKn1NPeJ/b8RryB7/aBgfhBa0acnuYoZF3c+UZ0wrTTxCiS+d7B/pAOVp110gPUkdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jBSWzME5; arc=pass smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBSWzME5"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-41706b23543so1793798fac.1
        for <arm-scmi@vger.kernel.org>; Mon, 09 Mar 2026 20:24:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773113046; cv=none;
        d=google.com; s=arc-20240605;
        b=QsZoeOdhDVhQGSPDzM2tuCGYmImGHQo/UkNTV+NBMdi1+01Rzs7mm+08HUq4op35qn
         /I+0yuD/YLsSKkJRXnf/UNqFxWs5ZLvJhWMFSo1tYl7upIRZ90GD0YhsVb1WAclMIBxr
         TYUDpZT/lxjeuXMZ7hkZFwDX4A1TNRFRRU10y9/A95VFl62UnWGB+YHA40hhT4/E3eQ6
         SVg6s4HbDKS9m6yM7o2errsEac6FT436qRsFXXL6X/Btkw3t7G68nluFzIE6iaBxkow6
         J6Hy86TL0UIQQ1vtpj7z4gjLkujYFi7pZ4XKsVWPDrIsZpStSVAltCKLLGxD5kZWEYXe
         Ajnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a9IUAxs7VdJbIzLXaHTJJ0fopPqXXR7atfJlc6YXf10=;
        fh=FEZy9Xd0KEXsrPxkh41YlucuPJV9VlLog3mRrBauHWg=;
        b=i6WIVyrwYnKRh1T8xiXn7VOfkooe2emUAnfKAFew1lm/I+TYqfvKyJXUL30UlI1mEz
         KJjRjQY06UjQfS9jmyemEhkPKIN8Xm55tNWw4MLils+qT9Kx/Rwbfvs1KiJ7CbreBrba
         3R7kPNdqWohtJlw2I5MfJEmjvogwM9vW53w51Dt5KRN4FDAZkuK5ti5Tvh/6LTIj4EVn
         0OiTa+O4A8mrSbsnZDZ77ivqcsr+wtdBI4suuQm61QUtDnlETJDw1KZ5LGeQ8LZ/LNCc
         ++FfjbFxArCPzTKulNsjkD6oF776rR2Jo9UcvJjsL7280QwYk5hBMK8aNQyxb4EgxRN0
         yqHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773113046; x=1773717846; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9IUAxs7VdJbIzLXaHTJJ0fopPqXXR7atfJlc6YXf10=;
        b=jBSWzME5mmDt+P73t+DCqn3BR9/LRYmvJLwD3COsdTW7jJAeGeMD7vWegQm0kO1jnb
         eposRxG/wfW+/sbnaM4TG9QD1wZBVQPsBzT0GUBOmLWmj7BVZmKAu41tyRm0eZ8d9dvE
         c4mknSfMgR6NUzyqe/8wJnqLpWmRshN7I9+LX0AHpop3O3zEvE9hH6cZL7XoGSlgfgx6
         aOlisPIL1Gnilx7ZE+GObnfzLuLz4q7C+gcPuOhjjwpMyHnX+Ns995kFh30BvgeonYDy
         SXhEHm9/ml0cG6yEFdQpyAmV4NOSrM1kvI2NFWmJN90zz54ahqvjYjMMbBVrl6CyqGq5
         4m5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773113046; x=1773717846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a9IUAxs7VdJbIzLXaHTJJ0fopPqXXR7atfJlc6YXf10=;
        b=GPWgtv1vcSflyUYsODrHkBPWwMX+lvXvhaqvcTw/EN8aqWIlkm0wIzmDLP3eXqrSQw
         wXTUzxoz6FyUk/vChiFoT6d7zNss6kRgBsxPgtq8tS84Nj8rkcRi9L6zC4DUfNylFOSU
         PougSLbXgcG08woQcouuroXLlYIYEnQEgJLfUvF0QWG+cER8yddvdxteJd29X8YlK9n5
         +3YBKpG+4w4to1F/3yPHAjvMnW2UlUpVh+F4iGTmqf9FowH/iicIH5vOlEtBiuOzGsW9
         Aj3yTze4OUsgo4wXPo04dyoVm5KxiZUo5WkyQcfycDzTRduf93Bb7+QA2auodYNtl4e8
         ynRg==
X-Forwarded-Encrypted: i=1; AJvYcCVk6A7aC9y5gqJFRbeoQ63E0/E8v+QKNXzSGrDdg6kiGso7bp5BjHzShsTrgXNnrLMXSqwOr2D/ZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoHyBTSvcg4nOqaul/bTOhzmJftwqbFcFnw90yqh4yMq7k4s6x
	QfbenoodZAhhEJRQjo8MCs1RioCZ0zp1WusZiorUqq6S1IMhArMZvFs2pYl/Ieguo9iM1x7ojG3
	OhVnxHGBLl/lWaLwSiHTcHuRi44T/B6c=
X-Gm-Gg: ATEYQzyJQSGGoQ3mL1DvjUMmbiFa11JJbx8iL9msZinP9lsNtZLil3xSLfAutN5P/q8
	s1LQ0DKqmsIu/0T0e3Qyav9hCXv4BR5/hragUip8uJYc2J5lP2IXChN9tIXtBvxjJISF8j+2IkT
	D5GRic8VsIlbwvmMTR2sEQwSRMfG1fifMnrS+nnL43Y5+IftfKgw9FSYPb76qOZ7ffy0PYst00q
	ro/MiBuKs3AmNDtJvFMMl2tW9WH3S2pvPa1u5anNTHL8j9Eoah4oLIDwUlfloGbykNMgswhuQps
	XuSlm26t
X-Received: by 2002:a05:6870:a0b1:b0:416:42f9:8d86 with SMTP id
 586e51a60fabf-417568d4325mr1271236fac.10.1773113045873; Mon, 09 Mar 2026
 20:24:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216181002.3475421-1-dianders@chromium.org> <20260216100943.v3.1.I600d04c0553f5c5ba39c2f92201da313aedfe746@changeid>
In-Reply-To: <20260216100943.v3.1.I600d04c0553f5c5ba39c2f92201da313aedfe746@changeid>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 9 Mar 2026 22:23:54 -0500
X-Gm-Features: AaiRm53275_H0CT6bFAmFiNzU5-bzNSMm5pKGBVqlCEoP2LLCsiLm-21V_J1GP8
Message-ID: <CABb+yY2RKJgyNQ6789ua6s8C4tuOvhWqdcS16_4yU3AHjAiv_A@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] mailbox: Deprecate NULL mbox messages; Introduce mbox_ring_doorbell()
To: Douglas Anderson <dianders@chromium.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Frank.Li@nxp.com, arm-scmi@vger.kernel.org, 
	cristian.marussi@arm.com, festevam@gmail.com, imx@lists.linux.dev, 
	jay.buddhabhatti@amd.com, jonathanh@nvidia.com, kernel@pengutronix.de, 
	konradybcio@kernel.org, krzk@kernel.org, lenb@kernel.org, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-tegra@vger.kernel.org, 
	lucaswei@google.com, mathieu.poirier@linaro.org, michal.simek@amd.com, 
	nm@ti.com, rafael@kernel.org, robh@kernel.org, s.hauer@pengutronix.de, 
	shawn.guo@linaro.org, ssantosh@kernel.org, sudeep.holla@kernel.org, 
	tglx@kernel.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Doug,

On Mon, Feb 16, 2026 at 12:11=E2=80=AFPM Douglas Anderson <dianders@chromiu=
m.org> wrote:
> @@ -249,6 +255,28 @@ int mbox_send_message(struct mbox_chan *chan, void *=
mssg)
>         if (!chan || !chan->cl)
>                 return -EINVAL;
>
> +       /*
> +        * The mailbox core gets confused when mbox_send_message() is cal=
led
> +        * with NULL messages since the code directly stores messages in
> +        * `active_req` and assumes that a NULL `active_req` means no req=
uest
> +        * is active. This causes the core to call the mailbox controller=
 a
> +        * second time even if the previous message hasn't finished and a=
lso
> +        * means the client's tx_done() callback will never be called. Ho=
wever,
> +        * clients historically passed NULL anyway. Deprecate passing NUL=
L
> +        * here by adding a warning.
> +        *
> +        * Clients who don't have a message should switch to using
> +        * mbox_ring_doorbell(), which explicitly documents the immediate
> +        * sending of doorbells, the lack of txdone, and what happens if =
you
> +        * mix doorbells and normal messages.
> +        *
> +        * TODO: when it's certain that all clients have transitioned, co=
nsider
> +        * changing this to return -EINVAL.
> +        */
> +       if (!mssg)
> +               dev_warn_once(chan->mbox->dev,
> +                             "NULL mbox messages are deprecated; use mbo=
x_ring_doorbell\n");
> +
Does this patchset leave some such clients out?  If not, should we
drop this block and return -EINVAL already?

Thanks,
Jassi
