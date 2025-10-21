Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F02E121CC60
	for <arm-scmi@vger.kernel.org>; Tue, 21 Oct 2025 09:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761037625; cv=none; b=RwDykk3Nj7WeK2VwK2/Psg/VtNEWaSVGDK4QmI1YxQU5EbgRvUtalF3pv/Ue5VF0n3bATl3GmCfyU+9sGqkLllP/YNd1hGyYONWqt/FFNWizhMoLrXDpMzkFcwmfD+PP9X3XsVUTox6HUOt+l5qZ7BPz1GIaTKx8oxo5BofQEBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761037625; c=relaxed/simple;
	bh=s4Dk5VX8HH3/APyELQlVA+k6uxNo0m4d5HBJpA74y30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b/D3Tdim4UqKebyaLkm7+AtAKsbOvEoKg3D3A8L6D5IBKCZlsryDQMZP9dIMKBEa5QvGCyJ87MElwUrKlAslkU3XxCk1NAXCQwtxs5TS3GHBkRJXncuKt1GPkX4gANeKz5G1xwPk74ggPNnMzwA+hMQgJqsrwlVF2oODMePQeks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 552D11063;
	Tue, 21 Oct 2025 02:06:55 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 30B673F66E;
	Tue, 21 Oct 2025 02:07:02 -0700 (PDT)
Date: Tue, 21 Oct 2025 10:06:59 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, <arm-scmi@vger.kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/8] firmware: arm_scmi: Extend transport driver macro to
 support ACPI
Message-ID: <20251021-caped-cherry-millipede-af7fee@sudeepholla>
References: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
 <20251017-acpi_scmi_pcc-v1-2-0adbab7709d9@arm.com>
 <20251020181106.0000724f@huawei.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020181106.0000724f@huawei.com>

On Mon, Oct 20, 2025 at 06:11:06PM +0100, Jonathan Cameron wrote:
> On Fri, 17 Oct 2025 14:23:45 +0100
> Sudeep Holla <sudeep.holla@arm.com> wrote:
> 
> > Extend the SCMI transport driver helper to also support ACPI-based
> > systems. Introduce an internal helper macro that accepts both OF and
> > ACPI match tables, and expose two wrappers:
> > 
> >   - DEFINE_SCMI_TRANSPORT_DRIVER(...)      -> DT/OF wrapper (unchanged ABI)
> >   - DEFINE_SCMI_ACPI_TRANSPORT_DRIVER(...) -> ACPI wrapper
> > 
> > For ACPI, the generated platform_driver now sets .acpi_match_table via
> > ACPI_PTR() so that builds without CONFIG_ACPI remain safe (becomes NULL).
> In general it doesn't normally matter if ACPI_PTR() isn't used.
> 
> What specifically is this preventing?  If CONFIG_ACPI isn't set then we'll never
> use those paths anyway.  Using ACPI_PTR() tends to need ifdef magic or
> __maybe_unused markings that are rarely worth the effort for these tiny
> tables.
> 

You are right, my bad. I had assumed acpi_device_id is defined only when
CONFIG_ACPI=y which clearly is not the case. I will update the last patch
and this commit message accordingly.

-- 
Regards,
Sudeep
