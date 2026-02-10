Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FA423E350
	for <arm-scmi@vger.kernel.org>; Tue, 10 Feb 2026 00:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770683952; cv=pass; b=cT+LU529Ykwv7uUrL0Ft5gMhry5nip3bWOVDNZk5p8Cw+hQ4EdHG45aUHQ/reWCYikQpsdCHBuswnhCsuZKvBvHvXXOukXL3vZtG/wdVdprB3V0PNgnpKgRTyFSVi2oDfKD417xO+vVcQB/lNRiT81LNPToeYXB2Ipr+zU4IUmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770683952; c=relaxed/simple;
	bh=CRHDCY+aNL8cCuJ5x1LKl4BcDxts38ZAFNhckqdTfRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fg8SOYv9Q1TjOTUynb/3FYBagk+IzG8IrcJh4PeZamNg2FMnhYKjJvB0sO2Ia/+ErDT3I0DcOYJ/VEXA7zNxjSVqqu8w8xwNwBPZKqKk1bvjxumLElsJJuHPpzNit+ABipRP6VGZkA9KXIcSZkMgbBiOAkMii1RVKMcbZJbsk9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GCSuMGfE; arc=pass smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GCSuMGfE"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-67263e2ed52so425442eaf.2
        for <arm-scmi@vger.kernel.org>; Mon, 09 Feb 2026 16:39:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770683949; cv=none;
        d=google.com; s=arc-20240605;
        b=S5iI2WkATWxHyh/w0noiFWemBqHcQtyQnWKERMRHBDL+18/grFUQrKSjzm9W3ZSL7M
         6MMHSAaO8jNGDQ5aG8D8pzghUOEkBSnf3c0N3rXDu8Vp0HQ9N18EOJy1VjRxvpnSui7i
         rDJ8TGZHi32TCI8kc1hdHaNk/Zgc+z+fHer0pvSaQMxpwAiirFc/p+ZXuxlnmZ71AmnH
         oqzgyqtw622M16rMvXdRhLqOd8Nvo96qBQAGJ0/dFj1/TeRrvgUPtE7lBF2I8toYg7P/
         b8XJusd5Ej/pZ7aiUBgdGBrBv9GhICBu9yWj6ADmEK0nVGNPKHqzT6rKwmvZrY2Gw6Vz
         UZqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bf5IdcegF6twrrNNR7clze4xkdFwkIRE6sG++xaVg4U=;
        fh=pNOeQfLri810NOUtyPhHktXlkEKMRw1E27UN0QHAfoU=;
        b=eLraYnV861hmbsej0TwJRWkMxt0b8mcMwoj7JeGINcztloo6EXxf6eGQNRadOsyTWu
         NrC2vGcKD0il21Op86s6ddOz/rTa6OtAT6alwtshWGFQ3AYWwxtZ6zUPlrZzqMNkki+W
         EwS1cm/koyG2/896PctPUtpSXRuM+5vqh70M5RFvtrG8nVSNwPKA3Qg0kVYjSfi1wtQB
         oItSXFo3hwf9MjtFw0BrdZ5LxM9jsjI1fobkGIL+RCmcx65lYOCoi6F6JP4nsNuhYNuk
         fsIQgnFgc5PovqvuuftJsCfnvJJMnbRv+m+icYj907+vHSt5aBPuL/1Z4V75SaNukQT0
         w5Fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770683949; x=1771288749; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bf5IdcegF6twrrNNR7clze4xkdFwkIRE6sG++xaVg4U=;
        b=GCSuMGfEPfzMl3he42tzkuKrehHOEwSPbWg9z90dF81Afyi3sPX6nHguyl9DXmTk4e
         6I4gIyihsEb7ZViL/AxrsB3qEzoyeA18VCG/n5Dy7EsyjJHpAxbKkbv5kouxorw9CtSY
         ErTcKZAIcy3Ck62Eg3V5O21E360Cg5+rXaqKmHKe3Ecv1aNdGvtcCfyNZzVJEEddoNDv
         JRtyUaMb9DMW2gKJjKDCu2T3OnxM4xcAEhRlVGVsVu+/IUJ3+AUuriZmgpVGoIg8stGp
         PfG5iXK6qZQFyuDRY7Qx0LItXki1cH4fE3AjOoiegYwEYQywG2RTCdmaOzOAFkzmXgzb
         Zlew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770683949; x=1771288749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bf5IdcegF6twrrNNR7clze4xkdFwkIRE6sG++xaVg4U=;
        b=EKEMps8jRp85FYTxR4hqJmKF0EXYX3Xxb+ciXBYEpljNRsRTuV/3J9TapUHaQh0mvW
         qVfqXGaODWnR0VlJpT6yRgLfiiZlE1xuRIb8sJRCxrtR3EeiQhCHocAWzbyBAEFOonMw
         nSr57YMfEDWIcbPdPWTs+1wNsCmvsz9SKI6EmYvw70mQqaXk4y++H+bAcLi/GNAzjGlr
         LgE/sV+iDkK8ozCrNj2Nen+55m6yfzOwp6PTzVgvGfdt5QWJTHYaRJF6y7QJKoztM1uE
         J/16pN0UyiuGdbG5VrObIGrBx2RoSQJR+BgRTM4uXkVSFYbQAm0hhZMZRddb4h2ZSp0P
         Wt/A==
X-Forwarded-Encrypted: i=1; AJvYcCVhNVjQgW4yR4nJ9MfOGAqtH1XM64nRbyOxj4CATRuDShz/R6YVoSEuS9qKZumnbBhb2zg3UYpQGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwauR1dHXb9Xwv77yefI2/rkbuuApDSUz61ImBxennq32Js+qM
	MquSu72wJxv7zdtb9LOfCsoY9Xrr6kw5+pP8mmdjVx1k7CojFCpQ/UF3QkAU0RDK+IfwD/Lvu3h
	awDVHyKZkiHIp++zaOKP2Sj9FzYAvdGc=
X-Gm-Gg: AZuq6aKrgrwQzRxer6mby2OH4VirF/1I19b/7AA+UMthD4ptl36kiDGL1k5w59OreMw
	CmaqUpnaZ3SbJ4K3py9fHh3afvFn/Pj1Y8T1X2MaWHkNICyaXFEXkZjJrmpVuiZg+BVYhrPalgV
	8htEmZcsVYziqvxEWGhtFT+jGqwgK3s1m0DXuhBbQfGOvsZmODH53hJrB5QTZRFyMUujUlUY5k/
	9Pj7XOhBcCAFNICsm/oH7HdWrUpbZY3flbGodkTxjXdBOHRcs8QMuhRBqpCs0i0DKT9BeZPcS9/
	mIrdYf0K
X-Received: by 2002:a4a:e908:0:b0:65b:257b:a898 with SMTP id
 006d021491bc7-66d32fdac10mr3465078eaf.29.1770683949518; Mon, 09 Feb 2026
 16:39:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260208040240.1971442-1-dianders@chromium.org> <20260207200128.v2.1.I600d04c0553f5c5ba39c2f92201da313aedfe746@changeid>
In-Reply-To: <20260207200128.v2.1.I600d04c0553f5c5ba39c2f92201da313aedfe746@changeid>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 9 Feb 2026 18:38:58 -0600
X-Gm-Features: AZwV_QhZe5s2jbJJnfFS4JALRsv_5-7Jio6ijB129QGrcufx887IYcSq_3ToyAU
Message-ID: <CABb+yY2GbPcuPiVsE_-HCS8MbpBqvjgjDkoVLNSBDZq1bnfpEw@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] mailbox: Deprecate NULL mbox messages; Introduce mbox_ring_doorbell()
To: Douglas Anderson <dianders@chromium.org>
Cc: Frank.Li@nxp.com, andersson@kernel.org, arm-scmi@vger.kernel.org, 
	cristian.marussi@arm.com, festevam@gmail.com, imx@lists.linux.dev, 
	jay.buddhabhatti@amd.com, jonathanh@nvidia.com, kernel@pengutronix.de, 
	konradybcio@kernel.org, krzk@kernel.org, lenb@kernel.org, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-tegra@vger.kernel.org, 
	mathieu.poirier@linaro.org, michal.simek@amd.com, nm@ti.com, 
	rafael@kernel.org, robh@kernel.org, s.hauer@pengutronix.de, 
	shawn.guo@linaro.org, ssantosh@kernel.org, sudeep.holla@kernel.org, 
	tglx@kernel.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Douglas,

On Sat, Feb 7, 2026 at 10:04=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:
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
> +                             "NULL mailbox messages are deprecated\n");
>
Nit: maybe  "NULL mailbox messages are deprecated, use
mbox_ring_doorbell instead" ?

Thanks,
Jassi
