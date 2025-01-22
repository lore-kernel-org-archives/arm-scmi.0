Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61EF2211A2E;
	Wed, 22 Jan 2025 12:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737550552; cv=none; b=sEFImgbM1tAwMADEW7v/+B4BWGaBMjeUbYq8htFn8o464qaKPZS4u7TBiju6obhCyu+9Il5jluQHDYZ2ly4KRUJLf4s4b0XPfmfpGd6BCSfKbn1YuHbuDIMvgdIobPYS2ecrifbs28DhBNYDU/pB5j9jch7AADoUn6CjLk4rbB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737550552; c=relaxed/simple;
	bh=P4I1jY16hLHQZh4h8HjfrEpo3Ri+4TA4b1yzXteH7K0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fBnGdDNb0Lua203mIV3flrIjYl9jg9DEGjdLdMH+iJEzGOdeC5L5rBZQZi6No6FUk/KYXw7mr34YXBMask6WK4Gbvv9k7e8kbj2e+qBRJenu3VXY7g4ageUemiil7NGkHfteEdvhP7O0GrBy/qINKYa8pKcBDHTPBxUBmJXlVLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 459DF1007;
	Wed, 22 Jan 2025 04:56:18 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABA043F66E;
	Wed, 22 Jan 2025 04:55:47 -0800 (PST)
Date: Wed, 22 Jan 2025 12:55:45 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/5] firmware: arm_scmi: imx: Add i.MX95 CPU Protocol
Message-ID: <Z5Dq0Yb6wsIJQYF4@pluto>
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

Hi Dan,

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

Hang on...I have not really done a proper review still on this series...
...and this printout above straight out of the message payload seems very
wrong to me too..

> But from a practical perspective we have to trust the SCMI server.
>

....nope we should NEVER trust the server...and instead assume it can
kill us (kernel) all the time :P

...despite what the spec says, we tend to assume tha the server can be
maliciously wrong (or just crappy), so in other protocols where we do used
an u8[] to describe the resource name field in a message, we have also always
(hopefully :D) taken care to use it ONLY after having processed that field like...

   strscpy(dom_info->name, attr->name, SCMI_SHORT_NAME_MAX_SIZE);

...to remove any possible bad outcome from a misbehaving SCMI fw server.

Thanks,
Cristian
