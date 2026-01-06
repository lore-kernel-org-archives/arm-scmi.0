Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3304341079;
	Tue,  6 Jan 2026 15:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767714559; cv=none; b=GQoK3CM3xdi/Ihxk85AbHXv8WVpzfQvM0JFp4JjyHSSo2u35Th3nbUIPMnpgrMkqoyP/3HSIDxt3vyq8Xh+/CaF6ufD27M/ZKVHD63z1726QS4Nf0J1RSbR8wvhvGzqL7EWVdYPDJFj2rcA2SAwtusxTKlzOApKboYw5EhmYhTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767714559; c=relaxed/simple;
	bh=b5F8qMVC5A8MKd1AjHoTLmV9ak2LvJL27NcFURcOGUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q4y7RRT1paGC7xDG40ALIQP18lPvn3ZbzJm9qxey02fKbiBXSDrRgVSxaDd5fZAqjhRTxN0a2ac4MjDE56i8UW25bo7/HLETZ0Lae/0BKOdQIecGzk/qx9l9kLncBOYTosf/V4l9Ow4/kX4BVGG8O77xwGdqCYh6qx5gSIZEgv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9883D497;
	Tue,  6 Jan 2026 07:49:08 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC41E3F5A1;
	Tue,  6 Jan 2026 07:49:13 -0800 (PST)
Date: Tue, 6 Jan 2026 15:49:11 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] firmware: arm_scmi: imx: Support getting syslog
 of MISC protocol
Message-ID: <aV0u9_l3Ke0hU0Vr@bogus>
References: <20251029-sm-syslog-v3-v3-0-64e14a6e3f87@nxp.com>
 <20251029-sm-syslog-v3-v3-1-64e14a6e3f87@nxp.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-sm-syslog-v3-v3-1-64e14a6e3f87@nxp.com>

On Wed, Oct 29, 2025 at 08:07:01PM +0800, Peng Fan wrote:
> MISC protocol supports getting system log regarding system sleep latency,
> wakeup interrupt and etc. Add the API for user to retrieve the information
> from SM.
> 

This LGTM, so

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

Let me know if i.MX maintainers prefer to pick up both the patches or
they want me to do that.

Also it would be good to get Cristian's review especially the iterator is
being used and he may spot something that I may be missing.

-- 
Regards,
Sudeep
