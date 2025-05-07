Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB264288C11
	for <arm-scmi@vger.kernel.org>; Wed,  7 May 2025 13:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746623921; cv=none; b=RFWFw7L7FGPdfsEYT9+cFQFCNRtvIRsGZm+ABRdd2SCJ9udjeCbAWSykewAgaJFJIbrEHYs49JUv3Vw7F/edh8Puxy6TxPnxNSoFQyL5/wyr8xx/ImZhI4JehSuIMDdppsJhHP0IV8/fpqbUWT/p928d/TV6ZMzMDiQhwj3O6+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746623921; c=relaxed/simple;
	bh=vANADi+020FCH5I2njw3FMWd3fKb5Ttxnfby5ZW9V8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BVR0CJMfeN/7tU/GYkuaagi1U5ha163hPx6UysdbNVoFA+ckB3MoKFH+UXuFbVwwjEl0cZKUlG6bXa/cVJExbUnU/8kFWKfpEHJh4nLfEOkMIf9uquDgH5Lvb/Ed25UD1oJwzOUcLfYio6y/R+GjNwlcMDQCxJGgDgLmTzQw1bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sOQUj9rH; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sOQUj9rH"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d0782d787so44054885e9.0
        for <arm-scmi@vger.kernel.org>; Wed, 07 May 2025 06:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746623918; x=1747228718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mMwJyAtJK/aLIyT6CLn61d8dMsByyOcrMzhv12s06BY=;
        b=sOQUj9rH/JgpwIXZKDU0vxXibY7ngcB5Zhta1Ld9Tw0B+eqV//1Tfnvu1x229JHoyd
         C1FCWmHeVXCv1W4HuqLOUbbI6UeHytrLg8zOd6GYrckEooLWXGPHG8pDCqn9Hfvz9CXz
         um+kfAPh7+R+ve7rLwQlpaUInSmHus7lOeE2GONq/k+45lrjIcmGdsUoU6mY3HZeQIpz
         58J9aIpYZVs7sdLhnwIxCEoKXQukEsn5/U2ZE/ERjC2K5z3F5HXOuWjL5SW4fhYuLQwz
         0qdyaQfhWPwe0wqOAuumot/HrDgedba6t5rd3+AeMW0eh9uLFqEPaTkuTavgfXDBcP4X
         t8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746623918; x=1747228718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMwJyAtJK/aLIyT6CLn61d8dMsByyOcrMzhv12s06BY=;
        b=cO160N+rOI/AizHd0ZN0sVIeA20rOz2sf+K7+lGYbX5AZee670sfTqO72L0Md6e4fV
         d+A2LjMSIAMT8uXVG2d7y25CMLlhaVaCT6MJ7Cx/H/nPe/56CXBDaxHwG3azD9uVMuOv
         LzpSD2MvV4woc0LmLjL04revMpbn1biFY8ipVh/u1W2gor2d/yZA9s14hdXYUxARR6zz
         8smd+Grr/njQgWrI+JsXhXisYyupcTHOXsVJDSPEHpXoJXFNaRMdYbF4EcUAY9j4dWjA
         AEUTLeiwPN+XQu2SoK0vOlqHL3InvhJeM1K7t6EHV832ZfyQ4Px5+bod6HGLhFS3kNdA
         nDTg==
X-Forwarded-Encrypted: i=1; AJvYcCUteF+B4TVpBS5/rdxFcxxdP6XA5mAGuVwkqfjyGp8l56XShJZQ2Ex0rQqaIFe/OXCcl5n1eXStSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMZ5oNaF0piCWDeCEOIixHS/O3RA7ZNwns8Vojkcg1er1SVvDX
	NdtaKhuLzoQOUbUpbu/feDpXJmCwA2sGVhubiBAPO2T+B9qTwABPYQa/XBtO+jU=
X-Gm-Gg: ASbGncsnOWGlQ7IB33ZJbQt/Dhju8WqKZGgy/7NBbMLsjA3EStvm3NrjSPDrnagZoBy
	5nm6ncnK4ma5cY5f4cMtJtr1WhusNlhFO/4ml1NxmbUlDtGoA6Ayw7uhxULA8Iyv9rmZmtK/raC
	f4Q1YwW8z4GcM+YOJ2mPhcldzgi+AZQVGjKIeH95rOomkEyDbC26RCAfWgYO8fgXY9YulVvnnb5
	6vLmueBEXM04Sm0EQ6XNLTe4C8TBZkK0FRA/virddA46KhHgM0Oxs2ZotYVW6N36rim0g95ymDq
	kxJWbJArdlx0gTnn+KnwySZd37bv89U62v8RBNkBLOgM4A==
X-Google-Smtp-Source: AGHT+IH3Qorr4/m1vHEg7Ot9UQ5uCqOCNeK+Gmt1pu97YiZ6JvL10Fw4EinSPUDzBFREtrSqd0/vwg==
X-Received: by 2002:a05:600c:6085:b0:439:643a:c8d5 with SMTP id 5b1f17b1804b1-441d448ca1bmr37445495e9.0.1746623918101;
        Wed, 07 May 2025 06:18:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd380ca4sm629535e9.36.2025.05.07.06.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:18:37 -0700 (PDT)
Date: Wed, 7 May 2025 16:18:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Mike Tipton <quic_mdtipton@quicinc.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@oss.nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3] cpufreq: scmi: Skip SCMI devices that aren't used by
 the CPUs
Message-ID: <aBtdqvyT4Ded8Lht@stanley.mountain>
References: <20250428144728.871404-1-quic_mdtipton@quicinc.com>
 <aBtLMYqcnwacGJuy@pluto>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBtLMYqcnwacGJuy@pluto>

On Wed, May 07, 2025 at 12:59:45PM +0100, Cristian Marussi wrote:
> > +static bool scmi_dev_used_by_cpus(struct device *scmi_dev)
> > +{
> > +	struct device_node *scmi_np = dev_of_node(scmi_dev);
> > +	struct device_node *np;
> > +	struct device *cpu_dev;
> > +	int cpu, idx;
> > +
> > +	if (!scmi_np)
> > +		return false;
> > +
> > +	for_each_possible_cpu(cpu) {
> > +		cpu_dev = get_cpu_device(cpu);
> > +		if (!cpu_dev)
> > +			continue;
> > +
> > +		np = dev_of_node(cpu_dev);
> > +
> > +		if (of_parse_phandle(np, "clocks", 0) == scmi_np)
> 
> Shouldn't this, on Success, be released by an of_node_put() (or, BETTER,
> by some OF-related cleanup.h magic...)
> 

The cleanup.h magic is __free(of_node_put) but dev_of_node() doesn't
take a reference so I don't think it's required.

regards,
dan carpenter

> > +			return true;
> > +
> > +		idx = of_property_match_string(np, "power-domain-names", "perf");
> > +
> > +		if (of_parse_phandle(np, "power-domains", idx) == scmi_np)
> 
> Same.
> 
> > +			return true;
> > +	}
> > +
> > +	return false;
> > +}

