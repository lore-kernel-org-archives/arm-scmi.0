Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 218A44963CA;
	Wed, 23 Sep 2026 15:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175835; cv=none; b=GDU+AzVYoSc/zr8UatzovuLwfIKa/ZuHW42NP+xBhFSeglX+QIlKkcPLklpJzxdghbq2PAueRrksGTI6Hcm5SGeuPTyQRNJceyJnnT0g77dSW/hBbmDIshMdOjLZuRrysLgtUhfhzTgh3sKsVZ/CXAHLRdRGGpDRWRkfUCTm/Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175835; c=relaxed/simple;
	bh=0/Lj5CUiANscmDe5noqB4vYNxkuMu46O/4p4y5g+oM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQdhBm+wcXOyDbGZHvyT6PDTI2sNv3IRYIoHMcK/d6o5yH6aFFOGZcU16fsNdzh7sCSbLS162zt7JsrCBgCMUEuOYSWYig0msNg4XW9Xp524c1lgOqNgJT80To/VFW3jEZI6vt4X9V896nm5wVJ/wx45f7mv1Pzqzi06n3a7KpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=mlj83BjI; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mlj83BjI"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C412C1570;
	Wed, 23 Sep 2026 08:03:46 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C95553F86F;
	Wed, 23 Sep 2026 08:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790175830; bh=0/Lj5CUiANscmDe5noqB4vYNxkuMu46O/4p4y5g+oM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mlj83BjIHBZYjSrBtJmqIr+9CLtBC7UmNQlFU8rEIHE/TUvAVxz8URr5clFDN5JhL
	 Eqzi1JZ36x6RqiJ/O+SNUS02F4fDI4y1KcltMRlvOovoWnQYuFkTlLI9Qf9pXLSIan
	 dT5QpURCYu+VIG7cFsGk47C8C5k5+fkYRNVQbU1A=
Date: Wed, 23 Sep 2026 16:03:42 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
	sudeep.holla@kernel.org, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	d-gole@ti.com, jic23@kernel.org, elif.topuz@arm.com,
	lukasz.luba@arm.com, philip.radford@arm.com,
	souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
	puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: Re: [PATCH v12 03/25] firmware: arm_scmi: Introduce protocol
 instance notifiers
Message-ID: <arPqThLW7jjbLRJO@pluto>
References: <20260920091928.2014972-1-cristian.marussi@arm.com>
 <20260920091928.2014972-4-cristian.marussi@arm.com>
 <c80354c7-0153-4a82-a9a1-9e2fd2929449@kernel.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c80354c7-0153-4a82-a9a1-9e2fd2929449@kernel.org>

On Tue, Sep 22, 2026 at 03:44:48PM +0200, David Hildenbrand (Arm) wrote:
> On 9/20/26 11:19, Cristian Marussi wrote:
> > SCMI Protocol notifications are typically used by SCMI drivers to detect
> > and react to particular conditions: this was the assumption and the classic
> > usage scenario upon which the SCMI notification framework was built.
> 
> Was the paragraph supposed to start with "SCMI notifications" ? Because later
> you describe how some protocols might want to reuse the "existing SCMI
> Notifications machinery", and here you talk about the traditional usage.

Indeed.

> 
> > -	mutex_lock(&info->protocols_mtx);
> > -	pi = idr_find(&info->protocols, protocol_id);
> > +	scoped_guard(mutex, &info->protocols_mtx) {
> > +		pi = idr_find(&info->protocols, protocol_id);
> > +		if (pi) {
> > +			refcount_inc(&pi->users);
> > +		} else {
> > +			const struct scmi_protocol *proto;
> >  
> > -	if (pi) {
> > -		refcount_inc(&pi->users);
> > -	} else {
> > -		const struct scmi_protocol *proto;
> > +			/* Fails if protocol not registered on bus */
> > +			proto = scmi_protocol_get(protocol_id, &info->version);
> > +			if (!proto)
> > +				return ERR_PTR(-EPROBE_DEFER);
> >  
> > -		/* Fails if protocol not registered on bus */
> > -		proto = scmi_protocol_get(protocol_id, &info->version);
> > -		if (proto)
> >  			pi = scmi_alloc_init_protocol_instance(info, proto);
> > -		else
> > -			pi = ERR_PTR(-EPROBE_DEFER);
> > +			if (IS_ERR(pi))
> > +				return pi;
> > +
> > +			proto_notifier_nb = READ_ONCE(pi->pno.nb);
> > +		}
> > +	}
> > +
> > +	if (proto_notifier_nb) {
> > +		if (scmi_protocol_notifier_register(pi->handle, &pi->pno))
> > +			dev_warn(handle->dev,
> > +				 "Failed to register protocol notifier\n");
> 
> 
> 	if (proto_notifier_nb &&
> 	    scmi_protocol_notifier_register(pi->handle, &pi->pno))
> 		dev_warn(handle->dev, ...)
> 
> As we dropped the mutex, I assume somebody else could move ahead and
> refcount_inc(&pi->users) + return before the notifier was registered? Is that
> expected?
>

It is more of a problem on the release path...in fact...these limit
condition are an open residual issues...
 
> 
> >  	}
> > -	mutex_unlock(&info->protocols_mtx);
> >  
> >  	return pi;
> >  }
> > @@ -2366,13 +2398,35 @@ int scmi_protocol_acquire(const struct scmi_handle *handle, u8 protocol_id)
> >  void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id)
> >  {
> >  	struct scmi_info *info = handle_to_scmi_info(handle);
> > +	struct notifier_block *proto_notifier_nb = NULL;
> >  	struct scmi_protocol_instance *pi;
> >  
> > -	mutex_lock(&info->protocols_mtx);
> > -	pi = idr_find(&info->protocols, protocol_id);
> > -	if (WARN_ON(!pi))
> > -		goto out;
> > +	scoped_guard(mutex, &info->protocols_mtx) {
> > +		pi = idr_find(&info->protocols, protocol_id);
> > +		if (WARN_ON(!pi))
> > +			return;
> >  
> > +		/*
> > +		 * If a protocol notifier was registered and this is the
> > +		 * last istance releasing the protocol, mark the notifier
> 
> s/istance/instance/
> 
> > +		 * for un-registration: note that the notifier itself counts
> > +		 * as one user, as for any other regular notification, so if a
> > +		 * protocol notifier is registered and there are only 2 users
> > +		 * active we can derive that this is the last protocol
> > +		 * instance de-registering.
> > +		 */
> > +		if (scmi_protocol_notifier_registered(&pi->pno) &&
> > +		    refcount_read(&pi->users) == 2)
> > +			proto_notifier_nb = READ_ONCE(pi->pno.nb);
> > +	}
> > +
> 
> We drop the mutex now temporarily. What happens if another instance gets
> registered (incrementing &pi->users) just after we dropped the lock and
> unregister the notifier?
> 
> Shouldn't we care about that or why is it ok?

I'll try a slight different approach for this...till now I was looking for the
least possible invasive ways of dealing with the fact that the core SCMI mechanisms
were NOT originally designed to deal with in-protocol users but just with
external SCMI drivers...

Thanks,
Cristian
