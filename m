Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B65C2EA48F
	for <arm-scmi@vger.kernel.org>; Mon,  8 Jun 2026 16:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780937527; cv=none; b=FMPsCz8574cp07exc/ETpOoz7HBhNHAVhpDmBEwCpAb/9U8b4y3JDYAj00NNgRkOwjgYltWKFwaLlmL/gC+5xbKNpcamgiVLuMvLo1lcmco5RT+6bPYoMVBbv2F7XhAA3jiOUng3RfYuB5LHraL/UlxoQDAEup4RtUV1Gb8cgtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780937527; c=relaxed/simple;
	bh=GXQqJibXtDdJXe76ihrp/1G0s+9m23d5580fR8hWzTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c7ICSqrMgiJN0vaqvyHaLspEFW2yBAVu29UpkqraIDCRSJCq0ll1/SK9Q4elKijEVGJbQfnkca2jRfusV9sagg0VQ/zeK9jILWLHYhMH9wdKAUdk7+Sl7p2O0cMxx/DyYSauAtAqFjnpNkHJNMQ1/NB1OqJzlxfhj+UDIszvM6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=HEQff/fb; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="HEQff/fb"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FCB632D0;
	Mon,  8 Jun 2026 09:52:00 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D90833FD88;
	Mon,  8 Jun 2026 09:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780937525; bh=GXQqJibXtDdJXe76ihrp/1G0s+9m23d5580fR8hWzTQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HEQff/fbCYy8LXtoslR1up/38Nh1BCk/F9foSLQ4P4AyB1WfvP7G6VPMDdUM9M2z5
	 uL5u9WtBgSvBMszAxf3fhPq8UDsRM7giLo7btZhdkbqGDZ7WhSJiu2T0R2WHo1gODm
	 68EL/oyNuDPd3os1Scpdrz/mTgzlj9EWDoZ6vo9E=
Date: Mon, 8 Jun 2026 17:51:57 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	guomin_chen@sina.com, linux-arm-kernel@lists.infradead.org,
	peng.fan@nxp.com, quic_xinqzhan@quicinc.com, sudeep.holla@arm.com
Subject: Re: [RFC PATCH 2/2] firmware: arm_scmi: Add bus support for
 autoloading
Message-ID: <aibzLcZiVwtUHAgV@pluto>
References: <Z6CNWOp8B_ghIrJt@pluto>
 <20250203100154.140877-1-cristian.marussi@arm.com>
 <20250203100154.140877-2-cristian.marussi@arm.com>
 <aibW10NMmzw3QnZ5@mai.linaro.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aibW10NMmzw3QnZ5@mai.linaro.org>

On Mon, Jun 08, 2026 at 04:51:03PM +0200, Daniel Lezcano wrote:
> On Mon, Feb 03, 2025 at 10:01:54AM +0000, Cristian Marussi wrote:
> > Emit proper MODALIAS uevents when SCMI devices are created and make sure
> > all the standard protocol devices are requested when the bus is
> > initialized.
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > ---
> 
> Hi Cristian,
> 

Hi Daniel,

nice to hear from you in the SCMI land :P

> what is the status of this patch ?

....I'd say forgotten/abandoned...I worked on that a bit when I realized
only part of the stack was autoloaded...then it did NOT received much
love and then I forgot it....buried by other prios....

Indeed I have still the local branch...but after a quick check I think
is the same as the RFC posted.

bbd14b0f7733 firmware: arm_scmi: Add bus support for autoloading
8d982393b505 firmware: arm_scmi: Generate aliases for SCMI modules
383c127faa97 (scmi_vendors_autoload_V2) firmware: arm_scmi: Add aliases to transport modules
00caa894bce2 firmware: arm_scmi: Add module aliases to i.MX vendor protocols
d900620c46bb firmware: arm_scmi: Support vendor protocol modules autoloading
4fe57bbeb6dc firmware: arm_scmi: Allow transport properties for multiple instances
ad236e5a7f01 Linux 6.13-rc1

...where scmi_vendors_autoload_V2 is merged already...

Thoughts ? Plans ?

Thanks,
Cristian
