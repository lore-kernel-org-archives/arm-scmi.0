Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1C978F4B
	for <arm-scmi@vger.kernel.org>; Fri, 25 Apr 2025 14:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745591980; cv=none; b=Ki4SMD4OeUcJnRL1XbX+Yc81q1u+7ZpkvhrIhrkeq2mTjScBoD2+si2sttzy7rfnLaOuAmaI/uEK62jD3QtyJkLyXxvqAtnBQ7wc+OeyWHvcsmkRVnf4MAG0Z/t7tFlyyrIdu++INNAWAAF5avKtZbMpp0lCshMKy6sz0jUzwRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745591980; c=relaxed/simple;
	bh=OSubARYn2/6Pmrn6Lu9y1mWLoo3bOXPQBGx1Qr03POA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lyrjuIfBWXeTWwhl0HP2AB6ki/PiwFzfeNtKZ1SC/uXAYVVuC0UKbYsv15akAQtSvTM7YVvu8irXS17ADukmibeLuU8xXw7/OlTJ2CoQgFDR6nhGm+4LUuefRUewWBYN0R2hYxBAm9ilSVB76JJ9Wp+qPMzAeXux50ptBGWSJVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=BRXOd9wE; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="BRXOd9wE"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b0da25f5216so1554294a12.1
        for <arm-scmi@vger.kernel.org>; Fri, 25 Apr 2025 07:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745591975; x=1746196775; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xAKrMW6zsVbjYtLUcVxIdHAMWVdhaJiRImv1owsKHe8=;
        b=BRXOd9wE1lPKfrk6DkmtmPkn7sbo+NBkBwZTnWN63xvBr1ZVr9i+y2i2U+VUUBe3a8
         ACipQm+mWIVJhzoOTEdJS0vKQDnGLPHbNjCypKVow7yur7DS1zd9p9R7/2DrMTH1T8Hz
         MY0ZN2HeDI8XihPOer2MuGYXhpTjCnrO7MfNmDZBixBAu3kpG3XzPtHFRXsZ5WMRBu1J
         XjzlXChIoQuMIu7YsuuY+2GSmqdZlcekLu1/4EbddaxYncqHHgFzsKK6KYdUQKezrUoD
         TcKQ1XKNb1ugw34LHDdbAOe7bIClJmsw1qsbLjzvsQq0UIt/5cmqqrM1IW/8wO7Ey/lN
         30+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745591975; x=1746196775;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xAKrMW6zsVbjYtLUcVxIdHAMWVdhaJiRImv1owsKHe8=;
        b=hJHktxqcxuZuJXyar0P8D+Alnm9MtTHawvRKiwb3G1vryJx3IKfBNdUMNzl6F9wBn6
         kW4jFCvUreIZogiU+v5LVPMbj2iSedMjMp7hPfe4SQ/ReUGpP37ctdbuQLsJYssEbzkE
         d74R3vj6/neaYDLcueTvRr5SI5sO7+hKegrX2b2I9+hVFptBLtMAy8/dcgDgKX4pzqdY
         ee9YLN0cPhU8RCZ//L6u0DmYLAMl6srskTcHxEZ11qQvu58jdGPyZxr3XdX3g3sP6L79
         DzfeATAMns8W11+TkhqwgIr1KvFfFipXFvmVph1OrUsN7tx0Ibj56w8hzEzPrAupLSG8
         Ms3g==
X-Forwarded-Encrypted: i=1; AJvYcCVFCarrWg6ip9m5LQAbwe8YL29MNgVpP8vFgrlReJ4Pzrbox3lZAp5tAxI4XvPY/8eo3O2Ysg2XOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRa5aq8KibNMGIzkwJ5Ey9fCOzeLlhcuNOoBRRs06tLpKAaKeG
	NYcu2PmjxH2G47i0ts0HuS6gRjlOqXOu3fEF5VmmdDMyab7G2v0nwcsyyDWNRP0=
X-Gm-Gg: ASbGncs1JkrAu2Lagb2rGWkutHf+VE1FViBE4n3gs6tUl80YYwYHeNxUZUc9tyX5P7N
	Wx24uX+00lgBIK0N+6Dz5BIyzeDZrxSm9s12IfP9bJbyR+sGgSUExRJSB0N+dHbWOJ73ggoR0Rg
	QAvaMyr37ONeH7R9H93DzKfE8/Qjdlg1k8WTM9vcG/qYwwle/NHEydfcVBcRYUdWPmbFbd0aDx8
	FVqPqYLm1l4T+vaSIrWcMfNykw0UwnFOR5cRnWa+EHIkkG75xl/ARobHryA6Tjpksm59Tx1H7bd
	i3QGxzBqmG14d5x8x+V3HML6sEu9ZSBF7WIAP20=
X-Google-Smtp-Source: AGHT+IE3rzPchdu7DUsBLpoRV+rjBv5ReBrQWZxizYU1DK1ls1ZPmZsUkQYHhl478JUZBjtG1pB//g==
X-Received: by 2002:a05:6a21:108f:b0:1f5:9393:fd4d with SMTP id adf61e73a8af0-2045b9aab13mr3563905637.27.1745591975298;
        Fri, 25 Apr 2025 07:39:35 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15fa80f2dasm2966170a12.59.2025.04.25.07.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 07:39:34 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: "cristian.marussi@arm.com" <cristian.marussi@arm.com>,
 "souvik.chakravarty@arm.com" <souvik.chakravarty@arm.com>, Sudeep Holla
 <sudeep.holla@arm.com>, "arm-scmi@vger.kernel.org"
 <arm-scmi@vger.kernel.org>, Dhruva Gole <d-gole@ti.com>, Sebin Francis
 <sebin.francis@ti.com>
Subject: Re: mixing SCMI and PSCI power domain hierarchy
In-Reply-To: <CAPDyKFo_P129sVirHHYjOQT+QUmpymcRJme9obzKJeRgO7B-1A@mail.gmail.com>
References: <7hecy3h7ky.fsf@baylibre.com>
 <CAPDyKFoLJ4zey6GNzCb9roAAJ5mS7B7exU1NEKtpLyyjD0aADA@mail.gmail.com>
 <7hikn5c5v8.fsf@baylibre.com>
 <CAPDyKFpuqk3jH91rkDDz_kejyJ5pFg5XH+=vdTA2aP8MJKUWrw@mail.gmail.com>
 <7hzfgf8xsw.fsf@baylibre.com>
 <CAPDyKFo_P129sVirHHYjOQT+QUmpymcRJme9obzKJeRgO7B-1A@mail.gmail.com>
Date: Fri, 25 Apr 2025 07:39:34 -0700
Message-ID: <7hmsc4s3tl.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ulf Hansson <ulf.hansson@linaro.org> writes:

[...]

>> Anyways, curious what you think.  I quite like this solution because it
>> solves two fairly big limitations in the SCMI PM domain implementaion
>> that exist today with one relatively simple solution.
>
> Well, I am not the one to convince in regards to DT bindings. Putting
> the DT bindings aside, I think your extensions for the SCMI Power
> Domain to support parent-domains makes perfect sense to me!
>
> In regards to the DT bindings (again, I am not the expert here), but
> maybe we could try to extend the current way we describe parent
> domains instead of inventing something entirely new. Could the below
> work?
>
> scmi_pds: protocol@11 {
>         reg = <0x11>;
>          #power-domain-cells = <1>;
>          power-domains = <&MAIN_PD>, <&WKUP_PD>; // a list of phandles
>          power-domains-child-ids = <15>, <19> ; // a list of indexes
> corresponding to the list of phandles above

Yeah, this is probably better.  I'm not crazy about introducing novel
DT bindings either.  I will make a PoC of this approach.

The catch with either approach is that it will be a long list.  e.g. on
the TI AM62L, there are 50+ SCMI IDs.

> The above said, I have also discussed this with Vincent and we thought
> it was a good idea to bring up the topic at the next monthly public
> SCMI call.
>
> It would be great if you could join, but let's see if we can find a
> reasonable slot as the current is in the middle of the night for you.
> Vincent will reach out to you as he is the one hosting the call.

Sounds great, thanks!

Kevin
