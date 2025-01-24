Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80ACC8DF
	for <arm-scmi@vger.kernel.org>; Fri, 24 Jan 2025 13:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737726689; cv=none; b=rcGFpeu0mycy8AkE6WWrb847mJv81IPDfqey/7xtwqrN5iTvKzwFjF4McHBgSJ5pCW5XeDtq5Oj/nhduLp0X5d61BU6TG2/zHhLsXn4qgEraYjjX/bQiV0BPoC16AXQCls72LPVpRUC4APlilaXxpW1a4Qc+jh+Y9E8hqUrswlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737726689; c=relaxed/simple;
	bh=pJFaFR/cdHX84EYRD0FIV+VAe/KBfCM9byCxxPK0kf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rIschylNyr81MOeGutaaVh8QZxeyg6zmx/xYxJFXPSn8SBFjKZAZ4u1b425he6U3FLJMnzVMLLEjXQnJb2TDPV2ZMWcj7FPlQtb0WI77A1gtOxrTW4gEP6Er8LF0+aWproNLsdWO/6Doe8lYIh2kGtCQeLQuMX9HU04zSdgCI0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IJYkyAmf; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IJYkyAmf"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-436a39e4891so14395015e9.1
        for <arm-scmi@vger.kernel.org>; Fri, 24 Jan 2025 05:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737726686; x=1738331486; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zKRrbe6gGWiSaBV4mplOTEhtmjTYcRZx77kHNzgfO9s=;
        b=IJYkyAmfIOiE8BDleNLE7IuupEbjUaO3d7eMIuH17vzbYi3DzG2/jDB9fGulbvKSNn
         8EGMglPQmfyRSug3vpU3Zt5cxO06zUAyTUU5UBjcTSpzOYnEaWeYujq2YxMcfO2LHfim
         KsOaUTsa0A/VzQkAd5uNIjPSn3UH5yaMbq2f+FW20Bgdk+bAQaplhjMrFZtHlw2sNemm
         pcbmVs/eFT59/tfD5PutgQ9mzIrVnIqkkry2g54vVddN5bl2lCGxONz3zKGDolpZ7+bA
         lD5y0TfANsUFryE3XkWL+/eKBhyYqYIJeLlx491ccC/brBABnSNQs9VTQYqmtTTEw29+
         0jgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737726686; x=1738331486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKRrbe6gGWiSaBV4mplOTEhtmjTYcRZx77kHNzgfO9s=;
        b=Z9HxhN3WoQQ4TjJtft6rR/k8o/GwkMK7Rt1v8rxo2MBpr7xnsCTRJF56GgHtFfWs87
         UOTru39mfNBqnE5MXIs4tfEKgcMkXE1D0zeOpLfheJq8NGMH5QGlcT1B5ghkteC0ist2
         MfBfOJRsip/Xu+YaddbPNY5Tneyhsq4nRr9W6OiyTZeJhqy9QJWDEsn5SBXWPJCPqHLn
         D6SnGDskPtp7B02icvZNeV3D9JXsUYJ1/cPIyr/lFSTUKJUX1hpSvYGhuQBCYCvOgsoj
         zMmzD/hJGDiE2XRzOsx6MjaSRZ66poQBTWVndFJaL+fiDtVA6+J7wCmJRyZqoNlEffj2
         7puA==
X-Forwarded-Encrypted: i=1; AJvYcCXZstsRk3BqM8H78rCxKlLTnlSfrT+WK6ij7KZ2fUCt5wBMNCBsqCW4dFGmfsQgZ2h2R3w2JpvUnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfY/ybZy80kMPEhpAYwHg828j8y2to9yCp+hnUFowECV04/0sk
	2hlbqGEVoBtSakrCgKPiit84V4jPOPS2fYnxEd3yJNZ2+asjiqlyRnIlLV57cck=
X-Gm-Gg: ASbGncvkZrJ+08+mnKs2R4hFziXX1mt9ZAoe4mNuLFHSWbYmfOWinthVsTYUIDW0vlX
	QthfE0J25jDZLuqkMCOVZPjblkjyb6XGQFgAuSoOC8QNO4Z8Iqpz5TjmZvhQJbSNvTP7IH3pOII
	Q2paZGtZv8hzS3nMp6hmeIACdbUvcMiRT2zDSAKbaAggnklkxa83Tnsmmln3HEh/hbKfMVgtJZd
	xh9NkOEqSYwQMrHsEoyoFrUaol5PVSIWvyUHh8LXoAJtuW29p53KPTeq2GC7w1Xa/HGMfoQmYY/
	YyTWjusGAQ==
X-Google-Smtp-Source: AGHT+IETFMJJrZWr/EDBakUelIAVIlOvrzgYZmGp+ZA18dqs2i5tih8sUMHw8uH4sD7esRtqKjCpXw==
X-Received: by 2002:a05:600c:3585:b0:434:f297:8e85 with SMTP id 5b1f17b1804b1-438913d5da1mr323417065e9.10.1737726686177;
        Fri, 24 Jan 2025 05:51:26 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd485007sm27717805e9.12.2025.01.24.05.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 05:51:25 -0800 (PST)
Date: Fri, 24 Jan 2025 16:51:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/3] clk: Introduce clk_set_spread_spectrum
Message-ID: <f83759b4-8e8a-4497-b032-341c8538c293@stanley.mountain>
References: <20250124-clk-ssc-v1-0-2d39f6baf2af@nxp.com>
 <20250124-clk-ssc-v1-1-2d39f6baf2af@nxp.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124-clk-ssc-v1-1-2d39f6baf2af@nxp.com>

On Fri, Jan 24, 2025 at 10:25:17PM +0800, Peng Fan (OSS) wrote:
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index cf7720b9172ff223d86227aad144e15375ddfd86..a4fe4a60f839244b736e3c2751eeb38dc4577b1f 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2790,6 +2790,45 @@ int clk_set_max_rate(struct clk *clk, unsigned long rate)
>  }
>  EXPORT_SYMBOL_GPL(clk_set_max_rate);
>  
> +int clk_set_spread_spectrum(struct clk *clk, unsigned int modfreq,
> +			    unsigned int spreadpercent, unsigned int method,
> +			    bool enable)
> +{
> +	struct clk_spread_spectrum clk_ss;
> +	struct clk_core *core;
> +	int ret = 0;
> +
> +	if (!clk || !clk->core)
> +		return 0;
> +
> +	clk_ss.modfreq = modfreq;
> +	clk_ss.spreadpercent = spreadpercent;
> +	clk_ss.method = method;
> +	clk_ss.enable = enable;
> +
> +	clk_prepare_lock();
> +
> +	core = clk->core;
> +
> +	if (core->prepare_count) {
> +		ret = -EBUSY;
> +		goto fail;

fail is too vague to be useful as a name.  Also this should be
goto unlock;

> +	}
> +
> +	ret = clk_pm_runtime_get(core);
> +	if (ret)
> +		goto fail;
> +
> +	if (core->ops->set_spread_spectrum)
> +		ret = core->ops->set_spread_spectrum(core->hw, &clk_ss);
> +
> +	clk_pm_runtime_put(core);
unlock:

> +	clk_prepare_unlock();
> +fail:
> +	return ret;
> +}

regards,
dan carpenter

