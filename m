Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63002440A26;
	Wed, 23 Sep 2026 10:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160978; cv=none; b=EBq+6s+OttukxznpwBf+sEaufEIP45GPvlogzPySpWf8B/A7iyyV8HqTVoDTL3YfcehSuGup6g6a4cxwoSC5zeQqYH47B7/2MUWYjJMuL1RVNxzpUhY695xVSyTYwJkLOKIGa1m6CZzycTeM/LvxOEqpYseln+pas4H6+bpoXO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160978; c=relaxed/simple;
	bh=s5eK6czV54tLMgQyspEsKT5FhzSt1Pt79xGUDPqztro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQCMg37a2XD9wBKMXhF0p3WI0puCE9Z0OHNA0IJW/20EmQQvR4ejX3PdhCO3X5hGXmgmZ3/yE9RuqZ2AeRyBCKZl+3ecj+DJ5Ki6DmzerGFKCGn92098qF5JaWwAYaFF0OcQWlTzRifI3hkKl2qs3NCk6hYlPZKTt9thYUg9mqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=LogV7v5u; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="LogV7v5u"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E97BF143D;
	Wed, 23 Sep 2026 03:56:03 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 047343F86C;
	Wed, 23 Sep 2026 03:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790160967; bh=s5eK6czV54tLMgQyspEsKT5FhzSt1Pt79xGUDPqztro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LogV7v5ul2kJACpBHby8srql67OXX0Bled1I/EPPVwAmKpYNSZLzGG8ySoD5aiAqb
	 z8+RgMj8cMWr4Pz2TESQ5GlrSOcy/prdB3nggxKbZkvpFNJLKUt7KD6SYEbTQptlAs
	 Rr0b9Xa0retjD23OCp/6aqD0SFUfPj8MEmIOOIfo=
Date: Wed, 23 Sep 2026 11:55:49 +0100
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
Subject: Re: [PATCH v12 02/25] firmware: arm_scmi: Allow registration of
 unknown-size events/reports
Message-ID: <arOv8aLJaRQjhkaF@pluto>
References: <20260920091928.2014972-1-cristian.marussi@arm.com>
 <20260920091928.2014972-3-cristian.marussi@arm.com>
 <2135509e-2689-4258-ab00-011d47f4b172@kernel.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2135509e-2689-4258-ab00-011d47f4b172@kernel.org>

On Tue, Sep 22, 2026 at 03:15:55PM +0200, David Hildenbrand (Arm) wrote:
> On 9/20/26 11:19, Cristian Marussi wrote:
> > Allow protocols to register events with build-time unknown sizes: such
> > events can be declared zero-sized and let the core SCMI stack perform the
> > needed safe-net boundary checks based on the configured transport size.
> 
> ok, so we have a maximum message size defined by the transport. We'll use that
> as payload size, and the report size just gets the additional ktime_t.
> 
> 
> >  	pd = scmi_allocate_registered_events_desc(ni, proto_id, ee->queue_sz,
> > @@ -807,7 +821,8 @@ int scmi_register_protocol_events(const struct scmi_handle *handle, u8 proto_id,
> >  		mutex_init(&r_evt->sources_mtx);
> >  
> >  		r_evt->report = devm_kzalloc(ni->handle->dev,
> > -					     evt->max_report_sz, GFP_KERNEL);
> > +					     evt->max_report_sz ?: max_report_sz,
> 
> Having two similarly named variables is a bit confusing. I wonder if you can
> somehow make it clearer in the latter case that it is the max_report_sz
> according to the transport.

Ok I'll do.

> 
> > +					     GFP_KERNEL);
> >  		if (!r_evt->report)
> >  			return -ENOMEM;
> >  
> > diff --git a/drivers/firmware/arm_scmi/notify.h b/drivers/firmware/arm_scmi/notify.h
> > index f18f98c5ab3b..c2eb4844c7db 100644
> > --- a/drivers/firmware/arm_scmi/notify.h
> > +++ b/drivers/firmware/arm_scmi/notify.h
> > @@ -18,8 +18,12 @@
> >  /**
> >   * struct scmi_event  - Describes an event to be supported
> >   * @id: Event ID
> > - * @max_payld_sz: Max possible size for the payload of a notification message
> > - * @max_report_sz: Max possible size for the report of a notification message
> > + * @max_payld_sz: Max possible size for the payload of a notification message.
> > + *		  Set to zero to use the maximum payload size allowed by the
> > + *		  transport.
> 
> "maximum payload size" is ph->hops->get_max_msg_size(ph) ? Should we call this
> "maximum message size" then?
>
Ok 
> > + * @max_report_sz: Max possible size for the report of a notification message.
> > + *		   Set to zero to use the maximum payload size allowed by the
> > + *		   transport plus the additional ktime_t timestamp.
> 
> Same here.
>
 
Ok

Thanks,
Cristian

> -- 
> Cheers,
> 
> David
