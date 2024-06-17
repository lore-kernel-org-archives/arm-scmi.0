Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B5741C0071
	for <arm-scmi@vger.kernel.org>; Mon, 17 Jun 2024 13:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718630898; cv=none; b=PnW0j3w36Kd7fARhKvUyTD3Tl7MetYkAF7cX87NsPHUjVirN/WHbC99enHksyv58TvBLvYgB/k0Yf8D8TtJvqKKqnBO/5gaZ1aDeQfM4Ar436vC8I45P+Y/gbeY7t90DM6KjzXesBPKf8L1jJG/IhqjweR9mEEYPvSouWphyFCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718630898; c=relaxed/simple;
	bh=4MGDUprpsCWeVCTdpUtEGBNkIOYfdV+wOwZphi5DWsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZNoIXBuTP8hh4tJzmI827ScVXlA8CrEojf3nPPaSl8VcEJJnJJYXg8Vxr4NryxrR0qizvgfLz1pHRMGdMHqYYQ92lHh6W0tiI5VnU1arFmHXal3KvHnqz2v+OItEjRbQlcw81bfmZqHdExmOjwfuiLRu7XkS+0lHu+jR0EWBdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40D62DA7;
	Mon, 17 Jun 2024 06:28:40 -0700 (PDT)
Received: from bogus (unknown [10.57.90.34])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C83E3F64C;
	Mon, 17 Jun 2024 06:28:14 -0700 (PDT)
Date: Mon, 17 Jun 2024 14:28:11 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "cristian.marussi@arm.com" <cristian.marussi@arm.com>,
	"robh@kernel.org" <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: scmi mailbox max_rx_timeout_ms value
Message-ID: <20240617132811.adcqbpf5u7e4xqe7@bogus>
References: <AM6PR04MB59414DB0445EDF6ECA46B02F88CD2@AM6PR04MB5941.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM6PR04MB59414DB0445EDF6ECA46B02F88CD2@AM6PR04MB5941.eurprd04.prod.outlook.com>

On Mon, Jun 17, 2024 at 09:17:11AM +0000, Peng Fan wrote:
> Hi Sudeep, Cristian and DT maintainers
> 
> In drivers/firmware/arm_scmi/mailbox.c, current max_rx_timeout_ms
> is 30ms, we wanna to enlarge the value.

Care to provide the reason for the same ? Few possible bottle-neck/issues:
1. Transport
2. Firmware implementation
3. Processing capability of co-processor implementing SCMI

> NXP downstream value is set to 1000ms, but for upstream I think it may
> not be a good solution that just enlarge it for all scmi users,

I think it may not be good solution on any modern platform to have
such high latency for P2A or A2P communication. Even Juno(a decade old
platform copes well with 30ms with SCP running at 50MHz(IIRC). So I am
interesting in getting more info about i.MX before we can decide on the
right path to progress here.

> Each platform may have its own max timeout value depends on scmi firmware
> design.

Fair enough, but 30ms to 1000ms just seems wrong to me to start with.
I simple need more information to get convinced here.

> So I am thinking to use a device tree property for this, saying
> "mbox-rx-timeout-us", just as "atomic-threshold-us" in arm,scmi.yaml
>

May be, I am not completely against it as we need this if some platforms
need say 50ms instead of 30ms. Typically any sync command needs to be
processed with few 100s of uS not even as high as a mS. So as I said
before 1000mS needs lot of convincing. I am not even sure of 1s is
tolerable latency in general for some of the SCMI perf commands.

-- 
Regards,
Sudeep
