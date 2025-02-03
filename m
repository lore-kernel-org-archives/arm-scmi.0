Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DFCC204C14
	for <arm-scmi@vger.kernel.org>; Mon,  3 Feb 2025 12:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738587143; cv=none; b=DJccKwOlDP8WUN+EzyOLwM3DWlGG463Hibecef5OSsp06EMmZXuYxLzAqLuH9LFLmtgmG4h6vR03+B2aG893Nr6p5/q08H2To5U/OTbEYUlRhpziRbEihA2nPT6325xJzmoC2G5YEs6eur7afsMIJr++A+i/lvvAKts8mQai0to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738587143; c=relaxed/simple;
	bh=VBfA+kK2UcbSJ4i4bQmb8JcNzEQ9Fw23ZYvbms0i+ys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jdOfyz1vamZqrofkT+gFkRkcG3rS79MqfBjg3VvZ1CvTChKMUWMiojOtf3yaUSHYwiJm68jc5dwPxsny23rDE/oWltmrlak5ktYpokZ0Am2BVfv2Oge9oxsrru+oZRtxiujfWNfSrUwnKJnUB/w2HjC+BHtb2mjBDH7b4zFh6VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6751511FB;
	Mon,  3 Feb 2025 04:52:43 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D8023F58B;
	Mon,  3 Feb 2025 04:52:18 -0800 (PST)
Date: Mon, 3 Feb 2025 12:52:10 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	Girish Pathak <Girish.Pathak@arm.com>, cristian.marussi@arm.com
Subject: Re: smci: how do reboots work in scmi?
Message-ID: <Z6C7-vLTOa4k7vMf@pluto>
References: <a72847fb-afa7-412d-baaf-52da8b0e6fcc@stanley.mountain>
 <GV2PR08MB795555EB6766B147C5420371EBEA2@GV2PR08MB7955.eurprd08.prod.outlook.com>
 <5b4e131e-8060-401a-b272-9e05c694d58c@stanley.mountain>
 <CAKfTPtAJe5E2RdLvhEzE0vcKhy_0uQ_8x4STfcT_teLam6PuBw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKfTPtAJe5E2RdLvhEzE0vcKhy_0uQ_8x4STfcT_teLam6PuBw@mail.gmail.com>

On Mon, Feb 03, 2025 at 08:05:30AM +0100, Vincent Guittot wrote:
> On Mon, 3 Feb 2025 at 07:25, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > On Sun, Feb 02, 2025 at 10:12:17PM +0000, Khaled Ali Ahmed wrote:
> > > Hello Dan,
> > > the following message still has not been implemented yet:
> > > - PINCTRL_REQUEST.
> > > - PINCTRL_RELEASE.
> > > - PINCTRL_SET_PERMISSIONS.
> > > - NEGOTIATE_PROTOCOL_VERSION.
> > >
> > > thank you so much for your attention and participation.
> > >
> >
> > Ah right, I was thinking of PINCTRL_SETTINGS_CONFIGURE.
> >
> > When the system reboots, it would be nice to have a hook in SCP to just
> > reset everything.
> 
> Maybe BASE_RESET_AGENT_CONFIGURATION :
> " This command is used to reset platform resource settings that were
> previously configured by an agent.
> Platform resource settings refer to power domain, performance domain,
> clock, sensors and other
> settings associated with a device that the agent has access to. This
> command can also be used to reset
> agent-specific permission configurations to access devices and protocols."

You mean Linux OSPM Agent invoking this commands for itself upon reboot ?
(and the platform acting accordignly..)

First I think we should clarify here what we mean with "system reboot".

- a single Agent rebooting by its own decision
    BASE_RESET_AGENT_CONFIGURATION(self) could be an option

- some Trusted agent causing other agents to shutdown/reboot
    in this case maybe there could be some interactions via SystemPower
    protocol, with the server asking upfront for a graceful shutdown
    which would trigger similarly a BASE_RESET_AGENT_CONFIGURATION(self).
    This would give the server a notion of an "agent resetting" which is
    something that currently is not present in SCMI because the server
    cannot know really if an agent is alive (and I am NOT saying that
    this would be a bad thing.. :P)

    ...BUT, on the other side, if a not-so-graceful shutdown is required
    the victim-agent wont have a chance for a clean reboot/shutdown so
    somehow the TrustedAgent could have to issue a BASE_RESET_AGENT_CONFIGURATION
    on behalf of that agent, OR maybe the server could just cleanup the
    config on its own for the disappearing agent...

- the whole system at the platform level, including the server itself:
  does it matter in this case to reset the agent configs ?
  ...IOW is there a scenario in which an SCMI server could reset, needing
  all its agents' states to be reset too, WHILE the platform that is running
  on somehow survives and retains some state ?

I think we never discussed these scenarios, especially in a virtualized
environement...

Thanks,
Cristian
