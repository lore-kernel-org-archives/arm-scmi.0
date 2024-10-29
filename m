Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAD94205144
	for <arm-scmi@vger.kernel.org>; Tue, 29 Oct 2024 10:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730197928; cv=none; b=US/jONfjSw4cFIrNf8eLp8W0H03djzbCHa7mLx8ojuPUrPCxQxwKfaB0NpJisk/K4qdc7BA2PYobLg5vi39kfeQ8m3fHN91cZs4AJpq4nBL1KutIB/88O/zKtfzKVGa6GxP3D0OQA0H73ulAvATP5FTFaAXYb3qc+xOCYGAed3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730197928; c=relaxed/simple;
	bh=MAMwUF+JWMw0+oXTEiZFYrf0cf6bkEzr6Uhzw3fHC/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W9W6yA++Va/GpiwOdNNXp+xkusDztVIG1HSyKkwlYA0BVEYuj0HStSItgsf30bshO0i1FUH6jeJBog5JtOfcSnF7unN+aKyTSzIJBpzVEeLcWUnSIwoPP521FkW96Y7tftD1x0sOtgOhgQGYQ8EbJ7tYyt7RhewtjtCcswndWa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A944C13D5;
	Tue, 29 Oct 2024 03:32:34 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCCE13F528;
	Tue, 29 Oct 2024 03:32:03 -0700 (PDT)
Date: Tue, 29 Oct 2024 10:32:01 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, girish.pathak@arm.com,
	arm-scmi@vger.kernel.org, vincent.guittot@linaro.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Souvik.Chakravarty@arm.com
Subject: Re: Question about identifiers
Message-ID: <ZyC5oTomdBF0Ywfb@pluto>
References: <c5fdc171-0dc7-4c38-88e7-fcf9de7cbec2@stanley.mountain>
 <ZyCuAKfqRnuFdAwC@pluto>
 <f305d661-71e8-48c0-a6a5-4271c0436bc1@stanley.mountain>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f305d661-71e8-48c0-a6a5-4271c0436bc1@stanley.mountain>

On Tue, Oct 29, 2024 at 01:20:58PM +0300, Dan Carpenter wrote:
> On Tue, Oct 29, 2024 at 09:42:24AM +0000, Cristian Marussi wrote:
> > On Mon, Oct 28, 2024 at 06:09:50PM +0300, Dan Carpenter wrote:
> > > Two questions:
> > 
> > [CC: Souvik]
> > 
> > Hi Dan,
> > 
> > > 
> > > 1) In SCMI pinctrl protocol each pin, group or function has an identifier.
> > >    uint32 identifier
> > > 	Identifiers are limited to 16 bits, and the upper 16 bits of this
> > > 	field are ignored by the platform.
> > > The linux-kernel assumes that the identifiers are basically, 0 to nr_pins,
> > > 0 to nr_groups and 0 to nr_funcs.  Is that a fair assumption to make?
> > 
> > It's not an assumption really, any SCMI resource on the system, across
> > all of the protocols, is identified by a number in the *contiguos* range
> > (0... TOT_RESOURCE - 1) where TOT_RESOURCE is usually gathered with some
> > discovery initial command...looking at Pinctrl specifically in 4.11:
> > 
> > "Protocol commands take integer identifiers to describe a pin, group, or function.
> > The identifiers are sequential and start from 0."
> > 
> > Pinctrl deviates a bit from this since you have 3 different kind of
> > resources, so you have 3 different TOT_RESOURCES values to query.
> > 
> > ...maybe adding "sequential and contiguos" would have been clearer...or
> > maybe it is just that I am used to SCMI spec parlance/world so I
> > implictly interepret like this...
> > 
> > IOW, for any protocol, in general, the platform is expected to expose
> > to the agent a contiguos set of IDs numbered from zero...i.e. without
> > holes due to reason like 'resource X is not present on platform Y so
> > we'll leave a hole in the set of IDs returned at discovery time because
> > is easier than remap the physical resources to the set of IDs exposed to
> > the agent'
> > 
> 
> Alright.  Good.  Thanks.
> 
> > > 
> > > 2)  In the spec 4.11.2.7 PINCTRL_SETTINGS_GET and 4.11.2.8
> > > PINCTRL_SETTINGS_CONFIGURE it only allows for pins and groups, not functions.
> > > Meanwhile gpio functions are functions.  That's just a mistake, right?  I've
> > > been working under the assumtion that it is.
> > > 
> > 
> > Mmm, there were a lot of discussions around functions and GPIOs (which I
> > dont recall now) and a last minute rework to some commands in that
> > regards, so that now you can use those 2 commands to (optionally) get/set
> > the selected function for a pin or group specified in the command.
> > All the other configurations are, indeed, only pertaining to pin and groups:
> > what do you think is missing around functions ?
> > 
> > Moreover, are you sure that you have the latest v3.2 spec from developer.arm.com ?
> > 
> > Since there were a lot of betaS for v3.2 cycle...with changes especially
> > around functions/gpios...so many betaS that, till last month, AFAICS, even
> > the ACS SCMI compliance suite on the tip of master (still not an official
> > release, though) was broken, since it was really implementing Pinctrl
> > testcases against an old obsolete v3.2-beta (i.e. testing non-existent/older
> > pinctrl commands...and I have fixes to upstream for this...once I'll have a
> > bit of time...)
> > 
> 
> I am using the 3.2 Spec.
> 
> In PINCTRL_ATTRIBUTES it says that GPIOs are a function resource, not a group
> resource.  See the last line especially.
> 
>   Bit[17] GPIO function descriptor
> 
>       Set to 0 if Bits[1:0] of the flags field in the command is set to 2, and
>       the function does not support GPIO functionality.
> 
>       Set to 1 if Bits[1:0] of the flags field in the command is set to 2, and
>       the function supports GPIO functionality.  The agent should ignore the
>       value of this bit if Bits[1:0] of flags field in the command is set to 0
>       or 1.
> 
>       This value of bit must not be 1 for more than one function associated with
>       a pin or a group.
> 
> Either way, he PINCTRL_SETTINGS_GET/PINCTRL_SETTINGS_CONFIGURE need to add
> functions.  Here is how that reads now:
> 
>   uint32 attributes
>   Bits[17:16]
>       Selector: Whether the identifier field refers to a
>       pin or a group.
>       0 – Pin
>       1 – Group
>       All other values are reserved for future use
> 

Well, it seems a reasonable amend in order NOT to go through the
mappings that Vincent describes to obtain the same result...

...now I sincereley dont know if this is something missing in the
spec (since there was really no GPIO-wise usage/implementation
of ASCMI/PINCTRL really till now ..so it could have been missed)...

...OR this was done on purpose to keep down the SCP/SCMI server
complexity... (argument this, that could be questionable I agree..)

Need to know what ATG/SCP think around this...Souvik ? Girish ?

Thanks,
Cristian
