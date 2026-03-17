Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D19C3EAC80
	for <arm-scmi@vger.kernel.org>; Tue, 17 Mar 2026 14:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758439; cv=none; b=S0BVQKWP9ID70NwfknQ3cCuw0sMXVF+gLf/oFrbGKy2xPXXQYF0imXDOjVtdSUKUcPQwjryQCQ/vC7gAlCRyzVBwjkkBKNPw7oLIiVmAieFjhUjlIYHaYNE4e8Vbx6/2FHYqHyPpyNHm4mGDcxreJk9WpyEv4s23kR9NgfYSf2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758439; c=relaxed/simple;
	bh=wXUzWXlRbBZUPgZcoRqS5huDsicTqOqFAogLNwSvvhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CZ9RJO665wREO1os1rtnZx5rUdWOqvVN+qepwhvl+R9HxqFa1SaNCZ6Iy2u7v8v+f6cUalY5gsCQI6+3kN+B8vqRHI2THeIc98coNJ/0bDuKqCfs0VXh6yhmdJ8eSglFH9+97SjoiegawxFereSah4dCr4iXUuho/mMgQwtBdTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e19XOqVw; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e19XOqVw"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b976536806cso754143466b.0
        for <arm-scmi@vger.kernel.org>; Tue, 17 Mar 2026 07:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773758436; x=1774363236; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+cvkfko3JSBcZ3yQGwkpneUFUeWMGASvUnUssQJCU9k=;
        b=e19XOqVw+cprKauxiU1yE09d5cZ30f8f3FxNgC15dx79Ooo0yFkly+HNgLRk4ou4W3
         HPUR9J52ctQ4bpCWhAd2nGF8vAYPcIlXAdtRQGQx6volkqhmCSm8lmTdpZN1IeH2VSJy
         Z7wVBHM9KofYkzwE3oHus1yC2PmBNGrvnNeBh+EpA5rMCnPAVZfr9XAVj9ZEOsbfgPEC
         J9OYr71GB1oBsOTKQziqEdaBOlPlgS+9miE8WFes1qJCcuB0zybBHsGVSXSbIpp2k0ku
         Y4miW08JxnmFJa/RGlpWEnE4aWDscFT0bFUXlIrUuFGXYXvZ2knXLkVZwqSjyXofUPne
         1TNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773758436; x=1774363236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+cvkfko3JSBcZ3yQGwkpneUFUeWMGASvUnUssQJCU9k=;
        b=bWXMQI7+fEd/sixhxNsMvZ2+xWZX1QYUvPZRtMCCU8+yN+qksG5eHSjihyWQy27kS0
         NRE6CxjDsLCCCoi4D+nhW4FkxSmVcGUufvLqQp8Pd8yiojTWVUHOjTVqpYL1wlxF+EBA
         uQ0CZyIIAiqOj5l7CvZvZZJ16y5mTBVKSBGuh7b+6nUFnscxJuMnoKdumhLTEyF2uI/A
         mOUWYEiMh8jBz3U5HM6gKS8DoonSB2en5q6kvP0S4dIPR78SVV1HUzl+RpaDn95OQ5Wx
         oqoGIiDMoslU91rlGjsGtdGjM69mukN90eVb4MMILvw8/NmrkBuezw3zAzAuOthRMxj/
         Q3sw==
X-Forwarded-Encrypted: i=1; AJvYcCWn3zR8XAH1qOPZDej4siaS66LxX8WBOOJSAjJtJybLibpjU5pK1bmrbKlTYG/11GrjJ/NJQUlxfw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+fQHKBkeDvVjIQLp539XJxXo6Ae0QXdFx4KfnspHx3WUzVRws
	pYmAcP+pr0jSI/Dy1/YbZiZaUH1ktzpeMEMu6ST5lR27fGSAnz5MBHRqJRf6CZ1+zzE=
X-Gm-Gg: ATEYQzzwAb/7bq/NMtC6frDyj5zO5Wc3Nc6+3tjh/GYzKBKf2MCvjg3o49NtuSHP0OR
	qKZvCX0yXCFqj+PCN8v5nLHTVXi83No57QFUp8hi5TgzLzuyIKN0VCn+d2lllQ5Jth0dKIpLVqn
	espcQdYD1VzeK1+avMMfd2aYcvhq4Jk8QQtk9Pe2MLzo9ynJZlMIAE42pjuy3FRP1uZDvFxj8WR
	GT6D2/s47tH8GjqAbnae3lAWlIa7q0VxVQ8aA7n63PHbs41kPUUghTOLhAxxzNRZOwD0Ct6bnV8
	8G6Elq5L5TGcM+kzp6BxIip0MQBnIMDFTRSI3qy6ony5+UZDMEUe0v/mhqIvmgq/3bZp6H1ao5I
	daCLboZVguyFoEmgjz0Q6abqOsKFaGNgPkbjJWVobasniGSpI5bqr+bkdlDv31EKivvYfGv4Wt1
	XwBikRL/hzGMepeikTppHtdn6U9vyB
X-Received: by 2002:a17:906:7316:b0:b97:ca81:e89a with SMTP id a640c23a62f3a-b97ca81f487mr416217366b.0.1773758435746;
        Tue, 17 Mar 2026 07:40:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97b7ce8587sm401567966b.26.2026.03.17.07.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:40:35 -0700 (PDT)
Date: Tue, 17 Mar 2026 17:40:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@kernel.org>,
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
Subject: [PATCH v4 3/7] pinctrl: Delete PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS
 support
Message-ID: <2142deabc8183595c582fa44dcca6b5bfafebaaf.1773757772.git.dan.carpenter@linaro.org>
References: <cover.1773757772.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1773757772.git.dan.carpenter@linaro.org>

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

