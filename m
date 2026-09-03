Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44A73EF0C8
	for <arm-scmi@vger.kernel.org>; Thu,  3 Sep 2026 06:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417587; cv=none; b=i+1OPtBHd6kUZHjowHpvdT7xJJwgRPwHiF70GXsR9h9y5WzP2f+YbJb07PMYYs9sLzQsK3ohWVJsAFpvza/ZGpWGugkiEOivUhu+7MPYtLkn1ZVN/VuHF8nCLhBOLEzmdbFrZ4L1XUFzPrBcaBr3OXjBWvxh+4w/cFQP0Vim6h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417587; c=relaxed/simple;
	bh=rX37jMbMQT/At7cEdUFoCKy+1uPZ2rHAEFAX2Wdk7Cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mPiu68UcWEJbJWoWaph7SgkjWvq24rtl2NfRs6dDssgv3hg0j2XSfFmJy+Xmok+GN/TonjsLW53MCuFqEZRGJD5QHVLbVebNDT1YhvW6D7YFjUZa/+JTPKB0VaL0LzCBB4S+9bhsQF2Yr6SRZiKGcdK2y9/jJFIJ/VvNjyD8+mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QfTlUyFp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QfTlUyFp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52DCE1F000E9;
	Thu,  3 Sep 2026 06:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788417582;
	bh=kXv4IxxEbHPHAcPBEFdWySsOK6uC1B7IUvoRJiHV6GA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QfTlUyFpyhrRbkP8tt8HJT/DQYi19QkPHq5dG2NXBoMfbpe52tebDtxf0F4Zc/T7m
	 9dkzMP25g4SPnFujXFPxci9xCsppNc1Jfe5XLew9LiCs1xeFeOsUjFIrUWtKRvJY3+
	 rLp8xYuKL4NH3q58AFg6adaoSiuKrCIQuA70XKFHpq+N7aCX/RdBeC64/e2AM6D5Oh
	 pZLN8OzftMQyvtL7OAJu2wpxBJ7skU6mNGcaJZvR8feT5HUxPEeTdN9qKdru/cQ9N9
	 Ok7MpJPfaKjze64qbohx4JsTGUCGk3PVfz0CZk7cYkRiIbnwinl8b2pTrqgHDj65Yj
	 JjI6qkR2jMC9Q==
Date: Thu, 3 Sep 2026 07:39:39 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 9/9] firmware: arm_scmi: Validate PCC shared memory
 signature
Message-ID: <20260903-spiked-undetectable-toucanet-ae8854@sudeepholla>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
 <20260813-acpi_scmi_pcc-v3-9-cb6b88b4ebb3@kernel.org>
 <20260824132450.000045ca@oss.qualcomm.com>
 <20260902-miniature-bullfinch-of-agreement-4e15fd@sudeepholla>
 <20260902163110.000054cc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902163110.000054cc@oss.qualcomm.com>

On Wed, Sep 02, 2026 at 04:31:10PM -0700, Jonathan Cameron wrote:
> On Wed, 2 Sep 2026 09:25:19 +0100
> Sudeep Holla <sudeep.holla@kernel.org> wrote:
> 
> > On Mon, Aug 24, 2026 at 01:24:50PM -0700, Jonathan Cameron wrote:
> > > On Thu, 13 Aug 2026 12:33:04 +0100
> > > Sudeep Holla <sudeep.holla@kernel.org> wrote:
> > >   
> > > > Validate the PCC shared memory signature when setting up an SCMI PCC
> > > > channel.
> > > > 
> > > > Reject channels whose shared memory signature does not encode
> > > > PCC_SIGNATURE combined with the PCC subspace ID, so misconfigured
> > > > firmware is caught before the transport starts using the shared memory
> > > > region.
> > > > 
> > > > Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>  
> > > Interesting there aren't more checks on this in the various PCC users.
> > > Question for another day perhaps.
> > >   
> > 
> > Tried cleaning up all but some platforms like Hisilicon kunpeng complained
> > it will break their platforms. So added a warning in the core but I want
> > to enforce stricter check here for SCMI PCC.
> 
> Fair enough.  I'd be tempted to check in core and add a quirks list
> for those broken platforms but meh, not my problem ;)
> 

Yes that is a possibility. One step at a time, lets keep warning for some
time and then handle broken systems as quirks. The warning is already in
place.

-- 
Regards,
Sudeep
