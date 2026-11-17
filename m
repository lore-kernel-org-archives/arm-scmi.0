Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924597;
	b=ft44Xj8Mt9fThLPGbfEWbBndBs5+yViOJabxUKGK9505+37l/UR2jva6BwrWumfPpmCH
	 9tZP3a/0rG9P1lkvuMRrSrRDZ83Yoa/TUIS5jx0F5XqwV0XWRSSV9m21ReFBq4GlI/r1h
	 p22RmaxKqsYmETmcKf1T6iZP9VAFKwfMy8RMs8UbzjIoaA6gcyD6+eGeq8xSY00ssw02v
	 kwH5U6vxuEOuSkQ646sOrCyYPOJVkqTHCyqgQXLPHBO28BMbH4yv7cPAATCZkk4DGIojq
	 rLRjWKonrmVvkXKp0l80HFf0a3Fog1rWAAk/NUdEiTExKiS87MIyf+pTH/VfyDcDBbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924597;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Svf8mXjdvaTbcsFxZ1sCO/PZR8yJDMX2INAsvYj8fC4=;
	b=xTTz+fReq9BzzHc9+QxxIIFbRoXK/GfY7ZSrVsINDMmz5XTyjizWqdNpms/j0tTQljcs
	 eOAt4k6i17reg7Y8Ro/7DFDXiW1veVVZfRA4HXBsE09MGDHjIuYt+/zSYW6zofKJ0Uzal
	 HV9SFvBcOmnpKnA/vJo7HaF1a444fWJilGc2K58MCANycdwWPzAEV/9Z9DjkfFzS0p5ic
	 DaJtlcL6oruQyOXj7EMmX4QGKkskLtLwbLAZMZOQu4XvX2a58m7JL7NXunzjj0vEwCPm4
	 1Hnh8D2VZmMJPnII5E0kJJr5yTc/JM4yU5uUm2V48YuDhqHFiSK0ikQmu12yxHLl/hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZkuDPoOL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC557606A32C;
	Tue, 17 Nov 2026 14:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZkuDPoOL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D1F31F000C4;
	Tue, 17 Nov 2026 14:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794924597;
	bh=Svf8mXjdvaTbcsFxZ1sCO/PZR8yJDMX2INAsvYj8fC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZkuDPoOLcq8p2QbdnBRvjir78h5VvT4GP3WXld91sQp9jbw2cmyDBxzgwkAyJ1JUN
	 l+at6JHsDk8JlzRaFBcViAyZKE94a//WshI35+7tB+d2+mfHp23o/S8NtQMY6dAvRl
	 YpoKlWJd545KA7bbcWFG6BEpwxos+tPieOlmJKlh3EPaGLtBM9DumDithn4mdmkh6Y
	 nMsRHupOWMDkrUQ9tHXG9G9aka7Ew1JdpB8dfx1Xijgb9GwWEj5NVdi9H5wFRtNAic
	 r7hNaCd5gcRDRuq8tONh1EbvDE2LsQ/v0RGTdOaTJDCXtJAEEMJ6em2lO5tUkYK1lE
	 zFiDyUtdUo8WQ==
Date: Tue, 17 Nov 2026 14:09:54 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, philip.radford@arm.com,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 2/2] firmware: arm_scmi: Fix SCMI Power Control driver
 removal
Message-ID: <20261117-flat-nonchalant-dragon-a2dcb8@sudeepholla>
References: <20261116084211.3066460-1-cristian.marussi@arm.com>
 <20261116084211.3066460-3-cristian.marussi@arm.com>
 <20261116-merry-hypersonic-skink-91109c@sudeepholla>
 <avw8CvBXXWNx4YGX@pluto>
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
In-Reply-To: <avw8CvBXXWNx4YGX@pluto>

On Tue, Nov 17, 2026 at 11:35:38AM +0000, Cristian Marussi wrote:
> On Mon, Nov 16, 2026 at 06:14:50PM +0000, Sudeep Holla wrote:
> > On Mon, Nov 16, 2026 at 08:42:11AM +0000, Cristian Marussi wrote:

[...]

> > 
> > Just wondering if it is better to stop receiving notifications from firmware
> > first and then cancel any pending work ? Basically reverse order of probe
> > for remove.
> > 
> 
> I think the order is irrelevant given the dead_srcu gating, BUT indeed I
> kept this order so as to keep the undo in reverse order: in fact the
> probe at first issues some INIT_WORK, but the real schedule_work happens
> only later after a notif is received, so the order is:
> 
>  - init_srcu
>  - static WORK init
>  - register SCMI notif callback
>  - RX notify msg
>  - register reboot notifier
>  - schedule delayed work
> 
> Also, even if the notifiers are inhibited by dead_srcu, I felt better to
> cancel that work as soon as possible.
> 
> Thoughts ?
> 

All valid points, with that I am OK to leave it as is. I was mainly thinking
of avoiding any further notifications when the device is being removed. So
doing that as early as possible would avoid handling of any late notifications
from the SCMI firmware.

-- 
Regards,
Sudeep
