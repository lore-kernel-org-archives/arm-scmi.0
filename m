Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164716;
	b=Tbn7yhsx9l8rNRuRE2ovhWdAc6Sz4maydkwEUIrg+a0zMC0Ulg+zz3L+caajPNo/AKay
	 Elluun1D/TPkTF6aoFCQOi4uAMXfS9nTIt9SDe99EnfFIjy0Drn1WFuePx4AWPLmKJZx5
	 E+QL9XWRAKVTxeXWjoRppxpJHhkJhZTijV8+l0TW4H11QjCprTBuFuVxyBnKRA8C1xFC2
	 i+cltviBGN3W31DF0OzS1w0Hvu8YlyBi++JcUCJsYDSENrt6pewFQweg8wcbgLnp2xA1e
	 V3wu07+wrrytP9R4/ogDJbFtpEUp+BvgVvp1c0G9W+acmctntpj8OIlP/apJDuMtOIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164716;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=O29ozXrRa1nWnNxSLjjwsMRtxZK+i1ptmKe8i27enGA=;
	b=wI8Tgnwt7wO+YbzGCaJZZyVXJXbdD5kUEwkYjcwye6XojSFdWqu1XQ9fkO/S9nE7lt2a
	 /Q377Kakkh1bKhaOo6kiUprd+L7cPyjoe9IjVAbr0pB/V2fPheR8SRF3iBX1F9xYvadVQ
	 h8YPOqEqm2FSMlICN/NSbgFNR6xhM19bUB7QWXPaV0J8ZAAljxtNhYIeCtrSltXxDVB/S
	 yAWdZ7J+Zx1aysvEXU6ewyLgRfvQBjnSlxiqcE7fXlwR6OtRniiRkmNzjPUBkmF6sdy7W
	 0bK6F0DKuxeb7pJXiSZ42ha7aQY2mlLAK9E79N+hgeoJh4kxY4UBBUs7mMNCQGpWyJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FFF606A326
	for <arm-scmi@vger.kernel.org>; Fri, 20 Nov 2026 08:51:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8FFF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5ec20398b05so544287e0c.1
        for <arm-scmi@vger.kernel.org>; Fri, 20 Nov 2026 00:51:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164715; x=1795769515;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O29ozXrRa1nWnNxSLjjwsMRtxZK+i1ptmKe8i27enGA=;
        b=an1yqAawbf79FmS8P7CGEbqZNziBQSnABmPFJeTlC9d/Os9k5k3Hj4rRYmkk5SkyYG
         cuXdaeG4dmaLjkevyOyqjukhLZ1eD49qvBhwNZEcTZ3sSgmEPTmgAlJl/Hat7mqisxDd
         l/bYYw+RfoxYuB3+RI7/PlJ9tCXwpLGEftsMkaXBnL134mD+k9/Pj7Gs00Vm6S814wRo
         l7+X17nbLPb9blN/6XAhHlftsnRAFICTD8fd25SzNJgIzrQYyMwrxkq16vRQHqau5WLa
         It8dHWkTpHO0WOm1hAs/g6MjrPov3hdKItJG1M74z4dyMohOOr0oXTnn2GI4vg99RX6z
         kR+Q==
X-Forwarded-Encrypted: i=1; AL+hErHzaXzkejMzWu4cZiv6TJ/hoeNocJ4/q/BfFZlNy/e5aDskTV6GzbXP9K8hpw35EtrzSPyucFB+CA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Do8Bf0qu1NdmyHiJe12qwY86/+82dXzu/BGgozPqLG/qLAAn3
	mMmFmSvoje/PiSbKsVPZiZWiOgT8u5oYoz4i8rOvaayF5xtWhX2nmPDQjU5YYsbL
X-Gm-Gg: AZFdTZeyx43SBrz+0XpjH1zKxFY5lEn5pBI4X/MLhaXzKpbfvbtzf+y3FM33ZM+tbmz
	jH7IzAaOQ+wNAP34pa+q0yXfdXnj0sSjRKuI5ZSnRallO2oZm9KJ46VMItTwuYahAYrJn29KrMX
	ZvKDtySGcAChZuFWkZ+NKBP/BpYKG/cqST5e/KU6WPJH4PxWJmTB4s/YDDjCK7/+jnto7RgdvRl
	4ON/5qRKykI/iV4pyYJqgP69I6B6rurwfyUYgLBm4bUOXfEKWUbjFhLID0DR/B2UIanI4ZvcJeO
	sUHLlpQWGX5pOQ+skwFolLKlb8z/q/csOJbHZN19d86dn0i6ED3SxT3snutx2tzu0kFExKNH3Nm
	by6+inzYTvATvHHUMyB42/CIq0RTGJqvKh+6v8bGUuJU8Da0y1iNfojZYwslENqifhdZbmrf+fn
	bbZeEun59bmnUMe0TGtBI64L3fb5psnH8+iOy3MH7z5k6xNreJxEraZBN60yUN3fpfVx7XikBI1
	M2Frz9BS2A/jhIP4VqOt5SpJc07j2DEVN+0DQCNbvDeBknZlWkwt4bNY+EoN505VlypIHPxv9La
	hehcdDBQwZQ+9tDLvEKAZ8xoYnuP5kylGPg2V1+7oH8w25HG3L53JmF/O+zknWRF+Qk=
X-Received: by 2002:a05:6122:3c41:b0:5e9:176f:a548 with SMTP id 71dfb90a1353d-5ee8ad10eedmr1371388e0c.0.1795164714794;
        Fri, 20 Nov 2026 00:51:54 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b5cd7c8sm1970957e0c.11.2026.11.20.00.51.54
        for <arm-scmi@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 00:51:54 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7cc53938a8fso506222137.2
        for <arm-scmi@vger.kernel.org>; Fri, 20 Nov 2026 00:51:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFKpjaENoorKw4ybcLThreckI+hQYnYMK+ufjXGIm3+FXTc74doHuy0EigBUWWN8RzEN23DH6PzgA==@vger.kernel.org
X-Received: by 2002:a05:6102:1a1a:b0:7d2:b348:6355 with SMTP id
 ada2fe7eead31-7d7395e01bbmr694434137.23.1795164714287; Fri, 20 Nov 2026
 00:51:54 -0800 (PST)
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAMuHMdUov1u3kXzBX3ZM8rRkBdLq_M8LwQ2VtxSEOH9w68Rr2g@mail.gmail.com>
 <20261120084335.3492524-1-rabenda.cn@gmail.com>
In-Reply-To: <20261120084335.3492524-1-rabenda.cn@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 09:51:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUrCkbjJW3Ld1nFbfj_Dfa4YwhUoK5g7rAn89yz=bYy4g@mail.gmail.com>
X-Gm-Features: Aa3M54r6LC9IQldUg86oiQcyOqnhN_8FdF1As7xILWU1aB_YhbizNGLY-xXfwEM
Message-ID: <CAMuHMdUrCkbjJW3Ld1nFbfj_Dfa4YwhUoK5g7rAn89yz=bYy4g@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: Drop the ARM architecture dependency
To: Han Gao <rabenda.cn@gmail.com>
Cc: gaohan@iscas.ac.cn, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Michal Simek <michal.simek@amd.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Han,

On Fri, 20 Nov 2026 at 09:43, Han Gao <rabenda.cn@gmail.com> wrote:
> On Fri, 20 Nov 2026 09:26:47 +0100 Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Fri, 6 Nov 2026 at 20:40, Han Gao via B4 Relay
> > <devnull+gaohan.iscas.ac.cn@kernel.org> wrote:
> > > From: Han Gao <gaohan@iscas.ac.cn>
> > >
> > > The SCMI core and the mailbox and shared memory transports only use
> > > generic kernel interfaces. Transports that need architecture support,
> > > such as SMC, already carry their own dependencies.
> > >
> > > Drop the ARM and ARM64 dependency so that other architectures can use
> > > SCMI. Depend on HAS_IOMEM instead, for devm_ioremap().
> > >
> > > Suggested-by: Michal Simek <michal.simek@amd.com>
> > > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> >
> > Thanks for your patch, which is now commit fe87ede443a15969 ("firmware:
> > arm: scmi: Drop the ARM architecture dependency") in scmi/for-linux-next.
> >
> > > ---
> > > This was patch 1 of the Zhihe A210 SoC series [1]. As Michal asked, it
> > > now goes on its own through the SCMI tree.
> > >
> > > Since [1], it depends on HAS_IOMEM: Sashiko found that UML, which has
> > > no HAS_IOMEM, failed to link devm_ioremap().
> > >
> > > Build tested on x86_64 without OF, i386, loongarch64, ppc64le, riscv64
> > > and arm64. On UML, SCMI can no longer be selected.
> > >
> > > [1] https://patch.msgid.link/20261103-a210-scmi-v3-0-ee6b31580808@iscas.ac.cn
> >
> > > --- a/drivers/firmware/arm_scmi/Kconfig
> > > +++ b/drivers/firmware/arm_scmi/Kconfig
> > > @@ -3,7 +3,7 @@ menu "ARM System Control and Management Interface Protocol"
> > >
> > >  config ARM_SCMI_PROTOCOL
> > >         tristate "ARM System Control and Management Interface (SCMI) Message Protocol"
> > > -       depends on ARM || ARM64 || COMPILE_TEST
> > > +       depends on HAS_IOMEM || COMPILE_TEST
> >
> > Please extend the dependencies to RISCV (from the link above, I assume
> > you are targeting riscv?) instead.  There is no point in showing this
> > option on architectures that have no users of SCMI; one already has
> > too many relevant symbols to configure.
> > People who want to build test on x86_64 without OF, i386, loongarch64,
> > ppc64le, ... can just enable COMPILE_TEST.
>
> Following Michal's suggestion[1], I'm dropping ARM/ARM64.
>
> [1] https://lore.kernel.org/all/3d38c4a5-1a12-4af1-ac2e-413a457ce4c5@amd.com/

Yes, I read that.

For reference, other firmware interfaces are also not exposed to the
whole world:

$ git grep -w ARCH_SUPPORTS_ACPI
arch/arm64/Kconfig:     select ARCH_SUPPORTS_ACPI
arch/loongarch/Kconfig: select ARCH_SUPPORTS_ACPI
arch/riscv/Kconfig:     select ARCH_SUPPORTS_ACPI if 64BIT
arch/x86/Kconfig:       select ARCH_SUPPORTS_ACPI
drivers/acpi/Kconfig:config ARCH_SUPPORTS_ACPI
drivers/acpi/Kconfig:   depends on ARCH_SUPPORTS_ACPI
$ git grep -w "config EFI"
arch/arm/Kconfig:config EFI
arch/arm64/Kconfig:config EFI
arch/loongarch/Kconfig:config EFI
arch/riscv/Kconfig:config EFI
arch/x86/Kconfig:config EFI

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
