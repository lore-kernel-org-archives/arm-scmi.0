Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2774E480327;
	Wed, 15 Jul 2026 15:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784129375; cv=none; b=nToYdZ89wHWur21LQszajE3bdj7yioTIqC7stKQbmyMJiIFiJx5/spcj4QLTIXUCfWkvbLkqn1UJUfIH6FYfzmpK8DQtHj/79KhWSOvaDb0frlgfxqvCLMN2ZzdE/OLupOICyq3so3eLhGaq915lN3Jzcegfquo1iSIYxYNo4mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784129375; c=relaxed/simple;
	bh=0DoSozkuyO2Bq2KoLc6X2figCfBt0AFxngHQNyo5a8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZcuV1bKmOKhp6z05U33KxTz8Q9vM1siX/zzSiOPqQT6ZheZ56p8UAiXsH3usjYcRPrMvDWoUzPTyV+u9rN+b/0HAIu0/9qpYrRDLsQXsJiYOPlppTRxvToD7KyT6gtfD4tQrtylvJ/kL+oh9va2YAri9oAAG90yka+3rPWaw3BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GcM4Kd8m; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GcM4Kd8m"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A3541477;
	Wed, 15 Jul 2026 08:29:28 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 02E283F905;
	Wed, 15 Jul 2026 08:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784129372; bh=0DoSozkuyO2Bq2KoLc6X2figCfBt0AFxngHQNyo5a8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GcM4Kd8mPE2PHx0j8T7wYpzwAYmG3jhNzy5V9WsoxZTxxFklzQE5IxDCsCMlFKZMx
	 FUFiFuLqfl76lvBqT9+e8c0rTtPPQONE32TmfBbf+GHj8RJDA3m4mFZrldPQt9Ajo6
	 Uoo+py9hIrBcwNZLNgyDrfXnRwBtxekcn1gUn7/I=
Date: Wed, 15 Jul 2026 16:29:15 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, sudeep.holla@kernel.org,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, d-gole@ti.com,
	jic23@kernel.org, elif.topuz@arm.com, lukasz.luba@arm.com,
	philip.radford@arm.com, brauner@kernel.org, david@kernel.org,
	souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
	puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v5 00/23] Introduce SCMI Telemetry support
Message-ID: <alenP8e_2SFtgWw4@pluto>
References: <20260703123601.381275-1-cristian.marussi@arm.com>
 <20260707063137.3222972-1-subrahmanya.lingappa@oss.qualcomm.com>
 <alCuJsOgh1ioFHAL@pluto>
 <CAPxK-6cE7QAnMxO843T_MhipsVed=q7M6yQG6q5mAknY+T91kw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPxK-6cE7QAnMxO843T_MhipsVed=q7M6yQG6q5mAknY+T91kw@mail.gmail.com>

On Wed, Jul 15, 2026 at 07:15:10PM +0530, Subrahmanya Lingappa wrote:
>  Hi David, Cristian,
> 
>  Thanks, both. Fair points.
> 

Hi Subrahmanya,

> On Fri, Jul 10, 2026 at 2:02 PM Cristian Marussi
> <cristian.marussi@arm.com> wrote:
> >
> > On Tue, Jul 07, 2026 at 12:01:37PM +0530, Subrahmanya Lingappa wrote:
> > > Hi Cristian,
> >

[snip]

> 
>  I agree that asking this series to grow a generic telemetry subsystem now is
>  too much. With only SCMI in-tree, it would be easy to create a "generic"
>  interface that is really just SCMI with different names. I also agree that raw
>  SHMTI is not just a debug path if the expected users are high-rate tooling.
> 
>  So let me narrow the ask.
> 
>  I am not asking for `drivers/telemetry/` in v6. I am asking that the SCMI
>  chardev/UAPI not be tied too closely to the current SCMI core storage layout.
>  In particular, I think v6 should try to:
> 
>    - copy descriptor/config/sample data through fixed and extensible UAPI
>      structs, not structs mirroring SCMI internal objects;

If you mean by this adding a bit more of pad/reserved space scattered
here and there, it is not a problem; also, one thing that is still missing
and planned to be added is some ABI Versioning and related IOCTL,
should not this be enough to address future possible UAPI expansions ?

Regarding avoiding mapping internal SCMI object in the UAPI, I think I
am already NOT blindly sharing internal structures but instead I copy
explicitly internal representations into the UAPI fields....I think the
only exception to this is the sample (scmi_tlm_de_sample) that I take
care to keep aligned with the internals to avoid the overhead of the
double copy...but it seems one of the few pretty much general concept
that I felt confident to abstract no ?

...but of course this UAPI abstraction into which I copy the results
is mapped into SCMI inspired concepts/abstractions...for the reasons
we said....

>    - treat DE IDs, group IDs and SHMTI IDs as protocol identifiers, not as
>      implicit indexes into kernel arrays;

Not sure what you mean here... a shim layer used to acces info data
indirectly instead of the SCMI data structures ?

or some sort of layer/abstraction to be able to remap references
internally ? again it is not easy to imagine an abstraction without any
other example than SCMI...or you mean naming issue in the UAPI ?

>    - keep the TDCF/SHMTI parsing and SCMI command handling behind small
>      internal ops used by the chardev side;

well..if you refer to the telemetry_ops, this is an SCMI driver so it
has the structure of an SCMI driver, the Telemetry Operations exposed by
the core SCMI stack are the internal ops themselves that you ask for in
my opinion...I mean this is pretty much internal stuff that has nothing
to do with the UAPI itself and I imagine that when some future protocol
of yours, like the XXMI you mentioned, will appear you will write a new
driver on your own subsystem that will implement the UAPI itself for
your protocols (if you want to share that)...any possible future internal
reworking due to possible common abstractions on our side can be carried
out in the future...

>    - document the config model explicitly: per SCMI instance, last writer wins,
>      generation changes tell userspace that state changed;
>    - document the mmap contract: length, offsets, cache attributes, lifetime,
>      and reset/reconfiguration behaviour.

Completely agreed on this...Documentation is still lacking, including
extensive examples...I should have marked docs as RFC too...

> 
>  That keeps the ABI explicitly SCMI-specific and does not make SHMTI second
>  class. It just avoids baking too much of today's SCMI implementation shape into
>  the userspace contract.
> 
>  Cristian's point about policy being enforced by the SCMI server also makes
>  sense to me. I am not suggesting Linux should second-guess that partitioning.
>  Documenting the Linux-visible semantics is enough: what is shared per SCMI
>  instance, what userspace may race with, and how generation/poll reports that.

Yes it will be documented too...in one of the future series.

> 
>  So I would reduce my earlier suggestion to: no generic framework required now,
>  but please keep a clean provider/backend boundary inside the driver and leave
>  some UAPI growth room. That should make a later common layer possible, if a
>  second provider or an in-kernel user ever justifies it, without forcing this
>  series to solve that problem today.

No problem for UAPI growth and possible compatibility visa reserved
space and ABI versioning, but I dont see how a very susbsystem specific
driver like this SCMI Telemetry driver can be made more generic in terms of
provider/backend...the provider here is indeed already separated by the usage
of the SCMI telemetry protocol operations exposed by the core SCMI stack...

I think in order to have multiple backend providers pluggable/interchangeable
at will without the need to write a new driver for ecah one would mean, again,
having some sort common framework...thing that seems premature, as agreed.

Thanks,
Cristian
