Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A19B1B21BA
	for <arm-scmi@vger.kernel.org>; Mon, 20 Jan 2025 10:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737370633; cv=none; b=jQfylW7IbabW9DK6AamGFt8TfvPU9Hxoak6bT74P37dOT1WCfKvGzdT1OOfUiriWMr69M2RPZJ5kXxo/k/PKRMQXzWSwzBwK7ElggrGTVRyuKK1LC+fIbkdxIeBM7l/VPk768KqsK3cJWEQ3ySM4tsAr7ys0FfGoh5WEHSW3dGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737370633; c=relaxed/simple;
	bh=hlbVUse1kdyH7T+j1cXIhKPxXlagveeorWZyug3mE/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6fe8jV42090zN3P81sm9mdxwaFRvqDboAgPS5I2f7346P4XyBApCg1m4TNcV/WhZgBrRHj3IMylS7eGRpl7HefhK01mKKkyPFhq65RtQIU6Gg3C9ynIlO8VQOLIdb+ygLajNNGS0Lrk9LitFpf0HobTLkFVM3eKgvGz3AnJXDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=epuezM5O; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="epuezM5O"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3862f32a33eso1935116f8f.3
        for <arm-scmi@vger.kernel.org>; Mon, 20 Jan 2025 02:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737370629; x=1737975429; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZnCt5DjDOmwR4I1vAJ/enzzSs6/BjfG1IINpOsDqGQc=;
        b=epuezM5O+vv7k5klavkWOWcY9eDWFTGY10QTZewjv4Q+LeW3J5pOQxeIWtAu38KGSC
         Ycfc4kt5h4KlU/5a0thQX94m6Uj+7QsNIcUdGq3j3CfOk8TalIdGwcD0xiBVjL/fsUO4
         kjyrpRYuu7es+FN+0BVUA6bzG9Ut3g5zcXbQERFQ/GzLHeAUSTQ/FQwhtlTR7aJ/BqF9
         rph/YWienhn2B5R89UquAhsA6WUdLUrVeDnjETB+tA1E/MMFF9qzHNqQtNBRn7PDdLth
         H/IwBNuGR6xax6g+4YMqgABdg3seyXQ7UjGOO8tkMesT8bJjM0egQiK9tDwdk7xlRsPh
         6cYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737370629; x=1737975429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnCt5DjDOmwR4I1vAJ/enzzSs6/BjfG1IINpOsDqGQc=;
        b=ptvgZT/HMyXj4QcyZRN7c0Ag8e5PeFOK7SUthEF/W3Kjr/RYUvDz92P+J/I4Vq6WPl
         +AJRkgL24EXqmQt8bCs1hkGjvpdXAbds2gPdkkKsC7C7LI7WaqZjgZ2kXSiCXbsr6MFf
         kk8Tbm23s7mhqVtgIoYxRbMfkyEPZpsnBVLebfv79fqhnfrUVMzvPIeT+NSDrElhiatZ
         MJBriYPqYS47iT2+rR8R6AJMf5Sal1a0iAAB0TD6jdAKYkg3VzJQoNfKlLtyvdxIEtMp
         w/pwEfZRthpqfZoqxsgQW3hsofm2WIpF4lmtWRkkUPZfZ14ZbGzCvv1+NQyfAYpxIYhE
         CjvA==
X-Forwarded-Encrypted: i=1; AJvYcCUmCl8SC7q9eYpp58wuSZXdXesBpiq9QnxqUlmFjkS5x9lljSmDdDGzSzw2KndT0+15kOEwvjjCDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZqGUZ34M8bgjYber5wwm6EXLsNENzUVS/6bS1AV4oZtYjVMSo
	4KOp7iWBfGSSbCm/w18HszFcjeCIussS3fHAQB3mUlP/N+XqGrRBWgFi+81DmV9kJI4S9Qs7pWL
	o
X-Gm-Gg: ASbGnctVMBtsBxwvzxs9tRNDDJJdhLoB8Z0LyLxbI+A00YSHy7B6zPi73AT/1JmQKjF
	gIoEIdyASW4QXhWtNBcMnsEEbtI0Kso1NNasmaipuHGDRdnlOvyfDibBA5aae8RxoTysK6TpbrK
	XV1fy07j22ErP1KZuxH2GEN0JYFo1HygHIQvCDoYENLCgA5hYT/eVT7zngH9kGn6cuXbSRnJo1v
	iVDFWCS6CDAS8x0Tq6+TmK6KCXOZK8x0Jig/+25oBpjusv4jhrV/EcnrbhNah/sKZJ19Xx0Kbg=
X-Google-Smtp-Source: AGHT+IFcWdDkIWIV3+3k8GBszP8VeZU7+D+s8s4XaEHc4R+KN6tCXBGU2C0qdKTOyDm73nBXW992qw==
X-Received: by 2002:a5d:4b48:0:b0:38a:41a3:218 with SMTP id ffacd0b85a97d-38bf57a2612mr7545183f8f.36.1737370629606;
        Mon, 20 Jan 2025 02:57:09 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221b7fsm9969683f8f.27.2025.01.20.02.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 02:57:09 -0800 (PST)
Date: Mon, 20 Jan 2025 13:57:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 3/4] rtc: Introduce devm_rtc_allocate_device_priv
Message-ID: <a0403834-1c2f-42b4-81f3-ca4123fd2a4e@stanley.mountain>
References: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
 <20250120-rtc-v1-3-08c50830bac9@nxp.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120-rtc-v1-3-08c50830bac9@nxp.com>

On Mon, Jan 20, 2025 at 10:25:35AM +0800, Peng Fan (OSS) wrote:
>  int __devm_rtc_register_device(struct module *owner, struct rtc_device *rtc)
> diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
> index c4a3ab53dcd4b7280a3a2981fe842729603a1feb..e0e1a488b795645d7c9453490d6cdba510cc5db5 100644
> --- a/drivers/rtc/dev.c
> +++ b/drivers/rtc/dev.c
> @@ -410,7 +410,8 @@ static long rtc_dev_ioctl(struct file *file,
>  		}
>  		default:
>  			if (rtc->ops->param_get)
> -				err = rtc->ops->param_get(rtc->dev.parent, &param);
> +				err = rtc->ops->param_get(rtc->priv ?
> +							  &rtc->dev : rtc->dev.parent, &param);

This seems kind of horrible...  I can't think of anywhere else which
does something like this.

It would almost be better to do something like:

	err = rtc->ops->param_get(rtc->priv ? (void *)rtc : rtc->dev.parent, &param);

The advatange of this is that it looks totally horrible from the get go
instead of only subtly wrong.  And it would immediately crash if you got
it wrong implementing the ->param_get() function pointer.

regards,
dan carpenter

