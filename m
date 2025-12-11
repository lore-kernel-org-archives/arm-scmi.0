Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 426282D97AC
	for <arm-scmi@vger.kernel.org>; Thu, 11 Dec 2025 12:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765455441; cv=none; b=HlbOHdbwJ0cuKkpekpGl2dfEABhk0zRglBYUc2fl+SDyvJgA9ax7cxT/QrfRKK21e9i7Yo9iqjMo7c/E3YqPrQ+/i0HTQF9h8ANTrQz2djnt7u+5foANKgL2i3xBDGG2cowSzQBatIq0G/XMhse4nru5ToJ6eOcAqFh3uKS/nuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765455441; c=relaxed/simple;
	bh=ZnTI81v9Rls3sc0aLRu+jf8l12sJ7trkYGXMF61cfvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pBjcFPvUt2CRDGktbKlZq2dF6r4AfUofSfoOizacf/Q8ARXM6wKEYMlXFPreh+t8x1oQ1PGzC021FPMywd6idsKxKaW/kvt4h9DCDSpVIMPOuLFJVfDyw/tqaRtyzKJ78Nl2WY8NAcwU6VQK2Dmbg1irTtW1ZFXbPhI4oZGPYyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B637FEC;
	Thu, 11 Dec 2025 04:17:11 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A07E3F73B;
	Thu, 11 Dec 2025 04:17:17 -0800 (PST)
Date: Thu, 11 Dec 2025 12:17:01 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Amitai Gottlieb <amitaig@hailo.ai>
Cc: arm-scmi@vger.kernel.org, cristian.marussi@arm.com,
	sudeep.holla@arm.com
Subject: Re: [PATCH] firmware: arm_scmi: Fix unused notifier-block in
 unregister
Message-ID: <aTq2IA6V1nTE-XSC@pluto>
References: <20251211114926.709004-1-amitaig@hailo.ai>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211114926.709004-1-amitaig@hailo.ai>

On Thu, Dec 11, 2025 at 01:49:27PM +0200, Amitai Gottlieb wrote:
> In function `scmi_devm_notifier_unregister` the notifier-block parameter
> was unused and therefore never passed to `devres_release`. This causes
> the function to always return -ENOENT and fail to unregister the
> notifier.

[ CC-ing also Sudeep ]

Hi,

thanks for this.

LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

> 
> In drivers that rely on this function for cleanup this causes
> unexpected failures including kernel-panic.
> 
> Fixes: 5ad3d1cf7d34 ("firmware: arm_scmi: Introduce new devres
> notification ops")
> Signed-off-by: Amitai Gottlieb <amitaig@hailo.ai>
> ---
> 
> This is not needed upstream becaues the bug was fixed
> in a refactor by commit 264a2c520628 ("firmware: arm_scmi: Simplify
> scmi_devm_notifier_unregister").  It is needed for the 5.15, 6.1 and
> 6.6 kernels.

I think there is some sort of syntax to refer to the applicable Kernel
versions in the tag line....not sure it can be easily followed here...so
maybe the above comment is enough...

More details here...

https://docs.kernel.org/process/stable-kernel-rules.html

Thanks,
Cristian
