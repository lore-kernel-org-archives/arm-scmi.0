Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5308637268C
	for <arm-scmi@vger.kernel.org>; Mon,  8 Jun 2026 20:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780951995; cv=none; b=bcYadeBTxBmj134q/uiO+7z+HTXuwejcMDE8GiBdTBWLlOeZxeDIm6surM4KOnJ2oi5y0WF/H7n4pMsExt6GVQGHDwpH2jvx9O7IDBg0A+NMbfN1Lx4jZQX8iUg8jwt4eSp3rG1Ke4LLI1QGxZ3MBs1cqQSe3oe4TLcqSsj2348=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780951995; c=relaxed/simple;
	bh=mVOgAPGGXXuJ9ffJ//p1CW9BrCQ/h3lAsuGwI8vvg4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JjZb7+nsPaw0w9j/q8ahLWoB4XHY5QtTO4vloaDSdhW8gZ9tYey5tTRmi3s8Hm2Q1rlbpherb8DN9R0cM7xAXjMDUoh+oNO5gIIb4hdIFv5nnBvDFPx1KTS62ENOpZSAfOPeKwVDict75jBtBy3wxskb4eukQ20ySfZMtxHahpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=KjnL09BY; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KjnL09BY"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AC35153B;
	Mon,  8 Jun 2026 13:53:00 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C75AC3FE53;
	Mon,  8 Jun 2026 13:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780951985; bh=mVOgAPGGXXuJ9ffJ//p1CW9BrCQ/h3lAsuGwI8vvg4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KjnL09BYR1X2WhGcAJXSBd5/pg0goTc8NooYmYuRSEnhprlUr7a4OzkDK7v3MW+/F
	 QwxJk2r3OBkTy6wgraqeA9037ZyBcy2w1Ccs+t034lzJP8wXSEZY96bion2iPQ39UU
	 w9ltCrpUXQFCd9ATgw2Q/e2kv7S7vv81089bAVSI=
Date: Mon, 8 Jun 2026 21:53:00 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	guomin_chen@sina.com, linux-arm-kernel@lists.infradead.org,
	peng.fan@nxp.com, quic_xinqzhan@quicinc.com, sudeep.holla@arm.com
Subject: Re: [RFC PATCH 2/2] firmware: arm_scmi: Add bus support for
 autoloading
Message-ID: <aicrrJHflSTu5g0v@pluto>
References: <Z6CNWOp8B_ghIrJt@pluto>
 <20250203100154.140877-1-cristian.marussi@arm.com>
 <20250203100154.140877-2-cristian.marussi@arm.com>
 <aibW10NMmzw3QnZ5@mai.linaro.org>
 <aibzLcZiVwtUHAgV@pluto>
 <256c182e-a093-4bf5-a353-ca5c06eff489@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <256c182e-a093-4bf5-a353-ca5c06eff489@oss.qualcomm.com>

On Mon, Jun 08, 2026 at 07:06:42PM +0200, Daniel Lezcano wrote:
> 
> Hi Cristian,
> 
> thanks for your answer
> 
> On 6/8/26 18:51, Cristian Marussi wrote:
> > On Mon, Jun 08, 2026 at 04:51:03PM +0200, Daniel Lezcano wrote:
> > > On Mon, Feb 03, 2025 at 10:01:54AM +0000, Cristian Marussi wrote:
> > > > Emit proper MODALIAS uevents when SCMI devices are created and make sure
> > > > all the standard protocol devices are requested when the bus is
> > > > initialized.
> > > > 
> > > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > > > ---
> > > 
> > > Hi Cristian,

Hi,

> > > 
> > 
> > Hi Daniel,
> > 
> > nice to hear from you in the SCMI land :P
> > 
> > > what is the status of this patch ?
> > 
> > ....I'd say forgotten/abandoned...I worked on that a bit when I realized
> > only part of the stack was autoloaded...then it did NOT received much
> > love and then I forgot it....buried by other prios....
> > 
> > Indeed I have still the local branch...but after a quick check I think
> > is the same as the RFC posted.
> > 
> > bbd14b0f7733 firmware: arm_scmi: Add bus support for autoloading
> > 8d982393b505 firmware: arm_scmi: Generate aliases for SCMI modules
> > 383c127faa97 (scmi_vendors_autoload_V2) firmware: arm_scmi: Add aliases to transport modules
> > 00caa894bce2 firmware: arm_scmi: Add module aliases to i.MX vendor protocols
> > d900620c46bb firmware: arm_scmi: Support vendor protocol modules autoloading
> > 4fe57bbeb6dc firmware: arm_scmi: Allow transport properties for multiple instances
> > ad236e5a7f01 Linux 6.13-rc1
> > 
> > ...where scmi_vendors_autoload_V2 is merged already...
> 
> Actually, I'm puzzled.
> 
> On our platform, until 7.1-rc1 we had to add a modprobe.d script to load the
> scmi_cpufreq driver because autoload was not suppported.
> 
> Now (7.1-rc1) it seems to be automatically loaded.
>

mmm...I am not sure....but I have a memory to have seen this behaviour
with cpufreq...on some more full-fledged distro (not the usual bare
minimum deboostrapped thing...)...never fully investigated though...

> I imagined the autoload module has been added between 7.0 and 7.1, but the
> series you are mentioning is from 6.13.

Not sure when effectively merged BUT definitely NOT 7.0/7.1...

> 
> What I am missing ?

Any chance that on a more complete kernel/distro some symbol dependencies
in modules.dep kicks in, unknowingly, that triggers the load of
scmi-coufreq ?

Not sure if it make any sense...since I miss anyway where the
SCMI-cpufreq <---> cpufreq-driver association is baked in with the current
module device tables...

Not so much of an help here...sorry.

Anyway, I may respin this in the future if there is some interest...unless
someone precedes me :D

Thanks
Cristian

