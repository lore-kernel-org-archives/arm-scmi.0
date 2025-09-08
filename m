Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 409A62E228C;
	Mon,  8 Sep 2025 11:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757329638; cv=none; b=sXsYj4DL+cglzRMe7Bbu977A9x9NKiCQZOrwPi/w0Xb+EVVQEBgPGNupvHrnAD7UCFFrGK86xKNdSe8z8p0aSSz33TV1k5ZJVInm1X24VTqMOr1+zE7o+g1fTu+0CXPwp5lntZIM4URlZGmtYx1wHpezXw2xm/d3qkU5Yb7ZMkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757329638; c=relaxed/simple;
	bh=J8ERhNsOUYngC6+/ZA18LHJQQ7hPHqkgdBXSgA3kNTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ub3J6uQTGbALAfBx2IZvzE4FIwk87R3pD53qPX/FYZ7Vix66soLAFoCi9OxviNbn1E01Kk42o0mhu5N4iToYSyOVZnjmZoZMZGlnjaMErV7P44OIv6B5s7/KQWc5zMJpHwm3FLCBu4a0clNpIZC+b+16pbVTu1/fopyThaij+PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A10D1692;
	Mon,  8 Sep 2025 04:07:08 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D8AEA3F63F;
	Mon,  8 Sep 2025 04:07:14 -0700 (PDT)
Date: Mon, 8 Sep 2025 12:07:12 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, <arm-scmi@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 6/6] firmware: imx: sm-misc: Dump syslog info
Message-ID: <20250908-devious-hairy-reindeer-ae1d05@sudeepholla>
References: <20250904-sm-misc-api-v1-v4-0-0bf10eaabdf1@nxp.com>
 <20250904-sm-misc-api-v1-v4-6-0bf10eaabdf1@nxp.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904-sm-misc-api-v1-v4-6-0bf10eaabdf1@nxp.com>

On Thu, Sep 04, 2025 at 06:40:47PM +0800, Peng Fan wrote:
> Add sysfs interface to read System Manager syslog info
> 

Need Shawn's/Sascha's Ack if you want me to take it together with 5/6.
But I would wait for 5/6 discussions to settle first.

-- 
Regards,
Sudeep
