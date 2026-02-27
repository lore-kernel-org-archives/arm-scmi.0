Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BBD421885
	for <arm-scmi@vger.kernel.org>; Fri, 27 Feb 2026 14:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772203504; cv=none; b=Sl7aKpiV785bWORmcX0NuNMDp8PMUjWyPy1nGxZ8o2fJKMko3ISZyux92dKb0yAkyQhzx7Q69Fpg49tUt73EO2fZy7VjvgJD7YxL3CCl3Kan8uyOi66g4alf5saF4lX8LJefqvN2V+ou/vrT/jNvzpte6HZyCfAq3QmJoJCtjnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772203504; c=relaxed/simple;
	bh=eQ7qXAOyj81yfe/+OeMnHJ4AQMCfEecRpWABhPohsPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=oJj6/pROQK4kvQ7iOz2GZaXYs+tnqukwQNRU8lrvDZJwPoYKSpOAaLwVVU//QxTPi9rQKtCom9svsSdKHPZdDEYKn1jzkmOkmKrs7fTvfTRU6NyA596gThHORcCYK8U9ffnmVkj0PyBD0njP8fBAVbj1ozjP9hZaQFXzDLqzJKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Uua0fC8f; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uua0fC8f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772203502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pjpP6CrvDx4JRD336SFvsZfBjEjd+fqZc06LPodyXOg=;
	b=Uua0fC8fsiwn9RWG5DaRKfjOcJvXQwSOYIHFOiqLtwaFGksJ1pqx2f6uR9Ddt8n4lCzO41
	JLRy5n/t154LbGmfUlabxckKm2xSgvGvuXxu2a5QsHIuOCmkvSo3dtedKKR9tKD/eY58c5
	l54cVlJjVhVzwtII4SSM55yOsqzuqVE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-0SSEwENQOfuqANsojK_wMg-1; Fri, 27 Feb 2026 09:44:59 -0500
X-MC-Unique: 0SSEwENQOfuqANsojK_wMg-1
X-Mimecast-MFC-AGG-ID: 0SSEwENQOfuqANsojK_wMg_1772203499
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89546cbb998so201880946d6.0
        for <arm-scmi@vger.kernel.org>; Fri, 27 Feb 2026 06:44:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772203499; x=1772808299;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pjpP6CrvDx4JRD336SFvsZfBjEjd+fqZc06LPodyXOg=;
        b=h9j3tx7ROucvhFX802S5rkYzrVn0fv+C5B/jlzBqRBPmUTHsfp5pjdScu/y7x/VDQ6
         XA5YLMI5k+dqqh52rEr2TlW9/WhSxh8Q6MSng9+c19pGAIYCaSgeXpXkIuVZP8RXKlab
         kKay2VORmdarqRY5YSagbExVqYQJV6Oc4xsauPNSe85BwvaxdgT/pQyEeUt3AoN6T9ER
         Q9TWAZXaijAJeFeBOgzJTOAw2OeoxGQEZmHqgW+TZxpjFRn+w2ttaGAkmyAm6bFwxrNm
         Xi8lTBVSniKebS7dDdQMQRQJ0FammZGCf0ALV8EBEf23bDuy/h3ghG837NuXGm0mCMXB
         UsSA==
X-Forwarded-Encrypted: i=1; AJvYcCWORNxMOzapS4lXNYrL73aRp1y4x1hND/3uIZDfTbZ0M1t1m62j8StMopzUl5CKUEb8lLXkTCqHQw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/VjGBK1YzjPD4QtA/a/nta8oYpk3uwEVN0q2yoWBylwKXm3MR
	IWYQmYfx62DRbB63okTZumSxJ8qlTKKDtsjOP5yAbu5cj+JXxge9iqzCmTkhBoZ7PqEX1FwvWEw
	7sScn0x9zSNzsaHmXdIKs/kWjKvtfAfWv7LRJPWZ+tJIp4EkbEzq9wsVrc90/
X-Gm-Gg: ATEYQzzdU3KgFOzHvj2TqhgQpmwaE97O7gPjOpZj+n0pqAsK9ivRosIEZF665cQCZGm
	3LjYo33Jk+HqqOeJPgcEDtOJGKNmi5lqEc5+s20OkgwEbS+Cvx9eAaC3RaiNj6dbCkp0Rqy07Wk
	juXLo9eh9ymCGqH4qjsuUo+P4RoSBgAVQgpmXzxXLINZiC1aPXPJGqG+YXnl9Jdrlkg+HkYtLql
	sRzGLPMdLqyKi+N2dGIDBEzeoX3A34USBv+Xd53WmelkS/pJTMD0bRLcFW8ZgkeV4TevUFa+J6P
	67dPcxAFLATEH3LW9s0W0uERwa90Qr261BDWTCO94BVO83cCwyYleXzk8WIEb0n73hJ++77kIDy
	jMrI1et10gnBLrh7qZC7wu4Q4S9Gm9uDrMbc1aOtXD9Mf/zKVXnydFao7
X-Received: by 2002:a05:6214:2481:b0:88a:2360:7f15 with SMTP id 6a1803df08f44-899d1d86467mr45187676d6.12.1772203498551;
        Fri, 27 Feb 2026 06:44:58 -0800 (PST)
X-Received: by 2002:a05:6214:2481:b0:88a:2360:7f15 with SMTP id 6a1803df08f44-899d1d86467mr45187146d6.12.1772203498037;
        Fri, 27 Feb 2026 06:44:58 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c73a3130sm45123526d6.49.2026.02.27.06.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 06:44:57 -0800 (PST)
Date: Fri, 27 Feb 2026 09:44:55 -0500
From: Brian Masney <bmasney@redhat.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Fabio Estevam <festevam@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 01/13] clk: add new flag CLK_ROUNDING_FW_MANAGED
Message-ID: <aaGt5-ZWoXQ9Hz74@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
 <TY3PR01MB113465A96D1EEBB43C82C12A98673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <TY3PR01MB113465A96D1EEBB43C82C12A98673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cUd233eX9vWn_igj-ZdL7zlEF-wE9eTwbCrCSTW7M1Q_1772203499
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 27, 2026 at 12:00:55PM +0000, Biju Das wrote:
> > -----Original Message-----
> > From: linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org> On Behalf Of Brian Masney
> > Sent: 26 February 2026 18:17
> > Subject: [PATCH 01/13] clk: add new flag CLK_ROUNDING_FW_MANAGED
> > 
> > There are some clocks where the rounding is managed by the hardware, and the determine_rate() clk ops
> > is just a noop that simply returns 0. Add a new flag for these type of clocks, and update the clk core
> > so that the
> > determine_rate() clk op is not required when this flag is set.
> > 
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > 
[snip]
> >  drivers/clk/clk.c            | 24 +++++++++++++++++++++---
> >  include/linux/clk-provider.h |  2 ++
> >  2 files changed, 23 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c index
> > fd418dc988b1c60c49e3ac9c0c44aa132dd5da28..0a522a0817411c7f7c6e9cffd6f024e672a331a8 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -1557,6 +1557,20 @@ static int __init clk_disable_unused(void)  }
> > late_initcall_sync(clk_disable_unused);
> > 
> > +/**
> > + * clk_is_rounding_fw_managed - Check to see if clk rounding is handled
> > +by the
> > + * firmware.
> > + * @core: the clk to check
> > + *
> > + * Clks that have this flag enabled do not need to have a
> > +determine_rate() op
> > + * set, and will always return success for any rounding operation since
> > +the
> > + * firmware will deal with the rounding.
> > + */
> > +static inline bool clk_is_rounding_fw_managed(struct clk_core *core) {
> > +	return core->flags & CLK_ROUNDING_FW_MANAGED; }
> > +
> >  static int clk_core_determine_round_nolock(struct clk_core *core,
> >  					   struct clk_rate_request *req)
> >  {
> > @@ -1589,6 +1603,8 @@ static int clk_core_determine_round_nolock(struct clk_core *core,
> >  		req->rate = core->rate;
> >  	} else if (core->ops->determine_rate) {
> >  		return core->ops->determine_rate(core->hw, req);
> > +	} else if (clk_is_rounding_fw_managed(core)) {
> > +		return 0;
> >  	} else {
> >  		return -EINVAL;
> >  	}
> > @@ -1673,7 +1689,7 @@ EXPORT_SYMBOL_GPL(clk_hw_forward_rate_request);
> > 
> >  static bool clk_core_can_round(struct clk_core * const core)  {
> > -	return core->ops->determine_rate;
> > +	return core->ops->determine_rate || clk_is_rounding_fw_managed(core);
> >  }
> > 
> >  static int clk_core_round_rate_nolock(struct clk_core *core, @@ -3528,6 +3544,7 @@ static const
> > struct {
> >  	ENTRY(CLK_IS_CRITICAL),
> >  	ENTRY(CLK_OPS_PARENT_ENABLE),
> >  	ENTRY(CLK_DUTY_CYCLE_PARENT),
> > +	ENTRY(CLK_ROUNDING_FW_MANAGED),
> >  #undef ENTRY
> >  };
> > 
> > @@ -3906,7 +3923,7 @@ static int __clk_core_init(struct clk_core *core)
> > 
> >  	/* check that clk_ops are sane.  See Documentation/driver-api/clk.rst */
> >  	if (core->ops->set_rate && !core->ops->determine_rate &&
> > -	      core->ops->recalc_rate) {
> > +	      core->ops->recalc_rate && !clk_is_rounding_fw_managed(core)) {
> >  		pr_err("%s: %s must implement .determine_rate in addition to .recalc_rate\n",
> >  		       __func__, core->name);
> >  		ret = -EINVAL;
> > @@ -3920,7 +3937,8 @@ static int __clk_core_init(struct clk_core *core)
> >  		goto out;
> >  	}
> > 
> > -	if (core->ops->set_parent && !core->ops->determine_rate) {
> > +	if (core->ops->set_parent && !core->ops->determine_rate &&
> > +	    !clk_is_rounding_fw_managed(core)) {
> 
> >  		pr_err("%s: %s must implement .set_parent & .determine_rate\n",
> >  			__func__, core->name);
> >  		ret = -EINVAL;
> 
> 
> After applying patch#11, I get a message as you removed .determine_rate, Also it breaks display.
> 
> [    0.096414] __clk_core_init: .pll5_foutpostdiv must implement .round_rate or .determine_rate in addition to .recalc_rate

Thanks for testing. This happens because rzg2l_cpg_pll_clk_register()
doesn't have the new flag set. I'll fix this, and go through all of the
others again just to make sure I don't miss any others.

Brian

