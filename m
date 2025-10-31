Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8C6030DED8
	for <arm-scmi@vger.kernel.org>; Fri, 31 Oct 2025 19:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761938613; cv=none; b=MhwkiaaV/eETBf0qwJc2T2yhyxfryXMjWbf9EDPVcCA/wIysEtmq/ZFugWildrpNLg4K74selMT4HPXHmIBMs0zolysBaqpU/8x//Ck6sZ8ptuc5sHdDwY+b4gT4AHO8hnY9o0sVjVJ5mLoQRhUXhkYE52EQs/16As1uM6GpoRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761938613; c=relaxed/simple;
	bh=3BLce16rXX5JLlvWCj9li2RLuBBshu0H59+zCss84nc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RuTXD5RRre7q/qFjL+s0uatx50D1hfuomUEraadobtXzNS0WMNMP67pi3T9cH2UJQAxrUMVCC7hAdMEPEwAR581wq/8TGWBOv5UVAB1LQgdcy2G/+eFS2HzwjBUMhQ+n3jKFJbtSUm/Melezo5cXhleQNswszqc3juYM4rWGNBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C49551595;
	Fri, 31 Oct 2025 12:23:21 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B97A3F66E;
	Fri, 31 Oct 2025 12:23:28 -0700 (PDT)
Date: Fri, 31 Oct 2025 19:23:26 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Souvik Chakravarty <souvik.chakravarty@arm.com>,
	"open list:SYSTEM CONTROL & POWER/MANAGEMENT INTERFACE" <arm-scmi@vger.kernel.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dhruva Gole <d-gole@ti.com>,
	"Francis, Sebin" <sebin.francis@ti.com>,
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
Subject: Re: SCMI Clock Protocol: clk_round_rate() mismatch with actual
 get_rate() results
Message-ID: <aQUMrmJ4tX-i7pIS@pluto>
References: <PAXPR04MB84594F6E2CE36C0EA1EAE24D88FBA@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB84594F6E2CE36C0EA1EAE24D88FBA@PAXPR04MB8459.eurprd04.prod.outlook.com>

On Thu, Oct 30, 2025 at 02:36:14AM +0000, Peng Fan wrote:
> Hi all,
> 
Hi Peng,

> I'm encountering an issue with the SCMI Clock Protocol implementation in
> Linux where clk_round_rate() returns a value that matches the expected
> rate, but after calling clk_set_rate(), the actual rate retrieved via
> clk_get_rate() differs significantly. This discrepancy is causing problems
> for video modes that require precise pixel clock frequencies.
> 
> Here are some examples:
> 1) Expected: 148500000, Rounded: 148500000, Set: 148500000, Get: 148444444
> 2) Expected: 148352000, Rounded: 148352000, Set: 148352000, Get: 111333333
> 3) Expected: 74250000,  Rounded: 74250000,  Set: 74250000,  Get: 74222222
> 4) Expected: 74176000,  Rounded: 74176000,  Set: 74176000,  Get: 63619047
> 
> From what I understand, SCMI does not support a dedicated round_rate
> protocol operation. The Linux SCMI clk driver uses the initial clock attributes
> (either a discrete rate list or a min/max range) to implement clk_round_rate(),
> but this does not reflect the actual rate that will be set by the firmware. As a
> result, clk_round_rate() often returns the expected value, but clk_get_rate()
> shows a different result after clk_set_rate().
> 
> This behavior breaks video drivers that rely on precise clock rates for mode
> validation and setup.
> 
> SCMI supports clock parent relationships, and the Linux SCMI clk driver
> correctly builds the clock tree using this information. But when set rate,
> it will not propagate to parent, because determine_rate() is there
> for all scmi clks.
> 
> Questions:
> 
> Is there any plan to enhance SCMI to support accurate rate
> rounding or feedback?
> Would it be feasible for the SCMI clk driver to verify the
> actual rate after set_rate() and adjust accordingly?
> Are there recommended workarounds for drivers that
> require precise clock rates?
> Could SCMI protocol be extended to support parent-aware
> rate negotiation and rate propagation?
> 

A quick reply, there have been other reports/requests around this and an
internal discussion thread has been started with ATG, and this report of
yours too is being considered.

Once we have something concrete to discuss we'll get back in touch.

Thanks,
Cristian
