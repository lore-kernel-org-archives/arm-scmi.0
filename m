Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F160736C590
	for <arm-scmi@vger.kernel.org>; Mon,  9 Mar 2026 09:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773048573; cv=none; b=fqcPLk5HXMW8cPtQOjsLnf0lEvBynILOB+YZk0Uuj9QMWl1B58CWEo+nhJqM0a24nPbfJl+2rAVjUAUATiCSGJz6qdEQIO+bJuzlQjnFI4UukWoz/93A+EPh5++2NnElS9Vt3ITUIzu/QL5YLS9o3vnMMzpOzNoof1v3Oga5T3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773048573; c=relaxed/simple;
	bh=qeDwrBfSnOuo+v/tHdiGCVYuv0G2V8Y+lWM6M9KmcNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T+WU96qY433knDvgzhaTFFQ3xF6b1VDaoGofN+SjQTzxaRm6GeXXXU1IBwX9mnhoeoeQMnm8Qwm+GnDVISfQ120hkGnUXO11S7tLRdX9bK9/bd27JtP8RscXmGlF3x6M5Kz6+nQ9+6Ih3Y63fWTfNhT0zD6NUoyARHV2ZAVIlJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bUxztMj3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bUxztMj3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A360DC4CEF7;
	Mon,  9 Mar 2026 09:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773048572;
	bh=qeDwrBfSnOuo+v/tHdiGCVYuv0G2V8Y+lWM6M9KmcNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bUxztMj3IbCiJfpa6sNiZx979NVYXHdf08+Tkt6WwDQ/JPcnxrPeCleaK/NQKa+i4
	 1OXlNTSRE3Fy856TVZCHpA4ujw9l1M4OZ1BBL+IjAo0+ofBIFbqtxGrtkPZH1TFoTv
	 txBQx2gr8l8wTdyn5Ev6Z/LmZHLB0LalmpuKD4UA8Ih8MZUobQimcEJpyS8UcJArX4
	 tk6ioRYzX/+aabqDB8dYbJeqr2L/zpvSPdUs0Emrh/k3evkwFQpqVr4UVkdWe2/DBs
	 9hP/N+ng66c6+GLlxUDUw+WaX7SYlWQZfAYiLpA6EKht/+IRevIkOkmJeq/tX35sAV
	 JbPbTLba+WCpg==
Date: Mon, 9 Mar 2026 09:29:29 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] firmware: arm_scmi: Spelling s/mulit/multi/,
 s/currenly/currently/
Message-ID: <20260309-bold-space-ibis-fbff63@sudeepholla>
References: <6735401861e0c2f3e5e680533cd6f71c4d6fd5eb.1771581270.git.geert+renesas@glider.be>
 <177297485599.1088487.13156698600769816077.b4-ty@kernel.org>
 <CAMuHMdXkyrDRLyDf77TFFjAX_Q_fnA_OwmbkoaEicd+F9JP2aA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXkyrDRLyDf77TFFjAX_Q_fnA_OwmbkoaEicd+F9JP2aA@mail.gmail.com>

On Mon, Mar 09, 2026 at 09:16:29AM +0100, Geert Uytterhoeven wrote:
> Hi Sudeep,
> 
> On Sun, 8 Mar 2026 at 14:01, Sudeep Holla <sudeep.holla@kernel.org> wrote:
> > On Fri, 20 Feb 2026 10:55:15 +0100, Geert Uytterhoeven wrote:
> > > Fix misspellings of "multi" and "currently".
> >
> > Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!
> >
> > [1/1] firmware: arm_scmi: Spelling s/mulit/multi/, s/currenly/currently/
> >       https://git.kernel.org/sudeep.holla/c/4e701b47c3ba
> 
> Thank you!
> 
> BTW, I noticed some of your commits use the non-standard
> "Message-Id:"-tag, while others use the standard "Link:"-tag (albeit
> with the lore.kernel.org instead of the recommended patch.msgid.link
> domain) to record the origin of patches.  Do you have different git
> setups on different machines?
> 

Not really. I used to use "Link:" and switched to "Message-Id" a while ago.
I use only one setup and if you are observing something like above, I am
doing something different. I need to check what is that, but the intention
is to use "Message-Id". Let me have a look.


-- 
Regards,
Sudeep
