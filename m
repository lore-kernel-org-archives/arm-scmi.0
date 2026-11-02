Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793642108;
	b=ziQZmvm+vltMwX9OmWNOGj5fIow8KDGsllWPBq0pAY5T7M1UIKPUbMjPeDldJKrS1Uzo
	 2GK4cJYlpSImbKuCoPws/8OQ3ROwcFHFAA7MSmwNy4qz8BygHKVaOmy2ckK9CeE36WCbF
	 7/6R4wmG5KtzTx07QqCY5CuFCUGgwa6jobMupKw8KqId1YW9c7pwiqUdJeFPsZBWDJvOc
	 RDxSZ/yVSFJxNTL0DmURWWckTuAqYK7t6RvOCBfngaHqw0hBr1VN7d4pmMz8r691gwr4l
	 XhFWi/wy5t7QYRfS7gUhsJNe+3dY3+qn/lMEPfp3mu+SIpRPiqajO1INPU0Czwxfrsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793642108;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pQrWz1faFiddLliYKRPxrOHyvprHZLzoea8K55JlsvA=;
	b=j+ce8q83s2rSYZ2jD394q4tUSr+pbI1QDvTV3Foje9D9UeXkDiUqrRrG7Koqfco8IwyO
	 T0TAejxYiWB+F0XMEsoReD5wR1wpqzKWzSMr33a3pp6dJaNTs5g3Je+VTBIIQndzEOfOV
	 p+CD4RybuXb07Tj2wrBAUJ+nwTrDA1uHtbrFNtCFhDGh7FLX5JvL/XHE2ppXYEna4cQuy
	 m1BIMe6YRRO7N4EcPPxm8uGb1esrElMCyYPP5xHFzT/Wz3G4vXiOf79UXI5a9j/virZK0
	 VJ2Uv7ZT4JjPZcKQueDYQVVQAyRzk/5vsU/XYqe5EQWDKs9/w2ErAJkwOt6PbK/dUDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IxwSX640;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F84606BA5C;
	Mon,  2 Nov 2026 17:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IxwSX640
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A95311F00A18;
	Mon,  2 Nov 2026 17:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793642107;
	bh=pQrWz1faFiddLliYKRPxrOHyvprHZLzoea8K55JlsvA=;
	h=From:To:Cc:Subject:Date;
	b=IxwSX6408H/Hh9XMwSjSUDTsMmbsJ8td4vzSrd2svDG55I6Mhggzo+nAaFy2AhBPR
	 DTDTsoIxwQxSY0v6WyVxTHLIFOypG2Zjo4Dy5PswE1m5HIakzrvXie1gsPy+kvBh7s
	 iR53zpuyPRXamc5TS8QHBgyjBt89PvLSCaHP8KDAGEjRvsmnX1y+NWgxxytLeCKTcn
	 tSbwT6ykzso3UD1GwObfo9M+VawWPgxBGLNMsbZXEjvSxEIdSmLlB7ooUGLfxGzbLj
	 z1S+9YJO5sSdopvAtSPryEHHZJKc7+CHc+jVvpn6wiYn8hthkeT3eq75X2UWEBwyUH
	 btXnDw99SN8lg==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: SoC Team <soc@lists.linux.dev>,
	arm-scmi@vger.kernel.org,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [GIT PULL] firmware: arm: Fixes for v7.4
Date: Mon,  2 Nov 2026 17:54:39 +0000
Message-ID: <20261102175440.1063545-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

I have included one dts file fix in this, hope that is OK. Let me know
if you prefer to keep DTS separate even for fixes.

Regards,
Sudeep

-->8
The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/arm-fw-fixes-7.4

for you to fetch changes up to 09fd63fe687ffa2d6594cd31d6fcf5fa7740a63c:

  Merge branches 'for-next/smccc/fixes', 'for-next/scmi/fixes', 'for-next/ffa/fixes' and 'for-next/juno/fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux (2026-11-02 11:33:33 +0000)

----------------------------------------------------------------
Arm Firmware Interfaces(SCMI/FF-A/SMCCC) fixes for v7.4

SCMI fixes correct protocol-device creation and request tracking in raw
mode, allow the generic and i.MX pinctrl drivers to share the standard
SCMI pinctrl device, and avoid creating unused performance-domain
devices that block cpufreq consumers through fw_devlink ownership. It
also includes dropping now unnecessary ACPI config guards and several
robustness fixes: bound i.MX MISC syslog and control responses,
unregister notification callbacks on event-enable failure, and free
mailbox state when shared-memory mapping fails.

The FF-A notifier fix distinguishes notification IDs within a hash
bucket, preventing callback registration and delivery from using a
colliding ID.

SMCCC and GICv3 fixes restore builds on 32-bit ARM when SMCCC discovery
is unavailable, while restricting the discovery dependency to arm64
where the NVIDIA erratum workaround applies.

Finally, correct the Corstone1000-A320 GIC redistributor region size
for its GICv4 configuration.

----------------------------------------------------------------
David Cemin (1):
      firmware: arm_ffa: Compare notify_id when looking up notifier callbacks

Geert Uytterhoeven (2):
      firmware: arm_scmi: Update ARM_SCMI_HAVE_TRANSPORT rationale
      firmware: arm_scmi: Fix grammar s/thing/things/

Julian Braha (2):
      firmware: smccc: Provide stubs for HAVE_ARM_SMCCC_DISCOVERY=n
      irqchip/gic-v3: Select HAVE_ARM_SMCCC_DISCOVERY only on arm64

Rob Herring (Arm) (1):
      arm64: dts: arm: corstone1000-a320: Fix GIC redistributor region size

Sudeep Holla (10):
      firmware: arm_scmi: Avoid protocol devices in exclusive raw mode
      firmware: arm_scmi: Skip requests for standard protocol devices
      pinctrl: imx: Match the standard SCMI pinctrl device
      firmware: arm_scmi: Skip unused performance-domain devices
      firmware: arm_scmi: Drop redundant ACPI configuration guard
      firmware: arm_scmi: imx: Track copied syslog words
      firmware: arm_scmi: imx: Validate MISC control response size
      firmware: arm_scmi: Unregister notifier on enable failure
      firmware: arm_scmi: Free mailbox state on mapping failure
      Merge branches 'for-next/smccc/fixes', 'for-next/scmi/fixes', 'for-next/ffa/fixes' and 'for-next/juno/fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux

 arch/arm64/boot/dts/arm/corstone1000-a320.dtsi     |   2 +-
 drivers/firmware/arm_ffa/driver.c                  |  11 ++-
 drivers/firmware/arm_scmi/Kconfig                  |   2 +-
 drivers/firmware/arm_scmi/bus.c                    | 110 ++++++++++++---------
 drivers/firmware/arm_scmi/driver.c                 |   4 -
 drivers/firmware/arm_scmi/notify.c                 |   4 +-
 drivers/firmware/arm_scmi/transports/Kconfig       |   2 +-
 drivers/firmware/arm_scmi/transports/mailbox.c     |   7 +-
 .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    |  18 +++-
 drivers/irqchip/Kconfig                            |   2 +-
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c       |   2 +-
 include/linux/arm-smccc.h                          |   7 ++
 include/linux/firmware/imx/sm.h                    |   6 ++
 13 files changed, 113 insertions(+), 64 deletions(-)
