Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD11213E7A;
	Wed, 22 Jan 2025 13:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737554393; cv=none; b=s9mUX4hw1sfpxae32rdBf3blLpAK5h06g+RXAtY8iJ76NQC2MWKSGzysHokE8lOLrRxWp3X8LOwtwHQ2aPnj5HeyKatlZgYgGT6X19J1vTwrwKjeTe/KXXVpqPiGwy9oO63UWnyk9szU1mufxEadVGNP00p9KgBU/fovR/qYOsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737554393; c=relaxed/simple;
	bh=CUA8ZdHJs+qCYiBU1hP8DMUj8nHA68LHhZajFvBM6yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SlYFgv5L5Z8Lk4/jDosiAjiu0JkxbsMG6dUXUEghdASl2F9SokswmAaex0iEoz6DTv9g/px7Fe3IFPnBBhbfNytDMlbyfg5tWXBr5/LMjyC7oh6ULq1/t3U9vDMBn9NT5blCOp/bSQfUam5QiK7OnfmcUKFeTm+uNUjEwWogER8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0DAF1007;
	Wed, 22 Jan 2025 06:00:18 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC6183F738;
	Wed, 22 Jan 2025 05:59:47 -0800 (PST)
Date: Wed, 22 Jan 2025 13:59:45 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/5] firmware: arm_scmi: imx: Add i.MX95 CPU Protocol
Message-ID: <Z5D50Wy6R6FuxSzG@bogus>
References: <20250121-imx-lmm-cpu-v1-0-0eab7e073e4e@nxp.com>
 <20250121-imx-lmm-cpu-v1-2-0eab7e073e4e@nxp.com>
 <3b9a7392-8ebe-4d43-a111-68bb6d2f93b6@stanley.mountain>
 <Z5Di-uU52aejU-U8@pluto>
 <ac1a1ebe-ef97-42a2-a2be-529a656a7706@stanley.mountain>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac1a1ebe-ef97-42a2-a2be-529a656a7706@stanley.mountain>

On Wed, Jan 22, 2025 at 03:41:41PM +0300, Dan Carpenter wrote:
> On Wed, Jan 22, 2025 at 12:22:18PM +0000, Cristian Marussi wrote:
> > > > +struct scmi_msg_imx_cpu_attributes_out {
> > > > +	__le32 attributes;
> > > > +#define	CPU_MAX_NAME	16
> > > > +	u8 name[CPU_MAX_NAME];
> > >
> > > char is always unsigned in the kernel these days but strings should
> > > still always be char.  Same thing in patch 1, there were a couple u8
> > > names.
> > >
> >
> > While it is certainly true that char is the way to go for strings and, as
> > such, it is used elsewhere to hold the resource names across all SCMI
> > protocols, in this context it is a field of structure representing
> > exactly the layout of message reply coming from the server, and defined
> > in the SCMI spec as a uint8 array, so, we have generally preferred to
> > used u8 to represent such fixed size array all across the SCMI stack
> > protocols implementation....
> >
> > .... not saying that it is necessarily completelt right, but that is the
> > reason we are guilty :D
>
> Fine.  I don't have intense emotions about this.
>
> It does slightly bother me when we assume that the SCMI server NUL
> terminates these when we do things like:
>
> 	dev_info(ph->dev, "i.MX CPU: name: %s\n", out->name);
>

I was about to reply earlier and got distracted. This makes it even better.
I agree with Cristian that we have defined it as u8 when referring to the
payload from the SCMI platform/server. But it should be used only to extract
information from the response payload and copied to OSPM's own buffer before
accessing it like the above dev_info example.

In short, I agree with you Dan that it shouldn't be used in OS like above.
I haven't looked at the implementation patches(just looked at the doc 3/5),
but if they need such logging, they need to copy it to some buffer in the
kernel.

--
Regards,
Sudeep
