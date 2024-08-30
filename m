Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7A7B4A1D
	for <arm-scmi@vger.kernel.org>; Fri, 30 Aug 2024 13:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725026367; cv=none; b=Aop4q8whWKK9GbJVi07BfnLa6BDeQ46nrdIm0Zddco4mg0GDGhH7WrnESl7SE7vFK0fH9UNQZvZOLbWxgQ7sXVXl4bsY+mwL4hKcpoQHNaJCfPYJnulIK1BmkDXqESntYbJhn31H02gZ4su4H2ih5xo7lM19G39hhOTa5C1llmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725026367; c=relaxed/simple;
	bh=1z+QhFRIsmymKHfDeSNBBKeFqT8QMacO/Qc/KYoHPCM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eF+tXSA3ZqGXUjhILfd0X5oqGQL5kxVZ0ZR4i7zGUnGAATCgbR/GwEZ1SmKe2QXY8rZNpJ1OeY8ZUoY22OtucC7Xv4oY529M4PpulhatBBCrmokTlp94F0iRbjd702sOsgJGHsvUeAgKow7mGRfUYrooUArbsMB2zSltk0H3phU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7EE6F1063;
	Fri, 30 Aug 2024 06:59:51 -0700 (PDT)
Received: from usa.arm.com (e107155-lin.cambridge.arm.com [10.1.198.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 03F1F3F762;
	Fri, 30 Aug 2024 06:59:23 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	arm-scmi@vger.kernel.org,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v6.12
Date: Fri, 30 Aug 2024 14:59:16 +0100
Message-ID: <20240830135918.2383664-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull ! Please note the input and rtc subsystem changes here are
agreed by the maintainers to route via SoC tree.

Regards,
Sudeep

-->8

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-6.12

for you to fetch changes up to 3008598ef3b009252aaf2f5967df0b11d14258a6:

  rtc: support i.MX95 BBM RTC (2024-08-28 21:54:51 +0100)

----------------------------------------------------------------
Arm SCMI updates for v6.12

Few main features include:

1. SCMI transport as stand-alone drivers

    Currently the SCMI transport layer is being built embedded into in
    the core SCMI stack. Some of these transports, despite being currently
    part of the main SCMI module, are indeed also registered with different
    subsystems like optee or virtio, and actively probed also by those.
    This leads to a few awkward and convoluted tricks to properly handle
    such interactions at boot time in the SCMI stack.

    This change adds the new logic to the core SCMI stack so that each
    existing transport is transitioned to be a standi-alone driver. With
    that all the probe deferral and awkward retries between the SCMI
    core stack and the transports has been removed, since no more needed.

2. Support for obtaining transport descriptors from the devicetree

    SCMI platform firmwares might have different designs depending on
    the platform. Some of the transport descriptors rely on such design.
    E.g. the maximum receive channel timeout value might vary depending
    on the specific underlying hardware and firmware design choices.

    This change adds support for max-rx-timeout-ms property to describe
    the transport needs of a specific platform design. It will be extended
    in the future to obtain other such hardware/firmware dependent
    transport related descriptors.

3. NXP i.MX95 specific SCMI vendor protocol extensions

    SCMI specification allows vendor or platform-specific extensions to
    the interface. NXP i.MX95 System Manager(SM) that implements SCMI
    extends the interface to implement couple of vendor/platform specific
    protocol, namely:
    a. Battery Backed Module(BBM) Protocol

       This protocol is intended provide access to the battery-backed
       module. This contains persistent storage (GPR), an RTC, and the
       ON/OFF button. The protocol can also provide access to similar
       functions implemented via external board components.

    b. MISC Protocol for misc settings

        This includes controls that are misc settings/actions that must
	be exposed from the SM to agents. They are device specific and
	are usually define to access bit fields in various mix block
	control modules, IOMUX_GPR, and other GPR/CSR owned by the SM.

4. SCMI debug/tracking metrics

    Since SCMI involves interaction with the entity(software, firmware
    and/or hardware) providing services or features, it is quite useful
    to track certain metrics(for pure debugging purposes) like how many
    messages were sent or received, were there any failures, what kind
    of failures, ..etc. This feature adds support for the same via debugfs.

Apart from these main features, there are some miscellaneous updates, fixes
and cleanups.

----------------------------------------------------------------
Cristian Marussi (11):
      firmware: arm_scmi: Fix double free in OPTEE transport
      firmware: arm_scmi: Introduce packet handling helpers
      firmware: arm_scmi: Add support for standalone transport drivers
      firmware: arm_scmi: Make MBOX transport a standalone driver
      firmware: arm_scmi: Make SMC transport a standalone driver
      firmware: arm_scmi: Make OPTEE transport a standalone driver
      firmware: arm_scmi: Make VirtIO transport a standalone driver
      firmware: arm_scmi: Remove legacy transport-layer code
      firmware: arm_scmi: Update various protocols versions
      firmware: arm_scmi: Remove const from transport descriptors
      firmware: arm_scmi: Use max-rx-timeout-ms from devicetree

Etienne Carriere (1):
      firmware: arm_scmi: Fix voltage description in failure cases

Krzysztof Kozlowski (1):
      firmware: arm_scmi: Simplify with scoped for each OF child loop

Luke Parkin (5):
      firmware: arm_scmi: Remove superfluous handle_to_scmi_info
      firmware: arm_scmi: Add support for debug metrics at the interface
      firmware: arm_scmi: Track basic SCMI communication debug metrics
      firmware: arm_scmi: Create debugfs files for SCMI communication debug metrics
      firmware: arm_scmi: Add support to reset the debug metrics

Peng Fan (10):
      dt-bindings: firmware: arm,scmi: Add support for system power protocol
      firmware: arm_scmi: Introduce setup_shmem_iomap
      dt-bindings: firmware: arm,scmi: Introduce property max-rx-timeout-ms
      dt-bindings: firmware: Add i.MX95 SCMI Extension protocol
      firmware: arm_scmi: Add NXP i.MX95 SCMI documentation
      firmware: arm_scmi: Add initial support for i.MX BBM protocol
      firmware: arm_scmi: Add initial support for i.MX MISC protocol
      firmware: imx: Add i.MX95 MISC driver
      input: keyboard: support i.MX95 BBM module
      rtc: support i.MX95 BBM RTC

Sudeep Holla (3):
      firmware: arm_scmi: Fix trivial whitespace/coding style issues
      firmware: arm_scmi: Replace the use of of_node_put() to __free(device_node)
      firmware: arm_scmi: Replace comma with the semicolon

 .../devicetree/bindings/firmware/arm,scmi.yaml     |  20 +-
 .../bindings/firmware/nxp,imx95-scmi.yaml          |  43 +
 drivers/firmware/arm_scmi/Kconfig                  | 120 +--
 drivers/firmware/arm_scmi/Makefile                 |  14 +-
 drivers/firmware/arm_scmi/base.c                   |   6 +-
 drivers/firmware/arm_scmi/clock.c                  |   1 +
 drivers/firmware/arm_scmi/common.h                 | 208 +++--
 drivers/firmware/arm_scmi/driver.c                 | 241 +++---
 drivers/firmware/arm_scmi/msg.c                    |  32 +-
 drivers/firmware/arm_scmi/perf.c                   |   2 +-
 drivers/firmware/arm_scmi/pinctrl.c                |   1 +
 drivers/firmware/arm_scmi/power.c                  |   2 +-
 drivers/firmware/arm_scmi/reset.c                  |   2 +-
 drivers/firmware/arm_scmi/sensors.c                |   2 +-
 drivers/firmware/arm_scmi/shmem.c                  |  85 +-
 drivers/firmware/arm_scmi/system.c                 |   2 +-
 drivers/firmware/arm_scmi/transports/Kconfig       | 123 +++
 drivers/firmware/arm_scmi/transports/Makefile      |  16 +
 .../firmware/arm_scmi/{ => transports}/mailbox.c   |  84 +-
 drivers/firmware/arm_scmi/{ => transports}/optee.c | 131 ++-
 drivers/firmware/arm_scmi/{ => transports}/smc.c   |  62 +-
 .../firmware/arm_scmi/{ => transports}/virtio.c    | 103 +--
 drivers/firmware/arm_scmi/vendors/imx/Kconfig      |  25 +
 drivers/firmware/arm_scmi/vendors/imx/Makefile     |   3 +
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c | 383 +++++++++
 .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 318 ++++++++
 drivers/firmware/arm_scmi/vendors/imx/imx95.rst    | 886 +++++++++++++++++++++
 drivers/firmware/arm_scmi/voltage.c                |   6 +-
 drivers/firmware/imx/Kconfig                       |  11 +
 drivers/firmware/imx/Makefile                      |   1 +
 drivers/firmware/imx/sm-misc.c                     | 119 +++
 drivers/input/keyboard/Kconfig                     |  11 +
 drivers/input/keyboard/Makefile                    |   1 +
 drivers/input/keyboard/imx-sm-bbm-key.c            | 225 ++++++
 drivers/rtc/Kconfig                                |  11 +
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-imx-sm-bbm.c                       | 162 ++++
 include/linux/firmware/imx/sm.h                    |  34 +
 include/linux/scmi_imx_protocol.h                  |  59 ++
 39 files changed, 3054 insertions(+), 502 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
 create mode 100644 drivers/firmware/arm_scmi/transports/Kconfig
 create mode 100644 drivers/firmware/arm_scmi/transports/Makefile
 rename drivers/firmware/arm_scmi/{ => transports}/mailbox.c (85%)
 rename drivers/firmware/arm_scmi/{ => transports}/optee.c (89%)
 rename drivers/firmware/arm_scmi/{ => transports}/smc.c (86%)
 rename drivers/firmware/arm_scmi/{ => transports}/virtio.c (94%)
 create mode 100644 drivers/firmware/arm_scmi/vendors/imx/Kconfig
 create mode 100644 drivers/firmware/arm_scmi/vendors/imx/Makefile
 create mode 100644 drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c
 create mode 100644 drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
 create mode 100644 drivers/firmware/arm_scmi/vendors/imx/imx95.rst
 create mode 100644 drivers/firmware/imx/sm-misc.c
 create mode 100644 drivers/input/keyboard/imx-sm-bbm-key.c
 create mode 100644 drivers/rtc/rtc-imx-sm-bbm.c
 create mode 100644 include/linux/firmware/imx/sm.h
 create mode 100644 include/linux/scmi_imx_protocol.h
