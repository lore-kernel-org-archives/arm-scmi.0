Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C0D3246F8
	for <arm-scmi@vger.kernel.org>; Mon, 16 Mar 2026 16:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773676934; cv=none; b=rvC22DoHINtZaFSHbVb4rA3HLadj8TlPCSdzRiItYjUe0AycfldsDffndRPXzf7hEALMOcpgPwx82xcYQ2FytTJNGUVedsb2r7prI2ez6I8LLESVaKPVKkTdPcCQ9GzAgVRQ2er9Vfq2C5naqJF8DQ43PGlsA4HUnMFg9HqPhQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773676934; c=relaxed/simple;
	bh=Ypla/kOENH07xh/k/3FUKlYHUPddmaGsQDJ5tt+zBdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ggvR9c1fT6z82Y6uR5FlCscFBG8ZivpOBMxYMVXOaLkQ01lr8jmVIBbDJh3Sjy28Kbukg8EVdUIB+mv9iSlblEw37ATyDdoiVTxEFhqTA93foQ5zJaJ86onTkqryiOh6mSxEY5N9G/1fmKpn8ohg5qwScRIyfLDhZiO08sSx/9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56b91ead558so405803e0c.2
        for <arm-scmi@vger.kernel.org>; Mon, 16 Mar 2026 09:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773676932; x=1774281732;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gxIv5A/7LppNvLw/5xO3s1KDlHKvNsqys1mKlpYe60I=;
        b=n85uvPaAG6q3me+Wol1waneba+rxxYm0y+yqImvIv1ZcYRpP7pKToy+IO+TuZD9xsg
         5mCAVjKBlDEhP/iWSbOgfXQIA4Z/H1DcebePwE69eS4q1UaXYg2tISLkL5gIqSOUe3Qc
         E7qjUMSkJ8ZZYXBcJJExBvmedjNzVkiPX6g07TSiSgwoTKc+z9w6JO7DKobOfUNoNDf9
         PeBsM/X+g9PPndo/X2B0f4miEu86Dkw9+TQHjA2Dwb01bTWZbv+xv3ThsedRBDLlEQLh
         tDedPLZuSWr0CAD96+yKtiu20HtVamSM/HPdIdd8wKey3LHJOAHgu/kFRytrgMqx8t5R
         FCHA==
X-Forwarded-Encrypted: i=1; AJvYcCXi3sNY9XJT3LvkYELl5su5uWAPzIbFVrazusfB6LEY9AAZyNSUGwi17iOaYFcQQCFVusNa7sB9ag==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywokp6lHpCJM3l3J3eR0rDDdVnn2PdQSQ+FgdMand584CfQZwWz
	TNWxDlZLIe+o/oGkXJfIN03meOXe6y1AmAKHIg4LkW/jjntep0qEznQI+kg3fEZc
X-Gm-Gg: ATEYQzzHe1ADE4PPzYdY/hDT7cL4Itk43QsX0XuvzAVCv/7bYEGxc++X23hxDYJLN5u
	ZBSsW8AGHHiCbqjlVbTGaqICXIBC4IavjL2jmAaiFl0ZxDCcYqn3YHXVV52BzkTXiuTfRPsB9wD
	inhvM4YF0JVueGRL/yebWIOUBH+UQCZZKJH665ZNEYOHpMMWoqUwDDsf/A35vPj+YhwgO6EqkHD
	74/wiefzdwoAoQyt5CkLypVDxQlhUocG4oTJRozrbtZapwxVG6lJeHZrEt8jRiEsprZ1ITUlTVc
	XFOi5h5DGgb2w4mk+994DgnvRd3f1DiLeGdd+YBBrTOeSYKCOd2/r7XVTXcdLoAnyqn04kHC/5W
	LSWwQFKzn+CsOOQmaU6EugLmzX9q+DVVWZP5r0MCA+V+5Fr9SrLAhgDdlOPKMPBvjXIwkB5YdgF
	5+hsEglDZRK4XZz3bDggRWpXlWTLmZsMvENW/X+pW0JXdkMPpuUG5/XOnOw0HUt0fJdWveILiDw
	sI=
X-Received: by 2002:a05:6123:43:b0:56b:7484:395 with SMTP id 71dfb90a1353d-56b74840769mr3450732e0c.12.1773676931649;
        Mon, 16 Mar 2026 09:02:11 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b4645e8cesm8121804e0c.10.2026.03.16.09.02.09
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 09:02:10 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56b955696ebso102461e0c.3
        for <arm-scmi@vger.kernel.org>; Mon, 16 Mar 2026 09:02:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUdcpAgqeFXCKWZvvyM3jBrZqmOS50dkIar0BgnKeGrAi805Hc/64MQ4OJSzHoq4wLGtDgE9LMWRA==@vger.kernel.org
X-Received: by 2002:a05:6122:35c7:b0:559:6960:be0d with SMTP id
 71dfb90a1353d-56b62971a27mr4668648e0c.13.1773676929318; Mon, 16 Mar 2026
 09:02:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <51de914cddef8fa86c2e7dd5397e5df759c45464.1773675224.git.geert+renesas@glider.be>
 <abgn70W3kYZcZpg_@pluto>
In-Reply-To: <abgn70W3kYZcZpg_@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Mar 2026 17:01:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUb0=kMhCWk4tD4dJTGvSp8fShO=4xM8k6iqcYU0-wG=g@mail.gmail.com>
X-Gm-Features: AaiRm53uOIxgf_DJ9NKvMNXm8lHCsReBFW-7ybb2n7U6nhLuqhnqvVgwyg7V9po
Message-ID: <CAMuHMdUb0=kMhCWk4tD4dJTGvSp8fShO=4xM8k6iqcYU0-wG=g@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: Support loop control in quirk code snippets
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Christian,

On Mon, 16 Mar 2026 at 16:55, Cristian Marussi <cristian.marussi@arm.com> wrote:
> On Mon, Mar 16, 2026 at 04:34:40PM +0100, Geert Uytterhoeven wrote:
> > Each SCMI firmware quirk contains a code snippet, which handles the
> > quirk, and has full access to the surrounding context.  When this
> > context is (part of) a loop body, the code snippet may want to use loop
> > control statements like "break" and "continue".  Unfortunately the
> > SCMI_QUIRK() macro implementation contains a dummy loop, taking
> > precedence over any outer loops.  Hence quirk code cannot use loop
> > control statements, but has to resort to polluting the surrounding
> > context with a label, and use goto.
>
> I was just now writing the quirk for the Renesas issue and realized
> this limitation :P
>
> Do you want me to pick this up with the quirk template for Renesas issue
> that I am writing and post all in V3, or you have already the quirk too ?

I do have a preliminary quirk, but I don't think it is ready for
merging yet.  Getting this limitation relaxed is something that can
already move forward, though.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
