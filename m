Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794513382;
	b=bxHNFK9jd/73TVBxDJkqLanozQ7FQbKaFJeUcOFe2VAxOwH5+NtVNlcu7xNQUpIoVMbl
	 8cEP9+NlkPGXp+Odxajg8OWAUGahWxqsvUXmaS2AiCK6nr1Yx2xNF6pPGWtUeoakUZa71
	 zr/wF3P1qXZsgT8tcquXXNGSo9DibQUKwQtvLf38jLLO0D3lO/jkxPx1Buf2ORDC41W8X
	 r682LBs3J4IVPpayuXVV1O2gsTTIiU4FNA5yEhXItE89jgwThGor+oLjwrq1OpG9RTk+/
	 gErHF7eSK4cUI0Nus0Lhb8F47WZHhkCkPHxu403eQJWiIkxd0fmP1rVOWqHLvb3PK1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794513382;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=dy7J2cqt4EEbhgyUkhhB/eUew1aRMhzOU6Itpm1/KVM=;
	b=sZ5Yh+073HsQy45fAb6K/1JCAa9U10BUA6GhNpTqdU1IB7/JppCQZBBMB9Fzzk+QMtY9
	 +acR1KtpUWsLXWcMYc2YDv1WnY1TdiYdvPrMB0yuZeGJw+9bXwoJCcLcrLOHneiMBzjSH
	 0LcGDKJ987yY9NHOSkq+lC5NnQo94EwpMkQbLJt54DpQJsS5q3bscnlVrMxmyE+qYsYm1
	 raZ9AV6bq96Mzb3Umf6AoGNq7lH4eJW5mLfjBFPEa/qNtR6ztW+ikN/labufhujbRmwc2
	 6NK8QEx48HOhJan9RGUHRRF5CJgSRF84nTXXD7W63gn6gaBEm/aDeWHiPSgTy7xb73w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=eP3Lmg48;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA08606A31C;
	Thu, 12 Nov 2026 19:56:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FA08606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=eP3Lmg48
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A540A339;
	Thu, 12 Nov 2026 11:56:18 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4216A3F632;
	Thu, 12 Nov 2026 11:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794513381; bh=MSLq4lZa+23a127MIJrZJzb7fcJCl4lsinfpBlFpp+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eP3Lmg48Ypld/7C31ui42awQpCJDOfAsfarhWTq9s+PV9zm8lGkhvmKby+wskzJXX
	 lsrCENHkmeQWPeCvlsYrMdy89v5MHnw5d6yo9On8UMikdy6OPQ2m4oOuYSPZSfhiPU
	 Bv9EX+f7Z/nU1dSAWXE7IziRUbNBJ2QxyGl+vt6k=
Date: Thu, 12 Nov 2026 19:56:10 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
	sudeep.holla@kernel.org, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
	philip.radford@arm.com, david@kernel.org,
	souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
	puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 10/35] firmware: arm_scmi: Add Telemetry resources
 enumeration
Message-ID: <avYZ2t_GoT7BN2nU@pluto>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
 <20261109091221.2532706-11-cristian.marussi@arm.com>
 <20261112100145.00000560@oss.qualcomm.com>
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
In-Reply-To: <20261112100145.00000560@oss.qualcomm.com>

On Thu, Nov 12, 2026 at 10:01:45AM -0800, Jonathan Cameron wrote:
> On Mon,  9 Nov 2026 09:11:56 +0000
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Add basic Telemetry allocation and initialization routines, introducing and
> > wiring-up the logic needed to enumerate all the SCMI Telemetry resources
> > optionally using a lazy on-demand scheme: this approach factors in the
> > flexibility needed to minimize the amount of initialization work based on
> > the effective access pattern used by the upper layer ABI.
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> Hi Cristian,
> 
> This stretches across the patch set but first elements related to it are
> in this patch.  How do we handle larger values of de_data_sz?
> 

We dont. This was somethig that was on my todo list initially, but then
I realized that there was NO FW-side plan to actually implement anything
larger than 64bit.

> The spec allows (and it's useful for things like histograms)
> DEs to have an integer multiple of 64 bits for a single element.
> In the shared memory buffer that just ends up with a bunch of matching
> IDs with discovery via the parsing done in this patch.

And I know that the spec allows it, but supporting this possible, but
currently NON-implemented, feature would have added some non trivial
complexity across all the stack to the benefit of no one.

When someone will implement for real such big DE FW-side, the change
will follow and of course there will need to be an ABI change.

Given that I am currently in fact shedding a lot of already supported
and tested features (groups/single_sample/notifs etc etc) to slim down
the series dropping stuff that is indeed not implemented FW side (as we
discussed), and would never be used, I would put this kind of support
for big-data DEs in the same category of future possible work...

This remind me, though, that I wanted to place a check on de_data_sz
so as to bailout with -ENOTSUPP when such data appears with the current
implementation...

> 
> The only (I think) today to dump that from this patch set is
> to use the shmti dump interface.  That's not exactly nice!
> 
> I messed around with (well chatted with an LLM about) a couple of
> options.
> 
> 1. Make the whole stack aware of multi line DEs. So all the requests
>    get to return more data.
> 2. Adding indexing so you can get a multi line DE in multiple calls.
>    That makes the interface for a bulk read a bit odd.  Userspace will
>    have to be cleverer given variable sized elements.
> 
> Given this is a ABI related aspect, needs figuring out sooner rather
> than later I think.
> 

Talking about the ABI, since you mentioned in the other patches:

As of now only the ABI_VERSION IOCTL is 'size-versioned' and there are
flags to indicate supported features (both HW and ABI feats) AND fields
with reserved spare space scattered all around IOCTLs so that it should
be possible to add minor features using spare space and flags without
changing ABI version, up to a certain point of course: if the changes
are too radical a new ABI needs to be introduced and  ABI VERSION will
be bumped.

This seemed an acceptable middle ground to me to avoid the complexity of
having all the IOCTL structs 'size-versioned' and related flexibility that
maybe is unneeded in this case...but I could be wrong (maybe the delayed
future possible work to support >64bit DEs is a good reason to have an
ABI that is more flexibile without the new of breaking changes...)

Beside this I did not find really so many examples of ABIs using full
per-IOCTL size versioning, and given my relative small experience on
this and the lack of feedback till now (beside a lot of chats witth LLMs
:P) I stick with this easier ABI layout.

Thanks,
Cristian

