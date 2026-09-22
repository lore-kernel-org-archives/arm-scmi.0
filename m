Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2EF541E75;
	Tue, 22 Sep 2026 14:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088193; cv=none; b=Px3km6VVnAzL58dU4VPaYzAp9bBTztb8fTgiRYS71XwRB7nuWQ83+5vcbt/+gRxuf+6Lsryq+byKnr0WD4iWkmf2kAoNL4ypQkyYd/Ztvig5A/KtuyYExHn2knSBf6cJlDjQrCxpKMkwfzOQ8JPZdK+byQpHveTU62qdEz6OrIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088193; c=relaxed/simple;
	bh=L+MjaNC+6vbVKHKiU5TeC+hR3WeQzvMU3EAJtm6uQow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cthDUNuL4bjCOmBtQBSYzc4bSvzrcFi4Yb+ZsIa3K58SWXGlr7Qbz2nJtQ6U09YhHZmjpyeg92ZOKU2NcAFaygDV9FFPGdlpizq7CFnlpRkUwSxN5X2U5lPiHLqx5hJ1VYl6PezOw9Oi6AgA+jnuG/+OWbZklXlef/3Q1AUftfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i0oQRPoR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i0oQRPoR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8EAF1F000FF;
	Tue, 22 Sep 2026 14:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790088191;
	bh=k/eih6V79KGOxd/VUr7lVIHhXKuG7/wdFpn9jH1v8Js=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=i0oQRPoR2grx2df/MWOgPanqEOnuePmw4f4ocXMvRD2K/a5y2F4+9KVEkqGSWdMJ7
	 qFITaKXfA6eF+B7nRGKoUtlz3sykyZIEVcQF4j82paWq+G9T6GLOKWDMBHIWl68xcF
	 ytVKscnXCFzjqT+K9km1qepD7l4J9/4BQ47/Fo0ToJkTcIMomNwBzxw2hwwwtjNLqS
	 lnyNtWr1QPcJ9dWJCT1Eriohimh+vBtNofNDECnyIkOgozBK+WQNCD/VgqGz6ixtfC
	 fZ25v7Huqkoo08tkf6Dq9TR3/ZbszP6/Sl4J3cd/tn7Pnp4PC7+jUruschgy0VhMo5
	 A17DZeFdiO/zA==
Message-ID: <8fd34672-493b-4d70-a2bd-1fe434b5ccda@kernel.org>
Date: Tue, 22 Sep 2026 16:42:59 +0200
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 06/25] firmware: arm_scmi: Add basic Telemetry support
To: Cristian Marussi <cristian.marussi@arm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org, james.quinlan@broadcom.com,
 f.fainelli@gmail.com, vincent.guittot@linaro.org, etienne.carriere@st.com,
 peng.fan@oss.nxp.com, michal.simek@amd.com, d-gole@ti.com, jic23@kernel.org,
 elif.topuz@arm.com, lukasz.luba@arm.com, philip.radford@arm.com,
 souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
 puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
References: <20260920091928.2014972-1-cristian.marussi@arm.com>
 <20260920091928.2014972-7-cristian.marussi@arm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260920091928.2014972-7-cristian.marussi@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/20/26 11:19, Cristian Marussi wrote:
> Add SCMIv4.0 Telemetry basic support to enable initialization and resources
> enumeration: add all the telemetry messages definitions and parsing logic
> but only a few simple state gathering protocol operations.

As someone unfamiliar with the spec, it would be nice to summarize which parts
of the spec this patch implements, so it's easier to cross-reference.

Same for the other patches. :)

It's a lot to review. So having a better description to guide the reviewer
through the patch would really help. I assume we could split this up further, like

a) Add basic definition (mechanical from the spec)

b) Add telemetry stub and hook it up

c) query attributes

d) intialize X

...

Will result in quite some patches .... so I won't suggest that just yet. Maybe
people familiar with the spec have it easier revieweing this.


> +
> +enum scmi_telemetry_protocol_cmd {
> +	TELEMETRY_LIST_SHMTI = 0x3,
> +	TELEMETRY_DE_DESCRIPTION = 0x4,
> +	TELEMETRY_LIST_UPDATE_INTERVALS = 0x5,
> +	TELEMETRY_DE_CONFIGURE = 0x6,
> +	TELEMETRY_DE_ENABLED_LIST = 0x7,
> +	TELEMETRY_CONFIG_SET = 0x8,
> +	TELEMETRY_READING_COMPLETE = TELEMETRY_CONFIG_SET,

TELEMETRY_READING_COMPLETE is not really a command but listed as a "delated
response". Should this be something separate (and not mangled into protocol_cmd
?). Or is "_cmd" not the right term for this collection?

I have no SCMI experience, so it might be a rather supid queestion.

[...]

> +struct scmi_de_desc {
> +	__le32 id;

I'll make a couple of generic comments, that should apply to most definitions in
here.

In the spec some of these things are prefixed by "de" e.g., "de_id".

Was this deliberate? Having the spec match the implementation allows for easier
grepping of stuff.

> +	__le32 grp_id;

Spec calls this "group_id"

> +	__le32 data_sz;

Spec calls this "de_data_size" etc.

If there is good reason to use slightly different names, best to spell that out
in the patch description.

> +	__le32 attr_1;

E.g., grepping the spec for "attr_1" I get no hits. So I have to remember that
the spec might call this "de_attributes_1"

> +#define	IS_NAME_SUPPORTED(d)	(le32_get_bits((d)->attr_1, BIT(31)))

DE_ATTRIBUTES_1_NAME_SPECIFIED would be clearer. in general, spelling out to
which field a define belongs *might* make it harder to get stuff wrong.

(spec calls it "Named specified" which sounds like a bug)

Same for the other definitions. Again, maybe diverging from the spec is fine.

Personally, I would try to stay as close as possible to the naming in the spec.

[...]
> +
> +static void scmi_telemetry_free_tde_put(struct telemetry_info *ti,
> +					struct telemetry_de *tde)
> +{
> +	struct scmi_telemetry_de_info *info;
> +
> +	guard(mutex)(&ti->free_mtx);
> +	/* Save clear and restore */
> +	info = READ_ONCE(tde->de.info);

Where is the matching WRITE_ONCE? IOW, who is expected to modify this concurrently?

> +	memset(info, 0, sizeof(*info));
> +	memset(tde, 0, offsetof(struct telemetry_de, mtx));
> +	tde->de.info = info;
> +	list_add_tail(&tde->item, &ti->free_des);
> +}
> +

[...]
> +
> +static int scmi_telemetry_protocol_init(const struct scmi_protocol_handle *ph)
> +{
> +	struct device *dev = ph->dev;
> +	struct telemetry_info *ti;
> +	int ret;
> +
> +	dev_dbg(dev, "Telemetry Version %d.%d\n",
> +		PROTOCOL_REV_MAJOR(ph->version), PROTOCOL_REV_MINOR(ph->version));
> +
> +	ti = devm_kzalloc(dev, sizeof(*ti), GFP_KERNEL);
> +	if (!ti)
> +		return -ENOMEM;
> +
> +	ti->ph = ph;
> +
> +	ret = scmi_telemetry_protocol_attributes_get(ti);
> +	if (ret) {
> +		dev_err(dev, FW_BUG "Cannot retrieve protocol attributes. Abort.\n");
> +		return ret;
> +	}
> +
> +	ret = scmi_telemetry_instance_init(ti);
> +	if (ret) {
> +		dev_err(dev, "Cannot initialize instance. Abort.\n");
> +		return ret;
> +	}
> +
> +	ret = scmi_telemetry_enumerate_common_intervals(ti);
> +	if (ret) {
> +		dev_err(dev, FW_BUG "Cannot enumerate update intervals. Abort.\n");
> +		return ret;
> +	}
> +
> +	ret = scmi_telemetry_enumerate_shmti(ti);
> +	if (ret) {
> +		dev_err(dev, FW_BUG "Cannot enumerate SHMTIs. Abort.\n");
> +		return ret;
> +	}
> +
> +	ti->info.base.version = ph->version;

I'm surprised that there is nothing to cleanup on the error paths, but at least
the devm_ stuff is being taken care of I guess.


It's a lot of code, so I only managed to skim briefly over most of it.

-- 
Cheers,

David
