Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2732426ACC
	for <arm-scmi@vger.kernel.org>; Thu, 30 Apr 2026 10:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777545297; cv=none; b=G0jFYDpQ63DbUMyUJfubb6aCrUzo7mrS62Gfyo6bciGZWa1srL1bdWmH4h0nrZ73ulVTJkrR3z5V2iaWXFrAa/YuP9U9NlCFZA6CpjSZIMChY02dYytbLIiwQELK+Pwdqd0OguQCLw2fbFLx69Pm0ZMONhz0OAAfxeEm3LkGKsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777545297; c=relaxed/simple;
	bh=/ACkrqPLwkb6Dq1TnX55QJ5vxrxsdjMvN8alGvzN+7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KE59y4p07HRoU/ANUVsOX945zI5ToXUnzqqRpinPNPIdZYd3SU6xdP5XikGqAc0fLxUeETuH2z8JfzGEIJftEIvji2ZqoJLiSL1TfEKcIoHhcDJU4DLv1EDynutx4nhtaVanV90GTXnSeP76WN4Jeb/4o7NLk3dr6MJYFHfht+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-612d8a59ca0so471449137.1
        for <arm-scmi@vger.kernel.org>; Thu, 30 Apr 2026 03:34:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777545295; x=1778150095;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8V+koq3Lkj3wDoBaklA0Xj48HW7uARBNgY6EDlMDXlI=;
        b=OX1rHTbGtr2E864lJkATh8fY/7f14EYL+1UdTs1PFfogJA5yCSoAv41GoewYthyORa
         Cu4BAQRtqnD4W+/skC3eTnWUKdlq1edFPFQ2kOLF4lZemD2uqgh9R6mvT3KETnn2OpYi
         Yo12IAJSMzCke36Qwo0/2XUr94dODigPCa3FsyfHVDywVvs2vQ0zrZcXF4uW4El2fTnJ
         c+d8qz0og6YZAFx+JPuE2euwwFQTj+eARTdNSP8h7cNr88qF1YIG4XZy7XSISybfOZ8G
         oFuBlvpGWsjWOIXR70hvkT1uTw0Em5ChyIGyu3CS10yuHecMPbbDSaLG/Awa/SnPe/V0
         pcsw==
X-Forwarded-Encrypted: i=1; AFNElJ/2JULEx/zkN5jB1hqEvKWKO/mTvxhLovfxvEsfJ3qjP4FHqqpx1iN8fPcYlAAjxDWWU6tOEuHGzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIW9EdxnvncyeVnsRSn9ZvTScXOtm9cTmQfvXYwEWy7tu0H39d
	1N0la60zyb8KLgrTuqV4tB32eURD8c8eh/xTXIVhKbtU95lPC8OBXjEJLJz99Er5bWQ=
X-Gm-Gg: AeBDiesxety2lhV7A1r/R/kN6JbrM/gLsNpEphe842iKeYQiUslGezS75w9k+X/T/9r
	YapUV2nlvqck26wlLyllOwFgLwZomxeUHFzdjbUWvG8H9oVWASx/6U2o8OlhLVU5SX3xiLH0joL
	ZzrGMxSlmTLQd48D/SxCd/ZnFRr1NGwtcEYcUv3jdG3qdighhgWZizCduirhTNvW8s39nBH5jqg
	m241cR/7SZOUJr6xT8HurU5ZlDQyCWw4KlMB/nGYxvKFDVUR35nR1XS5VkqUASDmKBWR2nWoew8
	ZFqoew6/0BwswrcvYhUncpROudlGp0bIACP2DQ5zyZLf5e2qRqYArue3QvEAc0iodgOlbM10i2I
	OGksyvA4e9Wgbr4hBJU/8I4FGU4L9wYOmMBRLQJFhRfaPsAcjtcKH38lR5GHUmoiLcQ5pHA4Chj
	0/4nQ8US9SdTkoXO9lXZ1VtSHgspE2e90mvSprhhdfHLqsaGqwObpl1slc5xccG6NnOFrM1Bo=
X-Received: by 2002:a05:6102:919:b0:604:f155:9374 with SMTP id ada2fe7eead31-62ad3f5e7fbmr1024113137.15.1777545295117;
        Thu, 30 Apr 2026 03:34:55 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6298433531bsm2575792137.9.2026.04.30.03.34.54
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 03:34:54 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-95697b46831so534260241.0
        for <arm-scmi@vger.kernel.org>; Thu, 30 Apr 2026 03:34:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8tu+AxZcsfp7DbvP6teYrqxYgQkNXeoaYs21ByPi4BaEmp7Hkr0IQFPbkFNZKOz9/nP9uE3Mh2cg==@vger.kernel.org
X-Received: by 2002:a05:6102:8007:b0:605:42a8:940f with SMTP id
 ada2fe7eead31-62ad52baa51mr975391137.31.1777545294613; Thu, 30 Apr 2026
 03:34:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1775205358.git.geert+renesas@glider.be> <fe257b3b7b7b5c17fd0e5727bb9746c731bd7e3c.1775205358.git.geert+renesas@glider.be>
 <20260430-heretic-mandrill-of-symmetry-1c9a5e@sudeepholla>
In-Reply-To: <20260430-heretic-mandrill-of-symmetry-1c9a5e@sudeepholla>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Apr 2026 12:34:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWaF8buTuuMOPZLyEVF0vqPPdQxYP7LYJSj+vhdPJFc0w@mail.gmail.com>
X-Gm-Features: AVHnY4L33oPAm_CAAO0Uaw-sYvBE0zPN2_ObN8TXsWUvlHnMnI4J9wpUyxDMPnk
Message-ID: <CAMuHMdWaF8buTuuMOPZLyEVF0vqPPdQxYP7LYJSj+vhdPJFc0w@mail.gmail.com>
Subject: Re: [PATCH 1/3] firmware: arm_scmi: quirk: Improve quirk range parsing
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, Marek Vasut <marek.vasut@mailbox.org>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sudeep,

On Thu, 30 Apr 2026 at 12:17, Sudeep Holla <sudeep.holla@kernel.org> wrote:
> On Fri, Apr 03, 2026 at 10:41:29AM +0200, Geert Uytterhoeven wrote:
> > When a range contains only an end ("-X"), the number string is parsed
> > twice, as both "sep == first" and "sep != last" are true.  Fix this by
> > dropping the superfluous number parsing for "sep == first".
> >
> > This does have a harmless functional impact for the unbounded range:
> > "-" is now accepted, while it was rejected before.
>
> Supporting "-" is good but I think the ret is uninitialised in that case
> as sep, first and last are all equal. If you agree, I can patch up by
> initialising ret to 0. Let me know if I am missing any other case where
> it is not good to have ret initialised to 0.

My bad, ret should indeed be preinitialized to zero.
Thanks for fixing!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
