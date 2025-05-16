Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A6720B807
	for <arm-scmi@vger.kernel.org>; Fri, 16 May 2025 08:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747382559; cv=none; b=MPtgh688AAOCAzljZeO2czQrWjl6odhymw2hKRaHcpwDKV1J1d1K39fXuKwFNhv3tgOdxJDh/PB7EbNeCv4mDUREqMqeaCxGcrbdmR+GZGXiSE0buTVCq+r8cEsO17NgnlDB36NQBkdJtokq0X71w3M3Tbf8IzLB2pi+QhdtSF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747382559; c=relaxed/simple;
	bh=GG4H/sccbSVzVwAwliBjKqAZoNtWhkKlmZNI68D6kmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqR3ceYabhwzki2YqJOcc9lA67SS3BSxk+TH20YUrottxcize/j8bIYZvdj/htefFqN1u0vLIeo61x3F4ckWowBsbalkMwgo7iqJh4zC0j2yiKKOVz8zrntV61VgjM6yEu94JVRCVmJqlc/0/2TiDM9byoFr8+u28GCzVd8/y0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GW/EPIWU; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GW/EPIWU"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a35c894313so561594f8f.2
        for <arm-scmi@vger.kernel.org>; Fri, 16 May 2025 01:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747382555; x=1747987355; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bdKztaKZj+ArxWleSUI2lI0rhw/lHk7zt8SPSV2S+Ko=;
        b=GW/EPIWUiIO1WEoPmHec93o2Cs0Oi7jXWo5qkJbwKnAPYrjw7QCUEBoFSLs5UtMxNU
         Yw0XPfckh2ZRAiKuDJJKuRDkA7SzQSvo1A0Cg/mvvcwd22JJFvTn/hYRrAOhvA0KN1TB
         R8j6LNnyWtwJpvs7At0YyfBN1OhUVzc93ssCve/uLnoCcOT7+Zpiy/PQ5I3jTZhiut6d
         LUDi+mYahPWaAN1WdXk3qPTY9lMUDUn6yJny20RHRE1qoFi+5+yHFv47es1cBAPKR+cj
         wrtzAI89HLbjFAudBCoQsnGrS5P3QOhiLkKAjo7OsRE20NooUJsedUmukz92yckDGQbU
         Dp4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747382555; x=1747987355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdKztaKZj+ArxWleSUI2lI0rhw/lHk7zt8SPSV2S+Ko=;
        b=XZXgTp90nZ5DaqC4s1NYqNtCjtjyQh8vn6oTiCf+TYfyrHdHdZrq8ws65AdvEt5s1z
         pmXZ8BtRNYa3nYwZqdyJvOD9aG1FL5iv46IMaqNHFpiE8jihc8GjXKKC0l5FVpcDaHyX
         AYUaqeW4ADBEk6vuSn6CQiYGIq9ynTDqH9BC7f8WuLXi4Wa+hFc9pVrJR202x9edXYeJ
         878GU8ZJj7dg0cHKdoaB5KL8BrtkOeKYuHkOgk6zO4UIQK5Z/CjGMQk/0OHfuEm5EZ3E
         hlanOGMA2ylcNqt+M2661pLa8Gnk8G5ZfplQnDp5STYtslXneht1/yJd2TewFylTgt1y
         AkMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJKSK3+jL6a+4L+WTM35yRRTZRoQxWjEcOuFPC3hhKzGJZoNojajDCqRvSimbcMQC/c6x+0yvtIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmFFqPQ39M3ALHlJ+WThSqFJGCKcRyv95MZoGkleh41tzCY7cn
	wsaMm9Z3BMauOy3A8r/I3mqetyRS6fGiILJyiDVCqPKinyu8pUzXUJD2zj4ACcoy3Ms=
X-Gm-Gg: ASbGncs4UI+iu9q1Pq1vKwPZz0g5aIZumaVRlz236ydbcB8By1sctxN63MR7f4sUAXH
	YOXf1e1H7XJ8ovZVN35CRVBPIJeeqmqFia00+jDWbgG8h3pETgkDgv/pdggP1XK5VDVyeOxoM6M
	Kdfq9L9eBEeW3Q3/y+XeiKoKlz/cDbSj/YPGQ1D4f/1NpZetG7ijngILxmr8+dZWhCEnls1CQYx
	GQMRaNCga2y3jT+9hTQvIhTOc4bA59mZ1cXIVhU9qGoPUsGF8YeL1+UeJktObqv7dtCtfliAGx6
	fyMKklrSOxFMZxvb2z2Fq00oW8vhz1Drg0aC9q8cEfRpYzbe1NAMr0iKF7L1fGDRgO8NRCUSaIl
	5RJssHcv6XhhzlK0b
X-Google-Smtp-Source: AGHT+IGajP2MNPkEe6N02ds5+ATpXbBcyUjkhr3oNkMVyA1PAD1v31L2wT8EjnkrVr11DTg5FBDOMA==
X-Received: by 2002:a05:6000:2ca:b0:39a:ca05:54a9 with SMTP id ffacd0b85a97d-3a35c8263d1mr2594040f8f.29.1747382555439;
        Fri, 16 May 2025 01:02:35 -0700 (PDT)
Received: from localhost (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8d185sm2005730f8f.98.2025.05.16.01.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 01:02:34 -0700 (PDT)
Date: Fri, 16 May 2025 11:02:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: long.yunjian@zte.com.cn, sudeep.holla@arm.com, peng.fan@nxp.com,
	justin.chen@broadcom.com, florian.fainelli@broadcom.com,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, fang.yumeng@zte.com.cn,
	mou.yi@zte.com.cn, ouyang.maochun@zte.com.cn, xu.lifeng1@zte.com.cn
Subject: Re: [PATCH] firmware: arm_scmi: Use dev_err_probe() simplify the code
Message-ID: <4c970388-4b1e-4c5c-bc54-d55c2d9cd62b@suswa.mountain>
References: <20250515203855146Sn9x-Uw9Teur35mOjn41C@zte.com.cn>
 <aCXzPGvPayVyiMHG@pluto>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCXzPGvPayVyiMHG@pluto>

On Thu, May 15, 2025 at 02:59:24PM +0100, Cristian Marussi wrote:
> On Thu, May 15, 2025 at 08:38:55PM +0800, long.yunjian@zte.com.cn wrote:
> > From: Yumeng Fang <fang.yumeng@zte.com.cn>
> > 
> 
> Hi,
> 
> > In the probe path, dev_err() can be replaced with dev_err_probe()
> > which will check if error code is -EPROBE_DEFER and prints the
> > error name. It also sets the defer probe reason which can be
> > checked later through debugfs.
> 
> All true...but...if you look at the main scmi_probe() function all of these
> failures are trapped at that level currently on the return path...
> 
> see the call chain from
> 
> scmi_probe()
> 	....
> 	ret = scmi_channels_setup(info); 
> 	...
> 
> ...so your probe errors will be overridden there with a more generic message
> left in debugfs at the top level.

Good point.  But that feels like a mistake in dev_err_probe().
Ideally, it would print the first error message.  I bet someone
will eventually fix this.

regards,
dan carpenter
