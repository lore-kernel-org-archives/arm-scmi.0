Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 299E7481223
	for <arm-scmi@vger.kernel.org>; Tue, 19 May 2026 10:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779185087; cv=none; b=YbZhBZIGQLR8eoWUG6ufTDH2I5iZJgNtkx8v0xhk2xEaY54FSJQ0YKkMvCSLGoMEFbchshNAOWFKx0X1g9cvt7za2oIzzqZrU4yhA8CQclEsR37tlIMZvX7anDm8ZHs0G8JMyrCdPEog0LDJpLcF9mNLk2xeQ8TBEcq/OKhcYSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779185087; c=relaxed/simple;
	bh=ch2K1is+ZokQ/np75YnpANDr6DrQEd/ob6OQOR/rCxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TRs1Bwxhj6BRyx+aDVHb3sKe6r4qexoc4oWX5jHT6suc/MGpBhAj6lSW8JO7Pt1BqMkYh3yU3IVS+HLUIBoafsvohEpEvnV5Wu81xb9hzN9OIPzUc70T2I2fThs4oYNVXjnpfsX8ZoEQ6ZWMQbDXQRxI6ORNcirujB/j7ZROvVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=RQlhvxXI; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="RQlhvxXI"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 418112008;
	Tue, 19 May 2026 03:04:40 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 76AE03F85F;
	Tue, 19 May 2026 03:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779185085; bh=ch2K1is+ZokQ/np75YnpANDr6DrQEd/ob6OQOR/rCxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RQlhvxXI4yYI0XE8Pwic2nBsFTHhpGvQZ/xyF0louoF6SuIJwF+hJmMH42wj+Fm9h
	 rJqhd7Xv4zFUDZdl0sfLkJAkaXOO65sj8PWfGrc4lX3Oo0eCGUjZakEWbpjusDw+CI
	 a524l2Z6XazJ19jH8N2oLpMYv30/PHqPm3ac0Zlc=
Date: Tue, 19 May 2026 11:04:41 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/4] firmware: arm_scmi: Validate Powercap domains before
 state access
Message-ID: <agw1ueCQ0WjoBX7-@pluto>
References: <20260517-scmi_fixes-v1-0-d86daec4defd@kernel.org>
 <20260517-scmi_fixes-v1-4-d86daec4defd@kernel.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517-scmi_fixes-v1-4-d86daec4defd@kernel.org>

On Sun, May 17, 2026 at 08:02:43PM +0100, Sudeep Holla wrote:
> Powercap protocol v2 keeps local enable and last-cap state per
> domain. Some public operations indexed that state before checking that
> the supplied domain id was valid, and cap_enable_get() updated it even
> when cap_get() failed.
> 
> Validate the domain before touching the per-domain state and only
> refresh cached enable state after a successful cap_get().
> 

Hi,

> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> ---
>  drivers/firmware/arm_scmi/powercap.c | 25 ++++++++++++++++++-------
>  1 file changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/powercap.c b/drivers/firmware/arm_scmi/powercap.c
> index ab9733f4458b..eb5c35cad026 100644
> --- a/drivers/firmware/arm_scmi/powercap.c
> +++ b/drivers/firmware/arm_scmi/powercap.c
> @@ -453,10 +453,14 @@ static int scmi_powercap_cap_set(const struct scmi_protocol_handle *ph,
>  		return -EINVAL;
>  
>  	/* Just log the last set request if acting on a disabled domain */
> -	if (PROTOCOL_REV_MAJOR(ph->version) >= 0x2 &&
> -	    !pi->states[domain_id].enabled) {
> -		pi->states[domain_id].last_pcap = power_cap;
> -		return 0;
> +	if (PROTOCOL_REV_MAJOR(ph->version) >= 0x2) {
> +		if (!scmi_powercap_dom_info_get(ph, domain_id))
> +			return -EINVAL;
> +
> +		if (!pi->states[domain_id].enabled) {
> +			pi->states[domain_id].last_pcap = power_cap;
> +			return 0;
> +		}
>  	}

Yes, definitely better.

>  
>  	return __scmi_powercap_cap_set(ph, pi, domain_id,
> @@ -637,6 +641,9 @@ static int scmi_powercap_cap_enable_set(const struct scmi_protocol_handle *ph,
>  	if (PROTOCOL_REV_MAJOR(ph->version) < 0x2)
>  		return -EINVAL;
>  
> +	if (!scmi_powercap_dom_info_get(ph, domain_id))
> +		return -EINVAL;
> +
>  	if (enable == pi->states[domain_id].enabled)
>  		return 0;
>  
> @@ -678,16 +685,20 @@ static int scmi_powercap_cap_enable_get(const struct scmi_protocol_handle *ph,
>  	if (PROTOCOL_REV_MAJOR(ph->version) < 0x2)
>  		return 0;
>  
> +	if (!scmi_powercap_dom_info_get(ph, domain_id))
> +		return -EINVAL;
> +

Ok.

>  	/*
>  	 * Report always real platform state; platform could have ignored
>  	 * a previous disable request. Default true on any error.
>  	 */
>  	ret = scmi_powercap_cap_get(ph, domain_id, &power_cap);
> -	if (!ret)
> +	if (!ret) {
>  		*enable = !!power_cap;
>  
> -	/* Update internal state with current real platform state */
> -	pi->states[domain_id].enabled = *enable;
> +		/* Update internal state with current real platform state */
> +		pi->states[domain_id].enabled = *enable;
> +	}

Mmm, this changes the logic as stated in the above comments...now the
problem is recalling WHY I adopted this logic :<

Thanks,
Cristian
