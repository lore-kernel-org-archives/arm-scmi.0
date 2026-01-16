Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2D7D2DBF47;
	Fri, 16 Jan 2026 15:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768577598; cv=none; b=HmO8Xt5mz9+0BeKOb7LXm2PoEl1HiBzJAU+vZQ3Ds7lM8MeOEU8YgfzWDUtimuJmpXbDEMjNn0E7EkQ+BTgm9fwdkznoGIUbjKYlTuxNFdTR701uDHPjrK+ph4IB9oe7dwhomZu+Bbvwi63ehJhJeGGkOOsqZ4wfC5PdHhWWPaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768577598; c=relaxed/simple;
	bh=GiIswnVWO7eTIRFASH+jE2wuNFoYAvfgX6lWBGeYbmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVCgR3ozw/wC62BDUpPlSnOR+BWEiclOZYNndPt46WFqBKsWDutOLHxWaL3McObsFRUQGhYnPiCutyOn7E3wHgblkc4qQxYOyc0jZs8tQUqY/BJ1q8oWLj9VA+TGxVTBlrNECYOc+gaGhghvPMeEv6gP2f6UdFgjtcHqfwGeOpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72A931515;
	Fri, 16 Jan 2026 07:33:09 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B7EF3F59E;
	Fri, 16 Jan 2026 07:33:15 -0800 (PST)
Date: Fri, 16 Jan 2026 15:33:13 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Felix Gu <gu_0233@qq.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] firmware: arm_scpi: Fix a reference leak on device node
Message-ID: <aWpaOYy6M_wNiMJU@bogus>
References: <tencent_A3E20C513BBE7D268B863A5CE473FBA10B06@qq.com>
 <9d44f5c6-9197-44ec-b7fe-50c2a686a751@web.de>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9d44f5c6-9197-44ec-b7fe-50c2a686a751@web.de>

On Fri, Jan 16, 2026 at 02:36:58PM +0100, Markus Elfring wrote:
> …
> > In scpi_dev_domain_id, it does not release the reference.
> 
> See also once more:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.19-rc5#n94
> 

This is useless and looks like coming from the bot. Note to the author:
ignore this and no need to act on this.

-- 
Regards,
Sudeep
