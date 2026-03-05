Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BBA37A485
	for <arm-scmi@vger.kernel.org>; Thu,  5 Mar 2026 15:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772723393; cv=none; b=uR5sPMqcULAYxnrlz9cvjYzN/2EM6HVAPtltYMpaWHtSHbHAALpY+aaeQX1MAXwwTIwv+XN8yq8aCXlYAdW+O44UvuCZUUbNri2hqe8SX9LGvLeis5X1DPLv6GqcOuRd9DbxPSpN/yDkmT8KBQXqcP8EFiSoeCJzvU2UgGQxGAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772723393; c=relaxed/simple;
	bh=PXmcl4tPFlOnNNYThEePOc90/m+UkIgholOL+Kk70Tw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k1eaK0MT+wJEFfCUWCpgH13H3Vm1BjpSYK1gnwhxES4fvxY2YoR3j6GFK3xqJF5rReVaHiN/7CfZ9JRQzzueAeSBweGSXH32CR7kf5FraLH7UddLm7RqPJ4+cti4LNAIurDPB7/6nqjdRLSgw8hRoxR7Nmz044ojCLoM8yj+OXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b9DxdZM8; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b9DxdZM8"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-660a58841d4so3763068a12.0
        for <arm-scmi@vger.kernel.org>; Thu, 05 Mar 2026 07:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772723390; x=1773328190; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3OmpzvQpYMJXClO5qkjGcMYeXJMiSrkcfp4KTo3+tdE=;
        b=b9DxdZM8BTbK2wUZrlOEzdh+u8ZCpWMj69r3lHxIguyPceTZxUTRRpu6NRtRIje2aY
         2N+++LJOrB4YbZV4MucDOuYgfv+uotxYcTrNygU3Dy3jXYZ9JMjmNsJrnjeDjrCzIGQc
         r667V9tBmC+F80nNvOWum15AsD3UppRXtqH98m2BoNO/hsVinN6+H7myT+OYz0HEZIxv
         SUq4kXaEPUiCMPGRSH4y6+3GCpQoLBr6q4DJ60A8LcvkGWUU9WkVFtr1KFOsM446oeGj
         lIAt55H1MDQ+1Xv84KdV9K1C3ZNUrl6jFNoBbzAZo4AhYdnWZXucpsZ8W42V45q/jobT
         7++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772723390; x=1773328190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3OmpzvQpYMJXClO5qkjGcMYeXJMiSrkcfp4KTo3+tdE=;
        b=kx1Q+Vse9SMujWolgeHvPWGsYy56LjwLcGaRb4UO8idwKLqYuAtHfxRI8woLejvKOM
         FNoEalEUyhnZVqaPQo8Gh+1BYNU847Fv9DElqwgBbXGVr14v3QfEVKxcQbxHInJnm2Er
         DOEe3YzRVwB3eH+xtEWcH2lkNp62RpMQCkvGdQ5sEAVa4xKBnE4jxRDXBNnM2zYTKsMo
         Ct+LyoTaQennMPdsZxzLJFQABLkQzBiT7EweFSHRFZ8WawEcEg2scF/UEIVHMS71VuoD
         qXqLgQuDvoCeZ9sqzyVmoHacPw2ySTm1S6hakIua+RvqBKInSmkLSPlY/DTLiAwX0ojA
         Hd5A==
X-Forwarded-Encrypted: i=1; AJvYcCVzDlDvBzqHH4wslLL+k9lMpHrYhZddolatPVvJyaxwBuzor492jQHKOuun78HdzHcxGLxZ5ZbxjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzT4Px4vUVv6qP28NaDMg2I0SIzJrWtNEhFY4CGHhNm47E4rbWu
	QzadF6WWvAKJL5yTeapz7b4aLi7ktUdPOADefKVRRDVFGfwpiNgHL3os0qTNEuWanyk=
X-Gm-Gg: ATEYQzyyu2588q12XQIuOHPL3B7/lYcHLLJVyKXadS9tv+SfqltShJpf8DQNl0qCuhE
	vByO17OcsNBsg/ly2xXi461ZGewXwOieQzvHMXwGO7in8RK+5hhkW/LDBSLrbh9thzmHmlHiyMo
	DCM4w5tDze6W16sH69JaITqz4DpsVGgTzo+KynzLay6XDYg5EJd9AYOTiK/0GVrx68x21NBVioO
	v223WpGO0nJcxjeLdIipoCCxsH9GBfbeA6wdtg3vIaG1wlmsCh9ptShR+pXiJhjkqnee132Css2
	ZMZiMAKXWePS7oDiiHjvVjqVf0M11PA+ChNdkcS9Ny2GzHnYLy089VdKhwn1K8o2CtGXQOJzFfh
	4m8lc/eVoYsbuDMqSzq1E+f6QoPIS+Mwn8DqQDuCx7znRfHSgyrDu92DPT7cubNybBtpwRx43ct
	QY22RN2xKXAtwZLj9S1aK0IaZfqeCb
X-Received: by 2002:a17:907:3f8a:b0:b8f:87a9:27b5 with SMTP id a640c23a62f3a-b93f1432d73mr412111666b.41.1772723390403;
        Thu, 05 Mar 2026 07:09:50 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b941f016ef9sm26138366b.39.2026.03.05.07.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 07:09:50 -0800 (PST)
Date: Thu, 5 Mar 2026 18:09:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com
Subject: Re: [PATCH] firmware: arm_scmi: Fix NULL dereference on notify error
 path
Message-ID: <aamcu-f14DZNJzw5@stanley.mountain>
References: <20260305131011.541444-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305131011.541444-1-cristian.marussi@arm.com>

On Thu, Mar 05, 2026 at 01:10:11PM +0000, Cristian Marussi wrote:
> Since commit b5daf93b809d1 ("firmware: arm_scmi: Avoid notifier
> registration for unsupported events") the call chains leading to the helper
> __scmi_event_handler_get_ops expect an ERR_PTR to be returned on failure to
> get an handler for the requested event key, while the current helper can
> still return a NULL when no handler could be found or created.
> 
> Fix by forcing an ERR_PTR return value when the handler reference is NULL.
> 
> Fixes: b5daf93b809d1 ("firmware: arm_scmi: Avoid notifier registration for unsupported events")
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

I feel a bit bad about this.  I saw this as a Smatch warning last August
but I somehow marked it as a false positive.  :/

regards,
dan carpenter
