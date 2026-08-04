Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA8B64457A8;
	Tue,  4 Aug 2026 10:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785839990; cv=none; b=kClZ5+5TcIrOsVnxDhrchB5vahlm3g13lmJfQEbZRy+gFeQcYlLJA99hkdZHb0JCDgVrjgqXHWxV5gef4ns+00jAeLDdq43Y/XiDVrpfCexRBlV8k5F+AQCUnJmurQ+aaz56Drn2Qo73E8SCW5epzHLFgMzGHG3pH0Q917KIeUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785839990; c=relaxed/simple;
	bh=gVQqttvdXx3czP0D8ZQjf0BF0PNoIikglrJsh5tdPNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AlWfxfHzGYf2mqqLD4YWWbMqdHxHSYxLhwfVj6iVc943DBIoVfu3QvntvMguRH965CIqDLs05Du/Qb8GGDgpmr6rg68M6zgqfwhd6HyEwnWZWCRlp7X4h3Q9ADG6pFWPqeC4ZysLAWGOMbMGb8MNCCC7eZu+ffITxczP6qLtthY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=goM700yk; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="goM700yk"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CCC61476;
	Tue,  4 Aug 2026 03:39:44 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D9353F86F;
	Tue,  4 Aug 2026 03:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785839988; bh=gVQqttvdXx3czP0D8ZQjf0BF0PNoIikglrJsh5tdPNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=goM700ykIlZQZM3yxmueia6Ug+QFJAnVUCKicYMAmearzqG9V4D7+Rw2nlW5/Dgk4
	 Qu8Uc0VxTw/8peiOKj5HovqW8VmHkViEM3Vr/VGIgwLxICebfLSLbvTGM2W1UCWgsO
	 sdDsn2QY6n1qaEIsWmN60+caR5AicRYDT1rYEMcE=
Date: Tue, 4 Aug 2026 11:39:29 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Fayssal Benmlih <Fayssal.Benmlih@arm.com>
Cc: Cristian Marussi <Cristian.Marussi@arm.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"d-gole@ti.com" <d-gole@ti.com>,
	"david@kernel.org" <david@kernel.org>,
	Elif Topuz <Elif.Topuz@arm.com>,
	"etienne.carriere@st.com" <etienne.carriere@st.com>,
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>,
	"james.quinlan@broadcom.com" <james.quinlan@broadcom.com>,
	"jic23@kernel.org" <jic23@kernel.org>,
	"kas@kernel.org" <kas@kernel.org>,
	"kernel-team@meta.com" <kernel-team@meta.com>,
	"leitao@kernel.org" <leitao@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Lukasz Luba <Lukasz.Luba@arm.com>,
	"michal.simek@amd.com" <michal.simek@amd.com>,
	"peng.fan@oss.nxp.com" <peng.fan@oss.nxp.com>,
	Philip Radford <Philip.Radford@arm.com>,
	"puranjay@kernel.org" <puranjay@kernel.org>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	"sudeep.holla@kernel.org" <sudeep.holla@kernel.org>,
	"usama.arif@linux.dev" <usama.arif@linux.dev>,
	"vincent.guittot@linaro.org" <vincent.guittot@linaro.org>
Subject: Re: [PATCH v7 19/23] uapi: Add ARM SCMI Telemetry definitions
Message-ID: <anHBYe15lb-G3mqd@pluto>
References: <20260802145618.1952804-20-cristian.marussi@arm.com>
 <A113D0AA-C4C5-4694-B3AD-731D6D39666B@contoso.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A113D0AA-C4C5-4694-B3AD-731D6D39666B@contoso.com>

On Mon, Aug 03, 2026 at 11:25:20PM +0100, Fayssal Benmlih wrote:
> Hi Cristian,
> 

Hi,

> A few comments on the updated UAPI inline.
> 
> > struct scmi_tlm_batch {
> > 	__u32 num_items;
> > 	__u32 item_sz;
> > 	__u64 reserved;
> > 	__u64 states;
> > 	__u64 items;
> > };
> 
> Please define an upper bound for num_items. Without a common ABI limit,
> callers can request effectively unbounded allocation and iteration, and
> userspace does not know which sizes the kernel is expected to support.

This structure is meant to be a generic container of different kind of
objects, so the sensible upper bound depends on the contained object...
....num_des mostly, check which I forgot to add, anyway, in the IOCTl
handling...I'll do that and document this...

> 
> >  * @states: A reference to an arrays of u32 items representing the
> >  *	    outcome of the requests for each single item in @items: these are
> >  *	    ordered in the same order as the @items. - OUT
> 
> These statuses contain zero or a negative Linux errno, but the array is
> described as u32 while the implementation uses int *. Could this be
> specified as an array of __s32 so the signed error-value ABI is explicit?

Sure.

> 
> Is states == 0 explicitly supported? The driver treats it as optional and
> stops at the first error when it is absent, potentially after preceding
> configuration changes have succeeded. Please document both the optional
> pointer and the resulting partial-completion semantics.

I'll do.

> 
> > #define SCMI_TLM_SET_CFG	_IOWR(SCMI_TLM_IOCTL_MAGIC, 0x02, struct scmi_tlm_config)
> > [...]
> > #define SCMI_TLM_SET_DE_CFG	_IOWR(SCMI_TLM_IOCTL_MAGIC, 0x05, struct scmi_tlm_batch)
> > [...]
> > #define SCMI_TLM_SET_ALL_CFG	_IOWR(SCMI_TLM_IOCTL_MAGIC, 0x0A, struct scmi_tlm_de_config)
> 
> SET_DE_CFG now returns per-DE tracking information, so _IOWR makes sense
> for that command.
> 
> SET_CFG and SET_ALL_CFG, however, still only consume their arguments and
> do not copy a result back. Unless output is planned, should these two
> commands be _IOW before the ioctl numbers become ABI?
> 

I'll double check all of this.

> > #define SCMI_TLM_BATCH_READ	_IOWR(SCMI_TLM_IOCTL_MAGIC, 0x10, struct scmi_tlm_data_read)
> 
> SCMI_TLM_BATCH_READ is encoded with struct scmi_tlm_data_read, but
> scmi_tlm_des_batch_read_ioctl() copies and interprets struct
> scmi_tlm_batch. These structures are different sizes, so _IOC_SIZE(cmd)
> does not describe what the handler accesses.
> 
> Please use struct scmi_tlm_batch here and update the documentation example
> accordingly.

Indeed..some kind of leftover...the puzzling thing is that it worked fine
when tested even with such mismatched IOC_SIZE()...I'll fix

> 
> A few kerneldoc nits:
> 
> - scmi_tlm_abi_info documents @de_impl_version, but the member is named
>   primary_de_impl_version.
> - scmi_tlm_batch documents @items_sz, but the member is item_sz.
> - scmi_tlm_grp_info documents a reserved member that is not present in the
>   structure.
> 

...ok...so, beside all of the above bugs (and a few more from Sashiko) to be
certainly fixed in the upcoming series, at this point I assume, from the lack
of further comments, that from your userspace perspective the UAPI/ABI is now
sufficiently complete, feature-wise, and the usage model is acceptable.

Thanks,
Cristian
