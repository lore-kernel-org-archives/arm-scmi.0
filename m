Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31B6226541
	for <arm-scmi@vger.kernel.org>; Thu, 19 Jun 2025 14:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750343578; cv=none; b=cDVmTNgNeh+K6S9JZsfpi2AoY4SE3ziiAhHb+WtqWna93dqhQ7Hgsc00Jvyx2fXwZcdHIMW3jPTu9tgRbDaFojzOQWn5jPj0OmPAItvWMUIsqzfLZKUnBjhiVAeUxDlmZ9Ia8jXNVYowIt5fRYb6iCDPpr64gV0I1pNJjQo+cOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750343578; c=relaxed/simple;
	bh=nmwWIDW+odOafOSbSvyT3m43z/PXmHJf54qTm5PFBpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R149W9d8bnr/6TmwDmC7HFcdk+03cpUq1IjgBk2sW/730yaftrzlb//WFo5djahOEgSj4gSZAn11jZujISxOOfGzVKPrh6mk1SuRMhLNFjAYjh3lBt92703VYCzV+lxdj7/LI30qwQZAdU6QaJy80AIpIcHqcd4ixzmiO0SqkiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zwoy2pYl; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zwoy2pYl"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2e8f84653c3so202960fac.0
        for <arm-scmi@vger.kernel.org>; Thu, 19 Jun 2025 07:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750343576; x=1750948376; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=se2zPaRHsPHVWSLq2M50PUR0Qrr63lHfyYD9MBXQ1JU=;
        b=Zwoy2pYlWFW1I+yo3I/Hv7uolO/lCEhd8dWMiun+yIBwMkDIkwqGgH0+6GWUmTlPNY
         /hfGLemwMZ9DTFgsYjtXtLPlpNQMCC5tpSgpjiEeQ+FNM/87wdv/czr2NKrDA+WcP4PE
         +xPIdeF3TuvDjAx0Qsq9dQSLTjQ9x2qDA53alBkgcmpgWc5f9stC2rbqcxrZQY2uGzMr
         LpuXqr/73YtcVAqndwA6DRK3lDeHoshIl4YZmppxTLc9K+Xwn/L0ZyO3+G6DV6rZFzgU
         mbAk/TsugUmMesYkfL4pdp/sRPgLy+78JRqcMKlC/pkAuTMtFECKeV+wNxUuRXAMcGo8
         8UUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750343576; x=1750948376;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=se2zPaRHsPHVWSLq2M50PUR0Qrr63lHfyYD9MBXQ1JU=;
        b=hJ01hP5klvTDm/kXIvZxRhnKtRaNt6raGdYVqLcnRA5yFl/17rspjEZibLfdlToB9f
         F9JPIE6ewvkyCaktChmGtwLVFzWH7nAaDMnMqzlVLAmgdohAcYeYSlVnWik1jR1wSaRg
         M5X1S/uubm1YPOdEp50xRCuBq9Ric+cS2hzVRruC1C3tdemnjC/oQD22WX7NanzecviO
         6mmdeoLDfy2bDbKJqmo75hGUcaCbFsSJ2g2gGanw8KQu5EfPftVMdVT0wMzljO0qPjDa
         H55owfmrgJP5T7+nUKkupVvgYjRUsIl2RYzm+TlFTMvRzCG8g0JIbg3KjstsxtnLFFY5
         LGNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXilx98vQUKWo+VaGF3HrDQFmFgT5qrVsRUg7ro04CbE0qXBEqKzJLeJy0vYggK/Wt0DqiO1PE9lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWmq/FhXYLyNWFobUt7JfFMRJ72/7bXvxJoVjxhaTc6maFStPi
	x1cNqCwwf4r412PKgXccVGwkEhdKCC0uCwxq30iRUgECIX0zfpUOz7D+e7mVGk6mMf0=
X-Gm-Gg: ASbGncvuwRG2DLVyhOfT2FR5edmjKjMrnnILq3oQKAxTnPuWEy+BBG1ZQDQdbXqMFQA
	74I2YMfs39ZDHoUrDOUU+uXeN5nsQzjNM2xYKf/SZQRHImiDx8qOBCrJORK6IEXUTVlyuR9ihAr
	99yWez7lBnffu61Q1Fx+HDR78h1oMHAp7wVU3/ZNUfw5A04jPU0V8eBhAz5ESC4iqBH+YHm+OD5
	eeN90ztSdKaKWA/6rgGWIdaHG9OS+KY9/UKlvNsSxMCljdhHbmktYsHs8GcaQRaNr7Uhyn+I2/A
	tNswCCUbW81XmIl9YRvAj6ohAXAqRlZPYyr+lr1gLNV6CoUQTvya2qSio/ZffBkCAfXZqg==
X-Google-Smtp-Source: AGHT+IGaZ2fGL+aupK3bJuZPDe415AnPYcuPEQInGDzraWvR8NsbfbrInyqqD6LAZae1EYAXTK0/5g==
X-Received: by 2002:a05:6870:468b:b0:2c2:5c26:2d8e with SMTP id 586e51a60fabf-2eaf06ae000mr13281654fac.16.1750343575695;
        Thu, 19 Jun 2025 07:32:55 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:67e2:ece8:b2f5:738f])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eba6251d4csm354326fac.44.2025.06.19.07.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 07:32:55 -0700 (PDT)
Date: Thu, 19 Jun 2025 17:32:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Philip Radford <philip.radford@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	cristian.marussi@arm.com, luke.parkin@arm.com
Subject: Re: [PATCH 1/4] firmware: arm_scmi: Add debug decrement counter
Message-ID: <b44393b8-369b-4500-abf3-13e98624e233@suswa.mountain>
References: <20250619122004.3705976-1-philip.radford@arm.com>
 <20250619122004.3705976-2-philip.radford@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619122004.3705976-2-philip.radford@arm.com>

On Thu, Jun 19, 2025 at 12:20:01PM +0000, Philip Radford wrote:
> Create scmi_dec_count function to decrease any of the Arm SCMI
> debug counters
> 

Please mention that "There is already a scmi_inc_count() function but no
decrement function."  Otherwise everyone will have to look it up to
verify that it exists.  Please put a period on the end of your sentences.

regards,
dan carpenter

