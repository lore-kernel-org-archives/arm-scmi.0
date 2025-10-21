Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2E0231845
	for <arm-scmi@vger.kernel.org>; Tue, 21 Oct 2025 09:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761039029; cv=none; b=Ppw07H+4B8lgFulx/c6WC69C3/pIL5UeeovRTpXkBigzfMaYaW895wh+5TH/wpAGnFy00bJV7sNBx6tKLN7YCdBLFSbVi4+cmKveRETsgbjzkCbrgiOXfmSagdIanKHupEsL1l/mQktBBhhJKGDmjjUzjlMEIUazjXIt6eJSqos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761039029; c=relaxed/simple;
	bh=2f0PgiHw4EIvoa2SJ2vPFnnFI3SffW+bnitcDvOVAV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TfW/Q7Px6Mo+GwU8iHDkyOFWShaOXokiEbuQFgG4zyoRu0CBUnp9YfHxaXDbYdlcS+lx4/GInYff/AllySc3bc+Cr1nBXGodE6uexUvKt8N1pb9Kv/c1Er7LfSz0c4Rr7ZKyHo7Yc0G6fMwLHvdvkh4b+AnMTkY50NpqQB1fWbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E99C1007;
	Tue, 21 Oct 2025 02:30:19 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A00D3F66E;
	Tue, 21 Oct 2025 02:30:26 -0700 (PDT)
Date: Tue, 21 Oct 2025 10:30:23 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, <arm-scmi@vger.kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 7/8] firmware: arm_scmi: transport: Add ACPI PCC transport
Message-ID: <20251021-heron-of-majestic-recreation-ac04cd@sudeepholla>
References: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
 <20251017-acpi_scmi_pcc-v1-7-0adbab7709d9@arm.com>
 <20251020183731.000023fa@huawei.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251020183731.000023fa@huawei.com>

On Mon, Oct 20, 2025 at 06:37:31PM +0100, Jonathan Cameron wrote:
> On Fri, 17 Oct 2025 14:23:50 +0100
> Sudeep Holla <sudeep.holla@arm.com> wrote:
> 
> > Introduce a new SCMI transport that uses ACPI PCCT (PCC) subspaces via
> > the Linux PCC mailbox layer. The driver parses ACPI _DSD data to map
> > protocols to PCC subspace UIDs, supports shared TX/RX channels, and
> > optionally sets up a P2A channel for notifications.
> > 
> > Key points:
> > - new CONFIG_ARM_SCMI_TRANSPORT_PCC option
> > - integration with SCMI core via scmi_desc and transport ops
> > - response/notification fetch from PCC shared memory header/payload
> > - ACPI device matching and registration via the ACPI transport macro
> > 
> > This enables SCMI to be exercised over PCC on ACPI platforms.
> > 
> > Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> Hi Sudeep,
> 
> Just a very quick look in what is definitely a drive by style review
> A few things below.
> 

Thanks for the quick look though, you have found quite a few things to
fix 😄.

-- 
Regards,
Sudeep
