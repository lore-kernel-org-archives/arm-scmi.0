Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6DD186A
	for <arm-scmi@vger.kernel.org>; Thu, 23 Jan 2025 10:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737628718; cv=none; b=TFLTq7vShZtMD29W+kGntS1f59BYmIE1RJWkHRuKNOwWM5pzHSYFMsbkm7DpKqphKQLUq4B47ETjEe/MR0WsCNUkb4U7+k4eTdrObjjB+FOL7kmsEwbE7u7mBLAKlUwm7Dzi8dt/AGV0kP9At2y/S2a8ehQOKt5Ld+DrTxoqysA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737628718; c=relaxed/simple;
	bh=A9fAgGirtBaSIPilBJ6/5sb4jYusvk9H39Lk83vbIuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jDfkjTmE12J82tK10tBVHGVo4STyxQcPMNeHRPZJNY36+DmGF846JItwDa3/TX3jcF5ZH3LcraxHv30k8EHXbmeId6bdbJQPRMm4yZi7lP1e7aDEt6XKsZVxSOvEO+f6HXBQ5AQOauqkuHu3WBciwUX+7yAVyHOr7caafIdD7BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wb4+S/1O; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wb4+S/1O"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385f06d0c8eso341167f8f.0
        for <arm-scmi@vger.kernel.org>; Thu, 23 Jan 2025 02:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737628715; x=1738233515; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fYJFJJLzNzJAn7tKjvuUDrRgZAArenLWovfu+NUU020=;
        b=Wb4+S/1OIFMO2hNUZuYMOCfZmZecklayY4Hh8PCl1KLkl8DOqnXOnn8uCQ5U59mPpT
         PO/kJxY8zvrtfsF6qUY8OmIrCbG2nzOanW/hr0IEnk/+ePlAu7OSmh9diXfN0sxa3+Hj
         mjJHLt692hPYfETlFipFdM4tl08ZB3ZKzxFF4a8182IbPPVC8FPfgL31BnsP+V7/LLnV
         p5mk9KLVDQdR3IrEn6VYtA0pVoljqdBbqmPZ6dkliawPW6mATmtY2WdjmCNiLtBWFlcL
         O0UzbC7s4oNk6HXcm8NppDIzAvjn5/mUb43ZhxWMaDfSHPInJHZ6Zp/ED46TVpsFgxRp
         vLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737628715; x=1738233515;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYJFJJLzNzJAn7tKjvuUDrRgZAArenLWovfu+NUU020=;
        b=Vl4eQJsvA7ikbKhzHtcQPktGkEBu7YNE1O0y+2bTi2vrwUky8LEsORdSr5DskSvz1L
         mdz8GjMa66B+qpeW5rIx4stZUAAhi/cXGX+No6GiyghA7fu+/9L4WUZISoKH+cw8XtN9
         zOu977925aLtPA0vN3zSBnhwbi1654Uza4YaqYD88Dehve0gmazFzR6+F/ykY/uw+ZYy
         Yjdyf2lXjlCTBELJ4kzOPfUckRsMTviEwT8edieFGfDZ38PDorN0BBxWUKcxJEYun3eb
         w8HBsS20AuvzCMHvXlxuCMCd9IhIRk8nVDWQMcNukElSYTna5vym9l52hJ8g/wKx0/e8
         xtuA==
X-Forwarded-Encrypted: i=1; AJvYcCWRUlue0Y2BHfI+3g8pxgSjyABmY1l+OmQ9VTeMaR3bLocmoJ3RkiKf+3uNzwiDITz9K43r3JuEsA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4Let5f63mF2R9P6TNMSPAwneTy57jsBwfz7BEVdh6TgI1niYw
	TgOg+/yTb0LLCGf1sKDaMhkE29o5gYKo7i7vOWPAyotBwv6GQqI/JeD+j5SwTqE=
X-Gm-Gg: ASbGncvVLQToWNzmumRFcBT4YVq0iViFwSOml5faGSbwnI//HV6gzVeGy1DNkwieDqa
	khKfDHT3vixSFeUQR+Gkhj80ZKDU6nNYy0OHY3Kt3hvYH06spOlS4dbkZ5zsOovDgE1tC0cbcbN
	cldlg8fwXXcpxugBiADqjDCLMGtDA+kIfphf2yUGWMujzTUTt3EopaZfpvhSPZoww1FkUFScgL2
	+FTC/y156QYicS9fU4ObBjilqKx4ePYY0FTeiASG478F6pBFNUlOB+InqM7LiirUizPuNeK9VTY
	QKBSWAuWFQ==
X-Google-Smtp-Source: AGHT+IFVka4iqlv+f8wHSLTkHDxtLa2dS7V4LAO7Kbt+oHZUKJl3kcd38xxqwMLxo7Hl7A2K9Dihww==
X-Received: by 2002:a05:6000:188c:b0:38b:ed6f:f012 with SMTP id ffacd0b85a97d-38bf566e472mr23216204f8f.9.1737628714689;
        Thu, 23 Jan 2025 02:38:34 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b319f6absm57036035e9.12.2025.01.23.02.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 02:38:34 -0800 (PST)
Date: Thu, 23 Jan 2025 13:38:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: jack21 <jackhuang021@gmail.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Huangjie <huangjie1663@phytium.com.cn>
Subject: Re: [PATCH] dirvers: scmi: poll again when transfer reach timeout
Message-ID: <f0fbc4cf-21ae-4332-8842-73f0467d16ff@stanley.mountain>
References: <20250123083323.2363749-1-jackhuang021@gmail.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123083323.2363749-1-jackhuang021@gmail.com>

s/dirvers/drivers/

On Thu, Jan 23, 2025 at 04:33:24PM +0800, jack21 wrote:
> From: Huangjie <huangjie1663@phytium.com.cn>
> 
> spin_until_cond() not really hold a spin lock, possible timeout may occur
> in preemption kernel when preempted after spin_until_cond().
> 
> We check status again when reach timeout is reached to prevent incorrect
> jugement of timeout.
> 

I suspect the real issue is that we exit the spin loop when
try_wait_for_completion(&xfer->done) is true.  Probably we should add
that as a Fixes tag?:

Fixes: ed7c04c1fea3 ("firmware: arm_scmi: Handle concurrent and out-of-order messages")

Btw, the scmi_xfer_done_no_timeout() has a confusing name, because it
does timeout.  Was the "_no" an accident?

regards,
dan carpenter

