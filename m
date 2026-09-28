Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE903909AE;
	Mon, 28 Sep 2026 06:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578277; cv=none; b=XHkIUScXzXKPlv+zvGYzSYFeJ/OHAhw9GTBZ6X9kxri5Dzxq3IW8CJMdv71R5+kAu4PzK5vsBKEKajhnbJwFPnSB6reocueVz58QqdbgecfSQ0IEDm3R9f30K4RWYdjVHGKgUsHnpqOKms+moiGL3+uXwlD7EkmS+rh5dCDE97k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578277; c=relaxed/simple;
	bh=7iMgxJ6dkciQz13RzBhjQN1l3MLtlY9dar1eA/dAYS0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=foQsyiqIbKVAzQCo7GK/DSCO29EW/p2UsCSWVzIS5H+ZB/dAeZXdWTD0B2yC9xKzAp8HXxysoxWOMV1jDHCRpvbYOoGUJsoMsndqjfEdvssKuJUseprwrJ1saDcRr7EjM11ZC2Y2a1r7pENsW9cDdsiKvCbq7aisSnDiMcRXISg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DLZ4eoPX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DLZ4eoPX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BBAD1F00893;
	Mon, 28 Sep 2026 06:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790578276;
	bh=zHG1TEVzidZB3jJv+mxUjAITxuE7BNdYUm0NY7yc8I8=;
	h=From:To:Cc:Subject:Date;
	b=DLZ4eoPXwN4hh2nj2PBY1DcnztaUGovFz2ht75A3YIDBI12I4OM98PZ5FyC1uCoYZ
	 w0yt8gloYIHQPMmjxJofGJJTwOJUT+X3+3k6VPutuGZS4KoIYmgIV2sM2pf3QBsahu
	 neoASyhbB8aF0P+JKR7BVSfIeFYU7zuXotb+WYJMi947CQFiYq6becB9095JB7MHx2
	 0ftks7G55lo/XqewNAsVqCwJDcwLnZ41oTWsfsltkjoNIl85b2hynTMlnB6Kt2xaOU
	 fpWYe7MFSfOEjgpuwNSFEpJPQx58khMs8YdgxkIcDxmFMRKWwISGVSUITY8pWOxg3+
	 r1gfAfOlSmA8A==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: SoC Team <soc@lists.linux.dev>,
	arm-scmi@vger.kernel.org,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v7.4
Date: Mon, 28 Sep 2026 07:51:11 +0100
Message-ID: <20260928065112.2492223-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
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
The following changes since commit 8544e0da1a04c77b98e2e313a423a5c72e48ea32:

  Merge branches 'for-next/ffa/fixes' and 'for-next/scmi/fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux (2026-09-08 21:04:42 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-7.4

for you to fetch changes up to aac4e67d6eb93118cfa70c6562b5f9c81a7042ef:

  firmware: arm_scmi: Always create devices for standard protocols (2026-09-24 09:10:43 +0100)

----------------------------------------------------------------
Arm SCMI updates for v7.4

Add an ACPI PCC transport for SCMI. The core now propagates firmware
nodes and supports protocol-specific channel lookup, while the new
transport parses and validates ACPI _DSD mappings for shared and
dedicated command and notification channels. ACPI protocol devices can
be initialized without device tree child nodes.

Enable SCMI protocol driver module autoloading by generating stable
SCMI module aliases and creating standard protocol devices before
their drivers register.

Fix delayed-response completion and raw transfer reuse races, and
release a raw transfer on an error path. Also consolidate reset domain
information queries and use string helpers in SCMI trace events.

----------------------------------------------------------------
Bjorn Andersson (1):
      firmware: arm_scmi: Add SCMI device table alias support

Cristian Marussi (1):
      include: trace: Use string helpers in msg_dump trace events

Geert Uytterhoeven (1):
      firmware: arm_scmi: Merge scmi_reset_proto_ops.name_get() and .latency_get()

Hans de Goede (1):
      firmware: arm_scmi: Always create devices for standard protocols

Roland Dreier (3):
      firmware: arm_scmi: Protect xfer->async_done with xfer->lock
      firmware: arm_scmi: Don't reuse raw xfers with async_done still armed
      firmware: arm_scmi: Fix error path leak in scmi_raw_message_send()

Sudeep Holla (9):
      firmware: arm_scmi: Set generated device fwnode with platform helpers
      firmware: arm_scmi: Extend transport driver macro to support ACPI
      firmware: arm_scmi: Convert OF-only paths to generic fwnode in SCMI core
      firmware: arm_scmi: Fall back to ACPI HID when "compatible" is absent
      firmware: arm_scmi: Pass protocol ID to transport chan_available()
      firmware: arm_scmi: Refactor protocol device creation logic
      firmware: arm_scmi: Add ACPI PCC transport
      firmware: arm_scmi: Initialise known ACPI protocol devices and channels
      firmware: arm_scmi: Validate PCC shared memory signature

 MAINTAINERS                                    |   1 +
 drivers/firmware/arm_scmi/bus.c                | 109 ++-
 drivers/firmware/arm_scmi/common.h             |  61 +-
 drivers/firmware/arm_scmi/driver.c             | 260 +++++---
 drivers/firmware/arm_scmi/protocols.h          |   9 +-
 drivers/firmware/arm_scmi/raw_mode.c           |  30 +-
 drivers/firmware/arm_scmi/reset.c              |  36 +-
 drivers/firmware/arm_scmi/transports/Kconfig   |  12 +
 drivers/firmware/arm_scmi/transports/Makefile  |   2 +
 drivers/firmware/arm_scmi/transports/mailbox.c |   7 +-
 drivers/firmware/arm_scmi/transports/optee.c   |   7 +-
 drivers/firmware/arm_scmi/transports/pcc.c     | 875 +++++++++++++++++++++++++
 drivers/firmware/arm_scmi/transports/smc.c     |  10 +-
 drivers/firmware/arm_scmi/transports/virtio.c  |   3 +-
 include/linux/device-id/scmi.h                 |  17 +
 include/linux/scmi_protocol.h                  |  20 +-
 include/trace/events/scmi.h                    |   8 +-
 scripts/mod/devicetable-offsets.c              |   5 +
 scripts/mod/file2alias.c                       |  12 +
 19 files changed, 1300 insertions(+), 184 deletions(-)
 create mode 100644 drivers/firmware/arm_scmi/transports/pcc.c
 create mode 100644 include/linux/device-id/scmi.h
