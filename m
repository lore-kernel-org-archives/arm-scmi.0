Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B8A2BDC0E
	for <arm-scmi@vger.kernel.org>; Wed,  2 Sep 2026 13:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788357145; cv=none; b=Wn+nNV5RmzuCtnJXYvnhQ3z1sjzVrw+izbyL90LyA0xWB8egYEXzPWw3FajIvb8++yCctc2JZTse1Zou2am/eMUMNGy0epXbeVP1EL+ZhOw3KA/EFwhADfGcMZSLnPByC5jPTXM2blAUrjPG3+b9GbQ/bKQOTlHbiSyshWzEwts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788357145; c=relaxed/simple;
	bh=mrBuxM20dbnLEBbwp96Qt2yLHnlxaBIqxiisNPXO3f8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MuzCoYaN5e238uKzIYK6UdseRRB+QgzXYycfibHTw8mBYXRd8eeiwUFP9aO5Nwo3TlXX4d43YduLXKvfblkrndzKfRrweaglmu8847z0U4M/Pn2Tm3PeMuuUF2odiuSfQ1BR6dEJgN4qIqXxDaBc2e9+cddLL4Wc2owGwZC+lbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WPinB0zR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WPinB0zR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2D0A1F000E9;
	Wed,  2 Sep 2026 13:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788357143;
	bh=QmFhfm/ycQNvBUk5VmeaGzE4MYZklDOtyKIWou97hTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WPinB0zRFnUXHkzus3W+lndLqy3gUIAvGGafThEfeWRaKyFhAvFUIWCxhWmsggHlI
	 UYy2WVnrMdUjzb2q6eDMEaZbLO//1rl/VPhtBumpVRjJGeslODVe15TZAxTzeP6l1K
	 5cMig05M7SqaG4G62ayNB/cn8FAYjw1H4crE6FUwg5S5dEFknYHIQhcrSv1MwirDFE
	 jv4dw/jAhHOQ6XNjRypAVuvZ9TLaokE0ABDf1kBM4HtkRALOEaDQoVSW8yPUzAB/Ee
	 FJFda+BuMNHY8alySw01d33iRh0GFM+4YM13tZdZq73lsekq0c3PidKEAcrQeOb5F6
	 aAmXB1C7aMWOg==
Date: Wed, 2 Sep 2026 14:52:21 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
	Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 6/9] firmware: arm_scmi: Refactor protocol device
 creation logic
Message-ID: <20260902-cuddly-moose-of-champagne-3d0c87@sudeepholla>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
 <20260813-acpi_scmi_pcc-v3-6-cb6b88b4ebb3@kernel.org>
 <20260824104948.0000454b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824104948.0000454b@oss.qualcomm.com>

On Mon, Aug 24, 2026 at 10:49:48AM -0700, Jonathan Cameron wrote:
> On Thu, 13 Aug 2026 12:33:01 +0100
> Sudeep Holla <sudeep.holla@kernel.org> wrote:
> 
> > Move the protocol validation and device creation logic in scmi_probe()
> > into a reusable scmi_device_check_create() helper.
> > 
> > The helper centralizes checks for the protocol ID range, implementation
> > availability and duplicate activation before invoking
> > scmi_create_protocol_devices(). This preserves the existing behavior
> > while allowing the logic to be reused by the ACPI path, where protocol
> > child fwnodes are absent.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> A trivial thing and one follow on from earlier.  For that just be consistent
> with what you choose to do for the earlier comment.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> 

Thanks!

> > ---
> >  drivers/firmware/arm_scmi/driver.c | 60 ++++++++++++++++++++++----------------
> >  1 file changed, 35 insertions(+), 25 deletions(-)
> > 
> > diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> > index aad678db0f6e..951ba3df6ba6 100644
> > --- a/drivers/firmware/arm_scmi/driver.c
> > +++ b/drivers/firmware/arm_scmi/driver.c
> > @@ -3244,6 +3244,40 @@ static void scmi_enable_matching_quirks(struct scmi_info *info)
> >  			   rev->sub_vendor_id, rev->impl_ver);
> >  }
> >  
> > +static void scmi_device_check_create(struct fwnode_handle *fwnode, int prot_id,
> > +				     struct scmi_info *info)
> > +{
> > +	int ret;
> > +	struct device *dev = info->dev;
> > +	struct scmi_handle *handle = &info->handle;
> > +
> > +	if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id)) {
> > +		dev_err(dev, "Out of range protocol %d\n", prot_id);
> > +		return;
> > +	}
> > +
> > +	if (!scmi_is_protocol_implemented(handle, prot_id)) {
> > +		dev_err(dev, "SCMI protocol %d not implemented\n",
> > +			prot_id);
> 
> Fits on one line. I didn't check if you modify this later in the series
> though so if this is churn reduction, fine to leave it as it stands.
> 

Fixed locally, must be side-effect of refactoring.

> > +		return;
> > +	}
> > +
> > +	/*
> > +	 * Save this valid fwnode protocol descriptor amongst
> > +	 * @active_protocols for this SCMI instance.
> > +	 */
> > +	ret = idr_alloc(&info->active_protocols, fwnode,
> > +			prot_id, prot_id + 1, GFP_KERNEL);
> > +	if (ret != prot_id) {
> > +		dev_err(dev, "SCMI protocol %d already activated. Skip\n",
> > +			prot_id);
> > +		return;
> > +	}
> > +
> > +	fwnode_handle_get(fwnode);
> > +	scmi_create_protocol_devices(fwnode, info, prot_id, NULL);
> 
> If you take the suggest I made earlier to make the hand over of ownership
> slightly more obvious by using the return value of fwmonde_handle_get()
> then applies here too.
> 

I will update 3/9, it should be there by 6/9, so no change here other
that the move itself.

-- 
Regards,
Sudeep
