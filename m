Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC3B49D5A3;
	Wed, 23 Sep 2026 10:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160611; cv=none; b=J6xCJTuaP77EiJQC92Jaq3SxQO1+I8rIrMgTCMg8UucScz2EU9LR2IMhEQbptFRbP8wqqvxfpZbq4tbEj3P1ZwThJXx2x1bPXvnPLVB31IObgLLiUzJ0v0VuhI+yFD87+x3eJNN6i/R/AK95Ug9lh/xmWPSRI2/Q8523fPObP/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160611; c=relaxed/simple;
	bh=fe2Be574znYaJhn5KcQG9t5eDv/cCcGyQskQTpJ670A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nT22mYPWwlk2si3h/IvzsHA7QvLzKNLiCPR9YNomFezuQGXRH2NBzegxtds70YJsQ9qeAFqluE/KBS5PWUeu8Po6LWQ1KrraC3mfMBYyl5IHxN5zooXna7QZKRlnpiCpM/ZmW1s3S17LryJJNl3g5a8Muy+u4ZH16R8XkiHxlqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m7zQ4UMF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m7zQ4UMF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 958D31F000FF;
	Wed, 23 Sep 2026 10:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790160594;
	bh=4TNTZUCyt+nYb86hesWCgcuezHWkYRWLREOW42Tf/CM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m7zQ4UMFe+ukGceYuiH955FOdy0QKHYeoWa0yC22y3jlrRmNNI2wdT7zLOBQqNWhG
	 Hby41LB74rkVFIaMWn0O6rNmalZN2lvD/LR5Q8slMaZCdXRbWiHHwxWp7wKC0KpdIj
	 s6KeeFHdGyVdjqRZXcQHns0YpHK8Fes68MeEMmOsM9afUqMX7G/kKeCXUOvWELTtSK
	 Gi3DwUH1XPS0NqyUweQeDXzAy4Cwlq6KWzdntKptrTVdlMvGr1rBp/7xOmmdbM+qvN
	 8O+zQaD/CuWBHX6+PE749Vrvu5i/3O+s0V6uPrEIDsNDkLicxp9robhaufiPBxQ5Lx
	 hSowP9phV3gpQ==
Date: Wed, 23 Sep 2026 11:49:50 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
Message-ID: <20260923-snake-of-magic-satiation-c3b857@sudeepholla>
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <arFKVhlgJge5EZyj@monoceros>
 <20260923-sceptical-mauve-firefly-f5456d@sudeepholla>
 <6b5a8300-ebf9-4717-bd39-952e89fc5e78@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6b5a8300-ebf9-4717-bd39-952e89fc5e78@oss.qualcomm.com>

On Wed, Sep 23, 2026 at 12:23:50PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 23-Sep-26 11:07, Sudeep Holla wrote:
> > On Mon, Sep 21, 2026 at 05:19:45PM +0200, Uwe Kleine-König wrote:
> >> On Fri, Sep 18, 2026 at 11:29:50AM +0200, Hans de Goede wrote:
> >>> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> >>>
> >>> SCMI client drivers already describe their bus match data with
> >>> MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
> >>> SCMI device tables. As a result, SCMI modules do not get generated module
> >>> aliases from their id tables.
> >>>
> >>> Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
> >>> visible to modpost, add the corresponding generated offsets and teach
> >>> file2alias to emit scmi:<protocol>:<name> aliases.
> >>>
> >>> Use the same stable alias format for SCMI device uevents and sysfs
> >>> modaliases. The previous string included the instance-specific device
> >>> name, which is not useful for matching modules.
> >>>
> >>> Assisted-by: Codex:GPT-5.5
> >>> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> >>> Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> >>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> >>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > 
> > [...]
> > 
> >>> diff --git a/include/linux/device-id/scmi.h b/include/linux/device-id/scmi.h
> >>> new file mode 100644
> >>> index 000000000000..1b4ccfa9dcc5
> >>> --- /dev/null
> >>> +++ b/include/linux/device-id/scmi.h
> >>> @@ -0,0 +1,17 @@
> >>> +/* SPDX-License-Identifier: GPL-2.0-only */
> >>> +#ifndef LINUX_DEVICE_ID_SCMI_H
> >>> +#define LINUX_DEVICE_ID_SCMI_H
> >>> +
> >>> +#ifdef __KERNEL__
> >>> +#include <linux/types.h>
> >>> +#endif
> >>> +
> >>> +#define SCMI_NAME_SIZE		32
> >>> +#define SCMI_MODULE_PREFIX	"scmi:"
> >>> +
> >>> +struct scmi_device_id {
> >>> +	__u8 protocol_id;
> >>> +	char name[SCMI_NAME_SIZE];
> >>
> >> I wonder if you tried to keep this a char *. ISTR someone did something
> >> similar recently and they claimed it worked. That would get rid of the
> >> artificial name size limit and simplify this patch.
> >>
> > 
> > I agree with this. 
> 
> Ok, so I checked and no other include/linux/device-id/*.h file
> defines a foo_device_id field with a type of "char *" and
> then uses that field in scripts/mod/devicetable-offsets.c /
> scripts/mod/file2alias.c .
> 

I looked at hda_device_id and its uses. It looks like it does use
char * and there were loads of drivers initialising the string. I must
be missing something then ?

> 2 device-id/foo.h headers (dmi, pcmcia) do define a "char *"
> field, but then do NOT use that to generate a modalias.
> 
> So scmi_device_id would be the first to do this.
> 

Your response made me dig further and I found snd_hdac_codec_modalias()
which seems to do the magic there.

> Despite that I still gave this a try. Things do compile,
> but it results in a modalias for the scmi-cpufreq driver
> of: scmi:13:(null) and auto-loading unsurprisingly does
> not work.
> 

Fair enough, looking at snd_hdac_codec_modalias() it sounds right.

Uwe, do you think we need to follow something like snd_hdac_codec_modalias()
or this size limit is okay ?

-- 
Regards,
Sudeep
