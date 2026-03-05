Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C634136B07F
	for <arm-scmi@vger.kernel.org>; Thu,  5 Mar 2026 10:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772707722; cv=none; b=MSGd5Z8xct7kUohcNOUmZyfx+ntow1s0qHM3Ql/uXX99APxRqNEMaJVcRKQ31pzkT8rlsbjnlplNnOgBSOeYht7zWXfwGt+DVzGgTPtGWCIw3W4nhvYljbqy/1HcgTDU8+Lk/jBLWh9MOKSIbPJTdF2fWJESzJOgLOHnldu3Ow8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772707722; c=relaxed/simple;
	bh=FgjIUp7K7TwMgun3wRj1gl+S1an/wKR+ibx8DQAeqJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ECH+kaWqo1j7QxsMnFXDky72q9+yJS472kuQkCTfujitCc761mQZ0SXdGTioxtgroJSR9jU2DYjHi+eJhE74sZaZ08cA65D5V9ESounGUHYwIFrf/vnc+WtAvmsWP7WddMMvFPAn6O6XxQ1Q86ayuip8I/s7XWEg/Sas8B2Alc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1vy6Fs-0000TS-L0; Thu, 05 Mar 2026 11:48:32 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac] helo=dude04)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1vy6Fq-003rwV-20;
	Thu, 05 Mar 2026 11:48:31 +0100
Received: from ore by dude04 with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1vy6Fr-00000001aVY-3j3z;
	Thu, 05 Mar 2026 11:48:31 +0100
Date: Thu, 5 Mar 2026 11:48:31 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/2] firmware: imx: sm-misc: Print boot/shutdown reasons
Message-ID: <aalff2CtcIeln0NG@pengutronix.de>
References: <20260305-scmi-imx-reset-v1-0-18de78978ba9@nxp.com>
 <20260305-scmi-imx-reset-v1-2-18de78978ba9@nxp.com>
 <24409695.EfDdHjke4D@steina-w>
 <aalZV981HAneFWiC@shlinux89>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aalZV981HAneFWiC@shlinux89>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: arm-scmi@vger.kernel.org

Hi all,

On Thu, Mar 05, 2026 at 06:22:15PM +0800, Peng Fan wrote:
> Hi Alexander,
>
> Thanks for giving a look.
>
> On Thu, Mar 05, 2026 at 08:44:26AM +0100, Alexander Stein wrote:
> >Hi,
> >
> >Am Donnerstag, 5. M=C3=A4rz 2026, 02:56:45 CET schrieb Peng Fan (OSS):
> >> From: Peng Fan <peng.fan@nxp.com>
> >>
> >> Add reset reason string table for i.MX95 and introduce a helper
> >> (scmi_imx_misc_get_reason) to query and print both system and LM
> >> (Logical Machine) reset reasons via the SCMI MISC protocol.
> >>
> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >> ---
> [...]
> >> +		if (boot.valid)
> >> +			dev_info(&sdev->dev, "%s Boot reason: %s, origin: %d, errid: %d\n",
> >> +				 system ? "SYS" : "LM", rst[boot.reason],
> >> +				 boot.orig_valid ? boot.origin : -1,
> >> +				 boot.err_valid ? boot.errid : -1);
> >> +		if (shutdown.valid)
> >> +			dev_info(&sdev->dev, "%s shutdown reason: %s, origin: %d, errid: %=
d\n",
> >> +				 system ? "SYS" : "LM", rst[shutdown.reason],
> >> +				 shutdown.orig_valid ? shutdown.origin : -1,
> >> +				 shutdown.err_valid ? shutdown.errid : -1);
> >
> >Is there a way to query this from userspace programs instead of printing=
 into kernel log?
>
> I not add sysfs or debugfs to get the information in this patchset, since=
 our
> customer only want the information could be shown in kernel boot log.
>
> But I could add also sysfs interface to allow userspace get the informati=
on if
> you need this feature.

I started to working on corresponding framework:
https://lore.kernel.org/all/20250618120255.3141862-1-o.rempel@pengutronix.d=
e/

but it is stalled due to devicetree decisions. I wont to respin the
discussion tomorrow

Best Regards,
Oleksij
