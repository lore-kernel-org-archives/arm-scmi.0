Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6965328C2;
	Wed,  9 Sep 2026 11:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788952730; cv=none; b=OdbLA90xx0W5Yc53wI9pZNXZCf3wPoqWZ29BRtPVsGAIO4kGyJqLaTRAiou2WwAw0BZJ62wOMMUe/6fUhiEvrfVw2h2/8U5WrFgdYY+zy1Fmx1OM56/X13HrjShMSsay4Bxr5v3GXHTSOL55dayIGT+uiKJWY4sMg3LFvPINYzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788952730; c=relaxed/simple;
	bh=vKm2AvQYQ/cRUTAZNpvm0tdm1XCJhCVHdz9/NjyN2MY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bjb2SHaqmhrplZ1Vi/Gxo/eM9hXs2YHH/Ci0h+H90U5SlvFEZYFd8mcsWUmQLYpxYPs3dXkrTh2sLlAYIJvUiG7YLqMe1f6gjKiirJ0KeyWR7OA5JvTbyobMoix+ZVwkkbFdhBugpE02NgbS5loIqgsdXCs3HDuaxdiuMwPmd8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=h80ZSZZS; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="h80ZSZZS"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3F3E1691;
	Wed,  9 Sep 2026 04:18:35 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70BC13F528;
	Wed,  9 Sep 2026 04:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788952719; bh=vKm2AvQYQ/cRUTAZNpvm0tdm1XCJhCVHdz9/NjyN2MY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h80ZSZZSGsnc/0AWejTg3e9QxfGSn9ljb0GRjV8AOhAZWHEw8rFe8DdO6toQMuS2y
	 BGvzy+8v6ZTU2oZi8l+1rx6eCGVL4wkj9NEdK/IuoKEoPKwBmLTvl1xG487/lkBXUX
	 0FMQnw+L4yZiq9SGGf45LrnzmlshyQXxaSravZUU=
Date: Wed, 9 Sep 2026 12:18:31 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: rolanddreier@rivian.com
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] firmware: arm_scmi: Protect xfer->async_done with
 xfer->lock
Message-ID: <aqE7-6gwOmh8Sr4o@pluto>
References: <20260909-scmi-async-done-race-v2-0-cc5dec25c6be@rivian.com>
 <20260909-scmi-async-done-race-v2-1-cc5dec25c6be@rivian.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-scmi-async-done-race-v2-1-cc5dec25c6be@rivian.com>

On Wed, Sep 09, 2026 at 04:32:27AM +0000, Roland Dreier via B4 Relay wrote:
> From: Roland Dreier <rolanddreier@rivian.com>
> 
> Asynchronous SCMI commands are completed by a delayed response. The RX
> path signals the response with complete(xfer->async_done). Unlike
> xfer->done, xfer->async_done is a pointer to a completion owned by
> whoever is waiting for the delayed response, and it stays valid only for
> as long as that waiter is still waiting.  In do_xfer_with_response() it
> is a DECLARE_COMPLETION_ONSTACK() in the caller's stack frame.
> 

Hi,

LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Tested-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian
