Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885E728030E
	for <arm-scmi@vger.kernel.org>; Sun, 18 Jan 2026 12:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768741128; cv=none; b=pViPGBBtLW/zVgWczyhefRrj+EEvC3z0RARWHPacbgACZKLmBVQjnJJKuwSFebHjGH7qgX6eqf3fkASQCWEwr+gnSwdKS1q+6/Z149Fa/N9EjtbHHh/dOMmMElAx3TkhPUO++zOw0l1+3JL+AoavAIV8yeEOWJlxt84zk7bWfhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768741128; c=relaxed/simple;
	bh=gbJ/Le8qHZExPKVU8bebvYYY/CMoAwcquX2inoQoldQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qhdiKwrYgrJv+ohVbZBW/GwY5f/ethRMsD520LIfMfOLr/j2qvNiDVclceDEO62abf2Dprh4wMJNs8IgHYvr/GVy6djnFQ1Bbgz/y4zMdKJpd5z8zHUkR6YEcWci+TVrcugd3uI3cTdwEsHj/hO81o6EKZQAYU4YlejDUJ2hAyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JTQY6Byr; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JTQY6Byr"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa4so2966589f8f.1
        for <arm-scmi@vger.kernel.org>; Sun, 18 Jan 2026 04:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768741126; x=1769345926; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8jA2WQ8d6BTr0aS7jLj7RgtEbZFsRy9udOY7D18i2rQ=;
        b=JTQY6Byr7BUEPRj7LpO/rM2uChBNZzlsV8+VVZLcA/57Vhep8JFReVRLVMTfpIreCg
         +zUGe+5hGYH0MBALkxrGIrWq/V6kdPqj0xgoThmIpVrq2FjTt/p1sPCFnQhw8nNdNHn0
         a9KgEE4GyIj4rVqcGn9FvG87fhSOitLlQ9rwoLRjn753JyUZr2U6kvoUCzHMw38OhhDp
         dpFbT+kKI1bXxpTsqCJx8ieahIU5CubYZWPYvXbV/M8fwCNjjyqQl1uVCsvIX0bDWjpT
         DFovHEDYCUbgEMvbLhAcSnW7Gukv2KyxaoJIuiNSq87aq3yZE+p09tfD40N7AsJ6urkB
         TGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768741126; x=1769345926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8jA2WQ8d6BTr0aS7jLj7RgtEbZFsRy9udOY7D18i2rQ=;
        b=e9Dg0+s/fZeNp/LWiL0XjTBZEmSK7oxcOWe97XY0TW5hexB83+TbMMfPngpp8rdjg7
         6G/6t7BrDsOASQTuH9XiNDUyJWJgpjslLMT94HyzV817J7WW9WAdkUHWOLubywwhJh9+
         9DpfXG4JQ2GLsIz0B/TfQ5cgCMCiojhLj04al/1swqkdmAa40bD/RYYsj8RQLGTbYFfR
         9o2De+EwLD0SiFw+7JLTPal8Z/uEaszxgFwTY8Jf0SkeHn0gEVtgZQz77NCGWhGC6z7i
         8g3T+SLdFuVai0SMT2IsV4wgs7d05OpW2UhdrKx5ZkZ2v0GlMqDoLiDyPQKBY68Rjekt
         OW9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUoh17HXUEukRjx2oDWWurDzvBmyS9UazrRwQXfbTsCpagmMKfanCallga5za2YaycvXl+sCMNnGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxheTh0B1p6rrlG2SdFwvIrSocLwhbbjcHDOIDa+EYg8DbHqCM+
	pgB/IlJVr2k/0l79Ub5rZNJKH2id4oko2aFI3ZanhjINij9ImQ1ZWgmWZxdJve3vhOE=
X-Gm-Gg: AY/fxX7Na1e0TH91Hey8ja84kb/6QF7yfS6zfhSRrUlj0h5ppsjrfRcmBrL8zPmH1TG
	j8chC/3NORNoerpKcwoGaJ8sgOQhljjr0nXxf+Db3Dj3jNK0v4zm4Ec8jvfA5S1A2Yc18Wx//55
	lgFAHbbbktIYqhMxU6zt83ozCqG26vtK12CSMGF2x2G+qTqVoyCOZcha2nxZ6Vn7MBGqQW3fVb0
	Cpib33wBKC2A4Mysra5nZpqR/2MPcrnRdLoZp7PXN+QkCs7wHOigRmS8oNlpIYKkVcRkJAZCQcp
	PLtA0XjTw0zKnT6flHPUYOOomMgPkzqDdRceA6cAyEe9vx6ZaONKnZ2QBJTUvqY4fH4yDUtGP4Z
	hr9U8gk869mtMGJw0BzBnRs4dj1bqU00GxbhEK/GaZuGVDaTnio74JmEZs2NfsWOCjrSqnuFtKS
	w08svvZFsS39ToKoO3
X-Received: by 2002:a05:6000:1861:b0:432:dd71:8f2c with SMTP id ffacd0b85a97d-4356a03321dmr11019244f8f.10.1768741125893;
        Sun, 18 Jan 2026 04:58:45 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569998240sm16311789f8f.43.2026.01.18.04.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 04:58:45 -0800 (PST)
Date: Sun, 18 Jan 2026 15:58:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Sudeep Holla <sudeep.holla@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Felix Gu <gu_0233@qq.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: firmware: arm_scpi: Fix a reference leak on device node
Message-ID: <aWzZAqhGIYIpoalf@stanley.mountain>
References: <tencent_A3E20C513BBE7D268B863A5CE473FBA10B06@qq.com>
 <9d44f5c6-9197-44ec-b7fe-50c2a686a751@web.de>
 <aWpaOYy6M_wNiMJU@bogus>
 <9438c328-c5be-42c3-b7b0-17dae62fac98@web.de>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9438c328-c5be-42c3-b7b0-17dae62fac98@web.de>

Markus, there are real issues to discuss with this patch.  You're
derailing the email thread for no reason.

regards,
dan carpenter
