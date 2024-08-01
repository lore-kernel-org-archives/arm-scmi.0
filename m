Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95B331494A4;
	Thu,  1 Aug 2024 19:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722540159; cv=none; b=RqP9ZE37ntd9/Di5Y4HnGC2DfIOhYy2LHBCY5lnaYwDlHg7udNWdEAb+LWuwnmEgg4F+phV2eLDxwqWv6p2sCy6NGO/nuwwf6NG7nwtVIZsH9fmeXOeR12rtIhgnuVvLu/b9LJmQ1L5XdwqkZWeOi3TizywJcNIJcq5U9tT/N3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722540159; c=relaxed/simple;
	bh=+hQ8iigQI9cYcudw5KPRGp2ovawK9BwQRJRwF02Pgd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H6wazDrsLh+KTzIM9F6CY5Zv6GMyjwkR4h7fjeEpPqBY1OuPZKJtxNVNnVCmH96SJDicBMWPsCT+sod3IFvzSWmR/7ScRv49BLAvGgbmHDcYizjrE2ogO2up1DB+mn7CFIKCDIPj3FE4HQL1BJuecnS8OQiR+z5WLClIMYTCkCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF1CB1007;
	Thu,  1 Aug 2024 12:23:02 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE0573F64C;
	Thu,  1 Aug 2024 12:22:34 -0700 (PDT)
Date: Thu, 1 Aug 2024 20:22:32 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	quic_nkela@quicinc.com, ptosi@google.com, dan.carpenter@linaro.org,
	souvik.chakravarty@arm.com,
	Etienne Carriere <etienne.carriere@foss.st.com>
Subject: Re: [PATCH v3 7/9] firmware: arm_scmi: Make OPTEE transport a
 standalone driver
Message-ID: <ZqvgeKGd2ag5YQA4@pluto>
References: <20240730133318.1573765-1-cristian.marussi@arm.com>
 <20240730133318.1573765-8-cristian.marussi@arm.com>
 <3f9a73fc-e14e-42c5-9805-0d23b9f158ef@kernel.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f9a73fc-e14e-42c5-9805-0d23b9f158ef@kernel.org>

On Wed, Jul 31, 2024 at 08:12:16AM +0200, Krzysztof Kozlowski wrote:
> On 30/07/2024 15:33, Cristian Marussi wrote:
> > Make SCMI OPTEE transport a standalone driver that can be optionally
> > loaded as a module.
> > 
> > CC: Etienne Carriere <etienne.carriere@foss.st.com>
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > ---
> 
> >  
> > -const struct scmi_desc scmi_optee_desc = {
> > -	.transport_exit = scmi_optee_exit,
> > -	.ops = &scmi_optee_ops,
> > -	.max_rx_timeout_ms = 30,
> > -	.max_msg = 20,
> > -	.max_msg_size = SCMI_OPTEE_MAX_MSG_SIZE,
> > -	.sync_cmds_completed_on_ret = true,
> > -};
> > +MODULE_ALIAS("scmi-transport-optee");
> 
> This looks duplicated with module name.

Yes, my bad, I'll drop this or use something more useful.
Cristian
