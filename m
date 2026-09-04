Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BC33BE178
	for <arm-scmi@vger.kernel.org>; Fri,  4 Sep 2026 15:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537579; cv=none; b=fsks8Xp3tUQAlOhe0KfUJURF/R/hCxq6P/VA2KKD0EEyBV/vv6gUYUf6cOO9y/vloybWVlbP8aeSehWb4DVfA4ZmPOJkQ9OAsd3UJt5MI4p0N0OiTvVd6n9MH7VrE3eNRPKDhZaWk/Csob0yE6YunN0Y/VyKfRCRMUA4ZFzJzwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537579; c=relaxed/simple;
	bh=Iu0JlTf/5GsX5NPWKKkyixvM4WbSS+3m2qhwio9Qvl4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UA6lUislxTSc+rv1ls0TQ5qgARzyQC32KcRkZKzeRy+773ZYdETHKfUkOcvBCLJ97Jjiq/3XvvIaxvA3ZAqYyFPbTSRryj4eboutuVnXXqP/MnngKvb2heLKmp3FxsY2CojyjF4sJ8Fzx30io8D7aE9Nyuriz7EeVM2dSd605ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dx0shtEc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dx0shtEc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7AA61F0156E;
	Fri,  4 Sep 2026 15:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788537577;
	bh=Z8VUK5jtTNpJD38aun+0vgWTIRTBEMGOUuPOyzPQHC0=;
	h=From:Subject:Date:To:Cc;
	b=dx0shtEcEUjYeU1vtKnK+Ria6/Sdb/sE4In511HmjmlTTUyeSGiLLUPJNpZIMw3vg
	 70hVQ5hbHU9WtGH/QQi99tnPSFTQKsNVJYKfw/WDhnd4UKQYFybCfipV9o/bqCth4a
	 z99Abh8loK4Ug5iGJwKZuu0UF5+FPeDWBv/PQiHLZgdim/o14iYcPmNydd8pEDudr3
	 vuTvl9nHj8Vu6TMxoBpKtleMHyhb3Rq6VJVTi9ajcKd9TDcpv+ZKKN+NZ/Mcqjm49d
	 5wP1jklbB1IY2HOs2NSYsEGWORwmJTM0vOJRDZMRzXbCj/OO8+3I6ihOfMV51/Wfvn
	 v0e+cwByHGXHQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v4 0/9] firmware: arm_scmi: Refactoring and enablement of
 ACPI PCC transport
Date: Fri, 04 Sep 2026 16:57:55 +0100
Message-Id: <20260904-acpi_scmi_pcc-v4-0-6ebe9755606e@kernel.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIfqmmoC/3XM3QrCIBjG8VsJj3Oor2uuo+4jYvjxVlKbQ0OKs
 XvPgogGHT4P/P4TSRg9JrJdTSRi9smHoQy5XhF71sMJqXdlE8FEzRlvqLaj75LtfTdaS1FK5AI
 ANQIpZox49Pd3b38o++zTLcTHO5/56/1XypwyyrQz2jQNa12707GvbOjJq5PFx25YLeqlFcXKI
 6gWlGPKqV8LX6s4LC0Ua83GKGUkGgO7C8YBr1WIJ3KY5/kJcrOvdCMBAAA=
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
 drivers/firmware/arm_scmi/driver.c             | 201 +++---
 drivers/firmware/arm_scmi/transports/Kconfig   |  12 +
 drivers/firmware/arm_scmi/transports/Makefile  |   2 +
 drivers/firmware/arm_scmi/transports/mailbox.c |   7 +-
 drivers/firmware/arm_scmi/transports/optee.c   |   7 +-
 drivers/firmware/arm_scmi/transports/pcc.c     | 875 +++++++++++++++++++++++++
 drivers/firmware/arm_scmi/transports/smc.c     |  10 +-
 drivers/firmware/arm_scmi/transports/virtio.c  |   3 +-
 include/linux/scmi_protocol.h                  |   1 +
 11 files changed, 1089 insertions(+), 105 deletions(-)
---
base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d
change-id: 20251017-acpi_scmi_pcc-e44e1233eae3


-- 
Regards,
Sudeep

