Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B49634F471
	for <arm-scmi@vger.kernel.org>; Fri, 17 Oct 2025 13:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760707452; cv=none; b=O7VQaARUG3WxyoGaahGlaIpYK2Pd5qBbygFk3w4Nxi5wHSYP0lWz27dM3vpOYixbrmN9x8q9Igq6SobWq9IUQnSpUxUqtYqOIyj9OqjIQrA/UXyLBDMtdKmcRjGkOoZCbgM29Us0PDVV4YmJ3/LoHA77/g+kBqdPN/bM+aop0dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760707452; c=relaxed/simple;
	bh=vovL/pwqZWIFXKFrGZPLzcvasCxTM72lKPUinpfJ2hM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To; b=QT3Hpe8arOg8MmJ/Medv5jnFdhfkrfokIaSb7Nbl1S/t9t8dOkQfcQvnTcJ0KZpZfEBHiER1nvGryi3vCMzpPL3Wq405q2qtKwEhuS4OAaIxVLvEGgOfoGiCgD0TprGD38h8Vk3DX9Zd+AZR8l4t+vphnQTQZTv6GS0hYeQGsyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B1D11595;
	Fri, 17 Oct 2025 06:24:02 -0700 (PDT)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 36BBB3F66E;
	Fri, 17 Oct 2025 06:24:09 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH 0/8] firmware: arm_scmi: Refactoring and enablement of ACPI
 PCC transport
Date: Fri, 17 Oct 2025 14:23:43 +0100
Message-Id: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGJD8mgC/x3MOwqAMBBF0a3I1AbyUQS3IiJhfOoUxpCACJK9G
 yxPce9LGUmQaWxeSrglyxUqTNsQHz7sULJWk9W2N9oMynOUJfMpS2RW6DoY6xw8HNUmJmzy/L9
 pLuUDxbLy418AAAA=
X-Change-ID: 20251017-acpi_scmi_pcc-e44e1233eae3
To: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Sudeep Holla <sudeep.holla@arm.com>
X-Mailer: b4 0.14.3

The SCMI can be utilized in systems using either the FDT or ACPI specification.
While FDT-based systems can natively use SCMI, ACPI-based systems often
need to abstract the functionality provided by SCMI under ASL methods.
So far, there has been no need to support SCMI natively on ACPI systems.

However, with the addition of a few new protocols such as Powercap and Telemetry,
which lack abstractions in the ACPI specification, there is now a need to
run SCMI natively for those use cases.

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
The ACPI SCMI device document is not hosted publicly yet, but the ACPI
namespace snippet below provides a reference example for reviewing these patches.

There is one dependency on the SCMI Telemetry support posted by Cristian [1].
It is required only for the definition of `SCMI_PROTOCOL_TELEMETRY` in the
`scmi_std_protocol` enumeration.

-->8

Device (SCM0) {
  Name(_HID, "ARML0001")
  Name (_UID, 0)
  Name (_DSD, Package () {
    ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),  // Device Properties UUID
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

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
Sudeep Holla (8):
      firmware: arm_scmi: Set fwnode for the genrated SCMI platform device
      firmware: arm_scmi: Extend transport driver macro to support ACPI
      firmware: arm_scmi: Convert OF-only paths to generic fwnode in SCMI core
      firmware: arm_scmi: Fall back to ACPI HID when "compatible" is absent
      firmware: arm_scmi: Pass protocol ID to chan_available() transport callback
      firmware: arm_scmi: Refactor protocol device creation logic
      firmware: arm_scmi: transport: Add ACPI PCC transport
      firmware: arm_scmi: Initialise all protocol devices and transport channels

 drivers/firmware/arm_scmi/bus.c                |  33 +--
 drivers/firmware/arm_scmi/common.h             |  33 ++-
 drivers/firmware/arm_scmi/driver.c             | 173 ++++++-----
 drivers/firmware/arm_scmi/transports/Kconfig   |  12 +
 drivers/firmware/arm_scmi/transports/Makefile  |   2 +
 drivers/firmware/arm_scmi/transports/mailbox.c |   4 +-
 drivers/firmware/arm_scmi/transports/optee.c   |   4 +-
 drivers/firmware/arm_scmi/transports/pcc.c     | 390 +++++++++++++++++++++++++
 drivers/firmware/arm_scmi/transports/smc.c     |   4 +-
 drivers/firmware/arm_scmi/transports/virtio.c  |   3 +-
 10 files changed, 561 insertions(+), 97 deletions(-)
---
base-commit: 7ea30958b3054f5e488fa0b33c352723f7ab3a2a
change-id: 20251017-acpi_scmi_pcc-e44e1233eae3


-- 
Regards,
Sudeep

