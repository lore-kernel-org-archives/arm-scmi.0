Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B088A306764;
	Mon, 10 Aug 2026 13:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786369193; cv=none; b=OnA8y09wFXjNeFrO2XWtmfFmhi7jpy31hRN+xj1DGgLzrj0CBW0ysSxvnFUSgw3mnROxGt3n3SnBnD6OPjOl6IErj+TJVypy13hnQuQ534Fsf3KecCyq8FnLsCzn0vVkRfyRl10U9FBFsrmzAZL7GmUhz4Ckebk7lmnFvoxr5Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786369193; c=relaxed/simple;
	bh=shjp+/Kq2EUtVklUKcPCO+yUW41T8QLuqSuqfQiMTGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kw1lw88Go1UEiTg/UFkYO+uBNqo/Nr19sPHtk0ZO6P2r7OuJpQgIjyMvCPHcMiVmNgaz+q4Hv4isjE9ojI6vVO5LuU/0o8NAXAxzg1wAorekuPJkirS07/z7bXwcAT5e9wotn9eZr6XUxnby/uSuT/8FNHTmY1BsYVllObKBINU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qV8cUqo1; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qV8cUqo1"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF6D01477;
	Mon, 10 Aug 2026 06:39:46 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2801C3F632;
	Mon, 10 Aug 2026 06:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786369190; bh=shjp+/Kq2EUtVklUKcPCO+yUW41T8QLuqSuqfQiMTGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qV8cUqo1g6z+Re7R1Xtl3U0Nwkjfma7+DQc3f8eMZI7x4pi03LvMCi53zYsH5Vpns
	 0xKIa8B+YEvq27O+bA4KaBlmMLjcOkODDCPpV02MzaPkoYCtAxqtE2oEaVObCWpJUc
	 ZlOKsNtSIdpN7i3wt2i7yMuaccabLvA1BiyctuoM=
Date: Mon, 10 Aug 2026 14:39:44 +0100
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
Subject: Re: [PATCH v7 06/23] firmware: arm_scmi: Add basic Telemetry support
Message-ID: <annUoAwdtF4unA7q@pluto>
References: <20260802145618.1952804-7-cristian.marussi@arm.com>
 <AFD5A4D3-916E-4989-9F38-F23E7A2BED0B@contoso.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AFD5A4D3-916E-4989-9F38-F23E7A2BED0B@contoso.com>

On Mon, Aug 03, 2026 at 11:53:11PM +0100, Fayssal Benmlih wrote:
> Hi Cristian,
> 

Hi,

> I found a few error-path consistency issues inline.
> 
> > 	tde->de.tstamp_support = !!tde->ts_type;
> > 	/* Count timestamped DEs */
> > 	ti->num_des_tstamp += !!tde->de.tstamp_support;
> > 	tde->de.fc_support = IS_FC_SUPPORTED(desc);
> > 	tde->de.name_support = IS_NAME_SUPPORTED(desc);
> > [...]
> > 	if (rx_len < payld_sz)
> > 		return -ENOSPC;
> 
> num_des_tstamp is incremented before all variable parts of the descriptor
> and the optional fast-channel mapping have been validated.
> 
> If a later validation or ioremap operation fails, the descriptor is
> rejected but the timestamp count is not rolled back. GET_ALL state checks
> can then compare against an inflated timestamp count.
> 
> Please update this counter only after the complete descriptor has been
> validated and successfully registered, or undo it on every later failure.

Fixed in V8.

> 
> > err:
> > 	/* DE not enumerated at this point were created in this call */
> > 	if (discovered)
> > 		scmi_telemetry_free_tde_put(ti, tde);
> >
> > 	return ret;
> 
> At this point descriptor parsing may already have changed fields in tde and
> its associated scmi_telemetry_de_info. The object is returned to the free
> list without resetting that partial state.
> 
> Can the descriptor be fully reset before it is made available for reuse,
> or can parsing be done into temporary state that is committed only after
> all validation succeeds?

Fixed in V8 by clearing the tde descriptor on put.

> 
> > 	for (int i = 0; i < ti->info.base.num_groups; i++) {
> > 		struct scmi_telemetry_group *grp = &rinfo->grps[i];
> > [...]
> > 		grp->des = no_free_ptr(des);
> > 		grp->des_str = no_free_ptr(des_str);
> > 		/* Reset group DE counter */
> > 		grp->info->num_des = 0;
> > 	}
> > [...]
> > 	rinfo->num_groups = ti->info.base.num_groups;
> 
> The per-group allocations are transferred out of automatic cleanup during
> the loop, but rinfo->num_groups is only assigned after every group
> succeeds.

Fixed in v8.

> 
> If allocation for a later group fails, resources_free() calls
> scmi_telemetry_groups_free(), which iterates rinfo->num_groups. Since that
> is still zero, allocations already installed in earlier groups are leaked.
> 
> Please increment a cleanup-visible group count as each group is committed,
> or make cleanup iterate base.num_groups and safely free NULL members.
> 
Added also a rollback logic in V8 (which needs a small further fix in V9
apparently listening to Sashiuko complains....)

Thanks,
Cristian

