Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E436A3570D5;
	Mon, 12 Jan 2026 11:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768219153; cv=none; b=CLDhUE3nl+wU2b4m3BXA0X1Bj46YzrBOmOneaSMoZUdveecbb9jcWNBT0spI6FCzkzCScfrhqMaABN4cBBEZ1zMSPdDVtd8MQ+l4Pa7sTZTNfELm2pSOGrU/1U+5kE6DlXLwRMU6J2HAnUiUkTRkQKHFWL5XJONWtFNYih09Gwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768219153; c=relaxed/simple;
	bh=DcrTBiW5aVoXsqZlInmT01FcLvXNy12INyxmtHbre3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ek65CYHLerp+PziPqNp9YqiCL7DdFT0N61aqMRjtKxJ6z4FlQJRs49Nd4B5fA3EaFLhTmLPFoHBeABdx/iMCCLnkYmi3p4e/dlzMHHuR38yOukBly+WDAxfiTGRP1qVbx3pGEv5QRll3GhCoH1/k+uSy+eT4gbHDbqAeqRATECA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC339497;
	Mon, 12 Jan 2026 03:59:04 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00F8B3F59E;
	Mon, 12 Jan 2026 03:59:09 -0800 (PST)
Date: Mon, 12 Jan 2026 11:59:07 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] firmware: arm_scmi/imx: Support dump syslog
Message-ID: <aWTiC78PXRoadeJy@bogus>
References: <20251029-sm-syslog-v3-v3-0-64e14a6e3f87@nxp.com>
 <aUCy5+vAPzDGeux3@shlinux89>
 <aVuzVNmG2l-igiEB@nxa18884-linux.ap.freescale.net>
 <aV0uVXXbxKQ5qzLD@bogus>
 <aV24N72FoGeGwgqm@shlinux89>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV24N72FoGeGwgqm@shlinux89>

On Wed, Jan 07, 2026 at 09:34:47AM +0800, Peng Fan wrote:
> On Tue, Jan 06, 2026 at 03:46:29PM +0000, Sudeep Holla wrote:
> >On Mon, Jan 05, 2026 at 08:49:24PM +0800, Peng Fan wrote:
> >> Hi Sudeep,
> >> 
> >> Hope you're doing well. Apologies for following up again, but this v3 patchset
> >> has been pending for quite some time. I wanted to check if everything looks
> >> good on your end.
> >> 
> >
> >Yes overall it looks good to me.
> 
> Thanks a lot.
> 
> >
> ...
> >> Alternatively, I can ask Shawn to pick patch 2 if you only intend to take patch 1.
> >
> >I think that would break build or need to wait for another cycle.
> >I can ack if it can be routed via i.MX tree or need ACK to pick it up myself.
> 
> Shawn,
> 
> Do you plan to pick the two patches with Sudeep's Ack in patch 1? Or
> you prefer to route the patches via SCMI tree with your Ack?

I noticed this morning we are already at -rc5, which is later than my usual PR
timing (I generally aim to send to the SoC team between -rc4 and -rc5). I have
already sent the SCMI PR.

For these changes, would it be acceptable to route them via the i.MX tree if
they are still intended for v7.0/v6.20? If not, I am happy to defer and pick
them up for the merge window after next.

-- 
Regards,
Sudeep
