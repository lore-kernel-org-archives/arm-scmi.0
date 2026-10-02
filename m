Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312AE4B95B0
	for <arm-scmi@vger.kernel.org>; Fri,  2 Oct 2026 13:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790949405; cv=none; b=tRkKJOuuRohr8SY9+CDMdhhoOeSMs5DHzx1PL29J6jAbrGvI/qtdoAjLTifi3RTqUl08COhsR/yA3HJdfVZHpLiGmQdwIu01VbPZ/Trs2EZJ5EEe3aHrgLPEgA601ZNDXtHkhJzXb2ew82GjhImauHU/wyR708k7QLqbp3DooCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790949405; c=relaxed/simple;
	bh=viVqMyQkb4XnB+qJdEOOnHP10+M2jNTLz7OwIQYUC7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXr4v0eTfcHDmj0L/eSkQPmLmqXwLRRDxD09TrCvF0Ylvx0pPEouiQDylRYTWvivBzHV7ne8pD6/tdtxLZ4fWv2EoXKjoPmmSj2Kz448quC/SLn4yNX44/i3Sq4wMejyGnKRKXuw/B/jfm3Jaqzl6TdD2fZh8bw3NYMrXhftNpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wy5emJ4h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wy5emJ4h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75A221F000FF;
	Fri,  2 Oct 2026 13:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790949403;
	bh=XuEY899a1W1DM3hXhhDT4sQ9Jr9I9VHDa5Tg+/BF3Uc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wy5emJ4h4sJo2GVersfj5wnbUkzIC1fh1CIaRXu7s1qUrj1v83iMgXCdt2S3Bku1V
	 AP3rB9w4PpMb9Aq3tWykU2j2XL0UXflUPYZdZRz7uokWhv1645VAXX1fjl6yh2/sgA
	 PiHXwl/U/1r9dPfkVSXB+t2mULEMLsapsA4CPeSg23W0FDlCzr785YSrJqUq3LA3UD
	 zB/1/1vvLZFVI/2l2ymENRwMK51FTuaTgm4a9ZXNWtUdzd/mk4mH1rNKF0cG5fHZkC
	 gDI1EFUeE8Yd8+/YKcNOinboAHPtGeoUWe9VZ46VvhX7fAp6lk4WQY/R04TrDI/mHj
	 +ODx0cFYRCDbA==
Date: Fri, 2 Oct 2026 14:56:40 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: arm-scmi@vger.kernel.org, Peng Fan <peng.fan@oss.nxp.com>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH 2/4] firmware: arm_scmi: Skip requests for standard
 protocol devices
Message-ID: <20261002-swift-of-massive-greatness-ca8ebe@sudeepholla>
References: <20261002-scmi_bus_fixes-v1-0-8695cbab3fe7@kernel.org>
 <20261002-scmi_bus_fixes-v1-2-8695cbab3fe7@kernel.org>
 <d1474169-bf2c-486c-91f1-3754638dbe0e@oss.qualcomm.com>
 <20261002-immortal-normal-nyala-a9b6ce@sudeepholla>
 <d1307d5e-975b-4a4d-b810-d295a1ecd109@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d1307d5e-975b-4a4d-b810-d295a1ecd109@oss.qualcomm.com>

On Fri, Oct 02, 2026 at 03:40:44PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 2-Oct-26 2:50 PM, Sudeep Holla wrote:
> > On Fri, Oct 02, 2026 at 12:18:57PM +0200, Hans de Goede wrote:
> >> Hi Sudeep,
> >>
> >> On 2-Oct-26 11:36, Sudeep Holla wrote:
> 
> <snip>
> 
> >> While correct, simply re-registering the driver fixes the device
> >> not being there, see above.
> >>
> > 
> > Yes but IIUC it take the path where bus is tracking and keeping records
> > like it does for non-standard protocol right ?
> 
> Correct.
> 
> > I just want to avoid that
> > completely as it is hard to read and may be bit confusing as the std
> > device creation can take 2 different paths.
> 
> Ah, I see that makes sense.
> 
> >>> Skip request tracking for standard devices. Keep request tracking and
> >>> rollback for nonstandard devices unchanged.
> >>
> >> This has the downside that it will allow drivers to claim duplicate-ids
> >> for standard-proto devices.
> >>
> > 
> > Sorry I don't understand what does the above mean.
> 
> What I mean is that 2 drivers can now claim the same <proto-id, name>
> tupple and both will successfully register.
> 

Oh well, we want that. We tried avoiding that with different name but
2 device with same fwnode is causing issues. The exception is pinctl-imx
driver which triggered all these. I understand the concern but it is
hard restrict the usage of SCMI in some ways as it gets deployed in
more platforms. Happy to hear any alternative solution for the longer
term if it is hard in short term.

> >> That downside is pretty much why aac4e67d6eb9 ("firmware: arm_scmi:
> >> Always create devices for standard protocols") does things the way
> >> it does.
> >>
> >> If we want something like this patch, then my suggestion would be to
> >> make scmi_protocol_device_unrequest() skip the
> >> blocking_notifier_call_chain(SCMI_BUS_NOTIFY_DEVICE_UNREQUEST) call
> >> for standard protocol devices, but otherwise keep them on the request
> >> list to keep the detection of duplicate device-ids.
> >>
> > 
> > Ah, is this the same reference of duplicate-ids for std-proto devices
> > made above ?
> 
> Yes.
> 

Thanks!

> > If so, I understand what you mean now. I agree we need
> > to fix that too. I simply don't like keeping 2 possible paths or
> > device creation for std proto devices as I feel it will be troublesome
> > in the future.
> 
> Ok, I see.
> 
> >> But I'm not sure even that is necessary, my change deliberately only
> >> touched the scmi_device_create(name = NULL) path to make sure
> >> the devices are initially created. Future driver unregistering leading
> >> to them going away as before is not really a problem IMHO.
> >>
> > 
> > Do you mean, you prefer to keep 2 paths for std protocol device creation ?
>  
> Well we've 2 different paths for non std protocol device creation too,
> depending on if the protocol-id shows up before or after a driver
> requesting the device arrives.
> 

Agreed, but for std protocol we are sticking with enumeration time now.

> So I'm not convinced we really need to fix anything, but if you want
> to move to only 1 path for std protocol device creation that I've no
> objection against that.
> 

I think you missed the fact we are supporting the 2 different drivers
with same <proto_id, name>. You worded it differently and sorry for not
getting that early.

> Note that other busses do accept multiple drivers claiming the same
> device-id. With the first one to probe successfully winning. So we
> could also proceed with that patch as is.
> 

Indeed, that is the only way it can be made work. In this case we have
block list in scmi-pinctl driver for i.MX platform and that's how they
have their own driver probed successfully. It was quite a ride in getting
that merged after all attempts to have single generic driver failed 🙁.
It is created problems as we created multiple devices sharing same
fwnode unfortunately. This series solved the issue by trying to remove
multiple device creation with same fwnode where possible for that reason.
Hope that clarifies things, sorry I realise the context in the cover letter
was bit short to give overall picture of issue and history on this.

-- 
Regards,
Sudeep
