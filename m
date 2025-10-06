Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D289283FDF
	for <arm-scmi@vger.kernel.org>; Mon,  6 Oct 2025 15:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759764875; cv=none; b=F7YR5Rsusln+oIecZ73xYLagGSyBS/tAPx6YfXUUjyc/NyGc5ibtlQEgrrWPtfp8VvD8M7rBbK9rP5/P2uNqQxvHCCm8uWWwnHZKr/IIXJ6+NnLPENmU8chdQiCJJjc0LwZs//4ChFDrUTyzLwO5Ynuzif0ln0GNa5lpOdCc/w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759764875; c=relaxed/simple;
	bh=1Ej5fUHhBc/gG5PkCAdSapV5GY4xjh9yz9sYzLVDotw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dQ8vRsDlEcWW2UDpQbr34P0oR0bkZyQB/N/pGqeMOuPgBkGBdkdXQqMRSiA+SX0qOhy7UNXl4VFGb7wwCk0KxcX82rgmQN2Dahe4OVgW7EoxAQ9JWiJY1kFstMEnYs3XDHzfUYkZ+t/iTeve+IgNrwM/4AlGaTY2hecxe9Y3a6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BCA71515;
	Mon,  6 Oct 2025 08:34:25 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6AFC73F66E;
	Mon,  6 Oct 2025 08:34:32 -0700 (PDT)
Date: Mon, 6 Oct 2025 16:34:29 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>
Subject: Re: Add OEM extension for clk-scmi
Message-ID: <aOPhhYmWtXHBjYAO@pluto>
References: <PAXPR04MB8459F97453698D981B52BF38881AA@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459F97453698D981B52BF38881AA@PAXPR04MB8459.eurprd04.prod.outlook.com>

On Tue, Sep 30, 2025 at 01:22:15PM +0000, Peng Fan wrote:
> Hi All,
> 

Hi,

> This is to discuss the spread spectrum support for clk-scmi.  I think
> it is hard to provide a generic framework from scmi core level.
> Because oem extension varies per protocol. And most of the
> code added is in consumer driver side saying clk-scmi.c not
> the firmware/arm_scmi/clock.c.
> 
> Based on above, I am thinking to follow what arm-smmu
> implements(arm_smmu_impl_init), by calling a function
> scmi_clk_oem_init in probe.
> 
> And define a generic feature macro in enum scmi_clk_feats:
> SCMI_CLK_EXT_OEM_SSC_SUPPORTED,
> 
> Also define a new structure for OEM stuff:
> +struct scmi_clk_plat {
> +       int (*query_oem_feats)(const struct scmi_protocol_handle *ph,
> +                              u32 id, unsigned long *feats_key);
> +       int (*set_spread_spectrum)(struct clk_hw *hw,
> +                                  const struct clk_spread_spectrum *ss_conf);
> +};
> +
> 
> Add a new file clk-scmi-oem for up plat hooks implementation.
> 
> And add clk-scmi.h to move some code that would be shared
> between clk-scmi.c and clk-scmi-oem.c
> 
> This is just an idea, more code pieces as below, this does not
> pass compiling, just an idea in my mind.
> 
> If you think this is feasible, I will do a formal patch.
> 
> BTW: I will be on holiday in the following week. I will check
> email from time to time, but may not respond in time.
>  
> drivers/clk/clk-scmi-oem.c
> static int scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
>                                             struct clk_spread_spectrum *ss_conf)
> {
>         /* TODO */
>         return 0;
> }
> 
> static int scmi_clk_imx_query_oem_feats(const struct scmi_protocol_handle *ph,
>                                         u32 id, unsigned long *feats_key)
> {
>         /* TODO */
>         if ( the clk supports SSC)
>               *feats_key |= SCMI_CLK_EXT_OEM_SSC_SUPPORTED;
>         return 0;
> }
> 
> static const struct scmi_clk_plat scmi_clk_imx_plat = {
>         .query_ext_oem_feats = scmi_clk_imx_query_oem_feats,
>         .set_spread_spectrum = scmi_clk_imx_set_spread_spectrum,
> };
> 
> int scmi_clk_oem_init(struct scmi_device *dev, struct scmi_clk_plat *data)
> {
>         if (!strcmp(handle->version->vendor_id, SCMI_IMX_VENDOR) &&
>             !strcmp(handle->version->sub_vendor_id, SCMI_IMX_SUBVENDOR)) {
>                 *data = scmi_clk_imx_plat;
>         } else {
>                 /* Other SoC vendors (TI) */
>         }
> 
>         return 0;
> }
> 
> In clk-scmi.c, using the hook to update oem feats
> @@ -375,6 +388,9 @@ scmi_clk_ops_select(struct scmi_clk *sclk, bool atomic_capable,
>                                                  &val, NULL, false);
>                 if (!ret)
>                         feats_key |= BIT(SCMI_CLK_DUTY_CYCLE_SUPPORTED);
> +
> +               if (data->query_ext_oem_feats)
> +                       data->query_ext_oem_feats(sclk->ph, sclk->id, &feats_key);
>         }
> 
> @@ -313,11 +322,15 @@ scmi_clk_ops_alloc(struct device *dev, unsigned long feats_key)
>                 ops->set_duty_cycle = scmi_clk_set_duty_cycle;
>         }
>  
> +       if (feats_key & BIT(SCMI_CLK_EXT_OEM_SSC_SUPPORTED))
> +               ops->set_spread_spectrum = data->set_spread_spectrum;
> +
>         return ops;
>  }

In general seems a sensible approach...once you had a full series we can
reason about it better probably....and see how much more (or less) we
can/should generalize.

Thanks for this,
Cristian
