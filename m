Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C8474040
	for <arm-scmi@vger.kernel.org>; Tue,  2 Sep 2025 22:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756850481; cv=none; b=VhvfiQpa8EAKKniD+6OA56McT0dC0y2OkR2ruw2yu6RpkcbNxiRU3CKMevDP1HmaBfT/n0qm2DqFLpUJQdSrc83xrVOCzDlHobPBClqbsRTGjORj3uyglvgpO4vaUuIyFtOjDU+mjLzHkaFL2sjcoxLWsJc7mLwER79n85nGmXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756850481; c=relaxed/simple;
	bh=1N0OiT1hYOKXa5OlHLueqrsCjuk6IWGRfgcwjdOYwNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=BxcrMBEnv2UHBU5k0F5iNcdBUQvEuPxpIz03eXxpSI27KGVlzLCTL5w937WWtVv5SFlmcq6SKtYfI4NRGK5KrdJPS02iOq+CuHK+fZsFt9a6i3NUjRCrvqXY9PQOtQcbkJIk9FrbBtQNrkr7maEyNTq2jRpJUxu2EvxaTb4uL10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S8ALRLwb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S8ALRLwb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756850478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SovXZeidkxb+f2nxu3IUvrmsRI1+mbgwRLBssLQhxNA=;
	b=S8ALRLwbPrEbayi92AyR/gIYcU0iCbP43z5Yt+LFxAK4uTJZGyjhyDLh1QgEpAIghpZ8y7
	+ICxLOTG2B2bI6FR9941VNVc2QcotH1NNzA1dtdFt+rRl/af7Tamnlqywhl1cYs+TFVzZR
	cjvpU5zsBOyGfVRGgwZX/T7p9qaGbtY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-dOvuPv4APka59VZ4-okKgg-1; Tue, 02 Sep 2025 18:01:17 -0400
X-MC-Unique: dOvuPv4APka59VZ4-okKgg-1
X-Mimecast-MFC-AGG-ID: dOvuPv4APka59VZ4-okKgg_1756850477
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-803d02bd834so256231485a.1
        for <arm-scmi@vger.kernel.org>; Tue, 02 Sep 2025 15:01:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756850477; x=1757455277;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SovXZeidkxb+f2nxu3IUvrmsRI1+mbgwRLBssLQhxNA=;
        b=fONa3XsGGww/0TxFS9JP6hOMRNxlkblirCLVkI3oF9QR2zhCgLSjA+85O22ogZ17Xa
         vBuuAGb9hIyzpJUqr3hnxSi4Y93+Q8d6hwkMMpvXnNoST1UzuhTr2/e0dQq7iHTRfleH
         1BaxWvJg7XjPI94n2IBYuao35Bd+NZ9PA1jF7AF9A010AxS4QnZ/KKBuOinauOa2pLqs
         AAf7X8hbWHvhCOTIzTiI72ObMGKjIzqJOIj8jXp8sQJc6/o4PNESMj6YVxLObNFAPphN
         LavPqnlID/gr3Sjz1l0LBtXEKz3NGsXhIV72sqEnNC+UeSFGd6U5PNqwDbrcpsh21v+3
         uAXA==
X-Forwarded-Encrypted: i=1; AJvYcCU7F/AkA/t92x+YX5K5gtWOgqFXpvp6skFNzDUHX75Sb1MEjJYedqvXnn5AfUtE/07dtWZ/E1Q/8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIqv0cIm/5X9kMUXH4ih24VcHqAUyTmNatmgZUJx0ve05p/9eC
	hMHhn8/ou42rHn+vMo3iL8LQJ1kYpo6SYxXYLHdIWZJ53Feq6t8NsOuFg2SKUirKWhMuSu6ec8G
	pYuMSxk01xC26eN2TBjT/iTfjkoASmk9+p/jpibL4dIVAhSF4KQZqaAJPqnSs
X-Gm-Gg: ASbGncuSMYx668QlVv15tC3YaOMSwulxCb7Ru4lgx9BQZurk0/EwG6UGjSsOdMwSsGE
	M6Pp9GP021Oxu/wOMk2bcRngaGGuPLyhqR6CI1wcdY8QJ0xqA4XsZ4AkauMs2GmhpXnA2Ph+B2a
	BsjdOPGEUl6w4XnzmjeFVWZdXtD8JvGw65eVEQNoyBOBzTi80glR6JTyou0vDmXzXnxY1RjiUoV
	UaYZCBOGXoVywv5aRUdLfenNI68MdxPt4ZWZJLEPhqHaj8EN77EeIdGnyuFGMa/0Tx6Vs4NJs9W
	T+1WDU9UGydRrZyTZKLPb1LDiuFtMER7qLDhpmuWFKXV6HUPEvUyWLYn8tTxiryiWukxQ0YMPgS
	+BivXHivz2LQ7stfiEEU=
X-Received: by 2002:a05:620a:3182:b0:7e8:6955:90fe with SMTP id af79cd13be357-7ff2aa225d7mr1459467685a.42.1756850477004;
        Tue, 02 Sep 2025 15:01:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0PC62ojWiM/vLd9z8Xwp9bJyLjgplk2IMzQjw47Isk4CcYNDohrklNKP/ZniSDGJVijAGoA==
X-Received: by 2002:a05:620a:3182:b0:7e8:6955:90fe with SMTP id af79cd13be357-7ff2aa225d7mr1459458685a.42.1756850476355;
        Tue, 02 Sep 2025 15:01:16 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80aaacfeb4bsm15561385a.41.2025.09.02.15.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 15:01:15 -0700 (PDT)
Date: Tue, 2 Sep 2025 18:01:12 -0400
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
Subject: Re: [PATCH v2 1/3] clk: Introduce clk_hw_set_spread_spectrum
Message-ID: <aLdpKEwfqP448eMd@x1>
References: <20250901-clk-ssc-version1-v2-0-1d0a486dffe6@nxp.com>
 <20250901-clk-ssc-version1-v2-1-1d0a486dffe6@nxp.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250901-clk-ssc-version1-v2-1-1d0a486dffe6@nxp.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ywJghfAVr5Kwu-AwtZD8f0jmvjFrB9VwHyOU0HraQ-c_1756850477
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 01, 2025 at 11:51:45AM +0800, Peng Fan wrote:
> Add clk_hw_set_spread_spectrum to configure a clock to enable spread
> spectrum feature. set_spread_spectrum ops is added for clk drivers to
> have their own hardware specific implementation.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/clk/clk.c            | 26 ++++++++++++++++++++++++++
>  include/linux/clk-provider.h | 26 ++++++++++++++++++++++++++
>  2 files changed, 52 insertions(+)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index b821b2cdb155331c85fafbd2fac8ab3703a08e4d..06db8918a1b35e3280e565272bc4603a88295a92 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2802,6 +2802,32 @@ int clk_set_max_rate(struct clk *clk, unsigned long rate)
>  }
>  EXPORT_SYMBOL_GPL(clk_set_max_rate);
>  
> +int clk_hw_set_spread_spectrum(struct clk_hw *hw, struct clk_spread_spectrum *conf)
> +{
> +	struct clk_core *core;
> +	int ret;
> +
> +	if (!hw)
> +		return 0;
> +
> +	core = hw->core;
> +
> +	clk_prepare_lock();
> +
> +	ret = clk_pm_runtime_get(core);
> +	if (ret)
> +		goto fail;
> +
> +	if (core->ops->set_spread_spectrum)
> +		ret = core->ops->set_spread_spectrum(hw, conf);
> +
> +	clk_pm_runtime_put(core);
> +
> +fail:
> +	clk_prepare_unlock();
> +	return ret;
> +}
> +
>  /**
>   * clk_get_parent - return the parent of a clk
>   * @clk: the clk whose parent gets returned
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 630705a47129453c241f1b1755f2c2f2a7ed8f77..251035a96244c34ff2cbaaa349a08f4ea094e7fc 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -84,6 +84,24 @@ struct clk_duty {
>  	unsigned int den;
>  };
>  
> +#define	CLK_SSC_NO_SPREAD	0
> +#define	CLK_SSC_CENTER_SPREAD	1
> +#define	CLK_SSC_UP_SPREAD	2
> +#define	CLK_SSC_DOWN_SPREAD	3
> +
> +/**
> + * struct clk_spread_spectrum - Structure encoding spread spectrum of a clock
> + *
> + * @modfreq_hz:		Modulation frequency
> + * @spread_bp:		Modulation percent in permyriad
> + * @method:		Modulation method
> + */
> +struct clk_spread_spectrum {
> +	u32 modfreq_hz;
> +	u32 spread_bp;
> +	u32 method;
> +};
> +
>  /**
>   * struct clk_ops -  Callback operations for hardware clocks; these are to
>   * be provided by the clock implementation, and will be called by drivers
> @@ -178,6 +196,11 @@ struct clk_duty {
>   *		separately via calls to .set_parent and .set_rate.
>   *		Returns 0 on success, -EERROR otherwise.
>   *
> + * @set_spread_spectrum: Configure the modulation frequency, modulation percentage
> + *		and method. This callback is optional for clocks that does not
> + *		support spread spectrum feature or no need to enable this feature.
> + *		Returns 0 on success, -EERROR otherwise.

I think it would be worthwhile to call out in the kdocs that this helps
to reduce EMI. How does this sound?

@set_spread_spectrum: Optional callback used to configure the spread
		spectrum modulation frequency, percentage, and method
		to reduce EMI by spreading the clock frequency over a
		wider range.
		Returns 0 on success, -EERROR otherwise.

Everything else looks good to me.

Brian

