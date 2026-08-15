Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6292713777E;
	Sat, 15 Aug 2026 23:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786836400; cv=none; b=ZyJHfn8xwnaNtWrQn9sIUX4sliJ6ItaazmFvZZv9HAJ17u//98b4CeVc8q0XIz/UVB60dV8VCnjC7vOqYTqQWSykJwdicTawlK5I6vvX7xEC9L0K8nyofG+SIXFq42aUiETTH8LGb7v0jSFZY7LCBrxBmJ5V1+JUHgAkIUXBJWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786836400; c=relaxed/simple;
	bh=x46N7eOUxL/Qh1JtVN5GPQiZM6NP3m0NboeHBtQhrCE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wl9++NjNcFEipt8kEHzs9hABip8+2Ub3QU/Q6pYF1cG3D1dOhuNT6myNlY9x1GK7ghlM8AwM1f4ZDuouXiKnNtNw8xJG0g38viMvpEt5slQmoIrt8XmA/aykIOeNQEpYx0DqxUau42nXFcj9fcg2wdzSieSXizBVZywkwROASR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=PkTF++yH; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="PkTF++yH"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 812791595;
	Sat, 15 Aug 2026 16:26:33 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 113B03F673;
	Sat, 15 Aug 2026 16:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786836397; bh=x46N7eOUxL/Qh1JtVN5GPQiZM6NP3m0NboeHBtQhrCE=;
	h=From:To:Cc:Subject:Date:From;
	b=PkTF++yHOlocBmFEubDkNMYs+KK+Pqe8b9hfLSldfLVAPIpmGvcuVifQoBAembzhp
	 9qpwmN6+u0i6pk+SD5SLahla/DsKMe7FrXcxFp6rfhbNoHdTMxxrNj/bC1uO2rS5Rv
	 mseN8jzQmNxDzbaot0+OPFjRm1HSrcYgpMkUyRyA=
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
	jic23@kernel.org,
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
Subject: [PATCH v10 00/24] Introduce SCMI Telemetry support
Date: Sun, 16 Aug 2026 00:25:40 +0100
Message-ID: <20260815232604.3730754-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

Apologies for this early reposting but V9 had some trivial conflicts
to be solved for a clean apply.

[TLDR Summary]
 [V10 highlights: a repost of V9 with some conflict fixed]
 - V10 goes further in addressing Sashiko v8 and human reviewer reports,
   but there are still outstanding reports to address
 - V10 also performs an ABI rework of the all the _LIST IOCTLs parameters:
   all such IOCTLs have been ported to use the scmi_tlm_batch container,
   instead of a number of custom container structs, so as to reduce code
   and data duplication
 - V10 STLM tool is functional but still to be improved in terms of
   usability as a testing tool, particularly regarding outputs

 [V11 TODO (getting merge-able)]
  - Address the remaining outstanding Sashiko/reviewers issues
  - [ABI]: more DOCS and examples

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

Based on V7.2-rc7, tested on an emulated setup.

This series is available also at [1].

If you still reading...any feedback welcome :P

Thanks,
Cristian

---
v9 --> v10
 - rebased on v7.2-rc7
 - fixed trivial conflict issue when applying patch 5
v8 --> v9
 - [SYS/TLM] reworked ANON fds processing to delay fd_install to the very
   last moment when failure is no more possible
 - [SYS/TLM] reworked cdev and data lifecycle to cleanly handle driver
   unbind while chardev fds are open, avoiding any devres allocation
 - [SYS/TLM] added sensible upper-bounds checks on allocations
 - [SYS/TLM] used kvmalloc and friends all over when allocation sizes
   originates from userspace or FW
 - [SYS/TLM] reworked BATCH helpers to support batch.items=0
 - [SYS/TLM] reworked ALL the _LIST IOCTLs to use scmi_tlm_batch container
   and related helpers
 - [SYS/TLM] support 0-items IOCTL idiom
 - [ABI] dropped custom container structure in favour of scmi_tlm_batch for
   all of the _LIST IOCVTLs
 - [TLM] use kvzalloc when size is potentially important
 - [TLM] avoid NULL deref on DBG
 - [TLM] removed initial state lookup on RESET
 - [TLM] fix notification payload boundary and wraps checks
 - [TLM] added check on unexpected shorter reply on simpl reads
 - [TLM] use non-LE accessors when appropriate for payloads
 - [TLM] converted a few macros to inlines
 - [TLM] fix DE offsest boundary check logic
 - [TLM] bail out if SHMTI not 32-bit aligned
 - [TLM] warn if SHMTI not 64-bit aligned
 - [DRV] added non-devres protocol operations helpers
v7 --> v8
 - Rebased on v7.2-rc6
 - [SYS/TLM] refatcor batched IOCTLs handling
 - [SYS/TLM] use array_size to check for overflows all over
 - [SYS/TLM] add upper bounds checks for batched IOCTL
 - [ABI] fix wrong strcut in SCMI_TLM_BATCH_READ
 - [ABI] move a few IOCTLs to be _IOW only
 - [TLM] reworked locking around TDCF lines tracking
 - [TLM] add proper barriers to TDE/UUID binding process
 - [TLM] update tde->sid on SCAN_UPDATE too
 - [TLM] check wrap-arounds on shmti_de_offset manipulation
 - [TLM] remove .all_disable telemetry_operation since unused
 - [TLM] add WARN on if a valid SHMTI ID is reported o
         enabling a FastChannel/DE
 - [TLM] add more safeguards and checks to SHMTI_OVERFLOWS
 - [TLM] fix UUIDs copy and allocation
 - [TLM] fix UUID reference store and cleanup
 - [TLM] add proper msg boundary parsing checks on DE_DESCRIPTION multipart
 - [TLM] add proper cleanup/rollback on groups_init err_path
 - [TLM] update num_des_tstamp ONLY after a DE is successfully initialized
 - [TLM] proper cleanup tde during tde_put (preserving info/mutex bits)
 - [TLM] add membarriers in enumerate resources
 - [TLM] add a check and a warn on SHMTI phys_addr alignment
 - [TLM] use proper FTRACE helpers for variable strings
v6 --> v7
 - [ABI] IOCTL EVENTS support: GENERATION COUNTER (stlm monitor)
 - [ABI] expose DE tracking: UUID/SHMTI/OFFS
 - [ABI] IOCTL BATCHED DE_CFG
 - [ABI] added per-DE IOCTL BATCH status
 - [ABI] new ABI feats flags
 - [ABI] improved description in Doxygen docs
 - [ABI] added reserved space to grow
 - [STLM] added new ABI feats support (generation, UUIDs, location...)
 - [SYS/TLM] fixed module_init error path
 - [SYS/TLM] fixed interval DISCRETE flags reporting
 - [SYS/TLM] check open FMODE before executing a config change 
 - [SYS/TLM] fixing DEs data cleanup on RESET
 - [SYS/TLM] added _RAW helpers to handle non-MMIO TDCF-like accesses
   (like Notification payload)
 - [SYS/TLM] added UUID rescan logic at DE enable, when DE/UUID association
 - [TLM] reworked UUID internal handling (endianity) and use uuid_t type
 - [TLM] added generic Telemetry protocol support for events subscription
   unknown
 - residual sparse fixes
v5 --> v6
 - rebased on v7.2-rc4
 - fixed a lot of Sashiko complains
 - fixed ABI issues reported by review (Fayssal)
 - added IOCTL TLM_RESET
 - added ABI versioning
 - added compat_ioctl support
 - use a new IOCTL magic name
 - better handling of UUID endianity
 - reworked all bounds checks in UAPI implementation
 - reject oversized SHMTI mmap request
 - refined 'stlm' testing tool to be more interactive and to
   exercise the full spectrum of IOCTLs ('stlm -h' is your manual
   for now :P)
 - fully reworked per-protocol notification handling
 - dropped the last bit of human readable data attached to the
   chardev .read
v4 --> v5
 - rebased on v7.2-rc1
 - dropped FileSystem based driver
 - introduced a new simple chardev SCMI driver using Telemetry
 - reworked/reviewed the v4 IOCTLs based UAPI
 - UAPI: better struct alignment and comments
 - UAI: Removed flexible array members
 - UAPI: make SCMI Telemetry protocol stack completely independent from
 	 uapi defs
 - UAPI: new ioctls support to enable RAW mmap direct access to SCMI SHMTI
 	 areas from userspace
 - added new ABI Documentation
 - added new SCMI core facility to lookup the current SCMI instance ID
v3 --> v4
 - rebased on v7.1-rc7
 - updatded doc to detail Concurrency model
 - bail out on FW_BUG errors
 - make all_des_enable/all_des_tstamp_enable entry readable
 - refactored access to TDE values
 - refactored common accessors for tlm_priv (FIX WARN on kfree)
 - make all files by default world readable and user writable (if needed)
 - added uid/god/umask mount options (and docs)
 - added generation counter to aid spotting config changes (and docs)
 - added DebugFS configurable support to debug/dump SHMTI areas (and docs)
 - hide FS entries when NOT supported (like des_simple_sample_read)
 - fixed output format of des/<NNN>/value to -> <TS> <VALUE>
 - renamed top-dir by_components to by-components
 - add a .remove method to SCMI System Telemetry Driver
 - use kzalloc_obj
V2 --> V3
 - rebased on v7.0-rc5
 - ported the firmware interface to SCMI v4.0 BETA
 - split the SCMI protocol layer in a lot of small patches
 - completd filesystem and ABI documentation
 - renamed components subtree to by_components
 - fixed uninitialized var in scmi_telemetry_de_subdir_symlink
 - renamd tstamp_exp to tstamp_rate
 - swap logic in scmi_telemetry_initial_state_lookup
 - use memcpy_from_le32 where required
 - changed a dfew dev_err into Telemetry traces
 - define and use new helper scmi_telemetry_de_unlink
 - simplify a few assignments with ternary ops
 - added a missing __mmust_check on the internal SCMI API
 - reworked and clarified de_data_read returned errno:
 	ENODATA vs EINVAL vs ENODEV/ENOENT
 - removed some risky/unneeded devres allocations
 - various checkpatch fixes
 - reworked and clarified usage of traces in Telemetry
 - added the missing DT binding for protocol 0x1B
 - split out unrelated change around notification from patch
   adding support for protocol internal notifier
 - more comments

V1 --> V2
 - rebased on v6.19-rc3
 - harden TDCF shared memory areas accesses by using proper accessors
 - reworked protocol resources lifecycle to allow lazy enumeration
 - using NEW FS mount API
 - reworked FS inode allocation to use a std kmem_cache
 - fixed a few IOCTLs support routine to support lazy enumeration
 - added (RFC) a new FS lazy mount option to support lazily population of
   some subtrees of the FS (des/ groups/ components/)
 - reworked implementation of components/ alternative FS view to use
   symlinks instead of hardlinks
 - added a basic simple (RFC) testing tool to exercise UAPI ioctls interface
 - hardened Telmetry protocol and driver to support partial out-of-spec FW
   lacking some cmds (best effort)
 - reworked probing races handling
 - reviewed behaviour on unmount/unload
 - added support for Boot_ON Telemetry by supporting SCMI Telemetry cmds:
   + DE_ENABLED_LIST
   + CONFIG_GET
 - added FS and ABI docs

RFC --> V1
---
 - moved from SysFS/chardev to a full fledged FS
 - added support for SCMI Telemetry BLK timestamps

[0]: https://developer.arm.com/documentation/den0056/f/?lang=en
[1]: https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git/log/?h=scmi_telemetry_ng_V10


Cristian Marussi (24):
  firmware: arm_scmi: Add new SCMIv4.0 error codes definitions
  firmware: arm_scmi: Allow registration of unknown-size events/reports
  firmware: arm_scmi: Introduce protocol instance notifiers
  dt-bindings: firmware: arm,scmi: Add support for telemetry protocol
  include: trace: Add Telemetry trace events
  firmware: arm_scmi: Add basic Telemetry support
  firmware: arm_scmi: Add support to parse SHMTIs areas
  firmware: arm_scmi: Add Telemetry configuration operations
  firmware: arm_scmi: Add Telemetry DataEvent read capabilities
  firmware: arm_scmi: Add support for Telemetry reset
  firmware: arm_scmi: Add Telemetry notification support
  firmware: arm_scmi: Add support for boot-on Telemetry
  firmware: arm-scmi: Add telemetry generic event support
  firmware: arm_scmi: Add Telemetry generation counter event
  firmware: arm_scmi: Add common per-protocol debugfs support
  firmware: arm_scmi: Add Telemetry debugfs SHMTI dump support
  firmware: arm_scmi: Add Telemetry debugfs ABI documentation
  firmware: arm_scmi: Expose per-instance identifier
  firmware: arm_scmi: Add un-managed methods to get/put protocols
    operations
  uapi: Add ARM SCMI Telemetry definitions
  firmware: arm_scmi: Add System Telemetry driver
  docs: ioctl-number: Add SCMI Ioctls
  [RFC] Documentation: Add SCMI System Telemetry documentation
  [RFC] tools/scmi: Add SCMI Telemetry testing tool

 Documentation/ABI/testing/debugfs-scmi        |   22 +
 .../bindings/firmware/arm,scmi.yaml           |    8 +
 Documentation/userspace-api/index.rst         |    1 +
 .../userspace-api/ioctl/ioctl-number.rst      |    1 +
 Documentation/userspace-api/stlm.rst          |  148 +
 MAINTAINERS                                   |    1 +
 drivers/firmware/arm_scmi/Kconfig             |   24 +
 drivers/firmware/arm_scmi/Makefile            |    3 +-
 drivers/firmware/arm_scmi/common.h            |   28 +
 drivers/firmware/arm_scmi/driver.c            |  166 +-
 drivers/firmware/arm_scmi/notify.c            |   58 +-
 drivers/firmware/arm_scmi/notify.h            |    8 +-
 drivers/firmware/arm_scmi/protocols.h         |   17 +
 .../firmware/arm_scmi/scmi_system_telemetry.c | 1567 +++++++
 drivers/firmware/arm_scmi/telemetry.c         | 3904 +++++++++++++++++
 include/linux/scmi_protocol.h                 |  266 +-
 include/trace/events/scmi.h                   |   45 +
 include/uapi/linux/scmi.h                     |  474 ++
 tools/testing/scmi/Makefile                   |   25 +
 tools/testing/scmi/stlm.c                     | 1382 ++++++
 20 files changed, 8117 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/userspace-api/stlm.rst
 create mode 100644 drivers/firmware/arm_scmi/scmi_system_telemetry.c
 create mode 100644 drivers/firmware/arm_scmi/telemetry.c
 create mode 100644 include/uapi/linux/scmi.h
 create mode 100644 tools/testing/scmi/Makefile
 create mode 100644 tools/testing/scmi/stlm.c

-- 
2.54.0

