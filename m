Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787769;
	b=BjB0YZ53K4bps9lEpDlRSm5Iz9Le4KbjCiuSxWqGU1sR/rS0/Jmiirhfq6SEgDNE52MV
	 na3XcDLRc7PBN+cToU447lN5TTJDCfi1eC9/nUzZp0ojidx36iCei1+3eVS4Vw3H26rbc
	 bC/dMYHg3qXXEzZYdkxrNXOK/FILwcobr6spBv4D7jAk1xdyzIAbX7lldNZg32cNJtCAE
	 Bl/l6rcuXQNy4awb/d+Xr+630zvoaauNBtpYGN5uWepYJf+YvYsgYI9511J9vdUS27o98
	 lL8wLMhZZIK5eooZ7j7CMvnnayJN1pQjuYuaZdSTDc6YFy+7t80BZsj+BfG3mwUN6CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787769;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=+1pGJ7i1ND9Ohr0UreFf1Uf/cvKyOGS6sdqn792QKQg=;
	b=FDPNoiOz4TqbboXxnJvyoW3EyTWLAYfF/TfWdQzEXo8YpHoxU4VwqyGEPcoTDsIYCFcn
	 2hJ2QO5nSQi3oP/CEi8EiuK+RxZoKMDTZAod5X4odMpt/lA17c2gV04w06GkgrJfdBSO/
	 MgWhwX2GDIMp2RwAZw/f2DnvCd+ZOQt0DzXNYsbI0ZRyecluNGCP5tEVaBs69xSCb3HGp
	 AzuiTnqXtKoB4iOhWAW6XL7qckRtgimYNrRDXeminUwr3mTblUzsuObHdAPscrFhKO2ND
	 /dv01r7HAd7HFJa0aoHVpoSA8xa8uu3LVcmQmbjP1uQig28NddphiiA0nCwzAYVea4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Pp8X0Mp6;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DE42606A329;
	Fri, 27 Nov 2026 13:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DE42606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Pp8X0Mp6
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2F391570;
	Fri, 27 Nov 2026 05:56:04 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AFB6A3F632;
	Fri, 27 Nov 2026 05:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795787767; bh=zFLb+OnB7mi1qu1Jzixs1i73JRMix70x2iUgcxdeRak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pp8X0Mp6ZjXqcFWpSZ2xN43cysZr1MhhpLxJWetb3mG9Q6tE8uxvUM37Twn5qJ/Kk
	 bqq0U1bKtZJT0bLAsXhm0kCF3/+7v9CBwavqekEUDlicPi38n+h4a2pzF9VoZ2iFrA
	 QufSsZfPwwgBHb1itTcwkXkM5AHJBlg3w6THqM30=
Date: Fri, 27 Nov 2026 13:55:56 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@kernel.org,
	philip.radford@arm.com
Subject: Re: [PATCH 2/2] firmware: arm_scmi: Refactor protocol allocation
Message-ID: <awmL7CdzcH4vmw_i@pluto>
References: <20261124185111.1022322-1-cristian.marussi@arm.com>
 <20261124185111.1022322-3-cristian.marussi@arm.com>
 <20261124145015.0000358e@oss.qualcomm.com>
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
In-Reply-To: <20261124145015.0000358e@oss.qualcomm.com>

On Tue, Nov 24, 2026 at 02:50:15PM -0800, Jonathan Cameron wrote:
> On Tue, 24 Nov 2026 18:51:11 +0000
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Simplify protocol initialization and finalization using cleanup handlers.
> > Relocate the protocol put operations out of the setup and cleanup code so
> > as to be executed strictly after the protocol devres groups have been
> > fully released.
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> Lol. I should have read on! Nice that you have found the time to look at this.
> 
> > ---
> >  drivers/firmware/arm_scmi/driver.c | 53 +++++++++++++-----------------
> >  1 file changed, 22 insertions(+), 31 deletions(-)
> > 
> > diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> > index 2c4424aa0d37..199f0a189432 100644
> > --- a/drivers/firmware/arm_scmi/driver.c
> > +++ b/drivers/firmware/arm_scmi/driver.c
> > @@ -2256,24 +2256,21 @@ static void scmi_protocol_version_initialize(struct device *dev,
> >   *
> >   * Context: Assumes to be called with @protocols_mtx already acquired.
> >   * Return: A reference to a freshly allocated and initialized protocol instance
> > - *	   or ERR_PTR on failure. On failure the @proto reference is at first
> > - *	   put using @scmi_protocol_put() before releasing all the devres group.
> > + *	   or ERR_PTR on failure.
> >   */
> >  static struct scmi_protocol_instance *
> >  scmi_alloc_init_protocol_instance(struct scmi_info *info,
> >  				  const struct scmi_protocol *proto)
> >  {
> > +	const struct scmi_handle *handle = &info->handle;
> > +	struct scmi_protocol_instance *pi;
> >  	int ret = -ENOMEM;
> >  	void *gid;
> > -	struct scmi_protocol_instance *pi;
> > -	const struct scmi_handle *handle = &info->handle;
> >  
> >  	/* Protocol specific devres group */
> >  	gid = devres_open_group(handle->dev, NULL, GFP_KERNEL);
> > -	if (!gid) {
> > -		scmi_protocol_put(proto);
> > -		goto out;
> > -	}
> > +	if (!gid)
> > +		return ERR_PTR(ret);
> >  
> >  	pi = devm_kzalloc_obj(handle->dev, *pi);
> >  	if (!pi)
> > @@ -2328,10 +2325,7 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
> >  	if (pi->proto->instance_deinit)
> >  		pi->proto->instance_deinit(&pi->ph);
> >  clean:
> > -	/* Take care to put the protocol module's owner before releasing all */
> > -	scmi_protocol_put(proto);
> >  	devres_release_group(handle->dev, gid);
> > -out:
> >  	return ERR_PTR(ret);
> >  }
> Better though the devres group approach works best in my view when it's a wrapper
> around a helper.
> 
> 	gid = dev_res_open_group(handle->dev, NULL, GFP_KERNEL);
> 	pi = __scmi_alloc_init_protocol_instance();
> 	if (IS_ERR(pi)) {
> 		devres_release_group(handle->dev, gid);	
> 		return pi;
> 	}
> 
> 	devres_close_group(handlde->dev, gid);
> 	return pi;
> 
> Though here you'd have more or less a wrapper surrounding a wrapper, so fine to
> just push this up into scmi_alloc_init_protocol_instance()
> 
> Anyhow even if you leave like you have it this is a great improvement.
> Lifetimes in these calls are now a little less complex to reason about.

Yes this was definitely some ugly ancient code of mine that needed
definitely to be cleaned-up.

Thanks,
Cristian
