Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B0D815A4A2
	for <arm-scmi@vger.kernel.org>; Tue, 18 Jun 2024 10:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718705242; cv=none; b=BCemsmtWMPZ7RG/A7BLobBmmE7gym35zMuuYiBGGSdBH/eVaABhli9wnSnONx8qz1mQwbzi4gyhebu3MLEzd9bzBbCxCBHh9GrLF0NPZSiUJfB/9BWnsoNTXFBRIWiDU+wNEPGp1V/ruYR2IoFiK5iU5JItHpiCVYbpaU1WKKEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718705242; c=relaxed/simple;
	bh=8OvsVFaKnsdccQ/xo84qkLxesrCrPLoeBeqvpyzjGBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EIAfWPMOtrYpiGZ9WzviSLKP1uSK0HxWXoRIDnwMEqYw873CJio0ZIOBiGCulMc+T4BUz5nl5JlmtIjureVHLPSvTQ8k+XEZfas5pE/c8a7GotPo5qP4intNgynXf98QnG8XeZM0wLi7ev08J6e8LcKBEOLrvSKR7TmSXR0GQdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E191DA7;
	Tue, 18 Jun 2024 03:07:44 -0700 (PDT)
Received: from bogus (unknown [10.57.89.235])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 242E13F6A8;
	Tue, 18 Jun 2024 03:07:18 -0700 (PDT)
Date: Tue, 18 Jun 2024 11:07:16 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "cristian.marussi@arm.com" <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"robh@kernel.org" <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: scmi mailbox max_rx_timeout_ms value
Message-ID: <20240618100716.wlgf4wc6afzjlutu@bogus>
References: <AM6PR04MB59414DB0445EDF6ECA46B02F88CD2@AM6PR04MB5941.eurprd04.prod.outlook.com>
 <20240617132811.adcqbpf5u7e4xqe7@bogus>
 <AM6PR04MB594170DF514A3B168E35FBA688CE2@AM6PR04MB5941.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM6PR04MB594170DF514A3B168E35FBA688CE2@AM6PR04MB5941.eurprd04.prod.outlook.com>

On Tue, Jun 18, 2024 at 02:12:06AM +0000, Peng Fan wrote:
> > Subject: Re: scmi mailbox max_rx_timeout_ms value
> > 
> > On Mon, Jun 17, 2024 at 09:17:11AM +0000, Peng Fan wrote:
> > > Hi Sudeep, Cristian and DT maintainers
> > >
> > > In drivers/firmware/arm_scmi/mailbox.c, current
> > max_rx_timeout_ms is
> > > 30ms, we wanna to enlarge the value.
> > 
> > Care to provide the reason for the same ? Few possible bottle-
> > neck/issues:
> > 1. Transport
> > 2. Firmware implementation
> > 3. Processing capability of co-processor implementing SCMI
> 
> We have M7 and A55 and even more SCMI agents in future,
> A55 linux agent has the lowest priority.
> 
> In normal case, we not see issue using 30ms, but in extreme
> corner case, A55 linux may not get response in long time
> if other higher priority agents have heavy SCMI requests.
> 
> > 
> > > NXP downstream value is set to 1000ms, but for upstream I think it
> > may
> > > not be a good solution that just enlarge it for all scmi users,
> > 
> > I think it may not be good solution on any modern platform to have
> > such high latency for P2A or A2P communication. Even Juno(a decade
> > old platform copes well with 30ms with SCP running at 50MHz(IIRC). So
> > I am interesting in getting more info about i.MX before we can decide
> > on the right path to progress here.
> > 
> > > Each platform may have its own max timeout value depends on scmi
> > > firmware design.
> > 
> > Fair enough, but 30ms to 1000ms just seems wrong to me to start with.
> > I simple need more information to get convinced here.
> 
> It is just based on i.MX8QM/QXP SCU experience. We thought 30ms
> might be not enough, so chose a large value 1s here.

Well why 1s ? Why not 100ms or 50ms or 200ms ? 30ms was initially set
as mailbox initially didn't use HR timers and we wanted to set at least
2-3 jiffies on a 100 HZ system. It can be and must be lower than that but
left it there as worst case value.

So can you elaborate as how slow A55 and M7 can run and why 1s is good
and right choice ? Coz we may have to see if perf fast switch needs to be
disabled if fast channels are not supported ? It may have other implications.
It can't be just any random number like 1s as some developer felt like
testing to overcome the issues seen on this platform.

--
Regards,
Sudeep
