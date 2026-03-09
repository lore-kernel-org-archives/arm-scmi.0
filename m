Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AC437AA89
	for <arm-scmi@vger.kernel.org>; Mon,  9 Mar 2026 09:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773049111; cv=none; b=AkNkudv/7oAClHh0jWHFc3Ov6VmSzPFOPotALUdVMuiBwXgcKPoQ9JQhQTTWqloMXFS0TG/W+jckxAJSvmCeYcSOS5yo7UifVI1xgkV88xtL6EA8E9Ajr9Qpk1XwWu2/fjPKRszG4Hw1b/3F2jD3E7ywHj1K180f6nqUVlnAJLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773049111; c=relaxed/simple;
	bh=r+gzEksCqKxFBjsj75G36A9y534AyJH+xrAw0HmvU4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=szqt9eolmo4e8mL7NSyNMUYd+fDPE7Eyxa0IMaTQVkKa9itByb8Ot22kKdH7VP+Q1Dqvve2XcU1gvOJ9UhSwrtyO3DVj/EQE4onq8yWKGSxwReqh2u01N7ZBKAxH2x9qg6DrgqzggLyJj/kszYSO4ocVvXzdy5Ryqs1vXE5dqCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=soFZC1Pu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="soFZC1Pu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A22A3C4CEF7;
	Mon,  9 Mar 2026 09:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773049110;
	bh=r+gzEksCqKxFBjsj75G36A9y534AyJH+xrAw0HmvU4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=soFZC1PuyuJeC66KRnXtr9PEHil+9JB9s3I/xeMt+Hyh9YkxhDZEkFPIdH39TcnRZ
	 rhT97NBqx5ef7mHtHeO91wFiTkgvP5XwkYlVyyXbP4hbl7tkJ9i9Tj6dUwpP6Mu1Uh
	 bE1U1QA44E9iTC8Q3EfDjaz9AvNaPnMorf3c4cipOLqLf9FSkdhR9tx12WxIlXB67X
	 FCy7oEcOxDsZMlE/LPu1b68y3AvGvFVnoiWbC8oYjx6uLW2kwN2GQ+OCZmInu7G7ex
	 BUJXDsfhcJqVX+Bu2OezRIYsuA1pqKy9xb/ekIBpkI9549yW4FwcINuyIabtgwUVIM
	 fCgEH6fX2GqFg==
Date: Mon, 9 Mar 2026 09:38:27 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] firmware: arm_scmi: Spelling s/mulit/multi/,
 s/currenly/currently/
Message-ID: <20260309-frisky-proficient-gecko-b8d7be@sudeepholla>
References: <6735401861e0c2f3e5e680533cd6f71c4d6fd5eb.1771581270.git.geert+renesas@glider.be>
 <177297485599.1088487.13156698600769816077.b4-ty@kernel.org>
 <CAMuHMdXkyrDRLyDf77TFFjAX_Q_fnA_OwmbkoaEicd+F9JP2aA@mail.gmail.com>
 <20260309-bold-space-ibis-fbff63@sudeepholla>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-bold-space-ibis-fbff63@sudeepholla>

On Mon, Mar 09, 2026 at 09:29:29AM +0000, Sudeep Holla wrote:
> On Mon, Mar 09, 2026 at 09:16:29AM +0100, Geert Uytterhoeven wrote:
> > Hi Sudeep,
> > 
> > On Sun, 8 Mar 2026 at 14:01, Sudeep Holla <sudeep.holla@kernel.org> wrote:
> > > On Fri, 20 Feb 2026 10:55:15 +0100, Geert Uytterhoeven wrote:
> > > > Fix misspellings of "multi" and "currently".
> > >
> > > Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!
> > >
> > > [1/1] firmware: arm_scmi: Spelling s/mulit/multi/, s/currenly/currently/
> > >       https://git.kernel.org/sudeep.holla/c/4e701b47c3ba
> > 
> > Thank you!
> > 
> > BTW, I noticed some of your commits use the non-standard
> > "Message-Id:"-tag, while others use the standard "Link:"-tag (albeit
> > with the lore.kernel.org instead of the recommended patch.msgid.link
> > domain) to record the origin of patches.  Do you have different git
> > setups on different machines?
> > 
> 
> Not really. I used to use "Link:" and switched to "Message-Id" a while ago.
> I use only one setup and if you are observing something like above, I am
> doing something different. I need to check what is that, but the intention
> is to use "Message-Id". Let me have a look.
> 

OK, did a quick check and see last time I used "Link:" was an year ago and
that's when I saw some discussions about use of "Link:" for other purposes and
switched to "Message-Id". Let me know if I am messing up something still,
happy to look into it and fix it up.

-- 
Regards,
Sudeep
