Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794392127;
	b=w1VZo97t6kHaAUW64VW1a6+oHRR6+I5z85iOA+pqXS0M6dfZOgR1eOYuXX/HldhuUx9n
	 ETwQSwGgRsE9JVt4KGblZd7Ql5BHe/ME2kGZ8RE9gV7WWv4lwbeDQw/pdKUuaTtUTLzeT
	 Y15UQNQJOphYAAaBYtuXAiMztzVZF2Jlhh8JNxGK8oWKPMTRm/7kkr/ZKVW0jjNHoAZg/
	 ee3G+1UmSvaAzsWK65Hv4lwsq6Qt6/9utRwmKbozyTJ1fm8K8mES5IFMrBl29MZqysmjR
	 eOLxzbjFZmZYoFBPmgwO1acOThAPB1iPzUVBSsWkB3WMOt7EWVto+HINK3urgWiZFDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794392127;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=rK3zf3WORu1ZXVGJG2PmksRY90fhsQibZT0nyfHuenc=;
	b=DCoQzS0MUrHVlMwqb2YLRww7waTreYhyfgW33hKcechnUIfn3Wsi7uOvgeUXFT9thpYO
	 sth7eVDZQEKlgAGREG2DBEXTL0YW22U/e2nKynPZ+2ggR8xZQhwXSfAmvZPKqmjiE4Wcj
	 L6KGhzMcduq3EhLSE+xyviZRPG+5WZpQnhU2lH7qwep2rOCgTHl+aqyCQp3sBQJCHoC75
	 Z3VfaDiQkPOKYiV3MoAq3jbP/1tOJlAoLp3mmGkQw4HSvIBULP8RzkH/YqMcvnrI3HcA7
	 M0APGYrEk3g9khNdGo4O4jkvyNuvTMQltyI/64W/JJkJCesauX16JZ9Khc4V0HoTGig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=m6QWUogq;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 048F2606A31C;
	Wed, 11 Nov 2026 10:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 048F2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=m6QWUogq
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B40C1576;
	Wed, 11 Nov 2026 02:15:23 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 05E4D3F632;
	Wed, 11 Nov 2026 02:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794392126; bh=0HlfkY9hnP7PkFvX7q+xnImD2I72F3eSwZqnjsju5x8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m6QWUogqmrU+D+IusNfo+7RENCrkzi092lTtwXoEamRlM3gUAzdE8G1Qn8+BaU0YB
	 Y7+7Vtlp8e4gNTg95tt1c+SdkaATlzyXhf3KwPqDtoCW8dFAWhW/xZ64dHQSE1Vnvw
	 B7eSrwp1R6DsvMI8m//gQ58HEZkuUvxuazb5VwNQ=
Date: Wed, 11 Nov 2026 10:15:16 +0000
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
Subject: Re: [PATCH v15 00/35] Introduce SCMI Telemetry support
Message-ID: <avRANKPwp-r-QSR4@pluto>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
 <20261110163809.000070d6@oss.qualcomm.com>
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
In-Reply-To: <20261110163809.000070d6@oss.qualcomm.com>

On Tue, Nov 10, 2026 at 04:38:09PM -0800, Jonathan Cameron wrote:
> > The upcoming SCMI v4.0 specification [0] introduces a new SCMI protocol
> > dedicated to System Telemetry.
> > 
> 
> Hi Cristian,

Hi Jonathan,

thanks for your time...I sincerely hope you're travelling abroad on some
remote timezone given the time these reviews came in :D

> 
> So, the main issue here is pretty much summarized by:
> 
>  28 files changed, 12801 insertions(+), 99 deletions(-)
> (obviously there are tests etc, but it's still > 10k lines)
>

Usually I try to implement the complete set of features of a new protocol
but indeed this new Telemetry thing is huge by itself so it became quickly
overwhelming to review...imagine to code and test it.

> There are relatively few reviewers who would even consider taking that on.
> I foolishly thought it wouldn't be too bad (and I review a lot of code).
> By about 3/4 of the way though, probably much earlier, I know the quality
> of review went down considerably. Honestly it was probably a waste of
> time continuing but I'm stubborn like that.
> 
> So, unless you have a path to bribing or sweet talking various folk to
> deal with reviewing this with each having to set aside multiple days
> to do it, likely repeating for a couple of versions yet, I think you've
> got to figure out out how to make the first patch set more manageable.
> Probably don't split it up as much as the mpam or CCA folk have had to,
> but you have a lot of colleagues who are experiencing the same problem
> at the moment. They may be able to advise.
> 
> So it would be nice if what was in that first patch set was 'functional'
> but I don't think it needs to function on every systems or support more
> than an absolutely minimal feature set.  Just fail to probe when you see
> something that isn't supported by that minimal set if that means
> the thing won't be functional.
> 
> Once that's in place, over a couple of additional patch sets you can
> get to everything you have here.
> 
> So what if you choose one data path (shmti perhaps), no notifications,
> events, maybe even simplify to one of the readback paths.
> Maybe even drop event groups initially. 

Based on our real world initial customer of this I can certainly drop a
few features that are not supported anyway by the real FW and move it to
a later patchset, stuff like groups, notifications and single sample
reads, but all of the rest is hardly removable while keeping the system
functional and usable.

> Possibly even drop timestamps.  Definitely drop things like boot-on
> support and debugfs (unless you are using that as a cheeky 'functional'
> test ahead of the main userspace interface.

Not sure what you mean by drop timestamps, definitelly cannot drop
boot-on (it is how systems are configured indeed) neither debugfs used
for bring-up and FW debug.

> 
> How much would that slim things down?  It doesn't even have to be
> useful, just testable.  Realistically I think the hope of getting
> enough review doubles if you can halve the size of what you are asking
> people to look at.

I am not sure how many lines I can shed with the above features drops but
I'll give it a go anyway at slimming down the series after I have gone
through this round of Sashiko pains.

> 
> Anyhow, gut feeling only but the code felt like it was in a much
> better state than some of the versions I've looked at in the past,
> so I think the game is now how to get it over the line!
> 

From the testing/functional/performance standpoints the series has
definitely improved especially, but still some road to go.

Thanks,
Cristian
