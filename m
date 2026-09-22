Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 943A43F3263;
	Tue, 22 Sep 2026 17:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790098340; cv=none; b=jlMpfxnMLXg/30tp1qOEyO+YgJa0/4U+WYxulu6CS6aqDbZVvWtltluAaJ0tv+XijJuPQEfRrbCbUOPa1rBQ9ziXlmcRz2R8KUV3aUaVINrP5EuA9bvL0Jj8eRGnMX8GuY2vMWNoQcTnLhdpWAwejI/MaIozb/ZgQYhDmKtlW8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790098340; c=relaxed/simple;
	bh=i8rmnA+nlrHeWzx7kNMPhnc4iJcDtyjqy8ekHSFBfJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qvr8i/tAf+YoHxuVXr+wdhN+aEXUmQE82L1Oe41Pown1oeIj4z1B9P3sH205AhUou70eCcmRObSfHkaaLConuQW2S8ocHsMTaTsmROd7gvbsqro9qN8ey0TXlHIE0nJMjmdaMyTWp5JaO2XDTox8PWF4zLudIlBVwB5mBpHYBK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=hM/SET1P; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="hM/SET1P"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2AA11576;
	Tue, 22 Sep 2026 10:32:09 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2098E3F86C;
	Tue, 22 Sep 2026 10:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790098333; bh=i8rmnA+nlrHeWzx7kNMPhnc4iJcDtyjqy8ekHSFBfJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hM/SET1P+KLwfCcF/EmK7kBGpnTtJ6hib/jI+FsscMVotyP6SnC2oSDprj3ksYReb
	 wWYK8dWDStfaOmXBNeCfNteQ1qqOXodtyrT6riUez3skCE13fAFlmdYDlib7zf8Bq4
	 PBWsxMfEsVHadBHn2P0w6yO1bCNyHnz6bpbKWWfo=
Date: Tue, 22 Sep 2026 18:32:00 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
	sudeep.holla@kernel.org, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	d-gole@ti.com, jic23@kernel.org, elif.topuz@arm.com,
	lukasz.luba@arm.com, philip.radford@arm.com,
	souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
	puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: Re: [PATCH v12 01/25] firmware: arm_scmi: Add new SCMIv4.0 error
 codes definitions
Message-ID: <arK7kLlrg491EsMf@pluto>
References: <20260920091928.2014972-1-cristian.marussi@arm.com>
 <20260920091928.2014972-2-cristian.marussi@arm.com>
 <88138b8e-42cf-405f-a5ee-519271dbd4f4@kernel.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88138b8e-42cf-405f-a5ee-519271dbd4f4@kernel.org>

On Tue, Sep 22, 2026 at 02:20:20PM +0200, David Hildenbrand (Arm) wrote:
> On 9/20/26 11:19, Cristian Marussi wrote:
> > SCMIv4.0 introduces a couple of new possible protocol error codes: add
> > the needed definitions and mappings to Linux error values.

Hi David,

thanks for having a look...

> > 
> > Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > ---
> > v4 --> v5
> >  - map SCMI_ERR_IN_USE to EBUSY as natural
> > ---
> >  drivers/firmware/arm_scmi/common.h | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
> > index fe8c22cfb9f7..6f89ba96493d 100644
> > --- a/drivers/firmware/arm_scmi/common.h
> > +++ b/drivers/firmware/arm_scmi/common.h
> > @@ -48,6 +48,8 @@ enum scmi_error_codes {
> >  	SCMI_ERR_GENERIC = -8,	/* Generic Error */
> >  	SCMI_ERR_HARDWARE = -9,	/* Hardware Error */
> >  	SCMI_ERR_PROTOCOL = -10,/* Protocol Error */
> > +	SCMI_ERR_IN_USE = -11,  /* In Use Error */
> > +	SCMI_ERR_PARTIAL = -12, /* Partial Error */
> >  };
> >  
> >  static const int scmi_linux_errmap[] = {
> > @@ -63,6 +65,8 @@ static const int scmi_linux_errmap[] = {
> >  	-EIO,			/* SCMI_ERR_GENERIC */
> >  	-EREMOTEIO,		/* SCMI_ERR_HARDWARE */
> >  	-EPROTO,		/* SCMI_ERR_PROTOCOL */
> > +	-EBUSY,			/* SCMI_ERR_IN_USE */
> > +	-EINVAL,		/* SCMI_ERR_PARTIAL */
> >  };
> >  
> >  static inline int scmi_to_linux_errno(int errno)
> 
> So far we had unique mappings. Now EBUSY and EINVAL could be due to two SCMI_ERR
> each.
> 
> I assume in the later usage there is no need to distinguish them for now? Might
> be worth stating that in the patch description.

Mmmm....indeed this was added to the spec last minute and while
ERR_IN_USE (probably) does NOT necessarily need special treatment (so it
can share -EBUSY), PARTIAL_ERROR must definitely be handled specially ...

Good catch...

I am indeed already handling properly the side-effects of PARTIAL-ERROR
but I will have to properly handle the status code itself in READING_COMPLETE
and in the NOTIFICATION....as a consequence it needs to be distinguishable...

Problem is...there are NOT so many not-already-used error-codes that could
signify such an ambiguos error condition, by the spec:

"The platform returns PARTIAL_ERROR to indicate that some of the telemetry
data could not be collected."

I will use -EBADMSG (but any other advice is welcome) and fix its usage where
needed for DRESP and NOTIF in v13.

Thanks,
Cristian

