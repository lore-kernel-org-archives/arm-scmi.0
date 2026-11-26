Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686002;
	b=T8hsjPn6WbgOugs2sDdmoanzkYyAYAHAyRnE/qyQKDbfctPzcwUMBnCCZVDj9miO7Fn8
	 2OyPsYmEcr3vjCCHk0UTpqy04pVuBoBC+EOoWVqGOTmt8VceZQPE6IsbiAOvAeC+iwFWh
	 Ux5cCHaBiNcNnWUDWy26/ka7ijPVSK/EPBDGCayWLkDiyOlNbNwSoAxn2nvpE4rHhlfXe
	 sLU4jhr9ll//tfbZlmTfk5z3eyOxD+jvnu5FMuqIXstfcznTj4LJb6DqMcnMv5nw0+STF
	 vBGK2MJG1feBxO0kKIhRpWTz6J8Tgfqt0+KlZ2IA94jhvLqZdPlWVjbbMcmd4ZxNGrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686002;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=CXzeV1Yk3iRKOSkEmTtvwOYw5cnOJdYBMgITKdROfpA=;
	b=mUJi8+Y669V+6df+pDkYVXGaXAYEZqaYPIkPuxRe5R0vJp7lX4rZwRdwe3zThOqNrAOF
	 aNk0nBcMLyPbby7jYeQq0FX8HSXS/Y0U2T8SaM9Yplvovdu1kn6HQPzWeSxGCnvfKiQJr
	 7kxvDrKUMUBccJQt502CLWInOf+p5lmvvfpuUPE6sHMvftO9SjY3dKNi7GdTeyFbjFqW8
	 fP67FQeq+/ZjvpkRbYFijbs5maWt170Zb7pygkIJksGK6+UE9sIDx7Ir/2g9s3ALfjEFt
	 jeU7qV+OexNT9Ph99vHO/OD8p+1NuzXRMIlu4MZALX4FPiVHiTCNoL7XjqcgGA0VC0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=M8yvqmvc;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 715C3606A31E;
	Thu, 26 Nov 2026 09:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 715C3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=M8yvqmvc
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC8BD1BA8;
	Thu, 26 Nov 2026 01:39:58 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FECD3F632;
	Thu, 26 Nov 2026 01:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795686001; bh=BoUj1qpAANERvvO2aWz3vjf4dNomyHw4/oGPucOcpfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M8yvqmvcO61W65XjTA6Uwc0WrD+Zmc4PI/PDfDSNqTd+1oyEtq+upGrxhvCHRCCNP
	 Qa1kzXPE8RwpbciT90fSPwgXmkqbNAgpK5wsGumAnqJc5Z1JFOJzUc3xR28GclGLfK
	 yWHgaWtJZPKd4+VqtB4UCAqXtVzFW7eZLxr7MkJI=
Date: Thu, 26 Nov 2026 09:39:52 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
	sudeep.holla@kernel.org, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
	philip.radford@arm.com, david@kernel.org,
	souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
	puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v17 00/34] Introduce SCMI Telemetry support
Message-ID: <awf-aPLuU_RgU2wN@pluto>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
 <20261124145357.00003e9f@oss.qualcomm.com>
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Post: <mailto:arm-scmi@vger.kernel.org>
List-Help: <mailto:arm-scmi+help@vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
List-Owner: <mailto:arm-scmi+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124145357.00003e9f@oss.qualcomm.com>

On Tue, Nov 24, 2026 at 02:53:57PM -0800, Jonathan Cameron wrote:
> On Tue, 24 Nov 2026 19:48:06 +0000
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Hi all,
> > 
> > [TLDR Summary]
> >  [V17 highlights]
> >  - addressed more Sashiko reports
> >  - added a few more SCMI Core fixes that ease per-protocol logic:
> >    + added more consistency in the SCMI Core Iterators machinery
> >    + added centralized check (SCMI Core) for truncated reply
> >      + Reworked some SCM Clock behaviour to allow for truncated checks
> >    + SCMI protocol core initialization refactor and fixes
> > 
> >  [V18 TODO]
> >   - address any remaining outstanding Sashiko/reviewers issues
> >   - address pending human reviews feedback
> I'm lost.
> 
> Does this mean humans should wait for v18?  I'll assume not and
> take a look anyway... 
> 
> Sashiko is moderately easy to run locally as long as your company
> isn't too restrictive with tokens (if they are say upstream folk are
> complaining and ask for more!). Might not be exactly the same
> as the version here but will reduce the noise and versions on list.

Hi,

What I failed to express is that there are still some reports to address
both from LLMs generated reviews and human reviewers.

We do run local LLM reviews (multiple versions of them really), that
together with the public Sashiko instance and the human reviewers generates
a LOT of mostly good and interesting things to look at, BUT such reports most
of the time point out different things (depending on the LLM backend or
frontend version) which is good but rapidly overwhelming: so in the interest
of timely progress I try to address a mix of both upon each posting, but given
the load, usually when I post a new series, there could be still be outstanding
issues from both sides of the review world, human and not, that I plan to
address next...or simply unknown new issue that will be spotted later by
human/LLM reviewes even on the same exact codebase.

...so in a nutshell what I was trying to express was simply that, even if
some comments are still not addressed/replied, I am NOT ignoring human
reviewers (i.e. You mainly) nor LLM generated ones BUT the amount of work
for read_reports/fix_it/testing/replies is overwhelming, so in the interest
of costant progress I DO sometimes post knowingly less-than-perfect series
(maybe focusing more on refining some part than other as an example)

...if NOT there would be probably longer than desired gaps between posting
without anyway the guarantee of perfection, given that when I did try to
address ALL the outstanding reports in a go a few weeks ago, I got anyway
a huge load of brand new issues flagged next...(in these regards LLM do
behave like humans...spotting new stuff from version to version :D)

So yes...I gave up on the mirage of complete perfection and instead aiming
at addressing issues the best I can to allow me to post week after week
a codebase which is increasingly better and improved but still functional
and tested...especially since it is apparent from our last discussion on
this list that this whol feature wont be merged in one go so what is the
point of trying to tidy up to perfection all in one go...

The TDLR summary at the start of the blob was meant to be a heads-up
to avoid people thinking I am happily ignoring them :P ...

...but it clearly failed miserably in its mission...so I will drop the
useless TLDR next time.

Thanks,
Cristian
