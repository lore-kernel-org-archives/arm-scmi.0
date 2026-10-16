Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB774B3CB5;
	Fri, 16 Oct 2026 18:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792176998; cv=none; b=llNUZg7rzm3SsreYs9dVkXOLy7HLqgowqOPxG4kiE+duQ0CJC1Vr5agF5vgUFZzwQxYng2t9U9BFod7mazcTnH1z6W8S1wDpwZheDPDsF8DIRRHCKh6Yzo1HG0/MDyx8DdVPOnZYwrkPO3/iLZP3CSCE9Prnx7Rr3+xH3HCJ1co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792176998; c=relaxed/simple;
	bh=5FXcV9CyoSwiS+CmQ/1FjleviewtoCmH0W2g82PQtIc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sefBA++pVOOlOIlBsn4hY70rIJuJrHF8uSxrEBaL7FXPnMT6nzgOFJv65EOz39jWzoHiEBCwR0yqpr0k3tQhyuZdTnMEJh6znZKS8xDvJIahnKMHEOXE06GyXNNUOI2iXdcb2lnM3zOLSVMtRVlbap6wCy3EQ8evtge3IBHSj2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=vz9IRMGO; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="vz9IRMGO"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E5C914BF;
	Fri, 16 Oct 2026 11:56:32 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E36D3F7B4;
	Fri, 16 Oct 2026 11:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792176995; bh=5FXcV9CyoSwiS+CmQ/1FjleviewtoCmH0W2g82PQtIc=;
	h=From:To:Cc:Subject:Date:From;
	b=vz9IRMGOxfW3IoPfDfEZfNwRF2yAbkhrj36asWRXf9DBAWV/2rZZYrl1gLO56I5U7
	 6BfOJyoXdnNyUG60UOe/3PKpz2A/mPjXAUHkjGVjn3FG2KwfqqRZJ4srrCERrEPso2
	 pPlwauSHgAZ+5xnGI7CGrOUrJdryM5I70MWxWvvc=
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
Subject: [PATCH v14 00/32] Introduce SCMI Telemetry support
Date: Fri, 16 Oct 2026 19:55:21 +0100
Message-ID: <20261016185553.2794459-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

[TLDR Summary]
 [V14 highlights]
 - Split the 2 bulkiest patches into 5+3 patches
 - V14 addressed more reviews feedback
 - V14 reworked protocol instance notifier to remove residual races

 [V15 TODO]
  - Address any remaining V14 outstanding Sashiko/reviewers issues
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

Based on V7.3-rc7, tested on an emulated setup.

This series is available also at [1].

If you still reading...any feedback welcome :P

Thanks,
Cristian

---
v13 --> v14
 - rebased on v7.3-rc7
 - [STLM]
   + fix mmmap/munmap calls
   + better NULL checks on failed enumerations
   + harden command parsing and return errors
 - [SYS/TLM]
   + avoid double free on probe err path
   + grab ctx and check if dead when mmapping an anon_fd
   + move away from dead_mtx in favour of dead_srcu and extend srcu'ed
   section in ioctl handler
 - [TLM]
   + renamed some fields to more strictly adhere to spec nomenclature
   + split v13 Basic Telemetry into patches [7-11]
   + split V13 Parse SHMTI into patches [12-14]
   + add a barrier to acquire rinfo->num_des on reset
   + avoid lock inversion on config_mtx
   + report scmi_telemetry_line_data_parse errors
   + add traces for CACHED_DE_UPDATED
   + using a less regular time interval for TDCF scan retries
   + move BLK_ST_CHANGED check when bts_payld is really known
   + check lso LINE_TYPE when processing BLK_TS on enable
   + grab individual tde->mtx while updating group state
   + clear returned sid/offset/uid on error path
   + do NOT mutate global config when configuring groups
   + call state_update on do_xfer success even if response process fails
   + fixed AB-BA dealock on blkts_link
   + relocate xa_destroy for xa_lines after uuids cleanup
   + report errors on scmi_telemetry_line_data_parse()
   + fix group unroll loop on groups_init failure
   + remove goto from de_desc_parse since clashes with cleanup guards
   + reworked the helpers used to register protocol notifiers so as to
     effectively work during the protocol initialization phase when locks are
     enabled
v12 --> v13
 - rebased on v7.3-rc5
 - [STLM]
   + misc fixes on alloc/free
   + add single DE dump capability to get info/cfg/data
   + added SHMTI/TDCF decoder (by LLM)
   + fix mmap len/offset call to account for bigger pages and
     offset
   + fixed SPDX header
 - [SYS/TLM]
   + pass back E2BIG from copy_struct_from_user to userspace
   + remove a few redundant copy_from_user
   + fix filedescriptor lifecycle: drop kref in favour of embedded
     cdev and use cdev_device_add. Rely on devm_protocol_get for proto_ops
   + refactor EVENT session unsubscribe and check for aliveness
   + use *alloc_objs helpers
 - [TLM]
   + reworked resourecs cleanup logic
   + use *alloc_objs where possible
   + reworked tde->mtx locks acquisition to improve synchronization between
     configuration actions and concurrent readers
   + refactored STATE_SET helpers to keep DE and GROUP handling distinct
   + handle PARTIAL_ERRORs
   + reworked logic around TDE<-->BLK_TS link/unlink
   + review policy around errors while scanning the TDCF: now retries
     assuming a torn read
   + harden nearest_line_type scanner
   + harden freeing path on RCU UUIDs
   + better DATA LINE size-validation while parsing
   + reset active lines trackers on scan retries
   + remove dubious macro TO_CPU64
   + rename DE_CONFIGURE defines
   + remove useless READ_ONCE
v11 --> v12
 - rebased on v7.3-rc3
 - [STLM]
   + renamed command helpers 
   + reviewed internal/external errcodes usage
   + fixed dump_shmti read loop
   + fixed shmti_check end address calculation
   + fixed batch read boundary checks
   + fixed group indexing
 - [SYS/TLM]
   + added RCU protection to UUIDs
   + reworked eventfd handling: per-session tracking with lifetime tied
     to chardev fds
   + dropped needless copy_from_user on batch.states
 - [UAPI]: document new eventfd lifecycle
 - [TLM]:
   + fix debugfs shmti dump file to use the SID as name
   + reviewed generation counter update logic
   + fixed TS_RATE determination at boot-on
   + updating cache within TDE lock when processing msg_payld
   + using config_mtx to sync with ongoing configurations
   + reporting transient DATA_INVALID lines as -EINVAL
   + added proper locking around TDE access on state_get
   + added a config_mtx to serialize configuration accesses between
     collection configure and state_set
   + refactored state_cache_update
   + reject zero as MATCHSEQ
   + reworked locking around line_get/put
   + reworked locking around blkts_read
   + cleanup active line refs even when bailing out of a scan in error
   + added hashed locks for fine grain locking around blkts/uuid line
     creation
   + added RCU protection on UUIDs access
   + dropped counted-by in smhtis
   + reworked barriers around res_get
   + added smp_store_release on TDE registration
v10 --> v11
 - rebased on v7.3-rc1
 - added initial RFC for KSelfTest
 - [STLM]: add more 0-sized query check for new IOCTLs supported
 - [SYS/TLM]: make devices 664
 - [SYS/TLMM]: add new 0-sized query support for IOCTLs:
     GET_INTRVS / BULK / SIMPLE
 - [UAPI]: more docs and clarification on upper-bounds
 - [UAPI]: more docs and clarification BATCH IOCTLs parameter usage
 - [TLM]: move events cleanup into resource_free
 - [TLM]: fix non-conformancy on CONFIG_GET when groups NON configurable
 - [TLM]: use SCAN_UPDATE also on BOOT-ON initial scan (NO discovery)
 - [TLM]: avoid 'naked' ti->rinfo accesses
 - [TLM]: link notif DE to primary UUID only when first seen
 - [TLM]: protect TDE updates on reset
 - [TLM]: review tde->mtx locking
 - [TLM]: review line.mtx locking
 - [TLM]: refactor reply processing code on DE enable/disable
 - [TLM]: add new mutex to protect des cache updates
 - [TLM]: add more overflow and boundary check on payload parsing
 - [TLM]: fix UUID/BLKTS line refcounting to avoid leaks on free
 - [TLM]: cleanup exit path on resource enumeration
 - [TLM]: account for ktime_t notification field when checking boundary
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
[1]: https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git/log/?h=scmi_telemetry_ng_V14

Cristian Marussi (31):
  firmware: arm_scmi: Add new SCMIv4.0 error codes definitions
  firmware: arm_scmi: Allow registration of unknown-size events/reports
  firmware: arm_scmi: Refactor __scmi_event_handler_get_ops helper
  firmware: arm_scmi: Introduce protocol instance notifiers
  dt-bindings: firmware: arm,scmi: Add support for telemetry protocol
  include: trace: Add Telemetry trace events
  firmware: arm_scmi: Add Telemetry basic attributes enumeration
  firmware: arm_scmi: Add Telemetry resources enumeration
  firmware: arm_scmi: Add Telemetry groups initialization
  firmware: arm_scmi: Add Telemetry update intervals enumeration
  firmware: arm_scmi: Add Telemetry SHMTI areas enumeration
  firmware: arm_scmi: Add Telemetry TDCF areas parsing support
  firmware: arm_scmi: Add Telemetry TDCF parsing for BLK_TS lines
  firmware: arm_scmi: Add Telemetry TDCF parsing for UUID lines
  firmware: arm_scmi: Add Telemetry configuration operations
  firmware: arm_scmi: Add Telemetry DataEvent read capabilities
  firmware: arm_scmi: Add Telemetry reset logic
  firmware: arm_scmi: Add Telemetry notification support
  firmware: arm_scmi: Add Telemetry boot-on support
  firmware: arm-scmi: Add Telemetry generic event support
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
  [RFC] tools/testing/scmi: Add SCMI Telemetry testing tool

Philip Radford (1):
  kselftest/arm64: Add SCMI Telemetry UAPI compliance testcases

 Documentation/ABI/testing/debugfs-scmi        |   22 +
 .../bindings/firmware/arm,scmi.yaml           |    8 +
 Documentation/userspace-api/index.rst         |    1 +
 .../userspace-api/ioctl/ioctl-number.rst      |    1 +
 Documentation/userspace-api/stlm.rst          |  148 +
 MAINTAINERS                                   |    3 +
 drivers/firmware/arm_scmi/Kconfig             |   24 +
 drivers/firmware/arm_scmi/Makefile            |    3 +-
 drivers/firmware/arm_scmi/common.h            |   30 +
 drivers/firmware/arm_scmi/driver.c            |  192 +-
 drivers/firmware/arm_scmi/notify.c            |  252 +-
 drivers/firmware/arm_scmi/notify.h            |    8 +-
 drivers/firmware/arm_scmi/protocols.h         |   17 +
 .../firmware/arm_scmi/scmi_system_telemetry.c | 1751 +++++++
 drivers/firmware/arm_scmi/telemetry.c         | 4523 +++++++++++++++++
 include/linux/scmi_protocol.h                 |  266 +-
 include/trace/events/scmi.h                   |   45 +
 include/uapi/linux/scmi.h                     |  522 ++
 tools/testing/scmi/Makefile                   |   25 +
 tools/testing/scmi/stlm.c                     | 1635 ++++++
 tools/testing/scmi/stlm_decode.c              |  252 +
 tools/testing/scmi/stlm_decode.h              |    7 +
 tools/testing/selftests/arm64/Makefile        |    2 +-
 tools/testing/selftests/arm64/scmi/Makefile   |   12 +
 tools/testing/selftests/arm64/scmi/config     |    2 +
 .../arm64/scmi/test_scmi_telemetry_uapi.c     | 1810 +++++++
 26 files changed, 11500 insertions(+), 61 deletions(-)
 create mode 100644 Documentation/userspace-api/stlm.rst
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

