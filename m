Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A84189B8B
	for <arm-scmi@vger.kernel.org>; Thu,  2 Jan 2025 05:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735794017; cv=none; b=GzwHvRmYFsFlqAt0XgnrciFvMzumJ2zlNwUSXpduSK2ATB8v1/xT4sRbfgaXlcjuu5nrbv0qhLS8hMAmNojGzqbYKNu6dzWLiOLkWY2WEqN3+CTgJwJbSTuNnD+sshLK+GW3SLMwgL/Hnb5sOqJ7aujiUaKFy/bRVPz0DJzjtNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735794017; c=relaxed/simple;
	bh=PUPDyZt8sb+oTvcqxQxTqbwlTwIcia/v4J4Ku2kpjJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cbPS4LxU6cD9TtudsBZcfkuvGPd2J1xq8bz8m9OOhXbk8HVkoT4dA3xAXkUEd7oaiHvpHfrYF6xoJFxB2f7dDmFrNqBAi2sO9HmNelG0uSAQRXbs1g7sMARZ5nAk3WMXdXVqXo02tkC1CQbS8aiwhxCesw9RYUBUA3tCpuha+n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ut4qRH38; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ut4qRH38"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2156e078563so129155815ad.2
        for <arm-scmi@vger.kernel.org>; Wed, 01 Jan 2025 21:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735794013; x=1736398813; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A/1bp2PcKf40TQFroshO2jGmCGJEJGNa02FuKdy+K6Y=;
        b=ut4qRH38FQyX7SgfJXIKJnUgmMG/Kr2ifjXBRtErJvubD77m5zB7eKvbfpxmbtAheW
         QPl5PeSko/GL3zAZ6fzDq/LFv3/ETui6j/A2C4ErYwsSClvXLykxRLxaFEKzSriqGzBs
         esFsnLvRRe/wP/cthykEbqGhRxXbhjAMMyxjFL9c25jr7b9uvXMEHimbyWRL7Ge4VXwt
         gkzUVAj4OdyV3zSQ1hAobgbVIGc2N1uX7+4l0jxkLc/p8or/xGcESka1hp3Zhir/4L1x
         CmxuasaGXh5335wLt+lVnLm+C9/ioD922SakNkR8XVypbmHcQzH+BcK4J6c1FiecjS2+
         b9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735794013; x=1736398813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/1bp2PcKf40TQFroshO2jGmCGJEJGNa02FuKdy+K6Y=;
        b=K3Isy9cOQSCCCwRu0IR+FSJnMn2O4dGZq+q0H6IRte7xwBJh81qZ4aqVnmQmodHMPD
         3scqfXW2tI+EA5FGEjB2fxPGlJ+hUPgU0e0mBYbyUBtdloMTMZtgp+SvyxZjlkemeLmT
         V9M1nRzAXz+ebj2XyHnGycZwL7LMSHNavLtLkjXxQtEYpmmsrNlrP/IG/jwL/yEcnzha
         HY11TaV4Aj95BK5qoSUYAU95QKQTZdWZh2ogKComuNaBH0JQIj63ZDo1VyW8wCI0Ks+b
         /z9Af8iZsbTdUwHoQGpPo4CNALxo/dldVvQVJ2iIE6nEPdKqkU0chMZyC4O8rXqGX6mn
         Cx0w==
X-Forwarded-Encrypted: i=1; AJvYcCWb/3ufnNFmQKVl6C1rv47p4jHhILGJExadyddMpBzLgbYGDK3RAy3QP0CBqF+uL7hgTcztTG5mAg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpn8GmYXrHZhw1CAAIrgp+HuIiQupGL99kwOGyib02jXatne4q
	wjjggY9NCW/g9ThFMmSQbzBCYmAG3cBfWd/M09Ry4h3JQ99vGBZKEnz5sNqqhpk=
X-Gm-Gg: ASbGnctFEDg+l8wdBJDmzyYFxrn3AIm9rXHO9unuWLT0f2P7AaU8DqXBkqjvVONr/SA
	uWefeYSfPJL+MciAcGcfYa87JrT0aIQ8bW7fDnrVfT0JNJqxnKYv2UVFzq/P+Ja5utIpEi26X8x
	b9LHxGocePkKfZ5906lG4WYi8aMcfn5xtyBTh4Gp7d6AxO1vwLwisDpkf7Wa8J18CIkszqtMc3t
	W6AcDrtCYUWEgc1OByF56W7ksNMcx6ESf57ZTXh39zCz/p5teyXdu7PJT8=
X-Google-Smtp-Source: AGHT+IGwZt2JFNHPzwT3nkSeMpu8p2mdONKKDTn9PLQBRw9qGtDV66wcfRl5C8C59VP/9aAWObVl+g==
X-Received: by 2002:a05:6a20:7f8a:b0:1e3:e6f3:6372 with SMTP id adf61e73a8af0-1e5e07bc390mr63987273637.27.1735794013408;
        Wed, 01 Jan 2025 21:00:13 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842b821da93sm17980901a12.38.2025.01.01.21.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jan 2025 21:00:12 -0800 (PST)
Date: Thu, 2 Jan 2025 10:30:10 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Charles Han <hanchunchao@inspur.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, rafael@kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: scpi: Prevent null pointer dereference in
 scpi_cpufreq_get_rate()
Message-ID: <20250102050010.gnvf42r3v2ey7mww@vireshk-i7>
References: <20241230093159.258813-1-hanchunchao@inspur.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241230093159.258813-1-hanchunchao@inspur.com>

On 30-12-24, 17:31, Charles Han wrote:
> cpufreq_cpu_get_raw() may return NULL if the cpu is not in
> policy->cpus cpu mask and it will cause null pointer dereference.
> Prevent null pointer dereference in scpi_cpufreq_get_rate().
> 
> Fixes: 343a8d17fa8d ("cpufreq: scpi: remove arm_big_little dependency")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>
> ---
>  drivers/cpufreq/scpi-cpufreq.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/cpufreq/scpi-cpufreq.c b/drivers/cpufreq/scpi-cpufreq.c
> index cd89c1b9832c..c888ed3a0de9 100644
> --- a/drivers/cpufreq/scpi-cpufreq.c
> +++ b/drivers/cpufreq/scpi-cpufreq.c
> @@ -30,6 +30,9 @@ static struct scpi_ops *scpi_ops;
>  static unsigned int scpi_cpufreq_get_rate(unsigned int cpu)
>  {
>  	struct cpufreq_policy *policy = cpufreq_cpu_get_raw(cpu);
> +	if (unlikely(!policy))
> +		return 0;
> +
>  	struct scpi_data *priv = policy->driver_data;
>  	unsigned long rate = clk_get_rate(priv->clk);

The check needs to be made after all the variable definitions.

-- 
viresh
