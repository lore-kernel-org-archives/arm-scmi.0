Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEAB3AF674
	for <arm-scmi@vger.kernel.org>; Fri, 24 Apr 2026 11:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030106; cv=none; b=SqgSwtjBdlStcxRuEHKCuxkkbwIYfDzevu0MnYASPsuHwkfkbipVRd5n3fz4kq08cJrAmXD8ubRqUtyGB9fEapNYi0iamR9J6H3EYATmrZid31yoFeQ8bcFuh2uuAt0cjMZAHRjGtJvPJQ7MbE3brwRTqXzLM23+BIgMz2k15UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030106; c=relaxed/simple;
	bh=NrNB0Z4JheJ9/gWbOMPohCnZWZtAqhLPKDbrHylRWo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TFjVTEMTAee0jKu2E2vu2kUoVqM+frLuG3THz/M67+hqxQzAOTM7LMPcl11kgh34z6XBrwoaMZ/KhxXXymLW67RsJqGrc98Eq23A6y2eC3ORWAct+L714G9RGLujauVdCgz/JzuVMTfXRAAzBmjNjl9a/pzCf7h45hCS7iwtZgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-6057723d553so4128348137.2
        for <arm-scmi@vger.kernel.org>; Fri, 24 Apr 2026 04:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777030103; x=1777634903;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTjTO3Vp0zB9Wc0GJptJYSFqlnWOG96HJNT3Sm1YIxY=;
        b=VSnVccjFzYJ7Et6fvpcmR4iar/8pOtYlil8vVl0BThu27f6OOibiQOj+GQpTrCsWbN
         gnPxFCiweF4EB7FyMWq7g0QlTasZJHHv05BzLg/N2n88PA3qozb7BA+GerRRPLOD85+4
         C/J7jAiLzH9XcNfboNCypFSwjpkDqF+ofz147QWlBnr5TZwMbd+/nqlJhQEGry3e6kia
         B+9S/NmyEMZiyUu8LkZtY8VLmtR7uQRzwcrQEQ5c8ZuarC/xL5EuykS5F1SkaJXC9CSj
         qOfTAiMuy+bz+7VVxHEfDlc741Cu7b2INlWwbgQkuOZQhCh8Jr5uuFxu2iOFmj7IuiJx
         qzOg==
X-Forwarded-Encrypted: i=1; AFNElJ8u2VYkCIyZleXwRjRJcK/Jiaz+KlUF/eZUmI3DSp+A67Yd1PAmcLCp4OB6uy1JLle4bo+u8RSBRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhdnYmJoQhPS7WwWiM54KTPxkk3nEhA+cWfNcXZ/Skg0edq4t3
	mDmlIzIZwzwNnaSxi86RDsWunvxVv4pb4csMm7sOw/zGaM6zXN0UnL+5CIKOb5E3hvY=
X-Gm-Gg: AeBDiet80An3tQYvxe5Kv6B3wWYYav+svqQsUu32MbWs5xD+7F4x0wNgSy5Softmnav
	zsHY2W22sn5Ce7WE0gIkdzk+kbY9+ZvSjeI7tUuRh7Onml7ppIhDC1zRBrzOIFgmoqW4/wW9ZJz
	+T1JmjjHo+5qZFrldJZkMRy80q0MLzzw0ciZ8zFSQ3PWptZeQMCXEi8qms5MLdKN8+FZJoDnUYx
	Av206oO4z8k6/3+Atn+ahXA7a6SjUS5mgweIgABOeeJjZmQ/bTHGByDDLf4eueByrmHvi2om8pm
	V23SL6GDKzjiyd+ntQKfn9kg2C4llhj8o/5tKDbWX3b3P7k7NKn4h3cb40OGNEnZEcDt4WTZDLG
	Oa7L0CKsuw0myw9xtnuF9oBsJvoVOjCHttY1wTBAw9A+Z1zdlGq3DY5ltZGK78E6j++QO0CJ7Nd
	bu2eVXobdCe16oxUZK3p39XI0uLMk82z8Bie34rM2KHj4b8clXODBArRzqAjcTB09DCMgDzpU=
X-Received: by 2002:a05:6102:8029:b0:60f:86de:c878 with SMTP id ada2fe7eead31-616f7c4b806mr17213768137.30.1777030103389;
        Fri, 24 Apr 2026 04:28:23 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95890c0a526sm10735237241.11.2026.04.24.04.28.19
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 04:28:20 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-6057723d553so4128307137.2
        for <arm-scmi@vger.kernel.org>; Fri, 24 Apr 2026 04:28:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+LMJYi7X1hxSnV3d2RAcKgETCeL3ypejpUuBF7ulLfbwaT7zyM4mje7gFluNVHnEzVDOS8xjPN2w==@vger.kernel.org
X-Received: by 2002:a05:6102:292a:b0:60a:cd0e:5cee with SMTP id
 ada2fe7eead31-616f4f84fdamr16386481137.12.1777030099174; Fri, 24 Apr 2026
 04:28:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <7hcxzqr4qi.fsf@baylibre.com>
In-Reply-To: <7hcxzqr4qi.fsf@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 13:28:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU=3AN8wHbnO2Cx4WsLuYWhv_fRfTA50fmrqyREO3nrbQ@mail.gmail.com>
X-Gm-Features: AQROBzBE70P7irgYnQUYx63AIUadZqGfMGlPrac0wi4EECHihh00jV8ht_DYoMI
Message-ID: <CAMuHMdU=3AN8wHbnO2Cx4WsLuYWhv_fRfTA50fmrqyREO3nrbQ@mail.gmail.com>
Subject: Re: [PATCH/RFC 00/14] R-Car X5H Ironhide SCMI CPG/MDLC remapping
To: Kevin Hilman <khilman@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Kevin,

On Thu, 23 Apr 2026 at 00:48, Kevin Hilman <khilman@baylibre.com> wrote:
> Geert Uytterhoeven <geert+renesas@glider.be> writes:
> > TL;DR:
> >
> >     Describe hardware in DT, and perform the mapping to SCMI in Linux.
> >
> > The Renesas R-Car X5H-based Ironhide board is the first Renesas
> > SoC/board combination that implements the ARM System Control and
> > Management Interface (SCMI).
> >
> > This means Linux can no longer perform various system operations (e.g.
> > clock, power domain, and reset control) by accessing the hardware
> > directly.  Instead, these operations are abstracted according to various
> > SCMI sub-protocols, and Linux has to send messages to an SCMI-compliant
> > firmware running on a System Control Processor (SCP).
> > More specifically, the R-Car X5H SCP FW SCMI controls access to:
> >   1. Core clocks and module clocks,
> >   2. Module resets,
> >   3. Power domains,
>
> I'm very curious how power domain hierarchy is described on this SoC,
> because one more issue to add to your list is that hierarchy cannot be
> described for power domains in SCMI.

So far I had no need for such a description. AFAIK, this is handled
inside the SCMI firmware, which does know the hierarchy.  Hence the
firmware can power up a domain when any of its children is powered up,
and power it down when the last of its children is powered down?

I think the clue lies in having a PSCI top-level domain, cfr. what
you wrote in [1]:

   "But... how do I describe the relationship of this hierarchy? In
    particular, when the SCMI-controlled PDs are actually subdomains of a
    top-level, non-SCMI PD."

Or am I missing something?

So far I have used only a few devices on R-Car X5H, and e.g. the
serial ports are in the always-on domain.  I did experiment with
a dummy UFS driver, as UFS is inside a real power domain, and that
seemed to work fine.

[1] https://lore.kernel.org/arm-scmi/7hecy3h7ky.fsf@baylibre.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
