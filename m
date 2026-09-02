Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FB14CCDD7
	for <arm-scmi@vger.kernel.org>; Wed,  2 Sep 2026 07:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335611; cv=none; b=Q5uiKNGcSRdM1umcX5Mb1ow4rDrPhF+Lcwm+qwAlEm88VNU4Tct/jBNnQy3rmgTgBck5c/NtveThF6/xJzbKsvHt8MFjGmP2tYFftjeMmJvVFiUqmeXr3uRswA731RWSOR1l2x1c14HU1Yr5ZteCLpShsPWQ7SdvBiH5BGImJkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335611; c=relaxed/simple;
	bh=APGU4/NOevv2ym0XHofD1SB/obJ8zWIjAmtMKWQyBo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Giu9yS6BXmVDCxNVX/RgxMp+v4i7emNFp6+ozDk8hS0yLYJEK8UXzXQ/fDcA0WJlOCxPj3eS8HISXor3FU3ih9JxP1zpSNbVxQeih4UP/jl5f4vNtM0MpR21X5q3xoUdyEr5QcJPxy3IwxCvOnrj33swCuKhc3fO+T1N55N+hJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vc0J79pm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vc0J79pm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB1D81F000E9;
	Wed,  2 Sep 2026 07:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788335609;
	bh=3z+ZKdpUO5kQlo8FkUeswbz/lpix4Q0oFibsP2sfKTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vc0J79pmnaY4b5aSn0th0j74FJnx08yZH+uHWZ/zWUYuzcjSFhZ6ODF4i9OkLT71G
	 r3mGYa4cmciktKRptB9e1ola4+PgyT8dQ1WhlZGUVuJ3LopJjjZ7aV57zs/+fIIxXH
	 Osly1VgQbmUCiy7P5UySDJHgCccE9wqMxJFKSt0qlAZYUeNWsMuLTB2METPW+peUE2
	 Iq3h6B4VwQ3b5Q7HNHy+gMxOXl5q/CnESAr58jcR8yJubzUlBgMnsNEx0fg3C7ZUMF
	 xa5scjG9nLQttglH6BQ+BrQznSNhSb4c3dirMFlHQ965r37FqcHvylUaHdLplwadDR
	 5+dWxPYlwGE+w==
Date: Wed, 2 Sep 2026 08:53:27 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
	Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 2/9] firmware: arm_scmi: Extend transport driver macro
 to support ACPI
Message-ID: <20260902-courageous-cuscus-of-advertising-ad28bf@sudeepholla>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
 <20260813-acpi_scmi_pcc-v3-2-cb6b88b4ebb3@kernel.org>
 <20260824100431.00002daf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824100431.00002daf@oss.qualcomm.com>

On Mon, Aug 24, 2026 at 10:04:31AM -0700, Jonathan Cameron wrote:
> On Thu, 13 Aug 2026 12:32:57 +0100
> Sudeep Holla <sudeep.holla@kernel.org> wrote:
> 
> > Extend the SCMI transport driver helper to support ACPI-based systems.
> > Introduce an internal helper macro that accepts both OF and ACPI match
> > tables, and expose two wrappers:
> > 
> >   - DEFINE_SCMI_TRANSPORT_DRIVER(...) for DT/OF transports
> >   - DEFINE_SCMI_ACPI_TRANSPORT_DRIVER(...) for ACPI transports
> > 
> > For ACPI, set the generated platform_driver .acpi_match_table via
> > ACPI_PTR().
> 
> ACPI_PTR() is often more trouble that it is worth because of need
> to guard the tables if they turn up in code where ACPI might not be present.
> 
> Now if someone fancied doing the work to make it work like pm_ptr()
> then that would nicer.  That one lets the compiler both see the stuff beyond
> the pointer, but also do dead code removal on it later.
> 
> Anyhow, doesn't actually matter either way here because you only use that
> with a non NULL pointer in a driver that is ACPI only.
> 
> If you really want to do it, maybe pair with of_match_ptr() but
> that one is even worse as maybe some will be having fun with SCMI and
> PRP0001.
> 

Agree with your analysis.

> Anyhow, random diversion aside, it makes no difference in practice.
> 

I just had to use it to keep build bots happy IIRC.

> > The ACPI wrapper relies on the firmware-node propagation
> > provided by the preceding change so fwnode lookups on the spawned
> > platform device see the correct firmware description.
> > 
> > Keep existing DT users unchanged while allowing transports to be probed
> > using struct acpi_device_id tables on ACPI platforms.
> > 
> > Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> 

Thanks!

-- 
Regards,
Sudeep
