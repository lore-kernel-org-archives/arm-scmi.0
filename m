Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640ED249E5
	for <arm-scmi@vger.kernel.org>; Mon, 25 May 2026 20:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779741857; cv=none; b=BxL5QR6cC7tXy/fwK1seq6Z7bVHM++CWDaPJiylTxnAYksqv+5cRrXbiFCxVbUOT/Ze91Y3L/CuF/hfjrvXZ6DTFbBXDw2g+cIV/Ny6pltTdsHmfqjXoMSjHnclxgImx2XMSGNSqIGMESyYrkiDUK5mlmRTWxKAygRQZYNMEXTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779741857; c=relaxed/simple;
	bh=wU8YRjpnd/5wC01JxYZ8drDq5McSvY44p6hQR2A0RrQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=flIIE+uiKzNwT1lFgRLVJVeABocbbQIlXvCxK4vg3ykY4bV1qAs6rFuIL/GXC8Ih6jPR2W4lTWSyhFTURQUXPBqycVtFPmY6M63bpmUMi9ImE2uEZdHYzu8ms386rQW5H186D3EiNg3YzzgDF7wlLjjIDTjOe6o1JGah+6mSrHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HzTpAAvx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HzTpAAvx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 595781F000E9;
	Mon, 25 May 2026 20:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779741856;
	bh=qTZQl07DZ3orwMJ1zWD5Kp5YJ4qWGG3RQzOnMKdff7I=;
	h=From:Subject:Date:To:Cc;
	b=HzTpAAvxlET8eKMq2IaYwxyIxtDV6mbM6PQk+wp8fD+mLXqvnuhOEwSTlIhBOZf44
	 q6qh8aAApgQ9W1DA6N6EA/wg9cAFt5p366duLrBIEBzDNzUMpgeJtIZ+p8kKd0Nb/n
	 gp79eqDJG0Eq2kx44tK/XKUyr9tFLlzpDOtUXXWP59a93utMc9zcN9EIThxWeGGUUG
	 zh8DScqSOnxauPlTlv3teiZTA5sl3PIqaeNRFaHTfe3urfRQMDY2+H6ICixjV2MbCl
	 rKTm+AxIn4w8WlU9w4W4V5Gd/jqSfqMI+oj7iDFBsnuGz4C5hi/lPgGB6nI9eDXI5e
	 DSCpyjAnUHfbQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v2 0/9] firmware: arm_scmi: Refactoring and enablement of
 ACPI PCC transport
Date: Mon, 25 May 2026 21:42:38 +0100
Message-Id: <20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAES0FGoC/3XMywrCMBCF4VcpszaSSyXUle8hpUyT0c4iTUkkK
 CXvbuze5X/gfDtkSkwZrt0OiQpnjmsLferALbg+SbBvDVrqi5LKCnQbT9kFnjbnBPU9KW0MIRl
 ony3Rg9+Hdx9bL5xfMX0Ovqjf+k8qSkgh0c84WysHP9wwhbOLAcZa6xfia7ciqAAAAA==
X-Change-ID: 20251017-acpi_scmi_pcc-e44e1233eae3
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2

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
      firmware: arm_scmi: Fix OF node reference handling
      firmware: arm_scmi: Set fwnode for the generated SCMI platform device
      firmware: arm_scmi: Extend transport driver macro to support ACPI
      firmware: arm_scmi: Convert OF-only paths to generic fwnode in SCMI core
      firmware: arm_scmi: Fall back to ACPI HID when "compatible" is absent
      firmware: arm_scmi: Pass protocol ID to chan_available() transport callback
      firmware: arm_scmi: Refactor protocol device creation logic
      firmware: arm_scmi: transport: Add ACPI PCC transport
      firmware: arm_scmi: Initialise all protocol devices and transport channels

 drivers/firmware/arm_scmi/bus.c                |  36 +-
 drivers/firmware/arm_scmi/common.h             |  36 +-
 drivers/firmware/arm_scmi/driver.c             | 183 ++++----
 drivers/firmware/arm_scmi/transports/Kconfig   |  12 +
 drivers/firmware/arm_scmi/transports/Makefile  |   2 +
 drivers/firmware/arm_scmi/transports/mailbox.c |   7 +-
 drivers/firmware/arm_scmi/transports/optee.c   |   7 +-
 drivers/firmware/arm_scmi/transports/pcc.c     | 593 +++++++++++++++++++++++++
 drivers/firmware/arm_scmi/transports/smc.c     |  12 +-
 drivers/firmware/arm_scmi/transports/virtio.c  |   3 +-
 include/linux/scmi_protocol.h                  |   1 +
 11 files changed, 785 insertions(+), 107 deletions(-)
---
base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
change-id: 20251017-acpi_scmi_pcc-e44e1233eae3


-- 
Regards,
Sudeep

