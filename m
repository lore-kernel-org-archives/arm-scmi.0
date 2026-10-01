Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6FE23BCED;
	Thu,  1 Oct 2026 12:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790857350; cv=none; b=ofll7QiPftimT+smL7AXRodHuGEiSRPZb9qxsrIfIKlcezDx0h2tRR89C4zCQlLvyACksov1c9agv3cDc3QZ68C2SC8OB3ROJRBTw14DHrt++a8gDU+CTZa0VaofEOgMKKtXTpsXJHXq6uRD7bGZXhZz1UlMEQy9deKl7Bk7jsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790857350; c=relaxed/simple;
	bh=MI6ddweSL/vQkzcuKql8CH8u3DE1m6/iBjCm8ePfSMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ceje0P5Q5RtmDJfvzoquq1lffrt0odFI0JcRLvpnjaofaUAZGhmCur1FdwkpLH686gMwWnj19BjKbA/K0LmlfTWr4gzLao8Ime6UTLWLGJOhiND7rQULKEFCuZCqiOe7jDvVuX3XarF6KHxw2//lILHUNpu2PdAedXia3GJjPW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CsDC78qX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CsDC78qX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AD5A1F000FF;
	Thu,  1 Oct 2026 12:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790857349;
	bh=Txa73AibBOUFGnqEUgy9UQjLyox1mglOmNld2kHTL9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CsDC78qXzYYpOMV8w2qnZYpSaYWdLT0/j8SDEUXDrzzRv4m2sGvsn5I3S7axzVQkd
	 MXhGhUQF5O2FHw65Y/RfvXbClKioHk9k9eLHpevJ7Qh4EoscWZxHKofpvamiyEgTAR
	 kC6SnMxGtHpS75EXpkgGcxFeyMzwIJZnl7fwK9ZKIVa6iDKf0BMGeGdS4+veMrLS/q
	 P+xWeMoFzLN9pQvAGzZrHSysUggRx3NJVmyYHE0iYJGT+I/XUWV0elNjJiZbG241SX
	 jczOnsKZLGyLruNNPDKnvy6dznYp3V7ZbDK+5e1bS3+k4eKAWauhf7Jnp58o8HmGoD
	 byUMtBnr58qqg==
Date: Thu, 1 Oct 2026 14:22:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: SoC Team <soc@lists.linux.dev>, arm-scmi@vger.kernel.org, 
	ALKML <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v7.4
Message-ID: <20261001-crafty-attractive-kangaroo-d20f0f@quoll>
References: <20260928065112.2492223-1-sudeep.holla@kernel.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260928065112.2492223-1-sudeep.holla@kernel.org>

On Mon, Sep 28, 2026 at 07:51:11AM +0100, Sudeep Holla wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> -->8
> The following changes since commit 8544e0da1a04c77b98e2e313a423a5c72e48ea32:
> 
>   Merge branches 'for-next/ffa/fixes' and 'for-next/scmi/fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux (2026-09-08 21:04:42 +0100)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-7.4
> 
> for you to fetch changes up to aac4e67d6eb93118cfa70c6562b5f9c81a7042ef:
> 
>   firmware: arm_scmi: Always create devices for standard protocols (2026-09-24 09:10:43 +0100)
> 

Thanks, applied

Best regards,
Krzysztof

