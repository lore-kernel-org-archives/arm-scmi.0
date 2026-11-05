Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904449;
	b=g4/PwlAAZQ7TjvMUGxeQWhzfnpz0VVMVdlUiDA5V7FGCrOUMq/Ur1Jzo7YpYqvWdXkrO
	 M1pY6Sr7lXPEoeAgeW9GPhSsQr2UeS65BJ8IvhEVD6qfD/Nkq3dLmGIOsfHRxg2wT9OWF
	 AJaqUE05rk4r/o/X33gWCgXeq/HG3hbKIGwgiphxk01TnHE5t/vI8qZiMBqFUv2aiKubX
	 dioGz+YNeR021XnDwtz2KivBKfizsvpf+cJ9Yl+kLi87sBS0TVsmsSMDM3xmH4Z2ZRank
	 YfhsObWvx57c6N3PBUt7xhC1HBA84Dyxw2YfB0PIpxh/Tn/gSSzO4am1ghmZc4IWvUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904449;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=+t9x54f1qNZZiubPPPnaR5/Crj4REu5MeZTCDboVOlA=;
	b=JFH9+XaTsNePHFT6UWHqDjO+U3g69I61Z1WaOCfOpHDCHH0l92dGkm7dEiFUm+UAJLKm
	 O0LC8+EVldmsLys+PQvybeyjEVTh58B5AK+HtJNdrUsJvGN40kQHdVIgAobHwiH/yjcCU
	 Ikg9VLnqvlXc9ShdCrVN60aa5BEZFuL7SCLHVsZaSBUlb+nBsqcygfGpK4dL+2rKi+ZQp
	 lB0uD3MaKxW+JYkOLKFRLTJI4Alw2WK2i/CbB3ikuDpc8wGwLC+ngR1E0ovFGAp7cAxyQ
	 hcFIL92PLE3JE462DC/P3mUvgAXW4bq9KyS8B0oq9qS+Z1JJjRAx6+ijX5wzwaVD15g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=fUlvmVNh;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD0DC606A31B;
	Thu,  5 Nov 2026 18:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD0DC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=fUlvmVNh
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE9A6168F;
	Thu,  5 Nov 2026 10:47:24 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E685D3F632;
	Thu,  5 Nov 2026 10:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793904447; bh=1i7yxbYF9bXMotNb+bc0f+0AFmxxA4a+FAdhjGiafzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fUlvmVNhpgAIEPYzj5Q45phP2LBSIFMetTaOb/ZvXk0FE3u72ct8xjXhIPLoEOptW
	 oM/0jO/P/82GdYj3utvssDmfegm4d+TpDNBONF14hnpaF3WAiHiX5VMsvJrF/49Yqo
	 QDZ6T2Cm78vXmsEWA8b3nxqoD2qTUMgr+orbahV8=
Date: Thu, 5 Nov 2026 18:47:21 +0000
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
Subject: Re: [PATCH v14 07/32] firmware: arm_scmi: Add Telemetry basic
 attributes enumeration
Message-ID: <auzPOVaUqnyfAYjF@pluto>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
 <20261016185553.2794459-8-cristian.marussi@arm.com>
 <20261019142719.00003b78@oss.qualcomm.com>
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
In-Reply-To: <20261019142719.00003b78@oss.qualcomm.com>

On Mon, Oct 19, 2026 at 02:27:19PM -0700, Jonathan Cameron wrote:
> On Fri, 16 Oct 2026 19:55:28 +0100
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Add SCMIv4.0 Telemetry basic support for minimal initialization and
> > protocol attributes enumeration: expose telemetry instance descriptor
> > via a simple information retrieval protocol operation.
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> A few minor comments but nothing I care strongly about.
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> 
> >  #endif /* _SCMI_PROTOCOLS_H */
> > diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> > new file mode 100644
> > index 000000000000..32f6f8d1106d
> > --- /dev/null
> > +++ b/drivers/firmware/arm_scmi/telemetry.c
> > @@ -0,0 +1,148 @@
> 
> > +
> > +enum scmi_telemetry_protocol_cmd {
> 
> Perhaps add a comment on enum scmi_common_cmd containing additional values
> that apply to telemetry.

I'll do.

> 
> > +	TELEMETRY_LIST_SHMTI = 0x3,
> 
> > +
> > +struct telemetry_info {
> > +	bool streaming_mode;
> 
> I'd bring fields of internal tracking structures in only when
> they are used (even if that is just setting them).
> 

I agree....but it has become a bit overwhelming to split this series
while taking care to introduce stuff only at the very last point in time
when it is used...I will try to improve anyway

> > +	unsigned int num_shmti;
> > +	unsigned int num_des_tstamp;
> > +	unsigned int default_blk_ts_rate;
> > +	const struct scmi_protocol_handle *ph;
> > +	struct scmi_telemetry_info info;
> > +};
> > +
> > +static int
> > +scmi_telemetry_protocol_attributes_get(struct telemetry_info *ti)
> > +{
> > +	struct scmi_msg_resp_telemetry_protocol_attributes *resp;
> > +	const struct scmi_protocol_handle *ph = ti->ph;
> > +	struct scmi_xfer *t;
> > +	int ret;
> > +
> > +	ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES, 0,
> > +				      sizeof(*resp), &t);
> > +	if (ret)
> > +		return ret;
> > +
> > +	resp = t->rx.buf;
> > +	ret = ph->xops->do_xfer(ph, t);
> > +	if (!ret) {
> > +		__le32 attr = resp->attributes_1;
> > +		__be32 de_impl_version[SCMI_TLM_DE_IMPL_NUM_DWORDS];
> > +
> 
> > +		for (int i = 0; i < SCMI_TLM_DE_IMPL_NUM_DWORDS; i++)
> > +			de_impl_version[i] =
> > +				cpu_to_be32(le32_to_cpu(resp->de_implem_rev_dword[i]));
> 
> That dance is a swap as data is stored le but UUID fields are be.
> Maybe going via cpu endian is fine as would be silly to have le32_to_be32()
> so it perhaps has documentation value.  Fair enough - I argued myself around
> with agreeing with how you did it here, but left the discussion for anyone
> else who has similar thoughts.

Yes indeed it is awkward but I did not really know how else to do it while
making it clear what was going on...by the spec the UUIDs are BEs in memory
(i.e. when laid out in the SHMTI/TDCF areas) and they are also BE in uuid_t
when 'at rest',  BUT when they are carried in a message payload they have
to be LE since all the SCMI messages payloads are LEs...

> 
> > +		import_uuid(&ti->info.base.primary_revision, (const __u8 *)&de_impl_version);
> > +		ti->info.single_read_support = SUPPORTS_SINGLE_READ(attr);
> > +		ti->info.continuous_update_support = SUPPORTS_CONTINUOS_UPDATE(attr);
> > +		ti->info.per_group_config_support = SUPPORTS_PER_GROUP_CONFIG(attr);
> > +		ti->info.reset_support = SUPPORTS_RESET(attr);
> > +		ti->info.fc_support = SUPPORTS_FC(attr);
> > +		ti->num_shmti = le32_get_bits(attr, GENMASK(15, 0));
> > +		ti->default_blk_ts_rate = le32_to_cpu(resp->default_blk_ts_rate);
> > +	}
> > +
> > +	ph->xops->xfer_put(ph, t);
> > +
> > +	return ret;
> > +}
> 
> > diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> > index 5ab73b1ab9aa..121c83e1c6d8 100644
> > --- a/include/linux/scmi_protocol.h
> > +++ b/include/linux/scmi_protocol.h
> 
> ...
> 
> 
> > +/**
> > + * struct scmi_telemetry_proto_ops - represents the various operations provided
> > + *	by SCMI Telemetry Protocol
> > + *
> > + * @info_get: get the general Telemetry information.
> > + */
> > +struct scmi_telemetry_proto_ops {
> info> +	const struct scmi_telemetry_info __must_check *(*info_get)
> > +		(const struct scmi_protocol_handle *ph);
> 
> Why __must_check?  Be a bit crazy if no one did anything with the
> info they just requested, so that seems overkill and doesn't help with
> the long line.
> 

... indeed this is silly...it cannot even be NULL...I will drop it..

Thanks !
Cristian
