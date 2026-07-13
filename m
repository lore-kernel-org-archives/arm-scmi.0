Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EBD13546C5;
	Mon, 13 Jul 2026 22:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783983285; cv=none; b=BDhqXxBuSd2Atg4c8F5hN8Xhv3ypIfoS91jgSUaMAzif3/25Kf+NJe/XdDpHxAJf5V8VUZSs8XJbM46eufKPBgNWmPMFxQsenUaZ1vWjOK/6bgPDOcfETLnfR2CUKeWKX9iuJ/sHYY4CTYXgMwwWd5QsKN7sbWjgzUkxAvO4mG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783983285; c=relaxed/simple;
	bh=7TJNGr2v2ZA8mqosZnmTYS6Mnmq2SrK/xW5d6dqKIKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QMROt2TINLVCX4vUAJxNkEQdsdKqaJTTHRtHROKitNqk5SjJmIrS+KprgGPJ5god964dpgTbxFSd4qasqaJVo8qjqm0oK+qYyYXS6+BQ2+aLKqtQ0bQ+0TfePC7paIIic4Rj1oiX0/nZrzKdObDLeKgjUJoae8ox7UK3tUtL0zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=g4Jveoab; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="g4Jveoab"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F29F2F;
	Mon, 13 Jul 2026 15:54:36 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00A293F7B4;
	Mon, 13 Jul 2026 15:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783983280; bh=7TJNGr2v2ZA8mqosZnmTYS6Mnmq2SrK/xW5d6dqKIKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g4JveoabcjUqtzM0ZbhKLpIWeX7EYIGGR6wswI6LuGOhdM/Lpf0YCF9RH9+K5RGY1
	 FEyeii2duF/l5pFmKBNV+gZSa4V82pYc53aIwQ5bvVRHNUVbemGBar23KdZt2/fPTw
	 bQtsR0RMk09kaUGGbki3k//fUm0toDtFatXBA0d0=
Date: Mon, 13 Jul 2026 23:54:29 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Fayssal Benmlih <Fayssal.Benmlih@arm.com>
Cc: Cristian Marussi <Cristian.Marussi@arm.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"brauner@kernel.org" <brauner@kernel.org>,
	"d-gole@ti.com" <d-gole@ti.com>,
	"david@kernel.org" <david@kernel.org>,
	Elif Topuz <Elif.Topuz@arm.com>,
	"etienne.carriere@st.com" <etienne.carriere@st.com>,
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>,
	"james.quinlan@broadcom.com" <james.quinlan@broadcom.com>,
	"jic23@kernel.org" <jic23@kernel.org>,
	"kas@kernel.org" <kas@kernel.org>,
	"kernel-team@meta.com" <kernel-team@meta.com>,
	"leitao@kernel.org" <leitao@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Lukasz Luba <Lukasz.Luba@arm.com>,
	"michal.simek@amd.com" <michal.simek@amd.com>,
	"peng.fan@oss.nxp.com" <peng.fan@oss.nxp.com>,
	Philip Radford <Philip.Radford@arm.com>,
	"puranjay@kernel.org" <puranjay@kernel.org>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	"sudeep.holla@kernel.org" <sudeep.holla@kernel.org>,
	"usama.arif@linux.dev" <usama.arif@linux.dev>,
	"vincent.guittot@linaro.org" <vincent.guittot@linaro.org>
Subject: Re: [PATCH v5 00/23] Introduce SCMI Telemetry support
Message-ID: <alVsb7IxDAyJyxZe@pluto>
References: <DB9PR08MB86516141C5970B23D7340510FFFE2@DB9PR08MB8651.eurprd08.prod.outlook.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DB9PR08MB86516141C5970B23D7340510FFFE2@DB9PR08MB8651.eurprd08.prod.outlook.com>

On Thu, Jul 09, 2026 at 03:46:23AM +0100, Fayssal Benmlih wrote:
>    Overall, v5 is a good direction: dropping the filesystem ABI for a
>    chardev/ioctl ABI is simpler, easier to version, and more appropriate
>    for high-rate telemetry. The split between SCMI protocol support, UAPI,

Hi Fayçal,

in fact this same IOCTLs based interface (even if more rough) was also present in
the defunct FS approach, attached to the special 'control' files...nothing new
really...but a lot of rework and testing needed for sure...

>    driver, docs, and test tool is also much cleaner. The main concern is
>    that there are several correctness and usability issues that should be
>    fixed before merge.

... of course, since this is the first ever posting with the IOCTLs being
the main and only ABI, it was never meant to be straight away ready for merge,
as I mentioned in the cover-letter there are a few TBD still pending and a
lot of cleanups as reported by the LLM reviews too... Sashiko is one great
example of existing LLM reviewing Kernel patches...

...some of these points are pretty much valid (also Sashiko has a few more
complaints) and I will take care of those....but some other are compeletely
OR slightly off, I will go through those in the following...

> 
>    Must-Fix Issues
>      * scmi_tlm_to_uapi_base_info() uses out->flags |= ... on an
>        uninitialized local struct scmi_tlm_base_info base; this can leak
>        garbage flags. Use out->flags = ... or zero-initialize base.
>      * scmi_tlm_update_interval.exp is documented and used as signed, but
>        the UAPI declares it as __u32. It should be __s32, otherwise
>        examples like exp = -3 are ABI-broken.
>      * Group bounds checks use grp_id > num_groups; they should use grp_id
>        >= num_groups to avoid out-of-bounds access.
>      * Avoid casting UAPI integer fields to bool *, especially __u32
>        enable/t_enable in scmi_tlm_de_config. Use local bool enable =
>        !!tcfg.enable; variables and copy normalized values back explicitly
>        if needed.
>      * Array sizes from userspace need overflow and allocation hardening:
>        use array_size(), kvmalloc_array(), and clear max limits for
>        num_des, num_samples, num_grps, etc.

I really dont understand this, since the user allocates the buffers, that he
then provides via a __u64 ptr, and such allocation happens based on the maximum
number of items the platform has declared to exist (like num_des) so if the user
itself had lied or mistakenly provided a smaller buffer then declared, that is a
user problem that will trapped and result in a SIGSEGV (or a userspace malloc
corruption)...here a specific reference to the actual code causing the supposed
issue would have helped...

>      * SCMI_TLM_GET_SHMTI_LIST loops over the user-provided count after
>        only checking it is not too small; if it is too large it can read
>        beyond in->shmtis[]. Loop over the actual firmware count.

Yes I definitely loop mistakenly on the wrong variable, BUT the missing
check on the too-large condition is an explicit design decision so that
userspace can optionally use the same common big buffer as a scratch
buffer to collect multiple kind of enumeration data...but of course the
loop must happen on the what is available in system NOT on what the user
has passed in...

>      * The mmap path needs tighter validation: reject oversized mappings,
>        handle mmap offsets deliberately, set appropriate VMA flags, and
>        document the lifetime/security model for exposed SHMTI memory.

Beside a bit of hardening, I think here the only missing part is documenting
that you get direct RO access to an SCMI Telemetry area and that you are on
your own in how to parse that...format and lifetime is as specified in SCMIv4.0

Cannot do any deliberate offset handling really...any neeed offset is
dynamically discovered and communicated at runtime via SCMI_TLM_GET_SHMTI_LIST
(offset is rarely different than 0, ONLY if FW has NOT exposed such areas as
page aligned)

..probably worth security wise to check that FW shared areas are
properly page aligned (to the max 64k) and that nothing crititical lays
around when not aligned...so that I dont accidentally expose some other
bits of FW...but I cannot really check so much here from kernel Point of
view...mmm...maybe that the surrounding bytes are zeroed by FW ?

> 
>    Design Feedback
>      * No ABI version/capability ioctl. GET_INFO gives protocol/platform
>        info, but userspace also needs driver ABI version and supported
>        ioctl feature bits.
>      * Enumeration is awkward. List ioctls should support a clear two-call
>        pattern: call with count 0 to get required count, allocate, call
>        again. Returning EINVAL for “buffer too small” is not very
>        ergonomic.

Well the only reason I have NOT implemented this idiom is that all of
this enumeration data is basically static RO (at least within the same
boot), so you can know very well in advance how many elements you have
by calling upfront just one single time SCMI_TLM_GET_INFO, instead of
having to issue twice each IOCTL to know how big the input buffer should
be...but I can implement also this idiomatic form in v6 of course as an
alternative mechanism if we want to support the standard/classic idiom...
...it will be certainly less performant by duplicating all IOCTLs calls x 2...

I will probably rework SCMI_TLM_GET_INFO, to be the new SCMI_TLM_GET_ABI_INFO
including version/capability/resource info IOCTLs...so that you can get the ABI
version, lookup feature bits and get the numebr of resources (like it is
now..to size the requests...)

>      * No generation counter yet. Userspace needs to detect
>        config/resource changes between discovery and read. This should
>        probably land with the first ABI.

Yes that is NOT in this version, but it is definitely planned for this
series: there will be a way to read and more importantly some poll
support based on eventfd.

>      * Global config is dangerous. SET_CFG, SET_DE_CFG, and
>        SET_ALL_CFG mutate shared firmware state. Multiple users can race
>        or disrupt each other. Consider documenting ownership semantics,
>        adding locking/session model, or exposing read-only access
>        separately.

Yes, this is the same as in the FS approach, multiple reader and writers
can coexist BUT the Kernel does NOT mediate concurrent configuration
attempts, last writer wins: kernel only guarantes serialization when
multiple configs are written...but anyway last wins.

>      * SET_ALL_CFG is not atomic. If configuring all DEs fails midway,
>        userspace gets partial state. Either make that explicit, add
>        rollback/best-effort reporting, or prefer batched config with
>        per-item status.

Mmm...if SET_ALL_CFG fails midway, an error is reported and the
subsequent GET_ALL_CFG will return the current state of 'ALL':
i.e. True if all enabled, False if any is disabled...

You can anyway lookup each single DE state subsequently.

I could implement an all or nothing with rollback but I am not sure the
complication in code is worth: on the other side I was thinking too about
the optional batched config as mentioned as a way to speed up multiple
configs mostly...

>      * No event/poll model. For telemetry, userspace may want
>        poll()/blocking reads/notification-driven collection rather than
>        repeated synchronous ioctls.

Yes that is the future plan and most of the internal support is already in
place, I have not planned any dedicated IOCTL till now (similarly there was
no dedicated special file in the old FS approach) since, for such streaming
poll model to be feasible, SCMI Telemetry notifications are needed, but they
are optional by the spec and currently NOT planned FW side AFAIK... so I
lowered this in priority and delayed to a future extensions given the
increasingly tight timeline that we have. (even though I can devel and
plan against my emulation setup..)

I would like anyway to add a generic event IOCTL that allows the user to
register a custom eventfd for a specific event to be monitored....first
event being the generation counter change AND second the update
notification for event/poll telemetry ocnsumption....

>      * Timestamp usability is underspecified. Userspace needs clear
>        timestamp domain, rate conversion, wrap behavior, and correlation
>        to Linux clocks.

All of the timestamps are originated by the platform and specified by
the SCMI spec: Kernel does NOT mediate/correct/trim anything here.

It will have to be documented better of course, but all you get is a 64
bit tinestamp and the clock rate in KhZ that has been used to generate
this specific timestamp for this DE..

>      * Raw SHMTI mmap is powerful but has risks. It needs very clear
>        lifetime, permissions, cacheability, offset/length, stale-data, and
>        security documentation.

>      * Batch APIs lack per-sample status. In BATCH_READ, one bad DE
>        currently appears to fail the whole request. For tools, per-entry
>        status is much better.

Can add status.

>      * Text read() plus binary ioctls feels split-brain. Either document
>        read() as debug/convenience only, or remove it from the stable
>        interface and keep the ABI purely binary; no need for two different
>        user interfaces with different semantics.

This was to try to supply some form of tool-independent human readable access
...indeed I was also tempted to re-introduce a limited form of proper SysFs for
global configs like update interval or global tlm_enable...(but not sure
about this really...)

>      * Rename the generic #define SCMI 0xF1 to something scoped like
>        SCMI_TLM_IOCTL_MAGIC; exporting a broad SCMImacro in UAPI is
>        collision-prone.
>      * Add .compat_ioctl = compat_ptr_ioctl or equivalent, and document
>        that all structs are 32/64-bit compatible. The __u64user pointers
>        help, but compat behavior should be explicit.
>      * Clarify concurrency semantics: what happens when two processes
>        enable/disable DEs, change intervals, or read while config changes?
>        A generation counter/reset ioctl, already listed as TODO, should
>        probably be part of the first ABI version.

No kernel mediation on this, ONLY a generation counter to spot unexpected
changes.

>      * Define permissions. Configuration ioctls mutate global firmware
>        telemetry state, so access control/default device mode/udev
>        expectations should be documented.
> 

As of now, no policying, whoever is privileged enough to write to the
device can configure the system, last writer wins.
Being now all of this based on a bunch of single devices (one per instance),
it could be more feasible to enable some sort of optional exclusive open mode
for the first privileged user to get hold of the device...I'll reason about it.

>    Suggested additions before ABI freeze
>      * SCMI_TLM_GET_ABI_INFO
>      * SCMI_TLM_GET_GENERATION
>      * SCMI_TLM_RESET
>      * batched GET/SET_DE_CFG with per-entry status
>      * pollable notification/event support, if telemetry notifications are
>        meaningful to userspace
>      * optional read-only open mode or permission model for non-mutating
>        tools
> 
>    Usability / Docs
>      * The docs need more precise examples for two-call enumeration, error
>        handling, batch reads, and mmap cleanup/close semantics.

Yes that was minimal on purpose, given this was the first shot and a lot
can still change...

>      * Fix typos before reposting: “Systemn”, “dwscriptors”, “istance”,
>        “udpated”, “andc”, “A IOCTL”.
>      * The sample tool should either be promoted into a real
>        selftest-style utility or clearly kept out of the upstreamable set
>        until it has robust argument parsing and error reporting.
> 

Well...the tool as of now if a draft thing for testing...it is indeed
marked as RFC (and declared in a crappy state)...so it is clear NOT for
upstream as it is: as I mentioned in the commit itself it is meant to be
improved and used for testing in the future...not for upstream in this
state of course...

...BUT even in this state can be used to simply exercise most of the
IOCTL quickly...so that was the reason I included it as  RFC.

Thanks,
Cristian
