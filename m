Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB71B4ED1B9;
	Wed, 23 Sep 2026 12:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790164934; cv=none; b=UotfxcybNCAcAPud8+T8oOoOpkTAW1jhZxQAGPF6fE0j6yRcwelw1vOHLpOF7enFrDyduwszXwNYR02M76ftazGkMXcvYv2m/HmiugsimBmlpY3jdbrjBFWFjvXhuWJ72tqns6iyLICQQvu2o0do7wGNfer25BrM4xf6BvhFovs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790164934; c=relaxed/simple;
	bh=ZSA9NmHbOKoODpNc+Db6J+pL8NPkAuD5MPRRVnRkWak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VbV/xUaGIF/h3oyLvpcMR8yguktDSwfd2YUezqT/SF5zKB9cnpspS9g6FmK/ItbJ6srL65WeQrszqPJepWh/4/UpAPFgbcD//O/346B5y5kIkbB4CA58erllBWuNgrlKK6rY8NOn5+cQkI5xMXHf4vx7KDb2EtvM87iLrJD4wfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YnnDZKTk; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YnnDZKTk"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13FDF1570;
	Wed, 23 Sep 2026 05:02:08 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0FDC63F86F;
	Wed, 23 Sep 2026 05:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790164931; bh=ZSA9NmHbOKoODpNc+Db6J+pL8NPkAuD5MPRRVnRkWak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YnnDZKTk607Xz6jmhC3bEIAsMk9ckTgPQN8GF+0wt7oCRTSwavnSKYeYKg/XzFebi
	 wkC89TEd4T2cmzMg9dP5dR9s9O8pAwuL1BJEKRjUQO776fY8cp12btfjbzTgRFAhOP
	 CJelwlr/v83wl2gw/weTODamNHJ4YevZp89whv68=
Date: Wed, 23 Sep 2026 13:02:05 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
	sudeep.holla@kernel.org, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	d-gole@ti.com, jic23@kernel.org, elif.topuz@arm.com,
	lukasz.luba@arm.com, philip.radford@arm.com,
	souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
	puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v12 05/25] include: trace: Add Telemetry trace events
Message-ID: <arO_vXAptcW5nwSy@pluto>
References: <20260920091928.2014972-1-cristian.marussi@arm.com>
 <20260920091928.2014972-6-cristian.marussi@arm.com>
 <7a6fab99-618c-4180-b8b3-2d1371c90483@kernel.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a6fab99-618c-4180-b8b3-2d1371c90483@kernel.org>

On Tue, Sep 22, 2026 at 03:48:05PM +0200, David Hildenbrand (Arm) wrote:
> On 9/20/26 11:19, Cristian Marussi wrote:
> > Add custom traces to report Telemetry failed accesses and to report when DE
> 
> You write here "failed accesses", but the tracepoint below is called
> "scmi_tlm_access". Is it supposed to be used for any accesses?
> 
Yes..this is definitely a stale commit message since the first iteration
of the series...

I'll fix.

Thanks,
Cristian
