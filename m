Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4D31C54BF
	for <arm-scmi@vger.kernel.org>; Fri,  6 Dec 2024 20:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733516898; cv=none; b=qETdYBUfsztUuZp/dMOhGGv+KRTh/mLKAAn4ez1LtXjN5ShAavajN0QbYFqQY4eXU13PWQmrgBN2a05uG9FSFRH2Zq1zsoZ5h2uObQlum5sx13ZBnU2ri2/b7uifwRnGYp43Ovab9nJY9WUCnzTVlRz/JtxfSekmnDtEzhccMS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733516898; c=relaxed/simple;
	bh=BwakpNluTynsNNSAFGekdUFcnrj8QO9XmxqzY/IkSxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BefC2UnzhAQNwDpcynViX6mZibpnCzCplau6OgVubeI95oRvcf5mLeY//+i6+zz/nz4546rtIqHt0qcmWESDo0JeqfCrapytrNvA5wjUYN5JYXHnPfPX6Ji8tsT84wtyDRm1qRwDy0QkAvNn+kbZrOt56PLqq9/SC4pO4kToedo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z2cuIrSp; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z2cuIrSp"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385dece873cso1234797f8f.0
        for <arm-scmi@vger.kernel.org>; Fri, 06 Dec 2024 12:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733516895; x=1734121695; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NQaVE4xma2mfyf9DwEGfyp+l3xlEQFu3UABAOXDY/f0=;
        b=z2cuIrSp+8eZvWg94gMGQaeykK7e8zZ4y5JwC2e35/4mWnX1Q9n49cU5+G+VPPk/da
         NNDAKixylATtc9feCFpEwQi9dc1S5ud1brANGJCndRpPtzPlpOBjBz6b05HWRBXsdlDr
         xoQwxeYGwHpl7DWYqv7rbf2UjBdLHBT3mj5PdCL7N93vuASqULx5u6kB9v8YF4KZd/DL
         UblTLK50nMQ1S9l3snPaITbj+NrqCcpx9wkWgjGp3iySpkXtIis+5b+j5j5BMXIGPOAV
         xSZLm4B8e2VRjlSgeT3Xc7JVVetOJhoIV1w7AlsEhoTf0+N1kLFq032bOEb1Tk4xytI/
         I53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733516895; x=1734121695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQaVE4xma2mfyf9DwEGfyp+l3xlEQFu3UABAOXDY/f0=;
        b=Xztd25hal0jQeirM7DGtrzcyA8Jg8TAtopk8C3BKo5ir4Fj+PQxqZdokU1wG9JsUMg
         CMQmahcFAFRt0TkH/HB6S87BaIQKpnGclzKrVfcwh20RiCX295mGhGe4mm1Mt5HZyhcR
         p9L3k731L3IGB6YCsugr0KvBrDmIrFeUnkCIbv/6zDH58cXAoShA31wMJeItLPB417zR
         ZHWaECHlMnTSmjTES54ZyeQOHPft6haVR9NBAX4V8X9BUeXRQ0MiNXas59SVC2RSPGi/
         qPvwMmhtQNTkI0wcHBv9Voqfs+UxpoQR5T/pWwhQHtnxe/b6T3qQbCikx7RqVE9M9trQ
         vlSA==
X-Forwarded-Encrypted: i=1; AJvYcCV/2eMnLCjMJUgb2k4epKA8Yvr+dKQkBkLK0887JBI/t/Dcy4jSgUlsezFxlEEtAb7zmYiCqqq+tA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDlWI8q5eskzuwsLKodTnd6tbqC962X80aSpd6qv4nxbXvsQqP
	6lPg2HoYGYHMvlyy6b8ayHk8O6xxFA50v32JvbcKvpAhz4gyur99cXmL9gDWKhQ=
X-Gm-Gg: ASbGncvhwLqoKJuCutt1g406VMOQpFTC5C7A+JBUFtnaqdMiyGL4JMNxqRdaa/NPDvK
	Y65vHcptDT5CjEH6JO0CMSEn5r3XXGkYnzn8UGmcHERdPXBSLtb4PhaIVKFD8ziuIEqcSxl047A
	U+as4cVf1Uu64SBPlvDfxiDJEcgHXfXgPwSAKb57R4JKUJFNYggD4ALfJA2l/hcex12udO8KW9m
	a+J8/7G/JFq04xMcK+LCqCOktbjnA4TBKN1InM63PXFFIxs8aGXiu8=
X-Google-Smtp-Source: AGHT+IGekqBUH4G61NmWpwsXhLA6y8516RqskqF/tq8JR1N/a6IKQ5CbI54DTrqFonQGIY9zzCX1sg==
X-Received: by 2002:a5d:5f8c:0:b0:385:f38e:c0c3 with SMTP id ffacd0b85a97d-3862b33eda1mr3932008f8f.6.1733516895327;
        Fri, 06 Dec 2024 12:28:15 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da0d26a3sm67425945e9.1.2024.12.06.12.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 12:28:14 -0800 (PST)
Date: Fri, 6 Dec 2024 23:28:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Etienne Carriere <etienne.carriere@foss.st.com>
Cc: linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 2/2] firmware: arm_scmi: round rate bisecting in
 discrete rates
Message-ID: <7fe840af-d56d-4cb6-8d82-d42631409b2a@stanley.mountain>
References: <20241203173908.3148794-1-etienne.carriere@foss.st.com>
 <20241203173908.3148794-3-etienne.carriere@foss.st.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203173908.3148794-3-etienne.carriere@foss.st.com>

On Tue, Dec 03, 2024 at 06:39:08PM +0100, Etienne Carriere wrote:
> diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
> index 09ccd6cea7f2..7bbb2ee55f4f 100644
> --- a/drivers/clk/clk-scmi.c
> +++ b/drivers/clk/clk-scmi.c
> @@ -61,13 +61,20 @@ static long scmi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
>  	struct scmi_clk *clk = to_scmi_clk(hw);
>  
>  	/*
> -	 * We can't figure out what rate it will be, so just return the
> +	 * In case we can't figure out what rate it will be when the clock
> +	 * describes a list of discrete rates, then just return the
>  	 * rate back to the caller. scmi_clk_recalc_rate() will be called
>  	 * after the rate is set and we'll know what rate the clock is
>  	 * running at then.
>  	 */
> -	if (clk->info->rate_discrete)
> +	if (clk->info->rate_discrete) {
> +		ftmp = rate;

No need for this assignment.

> +		if (scmi_proto_clk_ops->round_rate &&
> +		    !scmi_proto_clk_ops->round_rate(clk->ph, clk->id, &ftmp))
> +			return ftmp;
> +
>  		return rate;
> +	}
>  
>  	fmin = clk->info->range.min_rate;
>  	fmax = clk->info->range.max_rate;

regards,
dan carpenter
