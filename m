Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792766063;
	b=0+fCtNukgNbrQVdTv0qKZMnh+Y08JGLXKcYxS9ACLWgnuT/F2W0TS3iI3zbsHqOVeiSE
	 BW1fthLpUC4EI+wdaEHLot8b8+lxNsVluwZ98zTRXgOLs/AyYE2tRBI59LOFqtXGXGEA2
	 U5BlnohlGvv16t6xwOFgf/O0l4IL4PK5fPUkkyChKRLIUF3+Gvvt3wSiLxED0MBUvVXqn
	 kpu6iAKJceQau8345szmTuZ49BRYCBf1/MnL9UfTZKkjnLMRpnmaJZzYMwoiDR5T04eXL
	 abetDAokYorN3X0I0ZnEocsLK5nS0S1jjsdT08prrqhJiZT2T0oShiywFQfGgcJMkTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792766063;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=TRfZVZt4tcGcaGYkCxyGHwyR1u4kYNjbLJ3T1lmacwg=;
	b=4+TebL18kIYkmmuQCt1Jzi8v2Z95J3YQ4uwz1aR1YPO0rwCR332OqGhO7gA6ApZDQzT3
	 pW26RYzZaBXgLcnXVHoP0uT7w3b1P6iNPpy81QevC0YE/Xy771iEqOBUXmaUgfp0xORaE
	 Kx7J03hngpPtFvvz6GTIobLU9MgnjyPFXvFBFbkaQapXOE+PtHgclgCNRbISSiGn2/QOy
	 ykBVPZZ9CXC00jm4QZ2VjMBqgjwt5bcm8W8hdwwVrHWgpsB83jWlSgkohxEpQfSqZoAoU
	 XI3+/cPMn1C9o9G46te3TkJ9eZQd0Kj6vJjWDLJnSxqIzvcB63vjZPs0U4LbYyRvuOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YE+jlkkd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDC1606A31A
	for <arm-scmi@vger.kernel.org>; Fri, 23 Oct 2026 14:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YE+jlkkd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 605901F01825;
	Fri, 23 Oct 2026 14:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792766062;
	bh=TRfZVZt4tcGcaGYkCxyGHwyR1u4kYNjbLJ3T1lmacwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YE+jlkkdjVyLffJ9mFnWXu8HQlNbNTlntAcB2y5n2toyCWGzsRIAA8Vcig9DJ1R3n
	 YxE92SVj8T3Gy59VC6pz7TG/xckQE7nvNK6dHi1l3+wONC6F8EspwbYL/bgSvpkhr1
	 IUhoKhbqeIJ59EQq559628xtdt5Zr/1DelAh4vbUW6QTuyq/CvbhI8eAqAX1p1jcR1
	 HzInNT3CBny3BObQPYkmIcMQnyxCy5mNm/Ci4XccPhxUrl0/2WWgHeX0thrcl4oCmB
	 m2w1X9tguph8kKMxPjTM9+FJBidT8kSMNcI6/ME+2/rwYs7rX9B69tzyxPPDHnOXTB
	 6nBarPoINR7iw==
Date: Fri, 23 Oct 2026 15:34:19 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 1/2] pmdomain: arm_scmi: Skip domains that fail
 initialization
Message-ID: <20261023-sympathetic-raptor-of-domination-c03cdf@sudeepholla>
References: <20260923101608.4180057-1-sudeep.holla@kernel.org>
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
In-Reply-To: <20260923101608.4180057-1-sudeep.holla@kernel.org>

Hi Ulf,

Not sure how, I seem to have used your kernel.org email on this
couple of fixes I had. Let me know if you want me to repost with
Qcom email id.

On Wed, Sep 23, 2026 at 11:16:07AM +0100, Sudeep Holla wrote:
> pm_genpd_init() can fail while allocating generic power-domain state.
> The SCMI driver ignores that error and stores the partially initialized
> domain in the onecell array. Provider registration then fails because that
> domain was never added to the global genpd list.
> 
> Preserve support for partially available SCMI power domains. Log the
> failure and leave the corresponding onecell entry NULL so the other
> initialized domains remain available. Explicitly skip empty slots when
> unwinding provider registration failures.
> 
> Fixes: 898216c97ed2 ("firmware: arm_scmi: add device power domain support using genpd")
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> ---
>  drivers/pmdomain/arm/scmi_pm_domain.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
> index 3d73aef21d2f..00192472f325 100644
> --- a/drivers/pmdomain/arm/scmi_pm_domain.c
> +++ b/drivers/pmdomain/arm/scmi_pm_domain.c
> @@ -99,8 +99,13 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
>  		scmi_pd->genpd.power_on = scmi_pd_power_on;
>  		scmi_pd->genpd.flags = GENPD_FLAG_ACTIVE_WAKEUP;
>  
> -		pm_genpd_init(&scmi_pd->genpd, NULL,
> -			      state == SCMI_POWER_STATE_GENERIC_OFF);
> +		ret = pm_genpd_init(&scmi_pd->genpd, NULL,
> +				    state == SCMI_POWER_STATE_GENERIC_OFF);
> +		if (ret) {
> +			dev_warn(dev, "failed to initialize domain %d: %d\n",
> +				 i, ret);
> +			continue;
> +		}
>  
>  		domains[i] = &scmi_pd->genpd;
>  	}
> @@ -126,8 +131,11 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
>  
>  	return 0;
>  err_rm_genpds:
> -	for (i = num_domains - 1; i >= 0; i--)
> +	for (i = num_domains - 1; i >= 0; i--) {
> +		if (!domains[i])
> +			continue;
>  		pm_genpd_remove(domains[i]);
> +	}
>  
>  	return ret;
>  }
> -- 
> 2.43.0
> 

-- 
Regards,
Sudeep
