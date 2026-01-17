Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9158F1F0991;
	Sat, 17 Jan 2026 02:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768617253; cv=none; b=FTdUryc08liwcZaPnbZhaxBymoqHQk2jNxIa0XZ5c7Jyf+PkQDZoQiNqFl+SyulfK0WMgGWBcPE8usPHPGyo6GXuFFXlBQnnjuBnuAdIZNJoTWvPgBWV+dyS7lV+UTBCWjhkeDg7OhRA3VSS0ShngBF3iv0tpbb796jHTsbGgVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768617253; c=relaxed/simple;
	bh=ZHT4FwSvrHdlntgWg5o2UVfQ6X6/Gh/zS5tYKlScw1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jBvjEwKBGXBl1lmWB/f+Qo7Q6jk/qSDh5bh+5GH0Tbp5dMoJMwwnOEWnHpYzFD6s9wZWqTEdK7T0dMbSzsyXg5o45s7ziKBLjk9KnLb67/WpS/0DLHzn3kj+F2ZnU8HD8q+vDfjcqdaJS26xKeJqhm/wKZMEb0R3A+5OnRUKLiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tC7y9fZ5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tC7y9fZ5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53A8C116C6;
	Sat, 17 Jan 2026 02:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768617253;
	bh=ZHT4FwSvrHdlntgWg5o2UVfQ6X6/Gh/zS5tYKlScw1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tC7y9fZ5aRK2X9vNDw+oI3NCnw4kxydoc5EG2VkM88gAy00E8qAjKNe/zlGryz880
	 syEhxs3UPHJF3n7gN4Bc5KOmzerb4LphNpime1WjRZLl/8nqHFXfkz06nYfVBB6246
	 RI5ZOaWXIDbpXiI4kq8xWJHLVmWSexG5OFDLhV+IFOBe5DGLsP+JzlvSvjlz1XL6ow
	 5jInDfwoi1PNURRVEmqPBpviqK4cIXf9KYytV//DQmk5ljMDYSCBgPjs/LILaKxSQW
	 QwN8jSwb213CQK2z8HeAejcS0u9aDm75JCXuAXvQiM+YpCWzpHMTcM9jBLOXFvrTBD
	 j9HbnE5WNbe7A==
Date: Sat, 17 Jan 2026 10:34:06 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] firmware: arm_scmi/imx: Support dump syslog
Message-ID: <aWr1Hgw26ZKW3k2S@dragon>
References: <20251029-sm-syslog-v3-v3-0-64e14a6e3f87@nxp.com>
 <aUCy5+vAPzDGeux3@shlinux89>
 <aVuzVNmG2l-igiEB@nxa18884-linux.ap.freescale.net>
 <aV0uVXXbxKQ5qzLD@bogus>
 <aV24N72FoGeGwgqm@shlinux89>
 <aWTiC78PXRoadeJy@bogus>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWTiC78PXRoadeJy@bogus>

On Mon, Jan 12, 2026 at 11:59:07AM +0000, Sudeep Holla wrote:
> On Wed, Jan 07, 2026 at 09:34:47AM +0800, Peng Fan wrote:
> > On Tue, Jan 06, 2026 at 03:46:29PM +0000, Sudeep Holla wrote:
> > >On Mon, Jan 05, 2026 at 08:49:24PM +0800, Peng Fan wrote:
> > >> Hi Sudeep,
> > >> 
> > >> Hope you're doing well. Apologies for following up again, but this v3 patchset
> > >> has been pending for quite some time. I wanted to check if everything looks
> > >> good on your end.
> > >> 
> > >
> > >Yes overall it looks good to me.
> > 
> > Thanks a lot.
> > 
> > >
> > ...
> > >> Alternatively, I can ask Shawn to pick patch 2 if you only intend to take patch 1.
> > >
> > >I think that would break build or need to wait for another cycle.
> > >I can ack if it can be routed via i.MX tree or need ACK to pick it up myself.
> > 
> > Shawn,
> > 
> > Do you plan to pick the two patches with Sudeep's Ack in patch 1? Or
> > you prefer to route the patches via SCMI tree with your Ack?
> 
> I noticed this morning we are already at -rc5, which is later than my usual PR
> timing (I generally aim to send to the SoC team between -rc4 and -rc5). I have
> already sent the SCMI PR.
> 
> For these changes, would it be acceptable to route them via the i.MX tree if
> they are still intended for v7.0/v6.20? If not, I am happy to defer and pick
> them up for the merge window after next.

I picked them up for v7.0/v6.20, thanks!

Shawn
