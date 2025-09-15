Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7AAB2FB63E
	for <arm-scmi@vger.kernel.org>; Mon, 15 Sep 2025 10:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757931250; cv=none; b=KyCYBqAkn0Fc2SUcgrtxJawCWQw4WVzNpExz2Pscea/QLDQOvZ6icFMEylQ2B1BO77IiiqUO6TVHnVNVv7oTve5etE4qEXjC9GADjH51AWsJovyKkzg7Yn5QWU0qTdMV/05/qxJ3cZrJKI3XYhj6aA2JLlEQUJ2z85Q1DQ7NnLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757931250; c=relaxed/simple;
	bh=VcxSv94hNfGkwnA5TtUv7syWOk+2SuRpBucAEQyVuxg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=r3XWYRypDN32/oDzxcEoYth4YoE7aKCzapbi6hS1KFu71Uy/4jdetsd0hKGbO33JWBDmqVbTuskABVxNfN/34CLX5w90WP3qZobFaXiifBAo8stJR9CFj9cpnze0j2VWSDQWJkC2gDrrxsEpNVUgT+00m8acgw5xtrsGK9sibFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75A2112FC;
	Mon, 15 Sep 2025 03:13:59 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6A6383F66E;
	Mon, 15 Sep 2025 03:14:06 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	arm-scmi@vger.kernel.org,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v6.18
Date: Mon, 15 Sep 2025 11:13:41 +0100
Message-Id: <20250915101341.2987516-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-6.18

for you to fetch changes up to 2f86054cc1a6792f0812d5f23f271a83848edabb:

  firmware: arm_scmi: Simplify printks with pOF format (2025-09-12 11:32:21 +0100)

----------------------------------------------------------------
Arm SCMI updates/fixes for v6.18

These SCMI changes bring a mix of improvements, fixes, and cleanups:

1. Device Tree bindings - allow multiple SCMI instances by suffixing
   node names (Nikunj Kela).
2. Code hardening - constify both scmi_{transport,voltage_proto}_ops
   so they reside in read-only memory (Christophe JAILLET).
3. VirtIO transport initialization - set DRIVER_OK before SCMI probing
   to prevent potential stalls; while recent rework removes the practical
   risk, this ensures correctness (Junnan Wu).
4. Quirk handling - fix a critical bug by preventing writes to string
   constants, avoiding faults in read-only memory (Johan Hovold).
5. i.MX SCMI MISC protocol - extend support to discover board info,
   retrieve configuration and build data, and document the new
   MISC_BOARD_INFO command; all handled gracefully if unsupported (Peng Fan).
6. Logging cleanup - simplify device tree node name logging by using
   the %pOF format to print full paths (Krzysztof Kozlowski).

----------------------------------------------------------------
Christophe JAILLET (2):
      firmware: arm_scmi: Constify struct scmi_voltage_proto_ops
      firmware: arm_scmi: Constify struct scmi_transport_ops

Johan Hovold (1):
      firmware: arm_scmi: quirk: Prevent writes to string constants

Junnan Wu (1):
      firmware: arm_scmi: Mark VirtIO ready before registering scmi_virtio_driver

Krzysztof Kozlowski (1):
      firmware: arm_scmi: Simplify printks with pOF format

Nikunj Kela (1):
      dt-bindings: firmware: arm,scmi: Allow multiple instances

Peng Fan (5):
      firmware: arm_scmi: Fix function name typo in scmi_perf_proto_ops struct
      firmware: arm_scmi: imx: Add documentation for MISC_BOARD_INFO
      firmware: arm_scmi: imx: Discover MISC build info from the system manager
      firmware: arm_scmi: imx: Support retrieving MISC protocol configuration info
      firmware: arm_scmi: imx: Discover MISC board info from the system manager

 .../devicetree/bindings/firmware/arm,scmi.yaml     |   2 +-
 drivers/firmware/arm_scmi/bus.c                    |  13 ++-
 drivers/firmware/arm_scmi/quirks.c                 |  15 ++-
 drivers/firmware/arm_scmi/transports/mailbox.c     |   7 +-
 drivers/firmware/arm_scmi/transports/optee.c       |   2 +-
 drivers/firmware/arm_scmi/transports/virtio.c      |   3 +
 .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 111 +++++++++++++++++++++
 drivers/firmware/arm_scmi/vendors/imx/imx95.rst    |  25 +++++
 drivers/firmware/arm_scmi/voltage.c                |   2 +-
 include/linux/scmi_protocol.h                      |   2 +-
 10 files changed, 162 insertions(+), 20 deletions(-)
