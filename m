Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793900314;
	b=G7dBUl/RN7peNs7S1HL6V7mAs0YgJh/rWli21O92juPdh/DcMoGVYsD3l2+KM8eapD0b
	 w0RxTd+bpO9hsBiaGHRO+6pg2tjbmtUqvVUq+pmb9z90NaT5GOI0CM947rFJPrnJCxyoX
	 QwpxJnYLquvo+dL7q6YfHHg8oQXJBz4Q8bpsLykj8mrFps1FJNxqlwKIOy/yTmnWXqoGR
	 maGtQeLUcoOuVjBQm6EgBKjRW66HFp/zhrqsCrU1GCFaS6gQtMYP76cp5Owl2Izfx+Ycz
	 9QcKP444SgB2g2vcD1kbjM8IzHnDlEMAxEBCY0LnJoOmR9VoS3sYSVMY68DHgM2sCLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900314;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=8fz6RmNx4rsL9ZO9RoSk+toa+/2KKetNvBTZ87Q/PdE=;
	b=XeMaBITzK4o/TTzdJNxm3SKMICn4jyPwQu6tnTxNfzbigK8TRGmRVeMfocjivIXLE2pN
	 HrGop5nSKQqrDpMrkI70qHGHFIV1NbiBvuUoFzppGv8ghWHaukUa9+OgwaRT9W+SCj+qZ
	 f4O78ekyMd0QtBSoU2AiwKQ3tf3p0xrpFXYN2KJ20m9E026UwtJSCSuU3Sz4PmIqryY09
	 0cDhhsBVGhxoTEejZkBkaUGOOiAY3koN13TQ/uk5AAaUCbR1ucw2UT5PQKT7F8VlyGsCw
	 IZlM233J9uS2RqTGb6f0TASvdphgQYDxDR5mNzanFTE0FZ9fxDSI3r/8FCqzC62dI3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=baRLamw0;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F698606A31B;
	Thu,  5 Nov 2026 17:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F698606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=baRLamw0
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4D3B168F;
	Thu,  5 Nov 2026 09:38:29 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F9CA3F628;
	Thu,  5 Nov 2026 09:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793900312; bh=kQasTs69GJMYTewLpWCOSipBS9yqMY8wtuGqJ6c4A5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=baRLamw0BEo+tFUEnaSWrk8Nev4Q5y0Y6eyDS+bv2ePivPxrN/r6dmXeVJw6EAruG
	 LmVvAwErn2pWSVM95ht9FO1Jat+mG0L3qVd816hE8H5/fdYhC/yFe8eoYfW8dKF/Dp
	 GuOi21pPZk+MOhq3hVAGBNMbSd7yiVE5q6xXpyWA=
Date: Thu, 5 Nov 2026 17:38:20 +0000
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
Subject: Re: [PATCH v14 03/32] firmware: arm_scmi: Refactor
 __scmi_event_handler_get_ops helper
Message-ID: <auy_DP2okO9o7Yee@pluto>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
 <20261016185553.2794459-4-cristian.marussi@arm.com>
 <20261019134657.0000624a@oss.qualcomm.com>
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
In-Reply-To: <20261019134657.0000624a@oss.qualcomm.com>

On Mon, Oct 19, 2026 at 01:46:57PM -0700, Jonathan Cameron wrote:
> On Fri, 16 Oct 2026 19:55:24 +0100
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Refactor the __scmi_event_handler_get_ops notification helper to simplify
> > its logic and make use of guards for locking.
> > 
> > Mostly no functional change, in the sense that while the functionality
> > remained the same, a richer set of errors is returned where before was
> > always a -EINVAL.
> 
> Maybe mention why scmi_allocate_event_handler() is now wrapped in
> an scmi_allocate_pending_event_handler()
> 
> I like the change but beyond logical division of activities it
> isn't immediately obvious why that split exists.

I'll do.

> 
> One really minor thing inline that I don't care that much about.
> 
> Anyhow, both trivial so
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> 
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > ---
> >  drivers/firmware/arm_scmi/notify.c | 73 +++++++++++++++++++-----------
> >  1 file changed, 46 insertions(+), 27 deletions(-)
> > 
> > diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
> > index 7d1bb424a723..2bc2e03df639 100644
> > --- a/drivers/firmware/arm_scmi/notify.c
> > +++ b/drivers/firmware/arm_scmi/notify.c
> > @@ -890,7 +890,6 @@ void scmi_deregister_protocol_events(const struct scmi_handle *handle,
> >  
> >  /**
> >   * scmi_allocate_event_handler()  - Allocate Event handler
> > - * @ni: A reference to the notification instance to use
> >   * @evt_key: 32bit key uniquely bind to the event identified by the tuple
> >   *	     (proto_id, evt_id, src_id)
> >   *
> > @@ -903,8 +902,7 @@ void scmi_deregister_protocol_events(const struct scmi_handle *handle,
> >   * Context: Assumes to be called with @pending_mtx already acquired.
> >   * Return: the freshly allocated structure on Success
> >   */
> > -static struct scmi_event_handler *
> > -scmi_allocate_event_handler(struct scmi_notify_instance *ni, u32 evt_key)
> > +static struct scmi_event_handler *scmi_allocate_event_handler(u32 evt_key)
> >  {
> >  	struct scmi_event_handler *hndl;
> >  
> > @@ -914,8 +912,20 @@ scmi_allocate_event_handler(struct scmi_notify_instance *ni, u32 evt_key)
> >  	hndl->key = evt_key;
> >  	BLOCKING_INIT_NOTIFIER_HEAD(&hndl->chain);
> >  	refcount_set(&hndl->users, 1);
> > -	/* New handlers are created pending */
> > -	hash_add(ni->pending_events_handlers, &hndl->hash, hndl->key);
> > +
> > +	return hndl;
> > +}
> > +
> > +static struct scmi_event_handler *
> > +scmi_allocate_pending_event_handler(struct scmi_notify_instance *ni,
> > +				    u32 evt_key)
> > +{
> > +	struct scmi_event_handler *hndl;
> > +
> > +	lockdep_assert_held(&ni->pending_mtx);
> > +	hndl =  scmi_allocate_event_handler(evt_key);
> > +	if (hndl)
> > +		hash_add(ni->pending_events_handlers, &hndl->hash, hndl->key);
> Trivial but I'd keep to a strict errors out of line
> 	if (!hndl)
> 		return NULL
> 
> 	hash_add(ni->...
> 	
> 	return hndl;
> 
> It burns a few lines be saves a few brain cells.
> 

yes, I prefer this too...I'll do.

Thanks,
Cristian
