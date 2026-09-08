Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57CFD58F07D;
	Tue,  8 Sep 2026 16:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886701; cv=none; b=WFxGYeFzfSlA1+oL3PJ3LrpQT6rtTwisyNEVKhug9kVa2SQXdTgYVWlojlUNhBHXmrcpZMtDa+B8Cz5SaPFq06u41puk1w47J/Jo6ndHc/LKatpYK/X/3Ot6DPs3NUjcRJmy3DWR0qEwkpereJbBxvr7vKt9sruLldM9FHemdV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886701; c=relaxed/simple;
	bh=Pjmk+weOlA9lLevJPXyR4WquqFLLwgOPnyqhfnLzH9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kxBN8QKLASuWaBJMSBetU/lFFbgANdy8Llf2/2AROUH4kGOleqGKOYPo/OBJs10gVnAJ0XDN7SI9KFC9D/KvZu+IXCpl2WXLViqBCkInvcEoTRmUdlw3H+DssAsi9Q2hJZzGl0l3cYNOJ72hgjS3/HVRBYbF2rXjrBzMfMHjVjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=jX+Ba9nc; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jX+Ba9nc"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58F8B1476;
	Tue,  8 Sep 2026 09:58:07 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08F973F7B4;
	Tue,  8 Sep 2026 09:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788886691; bh=Pjmk+weOlA9lLevJPXyR4WquqFLLwgOPnyqhfnLzH9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jX+Ba9ncbXGI0+AWvFkVjJZPabNPVu65zLNl1Gv02DeigqWMdejBzvJUdKa3BnNjd
	 REJc4q6Pk6d4yJ4r5lPWqTNWOaAKy0BHYnc6Oy3cMVxgwdKnccGJUVDAPDbdZ7ix64
	 VWsuSPHDesa/eOdJMB9ANZTv3S5o8CWsh3Vp1uog=
Date: Tue, 8 Sep 2026 17:57:57 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
	sudeep.holla@kernel.org, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	d-gole@ti.com, jic23@kernel.org, elif.topuz@arm.com,
	lukasz.luba@arm.com, philip.radford@arm.com, david@kernel.org,
	souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
	puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v10 06/24] firmware: arm_scmi: Add basic Telemetry support
Message-ID: <aqA-lRSNck82YCss@pluto>
References: <20260815232604.3730754-1-cristian.marussi@arm.com>
 <20260815232604.3730754-7-cristian.marussi@arm.com>
 <20260824140458.000072d3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824140458.000072d3@oss.qualcomm.com>

On Mon, Aug 24, 2026 at 02:04:58PM -0700, Jonathan Cameron wrote:
> On Sun, 16 Aug 2026 00:25:46 +0100
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Add SCMIv4.0 Telemetry basic support to enable initialization and resources
> > enumeration: add all the telemetry messages definitions and parsing logic
> > but only a few simple state gathering protocol operations.
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> Obviously this is huge. I'm not going to look through it all today, but
> some quick comments form the part I did look at.

Thanks...this is the shortened split version :P

> 
> Jonathan
> 
> ...
> 
> > +static void scmi_telemetry_resources_free(void *arg)
> > +{
> > +	struct telemetry_info *ti = arg;
> > +	struct scmi_telemetry_res_info *rinfo = ti->rinfo;
> > +
> > +	/* Ensure rinfo is no more accessible upfront */
> > +	smp_store_release(&ti->rinfo, NULL);
> > +
> > +	for (int i = 0; i < rinfo->num_des; i++) {
> > +		struct telemetry_de *tde = to_tde(rinfo->des[i]);
> > +
> > +		scmi_telemetry_free_tde_put(ti, tde);
> 
> 		scmi_telemetry_free_tde_put(ti, to_tde(rinfo->des[i]));
> Seems resonable to me and avoids the need for the local variable.
> 

Yes indeed...

> > +	}
> > +	xa_destroy(&ti->xa_des);
> > +	kfree(ti->tdes);
> > +	kfree(rinfo->des);
> > +	kfree(rinfo->dei_store);
> > +	scmi_telemetry_groups_free(rinfo);
> > +	kfree(rinfo->grps);
> > +	kfree(rinfo->grps_store);
> > +
> > +	kfree(rinfo);
> > +}
> 
> > +
> > +/**
> > + * scmi_telemetry_resources_enumerate  - Enumeration helper
> > + * @ti: A reference to the telemetry info descriptor for this instance
> > + *
> > + * This helper is configured to be called once on the first enumeration
> > + * attempt, when triggered by invoking ti->res_get() from somewhere else.
> > + * Once run it substitues itself in ti->res_get() with the simple accessor
> > + * __scmi_telemetry_resources_get, which returns a descriptor to the resources
> > + * that were possibly discovered.
> > + *
> > + * Note that, while it attempts to fully enumerate Data Events and Groups, it
> > + * does NOT fail when such enumerations fail, instead it simply gives up with
> > + * the end result that only a partially populated, but consistent, resources
> > + * descriptor will be returned; in such a case the incomplete descriptor will
> > + * be marked as NOT fully_enumerated: this design enables the kernel to deal
> > + * with badly implemented out-of-spec firmware support while keep on providing
> > + * a minimal sane, albeit possibly incomplete, set of telemetry respources.
> > + *
> > + * Return: A reference to a fully or partially populated resources descriptor
> > + */
> > +static struct scmi_telemetry_res_info *
> > +scmi_telemetry_resources_enumerate(struct telemetry_info *ti)
> > +{
> > +	struct scmi_telemetry_res_info *rinfo;
> > +	struct device *dev = ti->ph->dev;
> > +	int ret;
> > +
> > +	/* Ensure local rinfo is initialized */
> > +	rinfo = smp_load_acquire(&ti->rinfo);
> > +
> > +	/*
> > +	 * Ensure this init function can be called only once and
> > +	 * handles properly concurrent calls.
> > +	 */
> > +	if (atomic_cmpxchg(&ti->rinfo_initializing, 0, 1)) {
> > +		if (!completion_done(&ti->rinfo_initdone))
> 
> What's the logic here?  This waits only if others are already
> waiting. Why?
> 

Here the logic is that since res_info holds a lot of Telemetry resources data
and descriptors that are gathered via SCMI enumeration activity and this kind
of enumeration can be pretty much heavy in terms of SCMI message exchanges,
while, at the same time, it is NOT always (theoretically) needed to have such
full set of detailed data, this data is lazily filled-up asyncrhonously
on-demand only when someone ask for it...

...so this function takes care to trigger the enumeration, gather this data
and fill-up res_info when first invoked, while STALLING any other concurrent
thread that happens to trigger that same enumeration at the same time....

...once the enumeration is done and res_info is fully enumerated and available,
this function subsitutes itself in the rfelated callback hook with a plain helper
that returns the, now fully enumerated, res_info and unblocks any
stalled concurrent thread above:

	smp_store_mb(ti->res_get, __scmi_telemetry_resources_get);

> > +			wait_for_completion(&ti->rinfo_initdone);
> > +		goto out;
> 
> return 0;
> 
> > +	}
> > +
> > +	ret = scmi_telemetry_de_descriptors_get(ti);
> > +	if (ret) {
> > +		dev_err(dev, FW_BUG "Cannot fully enumerate DEs resources. Degraded system.\n");
> > +		goto done;
> > +	}
> > +
> > +	ret = scmi_telemetry_enumerate_groups_intervals(ti);
> > +	if (ret) {
> > +		dev_err(dev, FW_BUG "Cannot fully enumerate group intervals. Degraded system.\n");
> > +		goto done;
> > +	}
> > +
> > +	/* Enumeration was fully successful, ensure this is visbile */
> > +	smp_store_release(&rinfo->fully_enumerated, true);
> > +done:
> > +	/* Disable initialization permanently */
> > +	smp_store_mb(ti->res_get, __scmi_telemetry_resources_get);
> > +	complete_all(&ti->rinfo_initdone);
> > +
> > +out:
> 
> labels that just result in returns rarely add to readability of code.
> I'd just return early instead.
> 

Yes...fixed this alreeady in V11.

> > +	return rinfo;
> > +}
> > +
> > +/**
> > + * scmi_telemetry_instance_init  - Instance initializer
> > + * @ti: A reference to the telemetry info descriptor for this instance
> > + *
> > + * Note that this allocates and initialize all the resources possibly needed
> > + * and then setups the @scmi_telemetry_resources_enumerate helper as the
> 
> sets up
> 
> > + * default method for the first call to ti->res_get(): this mechanism enables
> > + * the possibility of optionally implementing deferred enumeration policies
> > + * which optionally delay the discovery phase and related SCMI message exchanges
> > + * to a later point in time.
> > + *
> > + * Return: 0 on Success, errno otherwise
> > + */
> > +static int scmi_telemetry_instance_init(struct telemetry_info *ti)
> > +{
> ...
> 
> > diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> > index 5ab73b1ab9aa..2850b018da0d 100644
> > --- a/include/linux/scmi_protocol.h
> > +++ b/include/linux/scmi_protocol.h
> > @@ -2,16 +2,18 @@
> >  /*
> >   * SCMI Message Protocol driver header
> >   *
> > - * Copyright (C) 2018-2021 ARM Ltd.
> > + * Copyright (C) 2018-2026 ARM Ltd.
> >   */
> >  
> >  #ifndef _LINUX_SCMI_PROTOCOL_H
> >  #define _LINUX_SCMI_PROTOCOL_H
> >  
> >  #include <linux/bitfield.h>
> > +#include <linux/bitops.h>
> >  #include <linux/device.h>
> >  #include <linux/notifier.h>
> >  #include <linux/types.h>
> > +#include <linux/uuid.h>
> >  
> >  #define SCMI_MAX_STR_SIZE		64
> >  #define SCMI_SHORT_NAME_MAX_SIZE	16
> > @@ -824,6 +826,184 @@ struct scmi_pinctrl_proto_ops {
> >  	int (*pin_free)(const struct scmi_protocol_handle *ph, u32 pin);
> >  };
> >  
> > +enum scmi_telemetry_de_type {
> 
> There is quite a bit of stuff here. Seems only related to telemetry
> so maybe a more specific header makes sense for just scmi_telemetry?
> 
> The same applies for some of the other stuff already in this header
> like the sensors protocol elements.

Yes indeed scmi_protocol.h grew big since the bloody SCMI is extensible
and the standard protocols themselves have grow up in number...currently
we have split out ONLY the Vendor protocols headers...

> 
> > +	SCMI_TLM_DE_TYPE_USPECIFIED,
> > +	SCMI_TLM_DE_TYPE_ACCUMUL_IDLE_RESIDENCY,
> > +	SCMI_TLM_DE_TYPE_ACCUMUL_IDLE_COUNTS,
> > +	SCMI_TLM_DE_TYPE_ACCUMUL_OTHERS,
> > +	SCMI_TLM_DE_TYPE_INSTA_IDLE_STATE,
> > +	SCMI_TLM_DE_TYPE_INSTA_OTHERS,
> > +	SCMI_TLM_DE_TYPE_AVERAGE,
> > +	SCMI_TLM_DE_TYPE_STATUS,
> > +	SCMI_TLM_DE_TYPE_RESERVED_START,
> > +	SCMI_TLM_DE_TYPE_RESERVED_END = 0xef,
> > +	SCMI_TLM_DE_TYPE_OEM_START = 0xf0,
> > +	SCMI_TLM_DE_TYPE_OEM_END = 0xff,
> > +};
> > +
> > +enum scmi_telemetry_compo_type {
> > +	SCMI_TLM_COMPO_TYPE_USPECIFIED,
> > +	SCMI_TLM_COMPO_TYPE_CPU,
> > +	SCMI_TLM_COMPO_TYPE_CLUSTER,
> > +	SCMI_TLM_COMPO_TYPE_GPU,
> > +	SCMI_TLM_COMPO_TYPE_NPU,
> > +	SCMI_TLM_COMPO_TYPE_INTERCONNECT,
> > +	SCMI_TLM_COMPO_TYPE_MEM_CNTRL,
> > +	SCMI_TLM_COMPO_TYPE_L1_CACHE,
> > +	SCMI_TLM_COMPO_TYPE_L2_CACHE,
> > +	SCMI_TLM_COMPO_TYPE_L3_CACHE,
> > +	SCMI_TLM_COMPO_TYPE_LL_CACHE,
> > +	SCMI_TLM_COMPO_TYPE_SYS_CACHE,
> > +	SCMI_TLM_COMPO_TYPE_DISP_CNTRL,
> > +	SCMI_TLM_COMPO_TYPE_IPU,
> > +	SCMI_TLM_COMPO_TYPE_CHIPLET,
> > +	SCMI_TLM_COMPO_TYPE_PACKAGE,
> > +	SCMI_TLM_COMPO_TYPE_SOC,
> > +	SCMI_TLM_COMPO_TYPE_SYSTEM,
> > +	SCMI_TLM_COMPO_TYPE_SMCU,
> > +	SCMI_TLM_COMPO_TYPE_ACCEL,
> > +	SCMI_TLM_COMPO_TYPE_BATTERY,
> > +	SCMI_TLM_COMPO_TYPE_CHARGER,
> > +	SCMI_TLM_COMPO_TYPE_PMIC,
> > +	SCMI_TLM_COMPO_TYPE_BOARD,
> > +	SCMI_TLM_COMPO_TYPE_MEMORY,
> > +	SCMI_TLM_COMPO_TYPE_PERIPH,
> > +	SCMI_TLM_COMPO_TYPE_PERIPH_SUBC,
> > +	SCMI_TLM_COMPO_TYPE_LID,
> > +	SCMI_TLM_COMPO_TYPE_DISPLAY,
> > +	SCMI_TLM_COMPO_TYPE_RESERVED_START = 0x1d,
> > +	SCMI_TLM_COMPO_TYPE_RESERVED_END = 0xdf,
> > +	SCMI_TLM_COMPO_TYPE_OEM_START = 0xe0,
> > +	SCMI_TLM_COMPO_TYPE_OEM_END = 0xff,
> > +};
> > +
> > +#define	SCMI_TLM_GET_UPDATE_INTERVAL_SECS(x)	(FIELD_GET(GENMASK(20, 5), (x)))
> > +#define SCMI_TLM_GET_UPDATE_INTERVAL_EXP(x)	(sign_extend32((x), 4))
> > +
> > +#define SCMI_TLM_GET_UPDATE_INTERVAL(x)		(FIELD_GET(GENMASK(20, 0), (x)))
> > +#define SCMI_TLM_BUILD_UPDATE_INTERVAL(s, e)				    \
> > +	(FIELD_PREP(GENMASK(20, 5), (s)) | FIELD_PREP(GENMASK(4, 0), (e)))
> > +
> > +enum scmi_telemetry_collection {
> > +	SCMI_TLM_ONDEMAND,
> > +	SCMI_TLM_NOTIFICATION,
> > +	SCMI_TLM_SINGLE_READ,
> > +};
> > +
> > +#define SCMI_TLM_GRP_INVALID		0xFFFFFFFF
> > +
> > +struct scmi_telemetry_intervals {
> > +	unsigned int grp_id;
> > +	bool discrete;
> > +	unsigned int num_intervals;
> > +#define SCMI_TLM_UPDATE_INTVL_SEGMENT_LOW	0
> > +#define SCMI_TLM_UPDATE_INTVL_SEGMENT_HIGH	1
> > +#define SCMI_TLM_UPDATE_INTVL_SEGMENT_STEP	2
> > +	unsigned int update_intervals[] __counted_by(num_intervals);
> > +};
> > +
> > +struct scmi_telemetry_grp_info {
> > +	unsigned int grp_id;
> > +	unsigned int num_des;
> > +	unsigned int num_intervals;
> > +};
> > +
> > +struct scmi_telemetry_group {
> > +	bool enabled;
> > +	bool tstamp_enabled;
> > +	unsigned int *des;
> > +	char *des_str;
> > +	struct scmi_telemetry_grp_info *info;
> > +	unsigned int active_update_interval;
> > +	struct scmi_telemetry_intervals *intervals;
> > +	enum scmi_telemetry_collection current_mode;
> > +};
> > +
> > +struct scmi_telemetry_de_info {
> > +	unsigned int id;
> > +	unsigned int grp_id;
> > +	unsigned int data_sz;
> > +	unsigned int type;
> > +	unsigned int unit;
> > +	int unit_exp;
> > +	unsigned int ts_rate;
> > +	unsigned int instance_id;
> > +	unsigned int compo_instance_id;
> > +	unsigned int compo_type;
> > +	bool persistent;
> > +	char name[16];
> > +};
> > +
> > +struct scmi_telemetry_de {
> > +	bool tstamp_support;
> > +	bool fc_support;
> > +	bool name_support;
> > +	struct scmi_telemetry_de_info *info;
> > +	struct scmi_telemetry_group *grp;
> > +	bool enabled;
> > +	bool tstamp_enabled;
> > +};
> > +
> > +struct scmi_telemetry_res_info {
> > +	bool fully_enumerated;
> > +	unsigned int num_des;
> > +	struct scmi_telemetry_de **des;
> > +	struct scmi_telemetry_de_info *dei_store;
> > +	unsigned int num_groups;
> > +	struct scmi_telemetry_group *grps;
> > +	struct scmi_telemetry_grp_info *grps_store;
> > +};
> > +
> > +struct scmi_telemetry_base_info {
> > +	unsigned int version;
> > +	uuid_t primary_revision;
> > +	unsigned int num_des;
> > +	unsigned int num_groups;
> > +	unsigned int num_intervals;
> > +	unsigned int num_shmtis;
> > +};
> > +
> > +struct scmi_telemetry_shmti_info {
> > +	unsigned int sid;
> > +	unsigned int len;
> > +	unsigned long offset;
> > +	phys_addr_t phys;
> > +};
> > +
> > +struct scmi_telemetry_info {
> > +	bool single_read_support;
> > +	bool continuos_update_support;
> > +	bool per_group_config_support;
> > +	bool reset_support;
> > +	bool fc_support;
> > +	struct scmi_telemetry_base_info base;
> > +	unsigned int active_update_interval;
> > +	struct scmi_telemetry_intervals *intervals;
> > +	struct scmi_telemetry_shmti_info **shmtis;
> > +	unsigned int num_uuids;
> > +	uuid_t **uuids;
> 
> I'm going to guess a __counted_by_ptr marking makes sense here.
> (I haven't checked!) I won't bother calling out other cases, but
> looks like there may well be some above.
> 

I'll check

> > +	bool enabled;
> > +	bool notif_enabled;
> > +	enum scmi_telemetry_collection current_mode;
> > +};
>

Thanks,

for the review and sorry for the chronic delay in my replies but there
is a lot of cleanup work in-progress due to Sashiko feedback too, so the
review/reply cycle became a bit sloppy...

Cristian
