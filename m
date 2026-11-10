Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794299246;
	b=ySrjj3Ot3pKjfzEaRcUU19AI5LrshmVThqDUGCbzxkuKVjZezshxL/oSIdm64ma+t39c
	 ++QLaPL1UBol+p02A//orX2qLYp9wm5KhZJqKZsGTchHHkpVpMpuYlgMnCC7crpaqrKtN
	 IULfYuSPAVndcbP9oczMdQF79aIVUSkXBt8OGU20pMFH8OrgpERkYwljmuDsBBRbDRguy
	 WfoRwCddfCX5pZHPkh7bEZZ2zkYqtKNDSJFJvnUTI2Jt577J7crvcNXuhcV6KiPy8PfEk
	 bUfHVufgsxHnoGi6h3cCuAtrfUbBydOm/E8XVJ1oX68DMcFsn715L7RZG16Lw1vBKbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299246;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=smElB+v5YZUprs+9gXaadARMhHFqAhYG7NdRwP6D9JM=;
	b=vBOosZUtCgwvYiBCIVJh2XroOgNlABSOM36H4hPU7jXSUDW/pFCnZD9CWeOxVSLAZlS/
	 ADtU9T4UmfX3WZdgNAIkgqOGZ5gyxkptqAUZE1Lv2FsXbiSzyCTyDRnCak15y5O8sesjA
	 kA3XQpZ4XJTtKb42SjNlFA0dLRr3bABIplhODiMlhfcWGA1xcwxrWTHO+a+HUTR5dl5gO
	 0OrHY/ZaXjdDbGmxBMISEvlRTydN+XHRGQoIsV/rAt3DbF+mJIaodAukdx1ck5PfN8fk8
	 3s/ldnYvWM4FPN1WX1zyINxRuxk6GiNKjpHxi56bSUkmz0xBEf0/7+0xaUkEaRhB+RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YZGqvnmh;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2451E606A321;
	Tue, 10 Nov 2026 08:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2451E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YZGqvnmh
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 654211516;
	Tue, 10 Nov 2026 00:27:21 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 02C0D3F85F;
	Tue, 10 Nov 2026 00:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794299244; bh=OiH4/fPjG8Ry4ZmCXdz4mAOVD/Wuev+W0DjPiniPLjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YZGqvnmhoFCwQhy0c9nOmLxhT29f6xcSqYFGrcvUvJ+aNNy0Wc5Uapq9jKkKI2kBv
	 Z1GAkY0rVUvArwXYlOJqYTLZIjNRqOhssYXnylCVcT+UWkeuPJxfjnhBr/ow80O8A0
	 zY7cd96ZltCtjHRj6sxN8POR22ktrv1YfLdhvB9Y=
Date: Tue, 10 Nov 2026 08:27:18 +0000
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
Subject: Re: [PATCH v15 04/35] firmware: arm_scmi: Allow registration of
 unknown-size events/reports
Message-ID: <avLVZg-jqC5jXgY2@pluto>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
 <20261109091221.2532706-5-cristian.marussi@arm.com>
 <20261109140736.00007915@oss.qualcomm.com>
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
In-Reply-To: <20261109140736.00007915@oss.qualcomm.com>

On Mon, Nov 09, 2026 at 02:07:36PM -0800, Jonathan Cameron wrote:
> On Mon,  9 Nov 2026 09:11:50 +0000
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Allow protocols to register events with build-time unknown sizes: such
> > events can be declared zero-sized and let the core SCMI stack perform the
> > needed safe-net boundary checks based on the configured transport size.
> > 
> > Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > ---
> > v14 --> v15
> >  - better commenting
> 
> A few bits of feedback on the comments.
> 
> > v12 --> v13
> >  - improve variable naming
> > v10 --> v11
> >  - account for ktime_t field when checking boundary
> > v2 --> v3
> >  - split out of previous patch on protocol notifier
> >  - use max() instead of max_t()
> > ---
> >  drivers/firmware/arm_scmi/notify.c | 28 +++++++++++++++++++++++-----
> >  drivers/firmware/arm_scmi/notify.h |  8 ++++++--
> >  2 files changed, 29 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
> > index bc046f2f83a6..a30589c9b377 100644
> > --- a/drivers/firmware/arm_scmi/notify.c
> > +++ b/drivers/firmware/arm_scmi/notify.c
> > @@ -595,7 +595,16 @@ int scmi_notify(const struct scmi_handle *handle, u8 proto_id, u8 evt_id,
> >  	if (!r_evt)
> >  		return -EINVAL;
> >  
> > -	if (len > r_evt->evt->max_payld_sz) {
> > +	/*
> > +	 * Events with a zero max_payld_sz are sized to be of the maximum
> > +	 * size allowed by the transport: no need to be size-checked here
> > +	 * since the transport layer would have already dropped such
> > +	 * over-sized messages.
> 
> 'such' here to me refers to the first bit. That is, those that are "
> sized to be the maxim size allowed by the transport.
> 
> I'd just drop 'such' and have
> 	 * since the transport layer would have already dropped over-sized
> 	 * messages.
> 
> as that avoids this potential confusion.
> 
> > +	 * Note that, though, while this protects from buffer overruns, it is
> 
> Drop 'though'. Doesn't add anything and leads to odd flow to the sentence
> 
> > +	 * no more possible at this layer of the stack to detect zero-sized
> 
> 'not possible at this layer ..'
> 
> The 'no more' refers to code that isn't here if someone reads this code
> once the patch is merged.  So if you want to refer to what changed, keep
> it in the patch description not a comment.
> 

Thanks...it seems like the more I try to write clear and meaningful
sentences in English the more I mess up :D

Cristian
