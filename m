Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9BF314D21
	for <arm-scmi@vger.kernel.org>; Thu, 21 May 2026 07:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779350005; cv=none; b=EuEzl0NMcPI7mIcpTMFH4ukFXbNGCAm0IG5I5eO4CrRRUJeHokF87wpNMJ9fjbHtH/hI/cLXNxeaP5HCPOS6qt6G6OlkeFG6pzj0ZL7kZrxj7e/cZwdwfUqWsf9c0Y5QZYP6hZSx6xgLgBCn0kx1PnM95BZ+O+cO9Q0PWX8augc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779350005; c=relaxed/simple;
	bh=Elps9fBi5BZscgNouP94RbYaiN1UBZynj82GY8eI3js=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FNbWl46c2Hfzzo5GqaKXMZJUdH3EAH8qyKoylLg4yXR2ukN/aYvBbNInxLx400fPtA3s87VFhuQ9M0NOCMXhiLYEMwxIV3DXNhh4W/s1QkZI48AEJ+vsGeChJrYRapxVmS1IGJm5DuQKjkP+qL+7K/64Fp/5fZCDCu2qm0GRvEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-961556c15ceso319970241.3
        for <arm-scmi@vger.kernel.org>; Thu, 21 May 2026 00:53:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779350002; x=1779954802;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8G/x4JJtOPaC66y0xIpsyhNcO8UWKG9STKYzUChGp/o=;
        b=RUaaY706WpPpnBmPmRYPUTSmqJcvpMk2KlZZnzIGLmL+5K85XLmlrL8UEXkje4WC6l
         UnRYDuspMnvuu0XwNrFz2Z1vOoAuZ2Ijhbu4nCvJjW/E32JZwkKBFEOGR6xnJzwiV0yS
         HS4SrW8oJn8ynxXAh+O0ON2mkZobyInX8fMepht3VKN5GrkRrXtDBoCWRFPhP2QHSgl4
         BS/uIdhu0f92JylexAJOZDyK6LuXgG2pdrVMAYXgH8cgiQyVrOpehhk1AxhKd4DxDjwF
         sxQib6M4iPGyncvKLe1vceLxJaZAHTYFaZDQSig1kG6ngrSi+arwxZHrXegaaUIQFypv
         yd4w==
X-Forwarded-Encrypted: i=1; AFNElJ/9wJW3nPTpSB1XSPvXmLUx0xTNKWBasSABHW9PnukT10M+xh2FcJ/8MCe85Zzrdrt+7sAqQJQ36g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrVjUBmFtjD2QtYj4UT9H/vGWFuvsShReGFFtpz8GOSvyXJpJK
	b/f+9tLO/8pZz87JFdPr1z8M8ZYP4pA2y4RjC8Vl8FeVyh38VDpoq2vyRUAEcTJ6DrE=
X-Gm-Gg: Acq92OEABrMdBL5uePpd0MqEtd4kHvD0iPWLkoDAgqms+MHQfzoN9YEhemvOFu7j+A2
	fH8xtbmelLFxJRGtjH98i9RjC00Z5HTu7+Z0p3u6fDgniWPwjwj44AViBs6b18YXyO9hcVZUjR3
	cFaMWiPga/tAZmtfIfjb/O9shE8j7kTeMJoYangwTKfEeuzbH+r/aflOsLLv34NNVVnihLnjaW4
	np6dF9Jiq67tj3daoyzwPG3r5xfyr3iwywkO6Vr8HfKOuY9cOtUqg/gj/Bz2eRgvhuuY6N9onHC
	Z9fX1kuer57m2l+Sbg8JQZvrH7U+IMZp2Otm3RRf7S+s8diJ/ZXPqD+htQ+A7O+ZITvpJjI4B8f
	cPHPcMaWxGJoyJOnERhZeEGBPzCTC0gNN48gmAEzOHYPrl57z+mjQrtrIKkQjfAG4HRWtbS575S
	v5XOhf6b3LEN6LUOYBXYegth9H4HQD/zjouqQSZ1IxUf8/SiYt1TvfCikjLjwLLkbn
X-Received: by 2002:a05:6102:2ac9:b0:631:2f82:c3ce with SMTP id ada2fe7eead31-6738ef704d9mr750553137.10.1779350002358;
        Thu, 21 May 2026 00:53:22 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-63cea473caasm11619589137.12.2026.05.21.00.53.21
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 00:53:21 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-57513733658so1961893e0c.3
        for <arm-scmi@vger.kernel.org>; Thu, 21 May 2026 00:53:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9ATSGsPju5A1/RaN/a/dGrjaK1EKOm4zQXqz94RDbuz8nGybMTOqAONkqubPKXr+GdHxdMD4jPTw==@vger.kernel.org
X-Received: by 2002:a05:6122:235:b0:575:a5b5:3233 with SMTP id
 71dfb90a1353d-58424155ad5mr536200e0c.4.1779350001458; Thu, 21 May 2026
 00:53:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
 <aekXUvIPb8nkhdKu@pluto> <CAMuHMdWJvMH+a1RqozbaCxxH_8M569JcruTFa8PW+87FysnjHw@mail.gmail.com>
 <ae6Zp54NhKlVes8J@pluto> <CAMuHMdWK3Noh5ZQVWT9C0EKyXZePMaJ97C0A_syK+xCb_=abeQ@mail.gmail.com>
 <agooKghZJw3iElvp@pluto>
In-Reply-To: <agooKghZJw3iElvp@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 May 2026 09:53:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU8VRCOZtLrM2EoHFmhd5XFs8cwXc2A1tPTTr01KvUx0g@mail.gmail.com>
X-Gm-Features: AVHnY4LC2rjbQG8RkBy_xv_1xXXocYwPF3Jc-uBUk0RJlVpVup9HQXGw37O9RpM
Message-ID: <CAMuHMdU8VRCOZtLrM2EoHFmhd5XFs8cwXc2A1tPTTr01KvUx0g@mail.gmail.com>
Subject: Re: [PATCH/RFC 05/14] firmware: arm_scmi: Add scmi_get_base_info()
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cristian,

On Sun, 17 May 2026 at 22:42, Cristian Marussi <cristian.marussi@arm.com> wrote:
> On Fri, May 08, 2026 at 12:26:19PM +0200, Geert Uytterhoeven wrote:
> > On Mon, 27 Apr 2026 at 01:03, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > On Fri, Apr 24, 2026 at 02:08:55PM +0200, Geert Uytterhoeven wrote:
> > > > On Wed, 22 Apr 2026 at 20:45, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > > > Also because this should be one of the selling point of the SCMI stack
> > > > > in a virtualized environment: you can ship the same kernel drivers with
> > > > > the same DT and you know that ID=<N> will always identify the specific
> > > > > resource that is needed by your driver without worrying about the fact
> > > > > that in reality in the backstage the effectively managed physical resource
> > > > > could be different across different platforms, because that does not matter
> > > >
> > > > This sounds strange to me, do I understand it correctly?
> > > > So the ID should (1) be tied to the use-case, and not to the underlying
> > > > hardware, and (2) be the same for different platforms?
> > > >
> > > > For (1): Then we must not put these IDs in DT at all, as DT is supposed
> > > >     to describe the hardware (and firmware IDs in DT were IMHO already
> > > >     a stretch before).
> > > > For (2): How can there be a contiguous list of IDs, as not all platforms
> > > >     may have the same underlying hardware?
> > >
> > > I would NOT say that an SCMI FW must behave like this regarding IDs, but it
> > > is a possible SCMI deployed setup that can be useful in virtualized setups
> > >
> > > I mean, the DT describes the hardware of course BUT when you refer to
> > > some of this hardware DT bits from some other subsystem by referencing a
> > > phandle, even in the non-SCMI world, you are in fact selecting a specific
> > > resource that fit you use case, right ? Can we say this ?
> > > I mean you needed that specific clock or regulator that you described
> > > previously so as to be able to enable some other piece of HW...
> > >
> > > Now, the SCMI provides an abstraction on top of this, since you really
> > > discover domain IDs of a specific class (clocks/regulators etc) you are
> > > in fact describing an HW abstraction that you then refer with the usual
> > > phandle...also because there is NOT so much SCMI hardware to describe,
> > > given that the HW is handled transparently (opaquely really :P) by the
> > > driver on the FW side...
> > >
> > > ...you basically obtain such domain ID, usable as phandles through dynamic
> > > SCMI enumeration so that you can use it all over your DT to make use of such
> > > resources...
> > >
> > > ...on top of this, consider that the SCMI server CAN provide to its agents
> > > a per-agent-view of the world, IOW it can (and should) expose to a specific
> > > agent ONLY the resources needed by that agent, i.e. it can expose the set
> > > of resources 1-N to two distinct agents and that does NOT mean that the
> > > underlying physical resource mapped by ID=3 in both agents has to be
> > > effectively the same piece of hardware: it could be the case, and this
> > > would be useful to exposed and managed properly a shared resource, or
> > > it could also be that the same ID=3 could refer to completely distinct
> > > pieces of the same class of hardware...(same protocol same class of
> > > resource...)
> >
> > Exposing only the clocks/reset/power domains the agent can use,
> > in a contiguous list of IDS, means that the number space changes,
> > depending on which resources are exposed.
>
> Yes, potentially, it depedns on how the HW/FW stack was designed I
> suppose...
>
> > Suppose you have a system where you want to assign a specific hardware
> > block in the SoC to the realtime CPU core instead of the application
> > CPU core running Linux.
>
> Ok, so this is definitely a considerable change.
>
> > That means all resources used by that block must no longer be exposed
> > to the Linux agent, and the corresponding IDs must be removed from
> > the ID space exposed to Linux.  As the ID space must be sequential
> > and contiguous, the IDs must be renumbered, impacting resources that
> > are exposed to Linux.  As these IDs are used in the SoC .dtsi, they
> > must be changed there, too, However, these IDs have become part of
> > the stable DT ABI, and thus cannot be changed.
>
> Well, you have to ship a final DTB blob that is crafted to describe the
> actual HW at the end, right ?
>
> I mean, in your example, it seems to me that you have changed considerably
> the HW surface by moving a clock (and its related resources) away from the
> reach of Linux as a whole, so should not be expected to have an updated
> DTB shipped ?

It is not necessary to ship an updated DTB.
The bootloader stack can just change the "status" properties of devices
nodes that are be taken away from Linux from "okay" to "reserved":

Devicetree Specification, Release v0.4, Table 2.4: Values for statu
property states:

    Value: "reserved"
    Description:
        Indicates that the device is operational, but should not be
        used. Typically this is used for devices that are controlled
        by another software component, such as platform firmware.

When all SCMI IDs change, too, much more work needs to be done.

The remap driver could also help here: it could scan for device nodes
that are marked "reserved", remove SCMI IDs used in these nodes from
its internal tables, and adjust all later (higher) IDs.

E.g. the existing drivers/clk/renesas/renesas-cpg-mssr.c already handles
(ignores) clocks used by reserved nodes.

> And I am NOT saying to do this by changing the base SoC dtsi, but via build
> time overrides and/or runtime overlays so as to derive from that same SoC
> base dtsi a properly reviewed final DTB that describes how the HW has actually
> changed, becasue beside the renumbering that you mention there will be
> also a bunch of HW pieces that were relying on that clock that now will
> have to be removed from the DTB if no more usable (or remapped to use a
> different, maybe non SCMI resource)
>
> I maybe too naive and not used to very complex DTBs, but why all of the
> above cannot be done along the lines of how is done as an example in
> JUNO [1], where some initial base dtsi was overriden by virtue of includes
> and overrides to properly describe the board at hand (r0/r1/r2), even going
> to the extreme, funny enough, to move from the old SCPI to SCMI.
>
> [1]: https://elixir.bootlin.com/linux/v7.0.8/source/arch/arm64/boot/dts/arm/juno-scmi.dts

As long as the IDs in arch/arm64/boot/dts/arm/juno-scmi.dtsi
match the actual SCMI implementation, that works...

> > This patch series fixes that issue, too, by describing the actual
> > hardware in DT, and doing the mapping to exposed SCMI features in the
> > kernel, based on which firmware version is running on the SCP.
>
> Which seems to me to go in the opposite direction to what SCMI expects:
> but I understand that we have to deal and cope with the existing already
> shipped FW, so my concern is not really around enabling this in particular,
> is much more the fact that we open the door and normalize this kind of
> design even with future, still to be developed, SCMI FWs.
>
> ...otherwise...have the spec changed/clarified to allow for such
> non-contiguos IDs...
>
> ...anyway let's hear Sudeep opinion on this general issue of contiguos
> remapped IDs and being able to peek into SCMI version from outside the
> SCMI world...

As long as the ID space becomes stable.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
