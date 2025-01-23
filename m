Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E000920E318;
	Thu, 23 Jan 2025 12:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737634857; cv=none; b=fRmrT0CqB9jdFOKgRdpdX/AGl/HPEMNz/hite6YyOSApY/EFLpJrViV8u990bc2NC4PnAkGl+3FhApUMoV1nw6dBeritEFgvrZn02ozKRuvxry9gA6MasIXFnStKZCiXLxKhp2/eeVdHZpPfyz/KFBGGk6+xM/bSKH+bmN4ZbEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737634857; c=relaxed/simple;
	bh=v+ggoH+6q2rCbonJV3aVmle6vBsp4LXX22as1XENQvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TjQ3CZmE6EdvYe66Qv/sOuNFiBRN6TxSPlY2p9XYjWQbcLYS3WFwUdy1OFAzd0sXCLZvV6BAoNM9McJGZOChhOHBg6x1jtIAgHQkmM8MVIcsTs6p1Djedkng1VrwkJVP7k+9/Nxpw2spcLS1ekKlEct5VfxYmKklfFHXzs7ly4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6FF8A1063;
	Thu, 23 Jan 2025 04:21:23 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7421D3F5A1;
	Thu, 23 Jan 2025 04:20:53 -0800 (PST)
Date: Thu, 23 Jan 2025 12:20:50 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: <cristian.marussi@arm.com>, <arm-scmi@vger.kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
	Jason Liu <jason.hui.liu@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: imx: Correct tx size of
 scmi_imx_misc_ctrl_set
Message-ID: <Z5I0Irl1eUarzLlA@bogus>
References: <20250123063441.392555-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123063441.392555-1-peng.fan@oss.nxp.com>

On Thu, Jan 23, 2025 at 02:34:41PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> 'struct scmi_imx_misc_ctrl_set_in' has a zero length array in the end,
> so sizeof will not count 'value[]', and txsize is smaller than actual
> size for tx,and SCMI firmware will take this protocol error.
> 
> Fix this by enlarge the txsize with 'num * 4' to count in the size of
> data.
> 
> Fixes: 61c9f03e22fc ("firmware: arm_scmi: Add initial support for i.MX MISC protocol")
> Reviewed-by: Jacky Bai <ping.bai@nxp.com>
> Tested-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Acked-by: Jason Liu <jason.hui.liu@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> 
> V1:
>  Patch is cherry-picked from downstream, so tags are kept.
>

I don't if Ack is really helpful, but Tested-by is as we can't test it
on any other platform. But it would be better if provided on the list
instead of coming pre-packaged like this in the future. I will add it
as fix soon. Thanks!

-- 
Regards,
Sudeep
