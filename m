Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9140320ADC7
	for <arm-scmi@vger.kernel.org>; Thu,  6 Mar 2025 11:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741258882; cv=none; b=tQdp5uxN2ivxJLZvTwfhLNfUZtxHCVnibd2z9u9wmp7lfhM/vt7P1knHf6hL2LvVkABJUMPSoV8NyIQnsf4XwSnZFaZdigOXxDQdma6ePARA20IEBcKDzOhVkSX21QSpyxGNGPKYrVZuJAlNxKL2y2biZzyHAb4Axej5wFC/BJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741258882; c=relaxed/simple;
	bh=fF0AHv0s3S+dBIkriG8rfycx3SWlry9DEa+eTSo1+Js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cvmy9qG3yNrvB8PC2N9tJ8m4nPT8wGkCuyFHvzPswFkdIs2oL6T2UlWE0lk0Vzs0tOmIMV76wMWRwIh9LpEtP6zjZJFJ46m/GH3lAnkNbvkQpQSNckNjl+GMTIDhwCIbSfvY2Yvj3VpOaRRuyDO7WRpkRE6Q9D+ce1GRlh+78L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zXIN1VTT; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zXIN1VTT"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-390dd362848so394694f8f.3
        for <arm-scmi@vger.kernel.org>; Thu, 06 Mar 2025 03:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741258878; x=1741863678; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ufdypkJNjHswejxJubFk9kEYQm8Yr9F5qH7/Hz14nEU=;
        b=zXIN1VTTTw2CqhlyeLaxW2YtNmml+KoAPBVDknget7P290ejT0JEnNHLL7EXWAAiZ6
         4EL5IuZaHbIa3vqd+28Jj1QonSHkoKmlar+A5usyq8JYvmQ6Auc7dfrWREYuzhBMbsq+
         nuBrDnWuRI9bVxIElm5sng4eLCNBFgQHmA8NqE/haxyRoryNZWfFHRZ13mkH1a/YQpA2
         J5EhZWW9iCXryUjorLglIKbGcACMgrDgPu8xl09Hxvp0vj7NS5bn5l8rIfpUm4dwzgj3
         mM1LJLGoJ0OQqqezJ9Gm8kzArwWubH9cw08PJkMvhCTtK/Svm0TEtWgTxeM65yWp0iB9
         KPVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741258878; x=1741863678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ufdypkJNjHswejxJubFk9kEYQm8Yr9F5qH7/Hz14nEU=;
        b=IpODDt+Xdk8alNVeGEkYISBWhC343xAOelKG26d1WpWoHhLkacTL76iveUHGE5C1Yx
         AtsU70Z4GD/aj3phTHdjLviwrXWx7Ry+/qjEP/S/ZHVLADYZMSfxC3RdZZ0U5T37FhAO
         mR2HlUyKTpI17LVh8xU6TPH2Ph6D/VGhCLn+o/pdxGvkAumJO8S2MNVYTr0bVlVWqzNh
         EEYVw0V3ArPfbVva4vmJ0qkjwA2NfhUXFklzC1kv1ktBL3zP8Didv1lN+j5tC3nFJv+j
         naFE4kYlzPut655lZHmyRbfkcOGndiYtVG8AiuCBBDn9qo8lCVnHLA1cpXQX2Une3wsG
         zAEA==
X-Forwarded-Encrypted: i=1; AJvYcCVPOmxbAQrupZMAdN4A7XsiJN7EQVt9bMiG3LekXmRrDiQ8J4ave8r8n1b43Ul9mn/7ji5sBQCRzw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+PrYDJNXlH5z8Lq/6sIMkZfS1Rwf9Te1m1sj1pem/MZHv54PU
	bUzXvam66q3benB21yVaNSrNR2OUSBtQGNX7n8dUKojL6LMDsiIjAS3O3fj1myI=
X-Gm-Gg: ASbGncv09LWVIaZFq0zHWiAXA8lFGzm33oZyP5dIEjIY1HOEycUK8zBP7eUi1pUK8Bu
	sAQrf62XFMO39ubw6TUC7BvPJcjdM38rrUW6iGSlDqasT/IQyay18hcBhc25T8uBwxsVBx/fReR
	nrg1OM3q+5p9y1Qp4yQe43nTKjXXL397GRKoSwNSoGCCneusOseIRMA3S291w73boTmk8b8SPZI
	76hWDy1UChzpn5OtR3u4YO+50g67rhuiICBVTAXviuWN01NXOUadXHbH2rz/pbR7V6fh49udKpy
	x1g4AP8xNvfAGua/BMLB8WQHSGuk4ynwxQLuWVDzJBLRVjTIeA==
X-Google-Smtp-Source: AGHT+IFaNI6+FuJB441Zt0saVFEq17tskKV/m1XJhXDsSDNyn2Dt0uqOjvxwn86BlqWjcXdpYtDX5A==
X-Received: by 2002:a5d:64a2:0:b0:390:ee01:68fa with SMTP id ffacd0b85a97d-3911f741aa8mr5660504f8f.24.1741258877759;
        Thu, 06 Mar 2025 03:01:17 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bdd8c327fsm16444235e9.13.2025.03.06.03.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:01:17 -0800 (PST)
Date: Thu, 6 Mar 2025 14:01:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: zuoqian <zuoqian113@gmail.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, rafael@kernel.org,
	viresh.kumar@linaro.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v2] cpufreq: scpi: compare kHz instead of Hz
Message-ID: <c6b8aa98-b5d3-4fc4-9f5d-4bf2471c3d6a@stanley.mountain>
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

