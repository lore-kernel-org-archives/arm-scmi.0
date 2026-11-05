Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793897591;
	b=eBwq8QEL9OcMSQ9bX6b5BT9qesH8heGn5UlgrDwWbdLRCn9rdrYfzEQw8fDhohRHIuiT
	 RbmnCTfTxDKT65GGxhg1D4OB2eWnan4JquUIi0EMrUpy0p3JWeExepyM+DToRiepzjLhw
	 nqm65rre5u2vxXeSmvfnrW1HtUAPlEL0xKJDYgWo/pa394/IMYTYa2K358/jHkFqdacXP
	 AbcOcsDCUnm14ukeaZi52cYdZYfsxyN9IzTOFwVjxy8i5/9nli2MFjg1MFuuBwm/t98U/
	 mcGpmNF5hPSHGSGDlFA69Rt0Uq88s9DLF/cY6ioQkdKtk4qzDVLV8ofx5ux77c7OgYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897591;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=b7ISpU/+7qBlKZbykurEDnKU9Tjfcn6jWyyuEJvG7BM=;
	b=WNcF7gFDaFtcfQ3XM5T4wYb7/37r/N2pKvcwDFxsoK/fHJ0aebpWJFZMXvzrmtIk/OCS
	 JXTBTTULWLI4ayQDZdFdH2DIFXlI+3mvb15PePHEblghOV/l6WvBtudDF7sKnVvYPKfH1
	 7e08qlRIrxPoNcHPo5ytL+5keg/UKEGXRO2NgoGAyA+MZZUH8CN1KDM6p1P2ILGjrX8xF
	 +JGzvDlNuWQjAoo+ynZf1oacczjwDnpacK03k/AXxPWx59vn+TnP5x+CLXsY3oXdnu2yD
	 sTfEaaz9RuYRwz/zh0kM1WDcef/XrOBG0kdeRd+XIKTdfHBRbeZXsJA+yKVHjB7bQsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=BAVh9zjI;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0711C606A33C;
	Thu,  5 Nov 2026 16:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0711C606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=BAVh9zjI
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 085BC1684;
	Thu,  5 Nov 2026 08:53:06 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C42C3F959;
	Thu,  5 Nov 2026 08:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793897589; bh=gnRx29Evp9j+zyYzUItG3PWqrsWlBymUMnVTD65sH78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BAVh9zjIIO5oxe+ePBiqhJhEVIArIw3llxlMAxg0JfAjpV4CflUXert8xbyCIoSCL
	 bPpZa4JTnXV/iABpC3IBXWsVKvBiyhnpCbQkiGGUCjfLgTjIfyUBKlIPH9iWbixsmK
	 dSO5v+Bw5YoZB8Ca6IsQdPhrxk2virAMnzNAbg0E=
Date: Thu, 5 Nov 2026 16:52:58 +0000
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
Subject: Re: [PATCH v14 01/32] firmware: arm_scmi: Add new SCMIv4.0 error
 codes definitions
Message-ID: <auy0ar-fio9m7EbV@pluto>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
 <20261016185553.2794459-2-cristian.marussi@arm.com>
 <20261019133436.000035ae@oss.qualcomm.com>
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
In-Reply-To: <20261019133436.000035ae@oss.qualcomm.com>

On Mon, Oct 19, 2026 at 01:34:36PM -0700, Jonathan Cameron wrote:
> On Fri, 16 Oct 2026 19:55:22 +0100
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 

Hi,

thanks for your feedback, sorry for my generally delayed replies but I
am drowning in Sashiko reports :P

> > SCMIv4.0 introduces a couple of new possible protocol error codes: add the
> > needed definitions and mappings to Linux error values.
> > 
> > Note that SCMI_PARTIAL_ERROR has to be handled specially, so it needs to be
> > distinguishable.
> > 
> > Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> > ---
> > v12 --> v13
> >  - use EBADMSG to map SCMI_PARTIAL_ERROR
> That's a stretch given definition but I looked back at: 
> 
> https://lore.kernel.org/all/arK7kLlrg491EsMf@pluto/
> and appreciate the problem of running out of error codes..
> 

Yes indeed it is not ideal BUT I crawled back and forth through errno.h
and I could not find anything better.

> Guess it is the best we can do,
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> 
> If you do a v15, maybe capture some reasoning in the change
> log or the patch description itself.

Yes I will...soon there will be a v15.

Thanks,
Cristian
