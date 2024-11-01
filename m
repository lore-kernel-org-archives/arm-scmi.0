Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C3F1C82F3
	for <arm-scmi@vger.kernel.org>; Fri,  1 Nov 2024 16:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730477334; cv=none; b=BBL6wIjAtjvoxqO/dASgyJnp+He0BtFHqo6/0pXtIwaUV0/u4xj7lPYvCM26J2ov5uqbv/NHRLNJwqyFndNjLFaAh5kBk4gzn3WGLad6eJAdtKo95tiAlE6bhUrTjOEgXlKwRpKCPShtdq2apjy6ppQkCXnEBnwLCvpnThhvwHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730477334; c=relaxed/simple;
	bh=nYOS03D73WXwkh3uMse0f8uwg+PlErjkc+2IBGwBliA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t1LE13E8ykRKf/9C0ur5QpNYcE9MNi9WiAR259MrqghMHmo4wwPXdptF4jRVJ5sVzUTxg2rcTXXZArczln0ejOb1P1K9+H+D0t6Pf0smxQLmwgXnF14zQ/WZWWk1BvIpipevuMU5tahOPGIpeD/digj4r96v9DG36iosNGI7LaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nq7yRMqv; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nq7yRMqv"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539f72c913aso3567517e87.1
        for <arm-scmi@vger.kernel.org>; Fri, 01 Nov 2024 09:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730477330; x=1731082130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fnfUPgRTiHx8tHVcTbUwNEJS6yHvfimGI2lUiRJbc5M=;
        b=Nq7yRMqvGds6/7hTxpyYMe5wtnXLKt/IdDwP0JlFx5rdGTJk2dPMepHnupwOL1PowH
         jC42DoQYeN0My1dPzKmwzYaBL88jcq20hP0effBfjO9kOKoyukUEwS9KajXE4/+AeSHI
         CuelYi4zXL1YiAL0QKZDtwniWyCbh0LDIvSqUqo97pud8BvaONCG6z0/7EODJ2DhUZcL
         W6PTHGI+u8/CKeif6WROrIX/MQF5WWkVFjhnRaVa5LuESVUaemyeIxqGyeR3EuQ74Ac8
         P3dIWGUDi+4qs7QbzolkciahZQ6vCmlWyslHny5xLFlEVF8v7aUXz1yMYU+d3k8V0vCZ
         BAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730477330; x=1731082130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnfUPgRTiHx8tHVcTbUwNEJS6yHvfimGI2lUiRJbc5M=;
        b=nwPCf1SwpCwTjL1OUo3SGupVCd/VAYs2GvqsgcJhGU7yjLLWQWLYEDTAwkY6rV+kr9
         0ouwS9VcrG1cNF5FHlXU9p7Uv7HCSe8BDLCOh0h/XZKZqmBrA+kxmQhAXKTfVgcHk2fX
         keWTmzA2d45vNS0UKUYJkTLdm6ddy3IIakIML12331DMWUxLbIatdohUQJH+XnFp2xdR
         LGCa7Zsg4Oc3aPRztkSWdY+RmKoLAMTj894FRsXsDdmJgNvUokeLsALqDnHAETd5ziTC
         4mnPJmOjVjy2DBVykR3gOObD+IAShlU5Z+F0v04QIVWA2EDqtjT5rPofi/tDQuRwAhQ0
         LoWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAz/JHdcXD57ld3DC4CYshQ29OnWUM90detw6GEEKxCKy7fWWM+ExT9ceBRpuk9zzx1FZFTA7GDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyATsrPnUwJ8Z+BHIrdh3/vcZPoLjrf6XgcjF4U+CjbBU0veHjY
	Pb3ckZ03kBCG8PvORiLYr03FrHN0Z9b6Sjor4GOXlphO4uHfoIBHZm8Fv25hHiI=
X-Google-Smtp-Source: AGHT+IFwBHDQva07NktzlRquAs3ZKyk61EvA+sTtOpqBIUartLCG+ASLvvK3zG7C70QVGLgCVKO9yA==
X-Received: by 2002:a05:6512:691:b0:539:fcba:cc65 with SMTP id 2adb3069b0e04-53b348d31c1mr11768796e87.17.1730477329996;
        Fri, 01 Nov 2024 09:08:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d6984e3sm69727035e9.48.2024.11.01.09.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 09:08:49 -0700 (PDT)
Date: Fri, 1 Nov 2024 19:08:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Souvik Chakravarty <souvik.chakravarty@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, girish.pathak@arm.com,
	arm-scmi@vger.kernel.org, vincent.guittot@linaro.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Question about identifiers
Message-ID: <2f80b972-ca70-4c87-b5e8-147505b2a90d@stanley.mountain>
References: <c5fdc171-0dc7-4c38-88e7-fcf9de7cbec2@stanley.mountain>
 <ZyCuAKfqRnuFdAwC@pluto>
 <f305d661-71e8-48c0-a6a5-4271c0436bc1@stanley.mountain>
 <8ff3c048-f1f8-4ec6-9f7d-5b3982dd45fe@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ff3c048-f1f8-4ec6-9f7d-5b3982dd45fe@arm.com>

In 4.11.2.6 PINCTRL_LIST_ASSOCIATIONS it returns:

uint16 array[N]
Array of group or pin identifiers listed in numerically
ascending order.

In the linux kernel, a function can only have group identifiers.  If you wanted
to have a pin which provides a function, then you'd create a group with just one
pin.

regards,
dan carpenter
