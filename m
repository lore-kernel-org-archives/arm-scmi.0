Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2D7A476680;
	Tue, 18 Aug 2026 13:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787059534; cv=none; b=tTOg6v+5iM4D7rs78oMQYQ6uY6XQn6UdiLdEsvAbT4VpHh/SWg/lIR3FZCSRUBbx5dLjb97ygaRP2RO5cCo6vvLQJMr9eHC0MUbQw7d8VhOtFZNcMjOfBZf0r4Mvg5sMuNbPBMRgUV8c91vxYKjNicSpEMljxaQ9snpz2P6snF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787059534; c=relaxed/simple;
	bh=OJp14S+iPt1BXD5wTtSCszOJNvf4u0MI/zwVRUKoPrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ML47INoD92xU7GQUonRBk3Zzhcvchl+sjwBmxWQo/zWvuiCSE5EcvHFYZfc8T1qk1SdrSc2wG3c/Z/aQH4ahdLiHB0y5F2yzQ3ICIzVw+bn/u5sK5B2GQrNHKT8iI54puBgREmMiPs3JNYO3eeTCM8JjZUIXNPflsBc2lTV3fac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=BckAIkpT; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="BckAIkpT"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F1D91516;
	Tue, 18 Aug 2026 06:25:26 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B134A3F673;
	Tue, 18 Aug 2026 06:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787059530; bh=OJp14S+iPt1BXD5wTtSCszOJNvf4u0MI/zwVRUKoPrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BckAIkpTAjNcNf38AZcEvNZ++T3jG+At4QE+uMC7m/JRIClYis3jW2DSQTU8iq/qy
	 AXC98h6oCLGhELY2BDzcjM0+gleldOBKyaM1TEYkSLeV3HXd1FBdzrfkEW75l7ChsW
	 XRd56DO9Cx0LVQKr+JzQzTCdX7UfMmac2Nc0Mjvg=
Date: Tue, 18 Aug 2026 14:25:19 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Fayssal Benmlih <Fayssal.Benmlih@arm.com>
Cc: Cristian Marussi <Cristian.Marussi@arm.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"d-gole@ti.com" <d-gole@ti.com>,
	"david@kernel.org" <david@kernel.org>,
	Elif Topuz <Elif.Topuz@arm.com>,
	"etienne.carriere@st.com" <etienne.carriere@st.com>,
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>,
	"james.quinlan@broadcom.com" <james.quinlan@broadcom.com>,
	"jic23@kernel.org" <jic23@kernel.org>,
	"kas@kernel.org" <kas@kernel.org>,
	"kernel-team@meta.com" <kernel-team@meta.com>,
	"leitao@kernel.org" <leitao@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Lukasz Luba <Lukasz.Luba@arm.com>,
	"michal.simek@amd.com" <michal.simek@amd.com>,
	"peng.fan@oss.nxp.com" <peng.fan@oss.nxp.com>,
	Philip Radford <Philip.Radford@arm.com>,
	"puranjay@kernel.org" <puranjay@kernel.org>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	"sudeep.holla@kernel.org" <sudeep.holla@kernel.org>,
	"usama.arif@linux.dev" <usama.arif@linux.dev>,
	"vincent.guittot@linaro.org" <vincent.guittot@linaro.org>
Subject: Re: [PATCH v7 11/23] firmware: arm_scmi: Add Telemetry notification
 support
Message-ID: <aoRdP1u5lhUCclbU@pluto>
References: <20260802145618.1952804-12-cristian.marussi@arm.com>
 <53688831-E76D-48AB-99E7-4CE7C456620B@contoso.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53688831-E76D-48AB-99E7-4CE7C456620B@contoso.com>

On Mon, Aug 03, 2026 at 11:55:02PM +0100, Fayssal Benmlih wrote:
> Hi Cristian,
> 

Hi,

> A couple of notification payload sizing issues inline.
> 
> > 	/* At least sized as an empty notification */
> > 	if (payld_sz < sizeof(*p))
> > 		return NULL;
> >
> > 	r->timestamp = timestamp;
> > 	r->agent_id = le32_to_cpu(p->agent_id);
> > 	r->status = le32_to_cpu(p->status);
> > 	r->num_dwords = le32_to_cpu(p->num_dwords);
> >
> > 	if (r->num_dwords * sizeof(r->dwords[0]) > payld_sz)
> > 		return NULL;
> 
> payld_sz includes the fixed wire header containing agent_id, status and
> num_dwords. The array length is compared against that full size instead of
> the bytes remaining after sizeof(*p).
> 
> This can accept num_dwords values whose array extends beyond the received
> payload. The multiplication can also wrap before the comparison.
> 
> Please validate num_dwords using division after accounting for the fixed
> header, for example against:
> 
> 	(payld_sz - sizeof(*p)) / sizeof(p->array[0])
> 
> after first checking payld_sz >= sizeof(*p).
>

All of this has been revised in v10 accounting for the header and for
any possible 32bit wraparound...

> > static const struct scmi_event tlm_events[] = {
> > 	{
> > 		.id = SCMI_EVENT_TELEMETRY_UPDATE,
> > 		.max_payld_sz = 0,
> > 		.max_report_sz = 0,
> > 	},
> > };
> 
> With max_report_sz set to zero, the generic notification code allocates
> max_msg_sz bytes for the decoded report.
> 
> The decoded scmi_telemetry_update_report has a larger fixed header than
> the wire payload because it also includes ktime_t. Consequently, a
> maximum-sized valid wire payload requires more than max_msg_sz bytes after
> conversion and can overflow the report buffer.
> 
> Please provide or calculate enough space for the decoded report header
> plus the maximum dword array, or constrain the number of copied dwords to
> the actual report-buffer capacity.

Indeed, I will have to review this sizing...

Thanks,
Cristian
