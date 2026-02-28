Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA5F5280338;
	Sat, 28 Feb 2026 10:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772273047; cv=none; b=XEFkza9FQTRjIstXq5NClPx4IRCiGEVhWw7CTKZl7pO/54f5llnI19/CZsYjMLcp/aR4PWIUNDdfg24aCP+mqwabLky4lXH62BmJ9L78U8ifsMd5xXBD1tM6Lf7H/FfAlnL698U9eWzZJkaXcKCcVgCyYltJEG19NLa5RG+0Olo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772273047; c=relaxed/simple;
	bh=5+sUBAXkaIerTHsduH0DWoJcIa/6o6bOgYrqqI7FYS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nUgKD67FlJoWzu4e6q+n5qihfOpBSp5+p3hRdsRArXG/7cX+tI1v4zB1mJBoX/6+zX0rlEaOMrqqtC4cCrR2VosvU0EcI57bzTm75jaGYYMNlsarGAPObYLi4q0Z604974NS/QWjDIKGI21E/Lz9uvBEGBN1wlCPW7lB+SPv8rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BE731516;
	Sat, 28 Feb 2026 02:03:59 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BD0E3F7BD;
	Sat, 28 Feb 2026 02:04:03 -0800 (PST)
Date: Sat, 28 Feb 2026 10:03:59 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: base: Simplify protocol list size
 calculation
Message-ID: <aaK9jwtyJHoa0F2t@pluto>
References: <20260228-scmi-check-v1-1-4935b58bb2db@nxp.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228-scmi-check-v1-1-4935b58bb2db@nxp.com>

On Sat, Feb 28, 2026 at 11:37:33AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Replace the open-coded round-up calculation with the kernel's round_up()
> helper function for better readability.
> 
> The original expression:
>   (1 + (loop_num_ret - 1) / sizeof(u32)) * sizeof(u32)
> 

Thanks for this.

LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Cristian

