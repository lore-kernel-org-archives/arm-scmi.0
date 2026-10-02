Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C216F443E54
	for <arm-scmi@vger.kernel.org>; Fri,  2 Oct 2026 12:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945449; cv=none; b=awT44oxPKNKf+sMsxVYTMKYdS7eiuw7sH9/swdqwYkOueUvZztIkGbrWIo3v7s4ggbNOBe1VavY9lsjO4uQdYDxXSmWjGwXpXw0hq8e41ULSBaiRo9vp02R7lYPSVMpY2i2l4BLjIKWo6PKegl/93Y1JZPRhf7jHJlJ+rIEgNGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945449; c=relaxed/simple;
	bh=VwCv60uWizHHc5O+WuIz46gqbcJyVGc3KZBqC184pNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jTGEuNxci3Caxg23+kAazrxp4oR4K+tQRvia86dT+mD9HX4tT+1e8HW0Hljl6T/fPzF4HXuR+Krglbz8+1KTn2484rTv6I+zjxbOpV/qkWwkSd7n2WwU7pVyvby/9PdENHodwfP2D8A37cJVNB8b6MWuYlfe73XLDWm0bEG2vr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BGK7iOIl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BGK7iOIl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98A1A1F00893;
	Fri,  2 Oct 2026 12:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790945447;
	bh=1cFtih0fvJaR+wxK819I++DfQIqaTKJGWA9U0K4PrO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BGK7iOIledrm6pdfvIhiW13JwS18Zln7K/z/nQ5IrBsR8Zh9yQDswtmnexZxzo/cZ
	 iXVXhLSXIXAsLAF4vONTkDGe5K+x7u6YxPeX4Hyf8Blux48fbY5QwPTN3vuQ0Cpjzf
	 BCKAD04Thbrzhsx2FX0wUjkjxV75eIIG9OWEApkOEdnP/OEH6/L1eWwgwWDMlo4Ve3
	 Eb/Qi/jHQyYcxxvQrK0ZAgUv/Ms+oAFc6RBNIRDrzntgGzJXrNRp8vM0kw3buuSdRd
	 C2E/XI56t6HnWPZg0w//lqNBz3qDgrRTY2PIfaEz7oHNVMGs/WxOEnNWvc2hhT1p0/
	 d2t0ttUdlscbQ==
Date: Fri, 2 Oct 2026 13:50:44 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: arm-scmi@vger.kernel.org, Peng Fan <peng.fan@oss.nxp.com>
Subject: Re: [PATCH 2/4] firmware: arm_scmi: Skip requests for standard
 protocol devices
Message-ID: <20261002-immortal-normal-nyala-a9b6ce@sudeepholla>
References: <20261002-scmi_bus_fixes-v1-0-8695cbab3fe7@kernel.org>
 <20261002-scmi_bus_fixes-v1-2-8695cbab3fe7@kernel.org>
 <d1474169-bf2c-486c-91f1-3754638dbe0e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1474169-bf2c-486c-91f1-3754638dbe0e@oss.qualcomm.com>

On Fri, Oct 02, 2026 at 12:18:57PM +0200, Hans de Goede wrote:
> Hi Sudeep,
> 
> On 2-Oct-26 11:36, Sudeep Holla wrote:
> > The SCMI core creates devices for the standard protocol IDs during
> > protocol enumeration, without waiting for an SCMI driver request.
> > Recording a request for one of these devices also rejects a second
> > driver registering the same protocol/name pair.
> 
> Right, but that was also the case before:
> 
> aac4e67d6eb9 ("firmware: arm_scmi: Always create devices for standard protocols")
> 

Agreed, I was thinking of dropping fixes as I was not 100% sure if that
is fair but just slipped my mind before sending it out. I am happy to drop
it.

> I actually went for the "static" device creation instead of automatically
> adding requests to the requested-devices list to keep the behavior
> of rejecting a second driver claiming the same device-id in place.
> 
> > When the first driver unregisters, unrequesting that pair destroys the
> > core-created device.
> 
> Correct this was pointed out by Shashiko, but I deemed this ok because
> I assumed that if the driver is manually unregistered (rmmod) it will
> also be manually insmod-ed again.
> 
> This assumes that re-registering the driver recreates the standard
> protocol devices as it did before and I do not see why it would not.
> 
> Re-registering the driver leads to the following call-chain:
> 
> scmi_driver_register()
> scmi_protocol_table_register()
> scmi_protocol_device_request()
> blocking_notifier_call_chain(SCMI_BUS_NOTIFY_DEVICE_REQUEST, id_table)
> scmi_device_request_notifier(SCMI_BUS_NOTIFY_DEVICE_REQUEST, id_table)
> scmi_create_protocol_devices(id_table->protocol_id, id_table->name)
> scmi_device_create(prot_id, name)
> 
> And since the name argument to scmi_device_create() is
> not NULL we enter this path there:
> 
>         if (name)
>                 return _scmi_device_create(np, parent, protocol, name);
> 
> Just as before aac4e67d6eb9 ("firmware: arm_scmi: Always create devices
> for standard protocols") and the standard-proto device will be created.
> 
> So AFAICT a manual insmod/modprobe should work and I just tested:
> rmmod scmi_cpufreq + modprobe scmi_cpufreq with the autoload patches
> in place and that makes the cpufreq SCMI bus device go away and
> re-appear as expected.
> 
> The only thing which won't work is:
> 
> rmmod standard-proto-driver
> udevadm trigger
> 
> to make udev reload the module after a manual rmmod, but I consider
> that a case of 'doctor it hurts when I do foo' with as answer:
> 'Well then do not do foo'.
> 
> > No other driver can be bound to it at that point,
> > but removing it also removes the device that a later driver could bind
> > to or use for module autoloading.
> 
> While correct, simply re-registering the driver fixes the device
> not being there, see above.
> 

Yes but IIUC it take the path where bus is tracking and keeping records
like it does for non-standard protocol right ? I just want to avoid that
completely as it is hard to read and may be bit confusing as the std
device creation can take 2 different paths.

> > Skip request tracking for standard devices. Keep request tracking and
> > rollback for nonstandard devices unchanged.
> 
> This has the downside that it will allow drivers to claim duplicate-ids
> for standard-proto devices.
> 

Sorry I don't understand what does the above mean.

> That downside is pretty much why aac4e67d6eb9 ("firmware: arm_scmi:
> Always create devices for standard protocols") does things the way
> it does.
> 
> If we want something like this patch, then my suggestion would be to
> make scmi_protocol_device_unrequest() skip the
> blocking_notifier_call_chain(SCMI_BUS_NOTIFY_DEVICE_UNREQUEST) call
> for standard protocol devices, but otherwise keep them on the request
> list to keep the detection of duplicate device-ids.
> 

Ah, is this the same reference of duplicate-ids for std-proto devices
made above ? If so, I understand what you mean now. I agree we need
to fix that too. I simply don't like keeping 2 possible paths or
device creation for std proto devices as I feel it will be troublesome
in the future.

> But I'm not sure even that is necessary, my change deliberately only
> touched the scmi_device_create(name = NULL) path to make sure
> the devices are initially created. Future driver unregistering leading
> to them going away as before is not really a problem IMHO.
> 

Do you mean, you prefer to keep 2 paths for std protocol device creation ?

-- 
Regards,
Sudeep
