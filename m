Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B02268FD8
	for <arm-scmi@vger.kernel.org>; Tue,  8 Apr 2025 10:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744108612; cv=none; b=OuxNi8q1/U3mGMnWfmWM6wJ8pAaOT7iDbi/gPVcW8f30v3munH1ZOHxVpfGgq4IsXChh0voOMYFrCtW+5n8QSnOVc+QtqjqABiFNJBC/L3vs5i3pp7DvtI7UgugeC26JuAumsTcYilH8v866CY4a4cUZr1PvAf6m9RjtBQI1JeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744108612; c=relaxed/simple;
	bh=wzJvWLjTqiJYfQ5XdcRzN/rVMxfu+Qr9nqKFKHXaH7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IDZ3utGcPDQJ6EYRJCUqHvKhYDDeFvM6Bv9UbSsc2yODrlevU8Jg6wS59HjGpAoCX7Recyg7/c4+rycloKBmv5iirxaXBPUf0VvsplhLMMNLHXGR17ITtkljSyfwy8cqnBDeo70QwkURujNa4Xde/UHdX6U2wEJ3ZWKz+v4gFp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NLniHdUJ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NLniHdUJ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso34494925e9.0
        for <arm-scmi@vger.kernel.org>; Tue, 08 Apr 2025 03:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744108609; x=1744713409; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+O8LIaQE6WLNSGODkrJEsZ72gySO7jid8n0Swavjxzs=;
        b=NLniHdUJXbcXaaa7RX9s84+MOKL4uWFm0cUNDMaGv7WrTXXMdHscmleYNqpwNK0wPI
         CuIDF+Cn78ulxZIXAQDuqOXDcoiVFLQ5Dqy7DY+QsPfwehNFC+JzuwoiJUfvezVlIASK
         WCI6WFNXrmfSwSL6s+7F37/Vu4g+wg86Sdq6QfS6KacgUE7FWI854n/c/ygp/LSQe9gv
         xUQ/RQW5dL8IWTdRN9gYBvbUbcyrdF9i0vSrB2OB6XZ2YFrWLNrV58lKyr97Iol/FGjF
         ByVZ9CCeGJsagnHgWSQka987ooPgm2QCFe7gCqB76GR18xG8D961Ns0PZllHQgoLfJgR
         1plw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744108609; x=1744713409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+O8LIaQE6WLNSGODkrJEsZ72gySO7jid8n0Swavjxzs=;
        b=Fcxlv3fOeddPRsxhDquOAf+g+1zAvl2Y7x9OfFbVCsKLyVonz3Q4cfsH/vgVIOD4gD
         05rcPwdonlp+pa1pE3LVLM/Am2Ey2AHqUijdvS6WxWGALQ3J1zy+ssHePSWEgDsOozPV
         jCHgHx/jyDTm01TeEK9BVj6V8iXLIYvjCEbVpCLPxz+zA8aQ6ewarSdXPJcfxBhLjN8D
         DNHRZJNdr2AxbsdB/cgsWF5z0i0QxUk9Jt1oU5S1HexadvFwal2mpCLoLKfeEzo5OmaQ
         l60Qy1vED3fC/lp52DO7I6xuCpPs2ePghHJ/xMDFO7kkbltNkJFY4za9VegNVCHIvCF5
         Lt1A==
X-Forwarded-Encrypted: i=1; AJvYcCVv6jhf0uwlkQEJLCVZDOyxx6Qwukl25HceZLgTDRSwI7vy/09QrOtI6M26LS3tSEaYBioVcaLtAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKElOgEem1duXlCVEX0KgFQjans37GRoVflUABtfQQjD71qX0h
	0wHOIj2Gf2lrEK/u/+g74iiXtKfjSMyCUBBbXEGjWQ+HJ6oyc6AqMVO/eNfwbGg=
X-Gm-Gg: ASbGncuc4uj4+ZwrusERdarjrq1063O5up5PIEZXRVQfnTB6Col9kQlvY7jF98pmM+/
	bOWfw/ZhP0HeV6EFTa9CXVT9+BK2c/dheVX+vNk/m0IJ610f4kFgrlRIb28VdFjG0pIEJM99tQ+
	LxHQlu+c45+MgDX3lMi3RuhqVw7XFU1ghqnK+9/eBEOEhKUQ5eXpRquVoH5zvMR8e1P34LVP+X7
	nPDIgZoPDsVfHyy5SqJxMS8ANtws/ZJUA173y9XU9XCIn9t5M5AMZXJN4BPmcaZs1sitaJih3//
	U0XWm9BOS3H3XIOv1fVLVkEl4EWAY4RhF3NuV0QvEe6xWaKSRw==
X-Google-Smtp-Source: AGHT+IGOw9Xy8oGk0GJfiu7VaitjR/t55edX0t5tshdnocYA+5fRdb4Pypir8G5VxuDaVk6MtoCiMg==
X-Received: by 2002:a05:600c:3494:b0:43c:f8fc:f697 with SMTP id 5b1f17b1804b1-43ed0bc8d96mr155476115e9.9.1744108608941;
        Tue, 08 Apr 2025 03:36:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c30095ea8sm14397521f8f.20.2025.04.08.03.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 03:36:48 -0700 (PDT)
Date: Tue, 8 Apr 2025 12:17:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4 3/7] firmware: arm_scmi: imx: Add i.MX95 LMM protocol
Message-ID: <c71fb862-85a5-42d4-91f8-398d0d532872@stanley.mountain>
References: <20250408-imx-lmm-cpu-v4-0-4c5f4a456e49@nxp.com>
 <20250408-imx-lmm-cpu-v4-3-4c5f4a456e49@nxp.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408-imx-lmm-cpu-v4-3-4c5f4a456e49@nxp.com>

On Tue, Apr 08, 2025 at 04:44:27PM +0800, Peng Fan (OSS) wrote:
> +static int scmi_imx_lmm_protocol_attributes_get(const struct scmi_protocol_handle *ph,
> +						struct scmi_imx_lmm_priv *priv)
> +{
> +	struct scmi_msg_imx_lmm_protocol_attributes *attr;
> +	struct scmi_xfer *t;
> +	int ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES, 0,
> +				      sizeof(*attr), &t);
> +	if (ret)
> +		return ret;
> +
> +	attr = t->rx.buf;
> +
> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret) {
> +		priv->nr_lmm = le32_get_bits(attr->attributes, SCMI_IMX_LMM_NR_LM_MASK);
> +		if (priv->nr_lmm > SCMI_IMX_LMM_NR_MAX) {
> +			dev_err(ph->dev, "i.MX LMM: %d:Exceed max supported Logical Machines\n",
> +				priv->nr_lmm);
> +			return -EINVAL;

This needs to call ph->xops->xfer_put(ph, t) before returning.

> +		}
> +		dev_info(ph->dev, "i.MX LMM: %d Logical Machines\n", priv->nr_lmm);
> +	}
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}

regards,
dan carpenter
