Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE4448A2BC;
	Wed, 23 Sep 2026 14:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174626; cv=none; b=sn1M7DulH/YQV7bE0sgjtGvX0JYvvsc9URcRG2WMqIgremxwSn36YYO5/eXTM94KJW05Z1exRKgKwsrwkDUvHHNZWAGfF3PQhQrZnr0M1eDZ66kwrh/fLNa07nNGqjbniu4o+sddEtERSiHVvicrQsD818MedWwNNF4XE1rTB78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174626; c=relaxed/simple;
	bh=u+HyfpyFWP2o5uLyPv6cq3B/HCxjkliayMjqrodkXaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZ8sOQy1UEkJzkky95n7mnsxiDf3IZ0BwbxuhEoVUYPjSvYCBsTdSNcgjndPLUJIOyQLQYDMVSfTr5aY7fivchQr8lzCGU09uqpmRzb9mJF4Kqm12pw0ovfkXPZN+SBQMqfqYwwvuUKiHJl2FrqMODt1igVdsce9MFGWkx2vz/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YPGuw9QT; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YPGuw9QT"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 710C6152B;
	Wed, 23 Sep 2026 07:43:38 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0CF73F86C;
	Wed, 23 Sep 2026 07:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790174622; bh=u+HyfpyFWP2o5uLyPv6cq3B/HCxjkliayMjqrodkXaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YPGuw9QT+N1uGxSBLKH8C6yhy/e2a8W30O7CLf97saYrAnzxvDzlsd9fdCAvlP771
	 z35ryCsctrwtI1WmDwJ0PB9tDb6JlbE5ZvBcQPxpuGmhIB/z0vWjHjppa09pDFc1e6
	 PmLkxcO3fGERrbmhEQ/pHC0S8evU/AjnYRWuhCnQ=
Date: Wed, 23 Sep 2026 15:43:34 +0100
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
	puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v12 06/25] firmware: arm_scmi: Add basic Telemetry support
Message-ID: <arPlllqG6gCxstMD@pluto>
References: <20260920091928.2014972-1-cristian.marussi@arm.com>
 <20260920091928.2014972-7-cristian.marussi@arm.com>
 <8fd34672-493b-4d70-a2bd-1fe434b5ccda@kernel.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fd34672-493b-4d70-a2bd-1fe434b5ccda@kernel.org>

On Tue, Sep 22, 2026 at 04:42:59PM +0200, David Hildenbrand (Arm) wrote:
> On 9/20/26 11:19, Cristian Marussi wrote:
> > Add SCMIv4.0 Telemetry basic support to enable initialization and resources
> > enumeration: add all the telemetry messages definitions and parsing logic
> > but only a few simple state gathering protocol operations.
> 
> As someone unfamiliar with the spec, it would be nice to summarize which parts
> of the spec this patch implements, so it's easier to cross-reference.
> 
> Same for the other patches. :)

Sure...I will add more descriptive comments.

> 
> It's a lot to review. So having a better description to guide the reviewer
> through the patch would really help. I assume we could split this up further, like
> 
> a) Add basic definition (mechanical from the spec)
> 
> b) Add telemetry stub and hook it up
> 
> c) query attributes
> 
> d) intialize X
> 
> ...
> 
> Will result in quite some patches .... so I won't suggest that just yet. Maybe
> people familiar with the spec have it easier revieweing this.
> 

I'll see if I can split this basic support patch a bit further...

> 
> > +
> > +enum scmi_telemetry_protocol_cmd {
> > +	TELEMETRY_LIST_SHMTI = 0x3,
> > +	TELEMETRY_DE_DESCRIPTION = 0x4,
> > +	TELEMETRY_LIST_UPDATE_INTERVALS = 0x5,
> > +	TELEMETRY_DE_CONFIGURE = 0x6,
> > +	TELEMETRY_DE_ENABLED_LIST = 0x7,
> > +	TELEMETRY_CONFIG_SET = 0x8,
> > +	TELEMETRY_READING_COMPLETE = TELEMETRY_CONFIG_SET,
> 
> TELEMETRY_READING_COMPLETE is not really a command but listed as a "delated
> response". Should this be something separate (and not mangled into protocol_cmd
> ?). Or is "_cmd" not the right term for this collection?
> 
> I have no SCMI experience, so it might be a rather supid queestion.
> 

So in SCMI there are 2 types of commands synchronous and asynchronous:
support for the latter ones is optional AND it is command specific: i.e.
ONLY some commands has an alternative async flavour.

In a nutshell a sync command transaction is made of 2 messages cmd/reply
across the same Agent_2_Platform bidirectional channel...
Instead if a command can be particularly 'heavy/slow' platform side to
satisfy, usually async support is present in the spec: in such case you
have a 3 message transaction:

1. A2P: cmd/reply ... where the reply ONLY carries the status OK

2. P2A: delayed_response ... a later asyncronous further reply that
carries the real content (e.g. a sensor reading that needed a lot of
time for the sensor itself to settle..)

The end result is that the A2P sync channel is NOT kept busy waiting for
the delayed reply...

Having said that, in the spec, while the sync commands are defined
across protocols with a monotonically increasing MSG_ID starting from 0
(with 0,1,2 IDs commonly defined across all protocols), the DELAYED_RESPONSE
are defined to have the same MSG_ID as the sync command for which they
constitues the async part ...

That is the reason we define them in such a way across all of the
existing 10 standard protocols...

> [...]
> 
> > +struct scmi_de_desc {
> > +	__le32 id;
> 
> I'll make a couple of generic comments, that should apply to most definitions in
> here.
> 
> In the spec some of these things are prefixed by "de" e.g., "de_id".
> 
> Was this deliberate? Having the spec match the implementation allows for easier
> grepping of stuff.
> 
> > +	__le32 grp_id;
> 
> Spec calls this "group_id"
> 
> > +	__le32 data_sz;
> 
> Spec calls this "de_data_size" etc.
> 
> If there is good reason to use slightly different names, best to spell that out
> in the patch description.

In general of course I agree with this and try to keep the naming
exactly the same of the spec: in this case there are 2 reasons for the
deviation:

1. EVOLUTION - spec has evolved a lot and names have changed slightly between
   spec revisions AND I have NOT kept up with that...MY BAD...I will fix these
   occurencies

2. READABILITY - some naming is, IMHO, a bit silly/ill chosen in the
   spec because as an example if the implementation follows the spec
   naming pedantically, you would end up dealing with stuff like:

	de->de_id
	de->de_data_size

...so I killed some of this prefixes where from the context in the code and in
the spec SHOULD BE apparent what they represent...

Regarding some other cases like "grp_id" instead of "group_id"...I have NO excuses :D
... just me trying to keep statements short :P

> 
> > +	__le32 attr_1;
> 
> E.g., grepping the spec for "attr_1" I get no hits. So I have to remember that
> the spec might call this "de_attributes_1"

Here is a mix of OLD spec, ill shortening of mine and silly naming I
would probably move this to:

	de->attributes_1
> 
> > +#define	IS_NAME_SUPPORTED(d)	(le32_get_bits((d)->attr_1, BIT(31)))
> 
> DE_ATTRIBUTES_1_NAME_SPECIFIED would be clearer. in general, spelling out to
> which field a define belongs *might* make it harder to get stuff wrong.

Ok...I was trying to avoid cumbersome NAMING while conveying the meaning
BUT I can certainly move to a more pedantic spec-compliant naming...

> 
> (spec calls it "Named specified" which sounds like a bug)

I suppose it is to meant that the optional DE name exist, while avoiding
to use a nomenclature that is too similar to Names and Extended Names as
they are used by all other protocols :D

> 
> Same for the other definitions. Again, maybe diverging from the spec is fine.
> 
> Personally, I would try to stay as close as possible to the naming in the spec.
> 

Yes that would be my aim ...I will fix the needless shortening and align
the name to the last releases spec fiels while still deviating from the
spec ease readability by avoding stuff like de->de_id

> [...]
> > +
> > +static void scmi_telemetry_free_tde_put(struct telemetry_info *ti,
> > +					struct telemetry_de *tde)
> > +{
> > +	struct scmi_telemetry_de_info *info;
> > +
> > +	guard(mutex)(&ti->free_mtx);
> > +	/* Save clear and restore */
> > +	info = READ_ONCE(tde->de.info);
> 
> Where is the matching WRITE_ONCE? IOW, who is expected to modify this concurrently?

Mmmm....right..I'll check...this was added to clear freed strcuture
while preserving some fields ...

> 
> > +	memset(info, 0, sizeof(*info));
> > +	memset(tde, 0, offsetof(struct telemetry_de, mtx));
> > +	tde->de.info = info;
> > +	list_add_tail(&tde->item, &ti->free_des);
> > +}
> > +
> 
> [...]
> > +
> > +static int scmi_telemetry_protocol_init(const struct scmi_protocol_handle *ph)
> > +{
> > +	struct device *dev = ph->dev;
> > +	struct telemetry_info *ti;
> > +	int ret;
> > +
> > +	dev_dbg(dev, "Telemetry Version %d.%d\n",
> > +		PROTOCOL_REV_MAJOR(ph->version), PROTOCOL_REV_MINOR(ph->version));
> > +
> > +	ti = devm_kzalloc(dev, sizeof(*ti), GFP_KERNEL);
> > +	if (!ti)
> > +		return -ENOMEM;
> > +
> > +	ti->ph = ph;
> > +
> > +	ret = scmi_telemetry_protocol_attributes_get(ti);
> > +	if (ret) {
> > +		dev_err(dev, FW_BUG "Cannot retrieve protocol attributes. Abort.\n");
> > +		return ret;
> > +	}
> > +
> > +	ret = scmi_telemetry_instance_init(ti);
> > +	if (ret) {
> > +		dev_err(dev, "Cannot initialize instance. Abort.\n");
> > +		return ret;
> > +	}
> > +
> > +	ret = scmi_telemetry_enumerate_common_intervals(ti);
> > +	if (ret) {
> > +		dev_err(dev, FW_BUG "Cannot enumerate update intervals. Abort.\n");
> > +		return ret;
> > +	}
> > +
> > +	ret = scmi_telemetry_enumerate_shmti(ti);
> > +	if (ret) {
> > +		dev_err(dev, FW_BUG "Cannot enumerate SHMTIs. Abort.\n");
> > +		return ret;
> > +	}
> > +
> > +	ti->info.base.version = ph->version;
> 
> I'm surprised that there is nothing to cleanup on the error paths, but at least
> the devm_ stuff is being taken care of I guess.
> 

This protocol_init function runs within an opened devm_group so that on
failure or when protocol is deinitialized by an unbound driver all is
cleaned up by the core SCMI stack through the devres group...a mechanism that
raised controversy already in the past :D but when all the core SCMI stack
and this mechanism was written there were NO cleanup.h magic available to
ease the development of SCMI protocols....

Anyway this initialization is triggered when one of the SCMI driver
using this protocol is bound and probes on its own...so the devres
machinery is anyway attached, albeit indirectly, to a probe path.

Having said that, in Telemetry I do use cleanup.h during intermediate
allocation and, once the allocation are finalized (no_free_ptr) I attach
a cleanup routine to the devres hooks...(routine which I now needs some
refinement on some err path...) that is the reason of the apparent lack
of freeing path

Thanks,
Cristian
