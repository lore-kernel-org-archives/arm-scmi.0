Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793195749;
	b=uXMN76u0F8L82aXWmy8jXLRMx87Q6dMl3GdXtDoCymMA2lKn5+iJLDY1XvnQ4mQtvgzn
	 ytVreCuvepWdUABr9FzuVQQTouTVjcAG2vFnq7bpFao05An5eUBhFY+lrFuQJU3N1U1Ee
	 pD1hySTgcIuIkCIcSXFhOAiD/n+xzzTKhuQrZlPyAMJlG8v1lYrZw/TWmCKwzY1MA3qm2
	 8yjLqHes77tM7uMt1dgnNiqLHGwuEo/u0lHWOn2OifQuDwNSrquyS6qkXDCvvnfCfSTOh
	 LG8Yb/l4qJp/kyaBGurY9ukkop0rGvGiHmz4nElx3IgcZIDn7q/DYswzpUujs8EkQhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195749;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=fNNHRodU41vyHJ/yGqrIn2TFntyAumGGltE3jgUaaDQ=;
	b=L6u8z5SURzh0KOX33laNbhAwSmN3lTBCDML4bF8/AkcHeud0osUfUp95cxqS/oqdEkCE
	 oDrqFrAOhX08YkPKbL9Y3hRTgvfbspyx4HhLt3sE56MnZYDklsioQNwwQ1T6UJiQ0YZex
	 1a0/uvAxGuEHcHHIDCFKvtWsMDOraB0S69hq15hOLxtOKEijNUVZMml63ap6pbbJBZ2dN
	 xPl7qV41vBsEDclGfjU1WU6ux14oO9Ojfy0TnZ1MJF8ZVhV0+jQHts7CmRjAFDL6Ex3+f
	 nyCA5/VB3B4f1U36piz6SRzeZR7jw7xfjcVIb224E6nwlTkexgeukCNh5SlSc3mhQRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NaRXsftu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8548A606A31C
	for <arm-scmi@vger.kernel.org>; Wed, 28 Oct 2026 13:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NaRXsftu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07C3B1F01825;
	Wed, 28 Oct 2026 13:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793195749;
	bh=fNNHRodU41vyHJ/yGqrIn2TFntyAumGGltE3jgUaaDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NaRXsftueCDPsswZ2j1ClUitl2cw3/aLfx56YMFaZeAztXW5hEaT/YlmmaYG1ZgIA
	 v10DSHVNzZTE0VsyQgfXEfYa1DABKO9RPYe8lmmqhvO+GyPnTyztWuGvOUNKI/f0R8
	 p3s1OSGaahMCDRmSz9Dw2kSBHFy2nnTBGDuEgIX7iaQ4iRW9YtFomhKhCKb0weJn7H
	 wy0yKPMczEh8HDJXDja9ackemDjBWpTWeQo2Xw9BpmwzefqEP7FNplsg1+DxgYrSRs
	 POcYeau9G1FTlxWoHlrNptL/mKkUFx4hDHvrI4bxu+9zSuBSvJJmQOO99kQ53u+Ve1
	 3pq3YUplcBGag==
Date: Wed, 28 Oct 2026 13:55:46 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	Peng Fan <peng.fan@nxp.com>, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 1/3] firmware: arm_scmi: imx: Track copied syslog words
Message-ID: <20261028-rousing-spiritual-harrier-fbcbe7@sudeepholla>
References: <20261028130502.2999676-1-sudeep.holla@kernel.org>
 <auH9VafGSnYCRlUz@shlinux89>
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auH9VafGSnYCRlUz@shlinux89>

On Wed, Oct 28, 2026 at 09:49:09PM +0800, Peng Fan wrote:
> On Wed, Oct 28, 2026 at 01:05:00PM +0000, Sudeep Holla wrote:
> >The MISC syslog iterator records the number of returned words plus
> >firmware-reported remaining words in the caller's size output.
> >
> >The debugfs consumer uses that value to dump its fixed-size buffer. A
> >malformed or inconsistent response can therefore make it read beyond
> >the copied data and allocation.
> >
> >Return the accumulated number of words copied into the caller's buffer
> >instead. The generic iterator bounds this count to the initial buffer
> >capacity before processing each response.
> >
> >Reported-by: Sashiko <sashiko-bot@kernel.org>
> >Closes: https://sashiko.dev/#/bug/linux-c3c9437c-ba1a-4db6-837f-cb0950d89018
> 
> This should be: https://sashiko.dev/#/bug/linux-67e325a9-473e-450a-a2a0-bf4c0c720624
>

Thanks, my bad copy-paste error. Thought it was copied but no 😢.

> >Fixes: 4fa62e80c7db ("firmware: arm_scmi: imx: Support getting syslog of MISC protocol")
> >Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> 

Thanks!

-- 
Regards,
Sudeep
