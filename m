Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B238C2C0285
	for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 19:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773257912; cv=none; b=QW99pAp7Z12eRmZlJooOiE62CLvqCT5HBD+4+oR1eKJCnXXr8rGlT2/OBJtzrPaZm6s9v5zE+2kcR6Was08LlRJ/b+wLrcYzdSpTxB+RNJlT1zPiihL7QqOmwvTU8AY0knMK+hEzmQnmR8KqRza324FpPq/D+VdvplTdXC/fhXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773257912; c=relaxed/simple;
	bh=SufqcgiMGlErJPwQicSM/zXxq/8THKnYyGg0Vhb4umA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s9+14hiFS6uicSG+PnG4JRSJvJO4bMJK94BU7aEKMkTTv7cJaOj/Ek3bpnp53B5/ZbfSEt71JlrtrExF4ZvXKOI8ZqcS5xEfjIxRkctReP/zBN2HfJuveYq+lTtZYkpzMA8E3YfJDTbukPOgOykXpOY0P/vrEzD4fTmIFJ4025M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Og6Zopm9; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Og6Zopm9"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso1760165e9.2
        for <arm-scmi@vger.kernel.org>; Wed, 11 Mar 2026 12:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773257909; x=1773862709; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YKrwQxPh+RV1xNOdR2bWIDNMMLavH+TXby9dnhvJwm0=;
        b=Og6Zopm96YQ4myFyuAbqxxe/psM5SM5KnX2lpoydP7Of4413It5XeJjGAWGjv9xWGT
         MQVvTQe/bJGeyNmCsslVl8rvdgU2SbzDspWW00L/QLcqwX3OGY60UCsUtWBbTmfUoyCO
         ScmAas2NasnAVvahW1eJwh6LkOmTuAqMpvUnvldnlMFwIsSjz1ihJJKAXKwoIov9fxYa
         6Z3C0JduXdXKZx+C6WN/FjR688ruzaBB3uoi3gpaIFOC4DuF6mJk341I1dF4t+w0zWkH
         x8WAqm1eyhsdgFMyFUwaoxKi5t9HCfBivPnh7pKjpKjmBGNQCyLBeMQMxc6JZdSMx/1C
         DsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257909; x=1773862709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKrwQxPh+RV1xNOdR2bWIDNMMLavH+TXby9dnhvJwm0=;
        b=X+0TfVhH+99PeEtO9RdBethHM8/mNS4uu6ZfQW+rdB8U3s/+em1ICtVMyl149aZ9tz
         /6g2CzUFivhQAlzfjxJ8FZmN5Tuk+ZsMqVy36bCIF4nhS75MmDbLOyhEEI2V2mABcqzA
         MfXaXqPbOG9lOtEFWeQ/gUTNSJBFbWLhGf2b/VvKG4h9V1QwRbu2T/7xd6N0SiObqXdI
         KxMGV9IGK+6PRr3xk12LSZBsUzkIF7KdVJk4nORt55YH+7g5rzEhBXEAcmeY1obJYIyM
         6AKMIWOpkQd44s/WVtKmY5YyRy5FeWZZixiVXGVYFOjT9pwri6mi1cGANeIu0NldcJmV
         gjGA==
X-Forwarded-Encrypted: i=1; AJvYcCUGXMKREdKGtS1seCt47toKch/RI2FzG5qgnBMhiwt9N/11rtMd9A3y1gOkrcKNBy/nAHb1VSiHWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUSxGgS4EVfpEbQeOiZ8FetNiD8v2kzwWVzgeWjMvIexzC2iTV
	2u71yfr5jHZ7TrnyIXpizNDvr63m8BsjoIV0OU8xzO9LfL3qk8QS4DrhaOApXBdQWgg=
X-Gm-Gg: ATEYQzxGPye8qFlKxq87upl3y0I00QFoKRFpGx5K6MXrdmzzFufsoPwq1k8ntUqKAOa
	cjxVjQnvOtnP3AuygUeZyVwpWKtb1kEZiQJ4Qljozyb3/rVtjXDf4LaQkFtrWm23pbbsgDwGj0z
	8aSrVatUhanMhu9+DFIrVvruGlj2xOz5tD6CtJHbZkD2qcdHRmXTaYHlHbgJfGHTvO+eJ69h/HU
	FC3tQvC/EtLAC85YesfaU2IHwQCiKao0KjLHptMp8mLjOOet4Hl7ejmWFRWVGw1vLKyYIavhl/O
	4FN0BNhyTSuTjuxWgPstc+ELAGpegAHdR4MXuc3TaKREXFWABrjJJxMpvvuBgyz3yjqju32cTrQ
	rOULxPmro+IEU+wfJaGjLMVT3WpZsP1zyKnTNN19bUsH6oJML6xQ14QhPB9N8AIChpohahKy04c
	gNnEMqNhbYVCFyq/iShb7r6t6wMDSDtifUPXva6ko=
X-Received: by 2002:a05:600c:a114:b0:485:4bd1:4c74 with SMTP id 5b1f17b1804b1-4854bd14ec7mr44737225e9.32.1773257909025;
        Wed, 11 Mar 2026 12:38:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0caccasm58337415e9.6.2026.03.11.12.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:38:28 -0700 (PDT)
Date: Wed, 11 Mar 2026 22:38:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 3/7] pinctrl: Delete PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS
 support
Message-ID: <b58462e99ab76971d94dcaf973bc947c7ddb624f.1773150895.git.dan.carpenter@linaro.org>
References: <cover.1773150895.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1773150895.git.dan.carpenter@linaro.org>

The argument for PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS is supposed to
be expressed in terms of ohms.  But the pinctrl-scmi driver was
implementing it the same as PIN_CONFIG_OUTPUT and writing either a
zero or one to the pin.

The SCMI protocol doesn't have an support configuration type so just
delete this code instead of replacing it.

Cc: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Hi Peng, could you Ack this patch?  I could drop it, since obviously
it doesn't affect my stuff at all but it's the right thing to do.

 drivers/pinctrl/pinctrl-scmi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 5d347e6b2e4c..de8c113bc61d 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -254,9 +254,6 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	case PIN_CONFIG_OUTPUT_ENABLE:
 		*type = SCMI_PIN_OUTPUT_MODE;
 		break;
-	case PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS:
-		*type = SCMI_PIN_OUTPUT_VALUE;
-		break;
 	case PIN_CONFIG_POWER_SOURCE:
 		*type = SCMI_PIN_POWER_SOURCE;
 		break;
-- 
2.51.0

