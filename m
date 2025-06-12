Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F914153598
	for <arm-scmi@vger.kernel.org>; Thu, 12 Jun 2025 07:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749713444; cv=none; b=R90BkvykCXo1Chxjmrn+OZ4EA+t+hO1j5jCQPtafGLqW/+o7Z+CYknBAyZYLsc2c616KVSiVr9y96smu4nJkZ/JgMWkCfLvkZG5xkVDjIQW5Ny4vwwFogisCRczqPMOXGiuc1m32PnX/jP03FkUfjFBbycQ2qvb6y/YWs/m7vZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749713444; c=relaxed/simple;
	bh=nov992LCVMyZO3iwhDNtSw/xJ4PKYx0N3w/Cu6ujlr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JpKKbhOB6VNd4w8I7MXivzubxECiHhYcg25LA2YnosAXJxjIqLA8rIz8kBA/a40Qfl02zZK6xlOLtz1Y91sIF3bE9fxn5jyyVbPwpNxTUQ4wLK2nS6UsUik84MaxCcpQfRia9Cya8bjjSKDwWIWrM535vAixZuI7jy8RRcV327o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1uPcON-0001dv-QA; Thu, 12 Jun 2025 09:30:31 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uPcON-0035AV-1C;
	Thu, 12 Jun 2025 09:30:31 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uPcON-008nuf-0r;
	Thu, 12 Jun 2025 09:30:31 +0200
Date: Thu, 12 Jun 2025 09:30:31 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: scmi: Fix children encountered before parents case
Message-ID: <aEqCF-xV04VIKCfg@pengutronix.de>
References: <20250604-clk-scmi-children-parent-fix-v1-1-be206954d866@pengutronix.de>
 <20250612034723.GB7552@nxa18884-linux>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612034723.GB7552@nxa18884-linux>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: arm-scmi@vger.kernel.org

On Thu, Jun 12, 2025 at 11:47:23AM +0800, Peng Fan wrote:
> On Wed, Jun 04, 2025 at 01:00:30PM +0200, Sascha Hauer wrote:
> >When it comes to clocks with parents the SCMI clk driver assumes that
> >parents are always initialized before their children which might not
> >always be the case.
> >
> >During initialization of the parent_data array we have:
> >
> >	sclk->parent_data[i].hw = hws[sclk->info->parents[i]];
> >
> >hws[sclk->info->parents[i]] will not yet be initialized when children
> >are encountered before their possible parents. Solve this by allocating
> >all struct scmi_clk as an array first and populating all hws[] upfront.
> >
> >Fixes: 65a8a3dd3b95f ("clk: scmi: Add support for clock {set,get}_parent")
> >Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> 
> Thanks for the fix. To i.MX, the index of child clk is always after
> parent clk per current SM design. Not sure you met real issue, anyway
> this patch itself is correct.

I had issues on TI AM62L (not yet upstream).

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
