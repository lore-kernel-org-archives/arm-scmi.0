Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB8C33A708
	for <arm-scmi@vger.kernel.org>; Wed,  2 Sep 2026 13:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788356376; cv=none; b=uhCdhAKTHUDOdHkISqte4mVD+9OiMLwFPVkmAJjbsusoETL7atcrywdXPaB9ic5y5q3YujcYTTwO5ETt6de5Vsi9CdzO10kGPbhhk74TMCZFK9IUGMckW+HTGFnKeeo5lkR+R3BUbogANAVqHjd0gEzd239XRB0vEblFEYpi6Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788356376; c=relaxed/simple;
	bh=FD7XCa0JQ7ISe2sAEbdNZq6+4OOlNanC+bbLs0qecGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lVqsj8/0OHao/He0MBUp6/BmoKqYqPwWuBhYypaUh9UaQPp2sqLwATC/D80EIWXE6so0WDFRnkgiVGJBEacJ6n9FGB7E513C5CcSfZO+mX67roJsdMZn7ETetr1ZBbUD5CyCn2wqxUJsFODfwfOhQYuaV9qZFcWLfASSWRV0E5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BegnjX+7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BegnjX+7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 699DC1F000E9;
	Wed,  2 Sep 2026 13:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788356374;
	bh=hh9j/pEmKDaJiT1wmv/X91uEhhqIkV0D2bx6x4Y2JZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BegnjX+7LchNCBTRxj2iaw+WaH2IIhbvx+Ew1BmjUPv+o7Cxb91fzLtreneZe3IDZ
	 hbLu1Arw9Xewbc340s7/OyhPErC2bfwdaNX4+J3USENmEUU7JWy2Gs5Emp7cQ4khLY
	 9q0c902dVNfhyhEVENpqDw/T/GlcUoSgVkmn/3iQjXvubS/owoCIkEBSfQjXeCP7bl
	 tjjSoEagBTlZDzbuS7zk77tvOx3DlZ6z9ci38g6ask7Wck0MT7el6MDneTsHNmfpN9
	 bIndMyTKLJH8ls4BGP4fz0lP0/QIuG5C0peCBmhKBDDgbdivjX5U/4ftQgNj8eM4b1
	 4xooTzJgpUvmw==
Date: Wed, 2 Sep 2026 14:39:31 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
	Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 3/9] firmware: arm_scmi: Convert OF-only paths to
 generic fwnode in SCMI core
Message-ID: <20260902-funky-tarsier-of-competence-0ae6ab@sudeepholla>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
 <20260813-acpi_scmi_pcc-v3-3-cb6b88b4ebb3@kernel.org>
 <20260824103929.00004912@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824103929.00004912@oss.qualcomm.com>

On Mon, Aug 24, 2026 at 10:39:29AM -0700, Jonathan Cameron wrote:
> On Thu, 13 Aug 2026 12:32:58 +0100
> Sudeep Holla <sudeep.holla@kernel.org> wrote:
> 
> > Switch SCMI core plumbing from struct device_node * to struct
> > fwnode_handle * so the core can describe SCMI instances and protocols using
> > firmware nodes rather than OF nodes directly.
> > 
> > This change:
> >   - Replaces core OF property lookups with fwnode_property_*() helpers.
> >   - Switches child enumeration to
> >     fwnode_for_each_available_child_node_scoped().
> 
> Why the scoped version? See inline for more on this.  Probably just needs
> a comment here (or use the non _scoped variant)
> 

Sure

> >   - Plumbs fwnode through the SCMI device creation and channel setup paths.
> >   - Updates transport ->chan_available() callbacks to take a fwnode.
> >   - Stores per-protocol child fwnodes in info->active_protocols so the core
> >     can later locate the descriptor for a given protocol ID.
> >   - Updates mailbox/optee/smc/virtio transports to accept fwnodes and map
> >     back to OF nodes where their existing parsing remains DT-specific.
> > 
> > DT-only transports such as mailbox, OP-TEE and SMC still parse DT
> > properties by mapping the fwnode back to an OF node. On non-DT systems
> > these transports report no channel available.
> > 
> > This is a mechanical step towards firmware-node neutrality and prepares the
> > SCMI core for non-DT transports, such as an ACPI/PCC transport. DT users
> > continue to work unchanged; no non-DT transport is enabled by this patch.
> > 
> > Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> 
> A few minor things - with those cleaned up.  Only the cleanup.h one really
> matters.
> 

Fixed now.

> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> 
> > diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> > index ef29fd223287..9014723e0f7f 100644
> > --- a/drivers/firmware/arm_scmi/driver.c
> > +++ b/drivers/firmware/arm_scmi/driver.c
> 
> ...
> 
> > @@ -3352,10 +3354,10 @@ static int scmi_probe(struct platform_device *pdev)
> >  
> >  	scmi_enable_matching_quirks(info);
> >  
> > -	for_each_available_child_of_node(np, child) {
> > +	fwnode_for_each_available_child_node_scoped(dev_fwnode(dev), child) {
> 
> There are no early exits yet and I can't see any added later in the series.
> So the scoped bit is irrelevant.  I don't mind the change on basis of
> hardening or similar but it needs a comment in the patch description to 
> justify that.
> 

This is mainly to release the reference taken in
fwnode_get_next_available_child_node(). It is taken explicitly via
fwnode_handle_get() before scmi_create_protocol_devices() as discussed
below.

> >  		u32 prot_id;
> >  
> > -		if (of_property_read_u32(child, "reg", &prot_id))
> > +		if (fwnode_property_read_u32(child, "reg", &prot_id))
> >  			continue;
> >  
> >  		if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id)) {
> > @@ -3370,8 +3372,8 @@ static int scmi_probe(struct platform_device *pdev)
> >  		}
> >  
> >  		/*
> > -		 * Save this valid DT protocol descriptor amongst
> > -		 * @active_protocols for this SCMI instance/
> > +		 * Save this valid fwnode protocol descriptor amongst
> > +		 * @active_protocols for this SCMI instance.
> >  		 */
> >  		ret = idr_alloc(&info->active_protocols, child,
> >  				prot_id, prot_id + 1, GFP_KERNEL);
> > @@ -3381,7 +3383,7 @@ static int scmi_probe(struct platform_device *pdev)
> >  			continue;
> >  		}
> >  
> > -		of_node_get(child);
> > +		fwnode_handle_get(child);
> >  		scmi_create_protocol_devices(child, info, prot_id, NULL);
> 
> Give this is handing over ownership I'd make that explicit and do
> 
> 		scmi_create_protcol_devices(fwnode_handle_get(child), info,
> 					    prot_id, NULL);
> but that is a slightly unrelated change - so I don't mind if you don't change
> this one.

Agreed, I can change this if it help readability.

[...]

> 
> > diff --git a/drivers/firmware/arm_scmi/transports/smc.c b/drivers/firmware/arm_scmi/transports/smc.c
> > index 1fce3ccdeb7f..1079cd01190b 100644
> > --- a/drivers/firmware/arm_scmi/transports/smc.c
> > +++ b/drivers/firmware/arm_scmi/transports/smc.c
> > @@ -84,10 +84,15 @@ static irqreturn_t smc_msg_done_isr(int irq, void *data)
> >  	return IRQ_HANDLED;
> >  }
> >  
> > -static bool smc_chan_available(struct device_node *of_node, int idx)
> > +static bool smc_chan_available(struct fwnode_handle *fwnode, int idx)
> >  {
> > -	struct device_node *np __free(device_node) =
> > -					of_parse_phandle(of_node, "shmem", 0);
> > +	struct device_node *of_node = to_of_node(fwnode);
> > +	struct device_node *np __free(device_node) = NULL;
> 
> See guidance in cleanup.h.  Basically says constructor and destructor
> must be together (that was after some grumpy replies from Linus to early
> cleanup.h users!)
> 

Thanks, fixed locally now.

-- 
Regards,
Sudeep
