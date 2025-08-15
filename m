Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D7629AB1B
	for <arm-scmi@vger.kernel.org>; Fri, 15 Aug 2025 07:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755244304; cv=none; b=jzmSVxjnDDcE79YodITCLy2zRZbuXZgEvjd9853QE6j+g/WHa+h2qWMvWEmrHXU5tJqMthufG1S8d6ACyk3a3yqy4qZ/GDTgfYLxwqmbS8dei8LsIAzjLtyBiAzLsUZpJsny5KoxO9KiSW6BDBREaQnM4rCNt0kWlQ+GTctDVTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755244304; c=relaxed/simple;
	bh=wM1U30RQbt9hBouuD0ezUDPgcheiH5LPKBmgTE1Ky2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aMxCaS/RC8VIndEuZBeK7wWl9qFDTJuDF6Z0rBWyuDIA/oMrgDZJ7ukDFEleKwpPPPJzv+xlLn5CCYEuiRbDk2+qRPY+/0/+iAk6Ms92iQlgiukTj+tHvQwNcAgGmQ6KHiEK7zX4/qzXHKE31Q9j1g5tigZTuSojvV879R+VKII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cwK3dEm0; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cwK3dEm0"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b9d41c1149so1301788f8f.0
        for <arm-scmi@vger.kernel.org>; Fri, 15 Aug 2025 00:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755244300; x=1755849100; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7m6KRZ644lLKsPQroVf0XIC4bXSKC2MeWxzfY2tyrfE=;
        b=cwK3dEm0J8ToNAu7/73elVZ2CRHijlXZxaEMLdAUAjVM4OWcJNV1syrQWrOlBIqfj7
         O2kRa/P4sKSQByEKMyt1pwr4/8Dm58L+rLc5mYiOsUCx65kNpuKw6GbuRvNkrHekQi/q
         /P0OFVexU127j+w3XftVsN1rW9hyjMY+qYop6VUI7tkMDZBywEJ4P9XVFkmK39SeT4wS
         UvKy+FcfutYMwXyJ/ze3yIuRuDcadiqsDjSQpO1NAPZkrpTef4B3dWyY8LkyuP1Ve1+T
         +ALQi64bcegzIruddJYTlD/njTkqORezTOF9qiwzIiGmUZfikTl/bb561kTi2ZCzTock
         mu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755244301; x=1755849101;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7m6KRZ644lLKsPQroVf0XIC4bXSKC2MeWxzfY2tyrfE=;
        b=F/lTD8QA0FDeXbC8HU0/ujoGPtGak84m88tG6pHCzKcLYUG43BRW2r2GCgmc/CIUd+
         qaeXBgch45to8QV6ZUW5RzJf3ulUWOroDeWcmlDr0v6lwJRMxqUizdt4prBsA5sHCjPY
         dWEQ99qxUM8fr365nicdhYbrjSIR7biWnUvq+0ZU33wiWoeHgz3PdKIuEd0K3Adt0GTK
         UkpIYI22A31K1GufIy1HJ8fAzNOZGPuGg825mbdQKStT9tQ/VTtHjiKJqVQp4eYY3LqH
         mMr/ub+kDnM/fiNNCV72YR/VagjT8b2i3XVMccOzsJc8kea0ouHAYnNAwkXoDKe5CNV3
         64xA==
X-Forwarded-Encrypted: i=1; AJvYcCWrAzjz+QTBPHU3Ju5ozgOY6O/8FlC/6OOcIbVVGDZBcQwy7MC8iQQuqXhwvI5nfbhqd7uq/bKQ7g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6UVAGdDmD02IF19c7ep403HeoES/AmnPCDDazn9fyR/bcpgvz
	qORx4ZVtxvdAabi7+M8ihozEcIhKM2MqvWYspVodeQQNKnfB+WyA4J7+FiEatc5dkhs=
X-Gm-Gg: ASbGncuaOzOpeznqAzUuXL7qJx8VXg08bmJHSIG3SwVJinxWb2pH36YfXtPa494KfZf
	ph/3+oA+nA2b6HZWnP6LZk17gnPkS+iblu7b+6MYuKAFI/7iP2+SgqVVKkC3WbkFWOrmz3ipC2S
	WaiOLBeMfkXjSi+Tk9DuxwmE7Gipr5E585hRswq9TJseKoFTbIPU21ZKPaITD5giBVr+vu5oi0g
	I8hVK4FAl2pl1VDzIAKZti7n3nrniYUDLGaqZQx0wK5/kw67J55x+Nj/6X1gwRtibiUs62NTX6z
	hTdNBt0+12WebQQ2HMm95NdBOR2Vh8Vzs3v45wFU6uudMRspAEk6C2whD8ksHjdvHfwVHWCQ3FD
	Dmw0h1g22GvpVNHb5I7vfdWZQuwU=
X-Google-Smtp-Source: AGHT+IHGaYmTmAXRjZNxgrE/I/LGdmAsoAt1BCBaN3PbkpwZZAN5Rl0gISUa4t157xbfeVhA78qhSA==
X-Received: by 2002:a05:6000:430b:b0:3b7:9589:1fd1 with SMTP id ffacd0b85a97d-3bb68fdc587mr833175f8f.44.1755244300612;
        Fri, 15 Aug 2025 00:51:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3bb64758d27sm1004077f8f.9.2025.08.15.00.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 00:51:40 -0700 (PDT)
Date: Fri, 15 Aug 2025 10:51:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] clk: conf: Support assigned-clock-sscs
Message-ID: <aJ7nCL0PS0DX8rtk@stanley.mountain>
References: <20250812-clk-ssc-version1-v1-0-cef60f20d770@nxp.com>
 <20250812-clk-ssc-version1-v1-2-cef60f20d770@nxp.com>
 <aJwnH2mlRdqp1K1u@stanley.mountain>
 <20250815071249.GA20726@nxa18884-linux.ap.freescale.net>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815071249.GA20726@nxa18884-linux.ap.freescale.net>

On Fri, Aug 15, 2025 at 04:50:42PM +0800, Peng Fan wrote:
> >> +		if (modfreq_hz || spread_bp || method) {
> >> +			rc = of_parse_phandle_with_args(node, "assigned-clocks",
> >> +					"#clock-cells",	index, &clkspec);
> >> +			if (rc < 0) {
> >> +				/* skip empty (null) phandles */
> >> +				if (rc == -ENOENT)
> >> +					continue;
> >> +				else
> >> +					return rc;
> >> +			}
> >> +
> >> +			if (clkspec.np == node && !clk_supplier) {
> >
> >Could you add a comment for this condition?  It's strange to me that we
> >don't iterate through the whole array.
> 
> I just follow the logic in __set_clk_parents and __set_clk_rates, nothing
> special here.
> 
> It is just like to phase out cases as below:
>   node-x {
> 	/* node-x is not a clk provider, but assigned-clocks uses node-x phandle */
> 	assigned-clocks = <&node-x   XYZ>;
>   }
> 

Ah.  Great.  Thanks.

regards,
dan carpenter

