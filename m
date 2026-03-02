Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E986C3AE6E8
	for <arm-scmi@vger.kernel.org>; Mon,  2 Mar 2026 13:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772456971; cv=none; b=TKEed43Z9Qz2c/IxeEq8/p8h3JM07GtF5aj8qyK9Az6I9y224bdswxFZXKzDrFgZF8xcPiU6lNAlNvKrwriUkwwLFwMTUn3kivjw78HProOMNp1Kz2Aktkalytf1pAAm6KTeVvUnoItk5yjAAWVy+Dx8YWrQmDPqNgtpRr4jpRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772456971; c=relaxed/simple;
	bh=flPzsF7PzOvMEnCHPNRVbaZwyCdjFf5LYGl94bUvKVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LgutlpQZ4hrSxaUG4aTHhfkzhz7hSnt9B6KZk8uW6rHDyYZIo+rfPaHQV5g9WaNQcOepFXt3l5IjxeIleMTErKw0i+JPDGQVkMZh1R+u84xsBZeD3rwcv97A9J9tFqHkDOuyjSstIw5serJEMqLP6f+r5P6TBTQ2TYhOBPukxPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-94acb3d6cceso2710196241.2
        for <arm-scmi@vger.kernel.org>; Mon, 02 Mar 2026 05:09:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772456969; x=1773061769;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HbpBDECGTuxrjZK2784Rn4svmYdxHMnNQNyQJ/QvvFQ=;
        b=LkxEwU6jpnnR4GMt4rHv4qEdKaOLSwxi7wDCl96PExtEIuUJLZPmqJYsRlorQsOfBN
         OPeBT+UuJZOqG+BeuGiy0SnubWzkeDKapIyWS5EP2uwpwOZhvCinPGhUHFC/Gv8bpAzg
         uCiiwVC8b67EWcpR8t3T5MjVsRyea0QqMtOQyvZeHdgDEkAH9sAIf0HkXAEJp1H9X8Lk
         o/dz2udRrLLgVkWxiTL2P9zCuFLMd0Ra559Y+w5jNLFXe4q4kUHocGVKWsz5zH89KpLm
         Bq4WLx0bkimFGaWjISWHBwU0vBFYzzfFxms59IAkOL8ehE8zCzW0Bnq3oDsST76pDL3R
         Mimw==
X-Forwarded-Encrypted: i=1; AJvYcCX3Bdw5SL900MKmbNwqRJwiwGQXtTGMdFCqjsjoc9DZwkw+3/js2bMXfGytpr6idv9n7ZOBtaBzAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2bYFzpULHSRh0rR2qtv4nuC0dWkV6ORHvr3BXtTJKblQ5qEj7
	n5vsFvA8gchvJxwxX6pHWnlm7jen/XlZCZWxBJ0IcOln3tNycmPDmbK+Op2ickVU
X-Gm-Gg: ATEYQzyF15tfwe6dNxxhmV8Ev42Phyy7WopYHDN/pU29MKOp+HwusE3gqmHBSehwxTg
	CRjrdFGgb9NUlONp5E9Wkj7b+xtKMmSIomiG6LpdVHGBAjoOzKXddq92Ih8Pmmq+RL5j2EiXKxh
	0rHsFFcBovD0haASzIBTNCYMu1hPnuXX6ULT+ZfytgfIOA/75CkcgvFMQj4sXVcmURYZqOeaMWr
	pdB9mboA+iWp6FRGMUdyLQxpa8+lPpnPm/ILG7Ao7RplO/ogxEH3lUW/i99KBDb2UKM4hjfZ4CF
	6QQ+IvHznMtTCqtN7KryIfDucCS9pCzsEsQA9rsrGzPvuQViX4oRoQSRByY9E71sByuduIwDPFN
	WEtCUSnFdlOnUqwZGkf9ZnuEJUN5x5TgET/zw+ei4WTShtpJZzAeDM+HQboQ0UhSsq5D756lgit
	baxGlNcpIr7QsJpaH6lEsRp8a8MG0z5ti7DEO+m639SDTMV9mzWzEyey0mDGX+
X-Received: by 2002:a05:6102:4422:b0:5ef:af7e:1ddd with SMTP id ada2fe7eead31-5ff325ac159mr5276005137.37.1772456968695;
        Mon, 02 Mar 2026 05:09:28 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1e80818dsm13168451137.5.2026.03.02.05.09.27
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 05:09:27 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5ff1699312bso2637560137.3
        for <arm-scmi@vger.kernel.org>; Mon, 02 Mar 2026 05:09:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWjfEh9cQ40KAc5bPDHlNYSFyPxonXRcpCeWJanJUezUW4j8h1eQ3gvozvp9omr+vWbLZ6ZcrL3wg==@vger.kernel.org
X-Received: by 2002:a05:6102:304c:b0:5ff:1d94:b746 with SMTP id
 ada2fe7eead31-5ff32519f2emr6199626137.27.1772456966817; Mon, 02 Mar 2026
 05:09:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-4-cristian.marussi@arm.com> <CAMuHMdW7e45rc5VmHQV5GxzMvJ3r6=04sWOoFsu4JJPAqDUiJA@mail.gmail.com>
In-Reply-To: <CAMuHMdW7e45rc5VmHQV5GxzMvJ3r6=04sWOoFsu4JJPAqDUiJA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2026 14:09:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVwVsYxsQj+du-uEN77H6UHDVFO4T6-_7VJ0E4Pfa=sSg@mail.gmail.com>
X-Gm-Features: AaiRm50gWrUOn4xlq8V0dsaXBHr2iE-RWJy6NrWL5o5U_z-q0G3KqmZt-0p4hrs
Message-ID: <CAMuHMdVwVsYxsQj+du-uEN77H6UHDVFO4T6-_7VJ0E4Pfa=sSg@mail.gmail.com>
Subject: Re: [PATCH 03/11] firmware: arm_scmi: Simplify clock rates exposed interface
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, dan.carpenter@linaro.org, 
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com, 
	marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Cristian,

On Mon, 2 Mar 2026 at 13:48, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, 27 Feb 2026 at 16:33, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > Move needlessly exposed fields away from scmi_clock_info into the new
> > internal struct scmi_clock_desc while keeping exposed only the two new
> > min_rate and max_rate fields for each clock.
> >
> > No functional change.
> >
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
>
> > --- a/drivers/firmware/arm_scmi/clock.c
> > +++ b/drivers/firmware/arm_scmi/clock.c
> > @@ -157,13 +157,27 @@ struct scmi_clock_rate_notify_payld {
> >         __le32 rate_high;
> >  };
> >
> > +struct scmi_clock_desc {
> > +       u32 id;
> > +       bool rate_discrete;
> > +       unsigned int num_rates;
> > +       u64 rates[SCMI_MAX_NUM_RATES];
> > +#define        RATE_MIN        0
> > +#define        RATE_MAX        1
> > +#define        RATE_STEP       2
>
> Any specific reason you are not using a union here, like in
> scmi_clock_info?

Ah, "[PATCH 06/11] firmware: arm_scmi: Make clock rates allocation
dynamic" answers that.

>
> > +       struct scmi_clock_info info;
> > +};
>
> > --- a/include/linux/scmi_protocol.h
> > +++ b/include/linux/scmi_protocol.h
> > @@ -51,6 +51,8 @@ struct scmi_clock_info {
> >         bool rate_ctrl_forbidden;
> >         bool parent_ctrl_forbidden;
> >         bool extended_config;
> > +       u64 min_rate;
> > +       u64 max_rate;
> >         union {
> >                 struct {
> >                         int num_rates;
>
> You patch description read like the actual rates would be moved
> from scmi_clock_info to scmi_clock_desc, i.e. _removed_ here?

And these members are actually removed in "[PATCH 05/11] firmware:
arm_scmi: Drop unused clock rate interfaces".  Please reflect that in
this patch description.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
