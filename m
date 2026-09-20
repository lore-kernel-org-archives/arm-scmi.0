Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0DB3E0C77;
	Sun, 20 Sep 2026 07:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789889778; cv=none; b=sPRXZWjBdTXlVLvv/I2NhIIIP1ITE+yvrvA7U55EtFu5GvJQ05cv8u3uE7wCmTtn77pw9QxN5quxRZkoOqSy7JKSyOlCpHqD6q7mQDqY84W8bXyA5gXE0kZZitmMaaVcCnteWM8FRyByQc2ew2yavFSNaba7MKCW+f1uwj+V7To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789889778; c=relaxed/simple;
	bh=xX1LSEoZ3dwDjDnKmuIHZWYp43YUm/oJAA45zvpoARg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqBUPMXA3kmF2sQLrPmZEOCZr9LhBisAYvp61Bx+FSkeouBhWw5sa7fW7i3yDNE1vo3o5xXLTi2w76s0WOF6ZfwKlkAV4DCY1CjZTqtFAF8vcURcT9gJnkM7V/uhQcrvTGYtj3FqtonksL6bMT13HMk14ffYWVNyV3FjXu8gTfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X068IliF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X068IliF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DCF71F000FF;
	Sun, 20 Sep 2026 07:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789889775;
	bh=4Qqpemvz6WSIKkr9IPGGKele4il1P3GXbI51Zv8b8OE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X068IliFC9A6G7ylGRiKhN/uzpjpy82ovm6g6ki3vlZ4vNIcz7JtkA/61v2y14xaK
	 64ZkVVQm1I1j6kpePue9XzmixDWRRtJaGhjEl+eLvmVPvJY+l8P3h8yUoSl6/Wd+Ww
	 MFwA371JMy7qspAYz+BSIYNKUmypSDcAtOWRYqjamORQIwU3qFamQEiM5Xp8qJtj6+
	 HoUjhsgjJHxyafszzcdWt0bCl36nUejf7n86PUckpY1C+yTIoFuMfEaTY/0t3l8BP3
	 JZ1TsJXlNy8v0CT8Lhez6aZybJRUG+ekWwpHNffJdsvpEC639Wlgq+FiAwA6QsN6R6
	 4SKfKicgoQUKA==
Date: Sun, 20 Sep 2026 08:36:10 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
Message-ID: <20260920-hippo-of-immense-assurance-50a5fd@sudeepholla>
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <20260918-impetuous-daring-barnacle-1ea4d0@sudeepholla>
 <dca62a09-2af7-463e-9ba0-1be935a95502@oss.qualcomm.com>
 <aq2g9otvja7xQqJ_@monoceros>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aq2g9otvja7xQqJ_@monoceros>

On Fri, Sep 18, 2026 at 10:39:46PM +0200, Uwe Kleine-König wrote:
> On Fri, Sep 18, 2026 at 04:09:36PM +0200, Hans de Goede wrote:
> > Hi Sudeep,
> > 
> > On 18-Sep-26 15:32, Sudeep Holla wrote:
> > 
> > [...]
> > 
> > >> diff --git a/include/linux/device-id/scmi.h b/include/linux/device-id/scmi.h
> > >> new file mode 100644
> > >> index 000000000000..1b4ccfa9dcc5
> > >> --- /dev/null
> > >> +++ b/include/linux/device-id/scmi.h
> > >> @@ -0,0 +1,17 @@
> > >> +/* SPDX-License-Identifier: GPL-2.0-only */
> > >> +#ifndef LINUX_DEVICE_ID_SCMI_H
> > >> +#define LINUX_DEVICE_ID_SCMI_H
> > >> +
> > >> +#ifdef __KERNEL__
> > >> +#include <linux/types.h>
> > >> +#endif
> > >> +
> > >> +#define SCMI_NAME_SIZE		32
> > >> +#define SCMI_MODULE_PREFIX	"scmi:"
> > >> +
> > >> +struct scmi_device_id {
> > >> +	__u8 protocol_id;
> > >> +	char name[SCMI_NAME_SIZE];
> > >> +};
> > >> +
> > >> +#endif /* ifndef LINUX_DEVICE_ID_SCMI_H */
> > > 
> > > You need to include this above file in include/linux/mod_devicetable.h
> > > to avoid duplication of its inclusion elsewhere. That's the pattern followed
> > > I see.
> > 
> > That is what I did for v3, but Uwe, who is leading the splitting
> > of mod_devicetable.h from one large monster include to smaller
> > per subsystem/bus includes explicitly requested me to follow this
> > pattern, see:
> > 
> > https://lore.kernel.org/arm-scmi/aow2GFAfy84k-N2B@monoceros/
> > 
> > [...]
> > 
> > >> diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
> > >> index b4178c42d08f..91ec3704ee2b 100644
> > >> --- a/scripts/mod/devicetable-offsets.c
> > >> +++ b/scripts/mod/devicetable-offsets.c
> > >> @@ -1,5 +1,6 @@
> > >>  // SPDX-License-Identifier: GPL-2.0
> > >>  #define COMPILE_OFFSETS
> > >> +#include <linux/device-id/scmi.h>
> > > 
> > > Drop this for above mentioned reason.
> > 
> > This was explictly added at request of Uwe because the goal is to
> > get rid of mod_devicetable.h including all the device-id headers
> > in a big single catch-all include. This is done because currently
> > many files include mod_devicetable.h and then if any of the device-id
> > headers changes everything needs to be rebuild, making incremental
> > kernel builds much slower.
> > 
> > (and the same for the second include you point out)
> 
> FTR: That all sounds right.
> 
> Let's not add the the dependency mess that is mod_devicetable.h.
> 

I am confused. I am asking to align with what's done in
Commit ad428f5811bd ("mod_devicetable.h: Split into per subsystem headers")
and you are disagreeing with that ?

I am not comfortable taking this patch unless there are other similar
examples that are agreed upon to break the pattern followed in the above
mentioned commit.

Uwe, please suggest.

-- 
Regards,
Sudeep
