Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C6D4CB5B
	for <arm-scmi@vger.kernel.org>; Mon, 19 May 2025 10:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747651219; cv=none; b=Z+mvNCX4+qMmrl0A8ez+9ak4cRzJV5xHuzWtPAvBtL9D4h+kG4C4fxGrueMlbaSYMOVsk4+GY0zgBgF97q3qjfJq+uwqK7v1UYW9U8hlhfCOg6fhQYd6X0sRfyFAOz+o8x72ySqtq7Kjo/wrUHiW5qQcLZdrTa2virkAh2JUTAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747651219; c=relaxed/simple;
	bh=/Vmq3QFqnBlwuwwR+4xyRvi/TqRMdnogscI2G00PWto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pZjn7EmgB/3/hiOr0rLlPmjC/exyTcYe6wLNQlql9LSz2kEd2oXBRo9tDmPqP53jREBfdbhOwdRAa8j+drg6Q7kOGI5oZmMhwbP3w2KykrnnqrICApsUp4pBd9IkOcq7udSTvzjBpTACf/u0bu3fSwjARTKFHTNyLt9Qu0aZnyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kNqFJQy2; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kNqFJQy2"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-231fd67a9aeso15083055ad.1
        for <arm-scmi@vger.kernel.org>; Mon, 19 May 2025 03:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747651215; x=1748256015; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i/aIx7AvdzS5nlXdZ8v4o/L4Qip57mcjCKYS6Puq9LQ=;
        b=kNqFJQy2TEm5Y4Gjl6B5LCjDKKjoYIwMG4kwifLNNegw+vAfKCl/G6Y0CNZdq5Vzgs
         NKjA9BkTm/JYrfewSN2YtEEQDfHgH9wU0O3DgOE/VTf4vpGZluS71v0Up3S43xY1Dw6I
         CiOEd2sBKm7iprYQP8xneVLewfdd+fZoqzxqgOvxGqgQTw198u8DnWACUWWQovrSnpPA
         mbBuy2H9c/JcVEuoTbDqcKGC7dgxQvoovE7qKpGN6cATZFveG3saN/w1Gnnp6CM5SNN8
         NFjIN2YmXpKtQHLTWK5/VdH+J4z2HujBC4nGLatM1b6PndOufWeT2kVG4VPic8nUKoak
         nOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747651215; x=1748256015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i/aIx7AvdzS5nlXdZ8v4o/L4Qip57mcjCKYS6Puq9LQ=;
        b=C54B5AimxvjC1663aRYxApzRyFc/z/C9WGJW94oAXqN8tGdDGmiDpzwZGUpaZHtlfP
         f8M10Gnlfo/7TYhtU16H0jx4Ea2PAd/3KdGOo8ELAYZKVSOWdd8y1aiWUolfp6HbkEBR
         Z8Dzu136Qb6j/nTzs+QCXgtQLV2drsjRrqCsJXlTDRvFoxgraEnTgHaKe6Eb/TUrYBOt
         ypeJds/kxL1jZq6DYEJYQZZiup4fMl9TGsktqXiQGx8vz8v8h/hghyHGhzBxID8v8vfp
         ecsQxev538wtuZwhyITIo2HdIefOVIJ5WbhNBA9W+6d8Ng8Mx3wW052xDuAyO/26wogj
         dj9A==
X-Forwarded-Encrypted: i=1; AJvYcCV74W+TDTbi3+1sX5zCHsiX2QMYNs8iRyfvDvQFCFJ2EeyfyJBcb5d6JJ3lTtKRn5Sdofvtf+Z+CA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5AzTkr0pv9O9iuayLd3YMzisDH/tw/RgDwGC92Xo7MNo0H1Vs
	okXzHTFCi4wP7l86jBMjVI9naE0DUjLo84/O9i620m1q8oNBgUMzivJqdr2/6PFhb+nF9Zmj4UC
	puORb
X-Gm-Gg: ASbGncvDTRb9/F93/yqdrLdQIf3dQ8Sq4XHO26Beh8NFv4b0wg+wLy2s5r8KjZSwngQ
	FMcjbzOfY96WKIQ+Bdl2YZkacuflZlx7en/a/a/KgsC8SpDCSAx8vSRlKRb9+OMAgIBNUMV5gxC
	6kzEA6D/ZvGbhDyQ3QGLNpYnfADLu80X/J8f0OXD1Yw/GPaD9DSCGVq4kzwbMyxS+Mx2phRHvC4
	3jDcE5X6rep7zeOTv3PcrjD71igcGCyftZ5/+L+MwDIjbJjptcipyzbaZlR3L/OuBZNASAffwWH
	/zg1kniZR7qh8pur9gB5Pzxp8ANel1JmbaoCnLZIAoOzBTbft164
X-Google-Smtp-Source: AGHT+IGV+/iosPw4tJfGLDNquYrwXS7YO+74bIwXmyBHISJk19CDoPFblHZ0P+89TKUcqBjFApznxA==
X-Received: by 2002:a17:902:c209:b0:231:bc7e:a54f with SMTP id d9443c01a7336-231bc7ea667mr160254935ad.26.1747651215411;
        Mon, 19 May 2025 03:40:15 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97fa6sm56235095ad.135.2025.05.19.03.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:40:14 -0700 (PDT)
Date: Mon, 19 May 2025 16:10:12 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Mike Tipton <quic_mdtipton@quicinc.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@oss.nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4] cpufreq: scmi: Skip SCMI devices that aren't used by
 the CPUs
Message-ID: <20250519104012.acyfoffelestwgtt@vireshk-i7>
References: <20250515035312.3119884-1-quic_mdtipton@quicinc.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515035312.3119884-1-quic_mdtipton@quicinc.com>

On 14-05-25, 20:53, Mike Tipton wrote:
> Currently, all SCMI devices with performance domains attempt to register
> a cpufreq driver, even if their performance domains aren't used to
> control the CPUs. The cpufreq framework only supports registering a
> single driver, so only the first device will succeed. And if that device
> isn't used for the CPUs, then cpufreq will scale the wrong domains.
> 
> To avoid this, return early from scmi_cpufreq_probe() if the probing
> SCMI device isn't referenced by the CPU device phandles.
> 
> This keeps the existing assumption that all CPUs are controlled by a
> single SCMI device.
> 
> Signed-off-by: Mike Tipton <quic_mdtipton@quicinc.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> Tested-by: Cristian Marussi <cristian.marussi@arm.com>

Applied. Thanks.

-- 
viresh
