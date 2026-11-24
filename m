Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549797;
	b=5iQB6PIAlq3hRyjcRuduui3FnFC2F2pYwq7LPbCCWD5y7V1OLyoctpOW9V7+TVFpldZZ
	 upqejziaSvnEqR+91/WOu6wY15EmE4H8G+huPf3gzIX6jsGcAUupRS5AvoMHSxN1ibsBl
	 YYYVAzcUQX+9Q4ZD0QYlG8uR+wGz4MPa0eamA9FXX88jGVequJthuhJAF9LvONIMqy6Kc
	 5V78KTyFrBiiGfAHMytGw85EUOGvKC90Dkzgue/nK3G+4qMZ4REpGi+r0PVlkiiYpNOQu
	 CoE8+FCx+rS08yploPprFn9ismMH3yA6S9heTeBDLK+ja1IljIavO9k82Eoy2rDbFfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549797;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=EpfWisM2zqWp3GX3Cisf0GLRCKhjfT8Szly5idDxuzM=;
	b=G6NPOZTupmbZ4kEcWqHFAGsLlRpk56j/6vEb7CCq1CHVlSVvVkeohIwGvw4PYyabD3xv
	 Fz1D+EqherxEWS2iC9DFbBfwUlb81OOrnyISAnV6nWA6Url0FNlj3GMfRcpMxQLwDmVxa
	 tACQsZuVb2tRmMVklmkB4JIJXHAxCXxCNknOmGG36q+1oETB5GduPTherj3ELZB6/olL2
	 et9/hIN/1GLoWSSVVAi1OVQaeYdteRYwFpWDX/Y+ZdNZVyOKrQImW2ZUc9YHzYFR1JuT1
	 fnfZjkgBa5p2TSOVBlFcycfmZPLyhRwNg4FrX8vW8mK5/Ao5m/5OeBCeazW+Bnj5x4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=eyxTnvKk;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A23D4606A31E;
	Tue, 24 Nov 2026 19:49:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A23D4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=eyxTnvKk
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7600339;
	Tue, 24 Nov 2026 11:49:52 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 95DD03F763;
	Tue, 24 Nov 2026 11:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795549795; bh=Zufk9DdD68SIlWv7mI3ESitb3efgrWc/TBQ/qv4nJaU=;
	h=From:To:Cc:Subject:Date:From;
	b=eyxTnvKk9TBEUc2Gbm0irzzcD27r3CYSIuTxU7zedQRRpsCRupcWDipg6Ifm5I2kr
	 64KEW7gQyXdVPwVqGwAveaOKjAjJeuzSNRGMSzZ8lwu0EoNPe8ssXWbvGyPEpzPcLc
	 ISLcQHAyC1wUEN4hZr8tNajlHeyu4uNiWoXggDKA=
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
Subject: [PATCH v17 00/34] Introduce SCMI Telemetry support
Date: Tue, 24 Nov 2026 19:48:06 +0000
Message-ID: <20261124194841.1147072-1-cristian.marussi@arm.com>
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
 [V17 highlights]
 - addressed more Sashiko reports
 - added a few more SCMI Core fixes that ease per-protocol logic:
   + added more consistency in the SCMI Core Iterators machinery
   + added centralized check (SCMI Core) for truncated reply
     + Reworked some SCM Clock behaviour to allow for truncated checks
   + SCMI protocol core initialization refactor and fixes

 [V18 TODO]
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

Based on V7.4-rc4, tested on an emulated setup and AGI HW.

This series is available also at [1].

If you still reading...any feedback welcome :P

Thanks,
Cristian

---
v15 --> v17
 - rebased on v7.4-rc4
 - [SYS/TLM]
   + return OPNOTSUPP on un-implemented IOCTLs instead of -ENOTTY
   + use proper IS_GROUP macros to discard GROUP request across IOCTLs
 - [TLM]
   + fix leak and NULL deref on exit path
   + fix shmti_oveflow WITH LEN
   + check liveness on de_snapshot
   + remove spurious des_sample and notif structure and logic
   + add a comment on bulk read reporting on failures
   + return ENODATA when TLM off instead of -EINVAL
   + rename update_interval_ms to ename update_interval
   + use NULL not zero for pointers
   + fix liveness blkts_snapshot
   + fix tde_state_set_resp handling of INVALISD SHMTI_ID
   + refactor state_set and reject group state change
   + invalidate TDE cache also on enable
   + allow SHMTI_INVALID as bts_offs when DE does NOT use BLK_TS
   + fix err init in blkts_snapshot
   + add comment on LINE_LENGTH_BYTES upper bound
   + remove spurious return
   + removed unused node_lst
   + check TDE TS type, update from last_rate
   + check if used_qwords > avail_qwords early in tdcf_line_parse
   + add __iomem eplg annotation
   + fix shmti_overflow and make it return the line length
   + remove WARN_ON(fc_support), better dev_
   + log error on malformed line data
   + use %pa for phys_addr
   + skip LIST_SHMTI with num_shmti = 0
   + fix %pa and spell USPECIFIED
   + avoid FIELD_PREP check on size for exp
   + remove unused de.ts_rate
   + enaming discovered to enumerated
   + rework list_add to fcs_des
   + use list_del_init for free_des/fcs_des list removals
   + avoid attaching a drevres tdes_cleanup to enumeration
   + consider expected_size when reset_rx_to_max
   + add an unrelated fix to make SCMI clock attributes deterministic
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
[1]: https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git/log/?h=scmi_telemetry_ng_V17


Cristian Marussi (33):
  firmware: arm_scmi: Harden iterators state parsing
  [RFC] firmware: arm_scmi: Additional iterators consistency checks
  firmware: arm_scmi: Make Clock attributes size deterministic
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
  firmware: arm_scmi: Invoke proper protocol cleanup on failure
  firmware: arm_scmi: Refactor protocol allocation
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
 drivers/firmware/arm_scmi/clock.c             |   12 +-
 drivers/firmware/arm_scmi/common.h            |   41 +-
 drivers/firmware/arm_scmi/driver.c            |  158 +-
 drivers/firmware/arm_scmi/errors.h            |   56 +
 drivers/firmware/arm_scmi/notify.c            |  102 +-
 drivers/firmware/arm_scmi/notify.h            |    8 +-
 drivers/firmware/arm_scmi/protocols.h         |   22 +
 drivers/firmware/arm_scmi/raw_mode.c          |    1 +
 .../firmware/arm_scmi/scmi_system_telemetry.c | 1376 ++++++
 drivers/firmware/arm_scmi/telemetry.c         | 4352 +++++++++++++++++
 include/linux/scmi_protocol.h                 |  200 +-
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
 30 files changed, 11477 insertions(+), 113 deletions(-)
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

