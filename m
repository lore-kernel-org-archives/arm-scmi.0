Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577501D5AC3
	for <arm-scmi@vger.kernel.org>; Fri, 24 Jan 2025 03:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737689847; cv=none; b=CNOA1RYWQC8aZc4ZXqFBg8qJvVRqR2h0o2evHJi1Pgj58AhGaD/eVQvAvVlyIvKkgwMEOYkKvJ8m4fX8f9SwXBY2lvQv8o/vEJ9mCTTcIXXHYUggwtWk9Kb8tIIVzyD0jCsfGQEvONKcjzursU1UXOaFCy9vOFWB30y/hd+v0uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737689847; c=relaxed/simple;
	bh=7PeT66ZHJna2PFS6b6Jwtyo/Cg90Kch+Rm7oSQsfTIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YytWZAREL121uWTVCsd3head5AXFyzSOSNNWnhxNW0wwdmj50bQaIoGKWCJ4PJ4CYNpBCdKGTovBXIfJB78ArCrdRb6H2YOwHlgqXjWIUPjEOrJ1peLvP6Me2a6BIrjYYhJBrEMAck8auyvs5PIGtDhtg6xVn2f31nji0uMAFg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=asLNcr/O; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="asLNcr/O"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ef6c56032eso2317042a91.2
        for <arm-scmi@vger.kernel.org>; Thu, 23 Jan 2025 19:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737689845; x=1738294645; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+LifBFldK/SpUUkgRIniyUZ0w+Qs+4h46zuwK1mAJwE=;
        b=asLNcr/Ow8uYR1ZSI9k3E+cbD34fr8n0tFH9u/+iNhxk6GTeh6oj/+nINShLhv60by
         9BSzpwQbke/CFMqPrRObMVSwy3LkALk9IsdW5HxK2mHEAk2tMn8JScsM/4/TQ3cdAXx8
         rJcFJdPKVtWCOo6aIqNlG/ifNp2dcmLH5pzxuciaJ1gCWmwNxOk2zDNAgpIwCD1/5vwO
         uIteu1UhZ3FhB13cPVCuYu5CBjvGz+kGsDvVtOJ5VbwCu3o/0ePgu/9djDo4/670GkGk
         qrv9GOBKMzEl6a2KsUhxxhD3SP+gwbzmnn392ZJr4As/eyngw6tIiB16kn08+l93fhn6
         GVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737689845; x=1738294645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+LifBFldK/SpUUkgRIniyUZ0w+Qs+4h46zuwK1mAJwE=;
        b=fvRSnhaCepAqc5iZ5F63gjdEmkcGNBN1TH73dYCVVBHWPvNuqYjOMatlwJ5Yg0hZra
         KJQDO+4nuDjiHM4nds4yvQgE0kirz/F7VymNUn095uP8fqonkmJx12HZGutN5SHB5T1N
         sXe/JfoUQbuhcwJBRQqJtIsEvTwoTIN4tqm+xw9QjxfOUeSnlqz4EdFPtkVWTJxShBPk
         OLqBRBHUsaSZLU+N5A3OkhwL5YrlQS4FJkskIswwI7zMj7plgyP4vkg6i97bSOaMHjPT
         djN80XZn0fkzO5cAeD7dymbHa3WYYBodzoHzewOmdIOuwuHngBCSLJsTEwg0KUbfpLbL
         BrCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUr/bFCmrRz5D/BskOCx2uh06NEOqlzRv6VZE1P1HsmmwAtoBKvMi58Xoq2wWbDin5X2fbIZV7ILg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk9Fo3U3u1k8A30u+D+A8Eq8884xoT3MuWUmZLLCOmBCkJYBQT
	dDBNP+QTVbuPiMq4kG+9NBhGo51yfWibN6aNeOqjL6MliFucBKDsV8EO9aHiobQ=
X-Gm-Gg: ASbGncuupXQWkAWdnxopuNNma1OqCCLkoIIBjd6fidXpb69hIwAgSMI4Ix7rpMwzpqS
	FSnllD4ki+0SrDq0fUDNF7mp1s7SjMYFIw3Mhv2uP0R71jewnUW1S9Eoocl3cs8CVKF5XGUHuzc
	lEzWAqupjIuDnu1IyQxnY16rIR/GF3udUihZ5CYK867sRkDYvRxtm2Ffk0HbUS8CbDfd7VpnTIO
	6UnArvF53T5ZWB5TCDo3pggRJKB8KKMM7imO5y0NDSDSu3ChGZXkG4HdEVyFpL9oXGjfzmJK7X2
	HVch4dQ=
X-Google-Smtp-Source: AGHT+IHcqfC+v8gzUXazCowAQBPBuxdQoh+SZRxB2j3/lIdPn6sKxbgWfYj8WfYvtG+U859TlGDWtQ==
X-Received: by 2002:a05:6a20:72a6:b0:1e0:f390:f2ac with SMTP id adf61e73a8af0-1eb2148e003mr42405519637.15.1737689845619;
        Thu, 23 Jan 2025 19:37:25 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a761193sm775883b3a.93.2025.01.23.19.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 19:37:25 -0800 (PST)
Date: Fri, 24 Jan 2025 09:07:23 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 24/33] cpufreq: scmi: Stop setting cpufreq_driver->attr
 field
Message-ID: <20250124033723.akxoajfjct2ju6n6@vireshk-i7>
References: <cover.1737631669.git.viresh.kumar@linaro.org>
 <d4893396c4bacdd995d03a296b9d3ff44e71d072.1737631669.git.viresh.kumar@linaro.org>
 <Z5IvnF_dw3ez33Bv@bogus>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5IvnF_dw3ez33Bv@bogus>

On 23-01-25, 12:01, Sudeep Holla wrote:
> On Thu, Jan 23, 2025 at 05:06:00PM +0530, Viresh Kumar wrote:
> > The cpufreq core handles this for basic attributes now, the driver can skip
> > setting them.
> >
> 
> I know this is boiler plate commit message but it made me go check if boosts
> are handled too even though I checked it in 01/33. So if possible, you can
> add "basic attributes including boost frequencies", that would be good,
> aligns with the change below and makes it easy to refer in the future if
> required. Not a must, I will leave that to you. Anyways,

Even if it creates doubt for a single person, its better to go fix it
(for all commits).

I will do that while applying the series (unless I need to send
another version now for other reasons).

-- 
viresh
