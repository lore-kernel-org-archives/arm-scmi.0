Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F6B43847E
	for <arm-scmi@vger.kernel.org>; Tue, 15 Sep 2026 17:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491899; cv=none; b=JqLXw4KdaLWlwcdelHupDm06CTBYUV2YjuJcN8B9EmY/3kpLbWtcVS/VePBnHEJoK4rlH4UV5+zE8PSJLzTjtlGNt8XV187CXBI3ZkQTHPtcX12YkWqyg9o850KM4UJuIo1eXmVrsCNN1qru6kuiI5NoV8BHqt2zvYYJlbfwzjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491899; c=relaxed/simple;
	bh=QYIeOGn4V5fAObnU2C48Pr7ykdVdsqNdbXN7BtAsoCY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XrKEdN3EQJQBs4U1vo55igly+4bB31ERVVZzF8YD8Tk6L+dzURwNw0Nr6phIduYqVz4fNqRtpP5hUH1iHZBluq0apXs0oR6x3R1L/mQwSBoCPuG3qtEdrlyeX1hT8gyFscaJpjRcXyFUsntbGwtAfbpg6X8gyZpwuH1x53alK3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jC78083J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jC78083J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A91A61F000FF;
	Tue, 15 Sep 2026 17:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789491897;
	bh=vzySHiK+DOIKj3zoEuMDGw3cMzMksj32kFZ9rIaJ9Lg=;
	h=From:Subject:Date:To:Cc;
	b=jC78083JfTiDA9HMlSod0cysQx4QGtXe3hWhixEqO0szOfQiwD0PpQv+t4ik/BCRx
	 EnD0vNTdOmvM5uzbQGGaJ6FTbHzRNPxMORlyWwxGoGG9j0awGE6W/sdk+NW/A/2BBh
	 rG5memu9KeqpJ5JkGjliTXP9v6Im6K8CxNeM/qEafGAd9fpIk/bvB1BiiXA7sqzWeC
	 9qI9M5AbeRoKvL59FZg8KbrJDCz9BFbXEzuncdZXTt+/vHT1EZ5m8ZZjvI5UZtw4cf
	 /f0LzTt9riKAy+hWEuaKgTAKrRqLA5BtHgk1C0QoTwDey4/TNuZyv6/xlUIYZq1cAt
	 jbi+XY4qKxbcg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v5 0/9] firmware: arm_scmi: Refactoring and enablement of
 ACPI PCC transport
Date: Tue, 15 Sep 2026 18:03:34 +0100
Message-Id: <20260915-acpi_scmi_pcc-v5-0-298579e9f359@kernel.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGp6qWoC/3XM22oCMRSF4VeRXDeyk51kEq98jyKSw1ZDOweSM
 lhk3r3RUsSBXq4F339jlUqmynabGys055rHoQ39tmHx4ocz8ZzaZhKkFiA67uOUjzX2+TjFyEk
 pEhKRPCFrZip0ytdH7/3Q9iXXr7F8P/KzuL//lWbBgYNPwYeuA5fc3pd+G8ee3Tuz/LMGtNRrK
 5tVJ7QObQKb7KvFp7UC1xabjcEEa4OiEHD/QWWgz+1Yzr9cPbkDteaqcUOBXKe1AUMvfFmWHzN
 fO9ZiAQAA
X-Change-ID: 20251017-acpi_scmi_pcc-e44e1233eae3
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-team@meta.com
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Breno Leitao <leitao@debian.org>, 
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
X-Mailer: b4 0.16.0

The SCMI can be utilized in systems using either the FDT or ACPI specification.
While FDT-based systems can natively use SCMI, ACPI-based systems often
need to abstract the functionality provided by SCMI under ASL methods.
So far, there has been no need to support SCMI natively on ACPI systems.

However, with the addition of a few new protocols such as Powercap and Telemetry,
which lack abstractions in the ACPI specification, there is now a need to
run SCMI natively for those use cases. ACPI for System Control and Management
Interface document[1] provides a mechanism which allows ACPI-based systems to
discover whether a platform supports SCMI and to natively use SCMI for
selected/limited subset of SCMI protocols.

This patch series introduces ACPI PCC transport support for the Arm SCMI
framework, alongside several foundational refactors and enhancements to
achieve firmware-node neutrality between Device Tree (DT) and ACPI systems.

The key changes include:

1. ACPI/DT abstraction and fwnode transition

   Converted the core SCMI code to use `fwnode_handle` instead of DT-specific
   structures, ensuring seamless operation across both ACPI and DT
   environments. All property lookups, child enumeration, and device
   association paths have been updated accordingly.

2. Unified transport registration for ACPI and DT

   Extended the SCMI transport driver macros to support ACPI match tables,
   enabling transports to probe using ACPI device IDs while maintaining
   backward compatibility with DT-only systems.

3. Protocol device initialization and refactoring

   Refactored the protocol device creation and validation logic into a new
   helper for improved readability and maintainability. Enhanced the
   initialization logic to handle ACPI-based SCMI devices without explicit
   child fwnodes.

4. Introduction of ACPI PCC transport

   Added a new SCMI transport driver leveraging ACPI PCCT (Platform
   Communications Channel Table) subspaces via the Linux PCC mailbox
   framework. This enables SCMI communication over PCC on ACPI-based
   platforms.

Collectively, these changes lay the groundwork for robust SCMI operation on
ACPI platforms, achieving near parity with DT systems where applicable,
while enabling the new PCC transport path for firmware communication.

Note: SCMI will not be run natively for all existing protocols other
than Powercap and Telemetry, as they must continue to use ACPI abstractions.

[1] https://developer.arm.com/documentation/111115/latest

-->8

Device (SCM0) {
  Name(_HID, "ARML0001")
  Name (_UID, 0)
  Name (_DSD, Package () {
    ToUUID("84a2d1c6-86b6-4199-8dac-9c17449d5e03"),  // SCMI Properties UUID
      Package () {
        Package(2) {
          "arm-arml0001-transport-pcc", // Key
          Package () {               // Value
              1,                     // Revision
              3,                     // Count
              Package(){4, 0, 1},    // PCCT Idx, TransportUID, A2P Common
              Package(){7, 1, 0},    // PCCT Idx, TransportUID, A2P Exclusive
              Package(){9, 2, 2}     // PCCT Idx, TransportUID, P2A Exclusive
          } // Value
        },
        Package(2) {
          "arm-arml0001-protocol-pcap",   // Key
          Package () {                // Value
             1,                       // Revision
             Package() {              // Protocol Exclusive Transport Package
                                      // Empty; A2P Common
             },
             Package() {}             // Protocol Association Package
          } // Value
        },
        Package(2) {
          "arm-arml0001-protocol-telemetry", // Key
          Package () {                // Value
            1,                        // Revision
            Package() {               // Protocol Exclusive Transport Package
              Package (2) {1, 0},     // UID=1; Flags=0; A2P Exclusive
              Package (2) {2, 0}      // UID=2; Flags=0; P2A Exclusive
            },
            Package() {}              // Protocol Association Package
          } // Value
        },
      } // Device Properties
    }) // _DSD
} // SCM0

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
Changes in v5:
- Make DT child-node enumeration and ACPI known-protocol enumeration
  mutually exclusive, preventing duplicate protocol device and channel
  initialization when an incorrect ACPI SCMI device has child nodes.
  (Reported by sashiko)
- Link to v4: https://patch.msgid.link/20260904-acpi_scmi_pcc-v4-0-6ebe9755606e@kernel.org

Changes in v4:
- Fixed generated platform-device fwnode ownership using the platform-device
  OF/fwnode helpers.
- Dropped the PCC transport’s default y and clarified its Kconfig help.
- Treated ACPI package integers as 64-bit values and validated PCCT indices
  before narrowing.
- Reworked PCC parsing with named package indices.
- Made cached PCC transport maps device-managed and protected map cleanup
  with scoped locking.
- Replaced hard-coded framing and queue limits with symbolic constants.
- Simplified fwnode iteration and made cleanup-helper acquisition and
  release visibly colocated.
- Link to v3: https://patch.msgid.link/20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org

Changes in v3:
- Reworked ACPI _DSD parsing with stricter validation and order-independent
  transport/protocol processing.
- Added per-fwnode PCC transport maps, serialized access, multi-instance
  validation, and module-exit cleanup.
- Corrected PCC completion flags and validated shared-memory capacity and
  signature.
- Restricted protocol enumeration to ACPI-backed instances, handled optional
  protocols without spurious errors, and fixed CONFIG_ACPI=n builds.
- Removed redundant ACPI companion assignment.
- Enabled the ACPI PCC transport by default when its dependencies are met.
- Link to v2: https://patch.msgid.link/20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com

Changes in v2:
- Fixed SCMI fwnode lifetime handling by taking a reference when
  assigning protocol device fwnodes and releasing it from the device
  release path.
- Reworked ACPI PCC _DSD parsing to validate package types,
  revisions, counts, UID ranges, flags, duplicate UIDs, and channel
  mappings.
- Parse the SCMI ACPI _DSD UUID package directly as we moved to SCMI
  specific UUID from the generic device properties UUID and reject
  malformed or unsupported protocol association data.
- Tightened PCC channel selection so each protocol gets at most one Tx
  and one Rx channel, with exactly one common A2P channel and at most
  one common P2A channel.
- Only set the PCC interrupt-enable flag when the mailbox channel has a
  txdone IRQ.
- Added the SCMI Telemetry protocol ID(Temporary to get the build
  working, must come from Cristian's Telemetry support patched)
- Link to v1: https://patch.msgid.link/20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com

---
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

 drivers/firmware/arm_scmi/bus.c                |  37 +-
 drivers/firmware/arm_scmi/common.h             |  39 +-
 drivers/firmware/arm_scmi/driver.c             | 222 ++++---
 drivers/firmware/arm_scmi/transports/Kconfig   |  12 +
 drivers/firmware/arm_scmi/transports/Makefile  |   2 +
 drivers/firmware/arm_scmi/transports/mailbox.c |   7 +-
 drivers/firmware/arm_scmi/transports/optee.c   |   7 +-
 drivers/firmware/arm_scmi/transports/pcc.c     | 875 +++++++++++++++++++++++++
 drivers/firmware/arm_scmi/transports/smc.c     |  10 +-
 drivers/firmware/arm_scmi/transports/virtio.c  |   3 +-
 include/linux/scmi_protocol.h                  |   1 +
 11 files changed, 1099 insertions(+), 116 deletions(-)
---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20251017-acpi_scmi_pcc-e44e1233eae3


-- 
Regards,
Sudeep

