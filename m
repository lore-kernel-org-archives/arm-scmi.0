Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C62246762
	for <arm-scmi@vger.kernel.org>; Tue, 21 Oct 2025 09:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761038772; cv=none; b=gdjWfUL06m+yQeSofvM3HxfGor9Q6qi6Go7Xa4l9LIhuWzEvtL7WO3u0gV0LXUF72P7H8RkY88ktN3uGBMScxsQaXGJwPk5qev+tizOMObUL3jiOyai9cEKTlIv2+hZYKKSlSCrDJrl/rV1m2tTjoTyNC6hpjb310omYALFq8PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761038772; c=relaxed/simple;
	bh=NPa5lK2hUdemmku9xlXtTywfrY/b3KNt9cZRk9IpsIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gUNNySNgnZVhxbQsg9YcPCovs7mglfKpq0Uc7FXvsZh4dXq47QFSKaWByYmsIsgfuR0NjMcqtqWP8ZpVNv0M0bSCI/h7D66lzL//Cgo9e/wU7OoXkiZyd6bdwg6Zt6nku2aqJU0u4ocBz5cFPiAAfxNnyI7cvnqZqhU/KRq47l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E8441063;
	Tue, 21 Oct 2025 02:26:02 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD5063F66E;
	Tue, 21 Oct 2025 02:26:08 -0700 (PDT)
Date: Tue, 21 Oct 2025 10:26:06 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, <arm-scmi@vger.kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 3/8] firmware: arm_scmi: Convert OF-only paths to generic
 fwnode in SCMI core
Message-ID: <20251021-fractal-resilient-aardwark-f8deb6@sudeepholla>
References: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
 <20251017-acpi_scmi_pcc-v1-3-0adbab7709d9@arm.com>
 <20251020182949.00002bbf@huawei.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251020182949.00002bbf@huawei.com>

On Mon, Oct 20, 2025 at 06:29:49PM +0100, Jonathan Cameron wrote:
> On Fri, 17 Oct 2025 14:23:46 +0100
> Sudeep Holla <sudeep.holla@arm.com> wrote:
> 
> > Switch SCMI core plumbing from struct device_node* to struct
> > fwnode_handle* so transports and core code work with both DT and
> > ACPI firmware descriptions.
> > 
> > This change:
> >   - Replaces of_* property lookups with fwnode_property_*() helpers.
> >   - Switches child enumeration to
> >     fwnode_for_each_available_child_node_scoped().
> >   - Plumbs fwnode through the SCMI device creation and channel setup
> >     paths and updates transport ->chan_available() signatures to take a
> >     fwnode.
> >   - Stores the per-protocol child fwnodes in info->active_protocols so
> >     the core can later locate the descriptor for a given protocol ID.
> >   - Update mailbox/optee/smc/virtio transports to accept fwnode and
> >     map to OF nodes where needed
> > 
> > DT-only transports (mailbox/optee/smc) still parse DT properties by
> > mapping the fwnode back to an OF node; on non-DT (e.g. ACPI) systems
> > these transports will report no channel available.
> > 
> > This refactor is a prerequisite for adding an ACPI-first transport like
> > PCC and brings the SCMI core closer to DT/ACPI parity. This is a mechanical
> > step towards firmware-node neutrality; DT users continue to work unchanged,
> > and ACPI paths can be enabled on top.
> > 
> > No functional change is expected on DT platforms; ACPI platforms can now
> > discover and participate in SCMI where a suitable transport is present.
> > 
> > Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> Hi Sudeep
> 
> A few comments inline. The reference counting on fwnodes gets a bit complex in
> here so my review more or less skips that bit (it's end of day!)
> 

No, I had exactly same thoughts and I did mention about this briefly to
Cristian before posting as I couldn't follow the existing refcounting 🙁.
I need to catch up with Cristian and align ourselves before the next version.

> > diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> > index bd56a877fdfc..bc5fea11b5db 100644
> > --- a/drivers/firmware/arm_scmi/driver.c
> > +++ b/drivers/firmware/arm_scmi/driver.c
> 
> > @@ -2820,7 +2820,7 @@ static int scmi_chan_destroy(int id, void *p, void *idr)
> >  		struct scmi_info *info = handle_to_scmi_info(cinfo->handle);
> >  		struct scmi_device *sdev = to_scmi_dev(cinfo->dev);
> >  
> > -		of_node_put(cinfo->dev->of_node);
> > +		fwnode_handle_put(dev_fwnode(cinfo->dev));
> 
> This may follow on from earlier thing about device_set_node().
> I think this is freeing a reference that will never have been gotten if you
> follow what I suggest there.  Note that I'm fairly sure it was never
> gotten for acpi anyway.  However this might be a different fwnode, I'm lost
> on that front.
> 

Even I was lost and wanted to revisit this whole reference counting once again
before these changes find its way upstream.

> >  		scmi_device_destroy(info->dev, id, sdev->name);
> >  		cinfo->dev = NULL;
> >  	}
> 
> > @@ -3118,8 +3119,8 @@ static const struct scmi_desc *scmi_transport_setup(struct device *dev)
> >  		 trans->desc.max_msg);
> >  
> >  	/* System wide atomic threshold for atomic ops .. if any */
> > -	if (!of_property_read_u32(dev->of_node, "atomic-threshold-us",
> > -				  &trans->desc.atomic_threshold))
> > +	if (!fwnode_property_read_u32(dev_fwnode(dev), "atomic-threshold-us",
> 
> device_property_read_u32() Same for all the other places where the fwnode
> is simple dev_fwnode(dev) and there is a suitable helper.
> 

Ah OK, didn't notice that, thanks for the pointer.

> 
> > +				      &trans->desc.atomic_threshold))
> >  		dev_info(dev,
> >  			 "SCMI System wide atomic threshold set to %u us\n",
> >  			 trans->desc.atomic_threshold);
> 
> > @@ -3262,10 +3262,10 @@ static int scmi_probe(struct platform_device *pdev)
> >  
> >  	scmi_enable_matching_quirks(info);
> >  
> > -	for_each_available_child_of_node(np, child) {
> > +	fwnode_for_each_available_child_node_scoped(dev_fwnode(dev), child) {
> I don't think there is an exit path in here, so this is functionally the same
> as the non scoped version.
>

I get you point.

> Also, if you are gong to use dev_fwnode use
> 	device_for_each_child_node() and don't worry about the available.
> I think the patch merged that made device_for_each_child_node() only
> consider the available ones for all firmware types.
> 

Not sure if I fully understand yet, but will revisit this again before
next version.

> >  		u32 prot_id;
> >  
> > -		if (of_property_read_u32(child, "reg", &prot_id))
> > +		if (fwnode_property_read_u32(child, "reg", &prot_id))
> >  			continue;
> >  
> >  		if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id))
> > @@ -3278,10 +3278,11 @@ static int scmi_probe(struct platform_device *pdev)
> >  		}
> >  
> >  		/*
> > -		 * Save this valid DT protocol descriptor amongst
> > +		 * Save this valid fwnode protocol descriptor amongst
> >  		 * @active_protocols for this SCMI instance/
> >  		 */
> > -		ret = idr_alloc(&info->active_protocols, child,
> > +		ret = idr_alloc(&info->active_protocols,
> > +				fwnode_handle_get(child),
> 
> This change is a little subtle to be buried in here and I'm fairly sure
> it is an unintended functional change.  If idr_alloc() fails the continue
> and loop iterator magic, will drop the reference held by the loop but
> not this one.  So it will leak a reference.
> 
> If this does make sense, do it in a precursor patch before changing away
> from of only.
> 

Indeed, I can't recall why I have added the reference counting here. It can
be dropped, will give it another thought to see if anything strikes my mind.

> >  				prot_id, prot_id + 1, GFP_KERNEL);
> >  		if (ret != prot_id) {
> >  			dev_err(dev, "SCMI protocol %d already activated. Skip\n",
> > @@ -3289,7 +3290,6 @@ static int scmi_probe(struct platform_device *pdev)
> >  			continue;
> >  		}
> >  
> > -		of_node_get(child);
> >  		scmi_create_protocol_devices(child, info, prot_id, NULL);
> >  	}
> >  
> 

-- 
Regards,
Sudeep
