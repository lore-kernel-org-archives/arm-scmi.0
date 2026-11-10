Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298781;
	b=HDbueLg/z9ScI8Cc3ugxOUudRh/AZvC94jgH/3Jg3rUYENCQGv0QYhXAd7IFx62fv1RI
	 0IQ40sFoD7vZucqTWI/ceE+9i8cqcmnCjnmIy2RSq56efInQ/ut9wdxSCoNf8buaG+nPq
	 dZe+4C8lUsH1b76NX5w+2CT/daAOWdCf7aIyLb+B+eIaqgkzkhDZfMRnBYZUlijhLsCqI
	 y6b9zTVJlRB+dHffqm0KOAnA4H3uhDm+KaVvoPaz++qLqvlZZ77kSWXEY+u58XyWo2mgW
	 Ly4IZIFE71blkBTrUEmtwAcqQdKnKrWf4i3ebeej8zvtduEkgrKS3nS/A27pw+OsV1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298781;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=RyGS5BYQsgIK0f3SZKWntgu4dy9J/rSB7/HXNadBGz8=;
	b=ilIXhppFuw08w2W1FH0M/7ndGKTstVRhYLoZF+gd0RXZhydGt+A0YoPmEGGDOX6oU+Kw
	 4HCpqbVAfpeUVLQnnF/w0BVwhe4j3lyb2OCjWhUE58d5QJMwISvl4TzfQIyv6eyoM3aGV
	 oSSTnZ1uO+SnZxgWz0/SGWUdpLUEIwiEUMG28W46lSLU0QGEPgWD79mSWrO5tlVCt3wRk
	 XaxKoXqjaxlBJ4D6BABNnlHfn8MT6+sTG+dfoSYcMHQt7Sv2SqXr65i/s2JtSNwQhnJ4Y
	 BRd9NWnZc/AYc0yBvYxGJSBIr8kHYvm68RTlpek25wuBW+D55QqU0CtZyFp1/hGIAag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="uy/4Vzm5";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35FA8606A330;
	Tue, 10 Nov 2026 08:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35FA8606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=uy/4Vzm5
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35E851516;
	Tue, 10 Nov 2026 00:19:35 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 13B6F3F85F;
	Tue, 10 Nov 2026 00:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794298778; bh=ylG4St2aJ0VmW2ktR8NjqrmUljZZyPC2qz7U+ukHujw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uy/4Vzm5LDCZlKDKG5l1x/8xmaojsxT1a3TtNv2PeVPUz1aDBNZmmO4CPoT2426OG
	 bVhM1ePo8CDGr+jaVsc26knbdY86TVpU9bwEmgHiczkZwj8OBUH1i8IjZfhMtNWTtx
	 fyFOGnXcW+l903eZ3/xC5t8UL3JnPQNJ9gZqBDZw=
Date: Tue, 10 Nov 2026 08:19:28 +0000
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
Subject: Re: [PATCH v15 01/35] firmware: arm_scmi: Harden iterators state
 parsing
Message-ID: <avLTkAtQQSzpgu2A@pluto>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
 <20261109091221.2532706-2-cristian.marussi@arm.com>
 <20261109135713.000049d6@oss.qualcomm.com>
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
In-Reply-To: <20261109135713.000049d6@oss.qualcomm.com>

On Mon, Nov 09, 2026 at 01:57:13PM -0800, Jonathan Cameron wrote:
> On Mon,  9 Nov 2026 09:11:47 +0000
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Add checks in the core multi-part iterators support to detect generally
> > malformed and incosistent multi-part replies.
> 
> Spell check patch descriptions.  inconsistent.

Ah...checkpatch let me down another time

> 
> Otherwise seems fine but I'm too lazy to check all existing protocols for
> that minimum size!
>

Indeed I was too lazy to add a dedicated parameter to all the call-sites
so I verified that any possible standard/vendor protocol has that
minimum size as of now, since in fcat it is the minimum viable payload
needed to hold num_returned/num_remanining...if any future spec will
change this we'll evolve accordingly/...for now it is the simplest
approach (and kills a lot of Sashiko complaints scattered all over :P)
 
Thanks,
Cristian
