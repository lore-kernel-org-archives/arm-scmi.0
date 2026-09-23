Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C515304DD;
	Wed, 23 Sep 2026 14:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790173532; cv=none; b=P/vD3cjEjvN5l7r5D/RdxG0BaVE8XPWeY6kSkarx0Fr8iber+NatkTNV+qXWfb/TzRAOK0aqLo/T0fRCt8hYgI97+12I6cfDk2UOEWSUm8u0qzKh2PubArl9l8gtfR9JTjAh8QLcqitTBtpdMX5RvOeFvzfuhFwZ3+YWDh15Cpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790173532; c=relaxed/simple;
	bh=/WNOjdQID9kTMoLh/d9iUfAVyC0VUflgmgHiLGHVyuk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FJ5SXK7bggzNt3x67ouDAY4gYQfqtbZIddjl8igOB9O8IziKxnf6970IlKEfk3nxwqwXFZZS5XsYhhrXg6WctNGOhclGgEakXX+wy8WYjG4Ely+j2dEBMiBZTw0RXgdLbwl7W+cOaiXAgJM8LTVemY/rua5LkJJ2nQQouSsKR1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dAhw3uKN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dAhw3uKN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEE9B1F00893;
	Wed, 23 Sep 2026 14:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790173531;
	bh=5VAvvdSrfVlwZUnwPbQ2SBZe8CezYqvP4YPopdOx8gA=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=dAhw3uKNokZzF7PVP6DNUNhPRP5TgMtmjXCfzaRzvIzZ/EDlA/W7aYqvR3pVbx51M
	 NFWU/fzMQA+/kDLKggSDlYpg/eGdjYT8bSwMitZbxPrEJzFARFUJs5d5lRIMhJf2RS
	 dkLcb6CjZeK2zfPt+LauRcs5GoQc+2pw8j/DI3ioC+YQ1/CkoDJh+ibFLQ2SqB2fic
	 h+GsO2K1S6gD/DdLcFxC+ckgYGh/EQTN9j17KpGVvoaY5trEg22bHIoOe+J6PyZe7H
	 A7VFWTB2a4uJBjxHQOHfzVvk02jgddwRsupnBSWsYPGhVeTiTRbpZehRXy08hkmmQ1
	 IoipRCEq09Y8Q==
Date: Wed, 23 Sep 2026 15:25:26 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
Message-ID: <20260923-groovy-airborne-rook-e1efc6@sudeepholla>
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <arFKVhlgJge5EZyj@monoceros>
 <20260923-sceptical-mauve-firefly-f5456d@sudeepholla>
 <6b5a8300-ebf9-4717-bd39-952e89fc5e78@oss.qualcomm.com>
 <20260923-snake-of-magic-satiation-c3b857@sudeepholla>
 <a5e56180-b96f-4fac-980e-e837e84cd5a5@oss.qualcomm.com>
 <20260923-calculating-positive-inchworm-28d3cc@sudeepholla>
 <arPMAXs4jjUeu1DE@monoceros>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <arPMAXs4jjUeu1DE@monoceros>

On Wed, Sep 23, 2026 at 02:55:26PM +0200, Uwe Kleine-König wrote:
> On Wed, Sep 23, 2026 at 01:01:44PM +0100, Sudeep Holla wrote:
> > If Uwe is fine, yes I can take v7 as is.
> 
> Fine for me.
> 
> Acked-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> 

Thanks Uwe!

> The nice thing is that the device_id structs are not API, so this can
> also be addressed later if someone comes up with a clever idea how to
> implement it.
> 

Agreed.

Hans,

There were other changes in bus.c that conflicted with this. I have
resolved the conflicts and pushed to my for-next/scmi/updates[1]

If anything is wrong or if you prefer, you can post a rebased version
that I can pick up.

-- 
Regards,
Sudeep

[1] https://git.kernel.org/sudeep.holla/h/for-next/scmi/updates
