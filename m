Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85F730ACEE
	for <arm-scmi@vger.kernel.org>; Tue, 10 Mar 2026 15:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773155335; cv=none; b=uNejziLgfKcn6SnEJgdagjSYb8giEdsajCl3nl+Y5lZrdIRC3T1vPqWDsr+LhzKR1ZK/V4qS5q+SQ5hd3KzbAt+JF8/pQIxkMIBMZkYIKUWJLErwbiQOIAyY3HdTEn++DeMfEWiiGJjgQq0T73bJUprniViGCEurOdHLXzJZdr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773155335; c=relaxed/simple;
	bh=l66roiogcZuRuWdg/BN7GAGFpuk8qIZkWg5A5bU5kEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ta/gOAGFkeh8wJg6G4uiK2oDw+Ae50fGtJ/9BTk1PVSmJ1lJUvVTvGRcxTucLL2grceXdhZ5X0Ad3g+I1XbOqSLyIGsntiFl3R6ijS6ZFQKzdJ/hIcrNfP3xm/6AFLXYW6vKkNCOs7TDolr3xv6LChoduJrwQyFjUJwQj3ahzAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gdneOYMJ; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gdneOYMJ"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b932fe2e1a7so1689791366b.1
        for <arm-scmi@vger.kernel.org>; Tue, 10 Mar 2026 08:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773155331; x=1773760131; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZrhwHJgKfQunIbqKLgGEw/Kos9vy+e6R49GEIQjjeck=;
        b=gdneOYMJibVXoOGKrtw/aTGQHWGOHjBfmsPWckJoSyBurspmys+Pw/PsAYNh91rD9i
         m4nhC3+3cYQsS6b3OsLzLBqJqhQ9vJjrhIEIKl65ea80AtkZFT9l0RY6yvuOpIXmYvCi
         0Ol3JisQFjeyXxW6E2EqMT+Ps+IlZyP/2PrfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773155331; x=1773760131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZrhwHJgKfQunIbqKLgGEw/Kos9vy+e6R49GEIQjjeck=;
        b=mp9saXiCTjojMzs+27CfTxuxH7sVflN4VhTTUtWASxr+nWcJeMJBQLOIM5lNF29ZAt
         qyFmNUckXnv+gdoaUmQdVoXqAg1JroV4VKctKdKU1FBRtWhuhLkKllxkpbP9oNRBZNBu
         8M/ZQswedf7X3gpPL5NGj5gbV/rmdrcbFw0NgxywC0JwtSgs4k0XoypzUgbsIXKmAePF
         zfWEWoU4M9lh6NSEJj7z7fLC0x3PnQUw3E4Uq3PnOuM3+V1PdSNZbC6bhHr2kaxlroAz
         rLoRRWyqHki+jZi7uz8pj/vsUt7fo3BzXu25ngzIu7sXVWFrVC0DYsi4mi4fnBwMbN/1
         RteA==
X-Forwarded-Encrypted: i=1; AJvYcCVtMj1mjBDlwgNJcQ5SDGmFfyvObH72wP/0cwLNmtiAEpcW4IRmRkg+VY3+0Qm2ZL18J5Nvk17afQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyztPFrKpGGJou0J4tRpw0ld30KtL/Ko5/MztiYraaJWT46mlKo
	F0BJ3Zp5KxlliqXJKXOOASArmqS6sXrertGQskyBG7jL1HMJvWoWd7ddNkBUYyWDXyysUwKQ+tO
	YCyY4G2Ww
X-Gm-Gg: ATEYQzzqsiMVpnaWadCNDL4qjoMP2ofdntVBOunWSG2flBJV1SA0IlHRJ93qzAffcP9
	VCARUUh8lx6NSVynpraG/+kwlOHOLKCITwOmrb13sni8wEDapwPigmJ5FqTqxaj3bSe9fQwYkZs
	XECEeoc6lQQbBCkVXbfAdXtJ0DU886FzAnVaVPqIpqC543GZrX/IK8GNWH3HCCDZjUXij4P+cv3
	2ryHU/XSMQHxuRK2nJlb8UfWrp42gINSntoG1SS/ib0T00cWnaX8tOMd8XQKtLX2UptVNIO2dN3
	EDdmpqkcZlYejAvDmatRpEMwYEtO2aNQ/Y/gq0yKsQywr+zzh1yxtMyboa7m7X2887SpyOt9y4y
	wc3i4vTJQwy+MjQprjoFUxJrRiPcVt5ScKRRN5xB+jxsmhBikAp2etdGqeQfJ0l45HrY3Cjcxmc
	MAOskaT8k2wiZWJ2+lFljLf/yUHxY4SY36FywjdD3QDACiXZuvmWP+1T4VhjxwkQ==
X-Received: by 2002:a17:906:9fce:b0:b94:1913:7802 with SMTP id a640c23a62f3a-b942dfb4fe0mr887581566b.35.1773155331462;
        Tue, 10 Mar 2026 08:08:51 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942f18baadsm507961966b.67.2026.03.10.08.08.50
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 08:08:50 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-485392de558so14117315e9.1
        for <arm-scmi@vger.kernel.org>; Tue, 10 Mar 2026 08:08:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXqrkt7ILSkk53U/FFstSOuQ3NtoTHoXYfn9rfnqlnyU/DvVy7oWH7WYqXs3me0powKwEbAS6M2fA==@vger.kernel.org
X-Received: by 2002:a05:600c:1d04:b0:47e:e7e5:ff32 with SMTP id
 5b1f17b1804b1-48526983292mr236479455e9.34.1773155329681; Tue, 10 Mar 2026
 08:08:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216181002.3475421-1-dianders@chromium.org>
 <20260216100943.v3.1.I600d04c0553f5c5ba39c2f92201da313aedfe746@changeid> <CABb+yY2RKJgyNQ6789ua6s8C4tuOvhWqdcS16_4yU3AHjAiv_A@mail.gmail.com>
In-Reply-To: <CABb+yY2RKJgyNQ6789ua6s8C4tuOvhWqdcS16_4yU3AHjAiv_A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Mar 2026 08:08:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U4te2V7MaOrQ8kSibLazqUy_Kv3ZcJyAAaCAiGWOY1Gw@mail.gmail.com>
X-Gm-Features: AaiRm51YHmAMmjPRIWQTSvpfsMBkAMaTT684zHe2XNjk21TEkEMaZPx6RHcKG9o
Message-ID: <CAD=FV=U4te2V7MaOrQ8kSibLazqUy_Kv3ZcJyAAaCAiGWOY1Gw@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] mailbox: Deprecate NULL mbox messages; Introduce mbox_ring_doorbell()
To: Jassi Brar <jassisinghbrar@gmail.com>
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

Hi,

On Mon, Mar 9, 2026 at 8:24=E2=80=AFPM Jassi Brar <jassisinghbrar@gmail.com=
> wrote:
>
> Hi Doug,
>
> On Mon, Feb 16, 2026 at 12:11=E2=80=AFPM Douglas Anderson <dianders@chrom=
ium.org> wrote:
> > @@ -249,6 +255,28 @@ int mbox_send_message(struct mbox_chan *chan, void=
 *mssg)
> >         if (!chan || !chan->cl)
> >                 return -EINVAL;
> >
> > +       /*
> > +        * The mailbox core gets confused when mbox_send_message() is c=
alled
> > +        * with NULL messages since the code directly stores messages i=
n
> > +        * `active_req` and assumes that a NULL `active_req` means no r=
equest
> > +        * is active. This causes the core to call the mailbox controll=
er a
> > +        * second time even if the previous message hasn't finished and=
 also
> > +        * means the client's tx_done() callback will never be called. =
However,
> > +        * clients historically passed NULL anyway. Deprecate passing N=
ULL
> > +        * here by adding a warning.
> > +        *
> > +        * Clients who don't have a message should switch to using
> > +        * mbox_ring_doorbell(), which explicitly documents the immedia=
te
> > +        * sending of doorbells, the lack of txdone, and what happens i=
f you
> > +        * mix doorbells and normal messages.
> > +        *
> > +        * TODO: when it's certain that all clients have transitioned, =
consider
> > +        * changing this to return -EINVAL.
> > +        */
> > +       if (!mssg)
> > +               dev_warn_once(chan->mbox->dev,
> > +                             "NULL mbox messages are deprecated; use m=
box_ring_doorbell\n");
> > +
> Does this patchset leave some such clients out?  If not, should we
> drop this block and return -EINVAL already?

This patchset series got all the clients that were in mainline at the
time I last checked. However, it was unclear to me if all the patches
would all go through your tree or not, since they don't touch mailbox
drivers but the somewhat widespread places that were clients of
mailbox.

If all the patches aren't going through your tree, we'll need to keep
it like this until we can confirm all of the clients have been
updated. If all the patcheds are going through your tree, then we
could make it return -EINVAL right away, but it we'd have to do that
as a last patch in the series. I think it would still make sense for
the first patch (which adds the mbox_ring_doorbell() call) to have a
warning like this and then a final patch to switch to -EINVAL. That
keeps things bisectable.

What do you think?

I'm happy to post a patch atop my series that switches it to -EINVAL
and you can land it whenever you see fit. Would that work?

-Doug
