Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A25818BC3D
	for <arm-scmi@vger.kernel.org>; Mon, 23 Mar 2026 19:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774292498; cv=none; b=nYsyVK0qggvqmz5hclIgVmFtrvQ0SVcDR7M+NzufVgn2OsgXm50yyh3YYy6MAmC1zveWaA5SnrdG9SUJ+/4Ym0/8OO3B0cKPUGo0keeRBmFItVXH3Sx+XLlOO+WeSH1tLAdRlr9aFwZQ4rfA3Z+cEKt2yc+MxVW4+sj8cf3NTAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774292498; c=relaxed/simple;
	bh=jCF+eLwlD7MQ3lst0osm4ZMLlYmOygIY+kAEfdT6yWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t3CY4vLEmKMIayxop2ZmkvtuqdmS3EAVWYf2SvUoMvQzP/lt1IGK9BTb3BybVIIIGaIM5xJdyLZ1grvF5U3lM57bTfOIrrUTZKuQis1Njd3cVcQj+LEogDfZ1u1Dl9CRRMYLCATqx+3x8AnmI62w+JjxL1mfF330Jz1Gz7gwkrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QrwhrYv/; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QrwhrYv/"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-483487335c2so35735125e9.2
        for <arm-scmi@vger.kernel.org>; Mon, 23 Mar 2026 12:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774292496; x=1774897296; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8mX/GcwoKo6bWMEhcm0gaJZhmtfjF5BKuCj21CKeODo=;
        b=QrwhrYv/AiZUW4cgVLrFKBOVuIr8yilP2bWIRJCZdfGgG+MqU81TEbYDEH4xkoKt8q
         wgrBlO02TSTv1WTiuHghqBGWgh3iU6GrLVNMp92rXN9XXet5PWcH5PpbC+g5TSG5b7il
         aPHmkfB37jRoUGzNgMggH4R1Sv5a+jYwa5gXb0XbDmHtcT6Nyswah2CtNBzxSMajoxYQ
         uoNsKxO+HBnMEZB9TbgGl3RzqhhUc/Jy1JqeTZ78N3ZGylz8ylq4YUVyKagiwj1Eey1O
         2d8BFJxo/xnvUjD0pfyNNr6JlcFdf3iTCfpV92i+RncgfTJJdb7Zn0bDp6pd93BciefM
         MTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774292496; x=1774897296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8mX/GcwoKo6bWMEhcm0gaJZhmtfjF5BKuCj21CKeODo=;
        b=FuR3w7ZTfVhwkI7aA8ISli5wiBLLmgNCcGvmdKQKtMF1yYcL1h1M7pXnlvQg4jq1As
         AEeUYWI0XB1e0+2XfHWFAvRw/NO1nzYpO2BExQnGDuLysLSTpAS5x32rmsRIY7piNFYD
         85Vlq6aC7XrwW26AoXcIJLm6mFUsksl6lQL9AZvhZouLI0pjfhLZ7olaMNlMpB0or4xN
         nGv4axTEEb1g7oMRcvsll1LgUIMxkcDrissFj7k9azfkVIa4WdL/z+ejDAFj6kwck5rK
         pKNzHY3/yoccPXmCMXcy4DBuD2P3UMFTdBGYwrdkidRCQ/JC9NuY3B0KSnk69k+Xx6vX
         HDAA==
X-Forwarded-Encrypted: i=1; AJvYcCU5ckUecBwSxxIlJAwBzssJzLqW+P/U4TMEl3Meq7to3n2959lcA+pNgdg8mOtOMKTDArOpvf+mew==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMTNgHH2xZ2nLc+4/8Ef8CoZ10c/dQ1H7w2U+d4NR4uTjovNv2
	TuqSvfkg1L0f/a2azdXKz7H2eP6ryZlD1D+b9LH4B23BDlV3OrlO70pUhspX1DskPX8=
X-Gm-Gg: ATEYQzzufz/ALjTVOZcJk+fd+As5+gr1aQwde8c0uBMTZ69Sa5NW/5BBYXlVTDLkk9W
	WktSsS4XcnpyyRSQK3NINypiM2dMGU2QwNK7Eqp3qkz2WRL/b9akFool0KgUfKzlWRRxVMvckmm
	VZXzJRiM1jvw/w9tBebAJO3rTrTqVZe9kZQ0LcSSPhVin9jp6ey3Lepi7avtUWMlmPp1tk3FaK2
	8VJdGoUjkR3+MViOCbX74fyjs2RyY0+NsE73Rbt1I9upq3xk2+uU661hj5lULivrMQ4/B9EWJn8
	/U9YjlQ5Qtb5wnEJMJaRjoLxwWWtOJgv7v0tWjPrp9SU5dxrlSlkEOD1OuwOmoQYC47x2U8LYiu
	V8n+chnsdAfDB7GUhhCnb2QB6lozrae12rFIQWXxSLD8DcvpzmrxIPA3KS2AA1O9cVliD/ccfaf
	cTfz08atUG1eu/K8CDmGsu9sYUL1mI
X-Received: by 2002:a05:600c:3514:b0:485:3d3e:1675 with SMTP id 5b1f17b1804b1-486fedb5624mr182256275e9.8.1774292495555;
        Mon, 23 Mar 2026 12:01:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f80b6a3sm1441505e9.21.2026.03.23.12.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:01:35 -0700 (PDT)
Date: Mon, 23 Mar 2026 22:01:32 +0300
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
	Michal Simek <michal.simek@amd.com>, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v6 3/7] pinctrl: scmi: Delete
 PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS support
Message-ID: <48bee15dbf615c0c9a76ee4313bed7c06a07f143.1774283146.git.dan.carpenter@linaro.org>
References: <cover.1774283146.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: arm-scmi@vger.kernel.org
List-Id: <arm-scmi.vger.kernel.org>
List-Subscribe: <mailto:arm-scmi+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:arm-scmi+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1774283146.git.dan.carpenter@linaro.org>

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
2.53.0

