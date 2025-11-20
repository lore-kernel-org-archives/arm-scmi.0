Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4F32DE711
	for <arm-scmi@vger.kernel.org>; Thu, 20 Nov 2025 10:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763635267; cv=none; b=RK2UcfRxswuY4ch5fyt/jSDlLBaiwkibz3MX9RtAxfeE5lNrW3OJzoHXF9iN+daSOdBmgYrHuK38DHqfcxXu8lYVQ1peMpG4fjJtn1ZoH3OExgdQP7c8HQkv+0P0hFY89nE7rBjBLL28UBEEoQXKeZ/hiYFacsLMgh8JEmBWZ64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763635267; c=relaxed/simple;
	bh=io0yQaa1iknMZ7l3/uqh69Bqn+IbEs5aipi1mxEhbhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GMGUSni7lDIMCDCPTmfTnGQDCyq1NeZPsvXmdVLQIccpiThoeDGkogjDxJ5NtNuyfpxLfLHSl0PoarsFH9smyJEyBBMXHl1fZc9k3Q0XschKznKTXvvYuIa67VHt/t0tX2/Xd4E6aojWZmB3i/V+TykG6czAs+6hv2xEtUMsAIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZVWYZX+J; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZVWYZX+J"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so6410935e9.2
        for <arm-scmi@vger.kernel.org>; Thu, 20 Nov 2025 02:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763635264; x=1764240064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6mgwJ/4Ukd3943JvYrBsHnnqudEXP4H0GnoIDUoRcjc=;
        b=ZVWYZX+JN/f8iDmjZp5yg2RjaIzZd2mokkn/eUWWs8lsP+0CaW6MejDN7PO+TeXplv
         5mTNyCO27siIgDdmJFyLxK0fDDrRDc6Dz8vmfExrPt/tQGClM1lixolhBVnF8fk7pTHb
         bvGjbX1+7sKQZ7DggPqMAggGWKNnj0j9YgLG2PHrLgR5Z39qN8ZCzlnwKqq2hkxd/B35
         J8mTU6t2kHgH2b4OuQdTkj4ImqR1WUzFPwvuiPA6WAfHqCvAI7uSmqTZ8vGAkjWCqPcU
         msPEAPWobedjWDKH9Z+0fKmdOlkMMQuGYd2aRMksXP8huVUGatKaltpwyEpEYsKQmkvy
         mrlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763635264; x=1764240064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6mgwJ/4Ukd3943JvYrBsHnnqudEXP4H0GnoIDUoRcjc=;
        b=Lvjm9aApWtqiTBO4OnhW7su1/TvS6F5rwXoe1wYYKxoPISG4NTiirpq/Y7vg/MkjW3
         PdBJNtY5iKkX921pJ/dVlOrH3PutvIRrPxb1Rb3vVvzV0c4yxtCTbdf2Jxq1CEvDcUj4
         btQ5GSkdLwi8w1QwJmeAFX0PJxLUuDJ3icxQhRmw9YKJdfZwj1XI1dplan4UeM6rerb/
         59feehe3A+wS24WBUB4G2JnmKFc44ecV1drIh28wmAdWJbBWRrYlJoLGPNKMAuZkYygo
         vk/8A6YlXDiGqgiteZiiYZAF/oN+fGEGHpoJecT8LLTf8cH1ehalbPXcvSMtKhf8Plba
         dQqg==
X-Forwarded-Encrypted: i=1; AJvYcCV5CLzZF7by31jbnG9veo+Gi7sN49lV/XFtTAwaMsCrYxcBPGXooToO7SWFDWixtZNKm/qn1PSpuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/jSOZrlLtSjFQwVx7hxJBcSsXsEggCWuUsVQLXSRbTw7zpv3T
	u+T/t4nMXYXW0LhRWS7shaGTdbIL9CUYH0eNOZsR1hSeIf5Ou4+tPozcn0fOcyADr8I=
X-Gm-Gg: ASbGncvDbwyY4isURyJ6gVk9tOgiKPzNEjQYACcUQ5rIj24sqxjaBunkoUo8RRxYhqv
	VDxeT25HyEJ5Wq3N9sYugk/AJF7xMkcYBf5MS3xXo8NzLgoEOAioDE6dT3RvlfnZ1Q2y1Mrgxtq
	JN+Y2aZqq34WZ+uCUPOaM0LzbC7y3L9LIs2plZABhpudGNEQfKbLVcl9zecNlJyVKl6jqj9g/yO
	iKDo8wqEfAe3LIXEv+ZYf0wF+kW52nbl6XhIKGjq7jDu1XWfdyGwuEPNhZAMH5Ui5jED91pI6Dl
	DnMtYtPoI1D+UBY2a7XFEr42TJthJzkI4HTQ2Cr8JKcRf931cKhiHId48Wdhfa6uF3I1jAYSB19
	xKaK+nQ9+wsy3QuL3n3vEaVDOwKqQKBkkepbyU1hKI1fvaxGZ4iaN1/z4bEz/kw47lsq6CqGaL/
	ovkLrQNSKfINgEJviw
X-Google-Smtp-Source: AGHT+IGGzICrs8WsC0ZES68VHcMi+t5RlEr2PL0lmqRHtaEz9GTuPQDpK/ZRodLwmdHXmR03IHrQcw==
X-Received: by 2002:a05:600c:1386:b0:477:7b9a:bb07 with SMTP id 5b1f17b1804b1-477b8c91ecfmr28935345e9.35.1763635263239;
        Thu, 20 Nov 2025 02:41:03 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477a9731a75sm63861745e9.2.2025.11.20.02.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 02:41:02 -0800 (PST)
Date: Thu, 20 Nov 2025 10:24:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Kevin Hilman (TI.com)" <khilman@baylibre.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v4 2/2] pmdomain: arm_scmi: add support for domain
 hierarchies
Message-ID: <aR7CEzlHFYmQykKm@stanley.mountain>
References: <20251119-pmdomain-hierarchy-onecell-v4-0-f25a1d5022f8@baylibre.com>
 <20251119-pmdomain-hierarchy-onecell-v4-2-f25a1d5022f8@baylibre.com>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119-pmdomain-hierarchy-onecell-v4-2-f25a1d5022f8@baylibre.com>

On Wed, Nov 19, 2025 at 04:58:46PM -0800, Kevin Hilman (TI.com) wrote:
> @@ -110,7 +110,14 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
>  
>  	dev_set_drvdata(dev, scmi_pd_data);
>  
> -	return of_genpd_add_provider_onecell(np, scmi_pd_data);
> +	ret = of_genpd_add_provider_onecell(np, scmi_pd_data);
> +	if (ret)
> +		return ret;
> +
> +	/* check for (optional) subdomain mapping with power-domain-map */
> +	of_genpd_add_subdomain_map(np, scmi_pd_data);
> +
> +	return ret;

return 0, plz.

regards,
dan carpenter

