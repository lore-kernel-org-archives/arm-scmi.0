Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C6F314B6A
	for <arm-scmi@vger.kernel.org>; Mon, 23 Mar 2026 19:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774292489; cv=none; b=fvuOxeD9MYi0JfJw/l61xTYZvUMTq6SaYhvcm0VGoY4/mWaLV0DSD8oyv2bdUFMYR6B8eOmh+/7+pDqtzDj7wzvkXbJ1v+FpaYnq13Oy0yOAUNbd5omEJoR65PKoNXui5blzdLZhTH/k2FBFvY1qb4VOA2c6RnXPKIXP6KIKGLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774292489; c=relaxed/simple;
	bh=kIkQ3M6MU6ffdc+UMu8eQEns2WLf8THRIkoxJZ1wwWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqhyoyvSD+rnccQVlNogEPqkJPTWi9ark6H7c+Wvv1b4dkdvA+Bha2LW1dXz1SDfpcHed1fdmR56QYGzlJYNgTzLnNKjcoXlyPV0A91ukcRE4wSLTISqUdfWSqWp8ihnZ8DWswDgFzX5acknfIzm9ruqe0Tg4gXoWk3Nn7YTLbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RdWDjuPG; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RdWDjuPG"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439c6fc2910so458688f8f.0
        for <arm-scmi@vger.kernel.org>; Mon, 23 Mar 2026 12:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774292486; x=1774897286; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MHuRsDVkQUUGFXQRrZ4RkpmncGpGmYSyMNCrKIAVWFs=;
        b=RdWDjuPGYWu7xTAdZ0Di3v8bO9qpTJkejEU/ttzbhIxCjB5Bg9jmBZ0Y9UO6kAn5M8
         fzsApKjiehVe8UceOL/7jvfECqlG9NajTDd+vE7NlOysqbIRsUb6NPP6dGDWuZPjdYI0
         9Iz+nXnrv5BfRnqVzBZEvfmUKkrL3B7NntXegxeSnowYrqqagEHIi0ipJPCnrWDDYa3w
         c2f6g467G5BOy7P1TDb+t7TS6ZH5o/6CLPDr7CD+nzB2b6HofYnPkNTgQZe3bYErKLc3
         0tGfGrPFpAotvJ24x+jJULrqJJqSfJz5cgqn58RK3+um1jwrMqJHR4GLhQ/PJfjD5txg
         JlDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774292486; x=1774897286;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MHuRsDVkQUUGFXQRrZ4RkpmncGpGmYSyMNCrKIAVWFs=;
        b=Qhdx85pB7HyB7ZoBK7dQ4n8+rd3FOftEGerbavTramBB6XdKBZ7MdOPygzyQ9Avqif
         XFKa7qZrJqYmCHn8bBVReStWKfC8rmDkWErt1UwZ5S41tVfrVEZ3DhkgKftrq7pJ8Dw/
         1QfzwQifEhB0x+MlZgrbZWQZx64wYKkBRmieCk+GUp++myjyG6pjEfKIbuH9xQ9rEnkT
         EusIiWNYPThD60ob4aEn8++EndBlBxnn6N6pMStUYDVw9BCRombNUBwP2jfp6YT8TLAU
         AxADBOZxyk7YcfadwDCAffUOi0Vda8ietTmuESYILbbnkpOKG/j1/X7p3EZatIjXThb9
         Rpsw==
X-Forwarded-Encrypted: i=1; AJvYcCUJ8y5RiZZK/e57hiTrKGZr4gFvBLhxYe5BI/cVnM+leQNbi0W4REzMYRznrXO7/PG7TWlTi2nw2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNGac2I461lmK80C6Ty35PKPDsr5I3K88oVLUw6z10qfgGau8i
	egpeDwjw4qKj6COYGahE/ey0CVdRGvFD2gRB1Y9br6p2Q08NWlXlbXfoL1NQ0M6VhaI=
X-Gm-Gg: ATEYQzzlvh+yVJXxUYI5dzGkztUtaEwSvYG/vCs9CmpuIFdrlp6lFAQEsMuaBok0kiN
	Xc+L5B8yafQZjZNt4Gx8RaE3H5eyyqJdQxmJOfstjsLcaRRhf99/YDVSTpc19LPCn2IkckhHueW
	vx96xn6odI231kCLW3Kmm99xFbXtdu49I7AkmIpW6popbRVt7aQSV4+9EWyWG2xioWMZTS7hAKj
	VO1muhvqqgdWOwr4g7xoqm/RcFis0e6JlFV1n6bA1CFlsK7IUEutcbonTsWXykzFRLuCCcCwRc3
	q9Lumt7Z6Lq477Rc3fmzwIkypOzlj9a2WV5OP/AmWENdlVTUVTxVAfn3Vmxjrnlfiyy1L3AqIaw
	zgXUandXgjabGKsZUfAQ7NpSuvOmtkAF43C6Uo3OAbCE2lkEQ+/VTSCWpHBmQhfuoFMHDu+VXpK
	pNNRT6QKiA3Jy0e6RVFmqvNv5XnSbj
X-Received: by 2002:a05:600c:5248:b0:485:3a27:a961 with SMTP id 5b1f17b1804b1-486feb5d845mr199608445e9.0.1774292486005;
        Mon, 23 Mar 2026 12:01:26 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64714decsm28604894f8f.31.2026.03.23.12.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:01:25 -0700 (PDT)
Date: Mon, 23 Mar 2026 22:01:22 +0300
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
Subject: [PATCH v6 4/7] pinctrl: scmi: ignore PIN_CONFIG_PERSIST_STATE
Message-ID: <77357ddd5c96622e4be77c0b209206d5a59c9b05.1774283146.git.dan.carpenter@linaro.org>
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
2.53.0

