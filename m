Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921033;
	b=YZov6eg3FGce3sz7Ip+7yvFvyHrrTNLjU/xaibdUwrQoF5d8r5ScnnuRw/kaBwKdaCpa
	 694OaBBGalcsUEwcUIg7t6xRGY6YcH9UD7Dq02KFuL4QxH3V2wsG27D/ICKlSazBiYnfF
	 0oPcYsX8YYoaWYQxCDSxTN/RVmoxsYNBN9SBIn1mTeUqZ/x0Trfjxubcy3i4eDUOsFh+V
	 x4QMwz5Wt9jm+EiDtC92S+v4+ublSxUuyOLvTfFszJXySZd/2K3uaoeTAeFT6o70xOOM0
	 G/5UYqxJRb1244vEwKy54uIvEzHttpKRGjQKn1lLxY6dVVvQzb9z09Q3g7DHHgdw0Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921033;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=D4tW1TAfFvOxEpv444o0Uj+/5uyvixONHdxp9CLi34M=;
	b=NFagQf0R4zdMGo2+JyMow5Ww+0gt0B5DfbI2pxaImAG4oZ5CvL0mi2UdSlzQPdgrfFyy
	 0UyYr0C+UShK4qr7oVHlMajO11Ms9a/CzFecqfdzGOd12QDuZCUHrZWDiaxqM7aNzCdrY
	 yexjvP1myag1q7Ppj0S56Q84b4v+LG9FIjeDJzIemGCTnAC0Xwf+VfGK4CjnKoFhqa422
	 9QuUoFQD37zZEgmDFTizcFDkLr8UMbgLZ/FlML/jQaqFCw0z3EClkEb+jNJ7wXD37KJ9b
	 D1pb5mwdJ0fdLY2PkhLYp25qxm1fR29K0FWzr2Psh7H9XxvLqUvmEBt5H+I4fHBdfWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=eBvNZkSo;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D181606A329;
	Tue, 17 Nov 2026 13:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D181606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=eBvNZkSo
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2631A1476;
	Tue, 17 Nov 2026 05:10:28 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A67823F632;
	Tue, 17 Nov 2026 05:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794921031; bh=3rwAxBhio7Lo7SXHtTbUlWdUnStP/TP/HJl8yyAZ1Ko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eBvNZkSoC+giD1oPcrvkal1qQXxhc3EDROAUYlay2fNQ588mgreUOmmYlC/SRUE6y
	 iX95SjBgz57o8Q7TAQVp0RGcVWNMaTbsaOMC1bgvnFXEtaax8RDiMCraXoOr+X287g
	 SlBegSaBetAKuZjoTVrtEmVczfzjjcTvbjPTibCo=
Date: Tue, 17 Nov 2026 13:10:20 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, d-gole@ti.com,
	jonathan.cameron@oss.qualcomm.com, elif.topuz@arm.com,
	lukasz.luba@arm.com, philip.radford@arm.com, david@kernel.org,
	souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
	puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 00/35] Introduce SCMI Telemetry support
Message-ID: <avxSPGYrREHtzjXi@pluto>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
 <20261117-enchanted-neat-donkey-8393a9@sudeepholla>
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
In-Reply-To: <20261117-enchanted-neat-donkey-8393a9@sudeepholla>

On Tue, Nov 17, 2026 at 12:43:15PM +0000, Sudeep Holla wrote:
> On Mon, Nov 09, 2026 at 09:11:46AM +0000, Cristian Marussi wrote:
> > Hi all,
> > 

Hi,

> -- 

[snip]

>    + hardened core iterator parsing of multi-part reply
> > 
> 
> You can drop the change log for earlier versions(just last 3 should suffice)
> in the future postings and add links to them instead if anyone is really
> interested to go back. Don't worry about older links now, just do that
> in the future.
> 

Ok.

> [...]
> 
> As mentioned in one of the thread, this is quite big series with not
> much feedback on the UABI part apart for Jonathan. So we need to take
> an approach of merging this in smaller parts initially.
>

Yes I have already split put unused features from V16 both from the
protocol layer and from the driver.

 - no GROUPS
 - no NOTIFICATION
 - no SAMPLE READ (async delayed response)

This way the series is roughly 6500 lines (without docs/ksft/test tool)

...now I was starting going through residual Sashiko bugs of the initial
part of the series (at least), assuming more discussion are needed around
the ABI anyway (still to reply to latest Jonathan mail)


> > Cristian Marussi (34):
> >   firmware: arm_scmi: Harden iterators state parsing
> 
> The above looks good.
> 
> >   firmware: arm_scmi: Add new SCMIv4.0 error codes definitions
> >   firmware: arm_scmi: Introduce a dedicated SCMI Errors header
> 
> As pointed out, better to swap the order of above 2.
>

Ok.
 
> >   firmware: arm_scmi: Allow registration of unknown-size events/reports
> >   firmware: arm_scmi: Refactor __scmi_event_handler_get_ops helper
> >   firmware: arm_scmi: Introduce protocol instance notifiers
> 
> All the above 3 refactor the code, so better to fix the Sashiko reported
> bugs around them before go for such additions/refactoring IMO.
>

I dropeed protocol protocol instance support and notification as
discussed, the new series layout is roughly (with docs/ksft/tool still
to apply split):

c1266f348da4 firmware: arm_scmi: Enable autoloading for System Telemetry driver
8ff6d68673ff firmware: arm_scmi: Add System Telemetry driver
2ab95adf4c0d uapi: Add ARM SCMI Telemetry definitions
8a79c0ca1d11 firmware: arm_scmi: Expose per-instance identifier
ec676846f78c firmware: arm_scmi: Add Telemetry debugfs ABI documentation
6798c6701682 firmware: arm_scmi: Add Telemetry debugfs SHMTI dump support
58cba74addfd firmware: arm_scmi: Add common per-protocol debugfs support
fdfd27649a6e firmware: arm_scmi: Add Telemetry boot-on support
6737d7a797c0 firmware: arm_scmi: Add Telemetry Single/Bulk DEs reads
5507b8b44d15 firmware: arm_scmi: Add Telemetry global configuration support
7aa4c04a61a8 firmware: arm_scmi: Add Telemetry DEs configuration support
e2eec907cddc firmware: arm_scmi: Add Telemetry TDCF parsing for UUID lines
d3c453be30c6 firmware: arm_scmi: Add Telemetry TDCF parsing for BLK_TS lines
328be9a8b32b firmware: arm_scmi: Add Telemetry TDCF areas parsing support
e5d64de593ee firmware: arm_scmi: Add Telemetry SHMTI areas enumeration
d5f25597262d firmware: arm_scmi: Add Telemetry global update intervals enumeration
e23dffd6a103 firmware: arm_scmi: Add Telemetry resources enumeration
dac0f7d33c76 firmware: arm_scmi: Add Telemetry basic attributes enumeration
fa02803cbb1a include: trace: Add Telemetry trace events
4b510f42e44d dt-bindings: firmware: arm,scmi: Add support for telemetry protocol
11f799fe30a4 firmware: arm_scmi: Refactor __scmi_event_handler_get_ops helper
3a2706fedd66 firmware: arm_scmi: Allow registration of unknown-size events/reports
5d196fe1290e firmware: arm_scmi: Introduce a dedicated SCMI Errors header
1877db16c4f5 firmware: arm_scmi: Add new SCMIv4.0 error codes definitions
38e65d778a52 firmware: arm_scmi: Harden iterators state parsing

...BUT especially the removal of GROUPS led to considerable rework so
the above commits does NOT really match the same commit in V15

> >   dt-bindings: firmware: arm,scmi: Add support for telemetry protocol
> >   include: trace: Add Telemetry trace events
> >   firmware: arm_scmi: Add Telemetry basic attributes enumeration
> >   firmware: arm_scmi: Add Telemetry resources enumeration
> >   firmware: arm_scmi: Add Telemetry groups initialization
> >   firmware: arm_scmi: Add Telemetry update intervals enumeration
> >   firmware: arm_scmi: Add Telemetry SHMTI areas enumeration
> >   firmware: arm_scmi: Add Telemetry TDCF areas parsing support
> >   firmware: arm_scmi: Add Telemetry TDCF parsing for BLK_TS lines
> >   firmware: arm_scmi: Add Telemetry TDCF parsing for UUID lines
> >   firmware: arm_scmi: Add Telemetry configuration operations
> >   firmware: arm_scmi: Add Telemetry DataEvent read capabilities
> >   firmware: arm_scmi: Add Telemetry reset logic
> >   firmware: arm_scmi: Add Telemetry notification support
> >   firmware: arm_scmi: Add Telemetry boot-on support
> >   firmware: arm-scmi: Add Telemetry generic event support
> >   firmware: arm_scmi: Add Telemetry generation counter event
> 
> I am thinking of initially merging upto the above commit initially so that
> no user ABI is established. I haven't done the thorough review yet.

Beside a lot of stuff that I removed (like groups all over) there are
outstanding Sashiko issue in the V15/V16 code that I was going to
address now.

Given that, as I understood the agreement was to shed a lot of still
unused features the current V15 and next V16 will be sensibly different.

Thanks,
Cristian
