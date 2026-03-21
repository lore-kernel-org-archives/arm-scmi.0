Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8F22620DE
	for <arm-scmi@vger.kernel.org>; Sat, 21 Mar 2026 10:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774088033; cv=none; b=MxMTlD5VRiyFVp4zWnqUG3mm/ze4vV+D0Ina7dlEP1FTFzZqauxIEjURJ4NQAPIwK75/ARFxZHb90jfK9QjRUCFygL837aght74yzzrDVW8arCoD3puZ0YUvBdN4dy+FSlS+RYbhpVxQG+p49UOvncaaq6NWXe/2KPqV16Ft6xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774088033; c=relaxed/simple;
	bh=9TT6fPPrCVPWyWOTkQtvqNji+N8nh0GAaHIQ5G61F/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dvNeGmAtCC3iHKZmfj8iJIl81lFdDPswFazJFEINOpTuMR8h3li6vRdO1DfnJGCrqUAHztOut8Ldqk5/GjKTqhNbvTRLglopvq1IBN2Bay2Ncgkg5cAMTARTIMniEgNPzgzk9hJLAc8WJBmWyCmOvgtED7wApv85AHnzJ8PoXkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j1xOTkMz; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j1xOTkMz"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439cd6b0aedso1769138f8f.1
        for <arm-scmi@vger.kernel.org>; Sat, 21 Mar 2026 03:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774088031; x=1774692831; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5nvE2qXP7SXrFq3OejPF5HK1aF/+SsVNdOeY2ld3e5k=;
        b=j1xOTkMzdobbHtAYCpJ1yICxLtvfy4yrGWBvdKF5KUhsjwvMQeCrXTrTjM4JXCWJdI
         SEHzXxPR89YsmeP1yBeuR9eLRHkiPVJd2HdG93JAaWv8PE6hCEc877mwEFoDKwJEYpjn
         6arMh81gx9bFxw/wr3V46mMeWdh6cSFcJosDAWjVm1Mr5MaGB2uS0GNTXfx8uNGrrMVl
         zMc+2r3WG8Vt9gI3SLiW0w8S9AKleqTMC14f/8MVpdVQ+b6mWDyXHLhI3xkN9slMKQOE
         VvoYj5x2Jdox2vTq1liHvZ9HxdJVPibb7i46vhZ0ZyyoBck8L1uUKdZZWPd83JG2wdvX
         +pBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774088031; x=1774692831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5nvE2qXP7SXrFq3OejPF5HK1aF/+SsVNdOeY2ld3e5k=;
        b=oi96dgxJaTbqBSdnmbzaWIgvuH4MB1pUqyV7wPXaJn41TRY8M3B+0IQK9P1VNoTH1/
         baG9+tf4G6bXjPgG6j54nRJJ3mGiVJePzan2Bk3G929Xh4ieCE3esBhLf5QoYEUoRS87
         RGAxlTXtLu1CpxJyLCDEkJAuHwooL8m1+AeJTNU6Aqgg91mfAe2/sFG15YU2570r3SG0
         A+6nU5xLnhELewn4IfDJL9QR/zhZ8XgSW4AjNsHwgA2BrAbFEN2nnfGpYE/iV76GthVa
         GjjSUlZG5p6CuO+E6Mg0OiQLS58qS0shTc390vis4lEl3aWI6j9qwgF4my///BaPUa9E
         GkCw==
X-Forwarded-Encrypted: i=1; AJvYcCV2Ehxk3McGCai34UaL16+mFseo69jRTjMUuLYnZhl3XKBBXDsZq0s6siJY/yNBqf9M84/52U0HcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YweW0S0oll/rMwqvMZBqgKEUSHnwH05cV56Cy1Kt1PLCR3IPIY/
	iry0SygMZFLvS49XmwJ5DmHcwSm99nhwXcRlXQO958/EFC9P6OW5kJasiDsk6Anx5RI=
X-Gm-Gg: ATEYQzyAzLy6gTx6cCJNtrNE37qVV3JuMNF4bh9nqAFNrivok8vj16w2X08gmYSL6Dz
	fhswNkPjpnSn9nzWkYJaYfh9H3Of9lrfRAnyrZkVqmvfzuMUPXHfMbEqm6+PH6myga5PS0NsQqB
	so0Dfaai6N39Ed0b04VRyiSi3wlWdLBQwk02lxIFsIvRa33D+fHJerYe/A7+1wPvX3FiUt/aJ2x
	I+38oqFoXb5gpuPmn/8ijh0bWZkv/jv2sBpmNT0DR4sQTboMT0DTXk/MfE8G0/VtmfJ3/nHlEc+
	rkdd/dW2cFTK6lRMCpG+8WiZU4rcoJfPREubmmE5zcneSCQtEiNbUUFounRoBKwcbr3dcgTrlz5
	tZE+oU39j0UPY4IaG5wV1w718nF2sKAULupHk2lobnhk5wI0wdCk3Im7bA7DgFj512YvxehYFje
	iDT7Z+6XiGg8GJdtOiYSj1GyWrq6Q1
X-Received: by 2002:a05:600c:4e8e:b0:483:c35d:3659 with SMTP id 5b1f17b1804b1-486fee04a48mr82485135e9.18.1774088030748;
        Sat, 21 Mar 2026 03:13:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe8159dcsm47760825e9.0.2026.03.21.03.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 03:13:50 -0700 (PDT)
Date: Sat, 21 Mar 2026 13:13:47 +0300
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
Subject: [PATCH v5 4/7] pinctrl: scmi: ignore PIN_CONFIG_PERSIST_STATE
Message-ID: <6087ce1233834f554de6f1941ff5bc85ffa059a0.1774087290.git.dan.carpenter@linaro.org>
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

The PIN_CONFIG_PERSIST_STATE setting ensures that the pin state persists
across a sleep or controller reset.  The SCMI spec does not have an
equivalent command to this so just ignore it.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
v5: fix subsystem prefix
v4: Add r-b tags
v3: No change

 drivers/pinctrl/pinctrl-scmi.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index de8c113bc61d..f22be6b7b82a 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -361,7 +361,7 @@ static int pinctrl_scmi_pinconf_set(struct pinctrl_dev *pctldev,
 				    unsigned long *configs,
 				    unsigned int num_configs)
 {
-	int i, ret;
+	int i, cnt, ret;
 	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
 	enum scmi_pinctrl_conf_type config_type[SCMI_NUM_CONFIGS];
 	u32 config_value[SCMI_NUM_CONFIGS];
@@ -377,17 +377,21 @@ static int pinctrl_scmi_pinconf_set(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
+	cnt = 0;
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
-		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[i]);
+		if (param == PIN_CONFIG_PERSIST_STATE)
+			continue;
+		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[cnt]);
 		if (ret) {
 			dev_err(pmx->dev, "Error map pinconf_type %d\n", ret);
 			goto free_config;
 		}
-		p_config_value[i] = pinconf_to_config_argument(configs[i]);
+		p_config_value[cnt] = pinconf_to_config_argument(configs[i]);
+		cnt++;
 	}
 
-	ret = pinctrl_ops->settings_conf(pmx->ph, pin, PIN_TYPE, num_configs,
+	ret = pinctrl_ops->settings_conf(pmx->ph, pin, PIN_TYPE, cnt,
 					 p_config_type,  p_config_value);
 	if (ret)
 		dev_err(pmx->dev, "Error parsing config %d\n", ret);
-- 
2.51.0

