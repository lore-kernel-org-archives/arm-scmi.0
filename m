Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD78144AB69;
	Thu, 13 Aug 2026 10:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786616087; cv=none; b=uXOAqFTO8Aoi05S6hl+sJyeyiHz3Vd9PXfZlw+fZtxmtIx1I6JcWcv+Fxcnsca9uGJN7+NrZRdLCVZRXK7CQykg78qJQZkxqXTIkMWN5Isz4xJsaolx4l6dKDYtKK2+1nAhvWr3YFqUVt1aMbvYNzpGu2g+2qGOzCTS/Je8FWSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786616087; c=relaxed/simple;
	bh=U15xNbiafg66CEIzVRlypK8u3rfXnTp1g65n4DJvfbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eqZSyP2kiTz/oTUtJJvlAzI6+kC5JL0Zb9XT0YHxylomENW4dRL+W91RwS6lq3v0FBK1LmS/pi1uPORnQQEluqTDjXP5PuNpIrKgeibsihAtEDlkWyX8Kx80dLr1NlK52406ELX04upPd2QLGAU1GzbYi54Zw2vUrOXzbmVV6kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=iRwRbjBf; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iRwRbjBf"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D500314BF;
	Thu, 13 Aug 2026 03:14:36 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9AB203F632;
	Thu, 13 Aug 2026 03:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786616080; bh=U15xNbiafg66CEIzVRlypK8u3rfXnTp1g65n4DJvfbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iRwRbjBfKkbTekiHhgSHDee8iScOP7hLExYevoXGPxybcmXHsShvqyZ+n4Q1QtEz5
	 mUeoHoDZtuh/SyWCFDteMoc3Ll5a7OYCVoiYaZ7ECQgr+vO8kxFpeynNlNrZ359z0k
	 f+qqeNwpXN/5jj5Cc4D49oJoWzpEMRZd6kE/a10M=
Date: Thu, 13 Aug 2026 11:14:28 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Roland Dreier <rolanddreier@rivian.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] firmware: arm_scmi: Protect xfer->async_done with
 xfer->lock
Message-ID: <an2ZBM0LGFT139j3@pluto>
References: <20260812224311.904964-1-rolanddreier@rivian.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812224311.904964-1-rolanddreier@rivian.com>

On Wed, Aug 12, 2026 at 10:43:05PM +0000, Roland Dreier wrote:
> Asynchronous SCMI commands are completed by a delayed response. The RX
Hi,

> path signals the response with complete(xfer->async_done). Unlike

[snip]
 
> 
> -- 
> *CONFIDENTIALITY NOTE:* This electronic message (including any attachments) 
> may contain information that is privileged, confidential, and proprietary. 
> If you are not the intended recipient, you are hereby notified that any 
> disclosure, copying, distribution, or use of the information contained 
> herein (including any reliance thereon) is strictly prohibited. If you 
> received this electronic message in error, please immediately reply to the 
> sender that you have received this communication and destroy the material 
> in its entirety, whether in electronic or hard copy format. Although Rivian 
> has taken reasonable precautions to ensure no viruses are present in this 
> email, Rivian accepts no responsibility for any loss or damage arising from 
> the use of this email or attachments.

...not so much to review with this footer...please drop it an repost

Thanks,
Cristian

