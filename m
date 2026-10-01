Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0631D5CC9;
	Thu,  1 Oct 2026 14:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865886; cv=none; b=Y8u6Qzvj8xNgF1y8rlcNIrxuSTBeYDkiN7w5SgpQ+0G73XuBp1lVmo+htL+TnFQa0j1eba8miNanoJwTAn6uFEcaq7AcpTT0n3FucxQK96BWPjV+2JEkXU7/CDdsIxM4PIJBD3gYJny7a5BwAU754FUebhS+K++BqU+wQ/AQWEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865886; c=relaxed/simple;
	bh=fPBpKYn3qGwBxh0MvO99B8q2yX+lp0t9f7xtUzlK8Tw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lBEfd17GL+fgXACpCTjW1DPB9RCgwRGq2f1MGiv++EfJ5TKjETHdpQ03MEV/xJPCfidi7iG8iDgd3HioPv5ZFAS+q2w7hoapgZurybMjLbNnLDpZRFrv0KRX9DR5h6uQRJOT1EPaociJGuDe909BNf+m8PNbLlw0kh0kvM/TZ6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TEbHaD9U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TEbHaD9U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D22E1F000FF;
	Thu,  1 Oct 2026 14:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790865885;
	bh=63dxPAt9XcT66Tq82kcXkbDZlj/m4Bx9Zd5XKY1en8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TEbHaD9URUDeakq+mYH63uXsDoqNiaNTOQEMrBaTXxGpaMlzKWpodH0zd3pdWOKzS
	 vSSJuDKr0/taNbRXl4ezmx8ohpO2Nw2IPPQYV/xc0VtFgC2dIbo0RU/09UGavws660
	 IXxArJPosqeMARCusSsf34CyNu1fR9NbX3SZIF62csFABPDCLD2sBNi7vr6yWy+ky1
	 JnV2kic5MtXISVPw38eLsZPHSugGRZ56iWXT1CD5v2ZTdJTZi+NSuknpsG962qPPs1
	 2UaWQ7TlQH1TSCCnSaQzayfmHP7ginBqr3FzQWji/BYd8bnmOYzGhKTeCbS0g7FrfF
	 xF2DTmtUtBUVQ==
Date: Thu, 1 Oct 2026 15:44:42 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Cc: cristian.marussi@arm.com, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	git@amd.com
Subject: Re: [RFC PATCH] firmware: arm_scmi: skip empty CLOCK_DESCRIBE_RATES
 replies
Message-ID: <20261001-persimmon-wallaby-of-popularity-c29bf3@sudeepholla>
References: <20261001114538.671755-1-jay.buddhabhatti@amd.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001114538.671755-1-jay.buddhabhatti@amd.com>

On Thu, Oct 01, 2026 at 04:45:38AM -0700, Jay Buddhabhatti wrote:
> Some platforms advertise reserved or uninstantiated clock IDs that still
> succeed CLOCK_DESCRIBE_RATES with zero rates. After dynamic rate
> allocation, kcalloc(0) returns ZERO_SIZE_PTR and protocol init then
> dereferences rates[0], which panics.
> 
> Do not allocate or index the rate array when the firmware reports an
> empty list, so unused IDs are skipped instead of taking down the SCMI
> clock provider.
> 
> Fixes: 62ba967595e0 ("firmware: arm_scmi: Make clock rates allocation dynamic")
> Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
> ---
> The SCMI server is the source of this zero rate and successful response
> and it should be fixed in SCMI server. This defensive check in Linux is
> still useful because firmware responses must be validated before
> de-referencing dynamically allocated data, The panic is a Linux
> regression introduced by dynamic rate allocation; previous fixed array
> tolerated the same response and other SCMI implementations could return
> the same unexpected response.
> ---
>  drivers/firmware/arm_scmi/clock.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
> index 0278705d809e..8934a95527e2 100644
> --- a/drivers/firmware/arm_scmi/clock.c
> +++ b/drivers/firmware/arm_scmi/clock.c
> @@ -8,6 +8,7 @@
>  #include <linux/math64.h>
>  #include <linux/module.h>
>  #include <linux/limits.h>
> +#include <linux/slab.h>
>  #include <linux/sort.h>
>  
>  #include "protocols.h"
> @@ -484,6 +485,13 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
>  	if (!st->max_resources) {
>  		unsigned int tot_rates = st->num_returned + st->num_remaining;
>  
> +		/*
> +		 * Unused/reserved clock IDs return 0 rates. kmalloc(0)
> +		 * returns ZERO_SIZE_PTR and must not be dereferenced.
> +		 */
> +		if (!tot_rates)
> +			return 0;
> +
>  		p->clkd->r.rates = devm_kcalloc(p->dev, tot_rates,
>  						sizeof(*p->clkd->r.rates), GFP_KERNEL);
>  		if (!p->clkd->r.rates)
> @@ -505,6 +513,9 @@ iter_clk_describe_process_response(const struct scmi_protocol_handle *ph,
>  	struct scmi_clk_ipriv *p = priv;
>  	const struct scmi_msg_resp_clock_describe_rates *r = response;
>  
> +	if (ZERO_OR_NULL_PTR(p->clkd->r.rates))
> +		return -EPROTO;
> +
>  	p->clkd->r.rates[p->clkd->r.num_rates] = RATE_TO_U64(r->rate[st->loop_idx]);
>  
>  	/* Count only effectively discovered rates */
> @@ -622,6 +633,13 @@ scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph,
>  	if (ret)
>  		return ret;
>  
> +	/*
> +	 * Some platforms expose reserved clock IDs with an empty
> +	 * CLOCK_DESCRIBE_RATES reply. Do not dereference rates[].
> +	 */
> +	if (!clkd->r.num_rates || ZERO_OR_NULL_PTR(clkd->r.rates))
> +		return 0;
> +

I expect the Clock rate control bit to be unset in the permissions for
these clock, else it may be dangerous to do this. Please add that check.

-- 
Regards,
Sudeep
