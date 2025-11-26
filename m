Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47E341EA7CC
	for <arm-scmi@vger.kernel.org>; Wed, 26 Nov 2025 14:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764167496; cv=none; b=hvEcxe6Qvwuch+yYvy8tR4a7+iPF2EqabbrwbzYcCGDQn9u0gEGXZd+qJnCbE3ag7Oh8wW5WQANPwThX2ltuk9O5ulYwY0HlzmM54Yb+DyKIaRhecOxFLxXfMqALBRS7W9QTtQfJOI68HErhnONo0DsAbR5ybvQf6/MBlwhcwGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764167496; c=relaxed/simple;
	bh=azHj6fZ+b5mILcxU7UmAL6wP4NHK9lDfGDb/K6arLYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A6YL3gTay9azPrClEpSXu+BI0MRjvhoa3Nk+ZgGcwOMABoObIkpoN7BSCSG24eGgoSdC3kuZmHXqkYJ6JKoqyoTKaD18X0AC04MQOpZqZby8JYHObQO3EE+KSr/FnnJCcIhZbeiZW6spiCkJDbBOcjuH7yb7544UwIZGF+jU2zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0096A168F;
	Wed, 26 Nov 2025 06:31:27 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A2D83F73B;
	Wed, 26 Nov 2025 06:31:33 -0800 (PST)
Date: Wed, 26 Nov 2025 14:31:30 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/8] firmware: arm_scmi: Refactoring and enablement of
 ACPI PCC transport
Message-ID: <20251126-camouflaged-delightful-cuckoo-ddeac8@sudeepholla>
References: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
 <87wm44aect.fsf@stealth>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wm44aect.fsf@stealth>

On Wed, Nov 05, 2025 at 11:49:38AM +0000, Punit Agrawal wrote:
> Hi Sudeep,
> 
> Sudeep Holla <sudeep.holla@arm.com> writes:
> 
> > The SCMI can be utilized in systems using either the FDT or ACPI specification.
> > While FDT-based systems can natively use SCMI, ACPI-based systems often
> > need to abstract the functionality provided by SCMI under ASL methods.
> > So far, there has been no need to support SCMI natively on ACPI systems.
> >
> > However, with the addition of a few new protocols such as Powercap and Telemetry,
> > which lack abstractions in the ACPI specification, there is now a need to
> > run SCMI natively for those use cases.
> >
> > This patch series introduces ACPI PCC transport support for the Arm SCMI
> > framework, alongside several foundational refactors and enhancements to
> > achieve firmware-node neutrality between Device Tree (DT) and ACPI systems.
> >
> > The key changes include:
> >
> > 1. ACPI/DT abstraction and fwnode transition
> >
> >    Converted the core SCMI code to use `fwnode_handle` instead of DT-specific
> >    structures, ensuring seamless operation across both ACPI and DT
> >    environments. All property lookups, child enumeration, and device
> >    association paths have been updated accordingly.
> >
> > 2. Unified transport registration for ACPI and DT
> >
> >    Extended the SCMI transport driver macros to support ACPI match tables,
> >    enabling transports to probe using ACPI device IDs while maintaining
> >    backward compatibility with DT-only systems.
> >
> > 3. Protocol device initialization and refactoring
> >
> >    Refactored the protocol device creation and validation logic into a new
> >    helper for improved readability and maintainability. Enhanced the
> >    initialization logic to handle ACPI-based SCMI devices without explicit
> >    child fwnodes.
> >
> > 4. Introduction of ACPI PCC transport
> >
> >    Added a new SCMI transport driver leveraging ACPI PCCT (Platform
> >    Communications Channel Table) subspaces via the Linux PCC mailbox
> >    framework. This enables SCMI communication over PCC on ACPI-based
> >    platforms.
> >
> > Collectively, these changes lay the groundwork for robust SCMI operation on
> > ACPI platforms, achieving near parity with DT systems where applicable,
> > while enabling the new PCC transport path for firmware communication.
> 
> I was interested in taking a closer look at the patches here but they
> have a dependency on support for the telemetry protocol patches. I get a
> compile error.
> 
> I was wondering if you have a branch with the dependencies included. Are
> the v1 telemetry support patches[0] the right version to be using?
>

I can create one but that is not strictly necessary. As mentioned in the
cover letter, the only dependency is on value of SCMI_PROTOCOL_TELEMETRY
ins `scmi_std_protocol` enumeration. Just add one and you must be able to
compile the series independent of Cristian series.

-- 
Regards,
Sudeep
