Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA963B27FF;
	Tue, 15 Sep 2026 14:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789482282; cv=none; b=K1pLwx2b/l8j9WpHWNGprAvoSe+wNUmDPN/lcx8V3XyYGFHi5plvs0/DMjNwnHiYLBHl2Px+UMaCAugif84nXEfoAnenbOdyaHlDITQMd8PLnOdH/r99EBP0OiESSXlUMl2a5fha3EyV1nxAFITkfF/UrONZgv1bIhuvCCEWqSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789482282; c=relaxed/simple;
	bh=P1qC4OPI/oZ8c4rh2Nsr1aKfNmTwMsQF6Y5+QHGzNyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XuNa1wD622LN6ek0Xz3liVdWSP3lEFrNtZr60punBa0k/eVfZ2sxO7b6H+qW/TjiWIDIXbqXEXQs51aZZx1L2wD9rgrhf0dAJRxr2m6B4SFgO1edKKcwnoL7kWarvDxuVyZ49JNfxiDOFctXSFhj0ZMPI4EwTQLV9HRtwsJRdjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xnxod4DO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xnxod4DO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 101B41F00893;
	Tue, 15 Sep 2026 14:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789482281;
	bh=r8ni1mTjcmqpvOY7RCC+MUPFEJ2xM3IZ63qC+OEFKHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xnxod4DOMtCyHNYu4mfTEoMlhoPIanminlnmb1fiFjHYTeZ7ThdTSps80279avO1u
	 b4N0EufvOv7WmY3kZpA4RPVwyS+4rekY7GCqjndmdbmFEFgdmbdJ1iEqo/iaHaNrGl
	 CnWXR0ZTfoOfJvSbVtPUnMbojU3MhLURDZixs0PBlXOfdXEiRUZ8vZtQugkhlowATt
	 PYhEwHvu0fUwEQwu4O660jheTPSwyrWjwfKzm45z6nuKpbGt81eR9sjjX4ilYnooFE
	 aCi+tNsYY43VYQiiUcwfY6l97aw1tH+Tjc3YhmWxOhRayq0n4NSCwKi6PmgBhHaznZ
	 Yl840I+Pvty5g==
Date: Tue, 15 Sep 2026 15:24:37 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/4] firmware: arm_scmi: fix module auto-loading
Message-ID: <20260915-origami-ibis-of-love-adaac1@sudeepholla>
References: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>

On Fri, Sep 11, 2026 at 05:23:25PM +0200, Hans de Goede wrote:
> Hi All,
> 
> Here is v6 of the patch series fixing arm_scmi module autoloading this
> combines:
> 
> 1. Patch 1/4 from Bjorn to add support for scmi bus modaliases to modpost:
> https://lore.kernel.org/all/20260618-scmi-modalias-v2-1-8c7547c1be21@oss.qualcomm.com/
> 
> 2. 2 SCMI bus code bug-fixes.
> 

I had a bunch of SCMI bus/core driver fixes merged into v7.3, please
rebase these changes on v7.3-rc2 or above and post.

I am interested in getting it tested by few people who were asking for
this feature. I haven't looked at 1/4 or 4/4 but they look not to
complicated or controversial.

-- 
Regards,
Sudeep
