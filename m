Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B1F3815E4;
	Fri,  2 Oct 2026 08:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931162; cv=none; b=UszjzU+lH8IZBDp7YOKHuezxOxn5j0sJi+tDsS223oAx44RajMmKNA/A9qd1ypB+1cSAsAhFdFNrvTA+IjBAu89XMwuACaTaIrYcMUHk0C13+b0RjAhJR8EanqlDYS0/mqXGb2t5GIwujL4c3+bXrPfsE+xccWOY/PEdy/RGYJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931162; c=relaxed/simple;
	bh=iXHsLNEIgTdVkQf252hrq1bGqMSRsvZLxR8EVqQ/E3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TeCVZj/nPMwpWajiN6m9ZOtfOmWa0l+meL30eZxlDMdMKAWRXym9/HxkLYgV4k8RmcSHmMF7sZA5eyPRadEZNVPxnuAOoKup6JjeeGHlPGAQqtMUOmH1uZoKo9WvZ8U/oxsBVk855It//BVoB0r+w37kKeG4Sju39YT9ELCv2nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sg/y24rR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sg/y24rR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D11A01F000FF;
	Fri,  2 Oct 2026 08:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790931161;
	bh=ElvCQz9IYbz+BJxp9eo1Z5bEYL8XU0GKr6zST1/WuR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sg/y24rRAcEXOhQRX8+aKshGrVMw8+4m9vNZEP9K5iFQrTKLW4ZLuPHs9+sv+9msv
	 O1N1itY/xt9lsgDyQqHRzIJ5SsVySeboTU3exeOYAQJGNGj369euUwm4ldyMkzqIqT
	 3K82DO85lc332822y3Xp3wSZkrJIwz19cMj4Y/RSusL+SButTyfeNR41JvhHsz331r
	 o7QOhXGirmwgGDC9sP4RHvYvbU9Sx81gVs1cRkqrSlO2x6VL6SRbkqo7jXq99GUcrX
	 Ux4TXXY/qbU2FW6HLPTK/49qZLOVFO8RBi+8u5xVcESjn3cIe7zeR8slNIkTfh1weh
	 6UXtOh5mg0bbg==
Date: Fri, 2 Oct 2026 09:52:37 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] reset: scmi: Set the device for the reset controller
Message-ID: <20261002-statuesque-blond-hog-fe0388@sudeepholla>
References: <20261002084142.1570378-1-hayashi.kunihiko@socionext.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002084142.1570378-1-hayashi.kunihiko@socionext.com>

On Fri, Oct 02, 2026 at 05:41:42PM +0900, Kunihiko Hayashi wrote:
> SCMI reset driver does not set rcdev.dev when registering its reset
> controller.
> 
> If rcdev.of_node is not available, the reset core tries to obtain
> the firmware node from rcdev.dev. However, rcdev.dev is also NULL,
> causing a NULL pointer dereference.
> 
> Set rcdev.dev to the SCMI device.
> 

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

Worth adding fixes tag IMO

Fixes: c8ae9c2da1cc ("reset: Add support for resets provided by SCMI")

Hi Philipp,

Can you please take this in your next round of fixes and/or updates ?

-- 
Regards,
Sudeep
