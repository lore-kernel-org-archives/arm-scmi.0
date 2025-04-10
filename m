Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C92C1EB190
	for <arm-scmi@vger.kernel.org>; Thu, 10 Apr 2025 04:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744260033; cv=none; b=p+TmjQksWRq0X1ULCHu4o5MM7ekd97pDXYX+LY6C/eazXS86jKFKJfhBoF1c4Zd3wj5YQHThm3YpCtIyWgQVhkV6/xLl2JdV2yRuDFxPXWDtobaxd9ea411IpF4asx7iZbtdW+CqSrqLvNf4Y3ZjSk0oBFdBRlooWfkxyGJcxro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744260033; c=relaxed/simple;
	bh=sWxyNmIBqTA+5eg4r6AJzmQjZ1/kjCXLuDHCQiD2z9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVnuugyjU6/r5TueDQllyUqaU4g0uV2TATb5H6MhClQaxDDqOt3hKkDPEmEeSeNW9JSHAXMA2Wh5MM+U0k3gg/TkEZdNjF1Pp23IV1+5seBLStUlLeKGn+R3ZIHJo5UapRJ1KoTH73w7fxO/fF49ee25hkMBZAyDXAv7T3pjtqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EkX5hOhl; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EkX5hOhl"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-736ab1c43c4so345344b3a.1
        for <arm-scmi@vger.kernel.org>; Wed, 09 Apr 2025 21:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744260031; x=1744864831; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rG3CCHNXzkVc+H0+6PfQ3HiqfTyNzLew5Fjjk46m/4o=;
        b=EkX5hOhlLGIODHxEPIUL5xlxnVzDher1kXi333crloEF1s+8//P3ZLRWmjKP7Kx0u4
         wbLe6zwkFWngTIkobX6Kr/wkx592j5lJWjoyH5JcBHN3dN+QlV3VuPzvtZEY/qV7dPGB
         pB6cUcYFYjQxXQ3OzLvIuOMrPZCeOJtDUQkgAw3TTqF02DT9cP9mOtYZFhJsV2g/U+9J
         1HLnC2J4X8YNIa3OS8uQL5AxEEd2niLeVLo2qbLxYt8readWsoqwFZtquxYnnrwSVPat
         CmLiNPbfiRkHUpqeuEidKGJkQPft5QfHpI4x2YUJPVlTVOLmo2SLunSFVxKsXxQYae90
         9vsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744260031; x=1744864831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rG3CCHNXzkVc+H0+6PfQ3HiqfTyNzLew5Fjjk46m/4o=;
        b=qqSBmzOFnElaiydq8oK6LXZf96i7cQzDcFy+noDKv/62RtETYu1KHXQZpZhP3sVi19
         yIszcH5mV7P75SYUwsXkgN42TzJEdZuumF5/cCNd4W+hbixgm1Mvxj3C3/grC0fnikIA
         rHfCSdqng2nyLwN9KcFYseDdNZwMty4ECZm96JOmS88x9Hr4C82iKsXOWyM8L5bCT+if
         CpTuPfqjScy/DZNoYxA0F/OxEFsKWh5tDzcGkPGscBiAmpEwcANYZ/gtOipLMyiN0NvB
         NsJ6jVjQnGnth/cL8lBYXYHXAK6pbSQ6aWnPbGGNNhv2Vr1BAlrkHpJVUiqdeXro8a/F
         nMhg==
X-Forwarded-Encrypted: i=1; AJvYcCWPFqYFax6UmhzUSpF67A3B9Oj5EGrvnaEiQl+dSsrTEq3viroMzZsUmurjuV5eGX9WJ+kuBA2Ctg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/noNTiQouOr5GRr1aVAzl2t/6uFBq1RpHVZZdfW5wvUGVCHiK
	J+azqcfVmF+lVUzX1h4nevrqC9X+jxW8rh+gitrD0mmcpt/kpROpgT78IxT06Qo=
X-Gm-Gg: ASbGnctU6+ac1/0l03R/2e8sHDPAM6jsWAq/Iac2ahkKLptUAG9y8Oa4W9q1Cst9bHs
	kXWCezfaxNM0UdMPsbxGlZwf6NInWoqKxwXs40MTbtsWidBZByowhmG08b9IabW9eDOqBspQduR
	PFDeGst5EFkgzTcSwMAl/7lrbkAvGNsA1k3WWn00/Y+t7cXfFm1MLVEiZJS47AcIA/mmIySQzWD
	ux7mHmftMIi3F7w/XVqGYX5Pp32u2S5eoDoaFq+BOl4VUKC0hle1NCLjIF8/cfchSW5pvcyQ250
	JS9+lZxy+Vgdn0jUXq+sVGpKSIdf0ymuvs5q6rZSTA==
X-Google-Smtp-Source: AGHT+IFgRbLrUZ9NDazqU3l/f+bQGBqmoIwoUvJFi0i9jATU+nvyQ6g9ESyfUs7smCpWRcGzZPw3Yg==
X-Received: by 2002:a05:6a00:178d:b0:736:a638:7f9e with SMTP id d2e1a72fcca58-73bbee5477cmr2498194b3a.8.1744260031291;
        Wed, 09 Apr 2025 21:40:31 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e694efsm2272421b3a.164.2025.04.09.21.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 21:40:30 -0700 (PDT)
Date: Thu, 10 Apr 2025 10:10:28 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, rafael@kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] cpufreq: scmi/scpi: Fix NULL pointer dereference
 in get_rate()
Message-ID: <20250410044028.ancslars65llmgck@vireshk-i7>
References: <20250408150354.104532-1-bsdhenrymartin@gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408150354.104532-1-bsdhenrymartin@gmail.com>

On 08-04-25, 23:03, Henry Martin wrote:
> This series fixes potential NULL pointer dereferences in scmi_cpufreq_get_rate()
> and scpi_cpufreq_get_rate() when cpufreq_cpu_get_raw() returns NULL.
> 
> Henry Martin (2):
>   cpufreq: scmi: Fix null-ptr-deref in scmi_cpufreq_get_rate()
>   cpufreq: scpi: Fix null-ptr-deref in scpi_cpufreq_get_rate()
> 
>  drivers/cpufreq/scmi-cpufreq.c | 10 ++++++++--
>  drivers/cpufreq/scpi-cpufreq.c | 13 ++++++++++---
>  2 files changed, 18 insertions(+), 5 deletions(-)

Applied. Thanks.

-- 
viresh
