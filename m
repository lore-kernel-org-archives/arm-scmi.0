Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9D12248AD
	for <arm-scmi@vger.kernel.org>; Thu,  6 Feb 2025 11:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738841487; cv=none; b=qxZQy9Fcoip9Jr2bPTnqLCegeeN/pFj400d1Q0GOxXJT39Dd5UTVDezJS7ph5tLUoygu64yvO7Zmg6oiUH85msa3F/iPw2XnDHTGb/v5i8xXn1gEhVJq39miUJk1JypR88lOnWePRd/fk834DOOISlDpQ8Kvo1K+TjMdlXt5lqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738841487; c=relaxed/simple;
	bh=zkGa5WERNlcjx9M1T5UZoFwgT0eWSaHUBpVHYuBMcKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E22fOHwtENdvNfjHoyL1pFRkH7E+xQhk92DJnNnmUbzyUs9Wr2m6dhvx5XDEUJXJi67eBHVHFXyHpf071KpB0vAmulBlbUf7UYQtRjWUloAPMBe1REtN4qjxQD1s33ZJJu1/gEwe6psz++UHp8MnaH8PtrydpI2kc7aBdtFOVKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tzaMsSzv; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tzaMsSzv"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4363ae65100so8735835e9.0
        for <arm-scmi@vger.kernel.org>; Thu, 06 Feb 2025 03:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738841483; x=1739446283; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oCI1ZBTo4CXvGl9Bx83X1jcDkmWE56kdXG7He5kgffs=;
        b=tzaMsSzvxHK88gKeBut+8lVTlpUXmExyLGu7Y4BC1fHp205y9bAzJkO2pn73BmfCcA
         /Y2gcuHR25JsIqW0b9QesD3U5/ssCY3tleGBqE/aBAMRm2UVxLek960vrDNae7qftnUs
         3iWFwe3Bi0oSFiobSPvY5ci33X0Ei5s7DUThV5F3wcvAahan97nptEVdu539MDH838BU
         6Jd2PHNfrNtG7cPRcKEt6FFgkwAZFTtBevG1wo6/dxS84JYuCWAS7vkqrfvfaiovyTrE
         jPDSTUwteTDDGbzwrBFeBkN1e5UPhVXCu9o1Rbfr8eBreNOTnJNYarlpUjbR/7kCmbLh
         EPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738841483; x=1739446283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCI1ZBTo4CXvGl9Bx83X1jcDkmWE56kdXG7He5kgffs=;
        b=XtA1RHjlxFHubnPgmaLOD4fic5A3JsYEWCJ+amDumS5r/8Gg2wChkgIpiXw2EFq0jM
         q9fRbvw+sIBD5W3AIPmgT0AsgVEt3OQoQBombMo4U2vlCTQBXk+HC9Lkm7iGseu/LTp/
         hebBr47QrAtBgdykI/EYGLCKPQIF021ItFmxocJuDg+Gbw1igB4ZtMwFRmzWLU4KtoLQ
         65R9XzmVfKD7/vHLTheRqz4suNH7WQeOAJ16xlM+IkvyK5QZh2wIA3X2/2Ni3ns3yCz5
         XreXG9SsJH7VEd0TM7EFJezSXX/D3GtxmNroQ0Q0LEEdYXPBN07NTuHiz5z44FHg9Kr8
         9BmA==
X-Forwarded-Encrypted: i=1; AJvYcCV6wSIGiLJBi9Fus8QEn7UJ4vXw7Uqyj2Bknjr0xbHY35qHwjvExmFf8zFgEIK2CRUUJ7k3kL59hQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YysOnCy5C1Dfpe02zDfB+1qKWi36vqllcPbTiNw1CT5Maywn+g2
	SZ0GBxUyLhofLRhMLiyi9iPLiLBzGPScyX8lKdKYqMtldt05N6TyTPgv+3f417k=
X-Gm-Gg: ASbGncuEgzo3KZ+mECuiAJn3a5t3NghS7KnYa6LCP4X+9jMqy2QN5FkIniyXVqMXayV
	5C3y8IlK+wuDrV4gVxVVRw9jm31Ex8ZoTNusrLZZ4euFCtK6LvDTAsRrFDN6TnpHCCCxc/nSWGy
	jPFuRUxWtHIGQ9WiiqaiuBnkhC1qwPEIn222acjZocNwFE1OwFy7OlZEP7vaBtaM5Zg/eQI0otk
	3ATDlwY6DFEQkvJk2yQYwlGB4szMo/kg7kzGYAST4S+tBIQjt9Hi8aE3VtaQSWvFTIykK72p5cM
	TkEWSNv5xttFmSEBCcEJ
X-Google-Smtp-Source: AGHT+IH7D8euabfcrwCOQjtY+IXcdW/axRayM6NaqPRFSLZQPDH+rc/cv5/qoeqeWWI69RXkq3ju1g==
X-Received: by 2002:a05:600c:1d1e:b0:434:f5c0:329f with SMTP id 5b1f17b1804b1-4390d43e471mr72311885e9.14.1738841483532;
        Thu, 06 Feb 2025 03:31:23 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4390d96517dsm52528035e9.20.2025.02.06.03.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 03:31:23 -0800 (PST)
Date: Thu, 6 Feb 2025 14:31:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 1/4] firmware: arm_scmi: Bypass setting fwnode for
 scmi cpufreq
Message-ID: <e20415aa-517c-4e72-a1c3-9c02769c1149@stanley.mountain>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-1-3af2fa37dbac@nxp.com>
 <7a29ec8f-fef8-4f1c-a2eb-16a63f2b820c@stanley.mountain>
 <20250206105218.GA22527@localhost.localdomain>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206105218.GA22527@localhost.localdomain>

On Thu, Feb 06, 2025 at 06:52:20PM +0800, Peng Fan wrote:
> On Wed, Feb 05, 2025 at 03:45:00PM +0300, Dan Carpenter wrote:
> >On Mon, Jan 20, 2025 at 03:13:29PM +0800, Peng Fan (OSS) wrote:
> >> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> >> index 2c853c84b58f530898057e4ab274ba76070de05e..7850eb7710f499888d32aebf5d99df63db8bfa26 100644
> >> --- a/drivers/firmware/arm_scmi/bus.c
> >> +++ b/drivers/firmware/arm_scmi/bus.c
> >> @@ -344,6 +344,21 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
> >>  	device_unregister(&scmi_dev->dev);
> >>  }
> >>  
> >> +static int
> >> +__scmi_device_set_node(struct scmi_device *scmi_dev, struct device_node *np,
> >> +		       int protocol, const char *name)
> >> +{
> >> +	/* cpufreq device does not need to be supplier from devlink perspective */
> >> +	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq")) {
> >
> >I don't love this...  It seems like an hack.  Could we put a flag
> >somewhere instead?  Perhaps in scmi_device?  (I'm just saying that
> >because that's what we're passing to this function).
> 
> This means when creating scmi_device, a flag needs to be set which requires
> to extend scmi_device_id to include a flag entry or else.
> 
> As below in scmi-cpufreq.c
> { SCMI_PROTOCOL_PERF, "cpufreq", SCMI_FWNODE_NO }
> 

Yeah, I like that.

-	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq")) {
+	if (scmi_dev->flags & SCMI_FWNODE_NO) {

Or we could do something like "if (scmi_dev->no_fwnode) {"

regards,
dan carpenter

