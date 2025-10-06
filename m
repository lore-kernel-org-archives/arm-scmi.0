Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30C11B0F11
	for <arm-scmi@vger.kernel.org>; Mon,  6 Oct 2025 10:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759746676; cv=none; b=J5bO+uA9WAMcBx7aKEtQzzgqaQKZktZ9TEQ8AqUIGku8yKcTK5tOo1DC3R4+fVynBSvXL4ZENYZoAYugnkUNElxQeXNC2tV3b1Mpl2aEHQU2P+OZUSUJpHK4z5awSyVBmfmRMf9EzLR3MRkH03am//TZhRVdlK5p7ZHcA7lH2hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759746676; c=relaxed/simple;
	bh=CUlLGYsrOMO5y7+YtLsJFE113Y86TUGsXhzQK5/8Whs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JfOxg8t5Kj4R9qGpY3GEhC0TIcdo93w9p5yqR9x6cJoTdTorA5rHMUOW8mJJxZ0/9kOJLigqyUcw33iq2n3Brz8nJwe1gK4p4jmUNGPKHnuEWUJsQLnFzJKJ2+vy2EIZBZxBir4vzLiNPkUQWI6BzY9UHXisekk+LPV6ayA8Nfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jUUVuOzf; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jUUVuOzf"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 596AUoJH3590644;
	Mon, 6 Oct 2025 05:30:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759746650;
	bh=YNxkLY7MeeNIRqNfBBbWdRRSQLhwb4VrtfUN0xvtp5Y=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=jUUVuOzfYtNu38gHYO1ZdWTAj2CbVe/w5fbNnE8xTC3GcvaBfb5vhbHSpNYC/IOjn
	 dfOj4+Xu+Sg+XOSICtfhb0HnHZxojNo0rDoulEhL3W+1zMA6adgzKyUPbBzYdp3PE/
	 fr7Aenzpbp7DCL7XSLSiTkxkXuTNzXkoQki9qL2k=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 596AUoAd2168589
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 6 Oct 2025 05:30:50 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 6
 Oct 2025 05:30:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 6 Oct 2025 05:30:50 -0500
Received: from [172.24.233.14] (shark.dhcp.ti.com [172.24.233.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 596AUm0T3290495;
	Mon, 6 Oct 2025 05:30:48 -0500
Message-ID: <ddb57372-25f1-4b04-9901-52d417bc3994@ti.com>
Date: Mon, 6 Oct 2025 16:00:47 +0530
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Add OEM extension for clk-scmi
To: Peng Fan <peng.fan@nxp.com>, Sudeep Holla <sudeep.holla@arm.com>,
        Cristian
 Marussi <cristian.marussi@arm.com>,
        Stephen Boyd <sboyd@kernel.org>
CC: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>
References: <PAXPR04MB8459F97453698D981B52BF38881AA@PAXPR04MB8459.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Sebin Francis <sebin.francis@ti.com>
In-Reply-To: <PAXPR04MB8459F97453698D981B52BF38881AA@PAXPR04MB8459.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Peng

On 30/09/25 18:52, Peng Fan wrote:
> Hi All,
> 
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
>                                              struct clk_spread_spectrum *ss_conf)
> {
>          /* TODO */
>          return 0;
> }
> 
> static int scmi_clk_imx_query_oem_feats(const struct scmi_protocol_handle *ph,
>                                          u32 id, unsigned long *feats_key)
> {
>          /* TODO */
>          if ( the clk supports SSC)
>                *feats_key |= SCMI_CLK_EXT_OEM_SSC_SUPPORTED;
>          return 0;
> }
> 
> static const struct scmi_clk_plat scmi_clk_imx_plat = {
>          .query_ext_oem_feats = scmi_clk_imx_query_oem_feats,
>          .set_spread_spectrum = scmi_clk_imx_set_spread_spectrum,
> };
> 
> int scmi_clk_oem_init(struct scmi_device *dev, struct scmi_clk_plat *data)
> {
>          if (!strcmp(handle->version->vendor_id, SCMI_IMX_VENDOR) &&
>              !strcmp(handle->version->sub_vendor_id, SCMI_IMX_SUBVENDOR)) {
>                  *data = scmi_clk_imx_plat;
>          } else {
>                  /* Other SoC vendors (TI) */
>          }
> 
>          return 0;
> }
> 
> In clk-scmi.c, using the hook to update oem feats
> @@ -375,6 +388,9 @@ scmi_clk_ops_select(struct scmi_clk *sclk, bool atomic_capable,
>                                                   &val, NULL, false);
>                  if (!ret)
>                          feats_key |= BIT(SCMI_CLK_DUTY_CYCLE_SUPPORTED);
> +
> +               if (data->query_ext_oem_feats)
> +                       data->query_ext_oem_feats(sclk->ph, sclk->id, &feats_key);
>          }
> 
> @@ -313,11 +322,15 @@ scmi_clk_ops_alloc(struct device *dev, unsigned long feats_key)
>                  ops->set_duty_cycle = scmi_clk_set_duty_cycle;
>          }
>   
> +       if (feats_key & BIT(SCMI_CLK_EXT_OEM_SSC_SUPPORTED))
> +               ops->set_spread_spectrum = data->set_spread_spectrum;
> +
>          return ops;
>   }
> 
> Thanks,
> Peng.

Thanks for proposing the new approach. As approach gives each OEM add 
there plat specific handlers, this approach looks good to me.

Thanks
Sebin
