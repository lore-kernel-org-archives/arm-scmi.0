Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E19BA568FD7;
	Tue,  8 Sep 2026 15:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882389; cv=none; b=mK4XIYFznHnSIkAgue5k9E4tR8yWRrTIv2HullHER+KygdnOr9NQfhCQq6K/As6AXel3nGmXa5KLT9SIfqmDIHZ4nIxVjyv4JYpbtWbVQt6wIMjZvqqfnwFWiPFplKxdT9uxP4wB2TmkcwhHSoiIBe8OcsmgZfRhocP6kkQyINg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882389; c=relaxed/simple;
	bh=IvMyBCw9IJioS6J+EGV0B1GbzdS6CwLF7mJqOTUcoJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p/1kbuw2+hGGFTvRTscNJDu9VrCUoqoS+Bq+gJDU1SvqEOkR37vFRpzs6TG6hQg1m5hQ6Pg+gbyny4HT8CCFtxaA+NjraCtg2O75Hdsmpr9Q3cCtdcUzp6cGo/TCv773bLYXza+J9FgZkY3MnBcOdzOQqRiIo3tbfOOsMw5dCss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=TJ9kcp0z; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="TJ9kcp0z"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 849441477;
	Tue,  8 Sep 2026 08:46:22 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10C6B3F7B4;
	Tue,  8 Sep 2026 08:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788882386; bh=IvMyBCw9IJioS6J+EGV0B1GbzdS6CwLF7mJqOTUcoJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TJ9kcp0zqndIF+wF3zB6h8KX0bh94QB6M3GJovCr6LVEJb8ZA0IdX3OenHe/RH799
	 1N11eQhBwZ/1+2mTzkaNmukJ+x6B6wDyDoKQJataY6uTXcHIXz+eTZAX9s92LwgZEa
	 THhoYb/snAXY5BIQRqlk2NT4VBmRjKGj2GimmrTo=
Date: Tue, 8 Sep 2026 16:46:22 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: rolanddreier@rivian.com
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] firmware: arm_scmi: Don't reuse raw xfers with
 async_done still armed
Message-ID: <aqAtziZh1BGCaP9B@pluto>
References: <20260814-scmi-async-done-race-v1-0-335b163d77ee@rivian.com>
 <20260814-scmi-async-done-race-v1-2-335b163d77ee@rivian.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814-scmi-async-done-race-v1-2-335b163d77ee@rivian.com>

On Fri, Aug 14, 2026 at 08:15:34PM +0000, Roland Dreier via B4 Relay wrote:
> From: Roland Dreier <rolanddreier@rivian.com>
> 
> In SCMI raw mode, scmi_xfer_raw_worker() releases the xfer before
> releasing the waiter that disarms xfer->async_done, and scmi_xfer_get()
> does not clear async_done when it hands out a recycled xfer. A concurrent
> transaction can therefore pick up the xfer while it still points at the
> old waiter's completion, so:
> 
>  - a delayed response arriving for the new transaction can be signalled
>    on the old waiter's completion, which may already be re-armed for yet
>    another unrelated transaction, making that transaction's wait return
>    early; and
> 
>  - the old waiter's disarm, which still runs after the xfer has been
>    released, clobbers the arming just installed by the new transaction,
>    so the new waiter times out even if its delayed response arrives.
> 
> Release the waiter first, while the worker still holds a reference on
> the xfer, so that an xfer can never reach the free list still
> armed. Track whether a delayed response is expected in the waiter
> itself instead of peeking at xfer->async_done outside xfer->lock, and
> wait on the waiter's own embedded completion. (The new async flag is
> not strictly needed but it makes the logic easier to reason about)
> 
> Finally, harden scmi_xfer_get() to clear async_done when handing out
> an xfer, so that no future release-ordering change can leak a stale
> arming into a new transaction.
> 
> Fixes: 3c3d818a9317 ("firmware: arm_scmi: Add core raw transmission support")
> Signed-off-by: Roland Dreier <rolanddreier@rivian.com>

Hi,

thanks for this.

LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Tested-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian
