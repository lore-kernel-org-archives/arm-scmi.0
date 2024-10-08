Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C6A1DE2AE
	for <arm-scmi@vger.kernel.org>; Tue,  8 Oct 2024 12:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728389458; cv=none; b=kbqulV1hF/EKQU+0v1cTNWS4BLrcm7a4x37EKvsnGN8vBdlEhO5XVqxG4B7EOlocLSqHim6qSRgrq1vL0znmIivU1H51zYeymiHJNwh24e5Z1b9LDvDMFyq/O3MctVOyTtXfqJ3DtWSpaWdzVwELWMQ6lbupGKV1TRuerxWCbYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728389458; c=relaxed/simple;
	bh=R+qpWwcAYfeoHXoaJECFIuwVXiJSoywdmJFN7YXdY5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dT+4Iw9Bd98OhvX8cRrT9vBUeD20RyaUlOk4irDZsPUvClEKINZ0Ypwn/FLJXTEMBkkGLy0EjBs3ernDy2yYygwN8aGAYyDEtgKUN0CGCs92Nu2UGZ2KSO6zDBb7ImOUU9wPHkMLLm8ptNe8zeosVzGPQgt2HDMS/v+rR340Z6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VhP3Yqcy; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VhP3Yqcy"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539973829e7so5540300e87.0
        for <arm-scmi@vger.kernel.org>; Tue, 08 Oct 2024 05:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728389454; x=1728994254; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X6rjAyv9sIYyvpctWeWeo3qeKI/L9cQNis1SHnCFRTQ=;
        b=VhP3YqcyGSviKPpLxOJvzimZg3q9oSpJjzr0kuKPmLt4BdYpT7te5dqSpjbfMYHiGZ
         SUBWyn1ZuFjs+rD3YZppUkaPq9bN4B5C/bOVM1r24JsdXIVUUMRX21kgVNJ6CQLM6u5T
         j4+zL4a+q7C3++w4FeCgBcCMZAw+OY9R1ZKiVO1A0z6CpvWrbEA+slMKhHBDQNCEAmRO
         2Z7S24h5G/U/d3p2oJKSNKN7h1dVqfJZre5plqjjoEaTXDC75x4mFQV1VjNL15myZov7
         z0Isrov0Kc4CLhBnlCLhSQYMFOWqkAJw3lD87ExOUgdqKYVR1zYK6mla921prAdmaT/3
         bVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728389454; x=1728994254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6rjAyv9sIYyvpctWeWeo3qeKI/L9cQNis1SHnCFRTQ=;
        b=XpVwHzKZdzhnMJFC+DbswqOURpDn5VBtVnuzBXE82CjMJ5eJV2V1enxMiQ9lVAwB3B
         1GEVvUaUTeRoexnf8JGAE6ML8kKaCADE76fRKBmSeRTuIF+d4Pwfk1vSKimQbHmaAzTr
         xf/Ae+4jOXWdt/zSL6Bkk2PN7ttNgeb4HVkcGPiorAHWEkIx6VihYrehzcU2w6Ge71Uz
         4euxb8O7u5hBsX89ZJg/qpW9+E+o3b2RG1i6sdNRG8H288viOE1wb7R1UMhFceOeXSDG
         FY13j+P04sas7N8jrGuEj4WS/TlJi9aStBZeI4EFmdCviVjqEfRahWa0cUVz807EFyXm
         ED6w==
X-Forwarded-Encrypted: i=1; AJvYcCWRP6PRwnxIcYdhKpQVmpJrw1yxKPVqI29nPpmsFtcMY77hB6y8j4j4M7/jShEUxNSHadcPAvTOHw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzja05HNkLu9piZdA+ibHzZ1uDAHu9LySen+UqNHoFcup1wOVT3
	CtDaW6RUHjc0uXBr8bo2blUAz2cXlq8y6ohkw+DRG8eeb1YIYE9WyXgfkHcuQJI=
X-Google-Smtp-Source: AGHT+IGVgFuWo2mZ8jgAZfC0G9Eqy3rDt2mSCGU5ZGvGqx6CyOFKBMNNM5kUT+/FWupXT0IvX/2y2Q==
X-Received: by 2002:a05:6512:ac7:b0:539:8f68:e032 with SMTP id 2adb3069b0e04-539ab9e421cmr6590174e87.43.1728389454147;
        Tue, 08 Oct 2024 05:10:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539afec8297sm1175215e87.78.2024.10.08.05.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 05:10:53 -0700 (PDT)
Date: Tue, 8 Oct 2024 15:10:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com, 
	cristian.marussi@arm.com, andersson@kernel.org, konrad.dybcio@linaro.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com, conor+dt@kernel.org, 
	arm-scmi@vger.kernel.org
Subject: Re: [PATCH V4 1/5] dt-bindings: firmware: Document bindings for QCOM
 SCMI Generic Extension
Message-ID: <hxfg6ztpqy7qdsgzhvvapeyh2f55mj7hhuqqkz7si6g5i7nsng@xoyfwztk66aj>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <20241007061023.1978380-2-quic_sibis@quicinc.com>
 <q2vuiru7sqetwqyitg7azgqg7kge622i2zgq52b55zivwtbev4@4qgzb54xjioq>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <q2vuiru7sqetwqyitg7azgqg7kge622i2zgq52b55zivwtbev4@4qgzb54xjioq>

On Tue, Oct 08, 2024 at 08:49:27AM GMT, Krzysztof Kozlowski wrote:
> On Mon, Oct 07, 2024 at 11:40:19AM +0530, Sibi Sankar wrote:
> > +/*
> > + * QCOM_MEM_TYPE_DDR_QOS supports the following states.
> > + *
> > + * %QCOM_DDR_LEVEL_AUTO:	DDR operates with LPM enabled
> > + * %QCOM_DDR_LEVEL_PERF:	DDR operates with LPM disabled
> > + */
> > +#define QCOM_DDR_LEVEL_AUTO	0x0
> > +#define QCOM_DDR_LEVEL_PERF	0x1
> 
> I could not find any driver using these. Can you point me to usage in
> the drivers?

It's well hidden. These are the raw values used for DDR_QOS memory.

> 
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry
