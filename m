Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4881C2E8E0B
	for <arm-scmi@vger.kernel.org>; Tue,  2 Sep 2025 21:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756849764; cv=none; b=N4aqpKXovWiskFoqXnT783SiuJEWcra4mK647FAQ8Zv16KNtxO2DQLPcMNy2VZ3I/f2amZpc7/h56J0lYgvyY/tWxoXAJlOa5x2CGiv7p6hqLeyJS8PUoDUrefYEVFQYkWeKUyeG8w90ynhc6UshOHrO1KmwzHGge+GkiGckW3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756849764; c=relaxed/simple;
	bh=neN4/Xko4YcDJzuw40O/2fBeVJJQtw7JPWEFeXXUNzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=FeuYqqVd71BJdLbMBC1pUr2xVhTFV/RWAOrUS8Ng1WXDWYmnHr8FNmMDAEwoJvw0a66zCOxr/0GmyxlDQV9p76V5fWNbbcHBkC+ZgdbMz0FJ+UQbWEwYfeNG4UsvjKv163ZuAjwezRz6h2KuM5DN4526UVIWFwN87HMjmHjKOm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DxT/Gj4q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DxT/Gj4q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756849762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hsHmX5g0hW2RuOd+pFemlGczz+YYMgcCD+tzI6cEH+Y=;
	b=DxT/Gj4qMk6XPrAdMMvLHM6wCVg+N1kwsv0ie69OmtY1rP/QbKpVDJYnLdvorzaRdZnr4g
	tCX47aMazn0goIu70OmDn6cfmDQ5AvfC0Po0OdOPZ5ykwF/RYX44cp5oiVb74smuoawF1O
	b1tS7/rnY/LAV97Phr8KwJ9spHob+Bg=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-w0IA46MCOvq0roFKZ-Tv-w-1; Tue, 02 Sep 2025 17:49:21 -0400
X-MC-Unique: w0IA46MCOvq0roFKZ-Tv-w-1
X-Mimecast-MFC-AGG-ID: w0IA46MCOvq0roFKZ-Tv-w_1756849761
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-71ff3e1256cso29571566d6.1
        for <arm-scmi@vger.kernel.org>; Tue, 02 Sep 2025 14:49:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756849760; x=1757454560;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hsHmX5g0hW2RuOd+pFemlGczz+YYMgcCD+tzI6cEH+Y=;
        b=H7fsaJ78NGE1FRJna1l4NnogonExJys5CKjArKwUaVhENty9vt/bB5QgNXx/bfHsJl
         ZxwBFb85jB1gspZr4WH7ts6UtNq3fYf10E9Zj7gi4qcWIbsUfgVLlmxArlvNzjYhlmOT
         2b0luiWAwVUHoIX5pEV19ysQLc5Z+0qaeYg0HT5W1jmkXavmO282G+vDFbwt8K5su/J1
         hdF7vcF+jpvI/yXmqZa3T4zREqhfCtUA7xSq0UZVSCRNzOMS3Sy1MkvtF5STgToK+dLx
         c94Zj8RbuZfX7iXwmtHTBeg1qu2cRcYqaqLgPGYowcwu6EOwnzquiFwuH6BwUpDsr/qQ
         OcBA==
X-Forwarded-Encrypted: i=1; AJvYcCUBtZEJmukUQGmNfuy7Uoda3uNCcF194KGurkHSF8ayVr1xAX029C5/pD3Au6z3HUz+NgRGKHmt4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxICIHKXQWkitsFQy1enDlrjTqgxaDgkzMbWdGXONrZqgbplbl
	ceftzfgASJZyeaInJHlrO/kRg7z/IW8uuzvwJADJFuMGieiENSRBtg804pBiGTXGEJCz6Sfw2N2
	ctwEHGNfV57nr5Xow+IXV2Xtw84Ob1e+5VWm1KhDVfN+8PfZhDOoFuVgZxjJsOAf/Mt2O
X-Gm-Gg: ASbGncs+etOaqiSxfNx6yvHC2kxDFRynVMaS67wnk8cIeN8Z84u8f0yFJrMAzSUDAFA
	HgI90BNmcK31tsAxgzEoln9KNr039dZk7dWwHRihN0cykDJ/HWffc58K9AeJUj3VUa9dVw5FBhx
	1qkRm58oBUO9fE9fDT9jSaucirat2SAUVtIoFm69JWqvNn5LIe7/nBPkts7u7yXHmKKW6N9VY6D
	G8nKZEfzzquZWSi1L2VfWHEW1Gk05UQMtkOysA9QDVFm1E/xJgDxkIQ+4VPl+K7HdIzYP/uq//9
	tAN1k3FpCpUurq5j2NQeUUTirlecFYYVI4oMT+ZQjlnJyHab5pt3KGI8DA+nHx9VCFkE28/YlND
	8ufhuv0lSVEuqLLKQUcU=
X-Received: by 2002:a05:6214:c67:b0:71b:f511:7228 with SMTP id 6a1803df08f44-71bf52ff870mr81595656d6.51.1756849760168;
        Tue, 02 Sep 2025 14:49:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwgG5MrCRiY+YEj7wHA6pGiT+So5GhjsjCrEdcrEastQ86ZBZAbzbVRYsDLAAf8z1862oXzQ==
X-Received: by 2002:a05:6214:c67:b0:71b:f511:7228 with SMTP id 6a1803df08f44-71bf52ff870mr81595306d6.51.1756849759591;
        Tue, 02 Sep 2025 14:49:19 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b475d63asm18667696d6.48.2025.09.02.14.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 14:49:19 -0700 (PDT)
Date: Tue, 2 Sep 2025 17:49:17 -0400
From: Brian Masney <bmasney@redhat.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] clk: conf: Support assigned-clock-sscs
Message-ID: <aLdmXcdJnoeXEJaQ@x1>
References: <20250901-clk-ssc-version1-v2-0-1d0a486dffe6@nxp.com>
 <20250901-clk-ssc-version1-v2-2-1d0a486dffe6@nxp.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250901-clk-ssc-version1-v2-2-1d0a486dffe6@nxp.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8GIbMunr_mYbhPVxC6bS8CCnpsHN59p4fhrVP9YbgCY_1756849761
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 01, 2025 at 11:51:46AM +0800, Peng Fan wrote:
> Parse the Spread Spectrum Configuration(SSC) from device tree and configure
> them before using the clock.
> 
> Each SSC is three u32 elements which means '<modfreq spreaddepth
> modmethod>', so assigned-clock-sscs is an array of multiple three u32
> elements.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/clk/clk-conf.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 
> diff --git a/drivers/clk/clk-conf.c b/drivers/clk/clk-conf.c
> index 303a0bb26e54a95655ce094a35b989c97ebc6fd8..dd6083597db3f8f27d86abf5640dfc3fb39a9b88 100644
> --- a/drivers/clk/clk-conf.c
> +++ b/drivers/clk/clk-conf.c
> @@ -155,6 +155,71 @@ static int __set_clk_rates(struct device_node *node, bool clk_supplier)
>  	return 0;
>  }
>  
> +static int __set_clk_spread_spectrum(struct device_node *node, bool clk_supplier)
> +{
> +	struct clk_spread_spectrum *sscs __free(kfree) = NULL;
> +	u32 elem_size = sizeof(struct clk_spread_spectrum);
> +	struct of_phandle_args clkspec;
> +	int rc, count, index;
> +	struct clk *clk;
> +
> +	/* modfreq, spreadPercent, modmethod */
> +	count = of_property_count_elems_of_size(node, "assigned-clock-sscs", elem_size);
> +	if (count <= 0)
> +		return 0;
> +
> +	sscs = kcalloc(count, elem_size, GFP_KERNEL);
> +	if (!sscs)
> +		return -ENOMEM;
> +
> +	rc = of_property_read_u32_array(node, "assigned-clock-sscs", (u32 *)sscs,
> +					count * 3);
> +	if (rc)
> +		return rc;
> +
> +	for (index = 0; index < count; index++) {
> +		struct clk_spread_spectrum *conf = &sscs[index];
> +		struct clk_hw *hw;
> +
> +		if (!conf->modfreq_hz && !conf->spread_bp && !conf->method)
> +			continue;
> +
> +		rc = of_parse_phandle_with_args(node, "assigned-clocks", "#clock-cells",
> +						index, &clkspec);
> +		if (rc < 0) {
> +			/* skip empty (null) phandles */
> +			if (rc == -ENOENT)
> +				continue;
> +			else
> +				return rc;
> +		}
> +
> +		if (clkspec.np == node && !clk_supplier) {
> +			of_node_put(clkspec.np);
> +			return 0;
> +		}
> +
> +		clk = of_clk_get_from_provider(&clkspec);
> +		of_node_put(clkspec.np);
> +		if (IS_ERR(clk)) {
> +			if (PTR_ERR(clk) != -EPROBE_DEFER)
> +				pr_warn("clk: couldn't get clock %d for %pOF\n",
> +					index, node);
> +			return PTR_ERR(clk);

This chunk can be replaced with dev_warn_probe(). Sorry I missed that in
v1. Otherwise the rest looks good to me. With that fixed:

Reviewed-by: Brian Masney <bmasney@redhat.com>

