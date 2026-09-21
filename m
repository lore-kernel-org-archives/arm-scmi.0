Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8753F1A683D;
	Mon, 21 Sep 2026 08:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789979334; cv=none; b=UW6WXgqX0yB/B/jSLJQ1a+7m/tptqXcbdsseRMxrb3dI4bwsKeW+/vNPmT0eDdnY+luE8rLC5YlEvBs/Xf0vEHbhX9YYwZVInvTsNwQqv6uiKD09vbAuRzB5Dw65gW2VupzUzXTHwDnNeJ3oUVfGUZaVi362SURo/0L1bLGK/wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789979334; c=relaxed/simple;
	bh=dYYtzn0w3XQdZ4MHR5M9HDRmG23OEzjiFt00L9yw2FQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j1aYeWmSq1BfRTjiwHCr3Molu1PLehppM0C8VmLgr1cfmezanpcjB6919qox+fIIpXc9YcFg+cW1OAR4FGg8dG/xjF3o/VuXfeuXeidkT4iHLr/a4o7Esz2+xSCgYLMHa//8ajnZz+Tc4Q5chKg6h2t/nGQbOQFMFjJN+cpTZHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dIS3AeOy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dIS3AeOy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 101EE1F000FF;
	Mon, 21 Sep 2026 08:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789979333;
	bh=biIIPAL+udhZqFXOwfaaMfkq0a6RVhD5vW+C4HMFAiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dIS3AeOyFkaJxlhFNs+dL5RL/IpOu6aZCdV/ELU0ngWedExwC72kqNR6GjJDGQi1Y
	 vzm/oO4cDvW37S8Agtxf33GzaLU5eGIQVURLMNjOn7BtWii8WUGWcMOQ+X/QKz/n84
	 RWX00CMbYneHmZkSBQkzIdC8NXtr/YgDa+mZiz4X4wIeRPNzofmqSmjQtWgXQzlnEK
	 nqJdQdp6VA3YSf5qW/CNB4UgRLyN0Z5yxZ5esT7ZrY0v+zRxEbNitxEkUnlVEb9gQn
	 LgB2Wj2uKAiqxn7K0w9EbLs3AQpyql1pKjX1tIKVxXIVaxh6fsqfaoT3zorQLqxISJ
	 VHMa0ivbHQCAw==
Date: Mon, 21 Sep 2026 09:28:48 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
Message-ID: <20260921-jumping-affable-agama-023caf@sudeepholla>
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <20260918-impetuous-daring-barnacle-1ea4d0@sudeepholla>
 <dca62a09-2af7-463e-9ba0-1be935a95502@oss.qualcomm.com>
 <aq2g9otvja7xQqJ_@monoceros>
 <20260920-hippo-of-immense-assurance-50a5fd@sudeepholla>
 <aq-xJE196Skvk2pX@monoceros>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aq-xJE196Skvk2pX@monoceros>

On Sun, Sep 20, 2026 at 12:18:47PM +0200, Uwe Kleine-König wrote:
> On Sun, Sep 20, 2026 at 08:36:10AM +0100, Sudeep Holla wrote:

[...]

> > 
> > I am confused. I am asking to align with what's done in
> > Commit ad428f5811bd ("mod_devicetable.h: Split into per subsystem headers")
> > and you are disagreeing with that ?
> > 
> > I am not comfortable taking this patch unless there are other similar
> > examples that are agreed upon to break the pattern followed in the above
> > mentioned commit.
> > 
> > Uwe, please suggest.
> 
> I didn't start removing stuff from mod_devicetable.h yet, as changes
> there are expensive (regarding build dependencies). So the plan is to
> stop drivers consuming mod_devicetable.h and then drop it. (Not sure
> this is sensible as new users come in faster than I can fight them, but
> I didn't give up yet.)
> 
> So while adding new device_id structures to mod_devicetable.h is
> consistent with the existing practise, it still makes the situation
> worse, as every consumer of mod_devicetable.h then also depends on the
> new header for the new structure. That's why I think it's a good idea to
> deviate here, even if you're the first one doing so, to not worsen the
> already bad situation.
> 

It would be good if you provide your reviewed-by for mod_devicetable.h
and associated parts specifically here.

Also there is another patch under discussion [1], it would be good to have
similar suggestion there as well, so that there is less divergence in the
newly added code from now on.

> If it helps you, I can propose a patch changing modpost to not use that
> catch-(nearly)-all header and use the needed linux/device-id/*.h
> instead. I put this on my list for tomorrow.
> 

That's helpful too, but for the things that are being planned to be in
v7.4, they may not see that unless you push that as a fix.

-- 
Regards,
Sudeep


[1] https://lore.kernel.org/all/20260921053807.354802-2-aneesh.kumar@kernel.org
