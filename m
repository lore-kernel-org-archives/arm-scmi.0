Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4E6288CAC
	for <arm-scmi@vger.kernel.org>; Wed,  7 May 2025 13:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746625641; cv=none; b=rheQ88R57y//8UA/IiHseG+QF9C2iqb94he9XOeJsM7iuv+me5X/mVwH2IiBS4I01sAPKKpe/h9611zDz+khIoc491xtM92pLK7duEJ+YuJc0mC/HFKswD8bULS2m75bMeOtN0tbnR+8+KerG0fCwuXr08X65URgeuTD0swyeGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746625641; c=relaxed/simple;
	bh=BvTKUmqfasOGTvCTWXbsN5B6frEC7Jsv/NsiqAr61jk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=TvbKnuBu+QxB4LpKqzLV5l6i60fDkkoK7WvQPZBLX6LvU/YNurRzlFkCyIko/ZsplMxjsuTXS46beBYYV4O69XckDpO+xYzWgICKPu42mdr8D6kbZoSB5zUPLHyhE/IQ7RS3Xyzj2P6fj8npepKOeOlvFh0iSF4KOeGD17Adiwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4B43339;
	Wed,  7 May 2025 06:47:08 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B1A973F58B;
	Wed,  7 May 2025 06:47:17 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v6.16
Date: Wed,  7 May 2025 14:47:13 +0100
Message-Id: <20250507134713.49039-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-6.16

for you to fetch changes up to 397f802d06c418efa636e46083edbeb00c91369e:

  firmware: arm_scmi: quirk: Force perf level get fastchannel (2025-05-06 11:12:30 +0100)

----------------------------------------------------------------
Arm SCMI updates for v6.16

1. Quirk framework to handle buggy firmware

   With SCMI gaining broader adoption across arm64 platforms, it's
   increasingly important to address how we consistently manage out-of-spec
   SCMI firmware already deployed in the field. This change introduces a
   lightweight quirk framework built around static_keys, enabling developers to:
    - Define quirks and their match criteria, which can include:
       o A list of compatibles ({ comp, comp2, NULL })
       o Vendor ID / Sub-Vendor ID
       o Firmware implementation version ranges ([Min_Vers, Max_Vers])

   Matching proceeds from the most specific (longest match) to the least
   specific. NULL entries are treated as wildcards (i.e., match any value).
   This flexibility allows matching very specific combinations or just a
   general compatible string.

   The quirk code blocks/snippets implementing the workaround are placed near
   their intended usage and guarded by a static_key that's tied to the quirk.
   Once the SCMI core stack is initialized and retrieves platform info via the
   base protocol, any matching quirks will have their associated static_keys
   enabled.

2. Quirk for Qualcomm X1E platforms

   On some Qualcomm X1E platforms, such as the Lenovo ThinkPad T14s, the
   SCMI firmware fails to set the FastChannel support bit for PERF_LEVEL_GET,
   yet it crashes when the driver attempts to fall back to standard messaging
   which is clearly out-of-spec behavior.

   To work around this, the new SCMI quirk framework is used to
   unconditionally enable FC initialization for this firmware version.

   In the future, once the fixed firmware version is identified, an upper
   version bound can be added to the quirk match criteria. Alternatively,
   matching can be further restricted using a SoC-specific compatible string
   if always enabling FC proves problematic elsewhere.

3. Support for NXP i.MX LMM/CPU vendor protocol extensions

   The i.MX95 System Manager (SM) implements Logical Machine Management (LMM)
   and a CPU protocol to manage Logical Machines (LM) and CPUs (e.g., M7).

   These changes integrate the vendor-specific protocol extensions
   implementing the LMM and CPU protocols for the i.MX95, facilitating
   standardized communication between the operating system and the platform's
   firmware, which will be used by remoteproc drivers. The changes also
   include the necessary device tree bindings.

4. Miscellaneous cleanups/changes

   These mainly include polling support in SCMI raw mode. The cleanups
   centralize error logging for SCMI device creation into a single helper
   function, consolidate the device matching logic into a single function, and
   ensure that devices must have a name for registration—removing support for
   unnamed devices when matching drivers and devices for probing. Transport
   devices are now excluded from bus matching, and the correct assignment of
   the parent device for the arm-scmi platform device is ensured in the
   transport drivers.

----------------------------------------------------------------
Cristian Marussi (3):
      firmware: arm_scmi: Add polling support to raw mode
      firmware: arm_scmi: Add common framework to handle firmware quirks
      firmware: arm_scmi: quirk: Fix CLOCK_DESCRIBE_RATES triplet

Johan Hovold (1):
      firmware: arm_scmi: quirk: Force perf level get fastchannel

Peng Fan (7):
      firmware: arm_scmi: imx: Add LMM and CPU documentation
      dt-bindings: firmware: Add i.MX95 SCMI LMM and CPU protocol
      firmware: arm_scmi: imx: Add i.MX95 LMM protocol
      firmware: arm_scmi: imx: Add i.MX95 CPU Protocol
      firmware: imx: Add i.MX95 SCMI LMM driver
      firmware: imx: Add i.MX95 SCMI CPU driver
      MAINTAINERS: add entry for i.MX SCMI extensions

Sibi Sankar (1):
      firmware: arm_scmi: Ensure that the message-id supports fastchannel

Sudeep Holla (5):
      firmware: arm_scmi: Ensure scmi_devices are always matched by name as well
      firmware: arm_scmi: Refactor device matching logic to eliminate duplication
      firmware: arm_scmi: Refactor error logging from SCMI device creation to single helper
      firmware: arm_scmi: Assign correct parent to arm-scmi platform device
      firmware: arm_scmi: Exclude transport devices from bus matching

 Documentation/ABI/testing/debugfs-scmi-raw         |  91 +++
 .../bindings/firmware/nxp,imx95-scmi.yaml          |  23 +
 MAINTAINERS                                        |   9 +
 drivers/firmware/arm_scmi/Kconfig                  |  13 +
 drivers/firmware/arm_scmi/Makefile                 |   1 +
 drivers/firmware/arm_scmi/bus.c                    |  79 +-
 drivers/firmware/arm_scmi/clock.c                  |  33 +-
 drivers/firmware/arm_scmi/common.h                 |   1 +
 drivers/firmware/arm_scmi/driver.c                 | 119 +--
 drivers/firmware/arm_scmi/protocols.h              |   2 +
 drivers/firmware/arm_scmi/quirks.c                 | 322 ++++++++
 drivers/firmware/arm_scmi/quirks.h                 |  52 ++
 drivers/firmware/arm_scmi/raw_mode.c               |  72 +-
 drivers/firmware/arm_scmi/vendors/imx/Kconfig      |  24 +
 drivers/firmware/arm_scmi/vendors/imx/Makefile     |   2 +
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c | 276 +++++++
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c | 263 +++++++
 drivers/firmware/arm_scmi/vendors/imx/imx95.rst    | 828 +++++++++++++++++++++
 drivers/firmware/imx/Kconfig                       |  22 +
 drivers/firmware/imx/Makefile                      |   2 +
 drivers/firmware/imx/sm-cpu.c                      |  85 +++
 drivers/firmware/imx/sm-lmm.c                      |  91 +++
 include/linux/firmware/imx/sm.h                    |  19 +
 include/linux/scmi_imx_protocol.h                  |  42 ++
 24 files changed, 2371 insertions(+), 100 deletions(-)
 create mode 100644 drivers/firmware/arm_scmi/quirks.c
 create mode 100644 drivers/firmware/arm_scmi/quirks.h
 create mode 100644 drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c
 create mode 100644 drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c
 create mode 100644 drivers/firmware/imx/sm-cpu.c
 create mode 100644 drivers/firmware/imx/sm-lmm.c
