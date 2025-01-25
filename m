Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21A81D9A54
	for <arm-scmi@vger.kernel.org>; Sat, 25 Jan 2025 13:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737810299; cv=none; b=qTo1LRAYMLxSoL2ZxcpJFSFicB1Q4GQ+bqmW55b4/8bw0VdklP4glf6W+QoLSMbQ965nbPFzSXdo54y1jgcjDGO+sI1z1f5IO4kt9qaEQYITuviX8cpQ/BYsqgZZWlNybN43rwUChn5BSFnKqzBlNW3EQgMiDDKArO2qSJwK0r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737810299; c=relaxed/simple;
	bh=fF0AHv0s3S+dBIkriG8rfycx3SWlry9DEa+eTSo1+Js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iCwq9GFIchRyan6hc9jB4HfHUmEzxbuvXqXQCW47tJFFKsd5/JFcdfWalfBuzPXrVWKz3p29P/ilwrjwujIw2JIZ/N3iTL2nMvW3Riy8erUVIu9Br+TyLxkNEF7wutEaUGA9psobNKXN9J8GdhbK87/cFsex92Eq05BcFxGxosw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YSNeCLH9; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YSNeCLH9"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso19019085e9.3
        for <arm-scmi@vger.kernel.org>; Sat, 25 Jan 2025 05:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737810296; x=1738415096; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ufdypkJNjHswejxJubFk9kEYQm8Yr9F5qH7/Hz14nEU=;
        b=YSNeCLH94OQrQQEBh9OAQx6JHTw5s+Zb3FJ14YicrfjPIvSc90IfCDXZwp8Lb+sD6N
         L1OlKwdS6S+U2pEwNT3YDf9kFYkgqUCqQ+uHT1BwSAJFtUV+WIb08mEzjPq2X6mIx+UR
         uencJywzXu7pCrGvqU7Ln30xzlppJjs8DUbDG2E5qJDy01aZ8B2gAE0Z92HXMP4zNlFU
         JgY4wPtDIK06fLiqN2QMYCx3Tr2XYSmUylH3H2B8rO4OUgyPgLjxc3mor6cWsMRVbWP6
         Q73YJC9A8Ra+voAn6KXWcs6b8ktLjQvtZfeoIbB4Kd14vG0MyuoeUw7C+6AOzVFqd52T
         kuoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737810296; x=1738415096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ufdypkJNjHswejxJubFk9kEYQm8Yr9F5qH7/Hz14nEU=;
        b=lqLrCfzskA/wMecxCGMJ4Ca9mBvyToys9Gy97NWHfymVstKgDXgq9Ewwd9mZyiUCBJ
         ybQga7oh2dbTCcWiRgmcCejw592V6kDldazAwdKz/jrM3LeTvZOlv5wQ3WR8pwcPDSeC
         kYq7uUNEydqvp1HACSBKUYCyAE+roeRR2OKoPleIeZ7rD0QZj645/3a2APyYehnCMlD3
         s1+I/TcXZDdywb/pOJs/g7vU+FG1ytskMwfgCYJz9PIyDQq1G6UXsjVFKgAUm0Gvzx0j
         p++1YMyEBNGR7hI699WxhmcO9H7TK9rJ6dJP7Ufkt5dnFpDAfQpS4/PpV/mbkK9ID3nq
         YP0A==
X-Forwarded-Encrypted: i=1; AJvYcCW07O0Y3drLrGnLbLmsNYpxbFzLf0Y7I8Y0NfY8bFtWRaMSHkHcO0nF5kwQalwZzNci8yUOS+CJuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvvcTl+vhhxFFGT5nQbOxFW7F1iHwBC+kUD+8YX7iPxBAHT7O4
	h45fv5LbRc3TgteULdjgYycM6ivWBq6dEJR5GvwsL4gSO8LbASAl5MUgUEJm9sE=
X-Gm-Gg: ASbGncv67bOqPGVCk/5J8Trri89Q3HYcUBqISs95bRaZcZiH+pEa/R3xztdKYlSO8uv
	0UcQrxSJZX+KnoWTKRUZLTt0HkQFqG7DqQ+cXwAU72B7jXrAaaCMC3fC7LX1oQ1r8O7SDMya1Lg
	28LcGBohX7Aq2QwmmBdgYc25VpA0CKhRLtuNGObQe21k3tqkn19lMTuXn9IxKXIL7G2HArUBCuD
	tLv+DeQ5xoh8S8Abad3PHY9Ifg0ri9u5yfMoi622QOxaP2F4CAsIqw1YB6vOAgnHHl1tBr8Wi6f
	mEvC7GfC6A==
X-Google-Smtp-Source: AGHT+IEaOVgzG6Qtw0HZT4iWc73ce/VOtEgJOp3dSxRw2PlxaNl3qvT2R0XWbkFb0aXpK24XwpEiwA==
X-Received: by 2002:a05:600c:5486:b0:434:a10f:c3 with SMTP id 5b1f17b1804b1-438913cae48mr287922225e9.9.1737810296292;
        Sat, 25 Jan 2025 05:04:56 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4d3dbcsm61443145e9.40.2025.01.25.05.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 05:04:55 -0800 (PST)
Date: Sat, 25 Jan 2025 16:04:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: zuoqian <zuoqian113@gmail.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, rafael@kernel.org,
	viresh.kumar@linaro.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v2] cpufreq: scpi: compare kHz instead of Hz
Message-ID: <967a5b3e-197a-4b90-9fe3-9b10782d677c@stanley.mountain>
References: <20250123075321.4442-1-zuoqian113@gmail.com>
 <20250125084950.1680-1-zuoqian113@gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250125084950.1680-1-zuoqian113@gmail.com>

On Sat, Jan 25, 2025 at 08:49:49AM +0000, zuoqian wrote:
> The CPU rate from clk_get_rate() may not be divisible by 1000
> (e.g., 133333333). But the rate calculated from frequency(kHz) is
> always divisible by 1000 (e.g., 133333000).
> Comparing the rate causes a warning during CPU scaling:
> "cpufreq: __target_index: Failed to change cpu frequency: -5".
> When we choose to compare kHz here, the issue does not occur.
> 
> Fixes: 343a8d17fa8d ("cpufreq: scpi: remove arm_big_little dependency")
> Signed-off-by: zuoqian <zuoqian113@gmail.com>
> ---
> V1 -> V2: rename freq to freq_khz, change rate to unsigned long, and
> update patch summary.

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

