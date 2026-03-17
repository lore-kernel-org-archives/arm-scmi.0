Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEC93EB7F5
	for <arm-scmi@vger.kernel.org>; Tue, 17 Mar 2026 14:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758444; cv=none; b=DSKLSNDfQ/E50K1ygySNCkxQ4eqqjeYrz7GXFRd8nnjppq4dKvzOFf/AmSKwYP59OBeaKZ5LWbUnI25mQiVDVmPk6SPywGpl4D83GIO6KayGUc0HU9rwJm2lQptJlOTnP5CrpHXZftC53sMk2r0du4fgqo1SRRyQWmH87l22V8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758444; c=relaxed/simple;
	bh=7a5a3v3MgqZ/GA74qUzH3PzhixRY+vEg+ccw7hFyePg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YajMDzfvQJ2Yql37OuvUgFkkdb9e6uWaggpaKkdBAVJTR18RmK04KnW3E34eQgioLygill6szN537PFQJIPsKGMKJ0pm6osyto0e/xt4fuIVQn0qpEZqmR7h9qtkSg/dOTIFddQNVMkpA5Lj3kuHdU3KtS+oLHeVXuqiS9oyPU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nqESYGcX; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nqESYGcX"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b9358dd7f79so960628266b.1
        for <arm-scmi@vger.kernel.org>; Tue, 17 Mar 2026 07:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773758441; x=1774363241; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QqAW8Lz8UGhU0wvIEqMX1J/fowDMs++jiY4h3lV2FoI=;
        b=nqESYGcXKEVMHd0PI5WBSUwfuwC3y+2a+EhDctk8yAYwXNl3OT6Mj7+QOWup3+FPD+
         mHU8/aaYze4b7aERYf9YN4viZ2J1y5/hX7fJAcrrZjFk2oa7O86pHfE/p78c67dc46eo
         dpYT+ZhJuHQRfspT6FImZbXj7mHqJZ8L0DcC2zjV65/cHVY0Tm+fogz5BkAfWPaeVCGk
         YhPvZohQ5YD8o11jFgv1w2hNDi6ZJvD5OzqKvOKUoyXXuxnnVpMva0DG809F//v2Sy9D
         FhXzymO7FqAyh88D83iEFIG4iQ+78AxwhepXrBntENcZYMeyXoB9ACPmnhbik8nb5+i0
         QT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773758441; x=1774363241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QqAW8Lz8UGhU0wvIEqMX1J/fowDMs++jiY4h3lV2FoI=;
        b=dC5P9omnpDoxnPF0fxH0PPJOl8IwGI3dMpTGXwqvD/bLY8pBa8BM7fO1jef7+yZypy
         doQGmE3be3EWDPbdmLRZrfnbr7pHQ2Shc74zm6mcZ5PdCLKwDK8UigGtZ1QBWVCm75bk
         cRLd/WowEJwaMfy1nTy+Sz8xJWpjJ8w3/lbzhida1bsEQA+o+EXA1BdBqCfeDZ+Ftm4C
         1/gQ2MlGkFFs/YrbL8deiqQr2+AuIGM/idKpn9OczRGweuYH8zPeIkB3Bf6aTgD7nSbT
         RrpXuYNZ50hz3Qok9g5Y2yAbg3UP2wpuiYVU8QInjNfMj6iT8xN3D7FmwefR31km6qQR
         3i9A==
X-Forwarded-Encrypted: i=1; AJvYcCUpfwqPPQL4jnC3qk/7xe/Bx6rm3ItReNhZvBZvlIdHe4ZMiy55EF7qqtg2aaBBBz3EUYRKzFw5Wg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwC7+AujpoaN7ZC0Fd8U1VFgrP4wk4DwFh8DJbV7hRbC2GU2Sn6
	QF8K1daHzInmb2QIqXRG9NFTHIlbNGIVKsiD9Hf1gUaAchg/wN/aEIaNj17/WP0XcaQ=
X-Gm-Gg: ATEYQzxfwRnz2UNsRtfbHKuERsgJU8T2A1LOsRFx4zoqXfoSo3NiVCvGWyK6lvnbXmc
	CW0eiZh+KnwPMxcQzaWDezGBlKtIGHhPT20VuG2v/P2ZELvSUwvrmwKdom0WAFqzbU6pn52RPrp
	NkkRep12mmKxTM3PqQhF4UKce6cqDyVS/WXstt1iil59k6JYQRt2rGMe7HgL8UQ9eKcpNfUITL8
	UovdQkJFxQ6mlQOsK7JYpmijCGIdHvVKF7cLRf6Ewn/auuAZQnZ93enNzGyTtu1p8nSsjMaV5oN
	ADOgq77/O6cqCuZ77F2gBVTrKVFRw/ZT8mGx3QaWWwzMVeSmK9bT34AfcXza1Rx7pgpvBXFD7/0
	TLjzx2toI2FWyXeJa03n+a31ZSuZTSojvRh5WKWWz+y8vZbYDvNtdPfmw49K0HGEQe4GWlczh2Q
	fX08Mt+/4zSta4pdwn38BReN+YGSky
X-Received: by 2002:a17:907:84d:b0:b97:7966:cb1d with SMTP id a640c23a62f3a-b977966d1b9mr848405066b.18.1773758441127;
        Tue, 17 Mar 2026 07:40:41 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cc220basm753466566b.28.2026.03.17.07.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:40:40 -0700 (PDT)
Date: Tue, 17 Mar 2026 17:40:38 +0300
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
Subject: [PATCH v4 4/7] pinctrl-scmi: ignore PIN_CONFIG_PERSIST_STATE
Message-ID: <10c43dfe5f72eedb259db533004acddd5579e168.1773757772.git.dan.carpenter@linaro.org>
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

The PIN_CONFIG_PERSIST_STATE setting ensures that the pin state persists
across a sleep or controller reset.  The SCMI spec does not have an
equivalent command to this so just ignore it.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
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

