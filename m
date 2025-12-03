Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EC5E2FB97A
	for <arm-scmi@vger.kernel.org>; Wed,  3 Dec 2025 15:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764775297; cv=none; b=mQXTRFgOIOqkkXlhN9CYRauKYwAdMyJCpuQwBnu2qhyWeH4DScTz5S2JJESxe1F8lvqrY31RChgR0oBo98ZuCtkHitGiajUKz8q+Orsq1NwONhhl4Jflk/VwcgRc1v4oA3XrzTBbmdn9jxKh2L4U40y9bTHuz1DgjloWaBnshWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764775297; c=relaxed/simple;
	bh=1ir7+mFw84UXouSLedHZ85C0uuAmQVuNpDRdmMFVNQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVbVV4kVscYcREXlUopMpdwxX758icoEC/XAmWwVW5Rp3Hb5ev0F/7HLxdSVuMscwyCj7zrf0wuyZU4QBFn6znEfUWDELhWftM38riFjcNcnc+NOrYw3IjUHdcnctCoe5a2EKgJiR4UtobfNadR+uA9EhQfxxNX0cMMpeMUbNR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB733339;
	Wed,  3 Dec 2025 07:21:27 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 519FC3F59E;
	Wed,  3 Dec 2025 07:21:34 -0800 (PST)
Date: Wed, 3 Dec 2025 15:21:31 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/8] firmware: arm_scmi: Refactoring and enablement of
 ACPI PCC transport
Message-ID: <20251203-super-kagu-of-amplitude-fef078@sudeepholla>
References: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
 <87wm44aect.fsf@stealth>
 <20251126-camouflaged-delightful-cuckoo-ddeac8@sudeepholla>
 <877bv3n7x2.fsf@stealth>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <877bv3n7x2.fsf@stealth>

On Wed, Dec 03, 2025 at 11:04:09AM +0000, Punit Agrawal wrote:
> Hi Sudeep,
> 
> Sudeep Holla <sudeep.holla@arm.com> writes:
> 
> > I can create one but that is not strictly necessary. As mentioned in the
> > cover letter, the only dependency is on value of SCMI_PROTOCOL_TELEMETRY
> > ins `scmi_std_protocol` enumeration. Just add one and you must be able to
> > compile the series independent of Cristian series.
> 
> Thanks, I managed to get the patches building. Looking forward to the
> series progressing. If possible, do keep me in the loop for future
> updates.

Sure - I’ll try to remember to copy you on the next updates. I don’t have any
immediate plans, though, unless the spec moves into beta, changes come up, or
someone specifically requests important updates that would help them make
progress.

Do you have immediate plans to use this on a platform ? Or you are reviewing
just out of interest/curiosity 😉 ?

-- 
Regards,
Sudeep
