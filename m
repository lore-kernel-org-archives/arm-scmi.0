Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919402;
	b=RpePDnA4MbpVIVO001nY84w8FpqP1D2DBlJYJGRkXEygtg9o8SfiL5woDNOwcsGHmhwD
	 vO3Ry61wICPAsqg7IgW9oKLhnLl2Uid9aVE6uvyO5FFUaV2uLPeglGPTl3xHMBuoxdKAh
	 mWQcBFr66MjOo1vXlq81vNDOVAnL+wqFVU75nLDGe8ppl1/bQ9oNwsS9Q0WkbsrjfbYbA
	 WKxPmkIsbyRGqHltWSXNpYm303BzODfSM845+qN7X8/LaP5qCBOSNRhR3h9gO0XcuXIYW
	 dD0O9r4p1nkz+qFbI0xpMXvMIbrXuHQcCjQZ3gJ6swv3Uccn78IFnIfGOiFUjrMqDeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919402;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=S2hD3AssaoCe364ORRgKVIvE0aPgBt8GeEIN9bUh1nk=;
	b=4SA9F5Z87u+IZUO137Op9LKnYSMGf+wCuzSkwu1TDpPbz7fJSowUGZ5EiSsnY3RJ4ty6
	 2KYeAAp+d18LVI04b6lnT9uPHE5Iv+cahNNjWC3uIfpKyGRDgGy5dDMX8CyevI8sOoVvP
	 gO6iowixM6IlxNR5SvUg+Ikd2UdtdqxlXREKE/74kQIbccpiyGwrKc/MD9JzKHgI7nopp
	 cMYTt9Hu6NkG9mZrXshvnv/cevu91XnMbPhOALEEYXZRFLc27319JzVlHl5G5UxzAH1R/
	 qLGi9CioKZjPpVSfKjspXhivEwRk7btS3XkVFrAvi7LfkxyoIxcIFV9yZTTKKiKY2WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XcJGzxAA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3226606A32A;
	Tue, 17 Nov 2026 12:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XcJGzxAA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC7B81F000C4;
	Tue, 17 Nov 2026 12:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794919401;
	bh=S2hD3AssaoCe364ORRgKVIvE0aPgBt8GeEIN9bUh1nk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XcJGzxAAmq3rBc5y7Cg4SwluQAraUaH9e7eko9SRwCgUJC1ipJ6Ui3tF8xfNJKQuY
	 JXjG7xKQc6DltAyisTBAR1/6WQkB5Ta1KkzWLy+xa9lbE0+YDT2bVa2V1Y1Cv5GcVa
	 xUws9dVQ/kkkIE0CyMTDo9Hk1J95Yz9auOfEkFALunH8bpzYRSzVnOGi6D69F4JEOA
	 UIyW8JI2TNXz4cqcjS5Ti0p72SOL9T/LV+OguM+cW8/fi1vmUyKsfOI8/jGN+U4l2X
	 yFj9dSgOODHdGoGOcO+sod38YRlcSWclTs9zukx7kUIM+PAngG6Npveha+9qUg1aLs
	 BLTO+PVuuXU9w==
Date: Tue, 17 Nov 2026 12:43:15 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>, arm-scmi@vger.kernel.org,
	linux-doc@vger.kernel.org, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	d-gole@ti.com, jonathan.cameron@oss.qualcomm.com,
	elif.topuz@arm.com, lukasz.luba@arm.com, philip.radford@arm.com,
	david@kernel.org, souvik.chakravarty@arm.com, leitao@kernel.org,
	kas@kernel.org, puranjay@kernel.org, usama.arif@linux.dev,
	kernel-team@meta.com
Subject: Re: [PATCH v15 00/35] Introduce SCMI Telemetry support
Message-ID: <20261117-enchanted-neat-donkey-8393a9@sudeepholla>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109091221.2532706-1-cristian.marussi@arm.com>

On Mon, Nov 09, 2026 at 09:11:46AM +0000, Cristian Marussi wrote:
> Hi all,
> 
> [TLDR Summary]
>  [V15 highlights]
>  - general cleanup and hardening driven by reviews
>  - improved TDCF access routines to minimize lost samples under load
>  - completed ABI docs
> 
>  [V16 TODO]
>   - address any remaining V15 outstanding Sashiko/reviewers issues
> 
> The upcoming SCMI v4.0 specification [0] introduces a new SCMI protocol
> dedicated to System Telemetry.
> 
> In a nutshell, the SCMI Telemetry protocol allows an agent to discover at
> runtime the set of Telemetry Data Events (DEs) available on a specific
> platform and provides the means to configure the set of DEs that a user is
> interested into, while reading them back using the collection method that
> is deeemed more suitable for the usecase at hand. (...amongst the various
> possible collection methods allowed by SCMI specification)
> 
> Without delving into the gory details of the whole SCMI Telemetry protocol
> let's just say that the SCMI platform/server firmware advertises a number
> of Telemetry Data Events, each one identified by a 32bit unique ID, and an
> SCMI agent/client, like Linux, can discover them and read back at will the
> associated data value in a number of ways.
> 
> Data collection is mainly intended to happen on demand via shared memory
> areas exposed by the platform firmware, discovered dynamically via SCMI
> Telemetry and accessed by Linux on-demand, but some DE can also be reported
> via SCMI Notifications asynchronous messages or via direct dedicated
> FastChannels (another kind of SCMI memory based access): all of this
> underlying mechanism is anyway hidden to the user since it is mediated by
> the kernel driver which will return the proper data value when queried.
> 
> Anyway, the set of well-known architected DE IDs defined by the spec is
> limited to a dozen IDs, which means that the vast majority of DE IDs are
> customizable per-platform: as a consequence, though, the same ID, say
> '0x1234', could represent completely different things on different systems.
> 
> Precise definitions and semantic of such custom Data Event IDs are out of
> the scope of the SCMI Telemetry specification and of this implementation:
> they are supposed to be provided using some kind of JSON-like description
> file that will have to be consumed by a userspace tool which would be
> finally in charge of making sense of the set of available DEs.
> 
> IOW, in turn, this means that even though the DEs enumerated via SCMI come
> with some sort of topological and qualitative description provided by the
> protocol (like unit of measurements, name, topology info etc), kernel-wise
> we CANNOT be completely sure of "what is what" without being fed-back some
> sort of information about the DEs by the afore mentioned userspace tool.
> 
> For these reasons, currently this series does NOT attempt to register any
> of these DEs with any of the usual in-kernel subsystems (like HWMON, IIO,
> PERF etc), simply because we cannot be sure which DE is suitable, or even
> desirable, for a given subsystem. This also means there are NO in-kernel
> users of these Telemetry data events as of now.
> 
> So, while we do not exclude, for the future, to feed/register some of the
> discovered DEs to/with some of the above mentioned Kernel subsystems, as
> of now we have ONLY modeled a custom userspace API to make SCMI Telemetry
> available to userspace tools.
> 
> With V5 we adopted a pure chardev/IOCTL ABI approach, refining the IOCTL
> based interface already present with the previous FS-based ABI.
> 
> INTERFACES
> 
> For each discovered SCMI Instance a character device named tlm_<N> is
> created under /dev/scmi/ subtree.
> 
> The IOCTL interface described at 'include/uapi/linux/scmi.h' is made
> available to enumerate and configure Telemetry resources: Telemetry data
> can be collected using a few different IOCTls, depending on the required
> granularity.
> 
> Alternatively it is possible to obtain a list of the file descriptors
> referencing directly the underlying SCMI Telemetry SHMTI memory areas and
> implement in user space an SCMI Telemetry parser accessing directly the
> SHMTI, while staying in compliance with the SCMI TDCF format.
> 
> NOTE THAT from v3 onwards the firmware interface level NOW supports ONLY
> the latest SCMI v4.0 specification [0].
> 
> Based on V7.4-rc2, tested on an emulated setup and AGI HW.
> 
> This series is available also at [1].
> 
> If you still reading...any feedback welcome :P
> 
> Thanks,
> Cristian
> 
> ---
> v14 --> v15
>  - rebased on v7.4-rc2
>  - [STLM]
>    + add lazy enumeration
>    + add des/info cmdline options
>    + add missing SIGTERM handling
>  - [SYS/TLM]
>    + harden/simplify batch helpers
>    + fix shmti mmap size check to include offset
>    + simplify session_unsubscribe cleanup on exit/unbind
>    + added missing kref.h include
>    + expose TLM EVENTS capabilities ONLY IF CONFIG_EVENTFD
>    + mmap: improved check to avoid WRITE/EXEC mapping
>    + reject non zero vm_pgoff
>    + drop usage of guard(srcu) to avoid races with put_device
>  - [TLM]
>    + avoid genration counter reset on TLM RESET
>    + add an overflow check on NOTIF payload lines parsing
>    + convert to Linux errno before building notification report
>    + use better startm/endm initial markers in tdcf_de_payld_get
>    + trigger resource enumeration also on de_data_read
>    + skip unitialized FCs on reads and return -EPROTO
>    + check FC size on enumeration (big enough to hold TS ?)
>    + introduce localized single DE snapshot on single DE data read
>    + widen tde->mtx locking in msg_payld_process
>    + refactor msg_payld_process
>    + unlink BLK_TS on DE disable
>    + update linked BLK_TS on enable
>    + update TDE location ONLY after successfull linked lines processing
>    + trigger resource enumeration on state_get
>    + trigger resource enumeration on colletion configure only for groups
>    + widen tde->mtx locking section on state_set
>    + refactor UUID/BLK_TS lines processing in enable
>    + introduce BLK_TS localized snapshot during enable
>    + check line type at de_offs
>    + sanitize requested mode on collection conf
>    + use snapshots to collect UUIDs during full scans
>    + stop tracking UUIDs lines singularly (useless overhead)
>    + use UUIDs line hashing for lookup
>    + use snapshots to track and collect BLK_TS during full scan bulk reads
>    + account for tstamped TDE during discovery
>    + correct SHMTI overflow off-by-one
>    + rework TDE cache hit/miss logic
>    + introduce snapshots on full scan reads
>    + validate DE location also on SCAN_UPDATE
>    + fix TDCF prologue/epilogue endianity struct definitions
>    + rework SHMTI initialization and allocation
>    + add snapshot suppport data structures
>    + added alignment checks on SHMTII length size
>    + fixed error string formatting
>    + warn if less than expected SHMTIs are enumerated
>    + improve memory area sanity checks
>    + added missing initialization of intrvs->grp_id
>    + bailout from group initialization when NO DEs were found
>    + better handling of error path on groups init
>    + drop usage of devres for FC iomapping
>    + trigger full enumeration of DE lookups
>    + new IS_TDE_TS_ macro helpers
>    + add a dedicated scmi_telemetry_free_tdes_add helper
>    + dropping needless __must_check
>    + flag as fully enumerated only when ALL declared des were found
>    + reworked error path in scmi_allocate_pending_event_handler
>    + hardened core iterator parsing of multi-part reply
> 

You can drop the change log for earlier versions(just last 3 should suffice)
in the future postings and add links to them instead if anyone is really
interested to go back. Don't worry about older links now, just do that
in the future.

[...]

As mentioned in one of the thread, this is quite big series with not
much feedback on the UABI part apart for Jonathan. So we need to take
an approach of merging this in smaller parts initially.

> Cristian Marussi (34):
>   firmware: arm_scmi: Harden iterators state parsing

The above looks good.

>   firmware: arm_scmi: Add new SCMIv4.0 error codes definitions
>   firmware: arm_scmi: Introduce a dedicated SCMI Errors header

As pointed out, better to swap the order of above 2.

>   firmware: arm_scmi: Allow registration of unknown-size events/reports
>   firmware: arm_scmi: Refactor __scmi_event_handler_get_ops helper
>   firmware: arm_scmi: Introduce protocol instance notifiers

All the above 3 refactor the code, so better to fix the Sashiko reported
bugs around them before go for such additions/refactoring IMO.

>   dt-bindings: firmware: arm,scmi: Add support for telemetry protocol
>   include: trace: Add Telemetry trace events
>   firmware: arm_scmi: Add Telemetry basic attributes enumeration
>   firmware: arm_scmi: Add Telemetry resources enumeration
>   firmware: arm_scmi: Add Telemetry groups initialization
>   firmware: arm_scmi: Add Telemetry update intervals enumeration
>   firmware: arm_scmi: Add Telemetry SHMTI areas enumeration
>   firmware: arm_scmi: Add Telemetry TDCF areas parsing support
>   firmware: arm_scmi: Add Telemetry TDCF parsing for BLK_TS lines
>   firmware: arm_scmi: Add Telemetry TDCF parsing for UUID lines
>   firmware: arm_scmi: Add Telemetry configuration operations
>   firmware: arm_scmi: Add Telemetry DataEvent read capabilities
>   firmware: arm_scmi: Add Telemetry reset logic
>   firmware: arm_scmi: Add Telemetry notification support
>   firmware: arm_scmi: Add Telemetry boot-on support
>   firmware: arm-scmi: Add Telemetry generic event support
>   firmware: arm_scmi: Add Telemetry generation counter event

I am thinking of initially merging upto the above commit initially so that
no user ABI is established. I haven't done the thorough review yet.

-- 
Regards,
Sudeep
