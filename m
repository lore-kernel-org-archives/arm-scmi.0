Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA0E1CB337
	for <arm-scmi@vger.kernel.org>; Mon,  5 May 2025 11:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746445187; cv=none; b=X3EJyYnauhK3Ku9CtpDVQyMAoDu3cOjgaXEaU+FYlUiYEBggM7s18qaGrsGlhwWXPqWCTOCpZf0dvg4jjx+eHE1ZQMfuJTSKfIupaNFVywBsKYDTD8EedWSLVWJmdXuIYPSO5b3md7FFlygSS/ev0CRtLaeHeP9OmLxC47quIj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746445187; c=relaxed/simple;
	bh=4bKLvDsMPtH7EF9AXDSmtoiw8jurLha7GghprHG3BvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E4G2N7+k/sK3I8E80Fw/rE/Qdx0uL2k6gtAQRHYYHfIOt+1Gv+EHz1M5ya6j9iWQBvWc3I2enkANS6E5RP41koniroAjEl53MELcaW236mHOJ2Jrzo8saF5BiSNX1sUVa3G7lpaju+B/wUow40+5IdnCiQecsTmDZkr1rjwaovo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TN6+LJud; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TN6+LJud"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so27622785e9.1
        for <arm-scmi@vger.kernel.org>; Mon, 05 May 2025 04:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746445184; x=1747049984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mJ5GcmEYYVhQR96gxyM5WKIfvUizOn+pM0wiDy3cDmQ=;
        b=TN6+LJud85Ylkf8tXRdSjuWZCMG+R80wAhlGd9Q9RRCjzeuZ1s/C3xpVXpkxYUvuFK
         iJL9DH7KK987kWAtrQ+TtJj9lyQCOmih7JRBjdHUFIVJUQ42MZw6/LD2cWqInT1jdXEB
         D3BB1OH3mOUmnD6+aj2OXUJEYhwpm2kogzQZofcHWAlpkmo6czoYn0R0I+K6AoXmUlTC
         +IJX5eQIg5a6iNe0faQkR2/xHOkPadnevNuQ+I3E7Nj/OnSltEapQ0+mscncGe1kHUtc
         xF3dnT+u7bg/K1eMpMTbm0sEQ7caHL6OxU6t/sqV7QmwwMXZcifcXQudScPqmTKqCIjZ
         M1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746445184; x=1747049984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJ5GcmEYYVhQR96gxyM5WKIfvUizOn+pM0wiDy3cDmQ=;
        b=BhFMy+VX7W7+WuCWec8iEm03hHQDbMmTs/lgEJSQO4kxLjJNtq0hxnIvvlHrsPpSMW
         j9GsVrFo/zUezLnU9XfO1+UD8qjI1//Vm8mfc9cnPunsLTlVnWbImm/n6aopynCGQnG9
         vKM+lny1zS+1gW6HyUZXZKbASO+abwyyZ4x4jPG0JF859oHpv+LYFlhw7p+UhNhbg5yw
         hHRaMqHjc1arRPyU4AlUEPKpnRSPD0bdg1XflrKolk1f/PU38d8rA0JgyY4MJaPXYEQY
         83iyQ7YiEXylpb/ICzDwNp0lqUCd3E4XJo5Bvagf6bUx906fLQSTh5TVCZy01Ugg16RI
         fL6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWCmrI+8pbV48wnSyeG5Jh+uaAd61TY/WHB2ve5Kec6HEQ9+Xw3+B2jpXXKYSU4VqfTKnHlHoEaug==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTYqsHwqvPkmzvpzJAbUcZV/pYdxteBXK1dWRrDfHNhibnJiCs
	9SA7ScnIIEqI4jTSkcQvfvXwcjwRU8RmWTYzSeK15XUM/RTJuDRp9OaBFLL6AR8=
X-Gm-Gg: ASbGncu3GV8YCJlqI1ev9qQBNn0K3gg6kDNA0/3XQbqVnMCYAVEU6B6DD8M+ZNdiQpT
	HdxZ0cul29ywm/A0BKXd1GOi4q4CK2f1I+/ZHrghp/WSHVB1VabCGAMJWNwNrCvAUYIzOcQ076O
	X/zipXNyaeCfu7ky55qCkmF2CxGOYRjZjYP6xDmho9w9DOkBu1tYgScmEL5R/YTECO8FDE4q5zh
	sprOgaG5rcnLU0/1TbIL1PBysg9RjEjVMk3+MoO1pj2bEE0+RzCQ8WRsJ9mZnXQw3HuZfcwqn/l
	KLk/tzydi5zDfLRQgTxJUg8l65W4974CoJQnk+5SAmKdBQ==
X-Google-Smtp-Source: AGHT+IF691cbKdNi4eo7oEzfSp9l49WgI8HMTDJbfgYt7c7D7g1nuGGELzTh8vYSZBETmpZ7y7TCVA==
X-Received: by 2002:a05:600c:500b:b0:43c:f050:fed3 with SMTP id 5b1f17b1804b1-441c48bdfb7mr51792235e9.11.1746445183903;
        Mon, 05 May 2025 04:39:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b89ee37dsm129618395e9.22.2025.05.05.04.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 04:39:43 -0700 (PDT)
Date: Mon, 5 May 2025 14:39:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC 7/7] pinctrl-scmi: remove unused struct member
Message-ID: <e7a338b653d378b37f8e0a73ebe6750adc1cf280.1746443762.git.dan.carpenter@linaro.org>
References: <cover.1746443762.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1746443762.git.dan.carpenter@linaro.org>

The ->nr_pins is not used so delete that.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/pinctrl-scmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 40b432aa4756..d1f3c126c3cb 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -45,7 +45,6 @@ struct scmi_pinctrl {
 	struct pinfunction *functions;
 	unsigned int nr_functions;
 	struct pinctrl_pin_desc *pins;
-	unsigned int nr_pins;
 	struct gpio_chip *gc;
 };
 
-- 
2.47.2

