Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F1C476CE7;
	Wed, 23 Sep 2026 09:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790154455; cv=none; b=iUCBICDZFO9nG6iWJWFxChJ+eah1X0+0EW5dYPsCS+LcbBnCAIUgW9DZITVctOBPluPGxVD+cmb7fkw7skgZkdSA8l290CjQnYpOU6YuEPx2+HeBtT1cr3IRWut74KIh4rRnIvbHgOpv20gajCNHuhHccLtAg3IW3WcAEtP7GK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790154455; c=relaxed/simple;
	bh=ydjqv+vhCg/bF+IeIDvGwKCcrZqtPWRIkTwkdhYtCGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J1Fzbe3M8ER/GRvsvjwQgXvdToCjRpq8Ju7dSpduLBWehhghKvkmsy84T/dCLldis4zmxsDO7muSTPKQDw5WQoW4oScRSuYLwd17UTLY0RcQKs9bmYG0CyyxCjOlFndxekcL+6eLT+MrcZFNZRyalpXubnx0K8xWsqOTtcNh80Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KflVallC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KflVallC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A91061F000FF;
	Wed, 23 Sep 2026 09:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790154453;
	bh=8qYfBP3l0bIaYYx9lxJyE2I7qM/U4w1XTrG1Nu4ZagQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KflVallCyNsdpqhTOTGscBnbizb4oRfsGlcpFCeI0AItfzqu1DZ1WGdshpUeWaBC7
	 0xjv55o/CEsYZL32mmIn6crZRcelbeZH7S+aQ4ffKsBi89PbqTi+8HSTTzaucjqAkI
	 sX2Y9Hh3F0QoEn/gL1OCwDXOB5u330/fkg1Pzcs1B89uNDT7mHiMoOHs19i5nFtsqg
	 EiY5oFDN5gwX24GflFiL7jk/m5AfS83xahfSpjeHjSvUUnSbWboOEX6gGG6TTlu3YE
	 /l9bsljv1N2Dl2nRvH1KG8JtnYqIWHfhknp9zhF5NqOwnZ8xecGKRf0x7nQv/s7vh6
	 ZrOgieiDoTbOw==
Date: Wed, 23 Sep 2026 10:07:29 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
Message-ID: <20260923-sceptical-mauve-firefly-f5456d@sudeepholla>
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <arFKVhlgJge5EZyj@monoceros>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <arFKVhlgJge5EZyj@monoceros>

On Mon, Sep 21, 2026 at 05:19:45PM +0200, Uwe Kleine-König wrote:
> On Fri, Sep 18, 2026 at 11:29:50AM +0200, Hans de Goede wrote:
> > From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > 
> > SCMI client drivers already describe their bus match data with
> > MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
> > SCMI device tables. As a result, SCMI modules do not get generated module
> > aliases from their id tables.
> > 
> > Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
> > visible to modpost, add the corresponding generated offsets and teach
> > file2alias to emit scmi:<protocol>:<name> aliases.
> > 
> > Use the same stable alias format for SCMI device uevents and sysfs
> > modaliases. The previous string included the instance-specific device
> > name, which is not useful for matching modules.
> > 
> > Assisted-by: Codex:GPT-5.5
> > Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

[...]

> > diff --git a/include/linux/device-id/scmi.h b/include/linux/device-id/scmi.h
> > new file mode 100644
> > index 000000000000..1b4ccfa9dcc5
> > --- /dev/null
> > +++ b/include/linux/device-id/scmi.h
> > @@ -0,0 +1,17 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef LINUX_DEVICE_ID_SCMI_H
> > +#define LINUX_DEVICE_ID_SCMI_H
> > +
> > +#ifdef __KERNEL__
> > +#include <linux/types.h>
> > +#endif
> > +
> > +#define SCMI_NAME_SIZE		32
> > +#define SCMI_MODULE_PREFIX	"scmi:"
> > +
> > +struct scmi_device_id {
> > +	__u8 protocol_id;
> > +	char name[SCMI_NAME_SIZE];
> 
> I wonder if you tried to keep this a char *. ISTR someone did something
> similar recently and they claimed it worked. That would get rid of the
> artificial name size limit and simplify this patch.
> 

I agree with this. 

[...]

> > @@ -1491,6 +1502,7 @@ static const struct devtable devtable[] = {
> >  	{"virtio", SIZE_virtio_device_id, do_virtio_entry},
> >  	{"vmbus", SIZE_hv_vmbus_device_id, do_vmbus_entry},
> >  	{"rpmsg", SIZE_rpmsg_device_id, do_rpmsg_entry},
> > +	{"scmi", SIZE_scmi_device_id, do_scmi_entry},
> >  	{"i2c", SIZE_i2c_device_id, do_i2c_entry},
> >  	{"i3c", SIZE_i3c_device_id, do_i3c_entry},
> >  	{"slim", SIZE_slim_device_id, do_slim_entry},
> 
> I wonder if this is supposed to be ordered alphabetically ...
> 

This may be hard, just the best effort unless it is cleaned up first.

Anyways, I plan to send PR by end of the week, so I really need this
in by tomorrow worst case. I am bit worried if there will conflict all
over the place in this file as I know couple of other patches that may
come via other trees touching same entries(one is SMCCC)🤞.

-- 
Regards,
Sudeep
