Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F4E21E0AF
	for <arm-scmi@vger.kernel.org>; Sun, 18 Jan 2026 19:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768763744; cv=none; b=eJx8+D2oozv+CYh8t3rpAB5ZtCa3Hi4gq2PaQ5qkTacb820xdPYeDeOUV+PiQXWcV61/e/+J1pDYYRL30TunLNDeR5GDSRM6btVhDjVgc9/0N0N3qC1QctRRRMwAkA2upJV8PigyYD/SMZYNgHgQr9PG3pKs0BoxI/y+O9wsagw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768763744; c=relaxed/simple;
	bh=Pyb3ZVCl2W20pvak8WFvwOGzpxZn5BT74Q6321nAW5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IAvBbTxAqknue8w+FYxMBviv51LDUeOKUfeA8/hZEIjdE4FTrHZLPDXWJTIBbXXhCrF9A+cDs5vy1JYoIA4oeqT/DmXTiT17QGb7DWPZlOsLihUuwou6bqnIm+6/OLL+per2Gu7MkgqXCCE8CZq9SBHWC1mJ7gHy8lp14dqqLYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NlQjcg7R; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NlQjcg7R"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42fed090e5fso1915017f8f.1
        for <arm-scmi@vger.kernel.org>; Sun, 18 Jan 2026 11:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768763741; x=1769368541; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g7eq9NZWv+jfQYvwT7GWinc/1t08cW4LlGcRYfwgt1M=;
        b=NlQjcg7RQyVW0q54uzrAtuGcX90hx6QprhuiRt3t9P/AjAFMZlP7wmQjSzsIBYtZfX
         GM/OO33XFEpQkUvtRxXGQ1kfK7u4WRdCY6gP/10w6vTh0QtAkaNlPp7k2aJWcufSaKDI
         OrSZFNydMbd71XaThhKbfloQHyEX84+RMsqplH3tbQudhxi1gXGPzdCVOgsKnE+dNfTT
         Nw4XVk42UbAEeDgqLFtYaJmST+UxQavGi2hPrDMvqdgIE8WW8y5c5OUgg1+gvWtpTS8g
         ASXTgwlcQswsa3Fxd7jJ+7v2U5FrDXMkgoHBbzwRQBMDGoc2t5BjlHnVXeC2BLbBQJyZ
         5c5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768763741; x=1769368541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g7eq9NZWv+jfQYvwT7GWinc/1t08cW4LlGcRYfwgt1M=;
        b=Kw29BfTcQz9qxCIBW/78jEthpI6excWJASz48PXcEesqf5d8CnhpwhosJzvKNe9sJq
         70VD/2nS3jEe3Pldy9HuwAQY6s5E71JWwX/FpE468tb2dHzAKYg2pSAl7AcMmktBf9Z8
         FXDybDOxfkECyZW3oFSfJkMnRFK8TNf9Hgu2GU3gzudOLTPd20FEGogs+gxnITqb12pF
         gAGOCajYs6VqJWR+4kgsY5LOjw5erQKLPchQsskg9DFhMkb4UrZ2J15L9kcS/mRSu2gv
         72jcVTx5lxbm9ICLhyg+LqVRIz0dNGz40xVkKGD/chDzdwe52cP25SxzlWeMjaV21Usg
         73EA==
X-Forwarded-Encrypted: i=1; AJvYcCUwkk7V/JlRdSPgSACrro9mDF45w+QHIzI5eKcgdbzziHeFSJ/SS1iWFG2aDfVfCDEwdpPHah5t5w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6xu5tO/+AWpCb7vtYOb3uXA348lFXYYPm28bUwWRWR/zTRcL4
	KrrK+nu+gf86EQVlmkrS8Lm3vo7C8HGD9s+L0KxG3iBfucUF9dWcU6ui/qRDw6vlU8YDO5/X9vB
	vi37A
X-Gm-Gg: AY/fxX4rzDvowyH42QN0KMSpicQ9Xre/HVHui6uyNQuMmQ+z7GV17dmBOsmpSEGANSi
	Vp/OpxdLnppd7OPy/EK6c8nbwhX4mE4ZtteYHxDbbPcvTelMBNT+ru3q8iHtjpHDf2aMS7iYhVF
	z3Wh9lfxzUvWKDPi22UrhfdMVaEC51P/6xN2RPzhUxIIQQeqkVhzdntkEF5KcW1egJXtDklXgdK
	1CCqwRv+aURSIkzikRKH5Yh07l+Zuu3ISHCkne4qPET6u/t8n8hB9TIuqLeKMKsoDuB9/z/S0a1
	dPfQzKzfhzgBDfX6unYOPO5mzDEDC9cRMOLx1x3o0a3aSOYNFBVIAelvdykM0ENSAGlDzCYwJYt
	VYsew09xuXKDVtt6rVHEfp6e2mnNCW5AzFBUL8IW+P5MGczK53l0iSeFWrNSRGkttCq0CkBy+Bn
	0oGviE9aJVfysgrzMM
X-Received: by 2002:a05:600c:4fd2:b0:46e:506b:20c5 with SMTP id 5b1f17b1804b1-4801e34c9b4mr122573745e9.26.1768763741271;
        Sun, 18 Jan 2026 11:15:41 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8d77besm158279375e9.14.2026.01.18.11.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 11:15:40 -0800 (PST)
Date: Sun, 18 Jan 2026 22:15:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Felix Gu <gu_0233@qq.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scpi: Fix a reference leak on device node
Message-ID: <aW0xWZ-KylipPF7M@stanley.mountain>
References: <tencent_A3E20C513BBE7D268B863A5CE473FBA10B06@qq.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_A3E20C513BBE7D268B863A5CE473FBA10B06@qq.com>

On Fri, Jan 16, 2026 at 08:54:39PM +0800, Felix Gu wrote:
> When calling of_parse_phandle_with_args(), the caller is responsible
> to call of_node_put() to release the reference of device node.
> In scpi_dev_domain_id, it does not release the reference.
> 
> Fixes: 45ca7df7c345 ("firmware: arm_scpi: add support to populate OPPs and get transition latency")
> 

nit: delete the blank line after the Fixes tag.

> Signed-off-by: Felix Gu <gu_0233@qq.com>

Did you find this issue just by reviewing the code?  I read the comments
and then looked at a sample of four other callers and none of them
called of_node_put().  So it's a weird thing.  If this is really the rule
then we should have a static checker heuristic to enforce it.

regards,
dan carpenter

