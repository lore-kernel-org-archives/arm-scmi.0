Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E063839856
	for <arm-scmi@vger.kernel.org>; Tue,  9 Jul 2024 02:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720491711; cv=none; b=V9BDb9N3deAjoqEFUTUrySVTlJRQMEaZZg9p8m914JEk6Ul2UJVMPVzfM/2Kb3VpwueJ3rudc+8InJSkJ14x+usnEJAgaMzGuMklLkoV2UWojFjEUCL0mViB03EVFKc90MFSpQEAMkLEfi89sueHp17GXpOeUyWC/dYBMeIRrsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720491711; c=relaxed/simple;
	bh=mb2SlGBuqH1DdHlykK+ZYm353mpVy9r5d1XRqy7aBHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GbnhKMLnAMBdKMtdepdLim7qe9awZ4QBmlxZd2rMMOWiznP6Wm1JhFVlmS72lmdswxXOWLh5ALlSGwYY+Twn2KYFj2XWWsZ1IYbXl2W0YXreX1IzrqDOdDDamYSHPbMLruEwzQHQOb+rAC4bA8qhRdRSzyqEj07pHTe1p1PUIBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n1AsZW9L; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n1AsZW9L"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6f8d0a1e500so4227037a34.3
        for <arm-scmi@vger.kernel.org>; Mon, 08 Jul 2024 19:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720491709; x=1721096509; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V0SZHheiIh3CaiK0vmOhEvuBvuABlqSEKkJyZwRobjk=;
        b=n1AsZW9LFCLKqtyqTez+r085trf7ZsVyLjQx1hVAZHX0o3Ilrt+o80wnsPXCh3gQIG
         2gGbC4OM4UbUb7ceerECMkaECM6IA8Kd37Uw4Dq50RmruRmNvSqwtFxZuTbGC8enNUG4
         g4hQyLalF+I8jz99uP5i6Gt724+B3wgZmI3K2WIVdVDTCFXUGT77z2KPcuBp3SZL5Kax
         rQFowAH6SnC1MoGf4dWivOh3OxMrQ2gLWcxk1rHDjEYfebPS794RojlVZvgQukdUZLAJ
         P4FXmPtlEqQ59xaRMtMzvlWMmDfZLPFlZA87I4hreKkFyx2tIyNCQ6UXDDU431TuXD0e
         8a/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720491709; x=1721096509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0SZHheiIh3CaiK0vmOhEvuBvuABlqSEKkJyZwRobjk=;
        b=k/K1iIX31BFR5fQV1YI64BYcK4RqyEnjsF9x3E9r2/Mxfk2Ymc7sp8Ddm4DoA2THCk
         c923YrSqv277iQnKElp4vRGGdOIe/MUJHmEKdjel2+BPu9AInPipLoIdVElfFLqgqMTI
         OGmvFKAs7Vx5ZfUbC8eSISW5Xpl1zuE485FmCVOCn8I5yLfEi3m3mUJd4Cs1EXl20lHu
         PYS9FCJnJgv6iBOF2k6G6w+knv9q5Uz2OB6IysErDxG///P87cU++v/AyE4Ac4goKrzl
         iUqTe2eVJizO9gf/T8WnK70zzR3nBYMYa9zfnvTHayLqfY51gFzm4Z1sKlnPdwjcURka
         /adA==
X-Forwarded-Encrypted: i=1; AJvYcCVuN2dsRzRTQy8qwIP1C6Vs6X1Cw+cToj1a8lvzgw925z/7V08RnjG3x7UlvMGQJSe7wa3vTExjq9GdW3K+99b2jqG0Xh80coU=
X-Gm-Message-State: AOJu0YzyIGAePyPl4kTbBr5WCJIkWSSRYoVlN6EsrcFbjEAopIOO8+oe
	f44VQQq73PbRNLcPP1JHEiAU+8cBgJ23eAhOylkm4hjRPdw/dYBbNtZceQUAUOo=
X-Google-Smtp-Source: AGHT+IHvYAtQB08P6g/Oh3FOe0r2RmDoDiah97BAImqRrExYxVY6UJ5Y/508gac0uZpn8tf1lwY+jw==
X-Received: by 2002:a05:6830:12ce:b0:701:b765:ad75 with SMTP id 46e09a7af769-70375b3e5cemr1364388a34.33.1720491708906;
        Mon, 08 Jul 2024 19:21:48 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:fba2:d517:40c4:5a42])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70374fcd0b4sm252746a34.66.2024.07.08.19.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 19:21:48 -0700 (PDT)
Date: Tue, 9 Jul 2024 04:21:46 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	quic_nkela@quicinc.com, ptosi@google.com,
	souvik.chakravarty@arm.com
Subject: Re: [PATCH 6/8] firmware: arm_scmi: Make OPTEE transport a
 standalone driver
Message-ID: <e27dc456-33bc-450e-8e54-1cd5b7ae11ef@suswa.mountain>
References: <20240707002055.1835121-1-cristian.marussi@arm.com>
 <20240707002055.1835121-7-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240707002055.1835121-7-cristian.marussi@arm.com>

On Sun, Jul 07, 2024 at 01:20:53AM +0100, Cristian Marussi wrote:
>  static int scmi_optee_service_probe(struct device *dev)
>  {
>  	struct scmi_optee_agent *agent;
> @@ -555,7 +553,7 @@ static int scmi_optee_service_probe(struct device *dev)
>  	smp_mb();
>  	scmi_optee_private = agent;
>  
> -	return 0;
> +	return platform_driver_register(&scmi_optee_driver);

There needs to be some cleanup if platform_driver_register() fails.

>  
>  err:
>  	tee_client_close_context(tee_ctx);

regards,
dan carpenter
