Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D145F26ED59;
	Wed, 25 Feb 2026 20:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772050761; cv=none; b=Mgu6RQtm4dm3M5uzzGU1wyzVaYEuRaKYGfoXAtGDWrbM3+pXTP0a8GnXIiSzSK/Iblu1gjJAdPKWoq4ZkA7BlGOxK5I2vCdXxd+hQOGQpwWcYXpkhAzlG13alS/LcimbzmVCSgI+hGj1RhyA/614EypGfus8cb+++3hljO8490U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772050761; c=relaxed/simple;
	bh=W90JRmoDGrZOdAaHGikzmcE0U/V2WegDUmKmesiZMpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fg4nsfMA2Q1O5OZb9TZcmzre00TGbCrqvVDgMOmsLVPwudfShxRcB+hc0CF8pm8cKooHAFZ4+ZKB74GSLvXDHvQ0A86iyGtA7xdXzW68IQAxL/Urlt9YN3KgPn4HBNumhvKz+I35Ii6cIvTy2WSVZjeVoXDEl2yMGVdLi9KmCOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EDEA1650;
	Wed, 25 Feb 2026 12:19:13 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98C293F99C;
	Wed, 25 Feb 2026 12:19:17 -0800 (PST)
Date: Wed, 25 Feb 2026 20:19:03 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Gui-Dong Han <hanguidong02@gmail.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	linux-kernel@vger.kernel.org, baijiaju1990@gmail.com,
	Qiu-ji Chen <chenqiuji666@gmail.com>, cristian.marussi@arm.com,
	gatien.chevallier@foss.st.com, sudeep.holla@kernel.org,
	arm-scmi@vger.kernel.org
Subject: Re: [PATCH v5] driver core: enforce device_lock for
 driver_match_device()
Message-ID: <aZ9ZN7H1thCmkPEQ@pluto>
References: <20260113162843.12712-1-hanguidong02@gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113162843.12712-1-hanguidong02@gmail.com>

On Wed, Jan 14, 2026 at 12:28:43AM +0800, Gui-Dong Han wrote:
> Currently, driver_match_device() is called from three sites. One site
> (__device_attach_driver) holds device_lock(dev), but the other two
> (bind_store and __driver_attach) do not. This inconsistency means that
> bus match() callbacks are not guaranteed to be called with the lock
> held.
> 
> Fix this by introducing driver_match_device_locked(), which guarantees
> holding the device lock using a scoped guard. Replace the unlocked calls
> in bind_store() and __driver_attach() with this new helper. Also add a
> lock assertion to driver_match_device() to enforce this guarantee.

Hi,

it has been reported by Gatien (in CC) that this break the SCMI OPTEE
transport.

Moreover I still have to verify, BUT I think this also breaks SCMI
Virtio transport since both call platform_driver_register() during their
probe, since a few years ago the SCMI transports have been reworked to be
standalone full-fledged drivers.

I'll have a look in the next days if we can cope with this.

Thanks,
Cristian

