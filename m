Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 588E539CCF3;
	Mon, 10 Aug 2026 14:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786370801; cv=none; b=KvdWsS+5mMlTPLvZ93f4+Dcg+l1tDU/nMnkVUeN9RYxjIozp5uKTXFoaAb9E00srjUS5vwCsDbsvuzfbnY7TsrnhNZTjPyeJ+TQY3MLCbAaYJSMuaX3YTQdJe7XYeejY9DdrqEKiZb5ST+DishzgpViydFzjbvvqpABV2mKZFTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786370801; c=relaxed/simple;
	bh=g0uhoRWFHTdZ0ZzOAruGkjDRXU4y6osHC2aJvMRyUpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ok/q6bEaIfn3iLTmI3XRQ770rwQ3qezwY64uCfm8ivOFJRlAY6ElVoBFWJdbKOzy1WdLBExGJZTI7TdWXS6re735L1B8uZa92CxD+eAdx/t9ULMmlJtcq9PilyFwB1E9COcUB3JoK8el89AlTCEldLwBUUybdi5QGAerG0ZV7EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=n70Zq9NL; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="n70Zq9NL"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50E6C14BF;
	Mon, 10 Aug 2026 07:06:34 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9AFC63F86F;
	Mon, 10 Aug 2026 07:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786370798; bh=g0uhoRWFHTdZ0ZzOAruGkjDRXU4y6osHC2aJvMRyUpw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n70Zq9NLuvxW4PokNrRgSlYia+5IhNEe1yc2lTVe0vuUYymGQ24EIoRAHnqCfPXX3
	 W4Qahaev+O7/LzqQOA89QYuvpKfsmr+jCwPlqD/6VR3C3ht9MtdGKiW4nH99Vr7esI
	 tTTCYfyU2Rh1RyRYIN1JFQAo2Qh/uK957/FroeQQ=
Date: Mon, 10 Aug 2026 15:06:27 +0100
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
Subject: Re: [PATCH v7 07/23] firmware: arm_scmi: Add support to parse SHMTIs
 areas
Message-ID: <anna43kYrUld7J-r@pluto>
References: <20260802145618.1952804-8-cristian.marussi@arm.com>
 <A88E25CA-4474-4937-9CCE-DAA62D481E92@contoso.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A88E25CA-4474-4937-9CCE-DAA62D481E92@contoso.com>

On Mon, Aug 03, 2026 at 11:53:45PM +0100, Fayssal Benmlih wrote:
> Hi Cristian,
> 

Hi,

> I found two UUID database issues that appear to be blockers.
> 
> > 	if (ti->info.num_uuids + SCMI_UUID_DB_THRESH >= ti->uuids_len) {
> > 		uuid_t **uuids, **old_uuids;
> >
> > 		uuids = kcalloc(ti->uuids_len * 2, sizeof(*uuids),
> > 				GFP_KERNEL);
> > 		if (!uuids)
> > 			return -ENOMEM;
> >
> > 		/* Copy/move old allocated UUIDs */
> > 		for (int i = 0; i < ti->info.num_uuids; i++)
> > 			uuid_copy(uuids[i], ti->info.uuids[i]);
> 
> uuids is a newly allocated and zeroed array of uuid_t pointers, so
> uuids[i] is NULL here. uuid_copy() therefore copies into a NULL
> destination when the database grows with existing entries.
> 
> The database stores pointers to UUIDs owned by telemetry_uuid objects, so
> should this instead copy the pointers themselves, for example:
> 
> 	uuids[i] = ti->info.uuids[i];
>

Exactly...my bad .. fixed in V8.

> or use an appropriately sized memcpy() of the pointer array?
> 
> > 	ti->uuids_len = ti->num_shmti * 2;
> > 	ti->info.uuids = kcalloc(ti->uuids_len,
> > 				 sizeof(*ti->info.uuids),
> > 				 GFP_KERNEL);
> 
> A valid implementation can have zero SHMTIs while exposing fast-channel or
> notification-only DEs. In that case uuids_len is zero.
> 
> Primary UUID creation then enters the resize path, doubles zero to zero,
> and eventually writes the primary UUID pointer through a zero-size
> allocation.
> 
> Please give the UUID database a nonzero minimum initial capacity and use
> checked growth so that zero cannot remain zero.
> 

Done in V8, since Primary is always present AND also we'd like to avoid
to immediately resize the Array so initial len is set to at least
SCMI_UUID_DB_THRESH + 1

> > static void scmi_telemetry_line_put(struct telemetry_line *line,
> > 				    void *blob)
> > {
> > 	if (refcount_dec_and_test(&line->users)) {
> > 		xa_erase(line->xa_lines,
> > 			 (unsigned long)line->payld);
> > 		kfree(blob);
> > 	}
> > }
> 
> Lookups and refcount increments are serialized using lines_mtx, but this
> final decrement, XArray erase and free are not performed under the same
> lock.
> 
> A concurrent get-or-create operation can load the entry while another
> thread decrements the refcount to zero and frees it. Please serialize the
> final put with lookup/creation, or use a lifetime scheme such as
> refcount_inc_not_zero() with appropriate XArray/RCU protection.
> 

I have reviewed/reworked all of the lines internal and external mutexing
in V8 due to also a ton of Sashiko reports...

Thanks,
Cristian
