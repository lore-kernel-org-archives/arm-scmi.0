Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5149D40870;
	Fri,  9 Aug 2024 17:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723223098; cv=none; b=jHyUaxj8MXE7nAvc0t8PqNMchf49ILEt5fqQ6TD0g4kMO7zWGJL6sljc91pghJAWS+nuewBx+bBYwca27wRVNpBhwBUDtawqGQWS2+MfcaHDqQBnCaMfEcfc+bpcKk+2c2vt/GSJLB9D2dktS1CRHAx3RD/vpl9Kop6VcVUwFNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723223098; c=relaxed/simple;
	bh=3oiKUAi5CQGmfjCJN5efMxS194h/agVQWYEiZVsSyRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UrswxB1t/zdNkG07Ssh2lLrVITJi+Vs1YECWHWoV5aJKZ87I4FzcRmr/29rypgoy2a8GeKeqBOECfxXN1RSgrcOYbKwyXy6RGe4MuRiMjqxUK9BhKKgHO8I4x7dD/ScK3crBO9LzOmJ90KnVtcRbYYgZw8IWHoFgmkA980Pmb24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D97113D5;
	Fri,  9 Aug 2024 10:05:21 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10D093F6A8;
	Fri,  9 Aug 2024 10:04:53 -0700 (PDT)
Date: Fri, 9 Aug 2024 18:04:45 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com, Cristian Marussi <cristian.marussi@arm.com>
Subject: Re: [PATCH] firmware: arm_scmi: Update Base protocol version
Message-ID: <ZrZMLZq_-b9EFRgn@pluto>
References: <20240809120014.724959-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809120014.724959-1-cristian.marussi@arm.com>

On Fri, Aug 09, 2024 at 01:00:14PM +0100, Cristian Marussi wrote:
> Base protocol version had been increased with SCMI v3.2. Update accordingly
> the supported version define in the kernel stack, since all the mandatory
> Base commands are indeed already supported.
> 

Hi Sudeep,

please disregard this, I spotted a few more protocols lacking a similar
update...I'll post a single patch with all the upgrades.

Thanks,
Cristian
