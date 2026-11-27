Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794615;
	b=uizwTik4RYNhbvBugYbbf2SDZue95zSPfNlC7zFiVil8+hb9zymZ/QpcwNL7OA5x1KS0
	 dUctQO+ALpzltPyeyZnPTBZc2Kg3KWfy9YPepO4qgzE4lPADTntkd8d1VyH2qwi9xJuK8
	 pQoX/Egl718zQULiPrGBJIXtytVpAZOkWWY6tUGoZ29uRtNzBiWGEeQYkjGwyta46ryxI
	 xS/0+7LikzZ8Aucy3/U2W8XEKuFoLYHnrT6Ut4c6UKZy2DgWUskP1iTH3MMyIscpUgYzH
	 p4I5kLuSxf6wmB2JaB6LBrtRh84lPlrxZN5d2CK6ciITEE4zTEE6fXREw/X/OBRey/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794615;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=/vBHlhJ/W1xZToIFFx1FnlTJw/r0UAj/MYnI+1u/MyU=;
	b=hJKU+U7UJKKIg/DIa8JNhrWlkAxz8mAnll7Ph2QbP6USR4wlu0wEmTfCEvMnxv6evBnW
	 IYWhm5Q68OzuPP+K/iyr9i2P/rNTzmcl7wWOmsg3SVoSVKbBiXLIjiIqxc04Y5HbibLQz
	 IySOvtOdSWZy44+Ltd+imo+KyQ90eVZzbyJQqPXSXuyf0+g/aa+SYkHWojprAUvwdRDiC
	 OfhT5N5cAa6xAZq8Ae2F7pE9ksAVle/em5fsLA4XFrMZ1zv5KdoMSlfuuzxZ6LwoWibA1
	 b5O8zkmSKx2SIjMb8AcPCST3Uy7wRssHrSq4UmMIOn3j+H7BHWNiFLPA6NNlzIg5m6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NrruEC5+;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACBF7606A31C;
	Fri, 27 Nov 2026 15:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACBF7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NrruEC5+
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 360DF2F;
	Fri, 27 Nov 2026 07:50:11 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 891343F632;
	Fri, 27 Nov 2026 07:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795794614; bh=WfYS7XzkCTsLbNBcdEp/guv89SRLO1zfUYEw+X3yVdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NrruEC5+ls++tnQfEGCdiET9qhxdHv9si6NUzzdUItiMF6244K9aNnhsOs57biYAe
	 ctoc4C8jR2F3U2E1NjpJ2fdu99OvpUU1TFTb+R3JEFFeLuTKTZ26VqQKJe7F0j/lx4
	 b0JDsNqOQdIoRqUvKOS3E5D4YUzpRlUOg8zo3VAQ=
Date: Fri, 27 Nov 2026 15:50:02 +0000
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
Subject: Re: [PATCH v17 11/34] firmware: arm_scmi: Add Telemetry basic
 attributes enumeration
Message-ID: <awmmqnzicQgmW_KE@pluto>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
 <20261124194841.1147072-12-cristian.marussi@arm.com>
 <20261124155940.0000336d@oss.qualcomm.com>
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
In-Reply-To: <20261124155940.0000336d@oss.qualcomm.com>

On Tue, Nov 24, 2026 at 03:59:40PM -0800, Jonathan Cameron wrote:
> On Tue, 24 Nov 2026 19:48:17 +0000
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Add SCMIv4.0 Telemetry basic support for minimal initialization and
> > protocol attributes enumeration: expose telemetry instance descriptor
> > via a simple information retrieval protocol operation.
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > ---
> > v15 --> v16
> >  - ignore groups
> 
> Partly... Need to do a lot more ignoring to make this true and consistent.
> There are a few things in here, but key is we need the whole framework
> to be as unaware of groups as possible. At least up to the userspace interface
> layer where we may need to ensure extensibility.

As of now I removed the logic, but kept the existing data structure and interfaces
(like grps params in ops) and inhibited where needed any remaining code
path pertaining to groups.

I agree that a more clean but pervasive approach would be to fully obliterate
any group reference and then just re-introduce all of this later when the
extended series will be re-posted...it would be a lot of churn to remove/refactor
and test to just then re-add later all of this support...but yes why not
I can do that.

Thanks,
Cristian
