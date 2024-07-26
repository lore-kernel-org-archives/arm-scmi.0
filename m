Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E335317A588;
	Fri, 26 Jul 2024 11:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721993386; cv=none; b=s9nPo/i7bKy0Oewv/U69CkLMYdxoBe1S8r+uoZAXHmvOVyJt5+FiFEywoo1g3vPxUiO+m5yMqeOtV7rAEe0rDZQke7VNwbmuHTeuqYrx2Y2RyTYJC7HWLANVB2S2LgXN50xRgPO+6UK+/V5yL2khPyYEDqjtsWMzQKLmcWqPWgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721993386; c=relaxed/simple;
	bh=gmHFYe7iHGXDksYqUVsLjNsYEYf0nHZ0hqMO7hbUkLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6gmFllfrjxRJn10tWhHG7og9F94Pp02QLZyijcKeXnUzYKL04LusiJVWjQ2V6y9f9n1CXFoncEFeEhDpb73IRtXSOtL+JHvMzKCTnFqjRBL+ODzooOR6Lg5WpsG32/ktkoa6pXp87gIqTssyTH6pejdX8dJZ8sE+C1kY3S3IuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDE291007;
	Fri, 26 Jul 2024 04:30:09 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6996F3F73F;
	Fri, 26 Jul 2024 04:29:43 -0700 (PDT)
Date: Fri, 26 Jul 2024 12:29:41 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Etienne Carriere <etienne.carriere@foss.st.com>
Cc: linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] firmware: arm_scmi: fix voltage description in failure
 cases
Message-ID: <ZqOIpU8gnoonBB9x@pluto>
References: <20240725065317.3758165-1-etienne.carriere@foss.st.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725065317.3758165-1-etienne.carriere@foss.st.com>

On Thu, Jul 25, 2024 at 08:53:17AM +0200, Etienne Carriere wrote:
> Reset the reception buffer max size when a voltage domain description

Hi Etienne,

Good catch, thanks for this.

Maybe a Fixes: too ?

Other than that, LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

> request fails, for example when the voltage domain returns an access
> permission error (SCMI_ERR_ACCESS) unless what only a single 32bit
> word is read back for the remaining voltage description requests
> responses leading to invalid information. The side effect of this
> issue is that the voltage regulators registered from those remaining
> SCMI voltage domain were assigned a wrong regulator name.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
> ---
>  drivers/firmware/arm_scmi/voltage.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/arm_scmi/voltage.c b/drivers/firmware/arm_scmi/voltage.c
> index 2175ffd6cef5..f1a7c04ae820 100644
> --- a/drivers/firmware/arm_scmi/voltage.c
> +++ b/drivers/firmware/arm_scmi/voltage.c
> @@ -229,8 +229,10 @@ static int scmi_voltage_descriptors_get(const struct scmi_protocol_handle *ph,
>  		/* Retrieve domain attributes at first ... */
>  		put_unaligned_le32(dom, td->tx.buf);
>  		/* Skip domain on comms error */
> -		if (ph->xops->do_xfer(ph, td))
> +		if (ph->xops->do_xfer(ph, td)) {
> +			ph->xops->reset_rx_to_maxsz(ph, td);
>  			continue;
> +		}
>  
>  		v = vinfo->domains + dom;
>  		v->id = dom;
> -- 
> 2.25.1
> 
