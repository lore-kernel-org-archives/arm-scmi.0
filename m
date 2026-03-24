Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A063351C11;
	Tue, 24 Mar 2026 07:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774338567; cv=none; b=SSG3TTW8EkxCoW3rzLxarnTJmBhLh61ktBvPiHN3RUyFoNfNExZZgrMmt/jPlNmuzEWu5LAaPEL+sw9nK17GwB5SJ5/kPLWWaftFOSGnR+e3Yljz/1R34qFLsYSvohnrqQuwMLXA9e2aOwDlCffHZiHTkss//jYFgbwqJo7yaak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774338567; c=relaxed/simple;
	bh=WjVMjQuHxIzGaW30gU6dOjv/9JEiFarwE8HCOIl6ENI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZPSf7kxZ7+mF1MeOPl157ShE2nFvg/6cmtsYhs+konLx7hT7joL9Ey1zBMVy4ZVty7twLT44ECyKYjW/w4t7KlbdfX9dk3w7dhYWwqEjTZEPCO9Ili80QKoPgBpNTpLrTZJgDe3puylxjeWjwrPw6fIVflK15kL1h1WWaI0eGJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g4BDSsGg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g4BDSsGg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2BB2C19424;
	Tue, 24 Mar 2026 07:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774338566;
	bh=WjVMjQuHxIzGaW30gU6dOjv/9JEiFarwE8HCOIl6ENI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g4BDSsGgwt/m35S1WVgZF+4KdcrHCPVhK0YaLM6ZYaayy7Jm5f3eHzoeaoGuZQBqW
	 gS1orJx6dE2iChoGomcXXQer96JAwd4fOIyt/bbf4QCCYTWnRyFqdZKHFN0kUoiJjc
	 EmnqVazUjUB6wmif407Kp3DfTh6x1EzueVl8RZxRyk44TtM7wu+Bsey/tebMzon5Df
	 HfI37IA7Bv9bdf6ZjxcneCzVi+OttstfaAGBqykhF6RAjASaq/5fYNjYdkihoagYSV
	 aJj5BFlJBy4MxzLjtuNGiqthAI2TfcCrPDxH+Btzn2fG4m6GVeKQqjVg5Kjw4VY6mm
	 jcJLBudOzF0SA==
Date: Tue, 24 Mar 2026 07:49:22 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: clock: Relax check in
 scmi_clock_protocol_init
Message-ID: <20260324-lean-bobcat-of-reputation-6628b5@sudeepholla>
References: <20260324-scmi-clock-fix-v1-v1-1-65c21935824b@nxp.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324-scmi-clock-fix-v1-v1-1-65c21935824b@nxp.com>

On Tue, Mar 24, 2026 at 02:24:14PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> On i.MX95, the SCMI Clock protocol defines several reserved clock IDs that
> are not backed by real clock devices
> (see arch/arm64/boot/dts/freescale/imx95-clock.h).
> 
> For these reserved IDs, the SCMI firmware correctly returns NOT_FOUND in
> response to the CLOCK_ATTRIBUTES command. According to the SCMI Clock
> specification, NOT_FOUND is expected when a clock_id does not correspond to
> a valid clock device.
> 
> The recent hardening added in scmi_clock_protocol_init() treats any error
> return as fatal, causing SCMI clock probe to fail and preventing i.MX9
> platforms from booting.
> 
> Relax the check so that -ENOENT is treated as a non-fatal condition.
> 

I understand the use-case and the fix here, but still wonder if this
should be treated as quirk or handle it in the core. I am inclined to
latter as reserved SCMI clock/resource ID seems to be trend in its usage
and hard to classify as quirks.

Cristain, agree or have a different view ?


-- 
Regards,
Sudeep
