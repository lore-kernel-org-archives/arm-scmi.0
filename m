Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4AE3EE1F9
	for <arm-scmi@vger.kernel.org>; Tue, 24 Mar 2026 11:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352478; cv=none; b=R3Bid3Mj3kUL81STf4FgmLXDEbOwxMAxlWMc1dM6t48+yYW/1VGjFuKu+ff32r1coNi662C6lb8Met92wUxvmknSgV+QPTC1G9rOVXablYD8hrljQucZe1IKXMl7aCTb9myElKt6RUG2dz8Al+uHeD6QWYNEyXvY1J73T6YEtH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352478; c=relaxed/simple;
	bh=OXqM+MTY91699d5+qggzIhf1ktnjSHwnJwsQrE7YEek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QFaLGpuAEnx11U3h3pXfXb1GuudmPL1Tew2Mm/IqhAsEsmcOoN5dz0BwMjrYHSz/Qo17GOusLpIfaTpPHa5wCVFpsuuLGksTLd60QxuDTsCGmQ0Ea5lXAdT/q63mbRmL1g9BQ6LCtY+CUCkwBJg14t2mJqapEw/eg6HuWaLecDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ybjQ1vuj; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ybjQ1vuj"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43b44c0bcdbso5656008f8f.1
        for <arm-scmi@vger.kernel.org>; Tue, 24 Mar 2026 04:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774352476; x=1774957276; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VmWwTXRsCTU6xreKD6cFKnHBxSAyaOlNqc0k2os1GGs=;
        b=ybjQ1vujroE5FLVA7KLcTYdVb+E/PrHVf+iWCN17lBmO+vmuIgjg8w+AkrJBPzzt/L
         wIYD76lB56H5MasfxDalSmTE9L8BcuzSu+icpQqSnnA70sM+BXxmROFA7Xmkzn+i98ms
         YejCr87TIcBe7ZQDCxTaGFgQ5TbcX8PyGXL+dUmy3FqX5qW0vXu1KGR4JaGkMebvP/d6
         r/jEAbv6bC9KLkByE3ARs1mfKdHeswpE6r19Yegzt3svspeAw+qRQu8kJQv6QxQiTCnK
         xSSbyECTCeqXJcOXHM24liJVeTV/7TnegW97OV2R0SjiEhnhh5CMkng723r6tvh577fp
         fBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774352476; x=1774957276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VmWwTXRsCTU6xreKD6cFKnHBxSAyaOlNqc0k2os1GGs=;
        b=aY0UZcYEkkRDHNHhy1Jk2DYUCQ49fyq5WwwXqH2MNBxWHul2EVQ3Eb9jDXJHGrdOsb
         4Y3K/gwIVsFtlERfDsuYN2B4k3d0gFAx2zSzW1eByd0FmmJ/RkISuMSRxFqETy3h+M/r
         MsD7gkPSHzkVNiunuqO4N/el+y4NpGTnHH9CVvk9ZNd7fCduD/oM2QxaMDJmumeDVWHM
         PiP+XACdsC2xAcItRcQ5N73Lwdqg/JZyPz9kQIxTZU5tk5sY8XHbDVPY6hgxXUzJSD/P
         WjjYb0u40Cj0c+sbcbpAmuIui0dJVqrhj+Lx8GLsQiZsDhe/EB0UbOHYzPIP5dDHGKx/
         2zrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMX+ysSyyypz5fBeELWjnjZtizbxGioBXRqlD5tGEKCY/atNnyDavJ3tVyD/6UHPt3Su5H7HeKLg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4avtXDs9QIS+Oi/S8UD/SjFe7cgH3EuaiaJb8sLVyWkiAA8dL
	Ja8Y5gGAs1uBZPbR+s4pRG5aBiU1oODC3wEkv2lYn3T7/zZlBzoZGK4Do/pqbdqWOR4=
X-Gm-Gg: ATEYQzzqRoYVfWEYjsAH6d53Z7Lqm6G37SVtJr2jGz/0mJsb4rUcSxAe7d460MySCL6
	9L1a+A3ftHGRpTLVzKvnqW54m+yYM+HQIi/2twWhqqU0/ZU3Yj/AXaRo/mKkiVlJ6leWjqjgSge
	wbhiYeRwGA/H74QT6D9bb8nxeqnFCE44h8BWg8d9P+fOBtSPPWxyCxd59f+Zp76W3GnOaDF6FX1
	Q2JY7zW8uzr2DyOfDWZlpk2rQdeusw76DPn+VhN5Ybc98tXbHAnQtW2rHRS9tmcBRNgSI/kkFsD
	HsKH83QkzvtEkES2PU8/P5UeofoHkPzunjGMgCXaHRSt7uZ7YvXfWbqGEBosPU05x4BRC0+/iqs
	FaGCWcyDQO+Pk98JpdhVAYlmANc/kwY6qWdid+OysvCmkKzM5wTGwtVlCW+/vNIo1n5IzmXCPl4
	DpyHGq83Vy2G8cB4TkxUB52JQK2Yub
X-Received: by 2002:a05:600c:530f:b0:485:2ce2:4c87 with SMTP id 5b1f17b1804b1-486febb455dmr233077515e9.4.1774352475769;
        Tue, 24 Mar 2026 04:41:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64714decsm33705976f8f.31.2026.03.24.04.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 04:41:15 -0700 (PDT)
Date: Tue, 24 Mar 2026 14:41:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linusw@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	arm-scmi@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH v6 7/7] gpio: gpio-by-pinctrl: add pinctrl based generic
 GPIO driver
Message-ID: <acJ4WCT4ndze2_L9@stanley.mountain>
References: <cover.1774283146.git.dan.carpenter@linaro.org>
 <edd789f8fc87f294211adf84b09c2af9f4aa6a6f.1774283146.git.dan.carpenter@linaro.org>
 <acJyYirIONH3sYvi@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acJyYirIONH3sYvi@ashevche-desk.local>

On Tue, Mar 24, 2026 at 01:15:46PM +0200, Andy Shevchenko wrote:
> On Mon, Mar 23, 2026 at 10:01:47PM +0300, Dan Carpenter wrote:
> 
> > The ARM SCMI pinctrl protocol allows GPIO access.  Instead of creating
> > a new SCMI GPIO driver, this driver is a generic GPIO driver that uses
> > standard pinctrl interfaces.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> 

Thanks Andy,

The driver is much cleaner after your review.

regards,
dan carpenter

