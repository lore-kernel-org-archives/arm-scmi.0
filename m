Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FA93998AE
	for <arm-scmi@vger.kernel.org>; Wed,  2 Sep 2026 07:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335475; cv=none; b=pIi/f0GyGLUrr4Z2m6ZbRj7EzaNrPdrLGQZgq1ZMZR59PsQyHss+lINjmLhQZ+NOTcfey9k3qryTOokRzSjSfOXKY81cKJi5eHtqFWstsRJOjgEFRBMXra5i14PJUQiIZrzHMH5bvpW87sTHsgRqYEat1qXrvrepG5DqCwR7z0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335475; c=relaxed/simple;
	bh=no+PIPBftpLuc1GGQiuaMcV0Hofcvd1y8z/XqGt9Y34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qCJVFkA7efuLZdggUO7PEsk0lshUm9nO3BOPIxoCSpWop/7m8bccHOHQzuG/2Gg1X4pu9aX8yTfCeVxN2VRWneV3Kibz063J/jztuSqthD1UbokN1LblG0VwxaoR32w2h3ws7BC0i9jKrbDU9XynlejV6pqd0jggx9H/HbcwQVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mBSh9Qah; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mBSh9Qah"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 874C51F000E9;
	Wed,  2 Sep 2026 07:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788335473;
	bh=K8wBrdWSV92hcb+OGpUJM58MhakZSJllcgFy8ZSCAG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mBSh9Qahbt+37XpHW+HjIn3G4Y8+fqIkLpBwcbylgUvrv0dRAWkinld9EP22jagSL
	 V4ZwlxQd1UHPzBG536m2wHB4/qjFNd4dCL4WvDdN5SsU484xb4ulC3nFRi6tKaLAc+
	 rm/F+uKnZU3u4jRfw2vz2rvpvLsxUw5rQ6ABejmBWitxSgnmHKQPuTM4HnlyUPj4QW
	 A7ji804fBQARmJy5SMytcQ6e51LteVAN6CpdlHKgVqdvs46uh2PesjxHfZtWMsflox
	 teC9dkSUE/Nw1uyAh9NHe5yxkI5Na5pGmb+wSWOMwYc0qtkgDpGH6zHajDPhvz4pby
	 menmGGcGq/s4g==
Date: Wed, 2 Sep 2026 08:51:10 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
	Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 1/9] firmware: arm_scmi: Set fwnode for the generated
 SCMI platform device
Message-ID: <20260902-tireless-steadfast-mongoose-cccac7@sudeepholla>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
 <20260813-acpi_scmi_pcc-v3-1-cb6b88b4ebb3@kernel.org>
 <20260824095121.00001b9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824095121.00001b9c@oss.qualcomm.com>

On Mon, Aug 24, 2026 at 09:51:33AM -0700, Jonathan Cameron wrote:
> On Thu, 13 Aug 2026 12:32:56 +0100
> Sudeep Holla <sudeep.holla@kernel.org> wrote:
> 
> > Add a call to device_set_node() in the SCMI probe helper to associate
> > generated SCMI platform device with the firmware node of its supplier
> > transport device.
> > 
> > This complements device_set_of_node_from_dev() and ensures that
> > firmware node information is propagated correctly for both Device Tree
> > and non-DT (e.g. ACPI) based systems.
> 
> Hi Sudeep,
> 

Hi Jonathan,

Thanks for all the reviews. I was away for a while and started to look at
addressing these now.

> When you say 'complement' I'd like to see a little more.  The guts
> of both calls includes setting dev->ofnode() adn the extra bit
> in device_set_of_node_from_dev() is about ensuring we drop existing
> node reference (there isn't one) and increment the reference for what
> is the parent of_node.
> 

Yes I agree. At the time, when I hacked this up, I was supposed to take
a look at it again which I never did.

> I may be wrong, but I think that is unnecessary and if I'm wrong I'd
> like to see more info here on why it is needed.
> 

No your concerns are valid. For reference-counted non-OF fwnodes like ACPI or
software node, platform_device_release() drops the fwnode reference,
but device_set_node() does not acquire one.

> Also, if this is commonly needed why doesn't device_set_node() include
> that dance?
> 

I think there are new helpers added recently in the tree, thinking of using
then. See below.

> Unless I fumbled the command, a grep suggests there are no instances
> in tree of these both being called near each other.
> 

I did that too before adding but somehow kept it for future investigation.


> Jonathan
> 
> > 
> > Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> > ---
> >  drivers/firmware/arm_scmi/common.h | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
> > index fe8c22cfb9f7..cc7d11c3c1f3 100644
> > --- a/drivers/firmware/arm_scmi/common.h
> > +++ b/drivers/firmware/arm_scmi/common.h
> > @@ -650,6 +650,7 @@ static int __tag##_probe(struct platform_device *pdev)			       \
> >  	}								       \
> >  									       \
> >  	device_set_of_node_from_dev(&spdev->dev, dev);			       \
> > +	device_set_node(&spdev->dev, dev_fwnode(dev));			       \

How about something like this instead of above 2 lines:

if (is_of_node(dev_fwnode(dev)))
	platform_device_set_of_node_from_dev(spdev, dev);
else
	platform_device_set_fwnode(spdev, dev_fwnode(dev));

-- 
Regards,
Sudeep
