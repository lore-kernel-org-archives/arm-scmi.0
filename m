Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8C83F0AB8
	for <arm-scmi@vger.kernel.org>; Thu,  3 Sep 2026 06:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417391; cv=none; b=tvyRCuHTFS2ncN7G/0UmeRSa7TWoZ/6sc2cqCndFqi6MbzSKYkBDH7gZ4SwnVWBxItvMd4oBftXNP7jr2LT7EZyVRSWxkPq84Gh4eQhvcdp6Iku9i4su56jBp0nDdn2qIsa7yKSiubbEZ9AMpm3jiRgDNZx3l9NoA4xFHgrYE6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417391; c=relaxed/simple;
	bh=FYHdMbOo5eFtOhzgrcgHm0OA4rrcvsZ+kyux6Ex/q8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7sSoMyWKNVEVPmWWywBGHWEzB0Fof2f6Yt1qTSzb1AP1iRqdCHKXbTDfIG/GtcQ5sE4h72vBV1b1N7Rk4sX3lIbx58Xym37E280lqkHaCBz11YaZRVRNcnVnb/bA5YMcm6Z2pZCkmyHQTR7/mSQZ3oBheU92teP81kd5U3Mevc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MH239CTi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MH239CTi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 563321F00A3D;
	Thu,  3 Sep 2026 06:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788417388;
	bh=1oSBgoYfNOzoZBnBYgZmCcAIw6EdAM/KqcKm0iKAiHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MH239CTiZgay0S7dLaw0NUlUNa4TH3unGis4leA3h2CZk5LP6mYoMM2Luzwliaa4U
	 6WIXdL72iHSuGskBN44fCLh8EvprRWx/N4sVvvQT/MOtJPwGrlXkKA0enKy+l09ZK2
	 7cqzNSfCq9fL+S4cYzRQnBBDP3SsZ4OqzQzTcUY3TzkeI6OCzcUOeidge5vucWHdQb
	 6eejC6aKvzXmSkgV8PEwZH+y/vbgKJ3aE4EOV1heD8ylVDZQpcbR97G+k1fTojANX/
	 IkwazoZPqZgqycX/yQYanApPMwe3YsSV5cwIW5pib4VPFhxnCxzVQ9w3WcCCDQhiHg
	 f9fKWFIGqi0qA==
Date: Thu, 3 Sep 2026 07:36:25 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>, kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 3/9] firmware: arm_scmi: Convert OF-only paths to
 generic fwnode in SCMI core
Message-ID: <20260903-infrared-bee-of-popularity-ede87a@sudeepholla>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
 <20260813-acpi_scmi_pcc-v3-3-cb6b88b4ebb3@kernel.org>
 <20260824103929.00004912@oss.qualcomm.com>
 <20260902-funky-tarsier-of-competence-0ae6ab@sudeepholla>
 <20260902162911.0000761f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902162911.0000761f@oss.qualcomm.com>

On Wed, Sep 02, 2026 at 04:29:11PM -0700, Jonathan Cameron wrote:
> On Wed, 2 Sep 2026 14:39:31 +0100
> Sudeep Holla <sudeep.holla@kernel.org> wrote:
> 
> > On Mon, Aug 24, 2026 at 10:39:29AM -0700, Jonathan Cameron wrote:

[...]

> > > 
> > > There are no early exits yet and I can't see any added later in the series.
> > > So the scoped bit is irrelevant.  I don't mind the change on basis of
> > > hardening or similar but it needs a comment in the patch description to 
> > > justify that.
> > >   
> > 
> > This is mainly to release the reference taken in
> > fwnode_get_next_available_child_node(). It is taken explicitly via
> > fwnode_handle_get() before scmi_create_protocol_devices() as discussed
> > below.
> 
> When the loop continues to normal termination the puts are all there
> anyway as part of the iterators.  The _scoped case just deals with
> early exits via break or return.

You're right. For some reason I conflated the iterator-owned reference 
won't be released and _scoped version is needed. This loop has no early
exit, so I will use the non-scoped iterator here. Thanks again.

-- 
Regards,
Sudeep
