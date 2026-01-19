Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D46D314F112;
	Mon, 19 Jan 2026 15:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768836327; cv=none; b=lXK13UKPnoB+khHOI66ONtvE9d4SlGYj6ppSBRAzJZ/DVE5oVwSf7mWUjKcO7snnXYWv8oatr3YIBXM/oCXXk1MRSa3TmGFKAdfh+Ckt2BujW6k5pNqzII0diAV5IUFjAEa2tMY3B/6bfUfQCfs9Qj46se/9+tITr1UGjaV9nC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768836327; c=relaxed/simple;
	bh=Znnw31dY4vnCLnC3mKxjTRSa7UzOo5PDH0F7DNyLz6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FNBl5B3QYiQgWkf2WVOqkWf+o7TZGs/2FZqzkU3UMQp+fojEuSmy/skwokdK3v3E6PGr7fiWeNhlmr6wokIEQyFKLjN+5jPCJE9BEMUMc+8G4tSOCtsxs7nzng+8dyTyJ2yo9GEvgQGIyyyOH2P9MZaULkbZ/2OQ3VuMnI7qhRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ADC7D497;
	Mon, 19 Jan 2026 07:25:18 -0800 (PST)
Received: from bogus (e124108.arm.com [10.1.32.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 265513F694;
	Mon, 19 Jan 2026 07:25:24 -0800 (PST)
Date: Mon, 19 Jan 2026 15:25:21 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Felix Gu <gu_0233@qq.com>, Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scpi: Fix a reference leak on device node
Message-ID: <aW5M4SoEtLfQ4tC2@bogus>
References: <tencent_A3E20C513BBE7D268B863A5CE473FBA10B06@qq.com>
 <aW0xWZ-KylipPF7M@stanley.mountain>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW0xWZ-KylipPF7M@stanley.mountain>

On Sun, Jan 18, 2026 at 10:15:37PM +0300, Dan Carpenter wrote:
> On Fri, Jan 16, 2026 at 08:54:39PM +0800, Felix Gu wrote:
> > When calling of_parse_phandle_with_args(), the caller is responsible
> > to call of_node_put() to release the reference of device node.
> > In scpi_dev_domain_id, it does not release the reference.
> > 
> > Fixes: 45ca7df7c345 ("firmware: arm_scpi: add support to populate OPPs and get transition latency")
> > 
> 
> nit: delete the blank line after the Fixes tag.
> 
> > Signed-off-by: Felix Gu <gu_0233@qq.com>
> 
> Did you find this issue just by reviewing the code?  I read the comments
> and then looked at a sample of four other callers and none of them
> called of_node_put().  So it's a weird thing.  If this is really the rule
> then we should have a static checker heuristic to enforce it.
> 

I agree. I see bit of inconsistency at call sites especially in SC{P,M}I
related modules I maintain. It seem to me based on the description at
of_parse_phandle_with_args() definition and various other call sites as
examples, we need to have of_node_put(). That said, I don't have any easier
way to validate these, so I am happy for any reviews and recommendations.

-- 
Regards,
Sudeep
