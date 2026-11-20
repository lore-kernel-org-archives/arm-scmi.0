Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795184208;
	b=q5nFDcxXIMKbS3wyLLd17GBgAp4qeF7dDibbuqeDO6pwpw55jW0QPc8j1K99n8eP9D+a
	 cnm2yWgjVWeStPhu60/+jhCXY/kGoHLe4lcPMNLXDAIpZ+hTkxqpUie1dGLE1igv4rvRN
	 8etwx9Bkgy5sbHJa7uWurXS4NnhVuaK4QWy4r8T3WhrWNqCby7Oezim8Nhry98dbMtUNZ
	 3tavFMwcc+rMygF1irHqHnOAYjClcczsoWIKqDyjxIqoJsDi4xLICykm4rZ0jZOFZCGJh
	 N9I/tUjhKWMQPeuXuYBoFjI/mLwADNiKjYN/V9PLkw04SvM/S1n80Jvsen+RjHXLocA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795184208;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=U/1LQptGCCkV63Too82uQzQ9rERQJ0sbNJbOvd1Cdwg=;
	b=caoBxoO7qLe1jejw7TP7cz7xCcOl4U15n96JirnY9+zWbZYnLe0QxCv0UVCGSiRc3A/g
	 iWNpxQtPlF+t0yxoVV+XDVjd7Rs9Vso7sAN59mjxD5qOF6d3EQRNKhrqRnlquimrIklKb
	 7pMiY2yZTcl/Nzf0ZdNsufsl1epwhzajUsbw5rKynHrB4SmSJnuRTT99IAmiVW9vKR5OH
	 HQc9RuiOXjZXIpm18WZNi+wlcgxevu4MquxVpm5ZfMHky8clZvy5/RcxzTroMhHEFHpYm
	 rJsj4mVgFj2bx9wBvK2tSgBC0HEYBkhpkUTTACLOt+ROln28k7neLC1+1i17+NpQG6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cjYWCtUM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60252606A320;
	Fri, 20 Nov 2026 14:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cjYWCtUM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 472551F000C0;
	Fri, 20 Nov 2026 14:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795184207;
	bh=U/1LQptGCCkV63Too82uQzQ9rERQJ0sbNJbOvd1Cdwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cjYWCtUM6lKJvt1CQXbKgezqEJzlzoasNOuzQboEOmFpMGIwoX0FdUQnLqQSvoTEX
	 HYfMyzvYVI2Cdcd6a16auZ+9rzIRTz7uyKJvZlmJ/7WUYowzsWNo93/QSVYTnFB1J1
	 de7U/NH40PEhMC+G3be8XgIHiyUBnmoTxQc/8JSMEBNCqKrT66/NWqGdPdwjxklVKr
	 gJW2As1U5v62ksjr1FKbxqCgI/M5tY+8cQsJ2neckjnSAcQ69NX8IWZz5aY1mXyxvh
	 X1JSoY2QsWyzxmYeX0gi3rqIBO1R2HVGEz9btWL6bVFOLU/5v03YJ6iJWZkHwz7RNm
	 hI+HFx232+iOg==
Date: Fri, 20 Nov 2026 14:16:44 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Han Gao <rabenda.cn@gmail.com>, gaohan@iscas.ac.cn,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Drop the ARM architecture dependency
Message-ID: <20261120-gorgeous-poetic-hummingbird-628d5d@sudeepholla>
References: <CAMuHMdUov1u3kXzBX3ZM8rRkBdLq_M8LwQ2VtxSEOH9w68Rr2g@mail.gmail.com>
 <20261120084335.3492524-1-rabenda.cn@gmail.com>
 <CAMuHMdUrCkbjJW3Ld1nFbfj_Dfa4YwhUoK5g7rAn89yz=bYy4g@mail.gmail.com>
 <90f6f5f1-ac62-4dd0-828d-d16fc9dc773d@amd.com>
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90f6f5f1-ac62-4dd0-828d-d16fc9dc773d@amd.com>

On Fri, Nov 20, 2026 at 01:37:13PM +0100, Michal Simek wrote:
> 
> 
> On 11/20/26 09:51, Geert Uytterhoeven wrote:
> > Hi Han,
> > 
> > On Fri, 20 Nov 2026 at 09:43, Han Gao <rabenda.cn@gmail.com> wrote:
> > > On Fri, 20 Nov 2026 09:26:47 +0100 Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Fri, 6 Nov 2026 at 20:40, Han Gao via B4 Relay
> > > > <devnull+gaohan.iscas.ac.cn@kernel.org> wrote:
> > > > > From: Han Gao <gaohan@iscas.ac.cn>
> > > > > 
> > > > > The SCMI core and the mailbox and shared memory transports only use
> > > > > generic kernel interfaces. Transports that need architecture support,
> > > > > such as SMC, already carry their own dependencies.
> > > > > 
> > > > > Drop the ARM and ARM64 dependency so that other architectures can use
> > > > > SCMI. Depend on HAS_IOMEM instead, for devm_ioremap().
> > > > > 
> > > > > Suggested-by: Michal Simek <michal.simek@amd.com>
> > > > > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > > > 
> > > > Thanks for your patch, which is now commit fe87ede443a15969 ("firmware:
> > > > arm: scmi: Drop the ARM architecture dependency") in scmi/for-linux-next.
> > > > 
> > > > > ---
> > > > > This was patch 1 of the Zhihe A210 SoC series [1]. As Michal asked, it
> > > > > now goes on its own through the SCMI tree.
> > > > > 
> > > > > Since [1], it depends on HAS_IOMEM: Sashiko found that UML, which has
> > > > > no HAS_IOMEM, failed to link devm_ioremap().
> > > > > 
> > > > > Build tested on x86_64 without OF, i386, loongarch64, ppc64le, riscv64
> > > > > and arm64. On UML, SCMI can no longer be selected.
> > > > > 
> > > > > [1] https://patch.msgid.link/20261103-a210-scmi-v3-0-ee6b31580808@iscas.ac.cn
> > > > 
> > > > > --- a/drivers/firmware/arm_scmi/Kconfig
> > > > > +++ b/drivers/firmware/arm_scmi/Kconfig
> > > > > @@ -3,7 +3,7 @@ menu "ARM System Control and Management Interface Protocol"
> > > > > 
> > > > >   config ARM_SCMI_PROTOCOL
> > > > >          tristate "ARM System Control and Management Interface (SCMI) Message Protocol"
> > > > > -       depends on ARM || ARM64 || COMPILE_TEST
> > > > > +       depends on HAS_IOMEM || COMPILE_TEST
> > > > 
> > > > Please extend the dependencies to RISCV (from the link above, I assume
> > > > you are targeting riscv?) instead.  There is no point in showing this
> > > > option on architectures that have no users of SCMI; one already has
> > > > too many relevant symbols to configure.
> > > > People who want to build test on x86_64 without OF, i386, loongarch64,
> > > > ppc64le, ... can just enable COMPILE_TEST.
> > > 
> > > Following Michal's suggestion[1], I'm dropping ARM/ARM64.
> > > 
> > > [1] https://lore.kernel.org/all/3d38c4a5-1a12-4af1-ac2e-413a457ce4c5@amd.com/
> > 
> > Yes, I read that.
> > 
> > For reference, other firmware interfaces are also not exposed to the
> > whole world:
> > 
> > $ git grep -w ARCH_SUPPORTS_ACPI
> > arch/arm64/Kconfig:     select ARCH_SUPPORTS_ACPI
> > arch/loongarch/Kconfig: select ARCH_SUPPORTS_ACPI
> > arch/riscv/Kconfig:     select ARCH_SUPPORTS_ACPI if 64BIT
> > arch/x86/Kconfig:       select ARCH_SUPPORTS_ACPI
> > drivers/acpi/Kconfig:config ARCH_SUPPORTS_ACPI
> > drivers/acpi/Kconfig:   depends on ARCH_SUPPORTS_ACPI
> > $ git grep -w "config EFI"
> > arch/arm/Kconfig:config EFI
> > arch/arm64/Kconfig:config EFI
> > arch/loongarch/Kconfig:config EFI
> > arch/riscv/Kconfig:config EFI
> > arch/x86/Kconfig:config EFI
> I can see it's usage with x86 too.
> Microblaze is another one which can also use it.
> 
> SCMI from my perspective should be open for any architecture that's why no
> restriction make sense.
> 

IIUC, Geert's concern is it now shows up asking the users to choose on all
other architecture. We should have to default off on all archs that don't
need it now and can enable it if needed. I agree and like that approach.

-- 
Regards,
Sudeep
