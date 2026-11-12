Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794514666;
	b=fA9K7kVt/qnNxbukVWbjc+mTbjEsT0nMoRXXcoqIT4KEmPs+WuiI12umMOQIs5q3LLlk
	 XkT4HT05BmicQaPTSS2TKYAW2yGqAeIG8bilL6ni/2ZjfrhKAtP3gMbA3NktaeqxGrYKF
	 zmXFBKARel3z+Ee0RTj+rxZ2j8RIfxWLZr9dkuI/mQdvjBKWbJC1Ys4Ohl2tD521l06/6
	 iZ1nCDqGQxwbTvxJ4UsBrvDrai0kR6fHwhHlpGHvpB/vLbqPEPs3ERTHOxo/z/yQ4m3iz
	 wYXwRz3EmltNuyTYzmbPRsQsgTM+6TC+AdwHQx3+fKNhzECv8dLXXuFoHxfGcZ2NNbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794514666;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=vlZqzvtO/HmxUCVMk4ClrKPfCBbBD3nwIw0Aqx6q7s8=;
	b=sFFSoefCZREAgkRlkhMJaFBUoMr1vesScLpnVUIt4+WR5eDlwlm/Q+XGWJCfBs4GM6Ri
	 xgeBnlow1qAiOz5Modeby9epWvkbC3hiub+MVJ8vhyhxqyrqMal/aU+ispo8cSSuxumEn
	 vchuzWqs/3nJl94XqObFLmJzeD8S+6yW4w00S3ilqp27X6hcvJ4JH/OmtFIeAo5fRde+P
	 P4Ox0dMYSuR3vqEOv2o81PQb0F2KwCT+3YfJ+7VG+2IslipNaVLGjT/lFlxBcQNs4xjp7
	 91HCGX8mT3O1y7RQ9HJpivV10dLei3NACzo5i4uIktXspBVp92cYF17ee0U0qiHf7rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Jq7zX7UP;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89FF3606A31C;
	Thu, 12 Nov 2026 20:17:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89FF3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Jq7zX7UP
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 999E91476;
	Thu, 12 Nov 2026 12:17:41 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C24143F85F;
	Thu, 12 Nov 2026 12:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794514664; bh=DnwmvWTMD0sYcZHcAwFeqJGrssc3hWAPd1jsUWH9nHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jq7zX7UPusnlrQDCRHmcPNVl/vzqAPi+FegZnwm3Pt1YkHaYivIZr71Q5Drr84h3q
	 jz0ToTS4kG49dKWJZ/N5/ZJWJSNWuMDd578NPEuGqhVAmmghvcy+m/z7Wlgc9nlwG8
	 aMukWx6kAdWikQyxq87aS9kWk0f0h7pze288UyMw=
Date: Thu, 12 Nov 2026 20:17:35 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
	sudeep.holla@kernel.org, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
	philip.radford@arm.com, david@kernel.org,
	souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
	puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 23/35] firmware: arm_scmi: Add Telemetry generation
 counter event
Message-ID: <avYe37QP4Upvp51c@pluto>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
 <20261109091221.2532706-24-cristian.marussi@arm.com>
 <20261110144635.00005964@oss.qualcomm.com>
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
In-Reply-To: <20261110144635.00005964@oss.qualcomm.com>

On Tue, Nov 10, 2026 at 02:46:35PM -0800, Jonathan Cameron wrote:
> On Mon,  9 Nov 2026 09:12:09 +0000
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Add a per-instance generation counter to track configuration changes which
> > uses the common telemetry events framework.
> Why?  What's the usecase for this?
> Needs some more information or I'd leave it for now.
> 

SCMI Telemetry is specified and designed FW/Kernel side to allow for
multiple readers and multiple writers issuing configuration changes:
give that there is NO HW/FW/SPEC limitation in allowing such concurrency
(unlike e.g. for a serial or an RTC) the telemetry driver does NOT
enfroce any kind of exclusive access...last one wins when multiple
acctors tries to configure overlapping stuff...none of kernel problem
userspace should co-ordinate...and I suspect most of the time having
multiple apps trying to concurrently issue conflicting Telemetry request
would be a matter of wrong platform configuration/setup (similarly to
what would happen by running together all the lovely varied network
configiratio solution on a Linux box...)

As said the Kernel SHOULD NOT care, going back to the networking example
Kernel indeed does NOT active policy netlink access..you are free to shot
into your foot...

Anyway, co-ordinating access to the Telemetry resources in userspace can
be a pain, so the the generation counter is an optional mechanism to be
alerted when some of the Telemetry has been changed, so that userspace
can spot that something odd is happening (if it was unexpected) and
avoid to sample and analyze bogus data...

The generic event support upon which this is based, it is meant to
support future events like relaying notifications to userspace...but
given that notifs were NOT implemented for real, it is not present (NOR
the related ABI...)

Thanks,
Cristian
