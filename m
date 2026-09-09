Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C3B538D91;
	Wed,  9 Sep 2026 11:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788952751; cv=none; b=lgHTc7JYBkit8IAAKrK6KXelgI/IkFkMH60pyP9MdZHgVaCtJgx7Xg69b3YPn0J/UpQvpagOfQod8YOn0ppgS6X2LPgLCIzW8nXEMl6tFLlY+ci7fHZWEm409El7cX/79V4wlw3tw1BKOc2zEnpfvsd9Z1GGuqkxq6FVTJ9xHP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788952751; c=relaxed/simple;
	bh=0z27TuDICIeRyqmCPKC7AxvlmQMlFwepct6/WPwp6CU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=slZ4o4VKx09zWiZZwE8zlZFvLc4vqnghDszyjci5X2UVYDdXgKnYyeTjfMf8Gn8vJLKe3gMAiIvXUpN+fTH7qMEYqbHd4dT2ucW1HbhgUghcXOoGqr/+jEN10mlZ9PHLuFKS5mFi3QRirZBwVMgtCpyf3/2WelNcztNndGZlLNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=EKOCfyVh; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="EKOCfyVh"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A36281691;
	Wed,  9 Sep 2026 04:18:59 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 769063F528;
	Wed,  9 Sep 2026 04:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788952743; bh=0z27TuDICIeRyqmCPKC7AxvlmQMlFwepct6/WPwp6CU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EKOCfyVh2ng6zaZCvB4qpszGmSyd2qCK9vwnww9ed6oHUevCW8yi8SF7V+nMJV7tH
	 sXtyIoLUHEOdQ/kPSnw4B2zPF/b7eACT2Se/ohEBz5pIaADVWNmSTXqmT/0BNK2xXU
	 Wto7H7vhGNPVKzxJnG6x5iHxz4usgjQSlWGu41Go=
Date: Wed, 9 Sep 2026 12:19:00 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: rolanddreier@rivian.com
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] firmware: arm_scmi: Don't reuse raw xfers with
 async_done still armed
Message-ID: <aqFApFQceTOfuThb@pluto>
References: <20260909-scmi-async-done-race-v2-0-cc5dec25c6be@rivian.com>
 <20260909-scmi-async-done-race-v2-2-cc5dec25c6be@rivian.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-scmi-async-done-race-v2-2-cc5dec25c6be@rivian.com>

On Wed, Sep 09, 2026 at 04:32:28AM +0000, Roland Dreier via B4 Relay wrote:
> From: Roland Dreier <rolanddreier@rivian.com>
> 
> In SCMI raw mode, scmi_xfer_raw_worker() releases the xfer before
> releasing the waiter that disarms xfer->async_done, and scmi_xfer_get()
> does not clear async_done when it hands out a recycled xfer. A concurrent
> transaction can therefore pick up the xfer while it still points at the
> old waiter's completion, so:

Hi,

LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Tested-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian
