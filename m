Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6DE2EA15D
	for <arm-scmi@vger.kernel.org>; Mon, 20 Oct 2025 08:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760948417; cv=none; b=SeqMCchnF7mC+sPD7L7oKtF5FOHaRYJdUrQ2+XRXWLGYv9K0imO/biKrwnNWllezOqZSAu9XsdRh4UAVOrHQgqRiugxVlZAgdsQXC7oQLoATETrqv3BN3NFBJMkVLPOu5w2jOuLZ4lHzsXniCu7z05WPUe9FWicQIfHsOq8EXp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760948417; c=relaxed/simple;
	bh=EajGvo5tTGrOt86iBuo7jMfGt5xYQB4DZeidOw/o9Qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9Dzu925KyNpr4qxy4Jh7W/WZLtlNXGETc+bVJRWl08m/cFMcO2088xwjRTsQ/y9/v3TpP9V10tpZxcgK0I3LfVk4ltlyIlbs4zc+KG4cLggFJ+Cswc47Ev+BFppB+LaWUit97O5jSF+TmBC/dXovMaAzKKbuQRJ4137bKRmgzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XwkbjgvT; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XwkbjgvT"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3f2cf786abeso3117071f8f.3
        for <arm-scmi@vger.kernel.org>; Mon, 20 Oct 2025 01:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760948414; x=1761553214; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D4g7tLG0z0iauVDCZshwQEMQAR05MDuCJfXUDNGgb4A=;
        b=XwkbjgvTX7bKec2lxRIisY7tyDWzbbcVIxb1ctUzm2d1bKXNQoqsoZd2BG0NIS1nZi
         HRdvSGGeHYmMdT1XQgCGgUkNDhR3dC3J0A0XRbq1qu1K2sG2b16daRdiR61ADnB/CzEc
         B1QUWkEdoYSmDbcxjYOBwOnooU4Y6JyDIhh3xop/OPFKHYuVH26ariZZJyj/k/rrkVfs
         gS/w/XeA2oklNRh1xgi9eyzIxXJwp62Ds4DTmWO4QkA6PgT3xIKDKqq9RxACivT8+L3G
         B1cyIUuApun3ogbofsOsnZs+gg9Sx7d9wgn/MNKt6IAnMnBGhIJpHC1ef+J/RHs+y6c+
         DL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760948414; x=1761553214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4g7tLG0z0iauVDCZshwQEMQAR05MDuCJfXUDNGgb4A=;
        b=o4H/8hccUYhFz0qJosAIUP3OcVeKRxwfBhO+Hu4enrWxYYFapnlsKHs1XCiu6VOeMX
         k/HfxGsxyMi75oC6xTd/e40pf6aQPi/nlyN20Fwe8DBQdyC21BJu4lhW4OyRZiFBJDAv
         ej+2OeIz5NVK+74CvCc5T1cWKHEwlIsAEIRwwM/6F3OYhNTlLt9XpyurEKev3JHigPXI
         45lMwk2ewkUOE227QbQ6lAuiBXH6WHlB/85WO20DiTrrOwPVm6zQwxhHCu+ccnulffD2
         WgnR4jQ292CDvxMDMhxpmz+mSHIsK6HP4srdvER56bUogSrFAJ+TxWjhsii1aTugkBms
         cLfg==
X-Forwarded-Encrypted: i=1; AJvYcCVKwMG1fUxZw1DJD57V/xhFMkStFq50qxMWGumh1ewiNCBW15HQFDD6vanGeQOHB3psctcqoW0JOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSFRoe99d5OSJZAYOyCkFjQux9aUbJ+CcvurNKQIzNWaB1zdUf
	DfwuWhJXLXdhEdE1b24aTzRNqG+yWIzOUYTE4t+TQ+4BGGV+czG5MjRl742kVH6czsgDo+BEVR9
	arHM1
X-Gm-Gg: ASbGncsvy9RSQPxLCWUI10DEa8B3gZsrlxS3ejrgEVntBUprfbInIGlXay76USCoUC/
	tbjd5bUtuJQ3Reyi9lNBlB9L15kNMtOR0+G5PFXLJKWjseThZFOt5SnQ6ysKYrPhyIJyL0BCNgd
	SvzQLtpoZfwpd3NmoRWhRbEXpHq7E/2fDIFl4scEjPgEwWQ6tEFMZsqflgNRRWfoc1OjDmvmkHC
	HQPtyMdLL3f7pgMiCGqtEHr6yhulgiZENr+4hB8tbrLjueAfU3Hx5351xbBhi+pZHPzzmLWFykv
	CaSktzlq8osFI6R4CbfzbyHiu0FVZj+X6hMXz8Ik8Ru6bXNNAa6G5NugDhbTzrhPZAopB88ej6Y
	cXnHvqXDfEOmrLY1gLh8KDtVcZpACm6GByLihQHFwK4SwuNRPHADsa+OPGkFQOIaxDwHOLNwAoy
	HINYSM
X-Google-Smtp-Source: AGHT+IF9UUnAeLy3gCa6SVoO9qEd1RLxMrSgZ5Yun3pQeXRQI1M57QDjdkLDsr9aPMss860pll2eKw==
X-Received: by 2002:a5d:5888:0:b0:426:dbf7:9e51 with SMTP id ffacd0b85a97d-42704d522d0mr7056583f8f.18.1760948413562;
        Mon, 20 Oct 2025 01:20:13 -0700 (PDT)
Received: from localhost ([41.210.143.179])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427f009a75bsm14255515f8f.23.2025.10.20.01.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 01:20:13 -0700 (PDT)
Date: Mon, 20 Oct 2025 11:20:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 7/8] firmware: arm_scmi: transport: Add ACPI PCC transport
Message-ID: <aPXwuEebbjEJHmc5@stanley.mountain>
References: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
 <20251017-acpi_scmi_pcc-v1-7-0adbab7709d9@arm.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017-acpi_scmi_pcc-v1-7-0adbab7709d9@arm.com>

On Fri, Oct 17, 2025 at 02:23:50PM +0100, Sudeep Holla wrote:
> +static int pcc_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
> +			  bool tx)
> +{
> +	const char *desc = tx ? "Tx" : "Rx";
> +	struct device *cdev = cinfo->dev;
> +	struct scmi_pcc *smbox;
> +	int ret, ss_id;
> +	struct mbox_client *cl;
> +
> +	smbox = devm_kzalloc(dev, sizeof(*smbox), GFP_KERNEL);
> +	if (!smbox)
> +		return -ENOMEM;
> +
> +	cl = &smbox->cl;
> +	cl->dev = cdev;
> +	cl->tx_prepare = tx ? tx_prepare : NULL;
> +	cl->rx_callback = rx_callback;
> +	cl->tx_block = false;
> +
> +	ss_id = pcc_get_ss_id(cinfo->id, tx);
> +	if (ss_id < 0)
> +		return ss_id;
> +
> +	smbox->pchan = pcc_mbox_request_channel(cl, ss_id);
> +	if (IS_ERR(smbox->pchan)) {
> +		ret = PTR_ERR(smbox->pchan);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(cdev,
> +				"failed to request SCMI %s mailbox\n", desc);
> +		return ret;
> +	}

Use the dev_err_probe() function for this:

	smbox->pchan = pcc_mbox_request_channel(cl, ss_id);
	if (IS_ERR(smbox->pchan)
		return dev_err_probe(cdev, PTR_ERR(smbox->pchan),
				     "failed to request SCMI %s mailbox\n",
				     desc);

regards,
dan carpenter

> +
> +	cinfo->transport_info = smbox;
> +	smbox->cinfo = cinfo;
> +
> +	return 0;
> +}

