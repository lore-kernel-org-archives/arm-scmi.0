Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2320386C38
	for <arm-scmi@vger.kernel.org>; Tue, 24 Mar 2026 15:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774366392; cv=none; b=KDAA6aI2eY+ZMzq7Ce2YHsPe/Q8vuewxsf0Mi5Gc295h5NzktEoMSnR5CBHrPwVW6vhsH+qJyV/UDTIqtc25RvrLuiEehwKb1xdGRFW1l2UUqBQISmMIfAVttXf5BTKmpaYvBfho9hiAyeDEjBDVc2ruKwcw9MyzPNsaqd8N5Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774366392; c=relaxed/simple;
	bh=KaQjYumsYMcWfc8vtCYt/kFSYK3h1OhtYSBTNjozRFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ddKK156Vdtd67eB39iqJWFYRZ8XrwQjuhtxV7/88AGnb1W78tJyd5x8iB+1gb3feDDQnCiq6VcUITOawbRQ+VoHDKAfw3nlwmT7MWxb8UhmBkMM6M7T/YSbHHlvfgzqKdo4ANOqkQ94Nud8bL7NcQUnAcQuxAM6gsOnAJwu/zn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-602a0648aa3so901159137.2
        for <arm-scmi@vger.kernel.org>; Tue, 24 Mar 2026 08:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774366389; x=1774971189;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dX91cjvlM2yf0by5+MQRb4126il7+nZRZllt3soyyC4=;
        b=F3XsmXlLkjH6nCKQBpR8A0nxjxfpPM4dYXeGAvN23N4FZmTy7hFuaTy5E+q9wZfjCj
         gbjBcpRVugP4JDkGu227GcDpppKt36cbAVHuy3113sGPR66aKIKSoMpkenJid9GgnNcT
         nR8xWZFAQndNx7N/7hKFunrdR5DTBR465ky/DfJKCCS4xTnjTswwQVE587LLxgIPPW1W
         LXj4vfORqzHsucXRDCYI4ea7h+qdfUy9E+aV3Ct9NZNzJp9Zy9Th0VAa5PAqp+8U9ZnR
         /Z73PFwh47a8/B+05zrG4QNeplPx3lGNHexH3tlXpdiL3j6wzlhBbcMJNvXRlh825HvD
         GkXw==
X-Forwarded-Encrypted: i=1; AJvYcCVpe9/FnHiCW0uQlgxGmZ8ci/XHekGEIB7Nyabzjw0w9IduwLVUJTfyRauN7VJe8MpKt70+h6XOQA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7vMBoh0yQl7Anu3ULbMCEhLcywbzZSpkg5QAUM7X/JF9jVaAf
	vW0/awBqofgKXHNMMDNvuFsNCoNPYm8RxxQAV31QPJPkAxW9w+p0zdFb1/Nz/ddOWos=
X-Gm-Gg: ATEYQzy1/k6Dyim3PqY62xewbyG4AytbgPcD3HwicXq/a80sHGxC3GBSsGL7gFxhMOZ
	XImnaU87MMWnJx1P0zYKS6nwhZ+tgpGVbJHhcQg269LgMMbirmzzHJZf6VtJ8liH+W8LsCa0J11
	iRnJcWyIz8GGyuVXjpO94C2Kt6fOh1x4ZYz6qD9TuK/X6sMTtVek1w6RDFKKYpUSK2qmTei/Kqa
	IcDWx9asUJ+bulKXJIntk05FANeO9WPLDRoqTNrbeCskR7gffk4RPChv/11MPC5ABl7zSKn+GGf
	7mSSc7rnwMUeiy6RTslwjK/mzCsAeHmZTMSnsI7ovjNH0eBQkh8Rw4dzftvfkwXdSNQzI3LwdWy
	Rj4CyflFH3klECEkznUF55IJL7J55qz+Pj5SyfX39WHPn7T610kRmiqTaEwhn64om1nF+tPPrq5
	axU5F33bODAIx7xiZ+s0XeyCjz1gTAhgl/FEnleGq387VPundElX16tR7oNeae
X-Received: by 2002:a05:6102:508b:b0:602:98a4:3395 with SMTP id ada2fe7eead31-60394935addmr147184137.30.1774366389423;
        Tue, 24 Mar 2026 08:33:09 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-602af8ea547sm10868824137.6.2026.03.24.08.33.08
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 08:33:08 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5ffabb1dfbaso877286137.3
        for <arm-scmi@vger.kernel.org>; Tue, 24 Mar 2026 08:33:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUU1AD284GVmKoN5cxV6J9d7SxXYu29J8GDkuUB0jFL21C68qvtCp2o0ISj7JgpzkkIzyc2G2N7Bw==@vger.kernel.org
X-Received: by 2002:a05:6102:3710:b0:602:6c8b:4c1 with SMTP id
 ada2fe7eead31-60394984ea4mr160731137.34.1774366387796; Tue, 24 Mar 2026
 08:33:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324-scmi-clock-fix-v1-v1-1-65c21935824b@nxp.com>
 <20260324-lean-bobcat-of-reputation-6628b5@sudeepholla> <acJI7o79lVNMjV_d@pluto>
 <CAMuHMdVcE439Cyn-TCoioLZXP-YpqObZ0UF8F2NvMCZ41eO6QQ@mail.gmail.com> <acKhJ8Z9WDvHEnYL@pluto>
In-Reply-To: <acKhJ8Z9WDvHEnYL@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Mar 2026 16:32:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW==oMpCS==L8ADexPC=4uczNwK5UD6DequBjGOKQfOZw@mail.gmail.com>
X-Gm-Features: AQROBzBN0dbSC98PQ2QVW1vr96tinjmd_XI_AcUn3qO4saxxiTbxjn88h5qmDk0
Message-ID: <CAMuHMdW==oMpCS==L8ADexPC=4uczNwK5UD6DequBjGOKQfOZw@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: clock: Relax check in scmi_clock_protocol_init
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, 
	Jacky Bai <ping.bai@nxp.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cristian,

On Tue, 24 Mar 2026 at 15:35, Cristian Marussi <cristian.marussi@arm.com> wrote:
> On Tue, Mar 24, 2026 at 02:15:36PM +0100, Geert Uytterhoeven wrote:
> > On Tue, 24 Mar 2026 at 09:41, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > Looking at the spec 3.6.2.5 CLOCK_ATTRIBUTES
> > >
> > > "This command returns the attributes that are associated with a specific clock. An agent might be allowed access to only
> > > a subset of the clocks available in the system. The platform must thus guarantee that clocks that an agent cannot access
> > > are not visible to it."
> > >
> > > ...not sure if this sheds some light or it is ambiguos anyway...I'd say that
> > > NOT_FOUND does NOT equate to be invisible...
> > >
> > > ...BUT at the same time I think that this practice of exposing a non-contiguos
> > > set of resources IDs (a set with holes in it) is the a well-known spec-loophole
> > > used by many vendors to deploy one single FW image across all of their platforms
> > > without having to reconfigure their reosurces IDs ro expose a common set of
> > > contiguos IDs like the spec would suggest...
> > >
> > > Having said that, since we unfortunately left this door open in the
> > > implementation, now this loophole has become common practice
> > > apparently...
> >
> > When I first read that paragraph, I was also confused.
> > What does "not visible" mean?
> >   - Not present in the clock ID space exposed to that client of
> >     the system?
> >     Yeah, multiple different sequences of contiguous IDs, depending
> >     on client!
>
> Yes that is the most spec-compliant interpretation usually; in general
> across all protocols the SCMI server, through customized enumeration
> results, should provide a per-agent view of the system: this should help
> handling shared or virtualized resources, since the agent always see
> only the 'illusion' provided by the server...
>
> ...under this assumption if you dont even need a resource at all (not
> RW nor RO) you should NOT even be able to see it...this in turn of
> course means that in order to expose a contiguous set of IDs you should
> be able to properly configure at build time the FW resources on a per
> platform basis...
>
> >   - Return failure on CLOCK_ATTRIBUTES?
> >     Which is what implementations seem to do.
>
> Yes this is what is done leveraging the gap in the implementation...I am
> not sure that the non-contiguous set of IDs is supported if not by
> chance as of now :P (especially in other protocols)
>
> > The next step in the fun is when the system actually needs to know the
> > clock rate of such a clock...
>
> Well...that seems a bit of wishful thinking ...

Unfortunately it is real... [cliffhanger, to be continued... :-]

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
