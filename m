Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094F026F46F;
	Mon, 20 Jul 2026 20:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784578881; cv=none; b=D+LsWRg2eH7RNR/ZEkApOUmqFoiwNgyf1YIEFatqB5g6mK55YjbQC6nSpEIB3f4RpQIYPFWJWjLjYWYVJLasnISOg+wlUb9MPFFpx46vlyrFyy1Ynobxrha4j8A2CJK/oW/EUy+jc2rrdIu4tx0OMIjJmiucdgRLy0+uVBboZi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784578881; c=relaxed/simple;
	bh=DT4WGP/e2Ufk9CZwncHmV7IZYyxe7yYj0Jk9d58hFRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RRUzdPzkiKqDqyBUSLfp9il+SGSDQGYH4FS+BPwPN/PnO6YCtzRqXuDnYVu4QFuuKes/iayWGTyW45CS/RDK/PfkTKFuN1XAp+xC5iRWAi0yOjILnwm6AX3/Ydm8/Y23KLXbOive4gyjEKycD5/9woB96ECrhCkUlCM3da3+QNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HnPEsUJq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HnPEsUJq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9973B1F000E9;
	Mon, 20 Jul 2026 20:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784578879;
	bh=WvsHl9nCB/3oWpy2i1hy1ychLtOehm4UQV2Y2KB3lfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HnPEsUJq54Co5xi71dKgJd/7lqrTFRL0qGIobg336BnVlU/Ub6sjuAoBgmX15h/Bc
	 4fO9ammUsx21F+uhFB0mKBcaE6j/AD5EmbXvjqCEsSpLEj32Akx7P3+BkqUNxuDyG1
	 vdSTA4HQ6UZ14forz39AG4DvyrvRmkAx1Aa0bY4TWYtcW3JFaKd47y3QRzBlN3zFmN
	 g4S4hydUrjF647jGwO2UDXboBqeWzWVgieCuuTKK1Z0B0PktOGB08HO40p3oMZsajQ
	 SABr631mPhJkISXdPcD5fl35qLcjsNCsMeuNcp6fcJ+Fg0espphp6zmP0zj/OOSWIF
	 6E28bQsJ53Q+g==
Date: Mon, 20 Jul 2026 21:21:14 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Laszlo Ersek <laszlo.ersek@arm.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>, arm-scmi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation/devicetree/bindings: update Sudeep Holla's
 email address
Message-ID: <20260720-great-sidewinder-of-tornado-8b1b30@sudeepholla>
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

On Mon, Jul 20, 2026 at 06:02:30PM +0200, Laszlo Ersek wrote:
> MAINTAINERS disagrees with Documentation/devicetree/bindings on Sudeep's
> email address; fix the latter.
> 

$subject is bit of a deviation from normal practice. Otherwise looks
good to me and thanks for updating it.

Acked-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep
