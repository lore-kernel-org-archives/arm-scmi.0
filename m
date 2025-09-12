Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C24305042
	for <arm-scmi@vger.kernel.org>; Fri, 12 Sep 2025 14:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757688647; cv=none; b=i2bqye193E80QmMUq45NNCwLi8PKIJCfuTk1kyz6zYR0ZAiwOa7VwgeGZVEFYPVa28Yh/A0SnzXnKrsjIlV4G0NFXO96bGnN+vpfcWFr/rd+NeG+ACAGsLFSt7JQeLTedj0XBX6dZ1gvXS/A6htIQfZwQ/FwxNuP9xg382LOdhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757688647; c=relaxed/simple;
	bh=nsgqBhuQMIRgj0Foq7lbTZgCUyn2NDAcRteObcMHZAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=QFjKMRVYxy/BkE9+DraEMl5nCjgCyROcO92Te/A3qv6IdXBQCP4cGwFmTaYUNBMX2kYvbkjqctXWSj5/4ssClfR/FvHQ8ai9qJlq85eOfIhgYLGOD8J8G762RxiLR4P3+7l7wDGB50r+Q3ACWw1yKEKHXFzBQfXeh1oxN7pgFvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SgYdBFo5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SgYdBFo5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757688644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NWnv1uPYTna1ts6VTb5bmSJ4gFzt0Uz75RWyORHBYho=;
	b=SgYdBFo5ifPrrZ7oxNpa91Nh1frkKCStQiFJUSFnXoXyAangRFoH26leoyPM15RvDbC6ZW
	SWulf1mHsdEAdm6fmf/EGixCayBTop0c+PUyyOOtNsolTSsrnqcYo3+5hDwhlGoh9yVwnH
	XpbIKx/IvSI4UtwT+7kW1ReOEsnyRSo=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-hX64maNyMs2Oi9odLXq_tA-1; Fri, 12 Sep 2025 10:50:43 -0400
X-MC-Unique: hX64maNyMs2Oi9odLXq_tA-1
X-Mimecast-MFC-AGG-ID: hX64maNyMs2Oi9odLXq_tA_1757688643
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b548745115so51515301cf.0
        for <arm-scmi@vger.kernel.org>; Fri, 12 Sep 2025 07:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757688643; x=1758293443;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWnv1uPYTna1ts6VTb5bmSJ4gFzt0Uz75RWyORHBYho=;
        b=V9+nvXvEz1POcs5rtnDoNzFTyVjteH3DssXbCDP0PRtE5xUiv6X2GqrA3pOC30EjzZ
         ILi90z0kH9oM8Ghk8/TsttVl6WrBZCW6P0oJB2yjhbbcc60aQhlIz/eLvfyBtuos/n9A
         KjkDaNZim6whdi0uNzNfqeC2tyKiZbt/P5+lgmh/tjG/i4B7I3/u6DD2EQLZEKQBW43b
         eKHze/VYA0+xi/K1kDiqNor+BsQ68PZFvEKFidRxKHPT53LVUB6gfwyxRUfHWcqQTVDC
         Z7ZKijhdQsTJd3NEUKtX2a2u04lrssL18nMz37aOTFrzGWri7JhJAfHI6B0OoJQQ3sPH
         QpDg==
X-Forwarded-Encrypted: i=1; AJvYcCVOx1JHsa+qj8d0T4VWSE1+jLuuN9gXBYae1PHf4wIhHNIcs/v9LuXYVN2uq/9dDQQdB7bVz9ha+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBQxGe+qLrwNzD/h5AHfhppKoHKZ5JBhfgCq/YvafBTssWjjT1
	8ZOBC8zJVVEIiE9ayhu547m2tmNRqCgzt4ZIlBpRE8S9a6Bt1str+h38ViVZ11BXMBLzSODXoDu
	30AyZuXpMMisjRVC5/0zMx3yIiLBnJVV3quox+J1621UCYbsk8BNUUHFkRt8r
X-Gm-Gg: ASbGncvcMI/0TvLwDIM+QXVIMyddBqowlotDtduFMD2eloaGkM3RwGY5wgpbWoQB4DF
	hPCE/1VsfPPCrzLFuXrbDhjlnV2YPoIDsTLsg/sVnUwXzsqIsP7UrM+ArZQRWBYNsDpdtm0iExr
	EUEknQjssnrZUmTBFCBfb6BIK95U7T7rrNt/q8dnn+CSTFNbmW/KkWDa4lvw8E8JD2cSuEShn3e
	b6k6lNIlHB4XZsrOhxvfoz0GyGI2eqm2miooU3mzl1tzYWDtOmzvi2EhpocRVwrNz6tF7yyWGEP
	NpixmFYwSjUuZoogiO3HIzZ8UraAA2csn+VeRTzZC7YYMySp24TAb82kTSa6HHNGe3cmc4wSdpk
	F1QQ1l2IACgfu+ujSoKSjZdO60iadPg==
X-Received: by 2002:a05:622a:5c1a:b0:4a7:81f6:331e with SMTP id d75a77b69052e-4b77cb3caa7mr40317921cf.6.1757688642711;
        Fri, 12 Sep 2025 07:50:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyVIdYLjBKhorz3T0zQ9Rxegov6rF9Te/Pu4Zg+RAzt3WZQiqnmCsJB1uwM7uqun0gGUSs7Q==
X-Received: by 2002:a05:622a:5c1a:b0:4a7:81f6:331e with SMTP id d75a77b69052e-4b77cb3caa7mr40317551cf.6.1757688642278;
        Fri, 12 Sep 2025 07:50:42 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b639a61502sm26238491cf.0.2025.09.12.07.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 07:50:41 -0700 (PDT)
Date: Fri, 12 Sep 2025 10:50:39 -0400
From: Brian Masney <bmasney@redhat.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/5] clk: Add KUnit tests for assigned-clock-sscs
Message-ID: <aMQzP7DamsQWl8_L@redhat.com>
References: <20250912-clk-ssc-version1-v3-0-fd1e07476ba1@nxp.com>
 <20250912-clk-ssc-version1-v3-4-fd1e07476ba1@nxp.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250912-clk-ssc-version1-v3-4-fd1e07476ba1@nxp.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xcsn_D7ozbBVLzw-SiotJZgi4FtpFjCl63qkYyJeWlo_1757688643
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 12, 2025 at 11:35:53AM +0800, Peng Fan wrote:
> Spread spectrum configuration is part of clock frequency settings,
> and its behavior can be validated similarly to assigned clock rates.
> 
> Extend the existing KUnit tests for assigned-clock-rates to cover
> assigned-clock-sscs by reusing the test framework. Add new test
> device trees:
>   - kunit_clk_assigned_sscs_null.dtso
>   - kunit_clk_assigned_sscs_null_consumer.dtso
>   - kunit_clk_assigned_sscs_without.dtso
>   - kunit_clk_assigned_sscs_without_consumer.dtso
>   - kunit_clk_assigned_sscs_zero.dtso
>   - kunit_clk_assigned_sscs_zero_consumer.dtso
> 
> These tests cover various invalid configurations of assigned-clock-sscs,
> ensuring robustness and consistent error handling, similar to the coverage
> provided for assigned-clock-rates.
> 
> Co-developed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

There's no need to add a Co-developed-by for me. I just gave you a very
rough starting point.

> diff --git a/drivers/clk/kunit_clk_assigned_rates_zero_consumer.dtso b/drivers/clk/kunit_clk_assigned_rates_zero_consumer.dtso
> index 1d964672e8553a90263af400367a2d947f755015..d62c7522c92461245d45f8ac0ebd26fa2850be98 100644
> --- a/drivers/clk/kunit_clk_assigned_rates_zero_consumer.dtso
> +++ b/drivers/clk/kunit_clk_assigned_rates_zero_consumer.dtso
> @@ -12,5 +12,6 @@ kunit-clock-consumer {
>  		compatible = "test,clk-consumer";
>  		assigned-clocks = <&clk>;
>  		assigned-clock-rates = <0>;
> +		assigned-clock-sscs = <0 0 0>;
>  	};
>  };

kunit_clk_assigned_rates_zero_consumer.dtso is modified, however
kunit_clk_assigned_rates_zero.dtso was not. The underlying test doesn't
check for this, so you can drop the change to this dtso file.

Everything else looks good to me.

Brian

