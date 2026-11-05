Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793903498;
	b=AxxkIRA4iCJA2sl58/Yy8ZzoqSxJGEhp3aHiS9XOqLuA5ZMtXyUjP+4h8IZjuAHDdJzT
	 j3FypTYhFinrU8aIxBewTOFExhX6RFJHYhnMePzPRMB9njoHsEs3zbVVcY25aqjW3H3SN
	 RbNNVK8YirZRA/aMvflaAJiZLkEfW6E+GQSTUyrKcA2Q2O0wZZfndCx5pRglir8Uj49Zq
	 P3IO8cGXVZSWk7sfpJHJ503cZoh5uto8ElQBh2Dys0ge7esu3mjIwEpTT1/O6hFWi6KQm
	 J4IWJcMwQg8Rqhy2TBktU+DxrXLbJNi5E08OKfRgiKLb2UwgHdnjyHiW/5jMn/Kpd9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793903498;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=JMRH0CoDrno3e90+zIv2xxnEJQWV/B/Z4nMGkkCHCOY=;
	b=Xq7HR/ttfR56N8XBLgT6Qc6HKwVRw03B5RAhwJCfvun131e5drwKw2/lih+m6mAQUZEx
	 dRx57Qz2m8vBoRXr6PuCeaW13IDYTU9N9P2acV4Obw5A+IXESSEL08sdLJupeUs1TTglt
	 4CVoa1WKtHRAgReHddacD+A614V3f2iFXI/Q5t1cFDbX2bkbTibkZ3svcTv3iEAM9MpwE
	 ngI8yIQIGalm/kUa6pSvT2VadHoJxuZGcZnUUYxPGhIQDts6B3Hv6M6otkSrdqHfLPgHk
	 Y0f2Tr0YO0xN7qH0+koeomZfB262uw9nX2PBTchdUdHifxaGwi67/WKIS2xRA0sZ71w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=a4JErDSf;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41D6D606A31B;
	Thu,  5 Nov 2026 18:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41D6D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=a4JErDSf
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62F88168F;
	Thu,  5 Nov 2026 10:31:33 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B9BF13F632;
	Thu,  5 Nov 2026 10:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793903496; bh=0Z3Agz0b4/iSjEmrZUD6ZchKmlwnowHnlYZI794XMME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a4JErDSfU2sjmAHLm0HnZlPtUm1p4E7uRg1lHUyHBLDK6cMpUiskYxCzpzRS2BcHf
	 AA4KAFoQc//xaclfP7pKbOrNrmUy/IlxbogdTWmmRdtaNoeOWXWYHHRXyc8ygZohW0
	 1gJS1pDdwLuiKr2Da0I3q2Bxppv7TBlmFu9nw7b4=
Date: Thu, 5 Nov 2026 18:31:29 +0000
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
Subject: Re: [PATCH v14 04/32] firmware: arm_scmi: Introduce protocol
 instance notifiers
Message-ID: <auzLgZ17_1D5fpmP@pluto>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
 <20261016185553.2794459-5-cristian.marussi@arm.com>
 <20261019140203.00000f2a@oss.qualcomm.com>
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
In-Reply-To: <20261019140203.00000f2a@oss.qualcomm.com>

On Mon, Oct 19, 2026 at 02:02:03PM -0700, Jonathan Cameron wrote:
> On Fri, 16 Oct 2026 19:55:25 +0100
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > SCMI Protocol notifications are typically used by SCMI drivers to detect
> > and react to particular conditions: this was the assumption and the classic
> > usage scenario upon which the SCMI notification framework was built.
> > 
> > Some protocols like Telemetry, though, could be interested in enabling and
> > registering for such notifications: in such a scenario each initialized
> > protocol instance could want to register a common protocol notifier.
> > 
> > In order to reuse the existing SCMI Notifications machinery, allow
> > protocols themselves to register for their own notifications and provide
> > their own notifier callbacks.
> > 
> > Each protocol, at the end of its initialization phase, can now provide one
> > unique per-protocol-instance notifier block, which will be registered, by
> > the core SCMI stack, on the related notification chain: such notifier will
> > be automatically removed during the protocol de-initialization phase.
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> Whilst I'm not that familiar with this code, it seems fine to me
> (i.e. needs more eyes despite the tag)

...indeed Sashiko found a few races in some awkward and rare, albeit possible,
scenarios...despite being functional and tested as it is as of now, it
will need a bit more reasoning.

Thanks,
Cristian
