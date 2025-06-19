Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C698B21A43D
	for <arm-scmi@vger.kernel.org>; Thu, 19 Jun 2025 14:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750343880; cv=none; b=r5n2NwEQeMrzZB3iYXuuMxAScjKCWhEIL3PV/sUElaEBnS7zvUW5uuGbFOwXRPRRCNEParR/ELZD0vBlp5KvgtNt9AzRUWeWHJdRXNpot1STznsDMa/Qfl0uX4Qa+wu7rQTMvB16ZQFI0dcNrTi8w40h27+fbxtEhR4YMtKH8mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750343880; c=relaxed/simple;
	bh=CpbWcAfGaHy4F+EFWUw79lU+eKjQal3fLI4YNd1mJqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GF+Y+G4x0XIWNNiC7Jjb7C+iIRJz3S++Gq0O6LMJhtzcnmytkrGEjhktufCLCQUzxFCB3GvG0hDvmFlESOsbHAFPy9YzuCgA0HmbCJYfU0OZdX9Qc/bTqJgY7KPiUwqeoM/qWSvoxnMMtDNCrA4QLYW+maPaQ5b2JT/fj1CrAMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GGukmmKI; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GGukmmKI"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2da73155e91so239057fac.0
        for <arm-scmi@vger.kernel.org>; Thu, 19 Jun 2025 07:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750343878; x=1750948678; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hItRQ/EsWDhhIfBWpBCEk7E1LEl+Hcojb2DJh97cbHY=;
        b=GGukmmKIqdIqoZEYJ7VAuPkP6w6R9fAVMs9h3seMZR72g9tmNPb1nWucOOXkvvG8AH
         bK3x7aN05gmv+weKP6IQp1OZeonu8zL+XIVD0+i5Vcs8CYR4d8lrkBmCqid6JGvw5EKm
         YdqJt35lDuU3OiGFNe3m5BK6WXoruC3zEqo7HQH/pxLLADP+LfE2jiYm6n0fnypb+i+h
         ix3xGGH69E6HAhkakeKrq9ePbGL69ALZ8MhyY//tZqOjRHZ+mqVpRGoIGYOuYsqVJiiN
         Uf/LKbOH6tKwL0WOOLTyHsEqN9kHKSYnAXQ/nDKQk+k/gPMxJ7cX6ZMs/BtBVln1cTlG
         Vrnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750343878; x=1750948678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hItRQ/EsWDhhIfBWpBCEk7E1LEl+Hcojb2DJh97cbHY=;
        b=DA2vSQxakG8/olNwQ+r9tpXtAkD3Z3CvLUFQknp1ZNUwHHmqLdhPQge0NLM+GG/SWr
         xwpiGNdWbMc1qL5nKbJ9Iy0QPVkTyP1q9WKJQQKotSyH7EcP+izFl02seE7ewSc273Rd
         /oQNsS622hi1hScIJ3ZKIkccYF1iPkkflNGte/FGum/MHo4oORHU7CTixc4IQP35CbHa
         w/tC6Wytekkj1qM9EPlXEOn3cXgiNhVySqY524wJZOie1tdwlNw9f6HiD2UI/YRwjspq
         Zvs3Jt5SLBg4MkvZ3c5tsT9w55M5qL2LSZwKiOkHpDWY9fGejQ8vO8BepBCGukk+6qJF
         BdZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNG1Defj0PPA4KE+MXtJ3yd2H3ukgpkgfJpdUXjEhq7RlUM0DtNCM22Zr1w94xRhHmp19qUgs5bA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxThuRjQaf47GMkKlAfaOMGR8/z2RmuhsljIzm8qdfsw09YABm7
	pXhjntZ/efXZtHlQQ22frgT3ycRxk72wvJmpLZ8din2kcKrP4VmlGEUJi368RaRaasw=
X-Gm-Gg: ASbGncthZO64La1dt9X3K9UIznqQ6bnq+L+orfBHPSGuAEC0R7ewL0bkpuqipy9s4NO
	9xl3SaUfYkZ0YA50r4Ok59d3kmMErajafohhmK9rtIML/Io/T05mjmSJKjWYzMd7sngIbNoNrRz
	oA0J5G99L6Lp0EdZ2n/EKQC56ZklqMwQkn/vaHeq2gijw+VDrer0ZNumXOCrLUoYVK8hE90pprb
	0HrTTdwb0FISSKEYOb13dbzafgVu6dqjAKjq92um+PjzHb2QJWKcuhIHR6VXKncSETIjQTUnVDt
	FAbT41ETmf1s3ta/nkKnpJC1gpoccIELQrlbS7mj9ra+EM6GvqsaEh+rPYxCA/TVZU5lyA==
X-Google-Smtp-Source: AGHT+IF5wWj1FQ6BbyupArvuY9tJtohfhdhFBgl6f0a/VE3YSxqXuNxxcAbMe+rm13ajKH0dqzjQsg==
X-Received: by 2002:a05:6870:d0d5:b0:2d5:2955:aa6a with SMTP id 586e51a60fabf-2eaf0830607mr11507270fac.7.1750343877826;
        Thu, 19 Jun 2025 07:37:57 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:67e2:ece8:b2f5:738f])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eba625607dsm358428fac.45.2025.06.19.07.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 07:37:57 -0700 (PDT)
Date: Thu, 19 Jun 2025 17:37:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Philip Radford <philip.radford@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	cristian.marussi@arm.com, luke.parkin@arm.com
Subject: Re: [PATCH 4/4] firmware: arm_scmi: Add new inflight tracing
 functionality
Message-ID: <514e4b89-d48a-41b9-bd63-0d52249bba7a@suswa.mountain>
References: <20250619122004.3705976-1-philip.radford@arm.com>
 <20250619122004.3705976-5-philip.radford@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619122004.3705976-5-philip.radford@arm.com>

On Thu, Jun 19, 2025 at 12:20:04PM +0000, Philip Radford wrote:
> Adds scmi_inflight_count function to fetch the current xfer
> inflight count to use in trace
> 
> Signed-off-by: Philip Radford <philip.radford@arm.com>
> ---
>  drivers/firmware/arm_scmi/common.h   |  1 +
>  drivers/firmware/arm_scmi/driver.c   | 17 +++++++++++++++--
>  drivers/firmware/arm_scmi/raw_mode.c |  5 +++--
>  3 files changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
> index ad9232c982ce..07b9e629276d 100644
> --- a/drivers/firmware/arm_scmi/common.h
> +++ b/drivers/firmware/arm_scmi/common.h
> @@ -505,4 +505,5 @@ static struct platform_driver __drv = {					       \
>  void scmi_notification_instance_data_set(const struct scmi_handle *handle,
>  					 void *priv);
>  void *scmi_notification_instance_data_get(const struct scmi_handle *handle);
> +int scmi_inflight_count(const struct scmi_handle *handle);
>  #endif /* _SCMI_COMMON_H */
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index c6657582c9ab..d128d497f96e 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -1443,7 +1443,8 @@ static int do_xfer(const struct scmi_protocol_handle *ph,
>  
>  	trace_scmi_xfer_begin(xfer->transfer_id, xfer->hdr.id,
>  			      xfer->hdr.protocol_id, xfer->hdr.seq,
> -			      xfer->hdr.poll_completion, 0);
> +			      xfer->hdr.poll_completion,
> +				  scmi_inflight_count(&info->handle));

White space is messed up.  It might be better to fold this into patch 3?

regards,
dan carpenter

