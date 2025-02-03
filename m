Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2CC201253
	for <arm-scmi@vger.kernel.org>; Mon,  3 Feb 2025 10:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738579911; cv=none; b=rQBicxe6fzvYwx2ITUM493GLxjxtThkyEEVV7zqJiq28r8CEUpjyoaXiz4ArAtyffgHZQL0SFcYE5/BfP5R9vXNkoPFuR3gMi65Dda6CCM14aWBInk+BH9e9XtCi8XZR56bmkshNMlj0pLJR1lWAPtNfyNi19DRRerOEvuEJj8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738579911; c=relaxed/simple;
	bh=gJC4QoiK8MGigX6f3IDnwGzKPQ76ZnM7gy6Q3GmPbPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SFPp5Rx5NFa+wel3K8/soU4hN1pzAHnQSfkImPbbQXBRTks5pgTaFEN6kdO2Q+rX4xudeUr+u59xu+C6RsAuzDPJ3AUwB9hWucWyJDrDEa86JQRpmwCqTkPLIgAeshEMsX/VsvEn9ePrrpCEvBsOuIkCw/7DnbS6OwMHTDCnCho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PjGpBAiz; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PjGpBAiz"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21669fd5c7cso71596235ad.3
        for <arm-scmi@vger.kernel.org>; Mon, 03 Feb 2025 02:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738579909; x=1739184709; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TpTYY6NVHOTQPLmGd20ggvva9b+UkoAqQ2BAc0zy2SM=;
        b=PjGpBAizk3WBsKH+mvf4Euf7wN9WJ/bCh9s4uqYerP96BExD84Pgbb7rtr9V5WAY16
         XKuZx7/h8v9QsWd2/hNjGRErnjGtBLgHfsOy+KCD3I2OOqaEtpWB8tD14KNDk1RgOk8t
         /iodKbS06SDU2n6yYEPuA5y51PeVox3Nl5Pw0PHux/3f4/+qiU2J42w1GO9Tqo04GJ7X
         i/eN2BButEoFzw1Zn5nmZXt2Z/JfJE3j/Z9xlM17EhdQsdfPJ8r7qjYxW0Q6WGklK7NG
         698Jo6ngdBc0VIz3K/VDN/45q/zn+Af0ZXWQJBdfQtpsoTRmlE7Qs6VRVfEuaoEoragc
         ohnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738579909; x=1739184709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TpTYY6NVHOTQPLmGd20ggvva9b+UkoAqQ2BAc0zy2SM=;
        b=o1Bvljjcut171M1C5bUaWez8qVB6E1Nmjsukzawo7oZr3uXBzpXhuRsFjmdzbgaEvc
         ptrkla6atm4gretVIorOXBQdn/D6AFV1uPlBwPwEntZinwOYFuBoHPwCHU49gklc2OHl
         K7SKSxjkGQcJbJovvcLCM1OclnEPrSqUKRcySEtME6OZYH+JougUg9gl4k+9/qaV6xyE
         wao5oxey4+BfdhVZxy2fPei1ldY4CxVaywZMGvcRev0D+DbkYI+zB9GSpoJP2XNlYn+H
         z9C9TdqBZaCmCRHGFNgaTbhOI6wHCTuG7/kw7nTr4c1oAbQA8Nl/zs8dokPqrZEykp2l
         zOsw==
X-Forwarded-Encrypted: i=1; AJvYcCUqhkbLQYram5b/rDdCDmMURYyOM9CSWdNOdnThdtugbUaJ7cEND5KO3B4e6++OVEZwtDuwnmP4DQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1sDAahfRs35fLpDgZi5hLZMSicp4lVOrWGtQ90kL9kKZ509xk
	p9VkbxveT9plZwAgL7dbpwlW17KMIROkz/+gVdDx61BzCTYMzlu34G3asr5TYGU=
X-Gm-Gg: ASbGncuuk8oyyLe6YsOQeHZiZVfnxSGwdZgOR7RqjHBDG8DqPJE9itinH0Nlsgm164p
	nHQb15wKg12RzkQVCkxOl7WT42IG4QXLMaL00eBKLxA9D1k5HkNSlcRWXoCQiyCWem0AU8sl4OL
	Iqhn1TocgyehSSpWpmO+SFgFz1bfGNi+1GwVO5RyE2VOctNHOxhjhz5mNG+0wjeQdyxtRSEM381
	VxrLnRa/sARr41LGpoagv+TKIu2M5OalhwAs8r4PsNqefGu5FgwU308R+HDb1KED61u0KPy2/CT
	6xUnB1hSvANBXFarjw==
X-Google-Smtp-Source: AGHT+IGxMLDlIMSaw3Z8cWeu4NnMK2JLensF+qmNnQk7oU5j+h5mOuW/KaB0EYuSyfJh18W/YDA4sw==
X-Received: by 2002:a05:6a20:9188:b0:1e8:b17a:a556 with SMTP id adf61e73a8af0-1ed7a5f9136mr35623177637.15.1738579908746;
        Mon, 03 Feb 2025 02:51:48 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6a1a766sm8026943b3a.161.2025.02.03.02.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 02:51:48 -0800 (PST)
Date: Mon, 3 Feb 2025 16:21:46 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: zuoqian <zuoqian113@gmail.com>, sudeep.holla@arm.com,
	cristian.marussi@arm.com, rafael@kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2] cpufreq: scpi: compare kHz instead of Hz
Message-ID: <20250203105146.6yuzypgb65bu4xrq@vireshk-i7>
References: <20250123075321.4442-1-zuoqian113@gmail.com>
 <20250125084950.1680-1-zuoqian113@gmail.com>
 <967a5b3e-197a-4b90-9fe3-9b10782d677c@stanley.mountain>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <967a5b3e-197a-4b90-9fe3-9b10782d677c@stanley.mountain>

On 25-01-25, 16:04, Dan Carpenter wrote:
> On Sat, Jan 25, 2025 at 08:49:49AM +0000, zuoqian wrote:
> > The CPU rate from clk_get_rate() may not be divisible by 1000
> > (e.g., 133333333). But the rate calculated from frequency(kHz) is
> > always divisible by 1000 (e.g., 133333000).
> > Comparing the rate causes a warning during CPU scaling:
> > "cpufreq: __target_index: Failed to change cpu frequency: -5".
> > When we choose to compare kHz here, the issue does not occur.
> > 
> > Fixes: 343a8d17fa8d ("cpufreq: scpi: remove arm_big_little dependency")
> > Signed-off-by: zuoqian <zuoqian113@gmail.com>
> > ---
> > V1 -> V2: rename freq to freq_khz, change rate to unsigned long, and
> > update patch summary.
> 
> Thanks!
> 
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied. Thanks.

-- 
viresh
