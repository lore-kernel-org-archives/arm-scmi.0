Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C358E3A9D83
	for <arm-scmi@vger.kernel.org>; Thu, 22 Jan 2026 05:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769058899; cv=none; b=fKNF/MQ7pFoyahflY9lRlMEodGjyEzZZsGsjQkeQHQRwIuWvm5SdVu++OaEeluqTJPvR3yEnIvo2d8J//9Hr6g9sZAEoNwfdgWCkAzp6292IIAVArmumGI4fwvXFkVD1FF6md4iQvvvAmSH768uZZ8ei7DpklBCDBz0jdbZx//Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769058899; c=relaxed/simple;
	bh=+5CgNU+lYomLNElkoVOPBVon25ECkJmzZFugRgC24Vw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Htqxh+/KKtE1/nfICHUzY5NzT6NR0BxG3Cvdu9380Wv/emMdu1SNpecDhuvFxzlGj9FrcWNCcJO6h8A8Cvf/yNtk+lM65Xz0nSmoIEpWOsUxKMux5c7h+UxkwyCwdIa39ldfCB3Y5Y7ZwJrR0sawPZSEXMpc8xFP4xg4tykYgFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MQXa8+bg; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MQXa8+bg"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-81e8a9d521dso382064b3a.2
        for <arm-scmi@vger.kernel.org>; Wed, 21 Jan 2026 21:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769058897; x=1769663697; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cDSH9T22AnGw42Msn1988FOkNE4f4GpObhLMn2Rva0M=;
        b=MQXa8+bg5x8QSpcAd5xUNfn7rGWW41hWkuz61jzTo8t23Y6uALiZ1VyU7A8WWWFjcV
         R6FzOKtWvnhqdN3y7tW9j3YbhZx3DQ1cX+CoWBXC3CD/MaQRJrZPUEtCf501jrNPVKFV
         1vz+TDIB7XGuemSKJOeK9U9JhZ40off02MbSCZIhnIxCcCLpJqYK36ei66QnrWjZomvm
         OgIKBOVSRs84FsNEkemAwhsaHM4wwEFxREugf8ye6E3o9JPYki+olGWjfeZ/gIQ3mN7Q
         +utYvQWWFqF92f/WtGuvOutZ4Ym82EPk3XEY/Hfkr4/2BjutRBXzpfmYT6KJKhgGGfZ7
         7QuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769058897; x=1769663697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cDSH9T22AnGw42Msn1988FOkNE4f4GpObhLMn2Rva0M=;
        b=sonTEWUoIWlMga/Yjtk4afXSoQ+gQUTJzQeXrmYf3XOoOJ34oerIT0VXMbz6SM5/Nq
         yLloRNXSjjP4hrBJMx6Y3M8iBBIAVNxPvLWw+tqOEyipZb/mhtgVM6plisncLLop4ej+
         +b3PCX2XEGz2r2qU0vwGqaYMxDkl+DAVMLf5fdZCCSDq/j32F8jMcM9xquh+m06d5P6+
         5DR9V+RDFEISSaYkMrSKCiqQKHY5B8JhmxTOeWoiCPivrCyE3JzsM9S53zNmQYWWmKSs
         Eb40pPchtBuyahbQVX2pHAoQ1hGXl75EykEVRTVQFnVM0Z0NejCFETwpgF+NLXEXNWw8
         3INA==
X-Forwarded-Encrypted: i=1; AJvYcCWaE5s/RC41ZxhKwx9DLMHBOYLisAT6Kudm/mn+iDmvauUgY4JZuOdi7exBTPA2x1+ySFx9rU3LPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWQwDe0mDxc+iv22BC8s1wJbIpg3N/rkQGwLBiTI3W5+w47hwN
	adDsYFe9JANv0rC0LhXVsLEN3e3N6/0cTjhfcqIeqED98gN8DbgC9mbExNvCjKMupAg=
X-Gm-Gg: AZuq6aKJblARKF4+NKSfjouKRjfD4DyTnj/McC88NgJVGI/xzQJG9WhUQJbvQQaD40x
	1gV89jPAieeBpQOWdVihethCEekAP8oIZcznEHawftLZxqwEawEndPrvKtL333W5Be6kCi5Q1pq
	8CLex/TnESfe8e9qdMSS/jdkHGQ1gWFlwgMyAZgXaJDcefcOx6oor5ltn/vTBU1u1Zx+f1oPWD5
	8D60+/IQjFAd9qjnYCCzMuJH8HhU1lHGZ4Ps3NxSOavesj/OqVyaGzXJNd6w4gVtp81eKkzVDc0
	PpKsF+qi6Xkk8hwUKK17Bh3l7+NqlFhWUeIkbbdx4b3FJcxdZRXLAQw8xPC3UZpicia9Shs8Mzp
	uQSA3mu4k3X8bg488PE2cG5I3D9syyQN+gnwcZHT+A40/MxU2NRv7Jn7G2PDCyUPXxWZFb2dw4e
	wcTFE9GgWah2Y=
X-Received: by 2002:a05:6a00:3926:b0:81f:b97:14a with SMTP id d2e1a72fcca58-81fa189099fmr17209182b3a.61.1769058896603;
        Wed, 21 Jan 2026 21:14:56 -0800 (PST)
Received: from localhost ([122.172.80.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa10bdafdsm16573033b3a.15.2026.01.21.21.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 21:14:55 -0800 (PST)
Date: Thu, 22 Jan 2026 10:44:53 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: scmi: Fix device_node reference leak in
 scmi_cpu_domain_id()
Message-ID: <yjiuqamotpwvojo6hhj6w4nqwkq4i3ynhzemkwughyxmtlyrnj@wdhojg2m344b>
References: <20260121-b4-scmi-cpufreq-v1-1-b0547210feac@gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-b4-scmi-cpufreq-v1-1-b0547210feac@gmail.com>

On 21-01-26, 23:32, Felix Gu wrote:
> When calling of_parse_phandle_with_args(), the caller is responsible
> to call of_node_put() to release the reference of device node.
> In scmi_cpu_domain_id(), it does not release the reference.
> 
> Fixes: e336baa4193e ("cpufreq: scmi: Prepare to move OF parsing of domain-id to cpufreq")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/cpufreq/scmi-cpufreq.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
> index e0e1756180b0..c7a3b038385b 100644
> --- a/drivers/cpufreq/scmi-cpufreq.c
> +++ b/drivers/cpufreq/scmi-cpufreq.c
> @@ -101,6 +101,7 @@ static int scmi_cpu_domain_id(struct device *cpu_dev)
>  			return -EINVAL;
>  	}
>  
> +	of_node_put(domain_id.np);
>  	return domain_id.args[0];
>  }

Applied. Thanks.

-- 
viresh
