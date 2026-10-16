Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEABD48488D;
	Fri, 16 Oct 2026 16:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792167495; cv=none; b=g563yn49Xfth2xYBAdAs1lWtLA5sWPj3rneRimhsCW8VDpd1nY8s/XSsuVNpSSU8d9PgnjpmR34gDhDsj36wz3vciWY6G0i04cnill5IPA6nxHwRWrVbXGKNqbO49qEmTd8b8Obey8PzqoYZVcn52BhhS2PArZILZy88RdpFHYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792167495; c=relaxed/simple;
	bh=OL0Z9n+x/W1I0LOFx4CXVtYKQoBbVkaf5sqDVc/OavE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mQ9dZ2upy+kOc0kY3DQMG87Z2QTnCy2W9vtWZr0Lep3Zzssg8OMD9Vsu47fuJ8uwdpujxwDELo0uUG8TupcFG1kxpsqVaMTzHpvucjt3Onq7ODVgnSnMUKZKKzqMZkcqsVV7RIX82ofarCKj8aJCtIZbHoGXphUzVEKc4U3koko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dQbmMsZG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dQbmMsZG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AE6E1F000C4;
	Fri, 16 Oct 2026 16:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792167493;
	bh=8AZLnJTPa8wX1pZieqb250DY53PVfT0l/gCS0GpXSrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dQbmMsZGHo+u7BRY0QBalZamSBEzv+PEx9vV5J08fw7Yag9Y5WNId8f+ybzv3cvLP
	 kGWQSGVzYU3BwoSW9actmRWKvpO/MR/FIM1NoHtXi6tzLxjaPsggnkgJ+xMtWy4Jx4
	 cZX4oTVhC31EIHn3n4lH2tkO+RXsfDnzKM0QbsNBxVFXCtgRt/C0Ja4YN25cxbUWRi
	 47DkDd8U2Ekpm+rmyCW+KHc+kA80eUqm0GWs8NNeR5yFlazGtXpIaiMzSVx1Z382p1
	 ViLZdI+X/FURRKCwYeqmiTGQR9YUm/dzQpfCTH/B30mEjISuxgai5/psd+vncEPdVC
	 +w8ZeG8/q1K+w==
Date: Fri, 16 Oct 2026 17:18:09 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: jaidevshastri@vt.edu
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scpi: publish scpi_ops with release
 semantics
Message-ID: <20261016-curly-nano-reindeer-44cfa7@sudeepholla>
References: <20260921-mb-arm-scpi-v1-1-6aabb6533a40@vt.edu>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-mb-arm-scpi-v1-1-6aabb6533a40@vt.edu>

On Mon, Sep 21, 2026 at 09:06:04PM -0400, Jaidev Shastri via B4 Relay wrote:
> From: Jaidev Shastri <jaidevshastri@vt.edu>
> 
> scpi_probe() stores scpi_info early because scpi_init_versions() sends
> messages through it, and sets scpi_drvinfo->scpi_ops as its last step.
> get_scpi_ops() returns scpi_info->scpi_ops, so the ops pointer is the
> gate that scpi-cpufreq, scpi_pm_domain, clk-scpi and scpi-hwmon test
> before they use the driver.
> 

None of these can be probed through the drivers are initialised until
the devm_of_platform_populate() after the scpi_drvinfo->scpi_ops is set.

-- 
Regards,
Sudeep
