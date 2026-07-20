Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400863A4F3D;
	Mon, 20 Jul 2026 21:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784582418; cv=none; b=PA2qypRY0BV+fLOL12DAbW4/4ZHRBdPkfzYDkOMvYYA0Tkl8VGHym/U5QcooENeJ9LISwhc+YN3Zz27aC8eR6F6sJ0uPvEVVRfzQ0C5F9uLp9XBvJM1CWJZKkMyK39Ol7Q81vPBWw5EGbjM00ODMggn41kbI3mdb/jdfhwjsNG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784582418; c=relaxed/simple;
	bh=DOE1iww6WIdyKxjkG2kB7vfPCjgmzUfXbQOEQ/8y9i4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u/ejdlVGKRdTuZZ9Jn1JJ3AjSLVdk6QEyz0wZoSYmqLy6hSRZ8ktRXkzghjJ7zsh7pGizb+Jw2SFopsjjb1XkluvW1R+156/nsqMfEwYZJO8UpnBTDy7VGCZgaDaFm27jPgDEAhspxbymafC/vD5Glw88lQx5U67puMABbBeMuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UorGNQdS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UorGNQdS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D387A1F000E9;
	Mon, 20 Jul 2026 21:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784582417;
	bh=OeYfbR20BofIIg0ulp8ZNieMPvQ2e/qEqcoScefQN90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UorGNQdSQ0t/43oZPr1RImpKsOocyXctB3ebryrjLU801tO/76+HRicJywL2jajc5
	 yEAoXiYDdZlgRFSbSfJZAxEyG7ZO24qLAlXG3/LzELC2hIMXqQJ4xzWl7JJ6YWI+T9
	 hXwwP7kDywuwaXwcBjhwjO0UZR/aHehFeZEvpA1HjZGvhh45Be5OTFpBXvKQrzRNoK
	 XFocgDa5HLUInKC7AO8vyjPE4TbrOAbtlIRbvGu/DgHZiSooqTbNmiBDEjdatSA62+
	 AMeN4dwaKMoc9pwlnMjw9qecM8ySr+3XctzSmWFxEMnBSbKDUhLp4jXGuhdjRMn6TX
	 XkWn2RwELbQwg==
Date: Mon, 20 Jul 2026 16:20:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Laszlo Ersek <laszlo.ersek@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, arm-scmi@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation/devicetree/bindings: update Sudeep Holla's
 email address
Message-ID: <178458241339.4189208.4756351332431744832.robh@kernel.org>
References: <20260720160235.36592-1-laszlo.ersek@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720160235.36592-1-laszlo.ersek@arm.com>


On Mon, 20 Jul 2026 18:02:30 +0200, Laszlo Ersek wrote:
> MAINTAINERS disagrees with Documentation/devicetree/bindings on Sudeep's
> email address; fix the latter.
> 
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Cristian Marussi <cristian.marussi@arm.com>
> Cc: Jassi Brar <jassisinghbrar@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sudeep Holla <sudeep.holla@kernel.org>
> Cc: arm-scmi@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Fixes: 59e82a4237cf ("MAINTAINERS: Change Sudeep Holla's email address")
> Signed-off-by: Laszlo Ersek <laszlo.ersek@arm.com>
> ---
>  Documentation/devicetree/bindings/arm/arm,juno-fpga-apb-regs.yaml | 2 +-
>  Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml      | 2 +-
>  Documentation/devicetree/bindings/arm/arm,vexpress-scc.yaml       | 2 +-
>  Documentation/devicetree/bindings/dvfs/performance-domain.yaml    | 2 +-
>  Documentation/devicetree/bindings/firmware/arm,scmi.yaml          | 2 +-
>  Documentation/devicetree/bindings/firmware/arm,scpi.yaml          | 2 +-
>  Documentation/devicetree/bindings/mailbox/arm,mhuv3.yaml          | 2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)
> 

Applied, thanks!

