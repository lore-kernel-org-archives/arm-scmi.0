Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A348B4CA274
	for <arm-scmi@vger.kernel.org>; Wed, 29 Jul 2026 14:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785334649; cv=none; b=giKceXrNInkswdJtuDwn8lZ3lZdk/LOyJdgrKAGJt2GqoKEybcvt/WcgbVHQP+d59Pj/pNhV3WRL5RkVsWYMMI2UkKE0TdoojVRTfa7LthI4F7a3Kg11FvuggNwsXeAArz1Dl58BsHh5f+TKCfSLZITRKMLb1ee3nrPPK+VS9iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785334649; c=relaxed/simple;
	bh=6Jx2L0ocTtRKJHg3K97BHNNegorNLbdMcnkkY1ToPJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tld8JIIukdvq9uzrB968ptV/2KhrCBwq3iWiakUbCSqAK4FVP+PKzqg1xSlzJIWXdJSahT6Q7FGBzObzGvXCUuhNUARWJDzXm9Q1LCMd6pe+Bdic479lU61+qspwehxmDUtqtjJ3R18IHr+o/klw5WB+fCdniO5iD5vIH0CuhYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JifVll/C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JifVll/C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B5351F000E9;
	Wed, 29 Jul 2026 14:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785334648;
	bh=iPM1uu5fpn+tun/ggpxhHadjLMW87KYXfYbrFYkrODg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JifVll/Cn2UrNEN8rfjQE705up2gFEmr4FVSTutFacF4Gwira5XZZNMuKePnbed+R
	 LY+VJ+NLHQkdhkzxwvNYWUSjSaYekxCpsowpUFGBO3/mdRixxjA7dz0kVZuIro5ujE
	 lKYC5DGN4a02R5pXZzOa9ZMWn98QAhvWQqvnJIedca+TAvWW33dwH4AvO8SSCEoo6F
	 O+ZgVVilyoOm6pdiFq2wqETNS4lmfmYggjA+muYgrY58HhpQKBkA09UHv7F9nPeqse
	 sqzVzzqcfzqzeUvrd8z+kUPA9BVdXt3PETuzh4hBYgaob6RsJ5Htt85ISCBUJQQFRc
	 0EudEO6w0CpRg==
Date: Wed, 29 Jul 2026 15:17:25 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>, guomin_chen@sina.com,
	linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com,
	quic_xinqzhan@quicinc.com
Subject: Re: [RFC PATCH 2/2] firmware: arm_scmi: Add bus support for
 autoloading
Message-ID: <20260729-optimistic-lemon-myna-a14bbf@sudeepholla>
References: <Z6CNWOp8B_ghIrJt@pluto>
 <20250203100154.140877-1-cristian.marussi@arm.com>
 <20250203100154.140877-2-cristian.marussi@arm.com>
 <aibW10NMmzw3QnZ5@mai.linaro.org>
 <aibzLcZiVwtUHAgV@pluto>
 <20260609-upbeat-bullfrog-of-enrichment-0f44aa@sudeepholla>
 <282af085-1669-4d9d-9c1d-2fc232252be0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <282af085-1669-4d9d-9c1d-2fc232252be0@oss.qualcomm.com>

On Wed, Jul 29, 2026 at 04:11:18PM +0200, Daniel Lezcano wrote:
> 
> Hi Cristian,
> 
> On 6/9/26 11:01, Sudeep Holla wrote:
> > On Mon, Jun 08, 2026 at 05:51:57PM +0100, Cristian Marussi wrote:
> 
> [ ... ]
> 
> > > Thoughts ? Plans ?
> > > 
> > 
> > Just repost as non-rfc after next merge window and we will see if there is
> > much interest to get it merged for the following one and take it from there.
> 
> Are you planning to resend the series ? I can test them on my laptop
> 

I thought [1] from Bjorn was addressing the same issue ?

-- 
Regards,
Sudeep


[1] https://lore.kernel.org/all/20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com
