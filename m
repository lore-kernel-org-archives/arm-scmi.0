Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B8082D8763;
	Fri,  5 Dec 2025 12:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764936856; cv=none; b=mc3eCIcDC1DbcoszIvYyVMJO/0jtOM3Uiv3KMEX8XeHPC2vgrzVlays+GidNASe4Fg1bIIor52IQTwkyeEPCPBpzcfp0a42/nDBNlZyc1Eqq9yU4DvpO8Q5Z1PYKgNULv47KGKYSdcjXDPh97KJrPc98mIGxtbYBr2Ki6ZCvEtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764936856; c=relaxed/simple;
	bh=tb9j+MukMaeGM/TPRkOUt9KMW4y2sripMM5/CzKQ7+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ehBiDNMAnZkKrL9G9qNxCqyr/lRjIgDqWYFzKjGPXiZmLPGQ0ZEwrhZyZHQHUFUkb1QQ6reLekWzY6znTPVXFm9Xu1/Qk5SKNmgG3DY5sGBpPJzOzaWKpMDT+ghnZBUEzZAK//yiKdlNa2EOC4ShD0slMziq3yjSNqb2s3eGq28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FBBC339;
	Fri,  5 Dec 2025 04:14:04 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A816F3F86F;
	Fri,  5 Dec 2025 04:14:10 -0800 (PST)
Date: Fri, 5 Dec 2025 12:14:07 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Artem Shimko <a.shimko.dev@gmail.com>
Cc: cristian.marussi@arm.com, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] firmware: arm_scmi: refactor reset domain handling
Message-ID: <20251205-calculating-unique-ibex-de824e@sudeepholla>
References: <aRW4PpPjVw1-melm@pluto>
 <20251123163557.230530-1-a.shimko.dev@gmail.com>
 <20251204-slick-granite-chameleon-58ebc2@sudeepholla>
 <CAOPX747pTsnTzKnaai-ytnmcf6reraTTSk+mssvHri4GMhCsOA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOPX747pTsnTzKnaai-ytnmcf6reraTTSk+mssvHri4GMhCsOA@mail.gmail.com>

On Fri, Dec 05, 2025 at 01:36:23PM +0300, Artem Shimko wrote:
> On Thu, Dec 4, 2025 at 7:26 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
> >
> > On Sun, Nov 23, 2025 at 07:35:57PM +0300, Artem Shimko wrote:
> > > Improve the SCMI reset protocol implementation by centralizing domain
> > > validation and enhancing error handling.
> > >
> > > Add scmi_reset_domain_lookup() helper function to validate
> > > domain ids and return appropriate error codes. Refactor all
> > > domain-specific functions to use this helper, ensuring consistent
> > > error handling throughout the reset protocol.
> > >
> > > Suggested-by: Cristian Marussi <cristian.marussi@arm.com>
> > > Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
> > > ---
> > >
> > > Hi Cristian,
> > >
> > > Thank you for suggesting! If it works for you I'll try to improve the others protocols.
> > >
> > > It was tested on my board in QEMU and on real hardware.
> > > The functionality didn't break, and peripherals that are reseted via SCMI work correctly.
> > >
> > > As an example, I can provide DMA test results (as one of the processor units dependent on SCMI reset).
> > >
> > > [    2.559040] dw_axi_dmac_platform 1000nda0.nda_dma_0: DesignWare AXI DMA Controller, nda channels
> > > [    2.569265] dw_axi_dmac_platform 1000nda0.nda_dma_1: DesignWare AXI DMA Controller, nda channels
> > > [    2.580601] dw_axi_dmac_platform 1000nda0.nda_dma_2: DesignWare AXI DMA Controller, nda channels
> > >
> > > # echo 2000 > /sys/module/dmatest/parameters/timeout
> > > # echo 1000 > /sys/module/dmatest/parameters/iterations
> > > # echo dma0chan0 > /sys/module/dmatest/parameters/channel
> > > [   95.917504] dmatest: Added 1 threads using dma0chan0
> > > # echo 1 > /sys/module/dmatest/parameters/run
> > > [  101.931372] dmatest: Started 1 threads using dma0chan0
> > > [  102.731009] dmatest: dma0chan0-copy0: summary 1000 tests, 0 failures 2508.42 iops 19706 KB/s (0)
> > >
> > > And vice versa:
> > >
> > > 1. Confirmed that the DMA module is non-functional without a proper reset via SCMI.
> > > Disabling the reset logic causes a system crash on first access to its registers.
> > >
> > > 2. Requesting a non-existent reset domain:
> > >
> > > [    2.463400] dw_axi_dmac_platform 1000nda0.nda_dma_0: error -EINVAL: Failed to deassert resets
> > > [    2.472091] dw_axi_dmac_platform 1000nda0.nda_dma_0: probe with driver dw_axi_dmac_platform failed with error -22
> > > [    2.482911] dw_axi_dmac_platform 1000nda0.nda_dma_1: error -EINVAL: Failed to deassert resets
> > > [    2.491553] dw_axi_dmac_platform 1000nda0.nda_dma_1: probe with driver dw_axi_dmac_platform failed with error -22
> > > [    2.502256] dw_axi_dmac_platform 1000nda0.nda_dma_2: error -EINVAL: Failed to deassert resets
> > > [    2.510735] dw_axi_dmac_platform 1000nda0.nda_dma_2: probe with driver dw_axi_dmac_platform failed with error -22
> > >
> > > --
> > > Regards,
> > > Artem
> > >
> > > ---
> > > ChangeLog:
> > >   v4: Add Suggested-by tag
> > >
> > >  drivers/firmware/arm_scmi/reset.c | 59 ++++++++++++++++++++-----------
> > >  1 file changed, 39 insertions(+), 20 deletions(-)
> > >
> > > diff --git a/drivers/firmware/arm_scmi/reset.c b/drivers/firmware/arm_scmi/reset.c
> > > index 0aa82b96f41b..9854a3016d13 100644
> > > --- a/drivers/firmware/arm_scmi/reset.c
> > > +++ b/drivers/firmware/arm_scmi/reset.c
> > > @@ -100,6 +100,7 @@ static int scmi_reset_attributes_get(const struct scmi_protocol_handle *ph,
> > >
> > >  static int
> > >  scmi_reset_domain_attributes_get(const struct scmi_protocol_handle *ph,
> > > +                              struct reset_dom_info *dom_info,
> >
> > Instead of changing this, ...
> >
> > >                                struct scmi_reset_info *pinfo,
> > >                                u32 domain, u32 version)
> > >  {
> > > @@ -107,7 +108,6 @@ scmi_reset_domain_attributes_get(const struct scmi_protocol_handle *ph,
> > >       u32 attributes;
> > >       struct scmi_xfer *t;
> > >       struct scmi_msg_resp_reset_domain_attributes *attr;
> > > -     struct reset_dom_info *dom_info = pinfo->dom_info + domain;
> > >
> >
> > ... You can just follow the pattern you have done everywhere else in this
> > change like:
> >
> > struct reset_dom_info *dom_info;
> >
> > dom_info = scmi_reset_domain_lookup(ph, domain);
> > if (IS_ERR(dom_info))
> >         return PTR_ERR(dom_info);
> >
> > Any particular reason for not doing that ?
> 
> Hi Sudeep,
> 
> Based on perf.c, I added this pattern only to functions that can be
> called externally with an invalid domain value.
> Therefore, I decided it would be better to change the signature of
> scmi_reset_domain_attributes_get (similar to
> scmi_perf_domain_attributes_get from pref.c)
> to ensure consistency across drivers when working with domain numbers.
> 
> If you believe this pattern should be used in
> scmi_reset_domain_attributes_get, I'll send you the next version of
> the patch.
>

No need to post yet, I fixed it up here[1], let's see if Cristian agrees
with that. Let me know if you are happy too with that change. I will rebase
at -rc1 and apply it officially then.

-- 
Regards,
Sudeep

[1] https://git.kernel.org/sudeep.holla/c/8bc55f21a345
