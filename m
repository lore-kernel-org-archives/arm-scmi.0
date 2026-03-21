Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77BD2620DE
	for <arm-scmi@vger.kernel.org>; Sat, 21 Mar 2026 10:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774088038; cv=none; b=Z+bwuBricAodq6GdcEEaqAOLSRk1aWjHYHdiWRZKg+75kv/YtNpOJ4+NJbwwZsnlUd6lFrFxiGCcicbq+pj0TUA/nPUrvNLTd4Qi0tPsKx+dm6xnseXCQKsdc67yeHQK5WTNtXcAmovKwL2X10AS4AX3i9jyivaTuDlhCoA2/3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774088038; c=relaxed/simple;
	bh=3wfx7eM8ipMNZPFdJ2mLCQZdHaH/tw9KlE7kv5yt5JA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ao2kAzrzlcILpz6iDnoaJbawqDlXkVxRWFuwCNA3bPUVxebqUnhVobHsFPsqBAOYpwSX5O6b2sgEX2n0oaQ+HoykaaaKI0VpMfjTuXPsqkHnlI51exy9XNirNMhxqYHMd5LY8EVF16EeB8ef3eEkKuXzvXJ3T45N89mX2c8BjTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cBjHPibn; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cBjHPibn"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486fd27754bso18285775e9.3
        for <arm-scmi@vger.kernel.org>; Sat, 21 Mar 2026 03:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774088035; x=1774692835; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BHDWTBbKB3qdUDZBmFuIiqFXJQpeVZ0CqRE3ngdwtZw=;
        b=cBjHPibn53eUy/fqhYtBVjufcdubC0yrmL+DI1H+3ruhRfwHkQy1ghIY3p0RU7YGcW
         iVDVWEY7bf78YG/XiWgwvsi6ilHPsiMnKMCP+7cADX6Lq/ElUbF91Gfx7zOdcvVOS8WC
         YJaeq76sL3N9jLn1NwimXfJvNYTMqlXTzqFBEuEozjVgqJdOF2Pbf0u+iOU4kJlT2GY3
         /LJPHV4xJfBaxB47aWUi9qKtkmFWefvvWEfGJiaEdtclC739RMeWXCrSFq3AnUeevHhE
         DMlJHkRfZqBEmkG7QwhWSOUdsaA4QML3VN8Z+3y39I2OC4tdiqzMTX3ZonJoICbynD9C
         lQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774088035; x=1774692835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHDWTBbKB3qdUDZBmFuIiqFXJQpeVZ0CqRE3ngdwtZw=;
        b=ELUjks2wwdDEKrUVjKvh/j/RrUFypMc/SBz/bctWBuOQ7ZX3LuMMtDplGQC1NuBShu
         qJajjL8JrxDnAHM7oEs9//aFjMokuWUduhlN/bz3/dzocS8HKuLRx//XjSBRlULKsCls
         sSs9X8e2iEW1Nt9x0cSv81+Bk674BuxEz0eClEwyNPkgkCw5nG8y2KdK4XvijpxPVKyl
         4Uz0skUUWCPViCZ/gzp1rITun+VFvImjvEmrJEPmu5wySmNVVuMGhEv0iuHoT1vK6/ry
         zwBg9tF+U3YSMGiRXtxBDXL+v9DmZsBPsjJyXVuzpXdaj0Xw373+kamlvlS6UV1R0v+3
         9mmg==
X-Forwarded-Encrypted: i=1; AJvYcCWiXlt+f374i9+Yrm3MzVu4BqEiJFVO+8ymAXkgzkoDZf3M4ay+LBJbrtnLBOUXKdBCwOjwXayEKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHyCqstVvMYdqFvst7HDXTsARct7ZteHcjLdCyfhB4n0XmWNEV
	dfVEXE3pRmHFssgYXY7lxpwViDSkAXiBQ8fLFsxBuH7F2Fyfr2EVg0TfywxE8ip8LpU=
X-Gm-Gg: ATEYQzxIaEyQNFtHdWkqWk0OIdjdrefy6XhFBKpKW6UfZ2lp4L9d/eGJPxkcrKrw6zq
	eLkAu0Gd7Q5DvioShHLxcZjkXJhlDjqIeNbv/lexAASkgiizODyJsMI5tTDySftO3UYJYQcuv8F
	M9HB1D3yDnuIem35fXQLIUt5AUAgfZAVR8TWBQZAhj9swBiP1L0Kpv1mRIBpFbRoNF9PAZImhTd
	20PDEQbx2IC0P39GvbHeY+uXf2aP2dK3Xoanbww6CB6UWeF/4YAruUqKWkdrkf9GqxOHRZayr+w
	vZeWnJQXwL6UKhVNow7wkDg2y85X3ECLKIYGssBUbhqOrvBtRDhlQGaamDhYzlObXeeGHNKPWFs
	om7GZNJowdXl2vaf8iy2Hd5wVaVX5kHBklyEwCfo+mTuWCj9t+oqJSebJsrAE96MjBNxLOdMaSf
	ljMb9QIr3L73jXIRORoQnsYJwZqF51
X-Received: by 2002:a05:600c:524e:b0:486:f634:ef3 with SMTP id 5b1f17b1804b1-486ff01efcdmr83170465e9.32.1774088035226;
        Sat, 21 Mar 2026 03:13:55 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48704f14441sm8311465e9.9.2026.03.21.03.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 03:13:54 -0700 (PDT)
Date: Sat, 21 Mar 2026 13:13:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v5 5/7] firmware: arm_scmi: Allow PINCTRL_REQUEST to return
 EOPNOTSUPP
Message-ID: <96965696f3df12a7e64ee78191a727f7707cf96e.1774087290.git.dan.carpenter@linaro.org>
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

The SCMI protocol specification says that the PINCTRL_REQUEST and
PINCTRL_RELEASE commands are optional.  So if the SCMI server returns
-EOPNOTSUPP, then treat that as success and continue.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
---
v5: fix subsytem prefix
v4: add r-b tags
v3: new patch

 drivers/firmware/arm_scmi/pinctrl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index a020e23d7c49..42cb1aef1fe1 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -578,6 +578,8 @@ static int scmi_pinctrl_request_free(const struct scmi_protocol_handle *ph,
 	tx->flags = cpu_to_le32(type);
 
 	ret = ph->xops->do_xfer(ph, t);
+	if (ret == -EOPNOTSUPP)
+		ret = 0;
 	ph->xops->xfer_put(ph, t);
 
 	return ret;
-- 
2.51.0

