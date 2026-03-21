Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08BA2E0938
	for <arm-scmi@vger.kernel.org>; Sat, 21 Mar 2026 10:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774088026; cv=none; b=RnOlKk7lcL3Qxn9pIMuyJf4QucBPczzY8//aku67H0oD5395I9BChOYmRD2wQ7fZJEi/Le/kECQsQs4vVdJFaGAgNjpXwdzF4TYlYhWPO9Hnev2grOIaff4hRMgu4joC1kpr/H56d5uuIy9wqoObOK14dfKg5TZ5HYcqoi9Hki4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774088026; c=relaxed/simple;
	bh=kgwtkoVu4mddoqE/ts7AvsOCdb0qDdCgFAlVSNZPAZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ppc7WC/4FGE3W2YNsrWkgs/VeGnV5bCUSo4xiaIdSGqT0YWABnSRo73tEHjE0fmyven94gcQIjwxALMMQrizp4CYp71TW2A8VbfGRe8w96Oo7+x93YYNAQXs2qu6No2qmAlF42WT3B8lWEQVFcroWYd85wlIN5EXqZh9PyJ4hqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uAMsPja2; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uAMsPja2"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439d8df7620so1739651f8f.0
        for <arm-scmi@vger.kernel.org>; Sat, 21 Mar 2026 03:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774088022; x=1774692822; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tQNlAf6vdnJiKr80lkdqTbyIfJO8B2GTTG5cZRsC5qE=;
        b=uAMsPja2xf3K/nXD8oWuXKsENoEhRo/SdTkIaE2NoQtr3EpH3ha7m4MtAxGxHOleNa
         2o3bjx10oHxDl981cMAn+NTWX339foadIhVjhC7wRnGzN0pF1DYT+i1rtiiMf0TfRMbU
         ofLZzBeWt9JgtQ3H3w6RAYJpCQNDOCvyJe2SzI5Zpwi8dnM3/lNnoHLJnBbvZqOyXW6P
         +QG17zdJM8DqUyAvZvH+o9M1xasDTllCx2iFhP0eWhbwML+3YPWhjKE/gpByqLHrcUY9
         goMXja/M7Z1iHb0pCIbIaVXLX/aBnuVPJwPojsUnRw2tDrNqwfqMMFt25Mx+8Rc0L7gv
         3xqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774088022; x=1774692822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tQNlAf6vdnJiKr80lkdqTbyIfJO8B2GTTG5cZRsC5qE=;
        b=j5CBvEJxdkH4SYNvNqkpd5v0LXH2Js4kakqO0aBQk+fPtRK9db7lEgaCZRGtAx412w
         O7jOYHnwOV77+nIn0BhLXxT0LNDLRdsvqYDwBoDuKRfJp9DD5qnnJH7DZa3Ck4fljxfS
         RlmMiwXEV8rX8v7IdgeV/uvTel4z2NZ3UrsG1uhmIoYSdqWrVgDx29Er9dWGQw+9+82R
         JnYtNYelMFYFb1A5bl3U6PkGriLgv8QVBoRYgIyPE+ya/VQ3chfSk8ZU9neNFRC5AbiE
         6HC7pIpwSI/6GbgO8Ibuni9rjv8ilAUNCGwgTBUoJrCMnQCGhWNiNlRucMsaK2VY6glB
         QM5Q==
X-Forwarded-Encrypted: i=1; AJvYcCX3fDlxT7x+L/Jv25EcAB/dUrkhsZIPRCwSL6k/KhWNOlrtkHL9QkGy8uFwxqJM9oG1mMjjvZojHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YytFXsID+ifq281C4T6Vyw1RBOJWy4Ecxs68vWbFmP1dzGk/Y8+
	+tmQqvJ84ml1Y/0BN3kQ8rDqQkzTT7+j1H+xKlaXhi/xEtmKAoCVu6MFuRC91Vcdv7M=
X-Gm-Gg: ATEYQzwJENMP6Kq64et+qJfmVwXRKk+INxZdYVVnVaEVyjQcCmnKAX1m2RfU4+9nF7S
	MSRHr8XncNQFw52hJHDyAAqwDN/k+kHNDwx5rKgu0siAgAqc4fiFxdfQsmz5FUKa7kmpHYILscE
	lEDFDdmd8iP1eSuVDloQ02pz9zLF/2ogkGugjrLCytX9hP0O16mgIXQTirLdG58R/b9ivNkSBeY
	kS3ywRZwSA+6lPm36b3UUCBFuYThn8FrcvNzDKwmmmkZCHI8gDDMXq+c3n7esV8tCqylwFNh6mf
	i8pc1OK8OTntrRAoW94U3WuoXogYjY/Gx7gNLZ3DpmqnHgPyKkY9tivwWdbIeeSKPzuZXPYCNWa
	6nsjgEPU2BDXkeGMd1cNo0ULYYbJMwfoyLhiLww++Rf79zp60RC3AVGLzWSONzN2EraGXhEg90h
	HFEd7PE3qdR0EjG4Ey6E9BOggo+NVik7n5Xw20TsQ=
X-Received: by 2002:a05:6000:420c:b0:43b:460a:b13 with SMTP id ffacd0b85a97d-43b64281506mr9452939f8f.44.1774088022148;
        Sat, 21 Mar 2026 03:13:42 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm13473541f8f.18.2026.03.21.03.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 03:13:41 -0700 (PDT)
Date: Sat, 21 Mar 2026 13:13:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v5 3/7] pinctrl: scmi: Delete
 PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS support
Message-ID: <955306193a128db29f62a4a3261a1d67561834a8.1774087290.git.dan.carpenter@linaro.org>
References: <cover.1774087290.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1774087290.git.dan.carpenter@linaro.org>

The argument for PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS is supposed to
be expressed in terms of ohms.  But the pinctrl-scmi driver was
implementing it the same as PIN_CONFIG_OUTPUT and writing either a
zero or one to the pin.

The SCMI protocol doesn't have an support configuration type so just
delete this code instead of replacing it.

Cc: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
Sorry, Peng Fang, I really thought that if I put CC: Peng Fan in the
patch it would CC you but up to now it hasn't!  I should have noticed
that.

v5: fix subystem prefix
v4: add r-b tags
v3: new patch

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

