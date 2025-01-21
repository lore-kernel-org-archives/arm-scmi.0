Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDA471F3D4C;
	Tue, 21 Jan 2025 15:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737473479; cv=none; b=Q3qy9TZjd2UW3/T11A7EHQAwigIHYG+VyBKN0aFR56kWyrZPsvpQhxIjM+M/QHmGxjJsj6zta4lEVPQvdbLyCy+52AvB9eeQhqTeo2XcwS907sD/CCSaApILHph/s5AesbROOcI0MhSQqclWnbftFuZoPSA1Yg8QHfvCTubHB2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737473479; c=relaxed/simple;
	bh=1dlyC9kjuTeOH4lVRAlUM464h4+mQ6u8qGx+AU4O25g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JywUq22BRjnkcSkW8EgrHxzAQtN+NQfofQgziv3ff+fLLXI7GrPyneQZdcEksVnVMxN7QBCdaP3haJfZLDaa94JaC6/gBls++tyF4dauC2VKVQvjCWTVYnRMAbGT4H1c9eFk+R+MNjfjRXktTdtpQNNg7F3RE3KYs6AGpF8p9AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A9A71063;
	Tue, 21 Jan 2025 07:31:45 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8743E3F66E;
	Tue, 21 Jan 2025 07:31:15 -0800 (PST)
Date: Tue, 21 Jan 2025 15:31:04 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 0/5] firmware: scmi/imx: Add i.MX95 LMM/CPU Protocol
Message-ID: <Z4-9rSwR3L9t7bHp@pluto>
References: <20250121-imx-lmm-cpu-v1-0-0eab7e073e4e@nxp.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121-imx-lmm-cpu-v1-0-0eab7e073e4e@nxp.com>

On Tue, Jan 21, 2025 at 11:08:10PM +0800, Peng Fan (OSS) wrote:
> i.MX95 System Manager(SM) implements Logical Machine Management(LMM) and
> CPU protocol to manage Logical Machine(LM) and CPUs(eg, M7).
> 
> To manage M7 in a separate LM or in same LM as Linux itself. LMM APIs
> and CPU APIs are needed.
> 

Hi Peng,

I see that you are really starting to like vendor extensions
capabilities :P ... jokes apart I'll have a deeper look at this in the
next days (togetehr with your other pending patches...), BUT in the
meantime a quick one...where are the bindings for these additional
vendor protocols...seems like a patch is missing to add those in

 Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml

...even if bare simple protocol numbers (like existing protocol@81)
currently these are needed for the protocol to be initialized by the
core.

Thanks,
Cristian

