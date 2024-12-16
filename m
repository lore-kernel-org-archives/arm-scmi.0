Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8967203D56
	for <arm-scmi@vger.kernel.org>; Mon, 16 Dec 2024 10:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734345939; cv=none; b=k3HwiN+z4NUApTegkqxpg8SyewTgXVfip0QlhTnp22fHF/9rJOqkHwBvFpE2x8aLIlJGgHuqGC6MmS70YsyxDRF3Kt0wY3nd0pzsXINLYy7OD2SW48DsgFafoY6a0hQR8Cs4/DRia3fFSQOFq8L9JAgpSKRauaqGmtwe04cgtMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734345939; c=relaxed/simple;
	bh=jnTLSs5mnfl4FLksYpGoCGFCM0/LMwU7ZhV65K+oyTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kNhCsd2hZqQfgkwRTcWIKseuYkR6OiAVHyw5D2DlI9zkm86tQiJLo9GCEXfaINKKy1GYjKPllINARaq0WBZEkI/kL/DhW6T1p74JRRdz/NIS+zBw6re9ZUBhHeu8DkkWnMLoIijc4M16WFkGnEKnmfIPG3Ha/QBCSml0HnpGkLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E553D113E;
	Mon, 16 Dec 2024 02:46:03 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 96B153F58B;
	Mon, 16 Dec 2024 02:45:34 -0800 (PST)
Date: Mon, 16 Dec 2024 10:45:32 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: gchen chen <gchen.guomin@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, guomin_chen@sina.com,
	Xinqi Zhang <quic_xinqzhan@quicinc.com>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, dan.carpenter@linaro.org
Subject: Re: [PATCH v2] firmware: arm_scmi: Delete the meaningless
 scmi_bus_id.
Message-ID: <Z2AEzHc5f6TjxErs@bogus>
References: <20241216073745.2973317-1-guomin_chen@sina.com>
 <Z1_p0nU93PHJ4Sg_@pluto>
 <Z1_2rxJ7TOEIOMp7@pluto>
 <CAEEwsfRhe4-YAwe027huSXwFfkV-O-8w1GDNf=URa9efRsXiKA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEEwsfRhe4-YAwe027huSXwFfkV-O-8w1GDNf=URa9efRsXiKA@mail.gmail.com>

On Mon, Dec 16, 2024 at 06:37:01PM +0800, gchen chen wrote:
> Cristian Marussi <cristian.marussi@arm.com> 于2024年12月16日周一 17:45写道：
> >
> > On Mon, Dec 16, 2024 at 08:50:26AM +0000, Cristian Marussi wrote:
> > > On Mon, Dec 16, 2024 at 03:37:45PM +0800, guomin_chen@sina.com wrote:
> > > > From: guomin chen <guomin_chen@sina.com>
> > > >
> > > > Currently, scmi_bus_id is only used to set scmi_dev.id,
> > > > which in turn sets the SCMI device name. After removing
> > > > scmi_bus_id, it is clearer and more meaningful to directly
> > > > use the unique tuple [Parent name,device name, protocol] to
> > > > set the SCMI device name.
> > > >
> > >
> > > Hi Guomin,
> > >
> > > this same pTCH was NACKed(Rejected) a few days ago:
> > >
> > > https://lore.kernel.org/arm-scmi/20241211134505.2218386-1-guomin_chen@sina.com/T/#u
> > >
> > > ...and you agreed that is not a simplification we can do (not to break
> > > multuple instances...)...
> > >
> > > ..so why you are posting V2 now ?
> >
> > Wait...you changed slightly this indeed....you are using dev_parent...my
> > bad...but please when you post new version of a patch add a summary of
> > changes between versions...
> >
> > >
> > > Thanks,
> > > Cristian
> > >
> > > > Signed-off-by: guomin chen <guomin_chen@sina.com>
> > > > ---
> > > >  drivers/firmware/arm_scmi/bus.c    | 17 +++--------------
> > > >  drivers/firmware/arm_scmi/driver.c |  4 ++--
> > > >  2 files changed, 5 insertions(+), 16 deletions(-)
> > > >
> > > > diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> > > > index 157172a5f2b5..800e8ec9357c 100644
> > > > --- a/drivers/firmware/arm_scmi/bus.c
> > > > +++ b/drivers/firmware/arm_scmi/bus.c
> > > > @@ -20,7 +20,6 @@
> > > >  BLOCKING_NOTIFIER_HEAD(scmi_requested_devices_nh);
> > > >  EXPORT_SYMBOL_GPL(scmi_requested_devices_nh);
> > > >
> > > > -static DEFINE_IDA(scmi_bus_id);
> > > >
> > > >  static DEFINE_IDR(scmi_requested_devices);
> > > >  /* Protect access to scmi_requested_devices */
> > > > @@ -341,7 +340,6 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
> > > >     if (scmi_dev->protocol_id == SCMI_PROTOCOL_SYSTEM)
> > > >             atomic_set(&scmi_syspower_registered, 0);
> > > >
> > > > -   ida_free(&scmi_bus_id, scmi_dev->id);
> > > >     device_unregister(&scmi_dev->dev);
> > > >  }
> > > >
> > > > @@ -349,7 +347,7 @@ static struct scmi_device *
> > > >  __scmi_device_create(struct device_node *np, struct device *parent,
> > > >                  int protocol, const char *name)
> > > >  {
> > > > -   int id, retval;
> > > > +   int retval;
> > > >     struct scmi_device *scmi_dev;
> > > >
> > > >     /*
> > > > @@ -387,20 +385,13 @@ __scmi_device_create(struct device_node *np, struct device *parent,
> > > >             return NULL;
> > > >     }
> > > >
> > > > -   id = ida_alloc_min(&scmi_bus_id, 1, GFP_KERNEL);
> > > > -   if (id < 0) {
> > > > -           kfree_const(scmi_dev->name);
> > > > -           kfree(scmi_dev);
> > > > -           return NULL;
> > > > -   }
> > > > -
> > > > -   scmi_dev->id = id;
> > > >     scmi_dev->protocol_id = protocol;
> > > >     scmi_dev->dev.parent = parent;
> > > >     device_set_node(&scmi_dev->dev, of_fwnode_handle(np));
> > > >     scmi_dev->dev.bus = &scmi_bus_type;
> > > >     scmi_dev->dev.release = scmi_device_release;
> > > > -   dev_set_name(&scmi_dev->dev, "scmi_dev.%d", id);
> > > > +   dev_set_name(&scmi_dev->dev, "scmi_dev.%s.%s.%d", dev_name(parent),
> > > > +                   scmi_dev->name, protocol);
> > > >
> >
> > So now you are using the parent top node SCMI device to create a unique
> > device...and it probably endup in a name like:
> >
> >         scmi-dev.arm-scmi.0.auto.genpd.13
> >
> >         scmi-dev.arm-scmi.1.auto.genpd.13
> >
> > ...that certainly is more readable but is bulky and anyway giving unique
> > IDs to devices is pretty common and you lookup which device is which by
> > simply looking at the drivers/ link....not suure what's the benefit of
> > all of this...just to avoid an IDA table ?
> >
> > > >     retval = device_register(&scmi_dev->dev);
> > > >     if (retval)
> > > > @@ -413,7 +404,6 @@ __scmi_device_create(struct device_node *np, struct device *parent,
> > > >     return scmi_dev;
> > > >  put_dev:
> > > >     put_device(&scmi_dev->dev);
> > > > -   ida_free(&scmi_bus_id, id);
> > > >     return NULL;
> > > >  }
> > > >
> > > > @@ -526,7 +516,6 @@ static void __exit scmi_bus_exit(void)
> > > >      */
> > > >     scmi_devices_unregister();
> > > >     bus_unregister(&scmi_bus_type);
> > > > -   ida_destroy(&scmi_bus_id);
> > > >  }
> > > >  module_exit(scmi_bus_exit);
> > > >
> > > > diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> > > > index 1b5fb2c4ce86..bbf1f05f2be3 100644
> > > > --- a/drivers/firmware/arm_scmi/driver.c
> > > > +++ b/drivers/firmware/arm_scmi/driver.c
> > > > @@ -2641,8 +2641,8 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
> > > >     cinfo->max_msg_size = info->desc->max_msg_size;
> > > >
> > > >     /* Create a unique name for this transport device */
> > > > -   snprintf(name, 32, "__scmi_transport_device_%s_%02X",
> > > > -            idx ? "rx" : "tx", prot_id);
> > > > +   snprintf(name, 32, "__scmi_transport_device_%s",
> > > > +            idx ? "rx" : "tx");
> >
> > I agree on what Dan said AND also this results in having the same name for different
> > devices across 2 instances if you have a per-protocol channel because you havent anymore
> > the protocol_id bit.
> hi  Cristian，and dan
>     Because I used a 3-tuple [parent name, name, protocol] when
> creating the SCMI device name, I removed the prot_id from the
> parameter ‘name’ when creating transport devices. This way, it avoids
> the repetition of protocol ID in the SCMI device name.
> 
> > All in all, I would drop this patch and keep naming as it is because I dont see a real benefit
> > here....up to Sudeep decide.
>      Yes, it does not have real benefits, but from the perspective of
> the device name, this change will be clearer and more meaningful. And
> the code is more concise.
>

I would like to understand the motivation behind this change. What is the
goal ? Do you prefer to fetch the name and protocol id from the device
name itself ? Is that your requirement.

From the commit log, I get a sense that you looked at the code and thought
of possible improvement but when we mentioned the limitation you just
improvised by adding parent name. Do you expect any userspace to parse
the name as that will end up being ABI and we can't break it. I need
real motive to be explained here in detail.

--
Regards,
Sudeep
