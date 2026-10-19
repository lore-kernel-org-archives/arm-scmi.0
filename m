Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792427585;
	b=KLdS0hnKy/8nOifX1ztbAYIrrmidFr0V2zu8Y0FXxA/x/Ivgd4iQekoHGiyyD8QDxCkm
	 Vwmm61+TSU1V8URUtMe76sUfwZi3WQnHVGhl/7ShNUSsku/Zb1st6pxpdsvnzzD3dxC+2
	 iZzM/vauQjxaPYBsBS5w6RLdcJnHROrcQhyTCfv0cM3WJDXQYFf/5GWWCiSFDEp8VCibJ
	 yy7wbm2vOlWy7d/Y9wV2dQ8LNQ5r4TsO/CnfkEdu2MQzE01GqDanzFjAiKQe7DJNuEDYM
	 9+72gPJnC+aCg0eT1wdhcQv7ts0KUX3ah6seaw1R7y+VwN1FXz6chpblsbjl8XCpjKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792427585;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Q8KL6LGvq0FwHTPovYus9FfkhDMRIi4bd+XQz8TiIQM=;
	b=RPmWH3sHUcRlsxs0DFjPlcJnBTFnMWAR/sbr0T2i2qsiTRwJ9RIS/mEYGnWLDDaGpDor
	 eYFnMZoopJGa/6m1w1ne15Ebyk9fBEbdWZgvj5jn4BF1BNcEvDsl7+amk4jBcNLSGFj8e
	 DZwScuxb5eEtTH9gFRWsO0Vf0VwEMQ7iFojCP0eSX0hCnFpI0D5P2mQ9bh1cyTYp5hH7R
	 xWnLdhlTWV/7upk0eMUevpeyqdqE+Rwxv2ns9uj5UfE7PiBfO/bjsSl9fnpcDdl7nLw4f
	 I4/IkoD5zCg1mfRpaBSDccT1mqXsqGgFAMKjMFd8VB7rm8mZxBLdvMoXiyDC+28CpSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37CE606A31D
	for <arm-scmi@vger.kernel.org>; Mon, 19 Oct 2026 16:33:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E37CE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c411e139259so218837766b.2
        for <arm-scmi@vger.kernel.org>; Mon, 19 Oct 2026 09:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792427583; x=1793032383;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q8KL6LGvq0FwHTPovYus9FfkhDMRIi4bd+XQz8TiIQM=;
        b=QJuDr8suSOjbW9Gwfom6jP31iaj55BdW0jFgHG8rnTuDrrSX3yGGLSxC0h3ey8s1CK
         7fUCvnE3mnfOBSSpuwEMjY4Ck8f4Khh9nufyYx/+de3bmzFuy7JMtOHzNIeAZ1Fsv6Fl
         1Qk3dtHeXfQPKUh9tQb7Bc/T2fb+ZcRv7Dtt1hz64BN57mm8fB+nZfriNMPn0DSXd9B4
         NrQZ/s1QvdloL4h43lEy8rQmQ9zirz3faJCLZUaIX2pn+i5b6a0DscWgl9U43AdcLpdN
         S3Ba9txFLcfgGPhiFfH9xlpeLQdbTL+JwHMQ4JmytCwCtiXhDg+y1z7OryEYpOK9ahds
         Faxg==
X-Forwarded-Encrypted: i=1; AKwUvBzs3+nbnQhRULhZs+dhYyfNRy1+GRzXJ0RiA089Gj3+0OX4SxzRdGc52B6kJieQSSpRrAnGwk7IHw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKwt5GL7g7kqmDucY3I0i74dZziJnlPiOEhCfuX4FkI5cmQwLHb
	rIPI3OR9WcMpMZb8EjKKyH5/lW5Yeu+5P3uiGrh71pZbKrGD2sNUmnnFkikQnVnBnsA=
X-Gm-Gg: AYBFou1TkMJsajlKpBcUCGIP5pHZ/zFpRBHIg+USHFENYrmLd2UZe3/9sAEn+5wdiri
	rFg3XVeX9P1Xv43YmrE7YcD2U9fp8fy+4G4oUglp2r9PVTyJz0wrOLPag+qLxLLxgzeoOHJHk0k
	kAzyLlfrrj4uoLDfmr4TLDcogH4doVlVqrnDfq8F33wumLCY91goqzVxk3ZqY9j85BkUF2euVCo
	M1pNmERB/KLpvq0c94DG8C5fkJFdXhb1blCo1egsGwP4DQ2EimL2hSiMpcuzbq8EbChxfBUG6Xg
	o3Upu7zwjk/D0fVNHOKXz5a6HihFvsA/I6uKYKM3UqK5ra6OX2571P4tm9dHIUoujs88WmDk81M
	LtKU6I7DVIZvj5yLRge74FhckRDdDdeIsN/7GXjEyNAIYBInLwz07Oj073z9AWccgnj1j6MAnCM
	4bQ2yrTfGc4O91zGpYu8zcrk+zI8x3fnK5cOaTUOg6rUFz1w71CpScbEz0Vrs94Cm8e62Tk/FiN
	onTFPXBjBCq+U0htd1It9u4L/9bQSvX+IHG
X-Received: by 2002:a17:906:794e:b0:c41:30be:4f84 with SMTP id a640c23a62f3a-c419da3d991mr567979666b.9.1792427583199;
        Mon, 19 Oct 2026 09:33:03 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1c5e36sm4296754a12.17.2026.10.19.09.33.02
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 09:33:02 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b1afcd2d23so2797157a12.1
        for <arm-scmi@vger.kernel.org>; Mon, 19 Oct 2026 09:33:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxJZhsNeBwBjBAEltEEaPPOj8jQ3IkhbwVYzh59bRXlp0he7QE0UQ48LOv8utj5QDPT1W+UyV4CJg==@vger.kernel.org
X-Received: by 2002:a17:907:944c:b0:c40:6ed9:b961 with SMTP id
 a640c23a62f3a-c419a05c502mr618122766b.5.1792427582507; Mon, 19 Oct 2026
 09:33:02 -0700 (PDT)
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <4524363679c1f2163aca3b3dda2bfbde170d095a.1792163045.git.geert+renesas@glider.be>
 <20261019160545.GC3705@killaraus.ideasonboard.com>
In-Reply-To: <20261019160545.GC3705@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 18:32:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUTz3BR48_Y8_UR9PEjLuavHtN-4uaEKURtqRXFBO0uUA@mail.gmail.com>
X-Gm-Features: AclHuK84fhnixZiNIMOwb9AdAvJEMnIe-A6l4ZZgkoIEEk378oR8Z0wb7zPZzKY
Message-ID: <CAMuHMdUTz3BR48_Y8_UR9PEjLuavHtN-4uaEKURtqRXFBO0uUA@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] pmdomain: Make genpd_get_from_provider() return -EPROBE_DEFER
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Mon, 19 Oct 2026 at 18:05, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Oct 16, 2026 at 05:55:44PM +0200, Geert Uytterhoeven wrote:
> > Unlike provider-based look-up functions in other subsystems[1],
> > genpd_get_from_provider() returns -ENOENT instead of -EPROBE_DEFER when
> > the provider is not found, thus not supporting probe deferral.
> > Currently this is worked around in of_genpd_add_subdomain() by remapping
> > -ENOENT[2].
>
> But not in the other functions calling genpd_get_from_provider() and
> propagating the error up. Have you validated that no existing call
> stacks will break ?
>
> > Fix this for all current and future callers by returning -EPROBE_DEFER
> > instead, and drop the no longer needed remapping code.
> >
> > [1] of_clk_get_hw_from_clkspec(), __fwnode_reset_control_get()),
> > [2] Commit 18027d6f392ee8d8 ("PM: domains: Make of_genpd_add_subdomain()
> >     return -EPROBE_DEFER").
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v4:
> >   - New.
> > ---
> >  drivers/pmdomain/core.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > index 964e44c2f78f1d55..88c886814a5b9da3 100644
> > --- a/drivers/pmdomain/core.c
> > +++ b/drivers/pmdomain/core.c
> > @@ -3021,7 +3021,7 @@ EXPORT_SYMBOL_GPL(of_genpd_del_provider);
> >  static struct generic_pm_domain *genpd_get_from_provider(
> >                                       const struct of_phandle_args *genpdspec)
> >  {
> > -     struct generic_pm_domain *genpd = ERR_PTR(-ENOENT);
> > +     struct generic_pm_domain *genpd = ERR_PTR(-EPROBE_DEFER);
> >       struct of_genpd_provider *provider;
> >
> >       if (!genpdspec)
>
> Expanding the context:
>
> >               return ERR_PTR(-EINVAL);
> >
> >       mutex_lock(&of_genpd_mutex);
> >
> >       /* Check if we have such a provider in our array */
> >       list_for_each_entry(provider, &of_genpd_providers, link) {
> >               if (provider->node == genpdspec->np)
> >                       genpd = provider->xlate(genpdspec, provider->data);
> >               if (!IS_ERR(genpd))
> >                       break;
> >       }
> >
> >       mutex_unlock(&of_genpd_mutex);
> >
> >       return genpd;
>
> The for loop seems to imply that we can have multiple providers for the
> same node. In case a provider fails, the function overrides the error
> code from -EPROBE_DEFER to whatever the first xlate() returns. That may
> cause issues for your use case.

The code has been like that since its introduction.  Technically one
can register multiple providers for the same device node, but one
can never safely remove one of them, as of_genpd_del_provider() just
considers the device node, and removes the first matching provider.
So I think someone just didn't like nesting curly braces, and tried
to be smart ;-)

> If the of_genpd_providers list doesn't expect multiple providers per
> device node, I would change the above into
>
>         list_for_each_entry(provider, &of_genpd_providers, link) {
>                 if (provider->node == genpdspec->np) {
>                         genpd = provider->xlate(genpdspec, provider->data);
>                         break;
>                 }
>         }
>
> to make it explicit.

Will do.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
