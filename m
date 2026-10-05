Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1369490BF4;
	Mon,  5 Oct 2026 15:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214301; cv=none; b=O+CmPXnTvtd8MtX4mFWnFUlP0ORX6cxXZc9qXIDccvgWIBTQvMvbmSjgzORQaYH0SZyz13f0loeWhW0VXOT7zR1mFEfMPg2un4qRK3qybezeF4Bgtf1tqTSmUQ1jxuv6oNf+41oJdv0Z6QKRV57B5JOEoFE8E8nFzWiICZxinwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214301; c=relaxed/simple;
	bh=UStZ85o6uRryHrhWbXnPa82OhbmdZZGsF5ka+KOHaDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oun9/ArdbL8yI+cBCCNDyXZj5ee5vlrGLS/WnFjoYeuyD3uGy2y3omEFQZ6afLtpQMZOP2cQzgh23kDNtZpdEQHLiG3QDVumaAf0rJzSU/n+1wgzOjdqhqLvvWPXqX06rPFlUNHn/dB6BREz+W/eBsLhj7Kt7oORkb1bmg5SJig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YVAC7Xic; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YVAC7Xic"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 201111F00893;
	Mon,  5 Oct 2026 15:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791214299;
	bh=K1L8YDaCe7N34XHyQCY1+QmM5CdC/FpgF3HSRWTxRKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YVAC7XicLNVuCWlG033oNrN+soEBb77NoN8O3cCeWuu1fNPL1MlNmDBSDqXUCmcjQ
	 40XUBMWITyhdGLKqZ78mV9Sehr6jK2mOfaoY7sXTuXxkUOhKTO5MR916QA6ZHnkezm
	 IgclDdmQWGezk4zE1Hhpuup8zbMH0VWEjT601E7rOg4wS/lwJ0g3w8zZJ1JVAx3flN
	 PUAFjum12PuM8IwiwAHLxsoR+6PkwEMqEryDHi0zQLg4jXZFi7CxJYxuCxfOFyqWRG
	 7FxORjYdIv+3j8+dKrNOkYPbuJm47Kq6+O3OTYzN/NxaYqsaSgMTeDOPcVmdGfEXrn
	 bRgMNduKVsung==
Date: Mon, 5 Oct 2026 16:31:35 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jay Buddhabhatti <jbuddhab@amd.com>
Cc: Jay Buddhabhatti <jay.buddhabhatti@amd.com>, cristian.marussi@arm.com,
	Sudeep Holla <sudeep.holla@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	git@amd.com
Subject: Re: [RFC PATCH] firmware: arm_scmi: skip empty CLOCK_DESCRIBE_RATES
 replies
Message-ID: <20261005-powerful-skilled-caterpillar-e2fdeb@sudeepholla>
References: <20261001114538.671755-1-jay.buddhabhatti@amd.com>
 <20261001-persimmon-wallaby-of-popularity-c29bf3@sudeepholla>
 <00a75d3c-f863-4ed2-aa3f-a6668e5f74f0@amd.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00a75d3c-f863-4ed2-aa3f-a6668e5f74f0@amd.com>

On Mon, Oct 05, 2026 at 06:06:09PM +0530, Jay Buddhabhatti wrote:
> Hi Sudeep,
> 
> Thanks for the review. Please find my response inline.
> 
> On 10/1/2026 8:14 PM, Sudeep Holla wrote:
> > On Thu, Oct 01, 2026 at 04:45:38AM -0700, Jay Buddhabhatti wrote:
> > > Some platforms advertise reserved or uninstantiated clock IDs that still
> > > succeed CLOCK_DESCRIBE_RATES with zero rates. After dynamic rate
> > > allocation, kcalloc(0) returns ZERO_SIZE_PTR and protocol init then
> > > dereferences rates[0], which panics.
> > > 
> > > Do not allocate or index the rate array when the firmware reports an
> > > empty list, so unused IDs are skipped instead of taking down the SCMI
> > > clock provider.
> > > 
> > > Fixes: 62ba967595e0 ("firmware: arm_scmi: Make clock rates allocation dynamic")
> > > Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
> > > ---
> > > The SCMI server is the source of this zero rate and successful response
> > > and it should be fixed in SCMI server. This defensive check in Linux is
> > > still useful because firmware responses must be validated before
> > > de-referencing dynamically allocated data, The panic is a Linux
> > > regression introduced by dynamic rate allocation; previous fixed array
> > > tolerated the same response and other SCMI implementations could return
> > > the same unexpected response.
> > > ---
> > >   drivers/firmware/arm_scmi/clock.c | 18 ++++++++++++++++++
> > >   1 file changed, 18 insertions(+)
> > > 
> > > diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
> > > index 0278705d809e..8934a95527e2 100644
> > > --- a/drivers/firmware/arm_scmi/clock.c
> > > +++ b/drivers/firmware/arm_scmi/clock.c
> > > @@ -8,6 +8,7 @@
> > >   #include <linux/math64.h>
> > >   #include <linux/module.h>
> > >   #include <linux/limits.h>
> > > +#include <linux/slab.h>
> > >   #include <linux/sort.h>
> > >   #include "protocols.h"
> > > @@ -484,6 +485,13 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
> > >   	if (!st->max_resources) {
> > >   		unsigned int tot_rates = st->num_returned + st->num_remaining;
> > > +		/*
> > > +		 * Unused/reserved clock IDs return 0 rates. kmalloc(0)
> > > +		 * returns ZERO_SIZE_PTR and must not be dereferenced.
> > > +		 */
> > > +		if (!tot_rates)
> > > +			return 0;
> > > +
> > >   		p->clkd->r.rates = devm_kcalloc(p->dev, tot_rates,
> > >   						sizeof(*p->clkd->r.rates), GFP_KERNEL);
> > >   		if (!p->clkd->r.rates)
> > > @@ -505,6 +513,9 @@ iter_clk_describe_process_response(const struct scmi_protocol_handle *ph,
> > >   	struct scmi_clk_ipriv *p = priv;
> > >   	const struct scmi_msg_resp_clock_describe_rates *r = response;
> > > +	if (ZERO_OR_NULL_PTR(p->clkd->r.rates))
> > > +		return -EPROTO;
> > > +
> > >   	p->clkd->r.rates[p->clkd->r.num_rates] = RATE_TO_U64(r->rate[st->loop_idx]);
> > >   	/* Count only effectively discovered rates */
> > > @@ -622,6 +633,13 @@ scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph,
> > >   	if (ret)
> > >   		return ret;
> > > +	/*
> > > +	 * Some platforms expose reserved clock IDs with an empty
> > > +	 * CLOCK_DESCRIBE_RATES reply. Do not dereference rates[].
> > > +	 */
> > > +	if (!clkd->r.num_rates || ZERO_OR_NULL_PTR(clkd->r.rates))
> > > +		return 0;
> > > +
> > 
> > I expect the Clock rate control bit to be unset in the permissions for
> > these clock, else it may be dangerous to do this. Please add that check.
> 
> I will add that check in new version. If the Clock rate control bit is set,
> Linux clears its local copy by setting rate_ctrl_forbidden. The clock
> remains registered, but clk-scmi does not install set_rate and
> scmi_clock_rate_set() returns -EACCES. This avoids exposing rate changes
> when no valid rates were described.
> 

You did mention this is issue in the firmware. If the generic solution(once
agreed upon) doesn't work on your platform, then you need to fix it with
a quirk I am afraid. I will let you propose the patch and take it from there.

-- 
Regards,
Sudeep
