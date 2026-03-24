Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1B1361DD0
	for <arm-scmi@vger.kernel.org>; Tue, 24 Mar 2026 13:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774358154; cv=none; b=UaFL6zidJBAkqfeGM5LxmA5Gg71mZ1+rWsa//IqcVTvp2InpXw+R/IXQtKKgteya6LL7wkcaFYL39ap7pqqvuKIOIZimdOMss6hTbCqh49aEgavzOnqG4kbyp5ggZbx8QmdhNC48yekuPWF9NvhpoJwqXtj0a3pqOgrPGYJjo2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774358154; c=relaxed/simple;
	bh=gBub+30839fRGTNvJrtkapXuFOhtTSRKKB0n+HY7jR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VSu/U8KuqwU3RQO1MOd9075R1TP23n3XrHhfhY30dBbvX/XBQIqzqVs7SjTZe8SiOqjkUpJlFpqkItUiBAGEHmkGQcuyUgSNfzemlFV93MkGLaFra+sxBT0w2bzp2LilGd8Dwi008v2xHr0wYAfkr1zf/Xz7PStE9h7d3dgxzEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b97ba4c2be2so174410366b.1
        for <arm-scmi@vger.kernel.org>; Tue, 24 Mar 2026 06:15:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774358151; x=1774962951;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ZruyXZrbQHt3N4rmi80wfoanB43KDupr/dMlhmmcn8=;
        b=p+KpzhQ7DLypa5OjLJinoTFjpheNDkAmLf7CP4FAkG5BK2hcNxmYwJ8h2eOEu5gD28
         9dPjAT7VAC+MToL2hT1o/qCcskEXJQoamYvQIL74DknVbxTqL6unMarRcgfOqbpUxZAt
         EIp5Mi6KU7ZQpjehXBk8Bx6OGRr/upTS4UVSCybreGzhF+GfuKjicJAha0M09fEUmmNp
         mymZskCkX8OZiot58M2JZswAqVYKZ+5quJmhmi1cpEbqDlrr66BnA9/+j1cbYJIsGZbF
         +bmhrhis794ynLPNw/hth+lA0Fmdh5FBzD28N/Q/XGT8KipgqfMUKjIP9wAINj8GB1Uu
         2TPg==
X-Forwarded-Encrypted: i=1; AJvYcCXmZp/duZaBsg5zVFG9jXPxuC9fVXDmJFOJVfSGs/sq2dEUrI4VMQ2+gFJPXsHuw1RJ0l7E1v2Wyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUIUcbY1PpFCc4lXA5qNAnBsh8iqtYcYMbq3dwbEUNNBuMpvhy
	UWL74bozhSx5QWsNXcCbVaYG5DgrsB9EyV+E+HtOwSJR9VTZr++w+YGMix5ZvgXj9bo=
X-Gm-Gg: ATEYQzwwOokGcKJRqc4yXsrvY0L/mUzPlSbVVF7jtcD0GpXg069L9nTTuiVvpNtuIWg
	XwKAYikRETXVIglrLFsTevsSZfmCUEvAbj+ZytncGU//hHtKScS7tFCvhXMdgLHJX93GxodoXcu
	vZriV07r9R5yoaowPDci3UchbmLrm2oj+lzY/iqwhSId8ktgjS1R2+c/zGR8UkiP7gZ7GStmiRy
	xy9tBq3ZvtcA32Zs5U3RclM2faDvBb91DM28Ftkr3j7sAzXBuwbMWIm+9H/Ls5168tj+CBGNcid
	sG+ISNmCuSmHJwVpDVxdIOlGXyvxIfQoAtZ29BeraOHZqMQ+7xEExP88XSksUQgeylRg045p4oa
	pd2ufU3dpbxmZxGcX0bjAFBKqood4ZGGvH5yHZOp0TfHKnjJpXhRIJwF0VTN76cPHuuZb0w+v2i
	xpV+vTBgXq9p8ZaSlV0JiGVNYJl0chiz7UWwh7hiJZ5zLmaRhC8voEhizfo7QEDYd47v2tSxE=
X-Received: by 2002:a17:907:cf93:b0:b97:c968:d9ba with SMTP id a640c23a62f3a-b982f245c72mr1144267266b.5.1774358150822;
        Tue, 24 Mar 2026 06:15:50 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8c16csm640611366b.16.2026.03.24.06.15.49
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 06:15:49 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6686697f578so2095312a12.0
        for <arm-scmi@vger.kernel.org>; Tue, 24 Mar 2026 06:15:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVW8m2b+uVSeI90XaGIvkYxe0lOYobPngH4+01UAy82oWUXcpHXj78w8DQ6KilUS+reP00k8rdo4Q==@vger.kernel.org
X-Received: by 2002:a17:907:2597:b0:b97:b20f:c5b2 with SMTP id
 a640c23a62f3a-b982f245b2fmr799019466b.9.1774358149303; Tue, 24 Mar 2026
 06:15:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324-scmi-clock-fix-v1-v1-1-65c21935824b@nxp.com>
 <20260324-lean-bobcat-of-reputation-6628b5@sudeepholla> <acJI7o79lVNMjV_d@pluto>
In-Reply-To: <acJI7o79lVNMjV_d@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Mar 2026 14:15:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVcE439Cyn-TCoioLZXP-YpqObZ0UF8F2NvMCZ41eO6QQ@mail.gmail.com>
X-Gm-Features: AQROBzBnIg65Mgs2_Bw6h5VRtO1WdeEHkhxhLMRcr_UZnpHgg5vJ_aKHfWStJwE
Message-ID: <CAMuHMdVcE439Cyn-TCoioLZXP-YpqObZ0UF8F2NvMCZ41eO6QQ@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: clock: Relax check in scmi_clock_protocol_init
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, 
	Jacky Bai <ping.bai@nxp.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cristian,

On Tue, 24 Mar 2026 at 09:41, Cristian Marussi <cristian.marussi@arm.com> wrote:
> On Tue, Mar 24, 2026 at 07:49:22AM +0000, Sudeep Holla wrote:
> > On Tue, Mar 24, 2026 at 02:24:14PM +0800, Peng Fan (OSS) wrote:
> > > On i.MX95, the SCMI Clock protocol defines several reserved clock IDs that
> > > are not backed by real clock devices
> > > (see arch/arm64/boot/dts/freescale/imx95-clock.h).
> > >
> > > For these reserved IDs, the SCMI firmware correctly returns NOT_FOUND in
> > > response to the CLOCK_ATTRIBUTES command. According to the SCMI Clock
> > > specification, NOT_FOUND is expected when a clock_id does not correspond to
> > > a valid clock device.
> > >
> > > The recent hardening added in scmi_clock_protocol_init() treats any error
> > > return as fatal, causing SCMI clock probe to fail and preventing i.MX9
> > > platforms from booting.
> > >
> > > Relax the check so that -ENOENT is treated as a non-fatal condition.
> >
> > I understand the use-case and the fix here, but still wonder if this
> > should be treated as quirk or handle it in the core. I am inclined to
> > latter as reserved SCMI clock/resource ID seems to be trend in its usage
> > and hard to classify as quirks.
> >
> > Cristain, agree or have a different view ?
>
> I was just replying...
>
> Looking at the spec 3.6.2.5 CLOCK_ATTRIBUTES
>
> "This command returns the attributes that are associated with a specific clock. An agent might be allowed access to only
> a subset of the clocks available in the system. The platform must thus guarantee that clocks that an agent cannot access
> are not visible to it."
>
> ...not sure if this sheds some light or it is ambiguos anyway...I'd say that
> NOT_FOUND does NOT equate to be invisible...
>
> ...BUT at the same time I think that this practice of exposing a non-contiguos
> set of resources IDs (a set with holes in it) is the a well-known spec-loophole
> used by many vendors to deploy one single FW image across all of their platforms
> without having to reconfigure their reosurces IDs ro expose a common set of
> contiguos IDs like the spec would suggest...
>
> Having said that, since we unfortunately left this door open in the
> implementation, now this loophole has become common practice
> apparently...

When I first read that paragraph, I was also confused.
What does "not visible" mean?
  - Not present in the clock ID space exposed to that client of
    the system?
    Yeah, multiple different sequences of contiguous IDs, depending
    on client!
  - Return failure on CLOCK_ATTRIBUTES?
    Which is what implementations seem to do.

The next step in the fun is when the system actually needs to know the
clock rate of such a clock...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
