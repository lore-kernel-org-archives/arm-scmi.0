Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE4322EDD62;
	Wed, 15 Apr 2026 14:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776262608; cv=none; b=djgjGyOjvnj8zgXPN+71am/mBiZKgcCaY6sS0hhjbTHlWCg6QXz6CCciy6zNaYqoQd6lRqudMu9Vmf19TFIQMTfYjrLvHm0w9cfpzedUVbHQ5k2Ft3xGRqm6hpk2zqfrbEeVX1pNI8PWEkBNtuBBTxIvKRogEXqZxCLtPv8juU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776262608; c=relaxed/simple;
	bh=Y495LKC7QZjJJKt3csqShZ3sbYQZlDhisOEOMKiGnWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oVn68JOvVZ9r701WnBps1uYtZZQ8bh76fYi9Lgd8mno7nKf1VF4aEuPlDNS6A9SS2YQar3PXbfnd48SVS/53jHGWzFwdpl/SaUc2kQzsgPdOb6oUWHsaT28R3sxMCFTc32tz51tyBQPZhKp5ekkZQCdLQFESB0vFAUcoV8POKeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=V4DaRXyy; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="V4DaRXyy"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7EF3204C;
	Wed, 15 Apr 2026 07:16:39 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 63E483F7D8;
	Wed, 15 Apr 2026 07:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776262605; bh=Y495LKC7QZjJJKt3csqShZ3sbYQZlDhisOEOMKiGnWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V4DaRXyy+nuIbQteUVBRVcSI4pHMFVWsT45NHcbHIAJjM+M99EPhsLFZYdycn7LVq
	 hvyo6srqmPJgtlLPy1r1FPGeSraY+bzPXPF1wJsu/csWTPcUkvUIL5LxdoIj6poiPb
	 5xEYz5wF8waATrwecwa4M9rvFX89dwJ05MTB5clY=
Date: Wed, 15 Apr 2026 15:16:35 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
	"linux-kernel@vger.kernel.org Sudeep Holla" <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org
Subject: Re: Probe function registering another driver [Was: Re: [GIT PULL]
 Driver core changes for 7.0-rc1]
Message-ID: <ad-dwwAGBtfcM4m7@pluto>
References: <DGCIBIK52SF8.3FVF3GR1R2302@kernel.org>
 <CAHk-=wgJ_L1C=HjcYJotg_zrZEmiLFJaoic+PWthjuQrutrfJw@mail.gmail.com>
 <ad6IJwpp5AA0-fAW@monoceros>
 <DHT95ARBC9W8.37Z54YM70UCT2@kernel.org>
 <ad9cglZCwtsVsGmq@monoceros>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad9cglZCwtsVsGmq@monoceros>

On Wed, Apr 15, 2026 at 11:48:15AM +0200, Uwe Kleine-König wrote:
> Hello Danilo,
> 
> [expanded Cc: a bit for the affected driver]
> 

Hi,

> On Wed, Apr 15, 2026 at 01:04:47AM +0200, Danilo Krummrich wrote:
> > On Tue Apr 14, 2026 at 8:39 PM CEST, Uwe Kleine-König wrote:
> > > does that mean that there is a driver involved that somehow violates driver
> > > core assumptions and should be fixed even without the consistent locking?
> > 

[snip]
 
> Thanks for the patch, indeed it creates a lockdep splat on my machine:
> 
> [    2.151192] optee: probing for conduit method.
> [    2.195336] optee: revision 4.9
> [    2.203597] optee: Asynchronous notifications enabled
> [    2.203937] optee: dynamic shared memory is enabled
> [    2.218444]
> [    2.218466] ============================================
> [    2.218474] WARNING: possible recursive locking detected
> [    2.218484] 7.0.0-dirty #32 Tainted: G        W
> [    2.218496] --------------------------------------------
> [    2.218500] swapper/0/1 is trying to acquire lock:
> [    2.218510] c2035cb4 (dev->mutex#3){+.+.}-{4:4}, at: __driver_attach+0x0/0x270
> [    2.218565]
> [    2.218565] but task is already holding lock:
> [    2.218570] c2035cb4 (dev->mutex#3){+.+.}-{4:4}, at: __driver_attach+0x130/0x270
> [    2.218601]
> [    2.218601] other info that might help us debug this:
> [    2.218607]  Possible unsafe locking scenario:
> [    2.218607]
> [    2.218611]        CPU0
> [    2.218614]        ----
> [    2.218617]   lock(dev->mutex#3);
> [    2.218631]   lock(dev->mutex#3);
> [    2.218643]
> [    2.218643]  *** DEADLOCK ***
> [    2.218643]
> [    2.218647]  May be due to missing lock nesting notation
> [    2.218647]
> [    2.218651] 2 locks held by swapper/0/1:
> [    2.218659]  #0: c2035cb4 (dev->mutex#3){+.+.}-{4:4}, at: __driver_attach+0x130/0x270
> [    2.218693]  #1: c2690cb4 (dev->mutex#59){+.+.}-{4:4}, at: __device_attach+0x34/0x200
> [    2.218728]
> [    2.218728] stack backtrace:
> [    2.218738] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W           7.0.0-dirty #32 PREEMPT
> [    2.218757] Tainted: [W]=WARN
> [    2.218762] Hardware name: STM32 (Device Tree Support)
> [    2.218770] Call trace:
> [    2.218780]  unwind_backtrace from show_stack+0x18/0x1c
> [    2.218814]  show_stack from dump_stack_lvl+0x68/0x88
> [    2.218843]  dump_stack_lvl from print_deadlock_bug+0x370/0x380
> [    2.218871]  print_deadlock_bug from __lock_acquire+0x1498/0x1f38
> [    2.218895]  __lock_acquire from lock_acquire+0x138/0x40c
> [    2.218918]  lock_acquire from __driver_attach+0x40/0x270
> [    2.218939]  __driver_attach from bus_for_each_dev+0x78/0xc8
> [    2.218966]  bus_for_each_dev from bus_add_driver+0xe8/0x238
> [    2.218996]  bus_add_driver from driver_register+0x8c/0x140
> [    2.219022]  driver_register from scmi_optee_service_probe+0x150/0x1f0
> [    2.219053]  scmi_optee_service_probe from really_probe+0xe8/0x424
> [    2.219079]  really_probe from __driver_probe_device+0xa4/0x1fc
> [    2.219097]  __driver_probe_device from driver_probe_device+0x3c/0xd8
> [    2.219117]  driver_probe_device from __device_attach_driver+0xbc/0x174
> [    2.219136]  __device_attach_driver from bus_for_each_drv+0x8c/0xe0
> [    2.219160]  bus_for_each_drv from __device_attach+0xb0/0x200
> [    2.219184]  __device_attach from device_initial_probe+0x50/0x6c
> [    2.219203]  device_initial_probe from bus_probe_device+0x2c/0x84
> [    2.219228]  bus_probe_device from device_add+0x618/0x87c
> [    2.219257]  device_add from optee_enumerate_devices+0x210/0x2cc
> [    2.219286]  optee_enumerate_devices from optee_probe+0x8a0/0xa14
> [    2.219311]  optee_probe from platform_probe+0x64/0x98
> [    2.219335]  platform_probe from really_probe+0xe8/0x424
> [    2.219355]  really_probe from __driver_probe_device+0xa4/0x1fc
> [    2.219374]  __driver_probe_device from driver_probe_device+0x3c/0xd8
> [    2.219393]  driver_probe_device from __driver_attach+0x13c/0x270
> [    2.219412]  __driver_attach from bus_for_each_dev+0x78/0xc8
> [    2.219436]  bus_for_each_dev from bus_add_driver+0xe8/0x238
> [    2.219465]  bus_add_driver from driver_register+0x8c/0x140
> [    2.219490]  driver_register from optee_core_init+0x18/0x3c
> [    2.219519]  optee_core_init from do_one_initcall+0x74/0x424
> [    2.219548]  do_one_initcall from kernel_init_freeable+0x2a8/0x328
> [    2.219574]  kernel_init_freeable from kernel_init+0x1c/0x138
> [    2.219599]  kernel_init from ret_from_fork+0x14/0x28
> [    2.219620] Exception stack(0xdd811fb0 to 0xdd811ff8)
> [    2.219634] 1fa0:                                     00000000 00000000 00000000 00000000
> [    2.219648] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    2.219659] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [    2.221255] arm-scmi arm-scmi.0.auto: Using scmi_optee_transport
> [    2.221289] arm-scmi arm-scmi.0.auto: SCMI max-rx-timeout: 30ms / max-msg-size: 104bytes / max-msg: 20
> 
> The anti-pattern here is that scmi_optee_service_probe() calls
> platform_driver_register(&scmi_optee_driver), see
> drivers/firmware/arm_scmi/transports/optee.c.
> 

Yes, this was reported a few weeks ago, and it affects both SCMI Optee AND
Virtio transport drivers, indeed.

It was a bad idea implemented while reworking the SCMI transport layer a
couple of years back.

To address this, I posted an initial RFC a few weeks ago [1], which aimed
at solving the problem above by removing the ugly driver registration
@probe_time machinery, while also generalizing the probe sequence logic
enough to allow for multiple instance probing also for Optee/Virtio
transports, thing that proves to be useful in some testing setup.

While the series at [1] solves/removes the register_at_probe_time issue, it
is still experimental (i.e. buggy/crappy) at generalizing the probing logic
to allow for multiple instances...

Then I was dragged away by something else and the series remains stalled...

I will see if I can improve that RFC series in a sensible way by the end
of the merge window, if not, I will instead post a distinct series to
address/remove the register_at_probe_time issue, by simply re-introducing
the -EPROBE_DEFER logic.

Thanks,
Cristian

[1] https://lore.kernel.org/arm-scmi/abviCkBeX9uzsgxy@pluto/T/#mcfe17ffaac86fb84ef8917782d5e34b8789f4d3f
