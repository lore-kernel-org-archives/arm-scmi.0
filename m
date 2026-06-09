Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786452FDC57
	for <arm-scmi@vger.kernel.org>; Tue,  9 Jun 2026 09:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995719; cv=none; b=LyhEqauAhm8ClQlOwN5Vhy6jX21huR74oO4F2ytbPiBg7tKap11InkK95WfUD3DngagTROS7NleKIwhcvEZ0uvbcbh752voR/UTswbxaMSKiWzdxutq4bT4Z930taZUXqtQ1CU36u9ViGOB7rIL75Lqj1ZzsnqF1+P85QLIEK5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995719; c=relaxed/simple;
	bh=y6P06zSfkGI8TMOdnWbhYLfYAkz6ioNnKazEMt7crkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ve8QKMw0MCLUYY7xfgD6FF/i+5hX5z7CeLHfNtHs+H6/LlevrCdFWI5O0uny4r+AoOiQVfwVAB6hDA2UXeM7zw84MtZXt0HfM2AWPYdH/gbp/ki5Co27f7pnL7UU81We2Rb28CurCOqC6iqkHPC10RrNrVNZYDW79nVHnwe+gFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RC58WY+r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RC58WY+r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C474D1F00899;
	Tue,  9 Jun 2026 09:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780995718;
	bh=JruC8k6kLzC2UYU4kmBoov1a18EmnFpopVAih4awSiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RC58WY+rqdjh3dLlpwNlPoxtSJuHf+z7jk57rPAF0YLT+rrxsw8XKgEKJdAkasjgj
	 91nYPFbrldPB7igJfG38kNG1qV2p0K3S01InxlL+bDxABh38CmVIYgUWVouRFHO4Mx
	 W9X07mfgbW+ekmVm4cBDDN572yxYBJdE677Zx56XZaOhjTaGKSnHO15vLJ0kgin40d
	 9z1ZQr1V6AnCV9wB2oSHmlJCzUJizdHqZFhbFGigc+meQQQ+OeRUfrIl1tZwM1cqoP
	 QMg31Q1xSejdXYm9VeWdpLN+iicjUdX6uoWVHw52XCG/xZ6Jr58JLF6GarzyuoJy7e
	 RNjxnN+lgkcbw==
Date: Tue, 9 Jun 2026 10:01:54 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>, arm-scmi@vger.kernel.org,
	guomin_chen@sina.com, linux-arm-kernel@lists.infradead.org,
	peng.fan@nxp.com, quic_xinqzhan@quicinc.com
Subject: Re: [RFC PATCH 2/2] firmware: arm_scmi: Add bus support for
 autoloading
Message-ID: <20260609-upbeat-bullfrog-of-enrichment-0f44aa@sudeepholla>
References: <Z6CNWOp8B_ghIrJt@pluto>
 <20250203100154.140877-1-cristian.marussi@arm.com>
 <20250203100154.140877-2-cristian.marussi@arm.com>
 <aibW10NMmzw3QnZ5@mai.linaro.org>
 <aibzLcZiVwtUHAgV@pluto>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aibzLcZiVwtUHAgV@pluto>

On Mon, Jun 08, 2026 at 05:51:57PM +0100, Cristian Marussi wrote:
> On Mon, Jun 08, 2026 at 04:51:03PM +0200, Daniel Lezcano wrote:
> > On Mon, Feb 03, 2025 at 10:01:54AM +0000, Cristian Marussi wrote:
> > > Emit proper MODALIAS uevents when SCMI devices are created and make sure
> > > all the standard protocol devices are requested when the bus is
> > > initialized.
> > > 
> > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > > ---
> > 
> > Hi Cristian,
> > 
> 
> Hi Daniel,
> 
> nice to hear from you in the SCMI land :P
> 
> > what is the status of this patch ?
> 
> ....I'd say forgotten/abandoned...I worked on that a bit when I realized
> only part of the stack was autoloaded...then it did NOT received much
> love and then I forgot it....buried by other prios....
> 
> Indeed I have still the local branch...but after a quick check I think
> is the same as the RFC posted.
> 
> bbd14b0f7733 firmware: arm_scmi: Add bus support for autoloading
> 8d982393b505 firmware: arm_scmi: Generate aliases for SCMI modules
> 383c127faa97 (scmi_vendors_autoload_V2) firmware: arm_scmi: Add aliases to transport modules
> 00caa894bce2 firmware: arm_scmi: Add module aliases to i.MX vendor protocols
> d900620c46bb firmware: arm_scmi: Support vendor protocol modules autoloading
> 4fe57bbeb6dc firmware: arm_scmi: Allow transport properties for multiple instances
> ad236e5a7f01 Linux 6.13-rc1
> 
> ...where scmi_vendors_autoload_V2 is merged already...
> 
> Thoughts ? Plans ?
> 

Just repost as non-rfc after next merge window and we will see if there is
much interest to get it merged for the following one and take it from there.

-- 
Regards,
Sudeep
