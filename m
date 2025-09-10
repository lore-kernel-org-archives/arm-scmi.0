Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B07A34167B
	for <arm-scmi@vger.kernel.org>; Wed, 10 Sep 2025 16:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757520613; cv=none; b=EZNdPGiFQcOEKvUjE9eG/maDUkJFvOiDAbwkA6EBqy79t/jsmebnUrIYAK59HRkmXG//xX3Y4fIGGZbe9n32OwbvcTzpi0h8KhEWoNXLxtFhj84bbljtyIhFA07y4AnQjt7qj7HXuCme+SqcaS8VAwXJ4LP0OXs1scQ3RsLo0qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757520613; c=relaxed/simple;
	bh=4kjxrxyFEb4K37j83q9FN9IoA1DrIJqo7dm0VgzSVBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JgtV4jzubxuC5jX3lUVPt4ggIBsPr6liZ9VpSwZ5HPD1hm6HvlIf6a1qfOLCOAOBl2V8ziTHAFECOfilhUnwtWDP/vkTyYeSvTIPdToVpofpHGHfXR6kjl6okERAnPgCqXaPg+7IUQlzryFROGGHx71UHBWVmjgHPLwDeLLx/Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JKWNZEoJ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JKWNZEoJ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3e2055ce973so3790525f8f.0
        for <arm-scmi@vger.kernel.org>; Wed, 10 Sep 2025 09:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757520610; x=1758125410; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I9LI6s40pwmOAvNzLobzMUKZOm00biMObXADSvvCng4=;
        b=JKWNZEoJVRH7QXsWl/h0PWNypOh9OR/gEJ87BtjpDQYJc35HWI8OohX8NQ3xD6/SiG
         eKtI7Rur8lOp+I6G+vwpEAHuLqvD1f1LxQmK3P7ubW9mQapm2X6UGPXQy5eoxZjT1A4w
         8e1doqmxvlIOio2UX3UIW3xi5CXqznAVU/lkMLOo1zGMzeCFpMP7yh0QFmSRDs2rd1dW
         X2qS01Ky7Et1PW7lgbbj4q698oJ9f3e7+1/CYnup/wVKmQph1OS0PLqvFyvLGKdqMPCz
         94ddkwmNcFJXnqiSXK3jsFnd7/krLQSFuXJ+wu9EuFCLKDoQlzHOpRAPA+YyU4sh3LHp
         iLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757520610; x=1758125410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9LI6s40pwmOAvNzLobzMUKZOm00biMObXADSvvCng4=;
        b=XvsRfJbsVUEl5ickJHmycvhzxnfAGVDTq5mk/IRObpdkXr2VZgBBrQ9zeRx6lTPrxY
         oeymeomr7lzsxh8TcpZyZsQC8oIJKhTwsoEeut8u++SyPmo4dq/wDbaW5lglIqUUL6z/
         oVwV93iorFCqU734C+fakEptQcwzCctHVtbeHZeAI39VlQfRK/7ii8jN75bSDUAV7JJT
         DsjuMnkzy20K6CABvQLCEohpfLOVcnRlyNXcmDWkwo0+ExAnqQUaQyBCv9qF8g9lIm+q
         c7fmAoooC8SDX/XzXxa3Uhz7F4mFJnoF8ph9sfsxG6mXeV8a4Of3YNpq+OMljvIq52mv
         ZpNg==
X-Forwarded-Encrypted: i=1; AJvYcCXdGO5ImpTfqnC9n/nZpSy0+LLeSuZODibTEwRHqIDWoCEIjUqvPgDW3KolqLVxoBGFx57txJMGvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKQYLv9ekdoNl+0ikpWrptFSpokdn2XYPjHe5+CQ3egUN4QSes
	Uqs7L/ReWHOUD6IvCeopXSXRIAZOLeSjmXVXz7bCPK6gzwdo0t0aj1q3RxfKB88LlCI=
X-Gm-Gg: ASbGnctN/3iAbRXMoa0qY0b54143+h0FsktPVQHjC1DUJiU4YmcNcQeb6c5hiTmWtNW
	uUwGDBSSCDstOM6RacrS0WxEsGkn5SsjEP+chUS8uHyJKSXVtPOxbr5uNzc9SvCpGDxW0DYYgfT
	g3PrxdnPMQ/EXr6+Fb6oCNZ7hcx7JKvHlB9B0tdGjkjF/d+RLbzvDvbgUlt+aDSMPpmxbBh/ABl
	/Oud9exz0QgjZcDhDV4wEzf8OayVC04CrR10YDbEc+Ou9TskCn2pzR5RyX67Ts29ectKAADXyu6
	ilmqf2z5C4me+h4Oc/OjB2I6OP419B98fY+B+I8F7yyTMS91tvj8hmw/dWwLnA6OdfUlWGIEqE0
	odJmS/NTKEsM9ZzYFQ+IdcP8sOf4=
X-Google-Smtp-Source: AGHT+IE9glpLlh0ZXr1YlFRw69nZiN7PdFZT9NC7CNgw6KEShDJ8T0VtMfBa/BEPa2F5bWBlMU4Tpw==
X-Received: by 2002:a5d:5d82:0:b0:3df:a0f4:abc1 with SMTP id ffacd0b85a97d-3e6438373acmr12643107f8f.29.1757520609607;
        Wed, 10 Sep 2025 09:10:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e75223885csm7320979f8f.36.2025.09.10.09.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 09:10:08 -0700 (PDT)
Date: Wed, 10 Sep 2025 19:10:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] firmware: imx: sm-misc: Dump syslog info
Message-ID: <aMGi3S2j_FHid3Sb@stanley.mountain>
References: <20250910-sm-syslog-v1-0-5b36f8f21da6@nxp.com>
 <20250910-sm-syslog-v1-2-5b36f8f21da6@nxp.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-sm-syslog-v1-2-5b36f8f21da6@nxp.com>

On Wed, Sep 10, 2025 at 10:28:18PM +0800, Peng Fan wrote:
>  static int scmi_imx_misc_ctrl_probe(struct scmi_device *sdev)
>  {
>  	const struct scmi_handle *handle = sdev->handle;
>  	struct device_node *np = sdev->dev.of_node;
> +	struct dentry *scmi_imx_dentry;
>  	u32 src_id, flags;
>  	int ret, i, num;
>  
> @@ -98,6 +134,12 @@ static int scmi_imx_misc_ctrl_probe(struct scmi_device *sdev)
>  		}
>  	}
>  
> +	scmi_imx_dentry = debugfs_create_dir("scmi_imx", NULL);
> +	if (!IS_ERR(scmi_imx_dentry))
> +		debugfs_create_file("syslog", 0444, scmi_imx_dentry, &sdev->dev, &syslog_fops);

You don't need the IS_ERR() check.  If debugfs_create_dir() fails then
just pass the error pointer to debugfs_create_file(), it's fine.

regards,
dan carpenter

> +
> +	devm_add_action_or_reset(&sdev->dev, scmi_imx_misc_put, scmi_imx_dentry);
> +
>  	return 0;
>  }
>  
> 
> -- 
> 2.37.1
> 
