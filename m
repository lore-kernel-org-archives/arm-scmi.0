Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993302;
	b=PuhNT0utCxr8b3E0TIZPnUoPgscZxlxxJ1YdPtOC0c9YFXXxLRSdlOzP1oTVJlPU2GVu
	 oO6X9Tfg0V118wtt+WJkqlY6ykmRpzPsCueSrPfOQjj9Euzsn7twhzdjeMUPFSeG7mW62
	 hSM9DJwCk/rx9cjFa8KYYmeI0EvbsSkUYoWoXyLQqB8O+p17VxpcTxRNBUUFLTQ6vqt9o
	 MNRUxemrPMRyxuH3h6PPndaPwyMWzoMbvHPz8V3vR09jHFRVTbovExUYR/z0a86ehh37u
	 nktGIilKT3ePAlej6VONj0b8IkciNlHOcTOWL91EMBjntO2LYfWJ4lpjRthjAbS6Tzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993302;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=g/9ZH6DNMENaUgvjOSvQCfo6co4d5atT2nU3ht73jxo=;
	b=exzDdP0Mj8PRQEbxBAYfPf8wo+Nw/g3Nhmq6U2eB7uGKxGaAPwd5CVAn4s5kbS+MYsDQ
	 gVj9ZJDxdmiZcMWsTQG7+Imq1yHP/+BUOhkg2wERqtDVzz4V/NMUW8o12RwHqoVKf0zqu
	 wFMmJnQe9kxIXHx+i6BQ2gkk40n1mWcKPvPJe+8IZYlOxhrvZ7knqg5qGnnLbylnX9b6E
	 YCOmNSCeveIzClg6ztpv0IaG5ujh30vr1hFtzyneebsrNvDB0CfbNZR6ePAERYgU7BL5Y
	 +xUXzcSdnKjHoFiFnf9XE+DwjAcCy5raqSVxUR8xPDDajgQFUWPtZ3YZ8O8TwzpB3Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=id5o74cC;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E64DF606A32A;
	Wed, 18 Nov 2026 09:15:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E64DF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=id5o74cC
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 300BC1596;
	Wed, 18 Nov 2026 01:14:58 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 977943F673;
	Wed, 18 Nov 2026 01:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794993301; bh=hXuGwUcvD/JxHCPow69F+CSxS8aDisV0O4ydUJG851A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=id5o74cClBTwYA2qK9D22IG2CfqVOTH+tVR0uCcoXDwqhljGpYqufMaxuFWvI/Jc8
	 uHq/NEp8JLsQM5PEOXTAIYZxhqiQs6g4fV6iXt2pXLq90vmDCWv49R0ziKh/zIUaJb
	 q7vwdiFckE/oyB07oCYPbHuBDUSN2w7VAuh3ESK0=
Date: Wed, 18 Nov 2026 09:14:55 +0000
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
Subject: Re: [PATCH v15 00/35] Introduce SCMI Telemetry support
Message-ID: <av1sj-UEhz_F7R44@pluto>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
 <20261117170709.00002088@oss.qualcomm.com>
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
In-Reply-To: <20261117170709.00002088@oss.qualcomm.com>

On Tue, Nov 17, 2026 at 05:07:09PM -0800, Jonathan Cameron wrote:
> On Mon,  9 Nov 2026 09:11:46 +0000
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Hi all,

Hi,

> > 
> > [TLDR Summary]
> >  [V15 highlights]
> >  - general cleanup and hardening driven by reviews
> >  - improved TDCF access routines to minimize lost samples under load
> >  - completed ABI docs
> > 
> >  [V16 TODO]
> >   - address any remaining V15 outstanding Sashiko/reviewers issues
> > 
> > The upcoming SCMI v4.0 specification [0] introduces a new SCMI protocol
> > dedicated to System Telemetry.
> 
> This is one from the family of issues you find when reviewing ones own
> (well LLM generated) emulation, realizing it doesn't match the spec,
> and yet works.
> 
> This works fine without the required SCMI protocol property in ACPI.
> 2.2.2 of ACPI for System Control and Management Interface 1.0
> Platform Design Document. 111115A 1.0
> 
> Now, in here is an informative statement...
> 
> Protocols not listed using a property may not be enumerate by the operating system.
> 
> But they are... 
> 
> So, obviously we can ignore informative spec lines but that is a pretty strong
> sentence. I can't immediately think of what would go wrong if we ignored it
> - maybe we'd not pick an exclusive PCC and fallback to a common one the firmware
> doesn't want us to use?  But if it doesn't want us to use it why make Telemetry
> discoverable on it.
> 
> Should that be wired through from the ACPI parsing code?
> 
> Anyhow, not something I care that much about but thought I'd call it out
> as an oddity.
> 

AFAICR, I think this is really down to some ambiguity elsewhere in the
ACPI/PCC spec for SCMI, so the implementation deviates a bit from the
behaviour we have on devicetree based SCMI systems where instead a non
DT listed protocol is NOT activated even if provided by FW.

Sudeep has more details on this.

Thanks,
Cristian
