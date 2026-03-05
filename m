Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CB6377EDB
	for <arm-scmi@vger.kernel.org>; Thu,  5 Mar 2026 09:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772702385; cv=none; b=Dp0SSRh1wm72qNmtI9/SUjVuAlEJfuRjWw5lV89qn8eHV9QFBIh8+/6Zz8vS+QX9E+7SkjF8+/PzHJW0g1mORW0IZGTyraroFar2XayGkTwsi47s5GmnVSlcl/VAEXGPPMCu5tjt1k6A6lpCam9ENOVs2RWhvx+CuEit5waipfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772702385; c=relaxed/simple;
	bh=vDLbdUEl7NmHs7Z/ZR2LGXRHBkSlXMABw9TRlFq5yo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R6l/M+9UlPIuM4YYNdixjSRlIlpsANe4pxG4xEAxImMN18MSk2VRiZMMOwxsLYRSDkkVJDH1T5hq+woYHwrB1cgRAQAveKOLA8SdEOhiPRA4Y/X2OxArt1fHU9/agtQUfU+Z54PbhsnRnhF+NIV9NUo3qHKbfuizI601J7TIryU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vttrAC3c; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vttrAC3c"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439b73f4ab4so4628738f8f.1
        for <arm-scmi@vger.kernel.org>; Thu, 05 Mar 2026 01:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772702382; x=1773307182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W6IXJ4+AIDPs0nIBd5//+WvmemCt3YPebZ7hJpPlxSc=;
        b=vttrAC3cw+vNdgXi7h5g4GooVkTYl/mKCrwY5BWTOsLAW9bhahMfs/wN4oz1s/xg7z
         hKAfx97Ks9TtENs4IcPDlmY+5RHb1jjYEKjZkbxSG+jaS2DJVUWVxvwgOTnPILbaLUa4
         3s/HFUKq0mMZqNQjt3HM6909ZtlELF6ToBtN4y0FruBy8GYek7J0THNjLyCMv7lfPmyy
         Nr1WHolyHch7kKUOp/w1dhzMFneJazXurBBV4Lm/i9eoXAda6872IR+iIxISdAFHmebi
         j0XEqH4nik6erOkf/Mqo6CZj6D01pe/9mKvUz7sgompFETPhigHxjFUhaw1cHmF5MqJL
         IajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772702382; x=1773307182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W6IXJ4+AIDPs0nIBd5//+WvmemCt3YPebZ7hJpPlxSc=;
        b=PyEj3uAGNL9qIK/pHHkuILlTA5NnTg2el7y8g6VMvJxN1HQVPM23ZkGMyy+4A4sQW1
         qcz3Kow0eri3qoA8KLQ4pRGfNyCFQjzvIaKwoj/LUsoopkgXNc3SacUC2MKd42AEu79K
         fSw8fs8NxRWXT5554pMCPEcGDnnzHFMbZMs4CBb2A2+ULgIHoNsTEEsSXM83mEanBOTV
         8EyZFifFPeTbyD12DKl+S0X3J/WpqFYoVxMvpa5kIhc6yPkggWhLTOT6uHSMJwOeBmMp
         ne670g9+Cy6UkxnvzImG7V4auESeu5YgysfWFhnRt0bGTljpvPXUHBkt8wHBlc1NBwyz
         liRQ==
X-Forwarded-Encrypted: i=1; AJvYcCV23DZwtZR8ISE/Fyal5g8pStRCc3kXsWUulDT2xnYqo5T4djBSJcp4SH01MMgcoXErPA+uq5f/7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdmcCiLeQa3iO6kbcD7+DpAbg7Vq5IeUjtT2nhEzoCY5DCeIV6
	P3xHUaxKT8Fas6gVmFXibNa6ZX267Ey9CeaUFsiXtR6EQJCR3b+wSjIyR46c/hyNlrE=
X-Gm-Gg: ATEYQzxG53jPeGhubUJBWpGaN9SoZJ2XkQPYEfedO0wJuCTw5/k2vlr1jiWhE2fy+Lv
	44RxXUg333gKS10yfuXal4GHfH0PS9LbQctwSl6iU2+WDhfIZaTYHKOJ+RBAsGO4HnvDy2PFBiP
	8k1LG+V/eTs1G5GH7o8I+DNFIVvRUpAcoVHFZudoPGpv3USH4+5QFb8H0J3QTIcCLpep4Gq2d6j
	C2Cx/wbrN1PO66Hx4Pg50i3j+hUHRNHyCCmvMIRBM5pLZLjaky1/fExUoLPz2D6aWaPtz6jPDon
	PFMJ1N8K8DTfYDcSXqbDBrDjE6pfRbMMPsj4OGyTeCHYCCibL0fqxdZwno6FEFg8XDIVtoUzyeR
	6KxciBrEVBIMvP1ILI3LlGpf32HhiWoYBA5FjZ3+Yuu87iF4ths/iuhmCcJAOem5eoEVwfInUsb
	CkzsFAPt2TblenUla4QAjxsGiMbRQF
X-Received: by 2002:a05:6000:22c9:b0:439:5c75:dc08 with SMTP id ffacd0b85a97d-439c7f99a31mr9373703f8f.10.1772702382012;
        Thu, 05 Mar 2026 01:19:42 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a5970sm25732463f8f.33.2026.03.05.01.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:19:41 -0800 (PST)
Date: Thu, 5 Mar 2026 12:19:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: sudeep.holla@kernel.org, cristian.marussi@arm.com,
	sumit.garg@oss.qualcomm.com, jens.wiklander@linaro.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] firmware: arm_scmi: optee: Check return value of
 tee_shm_get_va()
Message-ID: <aalKqp_VPJjHxcQg@stanley.mountain>
References: <20260305071533.930896-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305071533.930896-1-nichen@iscas.ac.cn>

On Thu, Mar 05, 2026 at 03:15:33PM +0800, Chen Ni wrote:
> The function tee_shm_get_va() can return an error pointer if the shared
> memory is not properly mapped or if the offset is invalid.

The memory is properly mapped though.  We just allocated it on the
previous line.  The offset is zero and the size is
SCMI_SHMEM_MAX_PAYLOAD_SIZE so that's fine too.

There is no need for an IS_ERR() check.

regards,
dan carpenter

