Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795304607;
	b=bvjNAr1NBDX6U7F/PNxoBnyTvKyvHqKFFr+HTZF+u2WbLWWuQBl8iYFcCoGVeGkE0bWZ
	 op6H/Mep/ZS+dXuYV6vZ/ctpMrgNH/WtRCLNaLYHrtuohAJxNYwPG3Nd0F5bPHSo9reQs
	 1M1O5oPLB6YvxtdzaL1cGNLJJplQ0+Wq1pDR0oIwAJCiG5X23EUluDbYDtqRUewEhfGYu
	 ZOhc3/Kxe8bgwlpNjKmgQlHOjPZTDCf+gIFM/3P8nYt5/i19W0c+r46zhaCpFf/U7iSlu
	 lL2m0Xq+1ZRgYTmdmiklvGpqiKbrFf9oHAptZH3I0ElaUMK8inUGFlHbgcpIdNlIhxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795304607;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=in0FfxiQnwFYMYmVS/cXKeEGlPCU4+BzK9z7Amgsxio=;
	b=nXwSImcj7PSnQKKyP4wPUrJuGny3PAaLLLkzF/L5BDWZS1vzZ3eKVVMOlxLct1ZcF6Bx
	 taDL0gcXY1j7gny9THxPx644o+BUtkUiIA0SSYe3ZCyGyxUhoYBHBMEEGyeg9Cgt+x/KU
	 Dvvp/aOO/rE6FiZZVs2WZyQd/xbs7EBCyvCdrHfYg7D5FaFkkl0nt9TFPIC5DXZCTEmdL
	 tX8EwBa7cmLMZUOjFdoQFMSDzC6aYRuDFhnAwJknX8G637MUkz69TO+y+kO/x0LNpWMm2
	 HP8ghZNf/9QRAu7SdCMN1UfkgeKEMPeaiFG7bI4YRxSGDdPKYEXq3KXf6ZpdtNA6kCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XNUrYEyc;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65638606A320;
	Sat, 21 Nov 2026 23:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65638606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XNUrYEyc
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B15431575;
	Sat, 21 Nov 2026 15:43:22 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BDC2F3F632;
	Sat, 21 Nov 2026 15:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795304605; bh=WnkZY+KCv0Cz4fjEqWWq8qLIaGu3V4ogTRUwdhMHvpk=;
	h=From:To:Cc:Subject:Date:From;
	b=XNUrYEyckjnE6Pxqd3nm1W2uqXpIOBnROocJFtQo4CCVElcjTgbClZiheOfMvVnvH
	 fomtzYuCeFFgQnHtGFtx5Z/SW7kDbsOMO+NCc8xZU4sCO+jJ4nuy+OmIbcmND/lB4H
	 9QqO8v6wtJFZSNO9mX6qCm/pWcPaztdFWhSC+eUY=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	d-gole@ti.com,
	jonathan.cameron@oss.qualcomm.com,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	david@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v16 00/31] Introduce SCMI Telemetry support
Date: Sat, 21 Nov 2026 23:39:34 +0000
Message-ID: <20261121234005.1525419-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
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

Hi all,

[TLDR Summary]
 [V16 highlights]
 - addressed reviewers feedback, slimming down the series a bit by
   removing from the posted series all the SCMI Telemetry features
   that are currently unused, i.e.:
    + Groups
    + Notification support
    + Asynchronous Single Sample Read
    + Reset
    + Generation counter events
   NOTE that the ABI and related KSFT and Documentation are still covering
   the whole feature set in order to present a complete view: new ABI
   feature bits to cover what is present and what not.
 - added a few SCI Core fixes that ease per-protocol logic:
   + added more consistency in the SCMI Core Iterators machinery
   + added centralized check (SCMI Core) for truncated reply

 [V17 TODO]
  - address any remaining outstanding Sashiko/reviewers issues
  - address pending human reviews feedback

The upcoming SCMI v4.0 specification [0] introduces a new SCMI protocol
dedicated to System Telemetry.

In a nutshell, the SCMI Telemetry protocol allows an agent to discover at
runtime the set of Telemetry Data Events (DEs) available on a specific
platform and provides the means to configure the set of DEs that a user is
interested into, while reading them back using the collection method that
is deeemed more suitable for the usecase at hand. (...amongst the various
possible collection methods allowed by SCMI specification)

Without delving into the gory details of the whole SCMI Telemetry protocol
let's just say that the SCMI platform/server firmware advertises a number
of Telemetry Data Events, each one identified by a 32bit unique ID, and an
SCMI agent/client, like Linux, can discover them and read back at will the
associated data value in a number of ways.

Data collection is mainly intended to happen on demand via shared memory
areas exposed by the platform firmware, discovered dynamically via SCMI
Telemetry and accessed by Linux on-demand, but some DE can also be reported
via SCMI Notifications asynchronous messages or via direct dedicated
FastChannels (another kind of SCMI memory based access): all of this
underlying mechanism is anyway hidden to the user since it is mediated by
the kernel driver which will return the proper data value when queried.

Anyway, the set of well-known architected DE IDs defined by the spec is
limited to a dozen IDs, which means that the vast majority of DE IDs are
customizable per-platform: as a consequence, though, the same ID, say
'0x1234', could represent completely different things on different systems.

Precise definitions and semantic of such custom Data Event IDs are out of
the scope of the SCMI Telemetry specification and of this implementation:
they are supposed to be provided using some kind of JSON-like description
file that will have to be consumed by a userspace tool which would be
finally in charge of making sense of the set of available DEs.

IOW, in turn, this means that even though the DEs enumerated via SCMI come
with some sort of topological and qualitative description provided by the
protocol (like unit of measurements, name, topology info etc), kernel-wise
we CANNOT be completely sure of "what is what" without being fed-back some
sort of information about the DEs by the afore mentioned userspace tool.

For these reasons, currently this series does NOT attempt to register any
of these DEs with any of the usual in-kernel subsystems (like HWMON, IIO,
PERF etc), simply because we cannot be sure which DE is suitable, or even
desirable, for a given subsystem. This also means there are NO in-kernel
users of these Telemetry data events as of now.

So, while we do not exclude, for the future, to feed/register some of the
discovered DEs to/with some of the above mentioned Kernel subsystems, as
of now we have ONLY modeled a custom userspace API to make SCMI Telemetry
available to userspace tools.

With V5 we adopted a pure chardev/IOCTL ABI approach, refining the IOCTL
based interface already present with the previous FS-based ABI.

INTERFACES

For each discovered SCMI Instance a character device named tlm_<N> is
created under /dev/scmi/ subtree.

The IOCTL interface described at 'include/uapi/linux/scmi.h' is made
available to enumerate and configure Telemetry resources: Telemetry data
can be collected using a few different IOCTls, depending on the required
granularity.

Alternatively it is possible to obtain a list of the file descriptors
referencing directly the underlying SCMI Telemetry SHMTI memory areas and
implement in user space an SCMI Telemetry parser accessing directly the
SHMTI, while staying in compliance with the SCMI TDCF format.

NOTE THAT from v3 onwards the firmware interface level NOW supports ONLY
the latest SCMI v4.0 specification [0].

Based on V7.4-rc3, tested on an emulated setup and AGI HW.

This series is available also at [1].

If you still reading...any feedback welcome :P

Thanks,
Cristian

---
v15 --> v16
 - rebased on v7.4-rc3
 - [ALL] removed Telemetry unused features
   + Groups/Notifications/AsyncSingleSample/Reset/Events
 - [STLM]
   + handling new ABI Feature bits
 - [SYS/TLM]
   + remove unsupported features from ABI features
   + clear out->flags in uapi_info
   + cap ABI INFO usize to PAGE_SIZE
   + sanitize input update interval
   + add missing pad/reserved checks in input
 - [UAPI]
   + added GROUPS/SINGLE_SAMPLE abi_features flags definitions
 - [TLM]
   + initialize/destroy debugFS around SHMTIs init
   + cleanup protocol dbg root after devres group closure
   + discard DE/FC at enumeration time that were found in SHMTI at boot
   + align DE local/global TS state after enumeration
   + check liveness in de_snapshot
   + add shmti_overflow check on snap
   + check liveness on blkts_snapshot too
   + refatcor blkts_update on DE enable and update de.ts_rate even
     when BLK_TS line is the same
   + on disable do NOT assume SHMTI_ID_INVALID means disable
   + fix remote_update_needed logic
   + invalidate cache on DE disable
   + invalidate base/offset on disable if NOT FC
   + use new shmti_overflow with eplg directly
   + WARN_ON(BLK_TS_INVALID) but keep active_bts valid
   + invalidate TDE cache on blkts_unlin
   + cleanup stale lines on shmti cleanup
   + add more iterators consistency checks
   + added more checks in the SCMI Core Iterators machinery
   + added centralized check for truncated replies
   + droppepd unused support for non devres protocol acquire/release
     operations
v14 --> v15
 - rebased on v7.4-rc2
 - [STLM]
   + add lazy enumeration
   + add des/info cmdline options
   + add missing SIGTERM handling
 - [SYS/TLM]
   + harden/simplify batch helpers
   + fix shmti mmap size check to include offset
   + simplify session_unsubscribe cleanup on exit/unbind
   + added missing kref.h include
   + expose TLM EVENTS capabilities ONLY IF CONFIG_EVENTFD
   + mmap: improved check to avoid WRITE/EXEC mapping
   + reject non zero vm_pgoff
   + drop usage of guard(srcu) to avoid races with put_device
 - [TLM]
   + avoid genration counter reset on TLM RESET
   + add an overflow check on NOTIF payload lines parsing
   + convert to Linux errno before building notification report
   + use better startm/endm initial markers in tdcf_de_payld_get
   + trigger resource enumeration also on de_data_read
   + skip unitialized FCs on reads and return -EPROTO
   + check FC size on enumeration (big enough to hold TS ?)
   + introduce localized single DE snapshot on single DE data read
   + widen tde->mtx locking in msg_payld_process
   + refactor msg_payld_process
   + unlink BLK_TS on DE disable
   + update linked BLK_TS on enable
   + update TDE location ONLY after successfull linked lines processing
   + trigger resource enumeration on state_get
   + trigger resource enumeration on colletion configure only for groups
   + widen tde->mtx locking section on state_set
   + refactor UUID/BLK_TS lines processing in enable
   + introduce BLK_TS localized snapshot during enable
   + check line type at de_offs
   + sanitize requested mode on collection conf
   + use snapshots to collect UUIDs during full scans
   + stop tracking UUIDs lines singularly (useless overhead)
   + use UUIDs line hashing for lookup
   + use snapshots to track and collect BLK_TS during full scan bulk reads
   + account for tstamped TDE during discovery
   + correct SHMTI overflow off-by-one
   + rework TDE cache hit/miss logic
   + introduce snapshots on full scan reads
   + validate DE location also on SCAN_UPDATE
   + fix TDCF prologue/epilogue endianity struct definitions
   + rework SHMTI initialization and allocation
   + add snapshot suppport data structures
   + added alignment checks on SHMTII length size
   + fixed error string formatting
   + warn if less than expected SHMTIs are enumerated
   + improve memory area sanity checks
   + added missing initialization of intrvs->grp_id
   + bailout from group initialization when NO DEs were found
   + better handling of error path on groups init
   + drop usage of devres for FC iomapping
   + trigger full enumeration of DE lookups
   + new IS_TDE_TS_ macro helpers
   + add a dedicated scmi_telemetry_free_tdes_add helper
   + dropping needless __must_check
   + flag as fully enumerated only when ALL declared des were found
   + reworked error path in scmi_allocate_pending_event_handler
   + hardened core iterator parsing of multi-part reply

[0]: https://developer.arm.com/documentation/den0056/f/?lang=en
[1]: https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git/log/?h=scmi_telemetry_ng_V16

Cristian Marussi (30):
  firmware: arm_scmi: Harden iterators state parsing
  [RFC] firmware: arm_scmi: Additional iterators consistency checks
  firmware: arm_scmi: Add centralized detection of truncated replies
  firmware: arm_scmi: Introduce a dedicated SCMI Errors header
  firmware: arm_scmi: Add new SCMIv4.0 error codes definitions
  firmware: arm_scmi: Allow registration of unknown-size events/reports
  firmware: arm_scmi: Refactor __scmi_event_handler_get_ops helper
  dt-bindings: firmware: arm,scmi: Add support for telemetry protocol
  include: trace: Add Telemetry trace events
  firmware: arm_scmi: Add Telemetry basic attributes enumeration
  firmware: arm_scmi: Add Telemetry resources enumeration
  firmware: arm_scmi: Add Telemetry global update intervals enumeration
  firmware: arm_scmi: Add Telemetry SHMTI areas enumeration
  firmware: arm_scmi: Add Telemetry TDCF areas parsing support
  firmware: arm_scmi: Add Telemetry TDCF parsing for BLK_TS lines
  firmware: arm_scmi: Add Telemetry TDCF parsing for UUID lines
  firmware: arm_scmi: Add Telemetry DEs configuration support
  firmware: arm_scmi: Add Telemetry global configuration support
  firmware: arm_scmi: Add Telemetry Single/Bulk DEs reads
  firmware: arm_scmi: Add Telemetry boot-on support
  firmware: arm_scmi: Add common per-protocol debugfs support
  firmware: arm_scmi: Add Telemetry debugfs SHMTI dump support
  firmware: arm_scmi: Add Telemetry debugfs ABI documentation
  firmware: arm_scmi: Expose per-instance identifier
  uapi: Add ARM SCMI Telemetry definitions
  firmware: arm_scmi: Add System Telemetry driver
  firmware: arm_scmi: Enable autoloading for System Telemetry driver
  docs: ioctl-number: Add SCMI Ioctls
  [RFC] Documentation: Add SCMI System Telemetry documentation
  [RFC] tools/testing/scmi: Add SCMI Telemetry testing tool

Philip Radford (1):
  kselftest/arm64: Add SCMI Telemetry UAPI compliance testcases

 Documentation/ABI/testing/debugfs-scmi        |   22 +
 .../bindings/firmware/arm,scmi.yaml           |    8 +
 Documentation/userspace-api/index.rst         |    1 +
 .../userspace-api/ioctl/ioctl-number.rst      |    1 +
 Documentation/userspace-api/stlm.rst          |  590 +++
 MAINTAINERS                                   |    2 +
 drivers/firmware/arm_scmi/Kconfig             |   24 +
 drivers/firmware/arm_scmi/Makefile            |    3 +-
 drivers/firmware/arm_scmi/bus.c               |    1 +
 drivers/firmware/arm_scmi/common.h            |   41 +-
 drivers/firmware/arm_scmi/driver.c            |   98 +-
 drivers/firmware/arm_scmi/errors.h            |   56 +
 drivers/firmware/arm_scmi/notify.c            |  102 +-
 drivers/firmware/arm_scmi/notify.h            |    8 +-
 drivers/firmware/arm_scmi/protocols.h         |   22 +
 drivers/firmware/arm_scmi/raw_mode.c          |    1 +
 .../firmware/arm_scmi/scmi_system_telemetry.c | 1364 ++++++
 drivers/firmware/arm_scmi/telemetry.c         | 4308 +++++++++++++++++
 include/linux/scmi_protocol.h                 |  208 +-
 include/trace/events/scmi.h                   |   45 +
 include/uapi/linux/scmi.h                     |  533 ++
 tools/testing/scmi/Makefile                   |   25 +
 tools/testing/scmi/stlm.c                     | 1698 +++++++
 tools/testing/scmi/stlm_decode.c              |  252 +
 tools/testing/scmi/stlm_decode.h              |    7 +
 tools/testing/selftests/arm64/Makefile        |    2 +-
 tools/testing/selftests/arm64/scmi/Makefile   |   12 +
 tools/testing/selftests/arm64/scmi/config     |    2 +
 .../arm64/scmi/test_scmi_telemetry_uapi.c     | 2034 ++++++++
 29 files changed, 11391 insertions(+), 79 deletions(-)
 create mode 100644 Documentation/userspace-api/stlm.rst
 create mode 100644 drivers/firmware/arm_scmi/errors.h
 create mode 100644 drivers/firmware/arm_scmi/scmi_system_telemetry.c
 create mode 100644 drivers/firmware/arm_scmi/telemetry.c
 create mode 100644 include/uapi/linux/scmi.h
 create mode 100644 tools/testing/scmi/Makefile
 create mode 100644 tools/testing/scmi/stlm.c
 create mode 100644 tools/testing/scmi/stlm_decode.c
 create mode 100644 tools/testing/scmi/stlm_decode.h
 create mode 100644 tools/testing/selftests/arm64/scmi/Makefile
 create mode 100644 tools/testing/selftests/arm64/scmi/config
 create mode 100644 tools/testing/selftests/arm64/scmi/test_scmi_telemetry_uapi.c

-- 
2.54.0

